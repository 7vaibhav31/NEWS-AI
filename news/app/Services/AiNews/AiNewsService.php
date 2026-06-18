<?php

namespace App\Services\AiNews;

use App\Models\AiNewsLog;
use App\Models\AiNewsSetting;
use App\Models\Category;
use App\Models\Language;
use App\Models\News;
use App\Models\Tag;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use Throwable;

class AiNewsService
{
    protected AiNewsSetting $settings;

    public function __construct(?AiNewsSetting $settings = null)
    {
        $this->settings = $settings ?: AiNewsSetting::config();
    }

    /**
     * Run one generation batch. Returns a summary array.
     */
    public function runBatch(): array
    {
        $created = 0;
        $failed = 0;
        $items = $this->collectSources();

        if (empty($items)) {
            $this->log(null, null, 'skipped', 'No source topics / RSS items available to generate from.');
            return ['created' => 0, 'failed' => 0, 'message' => 'No sources configured.'];
        }

        $provider = AiProviderFactory::make($this->settings);

        foreach ($items as $seed) {
            try {
                $article = $this->generateArticle($provider, $seed);
                $newsId = $this->saveNews($article);
                $this->log($newsId, $article['title'], 'success', 'Generated via ' . $provider->name());
                $created++;
            } catch (Throwable $e) {
                Log::error('[AiNews] ' . $e->getMessage());
                $this->log(null, is_array($seed) ? ($seed['title'] ?? null) : $seed, 'failed', $e->getMessage());
                $failed++;
            }
        }

        $this->settings->update(['last_run_at' => now()]);

        return [
            'created' => $created,
            'failed' => $failed,
            'message' => "Generated {$created} article(s), {$failed} failed.",
        ];
    }

    /**
     * Build the list of seeds for this run (topics or RSS items), capped at per_run_count.
     */
    protected function collectSources(): array
    {
        $limit = max(1, (int) $this->settings->per_run_count);

        if ($this->settings->source_mode === 'rss') {
            return array_slice($this->fetchRssItems(), 0, $limit);
        }

        $topics = collect(preg_split('/\r\n|\r|\n/', (string) $this->settings->topics))
            ->map(fn ($t) => trim($t))
            ->filter()
            ->values()
            ->all();

        // Rotate topics so each run does not always pick the same first N.
        shuffle($topics);

        return array_slice($topics, 0, $limit);
    }

    /**
     * Fetch and flatten RSS items from all configured feeds.
     */
    protected function fetchRssItems(): array
    {
        $urls = collect(preg_split('/\r\n|\r|\n/', (string) $this->settings->rss_urls))
            ->map(fn ($u) => trim($u))->filter()->all();

        $items = [];
        foreach ($urls as $url) {
            try {
                $body = Http::timeout(30)->get($url)->body();
                $xml = @simplexml_load_string($body);
                if (!$xml) {
                    continue;
                }
                $nodes = $xml->channel->item ?? $xml->entry ?? [];
                foreach ($nodes as $node) {
                    $title = trim((string) ($node->title ?? ''));
                    $summary = trim(strip_tags((string) ($node->description ?? $node->summary ?? '')));
                    if ($title === '') {
                        continue;
                    }
                    // Skip headlines we have already turned into articles recently.
                    if (AiNewsLog::where('title', $title)->where('status', 'success')->exists()) {
                        continue;
                    }
                    $items[] = ['title' => $title, 'summary' => $summary];
                }
            } catch (Throwable $e) {
                Log::warning('[AiNews] RSS fetch failed for ' . $url . ': ' . $e->getMessage());
            }
        }

        return $items;
    }

