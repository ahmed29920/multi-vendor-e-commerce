<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\CategoryRequest;
use App\Models\Vendor;
use App\Services\CategoryService;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class DashboardController extends Controller
{
    protected CategoryService $categoryService;

    public function __construct(CategoryService $categoryService)
    {
        $this->categoryService = $categoryService;
    }

    /**
     * Display the vendor dashboard
     */
    public function index(): View
    {
        // Get active categories for display
        $categories = $this->categoryService->getActiveCategories();
        
        // Get vendor information
        $user = Auth::user();
        $vendor = Vendor::where('owner_id', $user->id)->first();

        // Get vendor's category requests
        $categoryRequests = CategoryRequest::where('vendor_id', $vendor->id ?? 0)
            ->with('reviewer')
            ->latest()
            ->get();

        return view('vendor.dashboard', compact('categories', 'vendor', 'categoryRequests'));
    }
}
