<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Http\Requests\Vendor\Products\CreateRequest;
use App\Http\Requests\Vendor\Products\UpdateRequest;
use App\Models\Product;
use App\Models\Vendor;
use App\Services\ProductService;
use App\Services\CategoryService;
use App\Services\VariantService;
use App\Services\BranchService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class ProductController extends Controller
{
    protected ProductService $service;
    protected CategoryService $categoryService;
    protected VariantService $variantService;
    protected BranchService $branchService;

    public function __construct(
        ProductService $service,
        CategoryService $categoryService,
        VariantService $variantService,
        BranchService $branchService
    ) {
        $this->service = $service;
        $this->categoryService = $categoryService;
        $this->variantService = $variantService;
        $this->branchService = $branchService;
    }

    /**
     * Get the vendor for the authenticated user
     */
    protected function getVendor(): ?Vendor
    {
        return Auth::user()->vendor();

    }

    /**
     * Display a listing of the vendor's products.
     */
    public function index(): View|JsonResponse
    {

        $vendor = $this->getVendor();

        if (!$vendor) {
            abort(404, __('Vendor account not found.'));
        }

        $filters = [
            'search' => request()->get('search', ''),
            'status' => request()->get('status', ''),
            'featured' => request()->get('featured', ''),
            'approved' => request()->get('approved', ''),
            'type' => request()->get('type', ''),
            'vendor_id' => $vendor->id, // Force filter by vendor
            'category_id' => request()->get('category_id', ''),
            'stock' => request()->get('stock', ''),
        ];

        $products = $this->service->getPaginatedProducts(15, $filters);

        // If AJAX request, return JSON
        if (request()->ajax() || request()->wantsJson()) {
            return response()->json([
                'html' => view('vendor.products.partials.table', compact('products'))->render(),
                'pagination' => view('vendor.products.partials.pagination', compact('products'))->render(),
            ]);
        }

        $categories = $this->categoryService->getCategoryTree();

        $can_add_products = setting('profit_type') == 'subscription' ? $vendor->plan->max_products_count > $vendor->products()->active()->count() : true;
        return view('vendor.products.index', compact('products', 'filters', 'categories', 'vendor', 'can_add_products'));
    }

    /**
     * Show the form for creating a new product.
     */
    public function create(): RedirectResponse|View
    {
        $vendor = $this->getVendor();

        if (!$vendor) {
            abort(404, __('Vendor account not found.'));
        }
        $can_add_products = setting('profit_type') == 'subscription' ? $vendor->plan->max_products_count > $vendor->products()->active()->count() : true;

        if (!$can_add_products) {
            return redirect()->route('vendor.products.index')
                ->with('error', __('You have reached the maximum number of products. Please delete or deactivate some products to add a new one.'));
        }

        $categories = $this->categoryService->getCategoryTree();
        $variants = $this->variantService->getActiveVariants()->load('options');
        $allProducts = $this->service->getProductsByVendor($vendor->id); // Only vendor's own products for related
        $can_feature_products = setting('profit_type') == 'subscription' ? $vendor->plan->can_feature_products : true;

        return view('vendor.products.create', compact('categories', 'variants', 'allProducts', 'vendor', 'can_feature_products'));
    }

    /**
     * Store a newly created product in storage.
     */
    public function store(CreateRequest $request): RedirectResponse
    {
        try {
            $vendor = $this->getVendor();

            if (!$vendor) {
                return redirect()->back()
                    ->with('error', __('Vendor account not found. Please contact administrator.'));
            }

            // Force vendor_id to be the authenticated vendor's ID
            $request->merge(['vendor_id' => $vendor->id]);

            $this->service->createProduct($request);

            return redirect()->route('vendor.products.index')
                ->with('success', __('Product created successfully.'));
        } catch (\Exception $e) {
            return redirect()->back()
                ->withInput()
                ->with('error', __('Failed to create product: :error', ['error' => $e->getMessage()]));
        }
    }

    /**
     * Display the specified product.
     */
    public function show(Product $product): View
    {
        $vendor = $this->getVendor();

        if (!$vendor) {
            abort(404, __('Vendor account not found.'));
        }

        // Ensure the product belongs to this vendor
        if ($product->vendor_id !== $vendor->id) {
            abort(403, __('You do not have permission to view this product.'));
        }

        $product = $this->service->getProductById($product->id);
        return view('vendor.products.show', compact('product', 'vendor'));
    }

    /**
     * Show the form for editing the specified product.
     */
    public function edit(Product $product): View
    {
        $vendor = $this->getVendor();

        if (!$vendor) {
            abort(404, __('Vendor account not found.'));
        }

        // Ensure the product belongs to this vendor
        if ($product->vendor_id !== $vendor->id) {
            abort(403, __('You do not have permission to edit this product.'));
        }

        $product = $this->service->getProductById($product->id);
        $categories = $this->categoryService->getCategoryTree();
        $variants = $this->variantService->getActiveVariants()->load('options');
        $allProducts = $this->service->getProductsByVendor($vendor->id); // Only vendor's own products for related products

        // Load product relationships for editing
        $product->load([
            'variants.values.variantOption',
            'images',
            'categories',
            'relations',
            'branchProductStocks',
            'variants.branchVariantStocks'
        ]);

        // Prepare existing product data for JavaScript (same as admin)
        $existingVariations = [];
        $selectedVariantOptions = [];
        if ($product->type === 'variable' && $product->variants) {
            foreach ($product->variants as $variant) {
                $optionIds = [];
                $variantId = null;
                foreach ($variant->values as $value) {
                    if ($value->variantOption) {
                        $variantId = $value->variantOption->variant_id;
                        $optionIds[] = $value->variant_option_id;
                    }
                }
                if (!empty($optionIds) && $variantId) {
                    if (!isset($selectedVariantOptions[$variantId])) {
                        $selectedVariantOptions[$variantId] = [];
                    }
                    $selectedVariantOptions[$variantId] = array_unique(array_merge($selectedVariantOptions[$variantId], $optionIds));
                }

                // Prepare variation data
                $branchStocks = [];
                if ($variant->branchVariantStocks) {
                    foreach ($variant->branchVariantStocks as $stock) {
                        $branchStocks[$stock->branch_id] = $stock->quantity;
                    }
                }

                $values = [];
                foreach ($variant->values as $value) {
                    if ($value->variantOption) {
                        $values[] = [
                            'variant_id' => $value->variantOption->variant_id,
                            'option_id' => $value->variant_option_id
                        ];
                    }
                }

                $existingVariations[] = [
                    'name' => $variant->getTranslation('name', app()->getLocale()),
                    'name_en' => $variant->getTranslation('name', 'en'),
                    'name_ar' => $variant->getTranslation('name', 'ar'),
                    'sku' => $variant->sku,
                    'price' => $variant->price,
                    'thumbnailPreview' => $variant->thumbnail ? $variant->thumbnail : null,
                    'thumbnailFile' => null,
                    'values' => $values,
                    'branchStocks' => $branchStocks,
                ];
            }
        }

        // Prepare branch stocks for simple products
        $branchStocksData = [];
        if ($product->type === 'simple' && $product->branchProductStocks) {
            foreach ($product->branchProductStocks as $stock) {
                $branchStocksData[$stock->branch_id] = $stock->quantity;
            }
        }

        // Prepare related products
        $relatedProductsIds = $product->relations()->where('type', 'related')->pluck('related_product_id')->toArray();
        $crossSellProductsIds = $product->relations()->where('type', 'cross_sell')->pluck('related_product_id')->toArray();
        $upsellProductsIds = $product->relations()->where('type', 'upsell')->pluck('related_product_id')->toArray();

        $can_feature_products = setting('profit_type') == 'subscription' ? $vendor->plan->can_feature_products : true;
        return view('vendor.products.edit', compact(
            'product',
            'categories',
            'variants',
            'allProducts',
            'vendor',
            'existingVariations',
            'selectedVariantOptions',
            'branchStocksData',
            'relatedProductsIds',
            'crossSellProductsIds',
            'upsellProductsIds',
            'can_feature_products'
        ));
    }

    /**
     * Update the specified product in storage.
     */
    public function update(UpdateRequest $request, Product $product): RedirectResponse
    {
        try {
            $vendor = $this->getVendor();

            if (!$vendor) {
                return redirect()->back()
                    ->with('error', __('Vendor account not found. Please contact administrator.'));
            }

            // Ensure the product belongs to this vendor
            if ($product->vendor_id !== $vendor->id) {
                abort(403, __('You do not have permission to update this product.'));
            }

            // Force vendor_id to be the authenticated vendor's ID
            $request->merge(['vendor_id' => $vendor->id]);

            $can_feature_products = setting('profit_type') == 'subscription' ? $vendor->plan->can_feature_products : true;
            if (!$can_feature_products && $request->boolean('is_featured', $product->is_featured)) {
                return redirect()->back()
                    ->with('error', __('You are not allowed to feature products. Please subscribe to a plan that allows you to feature products.'));
            }
            $can_add_products = setting('profit_type') == 'subscription' ? $vendor->plan->max_products_count > $vendor->products()->active()->count() : true;
            if (!$can_add_products && $request->boolean('is_active', $product->is_active)) {
                return redirect()->back()
                    ->with('error', __('You have reached the maximum number of products. Please delete or deactivate some products to add a new one.'));
            }

            $this->service->updateProduct($request, $product);

            return redirect()->route('vendor.products.index')
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
            $vendor = $this->getVendor();

            if (!$vendor) {
                return redirect()->back()
                    ->with('error', __('Vendor account not found. Please contact administrator.'));
            }

            // Ensure the product belongs to this vendor
            if ($product->vendor_id !== $vendor->id) {
                abort(403, __('You do not have permission to delete this product.'));
            }

            $this->service->deleteProduct($product);

            if (request()->wantsJson() || request()->ajax()) {
                return response()->json([
                    'success' => true,
                    'message' => __('Product deleted successfully.')
                ]);
            }

            return redirect()->route('vendor.products.index')
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
            $vendor = $this->getVendor();

            if (!$vendor) {
                return response()->json([
                    'success' => false,
                    'message' => __('Vendor account not found.'),
                ], 404);
            }

            // Ensure the product belongs to this vendor
            if ($product->vendor_id !== $vendor->id) {
                return response()->json([
                    'success' => false,
                    'message' => __('You do not have permission to update this product.'),
                ], 403);
            }

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
            $vendor = $this->getVendor();

            if (!$vendor) {
                return response()->json([
                    'success' => false,
                    'message' => __('Vendor account not found.'),
                ], 404);
            }

            // Ensure the product belongs to this vendor
            if ($product->vendor_id !== $vendor->id) {
                return response()->json([
                    'success' => false,
                    'message' => __('You do not have permission to update this product.'),
                ], 403);
            }

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
     * Get branches by vendor ID (AJAX) - for vendor's own branches
     */
    public function getBranchesByVendor(): JsonResponse
    {
        try {
            $vendor = $this->getVendor();

            if (!$vendor) {
                return response()->json([
                    'success' => false,
                    'message' => __('Vendor account not found.'),
                ], 404);
            }

            $branches = $this->branchService->getBranchesByVendor($vendor->id);

            return response()->json([
                'success' => true,
                'branches' => $branches->map(function ($branch) {
                    return [
                        'id' => $branch->id,
                        'name' => $branch->name,
                    ];
                }),
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => __('Failed to load branches: :error', ['error' => $e->getMessage()]),
            ], 500);
        }
    }
}
