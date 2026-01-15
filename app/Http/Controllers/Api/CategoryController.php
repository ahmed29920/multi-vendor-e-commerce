<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\CategoryResource;
use Illuminate\Http\Request;
use App\Services\CategoryService;
use Illuminate\Http\JsonResponse;

class CategoryController extends Controller
{
    protected CategoryService $service;

    public function __construct(CategoryService $service)
    {
        $this->service = $service;
    }

    public function index()
    {
        $perPage = request()->get('per_page', 15);
        $filters = request()->get('filters', [
            'search' => request()->get('search'),
            'status' => request()->get('status'),
            'featured' => request()->get('featured'),
            'parent_id' => request()->get('parent_id'),
        ]);
        $categories = $this->service->getPaginatedCategories($perPage, $filters);
        return CategoryResource::collection($categories);
    }
    public function show($id)
    {
        $category = $this->service->getCategoryById($id);
        return new CategoryResource($category);
    }
}
