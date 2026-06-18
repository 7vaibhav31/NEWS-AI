<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class LiveStreaming extends Model
{
    use HasFactory;

    protected $table = 'tbl_live_streaming';

    protected $fillable = ['title', 'image', 'type', 'url', 'language_id', 'meta_description', 'meta_title', 'meta_keyword', 'schema_markup'];

    public function language()
    {
        return $this->belongsTo(Language::class, 'language_id');
    }

    public function getImageAttribute($image)
    {
        if (empty($image)) {
            return '';
        }

        // If type is File Upload or Video Upload and liveStreaming is not in the image path, add it.
        if (strpos($image, 'liveStreaming/') === false) {
            $image = 'liveStreaming/' . $image;
        }

        if (Storage::disk('public')->exists($image)) {
            return url(Storage::url($image));
        }

        return 'https://news.horizonmedia.in/storage/' . $image;
    }

    protected static function boot()
    {
        parent::boot();
        static::deleting(function ($image) {
            // before delete() method call this
            if (!is_null($image->image) && Storage::disk('public')->exists($image->getRawOriginal('image'))) {
                Storage::disk('public')->delete($image->getRawOriginal('image'));
            }
        });
    }
}
