<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Menu;
use App\Services\ApiCartStorage;
use App\Services\OrderService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function __construct(
        private ApiCartStorage $cartStorage,
        private OrderService $orderService,
    ) {
    }

    public function store(Request $request): JsonResponse
    {
        $data = $request->validate([
            'phone' => 'required|string',
            'billingaddress' => 'required|string',
            'payment' => 'required|string',
        ]);

        $userId = (int) $request->user()->id;
        $state = $this->cartStorage->get($userId);

        if (count($state['cart']) === 0) {
            return response()->json(['message' => 'Cart is empty'], 422);
        }

        $existingIds = Menu::whereIn('mid', $state['cart'])->pluck('mid')->all();

        $lastOrder = Order::orderBy('ordernumber', 'desc')->first();
        $orderNumber = $this->orderService->nextOrderNumber($lastOrder?->ordernumber);

        $rows = $this->orderService->buildOrderRows(
            $state['cart'],
            $state['qty'],
            $existingIds,
            $userId,
            $data['payment'],
            $data['billingaddress'],
            $data['phone'],
            $orderNumber,
        );

        if (count($rows) === 0) {
            return response()->json(['message' => 'No valid line items'], 422);
        }

        $created = [];
        foreach ($rows as $row) {
            $created[] = Order::create(array_merge($row, ['ordertime' => now()]));
        }

        $this->cartStorage->clear($userId);

        return response()->json([
            'message' => 'Order placed successfully',
            'ordernumber' => $orderNumber,
            'orders' => $created,
        ], 201);
    }
}
