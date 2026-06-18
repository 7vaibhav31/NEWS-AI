<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Crypt;

class AiNewsSetting extends Model
{
    protected $table = 'tbl_ai_news_settings';

    protected $fillable = [
        'is_enabled', 'provider',
        'openai_api_key', 'openai_model',
        'gemini_api_key', 'gemini_model',
        'claude_api_key', 'claude_model',
        'default_language_id', 'default_category_id',
        'auto_publish', 'per_run_count',
        'enable_image_generation', 'image_provider', 'image_model',
        'source_mode', 'topics', 'rss_urls',
        'tone', 'min_words', 'max_words', 'last_run_at',
    ];

    protected $casts = [
        'last_run_at' => 'datetime',
    ];

    /**
     * Always return the single config row (id = 1), creating it if missing.
     */
    public static function config(): self
    {
        return static::query()->firstOrCreate(['id' => 1]);
    }

    // --- API keys are stored encrypted at rest and decrypted on read ---

    protected function encryptKey(?string $value): ?string
    {
        if ($value === null || $value === '') {
            return $value;
        }
        // Avoid double-encryption if the value is already an encrypted payload.
        try {
            Crypt::decryptString($value);
            return $value;
        } catch (\Throwable $e) {
            return Crypt::encryptString($value);
        }
    }

    protected function decryptKey(?string $value): ?string
    {
        if ($value === null || $value === '') {
            return $value;
        }
        try {
            return Crypt::decryptString($value);
        } catch (\Throwable $e) {
            return $value;
        }
    }

    public function setOpenaiApiKeyAttribute($v) { $this->attributes['openai_api_key'] = $this->encryptKey($v); }
    public function getOpenaiApiKeyAttribute($v) { return $this->decryptKey($v); }

    public function setGeminiApiKeyAttribute($v) { $this->attributes['gemini_api_key'] = $this->encryptKey($v); }
    public function getGeminiApiKeyAttribute($v) { return $this->decryptKey($v); }

    public function setClaudeApiKeyAttribute($v) { $this->attributes['claude_api_key'] = $this->encryptKey($v); }
    public function getClaudeApiKeyAttribute($v) { return $this->decryptKey($v); }

    /**
     * The active provider's API key + model based on the `provider` column.
     *
     * @return array{key: ?string, model: ?string}
     */
    public function activeCredentials(): array
    {
        return match ($this->provider) {
            'gemini' => ['key' => $this->gemini_api_key, 'model' => $this->gemini_model],
            'claude' => ['key' => $this->claude_api_key, 'model' => $this->claude_model],
            default  => ['key' => $this->openai_api_key, 'model' => $this->openai_model],
        };
    }
}
