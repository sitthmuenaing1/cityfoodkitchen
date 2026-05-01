<?php

namespace Tests\Unit;

use App\Services\OrderService;
use PHPUnit\Framework\TestCase;

class OrderServiceTest extends TestCase
{
    public function test_it_generates_next_order_number_correctly(): void
    {
        $service = new OrderService();

        $this->assertSame(1, $service->nextOrderNumber(null));
        $this->assertSame(11, $service->nextOrderNumber(10));
    }

    public function test_it_creates_rows_for_each_cart_item_when_menu_exists(): void
    {
        $service = new OrderService();

        $rows = $service->buildOrderRows(
            [10, 20],
            [2, 1],
            [10, 20, 30],
            99,
            'cash',
            'Yangon',
            '0912345678',
            5
        );

        $this->assertCount(2, $rows);
        $this->assertSame(10, $rows[0]['mid']);
        $this->assertSame(2, $rows[0]['quantity']);
        $this->assertSame(5, $rows[0]['ordernumber']);
    }

    public function test_it_skips_missing_menus_when_building_rows(): void
    {
        $service = new OrderService();

        $rows = $service->buildOrderRows(
            [10, 999],
            [2, 1],
            [10],
            99,
            'cash',
            'Yangon',
            '0912345678',
            5
        );

        $this->assertCount(1, $rows);
        $this->assertSame(10, $rows[0]['mid']);
    }
}
