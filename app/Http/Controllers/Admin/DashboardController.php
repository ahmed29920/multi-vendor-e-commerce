<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CategoryRequest;
use Illuminate\View\View;

class DashboardController extends Controller
{
    /**
     * Display the admin dashboard
     */
    public function index(): View
    {
        // Get category requests
        $pendingRequests = CategoryRequest::with(['vendor', 'reviewer'])
            ->pending()
            ->latest()
            ->take(10)
            ->get();
        
        $recentRequests = CategoryRequest::with(['vendor', 'reviewer'])
            ->whereIn('status', ['approved', 'rejected'])
            ->latest()
            ->take(5)
            ->get();

        return view('admin.dashboard', compact('pendingRequests', 'recentRequests'));
    }
}
