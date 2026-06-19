<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('tbl_ai_news_settings', function (Blueprint $table) {
            $table->text('groq_api_key')->nullable()->after('claude_model');
            $table->string('groq_model')->nullable()->after('groq_api_key');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('tbl_ai_news_settings', function (Blueprint $table) {
            $table->dropColumn(['groq_api_key', 'groq_model']);
        });
    }
};
