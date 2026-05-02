<?php

namespace App\Services;

class OrderService
{
    public function nextOrderNumber(?int $lastOrderNumber): int
    {
<<<<<<< HEAD
        return $lastOrderNumber ? $lastOrderNumber + 1 : 1;
    }

    /**
     * Build order rows from cart data.
     *
     * @param array<int, int> $cart
     * @param array<int, int> $qty
     * @param array<int, int> $existingMenuIds
     * @return array<int, array<string, int|string>>
=======
        return $lastOrderNumber === null ? 1 : $lastOrderNumber + 1;
    }

    /**
     * Build order rows for insert/create.
     *
     * @param array<int,int> $cart
     * @param array<int,int> $qty
     * @param array<int,int> $existingMenuIds
     * @return array<int,array<string,mixed>>
>>>>>>> 9eb146a (update files)
     */
    public function buildOrderRows(
        array $cart,
        array $qty,
        array $existingMenuIds,
        int $userId,
        string $payment,
        string $billingAddress,
<<<<<<< HEAD
        string $phone,
        int $orderNumber
    ): array {
        $rows = [];
        $menuIdMap = array_flip($existingMenuIds);

        foreach ($cart as $key => $mid) {
            if (!isset($menuIdMap[$mid])) {
=======
        string $phoneNumber,
        int $orderNumber
    ): array {
        $existing = array_flip($existingMenuIds);
        $rows = [];

        foreach ($cart as $key => $mid) {
            $mid = (int) $mid;
            if (!isset($existing[$mid])) {
>>>>>>> 9eb146a (update files)
                continue;
            }

            $rows[] = [
<<<<<<< HEAD
                'mid' => (int) $mid,
                'quantity' => (int) ($qty[$key] ?? 1),
                'id' => $userId,
                'payment' => $payment,
                'billingaddress' => $billingAddress,
                'phonenumber' => $phone,
=======
                'mid' => $mid,
                'quantity' => (int) ($qty[$key] ?? 1),
                'ordertime' => null,
                'id' => $userId,
                'payment' => $payment,
                'billingaddress' => $billingAddress,
                'phonenumber' => $phoneNumber,
>>>>>>> 9eb146a (update files)
                'ordernumber' => $orderNumber,
            ];
        }

        return $rows;
    }
}
<<<<<<< HEAD
=======

>>>>>>> 9eb146a (update files)
