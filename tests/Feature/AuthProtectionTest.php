<?php

namespace Tests\Feature;

use App\Models\Menu;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class AuthProtectionTest extends TestCase
{
    use RefreshDatabase;

    public function test_user_can_logout(): void
    {
        $user = User::factory()->create();

        $response = $this->actingAs($user)->post('/logout');

        $response->assertRedirect('/');
        $this->assertGuest();
    }

    public function test_guest_cannot_access_protected_cart_and_profile_routes(): void
    {
        $response = $this->get('/cart');
        $response->assertRedirect('/login');

        $response = $this->get('/profile');
        $response->assertRedirect('/login');

        $response = $this->get('/add-to-cart/1');
        $response->assertRedirect('/login');

        $response = $this->post('/cart/add', [
            'menu_id' => 1,
            'qty' => 1,
        ]);
        $response->assertRedirect('/login');
    }

    public function test_authenticated_user_can_access_cart_profile_and_add_to_cart(): void
    {
        $user = User::factory()->create();
        $menu = Menu::factory()->create();

        $response = $this->actingAs($user)->get('/cart');
        $response->assertOk();

        $response = $this->actingAs($user)->get('/profile');
        $response->assertOk();

        $response = $this->actingAs($user)->get('/add-to-cart/' . $menu->mid);
        $response->assertStatus(302);

        $response = $this->actingAs($user)->post('/cart/add', [
            'menu_id' => $menu->mid,
            'qty' => 1,
        ]);
        $response->assertStatus(302);
    }
}
