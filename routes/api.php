<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\PasswordController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\ProfileController;
use App\Http\Controllers\Api\ResetPasswordController;
use App\Http\Controllers\Api\VendorController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Public routes
Route::post('/auth/register', [AuthController::class, 'register'])->name('api.register');
Route::post('/auth/login', [AuthController::class, 'login'])->name('api.login');
Route::post('/auth/verify-email', [AuthController::class, 'verifyEmail'])->name('api.verify-email');
Route::post('/auth/verify-phone', [AuthController::class, 'verifyPhone'])->name('api.verify-phone');
Route::post('/auth/resend-verification-code', [AuthController::class, 'resendVerificationCode'])->name('api.resend-verification-code');

Route::post('/auth/reset-password/send-code', [ResetPasswordController::class, 'resetPasswordSendCode'])->name('api.reset-password.send-code');
Route::post('/auth/reset-password/verify-code', [ResetPasswordController::class, 'resetPasswordVerifyCode'])->name('api.reset-password.verify-code');
Route::post('/auth/reset-password/set-new-password', [ResetPasswordController::class, 'resetPasswordSetNewPassword'])->name('api.reset-password.set-new-password');

// Protected routes (require authentication)
Route::middleware('auth:sanctum')->group(function () {
    // Authentication routes
    Route::post('/logout', [AuthController::class, 'logout'])->name('api.logout');
    Route::get('/user', [AuthController::class, 'user'])->name('api.user');

    // Profile routes
    Route::get('/profile', [ProfileController::class, 'show'])->name('api.profile.show');
    Route::put('/profile', [ProfileController::class, 'update'])->name('api.profile.update');

    // Password routes
    Route::put('/password', [PasswordController::class, 'update'])->name('api.password.update');

    // Category routes
    Route::apiResource('/categories', CategoryController::class)->only(['index', 'show']);

    // Vendor routes
    Route::apiResource('/vendors', VendorController::class)->only(['index', 'show']);

    // Product routes
    Route::apiResource('/products', ProductController::class)->only(['index', 'show']);
});


