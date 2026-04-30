<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Menu;

class CartController extends Controller
{
    // Show cart page
    public function index()
    {
        $cart = session()->get('cart', []);
        $qty = session()->get('qty', []);
        $menus = [];

        foreach ($cart as $key => $mid) {
            $menu = Menu::find($mid); 
            if ($menu) {
                $menu->quantity = $qty[$key] ?? 1;
                $menus[$key] = $menu;
            }
        }

        return view('cart', compact('menus'));
    }

    // Add item to cart
    public function addToCart($mid)
    {
        $cart = session()->get('cart', []);
        $qty = session()->get('qty', []);
        $mid = (int)$mid;

        if (in_array($mid, $cart)) {
            $key = array_search($mid, $cart);
            $qty[$key] = ($qty[$key] ?? 1) + 1;
        } else {
            $cart[] = $mid;
            $qty[] = 1;
        }

        session()->put('cart', $cart);
        session()->put('qty', $qty);

        return back()->with('success', 'Item added to cart');
    }

    // Increase quantity
    public function qtyPlus($key)
    {
        $qty = session()->get('qty', []);
        $qty[$key] = ($qty[$key] ?? 1) + 1;
        session()->put('qty', $qty);

        return back();
    }

    // Decrease quantity
    public function qtyMinus($key)
    {
        $qty = session()->get('qty', []);
        if (isset($qty[$key]) && $qty[$key] > 1) {
            $qty[$key]--;
        }
        session()->put('qty', $qty);

        return back();
    }

    // Remove item
    public function remove($key)
    {
        $cart = session()->get('cart', []);
        $qty = session()->get('qty', []);

        unset($cart[$key], $qty[$key]);

        session()->put('cart', $cart);
        session()->put('qty', $qty);

        return back();
    }
}