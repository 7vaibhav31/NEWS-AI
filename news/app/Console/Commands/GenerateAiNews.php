<?php

namespace App\Console\Commands;

use App\Models\AiNewsSetting;
use App\Services\AiNews\AiNewsService;
use Illuminate\Console\Command;

class GenerateAiNews extends Command
{
    protected $signature = 'ai-news:generate {--force : Run even if the engine toggle is off}';

    protected $description = 'Generate and publish fresh news articles using the configured AI provider';

    public function handle(): int
    {
        $settings = AiNewsSetting::config();

        if (!$settings->is_enabled && !$this->option('force')) {
            $this->warn('AI News engine is disabled. Use --force to override.');
            return self::SUCCESS;
        }

        $this->info('Running AI news generation (' . $settings->provider . ', ' . $settings->source_mode . ')...');

        $result = (new AiNewsService($settings))->runBatch();

        $this->info($result['message']);
        return self::SUCCESS;
    }
}
