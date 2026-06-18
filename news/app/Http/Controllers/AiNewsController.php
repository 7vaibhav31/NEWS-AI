<?php

namespace App\Http\Controllers;

use App\Models\AiNewsLog;
use App\Models\AiNewsSetting;
use App\Models\Category;
use App\Models\Language;
use App\Services\AiNews\AiNewsService;
use Illuminate\Http\Request;
use Throwable;

class AiNewsController extends Controller
{
    /** Settings screen. */
    public function index()
    {
        $settings = AiNewsSetting::config();
        $languages = Language::all();
        $categories = Category::all();
        return view('ai_news.settings', compact('settings', 'languages', 'categories'));
    }

    /** Save settings. Empty key fields are ignored so saved keys are not wiped. */
    public function update(Request $request)
    {
        $request->validate([
            'provider' => 'required|in:openai,gemini,claude',
            'source_mode' => 'required|in:topics,rss',
            'per_run_count' => 'required|integer|min:1|max:50',
            'min_words' => 'required|integer|min:50',
            'max_words' => 'required|integer|gte:min_words',
        ]);

        $settings = AiNewsSetting::config();

        $settings->is_enabled = $request->boolean('is_enabled');
        $settings->provider = $request->provider;
        $settings->openai_model = $request->openai_model ?: 'gpt-4o-mini';
        $settings->gemini_model = $request->gemini_model ?: 'gemini-1.5-flash';
        $settings->claude_model = $request->claude_model ?: 'claude-3-5-sonnet-20241022';

        // Only overwrite a key when the admin actually typed a new one.
        if ($request->filled('openai_api_key')) { $settings->openai_api_key = $request->openai_api_key; }
        if ($request->filled('gemini_api_key')) { $settings->gemini_api_key = $request->gemini_api_key; }
        if ($request->filled('claude_api_key')) { $settings->claude_api_key = $request->claude_api_key; }

        $settings->default_language_id = (int) $request->default_language_id;
        $settings->default_category_id = (int) $request->default_category_id;
        $settings->auto_publish = $request->boolean('auto_publish');
        $settings->per_run_count = (int) $request->per_run_count;
        $settings->source_mode = $request->source_mode;
        $settings->topics = $request->topics;
        $settings->rss_urls = $request->rss_urls;
        $settings->tone = $request->tone;
        $settings->min_words = (int) $request->min_words;
        $settings->max_words = (int) $request->max_words;
        $settings->save();

        return redirect()->back()->with('success', 'AI News settings saved.');
    }

    /** Generate immediately from the panel (test / manual trigger). */
    public function generateNow()
    {
        try {
            $result = (new AiNewsService())->runBatch();
            return redirect()->route('ai-news.index')
                ->with('success', $result['message']);
        } catch (Throwable $e) {
            return redirect()->route('ai-news.index')
                ->with('error', 'Generation failed: ' . $e->getMessage());
        }
    }

    /** Generation history. */
    public function logs()
    {
        $logs = AiNewsLog::query()->orderByDesc('id')->paginate(30);
        return view('ai_news.logs', compact('logs'));
    }
}
