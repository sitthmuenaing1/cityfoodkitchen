<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function showLogin()
    {
        return view('login');
    }

    public function login(Request $request)
    {
        // Validate form
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
            'captcha' => 'required'
        ]);

        // CAPTCHA check
        if ($request->captcha !== $request->captcha_answer) {
            return back()
                ->withErrors(['captcha' => 'Captcha incorrect'])
                ->withInput();
        }

        // Attempt login
        if (Auth::attempt([
            'email' => $request->email,
            'password' => $request->password
        ])) {

            $request->session()->regenerate();

            return redirect()->route('home');
        }

        return back()->with('error','Invalid email or password')->withInput();
    }

    public function logout()
    {
        Auth::logout();
        return redirect()->route('home');
    }
}