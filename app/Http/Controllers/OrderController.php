<?php

namespace App\Http\Controllers;

use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function index()
    {
        return redirect()->route('cart');
    }

    public function store(Request $request): RedirectResponse
    {
        $request->validate([
            'total' => 'nullable|numeric|min:0',
        ]);

        return redirect()->route('cart');
    }
}
