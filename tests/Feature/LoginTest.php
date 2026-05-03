<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class LoginTest extends TestCase
{
    use RefreshDatabase;

    /**
     * @return array{captcha: string, captcha_answer: string}
     */
    protected function matchingCaptchaPayload(): array
    {
        $code = 'ABCDE';

        return [
            'captcha' => $code,
            'captcha_answer' => $code,
        ];
    }

    public function test_login_page_loads(): void
    {
        $response = $this->get(route('login'));
        $response->assertOk();
    }

    public function test_user_can_login_with_valid_credentials_and_matching_captcha(): void
    {
        $user = User::factory()->create();

        $response = $this->post(route('login.post'), [
            'email' => $user->email,
            'password' => 'password',
            ...$this->matchingCaptchaPayload(),
        ]);

        $response->assertRedirect(route('home'));
        $this->assertAuthenticatedAs($user);
    }

    public function test_login_fails_with_wrong_password(): void
    {
        $user = User::factory()->create();

        $response = $this->from(route('login'))->post(route('login.post'), [
            'email' => $user->email,
            'password' => 'wrong-password',
            ...$this->matchingCaptchaPayload(),
        ]);

        $response->assertRedirect(route('login'));
        $response->assertSessionHas('error', 'Invalid email or password');
        $this->assertGuest();
    }

    public function test_login_fails_when_captcha_does_not_match(): void
    {
        $user = User::factory()->create();

        $response = $this->from(route('login'))->post(route('login.post'), [
            'email' => $user->email,
            'password' => 'password',
            'captcha' => 'WRONG',
            'captcha_answer' => 'RIGHT',
        ]);

        $response->assertRedirect(route('login'));
        $response->assertSessionHasErrors(['captcha']);
        $this->assertGuest();
    }

    public function test_login_requires_email_validation(): void
    {
        $response = $this->from(route('login'))->post(route('login.post'), [
            'password' => 'password',
            ...$this->matchingCaptchaPayload(),
        ]);

        $response->assertRedirect(route('login'));
        $response->assertSessionHasErrors(['email']);
        $this->assertGuest();
    }

    public function test_login_requires_password_validation(): void
    {
        $user = User::factory()->create();

        $response = $this->from(route('login'))->post(route('login.post'), [
            'email' => $user->email,
            ...$this->matchingCaptchaPayload(),
        ]);

        $response->assertRedirect(route('login'));
        $response->assertSessionHasErrors(['password']);
        $this->assertGuest();
    }

    public function test_login_requires_captcha_validation(): void
    {
        $user = User::factory()->create();

        $response = $this->from(route('login'))->post(route('login.post'), [
            'email' => $user->email,
            'password' => 'password',
        ]);

        $response->assertRedirect(route('login'));
        $response->assertSessionHasErrors(['captcha']);
        $this->assertGuest();
    }
}
