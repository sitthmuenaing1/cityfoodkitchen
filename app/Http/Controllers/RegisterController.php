<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    public function showRegister()
    {
        return view('register');
    }

    public function register(Request $request)
    {
        // Validate form
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|confirmed|min:6',
            'captcha' => 'required'
        ]);

        // CAPTCHA check
        if ($request->captcha !== $request->captcha_answer) {
            return back()
                ->withErrors(['captcha' => 'Captcha incorrect'])
                ->withInput();
        }

        // Create user
        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);

        // Redirect to login
        return redirect()->route('login')
            ->with('success','Registration successful. Please login.');
    }
}