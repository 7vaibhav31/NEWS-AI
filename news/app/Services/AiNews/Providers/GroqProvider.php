<?php

namespace App\Services\AiNews\Providers;

use App\Services\AiNews\Contracts\AiProvider;
use Illuminate\Support\Facades\Http;
use RuntimeException;

class GroqProvider implements AiProvider
{
    public function __construct(
        protected string $apiKey,
        protected string $model = 'llama-3.1-8b-instant'
    ) {}

    public function name(): string
    {
        return 'groq';
    }

    public function complete(string $systemPrompt, string $userPrompt): string
    {
        $url = 'https://api.groq.com/openai/v1/chat/completions';

        $response = Http::withToken($this->apiKey)
            ->timeout(120)
            ->acceptJson()
            ->post($url, [
                'model' => $this->model,
                'temperature' => 0.7,
                'messages' => [
                    ['role' => 'system', 'content' => $systemPrompt],
                    ['role' => 'user', 'content' => $userPrompt],
                ],
                'response_format' => ['type' => 'json_object'],
            ]);

        if ($response->failed()) {
            throw new RuntimeException('Groq error: ' . $response->status() . ' ' . $response->body());
        }

        $text = $response->json('choices.0.message.content');
        if (empty($text)) {
            throw new RuntimeException('Groq returned an empty completion.');
        }

        return $text;
    }
}
