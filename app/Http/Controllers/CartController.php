<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Menu;

class CartController extends Controller
{
    private function addItemToCart(int $mid, int $quantity = 1): void
    {
        $cart = session()->get('cart', []);
        $qty = session()->get('qty', []);
        $mid = (int) $mid;
        $quantity = max(1, $quantity);

        if (in_array($mid, $cart)) {
            $key = array_search($mid, $cart);
            $qty[$key] = ($qty[$key] ?? 1) + $quantity;
        } else {
            $cart[] = $mid;
            $qty[] = $quantity;
        }

        session()->put('cart', $cart);
        session()->put('qty', $qty);
    }

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
        $this->addItemToCart((int) $mid, 1);

        return back()->with('success', 'Item added to cart');
    }

    // Add item to cart from form post
    public function addFromRequest(Request $request)
    {
        $data = $request->validate([
            'menu_id' => 'required|integer',
            'qty' => 'nullable|integer|min:1',
        ]);

        $this->addItemToCart((int) $data['menu_id'], (int) ($data['qty'] ?? 1));

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