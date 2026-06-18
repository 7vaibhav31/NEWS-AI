<?php

namespace App\Services\AiNews\Contracts;

interface AiProvider
{
    /**
     * Send a system + user prompt to the model and return the raw text completion.
     * Implementations must throw \RuntimeException on transport/API errors.
     */
    public function complete(string $systemPrompt, string $userPrompt): string;

    /** Human-readable provider key, e.g. "openai". */
    public function name(): string;
}
