<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class RegisterTest extends TestCase
{
    use RefreshDatabase;

    /**
     * @return array{captcha: string, captcha_answer: string}
     */
    protected function matchingCaptchaPayload(): array
    {
        $code = 'XY123';

        return [
            'captcha' => $code,
            'captcha_answer' => $code,
        ];
    }

    protected function validRegistrationPayload(): array
    {
        return [
            'name' => 'Test User',
            'email' => 'register-test@example.com',
            'password' => 'password',
            'password_confirmation' => 'password',
            ...$this->matchingCaptchaPayload(),
        ];
    }

    public function test_register_page_loads(): void
    {
        $response = $this->get(route('register'));
        $response->assertOk();
    }

    public function test_user_can_register(): void
    {
        $response = $this->post(route('register.post'), $this->validRegistrationPayload());

        $response->assertRedirect(route('login'));
        $response->assertSessionHas('success', 'Registration successful. Please login.');
        $this->assertDatabaseHas('users', [
            'email' => 'register-test@example.com',
            'name' => 'Test User',
        ]);
    }

    public function test_register_fails_when_captcha_does_not_match(): void
    {
        $payload = $this->validRegistrationPayload();
        $payload['captcha'] = 'AAAAA';

        $response = $this->from(route('register'))->post(route('register.post'), $payload);

        $response->assertRedirect(route('register'));
        $response->assertSessionHasErrors(['captcha']);
        $this->assertDatabaseMissing('users', ['email' => 'register-test@example.com']);
    }

    public function test_register_fails_with_duplicate_email(): void
    {
        User::factory()->create(['email' => 'duplicate@example.com']);

        $payload = $this->validRegistrationPayload();
        $payload['email'] = 'duplicate@example.com';

        $response = $this->from(route('register'))->post(route('register.post'), $payload);

        $response->assertRedirect(route('register'));
        $response->assertSessionHasErrors(['email']);
        $this->assertDatabaseCount('users', 1);
    }

    public function test_register_fails_when_password_confirmation_does_not_match(): void
    {
        $payload = $this->validRegistrationPayload();
        $payload['password_confirmation'] = 'other-password';

        $response = $this->from(route('register'))->post(route('register.post'), $payload);

        $response->assertRedirect(route('register'));
        $response->assertSessionHasErrors(['password']);
        $this->assertDatabaseMissing('users', ['email' => 'register-test@example.com']);
    }

    public function test_register_fails_when_password_is_too_short(): void
    {
        $payload = $this->validRegistrationPayload();
        $payload['password'] = 'short';
        $payload['password_confirmation'] = 'short';

        $response = $this->from(route('register'))->post(route('register.post'), $payload);

        $response->assertRedirect(route('register'));
        $response->assertSessionHasErrors(['password']);
        $this->assertDatabaseMissing('users', ['email' => 'register-test@example.com']);
    }

    public function test_register_requires_name_validation(): void
    {
        $payload = $this->validRegistrationPayload();
        unset($payload['name']);

        $response = $this->from(route('register'))->post(route('register.post'), $payload);

        $response->assertRedirect(route('register'));
        $response->assertSessionHasErrors(['name']);
    }

    public function test_register_requires_captcha_validation(): void
    {
        $payload = $this->validRegistrationPayload();
        unset($payload['captcha'], $payload['captcha_answer']);

        $response = $this->from(route('register'))->post(route('register.post'), $payload);

        $response->assertRedirect(route('register'));
        $response->assertSessionHasErrors(['captcha']);
    }
}
