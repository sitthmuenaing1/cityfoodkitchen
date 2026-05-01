<?php

namespace Tests\Unit;

use App\Services\CartService;
use PHPUnit\Framework\TestCase;

class CartServiceTest extends TestCase
{
    public function test_it_adds_new_item_to_empty_cart(): void
    {
        $service = new CartService();

        $result = $service->addItem([], [], 5, 2);

        $this->assertSame([5], $result['cart']);
        $this->assertSame([2], $result['qty']);
    }

    public function test_it_increases_quantity_when_item_already_exists(): void
    {
        $service = new CartService();

        $result = $service->addItem([5], [1], 5, 3);

        $this->assertSame([5], $result['cart']);
        $this->assertSame([4], $result['qty']);
    }

    public function test_it_does_not_decrease_quantity_below_one(): void
    {
        $service = new CartService();

        $result = $service->decreaseQty([1], 0);

        $this->assertSame([1], $result);
    }

    public function test_it_removes_item_and_keeps_cart_and_qty_aligned(): void
    {
        $service = new CartService();

        $result = $service->removeItem([10, 20], [1, 2], 0);

        $this->assertSame([1 => 20], $result['cart']);
        $this->assertSame([1 => 2], $result['qty']);
    }
}
