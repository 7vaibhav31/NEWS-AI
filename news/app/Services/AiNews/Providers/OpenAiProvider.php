<?php

namespace App\Services\AiNews\Providers;

use App\Services\AiNews\Contracts\AiProvider;
use Illuminate\Support\Facades\Http;
use RuntimeException;

class OpenAiProvider implements AiProvider
{
    public function __construct(
        protected string $apiKey,
        protected string $model = 'gpt-4o-mini'
    ) {}

    public function name(): string
    {
        return 'openai';
    }

    public function complete(string $systemPrompt, string $userPrompt): string
    {
        $response = Http::withToken($this->apiKey)
            ->timeout(120)
            ->acceptJson()
            ->post('https://api.openai.com/v1/chat/completions', [
                'model' => $this->model,
                'temperature' => 0.7,
                'messages' => [
                    ['role' => 'system', 'content' => $systemPrompt],
                    ['role' => 'user', 'content' => $userPrompt],
                ],
            ]);

        if ($response->failed()) {
            throw new RuntimeException('OpenAI error: ' . $response->status() . ' ' . $response->body());
        }

        $text = $response->json('choices.0.message.content');
        if (empty($text)) {
            throw new RuntimeException('OpenAI returned an empty completion.');
        }

        return $text;
    }
}
