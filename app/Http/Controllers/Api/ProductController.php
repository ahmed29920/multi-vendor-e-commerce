<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\ProductResource;
use App\Services\ProductService;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    protected ProductService $service;

    public function __construct(ProductService $service)
    {
        $this->service = $service;
    }

    public function index()
    {
        $perPage = request()->get('per_page', 15);
        $filters = [
            'search' => request()->get('search', ''),
            'featured' => request()->get('featured', ''),
            'vendor_id' => request()->get('vendor_id', ''),
            'category_id' => request()->get('category_id', ''),
            'approved' => 1,
        ];
        $products = $this->service->getPaginatedProducts($perPage, $filters);
        return ProductResource::collection($products);
    }
    public function show($id)
    {
        $product = $this->service->getProductById($id);
        return new ProductResource($product);
    }
}
