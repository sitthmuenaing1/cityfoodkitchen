<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Menu;
use Illuminate\Support\Facades\Auth;

class PaymentController extends Controller
{
    // Show cart page
    public function cart()
    {
        $cart = session()->get('cart', []);
        $qty  = session()->get('qty', []);

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

 
    public function remove($key)
    {
        $cart = session()->get('cart', []);
        $qty  = session()->get('qty', []);

        unset($cart[$key], $qty[$key]);

        session()->put('cart', $cart);
        session()->put('qty', $qty);

        return back();
    }

  
    public function placeOrder(Request $request)
    {
        $request->validate([
            'phone' => 'required',
            'billingaddress' => 'required',
            'payment' => 'required'
        ]);

        $cart = session()->get('cart', []);
        $qty  = session()->get('qty', []);

        if (empty($cart)) {
            return back()->with('error', 'Cart is empty');
        }

        $lastOrder = Order::orderBy('ordernumber', 'desc')->first();
        $ordernumber = $lastOrder ? $lastOrder->ordernumber + 1 : 1;

        foreach ($cart as $key => $mid) {
            $menu = Menu::find($mid);
            if (!$menu) continue;

            $quantity = $qty[$key] ?? 1;

            Order::create([
                'mid' => $mid,
                'quantity' => $quantity,
                'ordertime' => now(),
                'id' => Auth::id(),
                'payment' => $request->payment,
                'billingaddress' => $request->billingaddress,
                'phonenumber' => $request->phone,
                'ordernumber' => $ordernumber, 
            ]);
        }

        session()->forget('cart');
        session()->forget('qty');

        return redirect()->route('cart')->with('success', 'Order placed successfully');
    }
}