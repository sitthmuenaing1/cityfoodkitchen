<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\CartController;
use App\Http\Controllers\Api\MenuController;
use App\Http\Controllers\Api\OrderController;

/*
|--------------------------------------------------------------------------
| REST API Routes (prefix /api)
|--------------------------------------------------------------------------
*/

Route::get('/menu', [MenuController::class, 'index']);
Route::get('/menu/{mid}', [MenuController::class, 'show'])->whereNumber('mid');

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/cart', [CartController::class, 'show']);
    Route::post('/cart', [CartController::class, 'store']);
    Route::post('/order', [OrderController::class, 'store']);
});
