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
}