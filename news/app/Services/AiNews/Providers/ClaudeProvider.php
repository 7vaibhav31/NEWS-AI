<?php

namespace App\Services\AiNews\Providers;

use App\Services\AiNews\Contracts\AiProvider;
use Illuminate\Support\Facades\Http;
use RuntimeException;

class ClaudeProvider implements AiProvider
{
    public function __construct(
        protected string $apiKey,
        protected string $model = 'claude-3-5-sonnet-20241022'
    ) {}

    public function name(): string
    {
        return 'claude';
    }

    public function complete(string $systemPrompt, string $userPrompt): string
    {
        $response = Http::withHeaders([
                'x-api-key' => $this->apiKey,
                'anthropic-version' => '2023-06-01',
            ])
            ->timeout(120)
            ->acceptJson()
            ->post('https://api.anthropic.com/v1/messages', [
                'model' => $this->model,
                'max_tokens' => 2048,
                'temperature' => 0.7,
                'system' => $systemPrompt,
                'messages' => [
                    ['role' => 'user', 'content' => $userPrompt],
                ],
            ]);

        if ($response->failed()) {
            throw new RuntimeException('Claude error: ' . $response->status() . ' ' . $response->body());
        }

        $text = $response->json('content.0.text');
        if (empty($text)) {
            throw new RuntimeException('Claude returned an empty completion.');
        }

        return $text;
    }
}
