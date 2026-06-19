<?php

namespace App\Services\AiNews;

use App\Models\AiNewsSetting;
use App\Services\AiNews\Contracts\AiProvider;
use App\Services\AiNews\Providers\ClaudeProvider;
use App\Services\AiNews\Providers\GeminiProvider;
use App\Services\AiNews\Providers\GroqProvider;
use App\Services\AiNews\Providers\OpenAiProvider;
use RuntimeException;

class AiProviderFactory
{
    /**
     * Build the configured provider driver. This is the single switch point
     * that makes the engine provider-agnostic / swappable.
     */
    public static function make(AiNewsSetting $settings): AiProvider
    {
        $cred = $settings->activeCredentials();

        if (empty($cred['key'])) {
            throw new RuntimeException('No API key configured for provider: ' . $settings->provider);
        }

        return match ($settings->provider) {
            'groq'   => new GroqProvider($cred['key'], $cred['model'] ?: 'llama-3.1-8b-instant'),
            'gemini' => new GeminiProvider($cred['key'], $cred['model'] ?: 'gemini-1.5-flash'),
            'claude' => new ClaudeProvider($cred['key'], $cred['model'] ?: 'claude-3-5-sonnet-20241022'),
            'openai' => new OpenAiProvider($cred['key'], $cred['model'] ?: 'gpt-4o-mini'),
            default  => throw new RuntimeException('Unknown provider: ' . $settings->provider),
        };
    }
}
