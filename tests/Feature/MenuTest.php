<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class MenuTest extends TestCase
{
    use RefreshDatabase;

 public function test_food_page_loads()
{
    $response = $this->get('/food');
    $response->assertStatus(200);
}

public function test_drinks_page_loads()
{
    $response = $this->get('/drinks');
    $response->assertStatus(200);
}
}