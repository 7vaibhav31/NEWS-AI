<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class News_image extends Model
{
    use HasFactory;

    protected $table = 'tbl_news_image';

    protected $fillable = ['news_id', 'other_image'];

    public function getOtherImageAttribute($other_image)
    {
        if (empty($other_image)) {
            return '';
        }

        if (strpos($other_image, 'news/') === false) {
            $other_image = 'news/' . $this->news_id . '/' . $other_image;
        }

        if (Storage::disk('public')->exists($other_image)) {
            return url(Storage::url($other_image));
        }

        return 'https://news.horizonmedia.in/storage/' . $other_image;
    }

    public function news()
    {
        return $this->belongsTo(News::class, 'news_id');
    }

    public function getOtherImagePathAttribute()
    {
        $other_image = $this->attributes['other_image'];

        // Check if $other_image is not empty and does not already contain the news/ID prefix
        if (!empty($other_image) && strpos($other_image, 'news/') === false) {
            // Append 'news/' and the ID to the beginning of $other_image
            $other_image = 'news/' . $this->news_id . '/' . $other_image;
        }

        // Return the path without the full URL
        return $other_image;
    }
}
