<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('tbl_ai_news_logs', function (Blueprint $table) {
            $table->id();
            $table->integer('news_id')->nullable()->index('news_id');
            $table->text('title')->nullable();
            $table->string('provider', 30)->nullable();
            $table->string('status', 20)->default('success')->comment('success | failed | skipped');
            $table->text('message')->nullable();
            $table->string('source_mode', 20)->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tbl_ai_news_logs');
    }
};
