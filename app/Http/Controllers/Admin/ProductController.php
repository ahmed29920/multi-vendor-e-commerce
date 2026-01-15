<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\Products\CreateRequest;
use App\Http\Requests\Admin\Products\UpdateRequest;
use App\Models\Product;
use App\Services\ProductService;
use App\Services\CategoryService;
use App\Services\VendorService;
use App\Services\VariantService;
use App\Services\BranchService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class ProductController extends Controller
{
    protected ProductService $service;
    protected CategoryService $categoryService;
    protected VendorService $vendorService;
    protected VariantService $variantService;
    protected BranchService $branchService;

    public function __construct(
        ProductService $service,
        CategoryService $categoryService,
        VendorService $vendorService,
        VariantService $variantService,
        BranchService $branchService
    ) {
        $this->service = $service;
        $this->categoryService = $categoryService;
        $this->vendorService = $vendorService;
        $this->variantService = $variantService;
        $this->branchService = $branchService;
    }

    /**
     * Display a listing of the products.
     */
    public function index(): View|JsonResponse
    {
        $filters = [
            'search' => request()->get('search', ''),
            'status' => request()->get('status', ''),
            'featured' => request()->get('featured', ''),
            'approved' => request()->get('approved', ''),
            'type' => request()->get('type', ''),
            'vendor_id' => request()->get('vendor_id', ''),
            'category_id' => request()->get('category_id', ''),
            'stock' => request()->get('stock', ''),
        ];

        $products = $this->service->getPaginatedProducts(15, $filters);

        // If AJAX request, return JSON
        if (request()->ajax() || request()->wantsJson()) {
            return response()->json([
                'html' => view('admin.products.partials.table', compact('products'))->render(),
                'pagination' => view('admin.products.partials.pagination', compact('products'))->render(),
            ]);
        }

        $categories = $this->categoryService->getCategoryTree();
        $vendors = $this->vendorService->getActiveVendors();
        return view('admin.products.index', compact('products', 'filters', 'categories', 'vendors'));
    }

    /**
     * Show the form for creating a new product.
     */
    public function create(): View
    {
        $categories = $this->categoryService->getCategoryTree();
        $vendors = $this->vendorService->getActiveVendors();
        $variants = $this->variantService->getActiveVariants()->load('options'); // Load options with variants
        $allProducts = $this->service->getAllProducts(); // For related products selection
        return view('admin.products.create', compact('categories', 'vendors', 'variants', 'allProducts'));
    }

    /**
     * Store a newly created product in storage.
     */
    public function store(CreateRequest $request): RedirectResponse
    {
        // try {
            $this->service->createProduct($request);

            return redirect()->route('admin.products.index')
                ->with('success', __('Product created successfully.'));
        // } catch (\Exception $e) {
        //     return redirect()->back()
        //         ->withInput()
        //         ->with('error', __('Failed to create product: :error', ['error' => $e->getMessage()]));
        // }
    }

    /**
     * Display the specified product.
     */
    public function show(Product $product): View
    {
        $product = $this->service->getProductById($product->id);
        return view('admin.products.show', compact('product'));
    }

    /**
     * Show the form for editing the specified product.
     */
    public function edit(Product $product): View
    {
        $product = $this->service->getProductById($product->id);
        $categories = $this->categoryService->getCategoryTree();
        $vendors = $this->vendorService->getActiveVendors();
        $variants = $this->variantService->getActiveVariants()->load('options'); // Load options with variants
        $allProducts = $this->service->getAllProducts(); // For related products selection

        // Load product relationships for editing
        $product->load([
            'variants.values.variantOption',
            'images',
            'categories',
            'relations',
            'branchProductStocks',
            'variants.branchVariantStocks'
        ]);

        return view('admin.products.edit', compact('product', 'categories', 'vendors', 'variants', 'allProducts'));
    }

    /**
     * Update the specified product in storage.
     */
    public function update(UpdateRequest $request, Product $product): RedirectResponse
    {
        try {
            $this->service->updateProduct($request, $product);

            return redirect()->route('admin.products.index')
                ->with('success', __('Product updated successfully.'));
        } catch (\Exception $e) {
            return redirect()->back()
                ->withInput()
                ->with('error', __('Failed to update product: :error', ['error' => $e->getMessage()]));
        }
    }

    /**
     * Remove the specified product from storage.
     */
    public function destroy(Product $product): RedirectResponse|JsonResponse
    {
        try {
            $this->service->deleteProduct($product);

            if (request()->wantsJson() || request()->ajax()) {
                return response()->json([
                    'success' => true,
                    'message' => __('Product deleted successfully.')
                ]);
            }

            return redirect()->route('admin.products.index')
                ->with('success', __('Product deleted successfully.'));
        } catch (\Exception $e) {
            if (request()->wantsJson() || request()->ajax()) {
                return response()->json([
                    'success' => false,
                    'message' => __('Failed to delete product: :error', ['error' => $e->getMessage()])
                ], 422);
            }

            return redirect()->back()
                ->with('error', __('Failed to delete product: :error', ['error' => $e->getMessage()]));
        }
    }

    /**
     * Toggle product active status.
     */
    public function toggleActive(Product $product): JsonResponse
    {
        try {
            $product = $this->service->toggleActive($product);

            return response()->json([
                'success' => true,
                'message' => __('Product status updated successfully.'),
                'product' => $product,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => __('Failed to update product status: :error', ['error' => $e->getMessage()])
            ], 422);
        }
    }

    /**
     * Toggle product featured status.
     */
    public function toggleFeatured(Product $product): JsonResponse
    {
        try {
            $product = $this->service->toggleFeatured($product);

            return response()->json([
                'success' => true,
                'message' => __('Product featured status updated successfully.'),
                'product' => $product,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => __('Failed to update product featured status: :error', ['error' => $e->getMessage()])
            ], 422);
        }
    }

    /**
     * Toggle product approved status.
     */
    public function toggleApproved(Product $product): JsonResponse
    {
        try {
            $product = $this->service->toggleApproved($product);

            return response()->json([
                'success' => true,
                'message' => __('Product approval status updated successfully.'),
                'product' => $product,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => __('Failed to update product approval status: :error', ['error' => $e->getMessage()])
            ], 422);
        }
    }
}
