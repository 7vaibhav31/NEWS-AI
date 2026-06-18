<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('tbl_ai_news_settings', function (Blueprint $table) {
            $table->id();
            $table->tinyInteger('is_enabled')->default(0)->comment('1-on, 0-off');

            // Active provider: openai | gemini | claude
            $table->string('provider', 30)->default('openai');

            // Provider credentials (stored encrypted by the model accessors)
            $table->text('openai_api_key')->nullable();
            $table->string('openai_model', 60)->default('gpt-4o-mini');
            $table->text('gemini_api_key')->nullable();
            $table->string('gemini_model', 60)->default('gemini-1.5-flash');
            $table->text('claude_api_key')->nullable();
            $table->string('claude_model', 60)->default('claude-3-5-sonnet-20241022');

            // Publishing behaviour
            $table->integer('default_language_id')->default(0);
            $table->integer('default_category_id')->default(0);
            $table->tinyInteger('auto_publish')->default(1)->comment('1-publish live, 0-save as draft');
            $table->integer('per_run_count')->default(3);

            // Source: topics | rss
            $table->string('source_mode', 20)->default('topics');
            $table->longText('topics')->nullable()->comment('one seed topic / keyword per line');
            $table->longText('rss_urls')->nullable()->comment('one RSS feed URL per line');

            // Editorial controls
            $table->text('tone')->nullable();
            $table->integer('min_words')->default(350);
            $table->integer('max_words')->default(700);

            $table->dateTime('last_run_at')->nullable();
            $table->timestamps();
        });

        // Seed a single config row so the panel always has a record to edit.
        DB::table('tbl_ai_news_settings')->insert([
            'is_enabled'   => 0,
            'provider'     => 'openai',
            'auto_publish' => 1,
            'per_run_count' => 3,
            'source_mode'  => 'topics',
            'tone'         => 'Neutral, factual, journalistic. Indian English. No clickbait. Cite no fabricated sources.',
            'min_words'    => 350,
            'max_words'    => 700,
            'created_at'   => now(),
            'updated_at'   => now(),
        ]);
    }

    public function down(): void
    {
        Schema::dropIfExists('tbl_ai_news_settings');
    }
};
