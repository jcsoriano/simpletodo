<?php

namespace App\Http\Controllers;

use App\TodoItem;
use App\TodoHistory;
use Illuminate\Http\Request;

class TodoItemController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        return [
            'status' => 'success',
            'item' => TodoItem::create($request->validate([
                'content' => 'required',
            ]))
        ];
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, TodoItem $item)
    {
        return [
            'status' => 'success',
            'item' => tap($item)->update($request->validate([
                'content' => 'required',
                'done' => '',
            ])),
        ];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(TodoItem $item)
    {
        // delete item
        $item->delete();

        // respond!
        return [
            'status' => 'success',
        ];
    }
}
