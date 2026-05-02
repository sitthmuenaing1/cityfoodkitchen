<?php

namespace App\Services;

use Illuminate\Support\Facades\Cache;

class ApiCartStorage
{
    private const TTL_SECONDS = 604800;

    private function cacheKey(int $userId): string
    {
        return "api_cart:{$userId}";
    }

    /**
     * @return array{cart: array<int, int>, qty: array<int, int>}
     */
    public function get(int $userId): array
    {
        $bag = Cache::get($this->cacheKey($userId));

        if (! is_array($bag) || ! isset($bag['cart'], $bag['qty']) || ! is_array($bag['cart']) || ! is_array($bag['qty'])) {
            return ['cart' => [], 'qty' => []];
        }

        return [
            'cart' => array_map('intval', $bag['cart']),
            'qty' => array_map('intval', $bag['qty']),
        ];
    }

    /**
     * @param array<int, int> $cart
     * @param array<int, int> $qty
     */
    public function put(int $userId, array $cart, array $qty): void
    {
        Cache::put($this->cacheKey($userId), compact('cart', 'qty'), self::TTL_SECONDS);
    }

    public function clear(int $userId): void
    {
        Cache::forget($this->cacheKey($userId));
    }
}
