<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AiNewsLog extends Model
{
    protected $table = 'tbl_ai_news_logs';

    protected $fillable = [
        'news_id', 'title', 'provider', 'status', 'message', 'source_mode',
    ];

    public function news()
    {
        return $this->belongsTo(News::class, 'news_id');
    }
}
