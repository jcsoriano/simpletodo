<?php

namespace App\Traits;

use App\TodoItem;
use App\TodoHistory;

trait RecordsHistory
{
    public static function bootRecordsHistory()
    {
        static::created(function (TodoItem $item) {
            $item->recordHistory('You created the task "' . $item->content .'"');
        });

        static::updating(function (TodoItem $item) {
            $after = $item->getDirty();
            $before = $item->fresh()->toArray();

            // check if the item was done / undone
            if (isset($after['done']) && $before['done'] != $after['done']) {
                if ($after['done']) {
                    $item->recordHistory('You completed the task "'
                        . $item->content . '"');
                } else {
                    $item->recordHistory('You marked the task "' .
                        $item->content . '" as incomplete');
                }
            } elseif ($after['content'] != $before['content']) {
                $item->recordHistory('You renamed a task from "'
                    . $before['content'] . '" to "'
                    . $after['content'] . '"');
            }
        });

        static::deleting(function (TodoItem $item) {
            $item->recordHistory('You deleted the task "' . $item->content . '"');
        });
    }

    public function recordHistory(string $content)
    {
        TodoHistory::create([
            'todo_item_id' => $this->id,
            'content' => $content,
        ]);
    }
}
