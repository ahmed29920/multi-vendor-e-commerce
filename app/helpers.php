<?php

if (!function_exists('setting')) {
    /**
     * Get a setting value by key
     *
     * This function retrieves settings from Redis cache first,
     * and falls back to database if not found in cache.
     *
     * @param string $key The setting key
     * @param mixed $default Default value if setting doesn't exist
     * @return mixed The setting value or default
     */
    function setting(string $key, $default = null)
    {
        $cacheKey = "setting:{$key}";

        // Try to get from cache first
        $value = \Illuminate\Support\Facades\Cache::remember($cacheKey, 3600, function () use ($key, $default) {
            $setting = \App\Models\Setting::where('key', $key)->first();
            return $setting ? $setting->value : $default;
        });

        // If value is null and default is provided, return default
        return $value ?? $default;
    }
}

if (!function_exists('settings')) {
    /**
     * Get all settings as an associative array
     *
     * @return array
     */
    function settings(): array
    {
        return \Illuminate\Support\Facades\Cache::remember('settings:all', 3600, function () {
            return \App\Models\Setting::pluck('value', 'key')->toArray();
        });
    }
}

if (!function_exists('vendorCan')) {
    /**
     * Check if vendor user has permission
     * Vendor role has all permissions automatically
     *
     * @param string $permission The permission name
     * @return bool
     */
    function vendorCan(string $permission): bool
    {
        $user = auth()->user();

        if (!$user) {
            return false;
        }

        // Admin has all permissions
        if ($user->hasRole('admin')) {
            return true;
        }

        // Vendor role has all permissions
        if ($user->hasRole('vendor')) {
            return true;
        }

        // Vendor employee needs specific permission
        if ($user->hasRole('vendor_employee')) {
            return $user->hasPermissionTo($permission);
        }

        return false;
    }
}
