<?php

namespace App\Services;

class OrderService
{
    public function nextOrderNumber(?int $lastOrderNumber): int
    {
        return $lastOrderNumber ? $lastOrderNumber + 1 : 1;
    }

    /**
     * Build order rows from cart data.
     *
     * @param array<int, int> $cart
     * @param array<int, int> $qty
     * @param array<int, int> $existingMenuIds
     * @return array<int, array<string, int|string>>
     */
    public function buildOrderRows(
        array $cart,
        array $qty,
        array $existingMenuIds,
        int $userId,
        string $payment,
        string $billingAddress,
        string $phone,
        int $orderNumber
    ): array {
        $rows = [];
        $menuIdMap = array_flip($existingMenuIds);

        foreach ($cart as $key => $mid) {
            if (!isset($menuIdMap[$mid])) {
                continue;
            }

            $rows[] = [
                'mid' => (int) $mid,
                'quantity' => (int) ($qty[$key] ?? 1),
                'id' => $userId,
                'payment' => $payment,
                'billingaddress' => $billingAddress,
                'phonenumber' => $phone,
                'ordernumber' => $orderNumber,
            ];
        }

        return $rows;
    }
}
