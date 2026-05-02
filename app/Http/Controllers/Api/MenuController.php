<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Menu;
use Illuminate\Http\JsonResponse;

class MenuController extends Controller
{
    public function index(): JsonResponse
    {
        return response()->json(Menu::orderBy('mid')->get());
    }

    public function show(int $mid): JsonResponse
    {
        $menu = Menu::find($mid);

        if (! $menu) {
            return response()->json(['message' => 'Menu item not found'], 404);
        }

        return response()->json($menu);
    }
}
