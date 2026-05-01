<?php

namespace Tests\Feature;

use App\Models\Menu;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class BladeUiTest extends TestCase
{
    use RefreshDatabase;

    public function test_home_page_renders_main_ui_sections(): void
    {
        $response = $this->get('/');

        $response->assertOk();
        $response->assertSee('Welcome to City Food Kitchen');
        $response->assertSee('About Us');
        $response->assertSee('Our Vision');
        $response->assertSee('Contact Us');
    }

    public function test_login_page_renders_expected_form_fields(): void
    {
        $response = $this->get('/login');

        $response->assertOk();
        $response->assertSee('Email');
        $response->assertSee('Password');
        $response->assertSee('Login');
        $response->assertSeeText("Don't have an account?", false);
    }

    public function test_register_page_renders_expected_form_fields(): void
    {
        $response = $this->get('/register');

        $response->assertOk();
        $response->assertSee('Name');
        $response->assertSee('Email');
        $response->assertSee('Confirm Password');
        $response->assertSee('Register');
    }

    public function test_cart_page_shows_empty_message_when_cart_has_no_items(): void
    {
        $user = User::factory()->create();

        $response = $this->actingAs($user)->get('/cart');

        $response->assertOk();
        $response->assertSee('Shopping Cart');
        $response->assertSee('Your cart is empty.');
    }

    public function test_cart_page_renders_table_and_order_form_when_cart_has_items(): void
    {
        $user = User::factory()->create();
        $menu = Menu::factory()->create();

        $response = $this->actingAs($user)
            ->withSession([
                'cart' => [$menu->mid],
                'qty' => [2],
            ])
            ->get('/cart');

        $response->assertOk();
        $response->assertSee('Shopping Cart');
        $response->assertSee('Quantity');
        $response->assertSee('Clear');
        $response->assertSee('Phone Number');
        $response->assertSee('Payment Method');
        $response->assertSee('Place Order');
    }

    public function test_food_page_renders_menu_ui_and_add_to_cart_button(): void
    {
        Menu::factory()->create([
            'mtid' => 1,
            'price' => 20,
        ]);

        $response = $this->get('/food');

        $response->assertOk();
        $response->assertSee('Food');
        $response->assertSee('Add to Cart');
    }

    public function test_drinks_page_renders_menu_ui_and_add_to_cart_button(): void
    {
        Menu::factory()->create([
            'mtid' => 2,
            'price' => 12,
        ]);

        $response = $this->get('/drinks');

        $response->assertOk();
        $response->assertSee('Drinks');
        $response->assertSee('Add to Cart');
    }

    public function test_contact_page_renders_key_contact_information(): void
    {
        $response = $this->get('/contact');

        $response->assertOk();
        $response->assertSee('Contact Us');
        $response->assertSee('customerservice@cityfoodkitchen.com');
        $response->assertSee('+1 212 555-0123');
        $response->assertSee('742 8th Ave');
    }

    public function test_profile_page_requires_authentication(): void
    {
        $response = $this->get('/profile');

        $response->assertRedirect('/login');
    }

    public function test_profile_page_renders_authenticated_user_ui(): void
    {
        $user = User::factory()->create([
            'name' => 'Blade Tester',
            'email' => 'blade.tester@example.com',
        ]);

        $response = $this->actingAs($user)->get('/profile');

        $response->assertOk();
        $response->assertSee('My Profile');
        $response->assertSee('Blade Tester');
        $response->assertSee('blade.tester@example.com');
        $response->assertSee('Logout');
    }
}
