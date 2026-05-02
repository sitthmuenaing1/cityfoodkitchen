<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Menu;
use App\Services\ApiCartStorage;
use App\Services\CartService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function __construct(
        private ApiCartStorage $cartStorage,
        private CartService $cartService,
    ) {
    }

    public function show(Request $request): JsonResponse
    {
        $userId = (int) $request->user()->id;
        $state = $this->cartStorage->get($userId);

        return response()->json([
            'cart' => $this->menusWithQty($state['cart'], $state['qty']),
        ]);
    }

    public function store(Request $request): JsonResponse
    {
        $userId = (int) $request->user()->id;
        $state = $this->cartStorage->get($userId);

        $items = $request->input('items');
        if (is_array($items) && count($items) > 0) {
            $validated = $request->validate([
                'items' => 'required|array',
                'items.*.menu_id' => 'required|integer|exists:menu,mid',
                'items.*.qty' => 'nullable|integer|min:1',
            ]);
            foreach ($validated['items'] as $line) {
                $state = $this->cartService->addItem(
                    $state['cart'],
                    $state['qty'],
                    (int) $line['menu_id'],
                    (int) ($line['qty'] ?? 1),
                );
            }
        } else {
            $data = $request->validate([
                'menu_id' => 'required|integer|exists:menu,mid',
                'qty' => 'nullable|integer|min:1',
            ]);

            $state = $this->cartService->addItem(
                $state['cart'],
                $state['qty'],
                (int) $data['menu_id'],
                (int) ($data['qty'] ?? 1),
            );
        }

        $this->cartStorage->put($userId, $state['cart'], $state['qty']);

        return response()->json([
            'message' => 'Cart updated',
            'cart' => $this->menusWithQty($state['cart'], $state['qty']),
        ], 200);
    }

    /**
     * @param array<int, int> $cart
     * @param array<int, int> $qty
     * @return array<int, array<string, mixed>>
     */
    private function menusWithQty(array $cart, array $qty): array
    {
        $menus = [];

        foreach ($cart as $key => $mid) {
            $menu = Menu::find($mid);
            if ($menu) {
                $row = $menu->toArray();
                $row['quantity'] = $qty[$key] ?? 1;
                $menus[] = $row;
            }
        }

        return $menus;
    }
}
