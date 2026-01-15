<?php

namespace App\Http\Controllers;

use App\Http\Requests\Admin\Categories\CreateRequest;
use App\Http\Requests\Admin\Categories\UpdateRequest;
use App\Models\Category;
use App\Services\CategoryService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class CategoryController extends Controller
{
    protected CategoryService $service;

    public function __construct(CategoryService $service)
    {
        $this->service = $service;
    }

    public function index(): View|JsonResponse
    {
        $filters = [
            'search' => request()->get('search', ''),
            'status' => request()->get('status', ''),
            'featured' => request()->get('featured', ''),
            'parent_id' => request()->get('parent_id', ''),
        ];

        $categories = $this->service->getPaginatedCategories(15, $filters);

        // If AJAX request, return JSON
        if (request()->ajax() || request()->wantsJson()) {
            return response()->json([
                'html' => view('admin.categories.partials.table', compact('categories'))->render(),
                'pagination' => view('admin.categories.partials.pagination', compact('categories'))->render(),
            ]);
        }

        // Get all categories for parent filter dropdown
        $allCategories = $this->service->getCategoryTree();

        return view('admin.categories.index', compact('categories', 'allCategories', 'filters'));
    }

    public function create(): View
    {
        $allCategories = $this->service->getCategoryTree();

        return view('admin.categories.create', compact('allCategories'));
    }

    public function store(CreateRequest $request): RedirectResponse
    {
        try {
            $this->service->createCategory($request);

            return redirect()->route('admin.categories.index')
                ->with('success', 'Category created successfully.');
        } catch (\Exception $e) {
            return redirect()->back()
                ->withInput()
                ->with('error', 'Failed to create category: '.$e->getMessage());
        }
    }

    public function show(Category $category): View
    {
        $category = $this->service->getCategoryById($category->id);

        return view('admin.categories.show', compact('category'));
    }

    public function edit(Category $category): View
    {
        $category = $this->service->getCategoryById($category->id);
        $allCategories = $this->service->getCategoryTree()
            ->filter(fn ($cat) => $cat->id !== $category->id);

        return view('admin.categories.edit', compact('category', 'allCategories'));
    }

    public function update(UpdateRequest $request, Category $category): RedirectResponse
    {
        try {
            $this->service->updateCategory($request, $category);

            return redirect()->route('admin.categories.index')
                ->with('success', 'Category updated successfully.');
        } catch (\Exception $e) {
            return redirect()->back()
                ->withInput()
                ->with('error', 'Failed to update category: '.$e->getMessage());
        }
    }

    public function destroy(Category $category): RedirectResponse|JsonResponse
    {
        try {
            $this->service->deleteCategory($category);

            if (request()->wantsJson() || request()->ajax()) {
                return response()->json([
                    'success' => true,
                    'message' => __('Category deleted successfully.')
                ]);
            }

            return redirect()->route('admin.categories.index')
                ->with('success', 'Category deleted successfully.');
        } catch (\Exception $e) {
            if (request()->wantsJson() || request()->ajax()) {
                return response()->json([
                    'success' => false,
                    'message' => __('Failed to delete category: :error', ['error' => $e->getMessage()])
                ], 422);
            }

            return redirect()->back()
                ->with('error', 'Failed to delete category: '.$e->getMessage());
        }
    }
}
