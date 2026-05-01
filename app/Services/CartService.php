<?php

namespace App\Services;

class CartService
{
    /**
     * Add item into cart arrays and return updated state.
     *
     * @param array<int, int> $cart
     * @param array<int, int> $qty
     * @return array{cart: array<int, int>, qty: array<int, int>}
     */
    public function addItem(array $cart, array $qty, int $mid, int $quantity = 1): array
    {
        $mid = (int) $mid;
        $quantity = max(1, $quantity);

        if (in_array($mid, $cart, true)) {
            $key = (int) array_search($mid, $cart, true);
            $qty[$key] = ($qty[$key] ?? 1) + $quantity;
        } else {
            $cart[] = $mid;
            $qty[] = $quantity;
        }

        return ['cart' => $cart, 'qty' => $qty];
    }

    /**
     * Increase item quantity by key.
     *
     * @param array<int, int> $qty
     * @return array<int, int>
     */
    public function increaseQty(array $qty, int $key): array
    {
        $qty[$key] = ($qty[$key] ?? 1) + 1;

        return $qty;
    }

    /**
     * Decrease item quantity by key, never below 1.
     *
     * @param array<int, int> $qty
     * @return array<int, int>
     */
    public function decreaseQty(array $qty, int $key): array
    {
        if (isset($qty[$key]) && $qty[$key] > 1) {
            $qty[$key]--;
        }

        return $qty;
    }

    /**
     * Remove an item by key from cart and qty arrays.
     *
     * @param array<int, int> $cart
     * @param array<int, int> $qty
     * @return array{cart: array<int, int>, qty: array<int, int>}
     */
    public function removeItem(array $cart, array $qty, int $key): array
    {
        unset($cart[$key], $qty[$key]);

        return ['cart' => $cart, 'qty' => $qty];
    }
}
