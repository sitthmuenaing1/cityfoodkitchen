<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    // =========================
    // ADMIN LOGIN
    // =========================

    public function login()
    {
        return view('admin.adminlogin');
    }

    public function loginPost(Request $request)
    {
        $credentials = $request->only('username', 'password');

        if (Auth::guard('admin')->attempt($credentials)) {
            return redirect('/adminhome');
        }

        return back()->with('error', 'Invalid username or password');
    }

    public function logout()
    {
        Auth::guard('admin')->logout();
        return redirect('/admin/login');
    }

    // =========================
    // ADMIN PAGES
    // =========================

    public function adminhome()
    {
        return view('admin.adminhome');
    }

    public function customers()
    {
        return view('admin.customers');
    }

    public function sales()
    {
        return view('admin.sales');
    }

    public function orders()
    {
        return view('admin.orders');
    }
}