    /**
     * Ask the model for one article and return a normalized array.
     *
     * @param  string|array  $seed
     */
    protected function generateArticle($provider, $seed): array
    {
        $language = $this->resolveLanguageName();
        $isRss = is_array($seed);
        $topic = $isRss ? $seed['title'] : (string) $seed;
        $context = $isRss && !empty($seed['summary']) ? $seed['summary'] : '';

        $system = trim(
            "You are a professional news editor writing original articles in {$language}. "
            . ($this->settings->tone ?: 'Neutral, factual, journalistic style.')
            . " Write ORIGINAL prose. Do NOT copy any provided source text verbatim; rewrite in your own words. "
            . "Do not invent quotes or fake statistics. Target {$this->settings->min_words}-{$this->settings->max_words} words. "
            . "Return ONLY valid minified JSON, no markdown, no commentary."
        );

        $sourceLine = $context !== ''
            ? "Reference headline: \"{$topic}\". Reference summary (rewrite, do not copy): \"{$context}\"."
            : "Write a fresh news article about: \"{$topic}\".";

        $user = $sourceLine . "\n\nReturn JSON with exactly these keys: "
            . '{"title": string, "description": string (clean HTML using <p>, <h2>, <ul><li> only), '
            . '"meta_title": string (<=60 chars), "meta_description": string (<=160 chars), '
            . '"meta_keywords": string[] (5-8 items), "tags": string[] (2-4 items), '
            . '"image_prompt": string (a short description of the scene to generate an image for this article, without using words like "photorealistic" or "HQ")}';

        $raw = $provider->complete($system, $user);
        $data = $this->parseJson($raw);

        if (empty($data['title']) || empty($data['description'])) {
            throw new \RuntimeException('Model response missing title/description.');
        }

        return [
            'title' => trim($data['title']),
            'description' => $this->sanitizeHtml($data['description']),
            'meta_title' => trim($data['meta_title'] ?? $data['title']),
            'meta_description' => trim($data['meta_description'] ?? ''),
            'meta_keywords' => $this->asList($data['meta_keywords'] ?? []),
            'tags' => $this->asList($data['tags'] ?? []),
            'image_prompt' => trim($data['image_prompt'] ?? ''),
        ];
    }

    /**
     * Persist the article into tbl_news exactly like the native News form does.
     */
    protected function saveNews(array $article): int
    {
        $languageId = (int) ($this->settings->default_language_id ?: $this->fallbackLanguageId());
        $categoryId = (int) $this->settings->default_category_id;

        $news = new News();
        $news->language_id = $languageId;
        $news->category_id = $categoryId;
        $news->subcategory_id = 0;
        $news->tag_id = $this->resolveTagIds($article['tags'], $languageId);
        $news->location_id = 0;
        $news->title = $article['title'];
        $news->slug = $this->uniqueSlug($article['title']);
        $news->image = '';
        $news->date = date('Y-m-d H:i:s');
        $news->published_date = date('Y-m-d');
        $news->content_type = 'default';
        $news->content_value = '';
        $news->description = $article['description'];
        $news->user_id = 0;
        $news->admin_id = 0;
        $news->show_till = '0000-00-00';
        $news->status = $this->settings->auto_publish ? 1 : 0;
        $news->is_clone = 0;
        $news->counter = 0;
        $news->meta_title = $article['meta_title'];
        $news->meta_description = $article['meta_description'];
        $news->meta_keyword = implode(',', $article['meta_keywords']);
        $news->schema_markup = '';
        $news->save();

        if ($this->settings->enable_image_generation && !empty($article['image_prompt'])) {
            try {
                $imageFilename = $this->generateAndSaveImage((int) $news->id, $article['image_prompt']);
                if ($imageFilename) {
                    $news->image = $imageFilename;
                    $news->save();
                }
            } catch (Throwable $e) {
                Log::warning('[AiNews] Image generation failed for article ' . $news->id . ': ' . $e->getMessage());
            }
        }

        return (int) $news->id;
    }

    // ---------------------------------------------------------------- helpers

    protected function resolveLanguageName(): string
    {
        $id = (int) ($this->settings->default_language_id ?: $this->fallbackLanguageId());
        $lang = Language::find($id);
        return $lang->language ?? 'English';
    }

    protected function fallbackLanguageId(): int
    {
        $lang = Language::query()->orderBy('id')->first();
        return $lang->id ?? 1;
    }

    /**
     * Find-or-create each tag for the language, return a comma-joined id string.
     */
    protected function resolveTagIds(array $tags, int $languageId): string
    {
        $ids = [];
        foreach ($tags as $name) {
            $name = trim($name);
            if ($name === '') {
                continue;
            }
            try {
                $tag = Tag::firstOrCreate(
                    ['language_id' => $languageId, 'tag_name' => $name],
                    ['slug' => $this->uniqueTagSlug($name)]
                );
                $ids[] = $tag->id;
            } catch (Throwable $e) {
                // If the tags table differs, skip silently rather than failing the article.
            }
        }
        return implode(',', $ids);
    }

