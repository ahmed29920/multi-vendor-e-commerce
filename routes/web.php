<?php

use Illuminate\Support\Facades\Route;



Route::group(['middleware' => 'auth'], function () {
    Route::get('/', function () {
        return view('dashboard.index');
    })->name('dashboard');
});


Route::get('/analytics', function () {
    return view('analytics.analytics');
})->name('analytics');

Route::get('/users', function () {
    return view('users.users');
})->name('users.index');

Route::get('/products', function () {
    return view('products.products');
})->name('products.index');

Route::get('/orders', function () {
    return view('orders.orders');
})->name('orders.index');

Route::get('/forms', function () {
    return view('forms.forms');
})->name('forms');

Route::get('/elements', function () {
    return view('elements');
})->name('elements.index');

Route::get('/elements/buttons', function () {
    return view('elements.elements-buttons');
})->name('elements.buttons');

Route::get('/elements/alerts', function () {
    return view('elements.elements-alerts');
})->name('elements.alerts');

Route::get('/elements/badges', function () {
    return view('elements.elements-badges');
})->name('elements.badges');

Route::get('/elements/cards', function () {
    return view('elements.elements-cards');
})->name('elements.cards');

Route::get('/elements/modals', function () {
    return view('elements.elements-modals');
})->name('elements.modals');

Route::get('/elements/forms', function () {
    return view('elements.elements-forms');
})->name('elements.forms');

Route::get('/elements/tables', function () {
    return view('elements.elements-tables');
})->name('elements.tables');

Route::get('/reports', function () {
    return view('reports.reports');
})->name('reports');

Route::get('/messages', function () {
    return view('messages.messages');
})->name('messages.index');

Route::get('/calendar', function () {
    return view('calendar.calendar');
})->name('calendar');

Route::get('/files', function () {
    return view('files.files');
})->name('files.index');

Route::get('/settings', function () {
    return view('settings.settings');
})->name('settings');

Route::get('/security', function () {
    return view('security.security');
})->name('security');

Route::get('/help', function () {
    return view('help.help');
})->name('help');

// Authentication Routes
Route::get('/login', function () {
    return view('auth.login');
})->middleware('guest')->name('login');

Route::post('/login', function () {
    // This will be handled by Laravel's authentication
    return redirect()->route('dashboard');
})->middleware('guest');

Route::get('/register', function () {
    return view('auth.register');
})->middleware('guest')->name('register');

Route::post('/register', function () {
    // This will be handled by Laravel's authentication
    return redirect()->route('dashboard');
})->middleware('guest');

Route::get('/forgot-password', function () {
    return view('auth.forgot-password');
})->middleware('guest')->name('password.request');

Route::post('/forgot-password', function () {
    // This will be handled by Laravel's password reset
    return back()->with('status', 'We have emailed your password reset link!');
})->middleware('guest')->name('password.email');

Route::get('/reset-password/{token}', function ($token) {
    return view('auth.reset-password', ['token' => $token]);
})->middleware('guest')->name('password.reset');

Route::post('/reset-password', function () {
    // This will be handled by Laravel's password reset
    return redirect()->route('login')->with('status', 'Your password has been reset!');
})->middleware('guest')->name('password.update');

Route::post('/logout', function () {
    auth()->logout();
    return redirect()->route('login');
})->name('logout');
