<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Models\Menu;
use App\Models\Order;

/*
|--------------------------------------------------------------------------
|  API Routes
|--------------------------------------------------------------------------
*/

/* Get all menu items */
Route::get('/menu', function () {
    return response()->json(Menu::all());
});

/* Get single menu item */
Route::get('/menu/{mid}', function ($mid) {
    return response()->json(Menu::find($mid));
});

/* Place order  */
Route::post('/order', function (Request $request) {

    $request->validate([
        'mid' => 'required',
        'quantity' => 'required',
        'userid' => 'required'
    ]);

    $order = Order::create([
        'mid' => $request->mid,
        'quantity' => $request->quantity,
        'id' => $request->userid,
        'ordertime' => now(),
    ]);

    return response()->json([
        'success' => true,
        'order' => $order
    ]);
});