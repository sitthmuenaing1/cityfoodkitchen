<?php

namespace App\Http\Controllers;

use App\Models\Menu;
use Illuminate\Http\Request;

class MenuController extends Controller
{
    // Food menu
    public function food()
    {
        $menus = Menu::where('mtid', 1)->get(); // foods
        return view('food', compact('menus'));
    }

    // Drinks menu
    public function drinks()
    {
        $menus = Menu::where('mtid', 2)->get(); // drinks
        return view('drinks', compact('menus'));
    }
}