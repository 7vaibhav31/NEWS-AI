<?php

namespace App\Services\AiNews\Providers;

use App\Services\AiNews\Contracts\AiProvider;
use Illuminate\Support\Facades\Http;
use RuntimeException;

class GeminiProvider implements AiProvider
{
    public function __construct(
        protected string $apiKey,
        protected string $model = 'gemini-1.5-flash'
    ) {}

    public function name(): string
    {
        return 'gemini';
    }

    public function complete(string $systemPrompt, string $userPrompt): string
    {
        $url = 'https://generativelanguage.googleapis.com/v1beta/models/'
            . $this->model . ':generateContent?key=' . urlencode($this->apiKey);

        $response = Http::timeout(120)
            ->acceptJson()
            ->post($url, [
                'system_instruction' => [
                    'parts' => [['text' => $systemPrompt]],
                ],
                'contents' => [
                    ['role' => 'user', 'parts' => [['text' => $userPrompt]]],
                ],
                'generationConfig' => [
                    'temperature' => 0.7,
                ],
            ]);

        if ($response->failed()) {
            throw new RuntimeException('Gemini error: ' . $response->status() . ' ' . $response->body());
        }

        $text = $response->json('candidates.0.content.parts.0.text');
        if (empty($text)) {
            throw new RuntimeException('Gemini returned an empty completion.');
        }

        return $text;
    }
}
