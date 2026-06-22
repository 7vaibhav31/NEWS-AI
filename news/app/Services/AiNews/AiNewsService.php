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

        // GROQ: Use enhanced prompts for higher-quality journalism output
        if ($this->settings->provider === 'groq') {
            $system = $this->buildGroqSystemPrompt($language);
            $user = $this->buildGroqUserPrompt($topic, $context);
        } else {
            // Other providers: Use existing prompts (OpenAI, Gemini, Claude unchanged)
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
        }

        // Call provider (same for all)
        $raw = $provider->complete($system, $user);
        $data = $this->parseJson($raw);

        // GROQ: Enhanced validation with fallback field mapping
        if ($this->settings->provider === 'groq') {
            if (!$this->validateGroqResponse($data)) {
                throw new \RuntimeException('Groq response validation failed: missing required fields (title, description, image_prompt).');
            }
            $data = $this->normalizeGroqResponse($data);
        } else {
            // Other providers: Use existing validation
            if (empty($data['title']) || empty($data['description'])) {
                throw new \RuntimeException('Model response missing title/description.');
            }
        }

        // Return EXACT SAME schema for all providers (including Groq)
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

    /**
     * Build enhanced system prompt for Groq (human-like journalism quality).
     * Applied ONLY when provider === 'groq'.
     * Other providers use the standard prompt.
     */
    protected function buildGroqSystemPrompt($language): string
    {
        return trim(
            "You are a professional news journalist writing original, publication-ready articles in {$language}. "
            . "Your writing style must be: "
            . "- Clear, direct, conversational tone (avoid corporate jargon and buzzwords) "
            . "- Human-like narrative (strictly avoid AI clichés like 'delves into', 'opens up about', 'sheds light on', 'it's worth noting that', 'arguably', 'interestingly', 'remarkably') "
            . "- Engaging opening paragraph that hooks the reader immediately "
            . "- Well-structured with clear sections and logical flow "
            . "- Professional but accessible language suitable for news publication "
            . "- Original prose written in your own words, NOT copied from sources "
            . ($this->settings->tone ?: 'Neutral, factual, investigative journalism style.')
            . " Do NOT invent quotes or fake statistics. Do NOT include AI-generated phrases. "
            . "Target {$this->settings->min_words}-{$this->settings->max_words} words for the article body. "
            . "Return ONLY valid minified JSON (no markdown, no extra text, no commentary)."
        );
    }

    /**
     * Build enhanced user prompt for Groq requesting explicit article fields.
     * Applied ONLY when provider === 'groq'.
     * Requests headline, article, summary, meta-description, keywords, tags, and image prompt.
     */
    protected function buildGroqUserPrompt(string $topic, string $context): string
    {
        $sourceLine = !empty($context)
            ? "Reference headline: \"{$topic}\"\nReference summary (you must rewrite and expand, do NOT copy verbatim): \"{$context}\""
            : "Write a fresh, original news article about: \"{$topic}\"";

        return $sourceLine . "\n\nGenerate a complete, publication-ready news article. Return ONLY valid minified JSON (no markdown, no extra text) with exactly these keys:\n"
            . "{\n"
            . '  "title": "compelling headline/title (descriptive, under 60 chars, suitable for news publication)",\n'
            . '  "description": "full article body (publication-ready, using only <p>, <h2>, <ul>, <li>, <strong>, <em>, <a> tags)",\n'
            . '  "meta_title": "SEO title (max 60 characters)",\n'
            . '  "meta_description": "SEO description summary (max 160 characters, 2-3 sentences)",\n'
            . '  "meta_keywords": ["keyword1", "keyword2", "keyword3", "keyword4", "keyword5"],\n'
            . '  "tags": ["topic1", "topic2", "topic3"],\n'
            . '  "image_prompt": "A detailed description of the image scene for this article (vivid scene details, mood, setting, but without using AI art keywords like photorealistic, 8k, 4k, hyperrealistic, or similar)"\n'
            . "}";
    }

    /**
     * Validate Groq response contains required fields.
     * Supports fallback field names: 'headline' for 'title', 'article' for 'description'.
     * Returns true only if all required fields have non-empty values.
     * Applied ONLY when provider === 'groq'.
     */
    protected function validateGroqResponse(array $data): bool
    {
        // Support fallback field names
        $title = $data['title'] ?? $data['headline'] ?? null;
        $description = $data['description'] ?? $data['article'] ?? null;
        $image_prompt = $data['image_prompt'] ?? null;

        // All three required fields must exist and be non-empty
        return !empty($title) && !empty($description) && !empty($image_prompt);
    }

    /**
     * Normalize Groq response by mapping fallback field names to standard field names.
     * Ensures all expected fields exist with safe fallback values (empty strings/arrays).
     * Applied ONLY when provider === 'groq', AFTER validation passes.
     * Returns array with exact same keys as other providers for consistent downstream processing.
     */
    protected function normalizeGroqResponse(array $data): array
    {
        // Map fallback field names to standard names
        if (empty($data['title']) && !empty($data['headline'])) {
            $data['title'] = $data['headline'];
        }
        if (empty($data['description']) && !empty($data['article'])) {
            $data['description'] = $data['article'];
        }

        // Ensure all expected keys exist (validation already passed, so these should be present)
        return [
            'title' => $data['title'] ?? '',
            'description' => $data['description'] ?? '',
            'meta_title' => $data['meta_title'] ?? '',
            'meta_description' => $data['meta_description'] ?? '',
            'meta_keywords' => $data['meta_keywords'] ?? [],
            'tags' => $data['tags'] ?? [],
            'image_prompt' => $data['image_prompt'] ?? '',
        ];
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
     * Call the image generation API (DALL-E or Pollinations), download it, and save it to public storage.
     */
    protected function generateAndSaveImage(int $newsId, string $prompt): ?string
    {
        $provider = $this->settings->image_provider ?: 'openai';

        if ($provider === 'pollinations') {
            $imageUrl = 'https://image.pollinations.ai/prompt/' . rawurlencode(mb_substr($prompt, 0, 900)) . '?width=512&height=512&nologo=true&private=true';
            $imageContent = Http::timeout(60)->get($imageUrl)->body();
            if (empty($imageContent)) {
                throw new \RuntimeException('Failed to download image from Pollinations.ai');
            }

            $filename = 'article_' . $newsId . '_' . time() . '.jpg';
            $path = 'news/' . $filename;

            \Illuminate\Support\Facades\Storage::disk('public')->put($path, $imageContent);

            return $filename;
        }

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
