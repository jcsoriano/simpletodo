<?php

namespace App;

use App\Traits\RecordsHistory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class TodoItem extends Model
{
    use SoftDeletes, RecordsHistory;

    protected $table = 'todo_items';
    protected $fillable = ['content', 'done'];
    protected $dates = ['deleted_at'];
    protected $casts = [
        'done' => 'boolean',
    ];
}
