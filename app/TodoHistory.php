<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TodoHistory extends Model
{
    protected $table = 'todo_histories';
    protected $fillable = ['content', 'todo_item_id'];
    //
}
