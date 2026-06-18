<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('tbl_ai_news_settings', function (Blueprint $table) {
            $table->tinyInteger('enable_image_generation')->default(0)->after('auto_publish');
            $table->string('image_provider', 30)->default('openai')->after('enable_image_generation');
            $table->string('image_model', 60)->default('dall-e-2')->after('image_provider');
        });
    }

    public function down(): void
    {
        Schema::table('tbl_ai_news_settings', function (Blueprint $table) {
            $table->dropColumn(['enable_image_generation', 'image_provider', 'image_model']);
        });
    }
};
