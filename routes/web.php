<?php

use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\Admin\SubscriptionController;
use App\Http\Controllers\Admin\VariantController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CategoryRequestController;
use App\Http\Controllers\LocaleController;
use App\Http\Controllers\PlanController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\Vendor\DashboardController;
use App\Http\Controllers\Admin\VendorController;
use App\Http\Controllers\Vendor\VendorController as VendorVendorController;
use App\Http\Controllers\Vendor\SubscriptionController as VendorSubscriptionController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

Route::group(['middleware' => 'locale'], function () {

    Route::group(['middleware' => 'auth'], function () {

        Route::get('/profile', [ProfileController::class, 'edit'])->name('profile');

        Route::post('/profile', [ProfileController::class, 'update'])->name('profile.update');

        // Admin Routes
        Route::group(['prefix' => 'admin', 'as' => 'admin.', 'middleware' => 'role:admin'], function () {
            // Admin Dashboard
            Route::get('/dashboard', [\App\Http\Controllers\Admin\DashboardController::class, 'index'])->name('dashboard');

            // Settings Routes
            Route::get('/settings', [SettingController::class, 'index'])->name('settings');
            Route::post('/settings', [SettingController::class, 'update'])->name('settings.update');

            // Categories Routes
            Route::resource('categories', CategoryController::class);

            // Plans Routes
            Route::resource('plans', PlanController::class);

            // Vendors Routes
            Route::resource('vendors', VendorController::class);

            // Variants Routes
            Route::resource('variants', VariantController::class);
            Route::post('variants/{variant}/toggle-active', [VariantController::class, 'toggleActive'])->name('variants.toggle-active');
            Route::post('variants/{variant}/toggle-required', [VariantController::class, 'toggleRequired'])->name('variants.toggle-required');

            // Products Routes
            Route::resource('products', \App\Http\Controllers\Admin\ProductController::class);
            Route::post('products/{product}/toggle-active', [\App\Http\Controllers\Admin\ProductController::class, 'toggleActive'])->name('products.toggle-active');
            Route::post('products/{product}/toggle-featured', [\App\Http\Controllers\Admin\ProductController::class, 'toggleFeatured'])->name('products.toggle-featured');
            Route::post('products/{product}/toggle-approved', [\App\Http\Controllers\Admin\ProductController::class, 'toggleApproved'])->name('products.toggle-approved');

            // Branches Routes
            Route::resource('branches', \App\Http\Controllers\Admin\BranchController::class);
            Route::post('branches/{branch}/toggle-active', [\App\Http\Controllers\Admin\BranchController::class, 'toggleActive'])->name('branches.toggle-active');
            Route::get('branches/by-vendor/{vendorId}', [\App\Http\Controllers\Admin\BranchController::class, 'getBranchesByVendor'])->name('branches.by-vendor');

            // Variant Requests Routes
            Route::get('/variant-requests', [\App\Http\Controllers\VariantRequestController::class, 'index'])->name('variant-requests.index');
            Route::post('/variant-requests/{variantRequest}/approve', [\App\Http\Controllers\VariantRequestController::class, 'approve'])->name('variant-requests.approve');
            Route::post('/variant-requests/{variantRequest}/reject', [\App\Http\Controllers\VariantRequestController::class, 'reject'])->name('variant-requests.reject');

            // Category Requests Routes
            Route::get('/category-requests', [CategoryRequestController::class, 'index'])->name('category-requests.index');
            Route::post('/category-requests/{categoryRequest}/approve', [CategoryRequestController::class, 'approve'])->name('category-requests.approve');
            Route::post('/category-requests/{categoryRequest}/reject', [CategoryRequestController::class, 'reject'])->name('category-requests.reject');

            // Subscriptions Routes
            Route::resource('subscriptions', SubscriptionController::class)->only(['index', 'show']);


        });

        // Vendor Routes
        Route::group(['prefix' => 'vendor', 'as' => 'vendor.', 'middleware' => 'vendor.user'], function () {

            // Vendor Profile (requires edit-profile permission)
            Route::get('/profile', [VendorVendorController::class, 'edit'])->name('profile')->middleware('role_or_permission:vendor|edit-profile');
            Route::put('/profile', [VendorVendorController::class, 'update'])->name('profile.update')->middleware('role_or_permission:vendor|edit-profile');

            // Vendor Dashboard (requires view-dashboard permission)
            Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard')->middleware('role_or_permission:vendor|view-dashboard');

            // Categories (read-only for vendors - requires view-categories permission)
            Route::get('/categories', [\App\Http\Controllers\Vendor\CategoryController::class, 'index'])->name('categories.index')->middleware('role_or_permission:vendor|view-categories');

            // Variants (read-only for vendors - requires view-variants permission)
            Route::get('/variants', [\App\Http\Controllers\Vendor\VariantController::class, 'index'])->name('variants.index')->middleware('role_or_permission:vendor|view-variants');

            // Branches Routes (requires manage-branches or specific branch permissions)
            Route::group(['middleware' => 'role_or_permission:vendor|manage-branches|view-branches'], function () {
                Route::resource('branches', \App\Http\Controllers\Vendor\BranchController::class);
            });
            Route::post('branches/{branch}/toggle-active', [\App\Http\Controllers\Vendor\BranchController::class, 'toggleActive'])->name('branches.toggle-active')->middleware('role_or_permission:vendor|manage-branches|edit-branches');

            // Products Routes (requires manage-products or specific product permissions)
            Route::group(['middleware' => 'role_or_permission:vendor|manage-products|view-products'], function () {
                Route::resource('products', \App\Http\Controllers\Vendor\ProductController::class);
            });
            Route::post('products/{product}/toggle-active', [\App\Http\Controllers\Vendor\ProductController::class, 'toggleActive'])->name('products.toggle-active')->middleware('role_or_permission:vendor|view-products|manage-products|edit-products');
            Route::post('products/{product}/toggle-featured', [\App\Http\Controllers\Vendor\ProductController::class, 'toggleFeatured'])->name('products.toggle-featured')->middleware('role_or_permission:vendor|manage-products|edit-products');
            Route::get('products/branches/by-vendor', [\App\Http\Controllers\Vendor\ProductController::class, 'getBranchesByVendor'])->name('products.branches.by-vendor')->middleware('role_or_permission:vendor|manage-products|create-products|edit-products');

            // Variant Requests (requires create-variant-requests or view-variant-requests permission)
            Route::get('/variant-requests', [\App\Http\Controllers\VariantRequestController::class, 'vendorIndex'])->name('variant-requests.index')->middleware('role_or_permission:vendor|view-variant-requests');
            Route::post('/variant-requests', [\App\Http\Controllers\VariantRequestController::class, 'store'])->name('variant-requests.store')->middleware('role_or_permission:vendor|create-variant-requests');

            // Category Requests (requires create-category-requests or view-category-requests permission)
            Route::get('/category-requests', [CategoryRequestController::class, 'vendorIndex'])->name('category-requests.index')->middleware('role_or_permission:vendor|view-category-requests');
            Route::post('/category-requests', [CategoryRequestController::class, 'store'])->name('category-requests.store')->middleware('role_or_permission:vendor|create-category-requests');

            // Plans Requests (requires view-plans or subscribe-plans permission)
            Route::get('/plans', [PlanController::class, 'vendorIndex'])->name('plans.index')->middleware('role_or_permission:vendor|view-plans');
            Route::post('/plans/subscribe', [PlanController::class, 'subscribe'])->name('plans.subscribe')->middleware('role_or_permission:vendor|subscribe-plans');
            Route::post('/plans/check', [PlanController::class, 'check'])->name('plans.check')->middleware('role_or_permission:vendor|view-plans');

            // Subscriptions Routes (requires view-subscriptions or cancel-subscriptions permission)
            Route::group(['middleware' => 'role_or_permission:vendor|view-subscriptions'], function () {
                Route::resource('subscriptions', VendorSubscriptionController::class)->only(['index', 'show']);
            });
            Route::post('subscriptions/{subscription}/cancel', [VendorSubscriptionController::class, 'cancel'])->name('subscriptions.cancel')->middleware('role_or_permission:vendor|cancel-subscriptions');

            // Vendor Users Routes (requires manage-vendor-users or specific vendor-user permissions)
            Route::group(['middleware' => 'role_or_permission:vendor|manage-vendor-users|view-vendor-users'], function () {
                Route::resource('vendor-users', \App\Http\Controllers\Vendor\VendorUserController::class);
            });
            Route::post('vendor-users/{vendor_user}/toggle-active', [\App\Http\Controllers\Vendor\VendorUserController::class, 'toggleActive'])->name('vendor-users.toggle-active')->middleware('role_or_permission:vendor|manage-vendor-users|edit-vendor-users');

        });

        // Default Dashboard (for users without specific role or fallback)
        Route::get('/', function () {
            if (Auth::check()) {
                $user = Auth::user();

                // Redirect based on role
                if ($user->hasRole('admin')) {
                    return redirect()->route('admin.dashboard');
                } elseif ($user->hasRole('vendor')) {
                    // Check if user has view-dashboard permission
                    if ($user->hasPermissionTo('view-dashboard')) {
                        return redirect()->route('vendor.dashboard');
                    }
                }
            }

            return view('dashboard.index');
        })->name('dashboard');

    });

    // Locale/Language Routes
    Route::get('/locale/{locale}', [LocaleController::class, 'switch'])->name('locale.switch');

    // Vendor Registration Routes (Public)
    Route::get('/vendor/register', [VendorController::class, 'showRegistrationForm'])->name('vendor.register');
    Route::post('/vendor/register', [VendorController::class, 'register'])->name('vendor.register.submit');







    //  Test Routes
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

    Route::get('/security', function () {
        return view('security.security');
    })->name('security');

    Route::get('/help', function () {
        return view('help.help');
    })->name('help');

    require_once 'auth.php';

});
