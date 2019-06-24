<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class followImage extends Model
{
    //
    protected $fillable = [
        'follow_id', 'photo'
    ];
}
