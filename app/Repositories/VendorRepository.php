<?php

namespace App\Repositories;

use App\Models\Vendor;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;

class VendorRepository
{
    /**
     * Get all vendors
     */
    public function getAllVendors(): Collection
    {
        return Vendor::with(['owner', 'plan'])->get();
    }

    /**
     * Get paginated vendors
     */
    public function getPaginatedVendors(int $perPage = 15, array $filters = []): LengthAwarePaginator
    {
        $query = Vendor::with(['owner', 'plan']);

        // Apply search filter
        if (!empty($filters['search'])) {
            $search = trim($filters['search']);
            $query->where(function ($q) use ($search) {
                $q->whereRaw("JSON_EXTRACT(name, '$.en') LIKE ?", ["%{$search}%"])
                  ->orWhereRaw("JSON_EXTRACT(name, '$.ar') LIKE ?", ["%{$search}%"])
                  ->orWhere('phone', 'like', "%{$search}%")
                  ->orWhere('address', 'like', "%{$search}%")
                  ->orWhereHas('owner', function ($ownerQuery) use ($search) {
                      $ownerQuery->where('name', 'like', "%{$search}%")
                                  ->orWhere('email', 'like', "%{$search}%");
                  });
            });
        }

        // Apply status filter
        if (isset($filters['status']) && $filters['status'] !== '') {
            $query->where('is_active', $filters['status'] === 'active');
        }

        // Apply featured filter
        if (isset($filters['featured']) && $filters['featured'] !== '') {
            $query->where('is_featured', $filters['featured'] === '1');
        }

        // Apply plan filter
        if (isset($filters['plan_id']) && $filters['plan_id'] !== '') {
            $query->where('plan_id', $filters['plan_id']);
        }

        return $query->latest()->paginate($perPage);
    }

    /**
     * Get vendor by ID
     */
    public function getVendorById(int $id): ?Vendor
    {
        return Vendor::with(['owner', 'plan', 'subscriptions', 'products', 'branches'])->find($id);
    }

    /**
     * Get vendor by slug
     */
    public function getVendorBySlug(string $slug): ?Vendor
    {
        return Vendor::with(['owner', 'plan', 'subscriptions'])->where('slug', $slug)->first();
    }

    /**
     * Get active vendors
     */
    public function getActiveVendors(): Collection
    {
        return Vendor::where('is_active', true)->with(['owner', 'plan'])->get();
    }

    /**
     * Get featured vendors
     */
    public function getFeaturedVendors(): Collection
    {
        return Vendor::where('is_featured', true)
            ->where('is_active', true)
            ->with(['owner', 'plan'])
            ->get();
    }

    /**
     * Get vendors by owner
     */
    public function getVendorsByOwner(int $ownerId): Collection
    {
        return Vendor::where('owner_id', $ownerId)->with(['plan'])->get();
    }

    /**
     * Get vendors by plan
     */
    public function getVendorsByPlan(int $planId): Collection
    {
        return Vendor::where('plan_id', $planId)->with(['owner'])->get();
    }

    /**
     * Create a new vendor
     */
    public function create(array $data): Vendor
    {
        return Vendor::create($data);
    }

    /**
     * Update a vendor
     */
    public function update(Vendor $vendor, array $data): bool
    {
        return $vendor->update($data);
    }

    /**
     * Delete a vendor (soft delete)
     */
    public function delete(Vendor $vendor): bool
    {
        return $vendor->delete();
    }

    /**
     * Force delete a vendor
     */
    public function forceDelete(Vendor $vendor): bool
    {
        return $vendor->forceDelete();
    }

    /**
     * Restore a soft deleted vendor
     */
    public function restore(Vendor $vendor): bool
    {
        return $vendor->restore();
    }

    /**
     * Search vendors
     */
    public function search(string $search): Collection
    {
        return Vendor::where(function ($q) use ($search) {
            $q->whereRaw("JSON_EXTRACT(name, '$.en') LIKE ?", ["%{$search}%"])
              ->orWhereRaw("JSON_EXTRACT(name, '$.ar') LIKE ?", ["%{$search}%"])
              ->orWhere('phone', 'like', "%{$search}%")
              ->orWhere('address', 'like', "%{$search}%");
        })
        ->with(['owner', 'plan'])
        ->get();
    }

    /**
     * Check if owner already has a vendor
     */
    public function ownerHasVendor(int $ownerId): bool
    {
        return Vendor::where('owner_id', $ownerId)->exists();
    }

    /**
     * Get vendor by owner ID
     */
    public function getVendorByOwner(int $ownerId): ?Vendor
    {
        return Vendor::where('owner_id', $ownerId)->with(['plan'])->first();
    }
}