    protected function uniqueSlug(string $title): string
    {
        $base = customSlug($title);
        $slug = $base;
        $i = 1;
        while (News::where('slug', $slug)->exists()) {
            $slug = $base . '-' . (++$i);
        }
        return $slug;
    }

    protected function uniqueTagSlug(string $name): string
    {
        $base = customSlug($name);
        $slug = $base;
        $i = 1;
        while (Tag::where('slug', $slug)->exists()) {
            $slug = $base . '-' . (++$i);
        }
        return $slug;
    }

    protected function parseJson(string $raw): array
    {
        $raw = trim($raw);
        // Strip ```json ... ``` fences if the model added them.
        $raw = preg_replace('/^```(?:json)?|```$/m', '', $raw);
        $raw = trim($raw);

        $data = json_decode($raw, true);
        if (is_array($data)) {
            return $data;
        }

        // Fallback: grab the first {...} block.
        if (preg_match('/\{.*\}/s', $raw, $m)) {
            $data = json_decode($m[0], true);
            if (is_array($data)) {
                return $data;
            }
        }

        throw new \RuntimeException('Could not parse model JSON output.');
    }

    protected function asList($value): array
    {
        if (is_array($value)) {
            return array_values(array_filter(array_map('trim', $value)));
        }
        if (is_string($value) && $value !== '') {
            return array_values(array_filter(array_map('trim', explode(',', $value))));
        }
        return [];
    }

    /**
     * Keep only a safe subset of tags. Prevents script/style injection from the model.
     */
    protected function sanitizeHtml(string $html): string
    {
        $allowed = '<p><br><strong><em><b><i><ul><ol><li><h2><h3><blockquote><a>';
        $clean = strip_tags($html, $allowed);
        // Drop any inline event handlers / javascript: URIs.
        $clean = preg_replace('/\son\w+="[^"]*"/i', '', $clean);
        $clean = preg_replace('/javascript:/i', '', $clean);
        return trim($clean);
    }

    protected function log(?int $newsId, ?string $title, string $status, string $message): void
    {
        AiNewsLog::create([
            'news_id' => $newsId,
            'title' => $title ? mb_substr($title, 0, 250) : null,
            'provider' => $this->settings->provider,
            'status' => $status,
            'message' => mb_substr($message, 0, 1000),
            'source_mode' => $this->settings->source_mode,
        ]);
    }

    /**
     * Call the image generation API (DALL-E), download it, and save it to public storage.
     */
    protected function generateAndSaveImage(int $newsId, string $prompt): ?string
    {
        $apiKey = $this->settings->openai_api_key;
        if (empty($apiKey)) {
            throw new \RuntimeException('OpenAI API key is not configured for image generation.');
        }

        $model = $this->settings->image_model ?: 'dall-e-2';
        $size = $model === 'dall-e-3' ? '1024x1024' : '512x512';

        $response = Http::timeout(120)
            ->withToken($apiKey)
            ->acceptJson()
            ->post('https://api.openai.com/v1/images/generations', [
                'model' => $model,
                'prompt' => mb_substr($prompt, 0, 950),
                'n' => 1,
                'size' => $size,
            ]);

        if ($response->failed()) {
            throw new \RuntimeException('DALL-E API error: ' . $response->status() . ' ' . $response->body());
        }

        $imageUrl = $response->json('data.0.url');
        if (empty($imageUrl)) {
            throw new \RuntimeException('DALL-E returned no image URL.');
        }

        $imageContent = Http::timeout(60)->get($imageUrl)->body();
        if (empty($imageContent)) {
            throw new \RuntimeException('Failed to download generated image.');
        }

        $filename = 'article_' . $newsId . '_' . time() . '.jpg';
        $path = 'news/' . $filename;

        \Illuminate\Support\Facades\Storage::disk('public')->put($path, $imageContent);

        return $filename;
    }
}
