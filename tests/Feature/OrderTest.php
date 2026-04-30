<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class OrderTest extends TestCase
{
    use RefreshDatabase;

    public function test_checkout_requires_login()
    {
        $response = $this->post('/order');

        $response->assertStatus(302);
    }

    public function test_user_can_place_order()
    {
        $user = \App\Models\User::factory()->create();

        $this->actingAs($user);

        $response = $this->post('/order', [
            'total' => 100
        ]);

        $response->assertStatus(302);
    }
}