<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MenuController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\OrderController;

// Home
Route::view('/', 'home')->name('home');

// Menu
Route::get('/food', [MenuController::class, 'food'])->name('food');
Route::get('/drinks', [MenuController::class, 'drinks'])->name('drinks');

// Contact
Route::view('/contact', 'contact')->name('contact');

// Auth
Route::get('/login', [LoginController::class,'showLogin'])->name('login');
Route::post('/login', [LoginController::class,'login'])->name('login.post');
Route::get('/logout', [LoginController::class,'logout'])->name('logout');
Route::get('/register', [RegisterController::class,'showRegister'])->name('register');
Route::post('/register', [RegisterController::class,'register'])->name('register.post');

// Cart routes (auth required)
Route::middleware('auth')->group(function () {
    Route::get('/cart', [CartController::class,'index'])->name('cart');
    Route::post('/cart/add', [CartController::class,'addFromRequest']);
    Route::get('/add-to-cart/{mid}', [CartController::class,'addToCart'])->name('add.cart');
    Route::get('/qty-plus/{key}', [CartController::class,'qtyPlus'])->name('qty.plus');
    Route::get('/qty-minus/{key}', [CartController::class,'qtyMinus'])->name('qty.minus');
    Route::get('/cart-remove/{key}', [CartController::class,'remove'])->name('cart.remove');
    Route::post('/place-order', [PaymentController::class,'placeOrder'])->name('place.order');
    Route::view('/profile', 'profile')->name('profile');
});

// For Logout
use Illuminate\Support\Facades\Auth;

Route::post('/logout', function () {
    Auth::logout();
    return redirect('/');
})->name('logout');


Route::post('/order', [OrderController::class, 'store'])->middleware('auth');
Route::get('/order', [OrderController::class, 'index'])->middleware('auth');