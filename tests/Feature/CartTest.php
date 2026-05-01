<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\User;
use App\Models\Menu;

class CartTest extends TestCase
{
    use RefreshDatabase;

    public function test_add_to_cart()
    {
        $user = User::factory()->create();

        $menu = Menu::factory()->create();

        $response = $this->actingAs($user)->post('/cart/add', [
            'menu_id' => $menu->mid,
            'qty' => 1
        ]);

        $response->assertStatus(302);
    }

    public function test_view_cart_page()
    {
        $user = User::factory()->create();

        $response = $this->actingAs($user)->get('/cart');

        $response->assertStatus(200);
    }

    public function test_update_quantity_of_items_in_cart()
    {
        $user = User::factory()->create();
        $menu = Menu::factory()->create();

        $this->actingAs($user)->withSession([
            'cart' => [$menu->mid],
            'qty' => [1],
        ])->get('/qty-plus/0')->assertRedirect();

        $this->assertSame([2], session('qty'));

        $this->actingAs($user)->withSession([
            'cart' => [$menu->mid],
            'qty' => [2],
        ])->get('/qty-minus/0')->assertRedirect();

        $this->assertSame([1], session('qty'));
    }

    public function test_clear_item_from_cart()
    {
        $user = User::factory()->create();
        $menu = Menu::factory()->create();

        $this->actingAs($user)->withSession([
            'cart' => [$menu->mid],
            'qty' => [2],
        ])->get('/cart-remove/0')->assertRedirect();

        $this->assertSame([], array_values(session('cart', [])));
        $this->assertSame([], array_values(session('qty', [])));
    }
}