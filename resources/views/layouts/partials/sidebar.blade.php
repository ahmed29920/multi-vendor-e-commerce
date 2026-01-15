<!-- Sidebar -->
<aside class="admin-sidebar" id="admin-sidebar">
    <div class="sidebar-content">
        <nav class="sidebar-nav">
            <ul class="nav flex-column">
                @auth
                    @if(auth()->user()->hasRole('admin'))
                        <!-- Admin Menu -->
                        <li class="nav-item">
                            <a class="nav-link {{ request()->routeIs('admin.dashboard') ? 'active' : '' }}" href="{{ route('admin.dashboard') }}">
                                <i class="bi bi-speedometer2"></i>
                                <span>{{ __('Dashboard') }}</span>
                            </a>
                        </li>

                        <li class="nav-item mt-3">
                            <small class="text-muted px-3 text-uppercase fw-bold">{{ __('Management') }}</small>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ request()->routeIs('admin.categories*') ? 'active' : '' }}" href="{{ route('admin.categories.index') }}">
                                <i class="bi bi-grid"></i>
                                <span>{{ __('Categories') }}</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ request()->routeIs('admin.plans*') ? 'active' : '' }}" href="{{ route('admin.plans.index') }}">
                                <i class="bi bi-credit-card"></i>
                                <span>{{ __('Plans') }}</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ request()->routeIs('admin.vendors*') ? 'active' : '' }}" href="{{ route('admin.vendors.index') }}">
                                <i class="bi bi-people"></i>
                                <span>{{ __('Vendors') }}</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ request()->routeIs('admin.variants*') ? 'active' : '' }}" href="{{ route('admin.variants.index') }}">
                                <i class="bi bi-tags"></i>
                                <span>{{ __('Variants') }}</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ request()->routeIs('admin.products*') ? 'active' : '' }}" href="{{ route('admin.products.index') }}">
                                <i class="bi bi-box-seam"></i>
                                <span>{{ __('Products') }}</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ request()->routeIs('admin.branches*') ? 'active' : '' }}" href="{{ route('admin.branches.index') }}">
                                <i class="bi bi-shop"></i>
                                <span>{{ __('Branches') }}</span>
                            </a>
                        </li>
                        {{-- Vendor Subsc --}}
                        <li class="nav-item">
                            <a class="nav-link {{ request()->routeIs('admin.subscriptions*') ? 'active' : '' }}" href="{{ route('admin.subscriptions.index') }}">
                                <i class="bi bi-credit-card"></i>
                                <span>{{ __('Subscriptions') }}</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ request()->routeIs('admin.category-requests*') ? 'active' : '' }}" href="{{ route('admin.category-requests.index') }}">
                                <i class="bi bi-inbox"></i>
                                <span>{{ __('Category Requests') }}</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ request()->routeIs('admin.variant-requests*') ? 'active' : '' }}" href="{{ route('admin.variant-requests.index') }}">
                                <i class="bi bi-inbox"></i>
                                <span>{{ __('Variant Requests') }}</span>
                            </a>
                        </li>

                        <li class="nav-item mt-3">
                            <small class="text-muted px-3 text-uppercase fw-bold">{{ __('System') }}</small>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ request()->routeIs('admin.settings*') ? 'active' : '' }}" href="{{ route('admin.settings') }}">
                                <i class="bi bi-gear"></i>
                                <span>{{ __('Settings') }}</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ request()->routeIs('security*') ? 'active' : '' }}" href="{{ route('security') }}">
                                <i class="bi bi-shield-check"></i>
                                <span>{{ __('Security') }}</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ request()->routeIs('help*') ? 'active' : '' }}" href="{{ route('help') }}">
                                <i class="bi bi-question-circle"></i>
                                <span>{{ __('Help & Support') }}</span>
                            </a>
                        </li>

                    @elseif(auth()->user()->hasRole('vendor') || auth()->user()->hasRole('vendor_employee'))
                        <!-- Vendor Menu -->
                        @if(vendorCan('view-dashboard'))
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('vendor.dashboard') ? 'active' : '' }}" href="{{ route('vendor.dashboard') }}">
                                    <i class="bi bi-speedometer2"></i>
                                    <span>{{ __('Dashboard') }}</span>
                                </a>
                            </li>
                        @endif

                        @if(vendorCan('view-categories') || vendorCan('view-products') || vendorCan('view-branches'))
                            <li class="nav-item mt-3">
                                <small class="text-muted px-3 text-uppercase fw-bold">{{ __('Products') }}</small>
                            </li>
                        @endif
                        @if(vendorCan('view-categories'))
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('vendor.categories*') ? 'active' : '' }}" href="{{ route('vendor.categories.index') }}">
                                    <i class="bi bi-grid"></i>
                                    <span>{{ __('Categories') }}</span>
                                </a>
                            </li>
                        @endif
                        @if(vendorCan('view-variants'))
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('vendor.variants*') ? 'active' : '' }}" href="{{ route('vendor.variants.index') }}">
                                    <i class="bi bi-tags"></i>
                                    <span>{{ __('Variants') }}</span>
                                </a>
                            </li>
                        @endif
                        @if(vendorCan('view-branches') || vendorCan('manage-branches'))
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('vendor.branches*') ? 'active' : '' }}" href="{{ route('vendor.branches.index') }}">
                                    <i class="bi bi-shop"></i>
                                    <span>{{ __('My Branches') }}</span>
                                </a>
                            </li>
                        @endif
                        @if(vendorCan('view-products') || vendorCan('manage-products'))
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('vendor.products*') ? 'active' : '' }}" href="{{ route('vendor.products.index') }}">
                                    <i class="bi bi-box-seam"></i>
                                    <span>{{ __('My Products') }}</span>
                                </a>
                            </li>
                        @endif
                        <li class="nav-item">
                            <a class="nav-link {{ request()->routeIs('orders*') ? 'active' : '' }}" href="{{ route('orders.index') }}">
                                <i class="bi bi-cart-check"></i>
                                <span>{{ __('Orders') }}</span>
                            </a>
                        </li>
                        @if(setting('profit_type') == 'subscription' && vendorCan('view-plans'))
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('vendor.plans*') ? 'active' : '' }}" href="{{ route('vendor.plans.index') }}">
                                    <i class="bi bi-credit-card"></i>
                                    <span>{{ __('Plans') }}</span>
                                </a>
                            </li>
                        @endif
                        @if(vendorCan('view-subscriptions') || vendorCan('cancel-subscriptions'))
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('vendor.subscriptions*') ? 'active' : '' }}" href="{{ route('vendor.subscriptions.index') }}">
                                    <i class="bi bi-credit-card"></i>
                                    <span>{{ __('Subscriptions') }}</span>
                                </a>
                            </li>
                        @endif

                        @if(vendorCan('view-vendor-users') || vendorCan('manage-vendor-users') || vendorCan('edit-profile') || vendorCan('view-category-requests') || vendorCan('view-variant-requests'))
                            <li class="nav-item mt-3">
                                <small class="text-muted px-3 text-uppercase fw-bold">{{ __('Account') }}</small>
                            </li>
                        @endif
                        @if(vendorCan('view-vendor-users') || vendorCan('manage-vendor-users'))
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('vendor.vendor-users*') ? 'active' : '' }}" href="{{ route('vendor.vendor-users.index') }}">
                                    <i class="bi bi-people"></i>
                                    <span>{{ __('Vendor Users') }}</span>
                                </a>
                            </li>
                        @endif
                        @if(vendorCan('edit-profile'))
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('profile*') ? 'active' : '' }}" href="{{ route('profile') }}">
                                    <i class="bi bi-person"></i>
                                    <span>{{ __('Profile') }}</span>
                                </a>
                            </li>
                        @endif
                        @if(vendorCan('view-category-requests') || vendorCan('create-category-requests'))
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('vendor.category-requests*') ? 'active' : '' }}" href="{{ route('vendor.category-requests.index') }}">
                                    <i class="bi bi-inbox"></i>
                                    <span>{{ __('Category Requests') }}</span>
                                </a>
                            </li>
                        @endif
                        @if(vendorCan('view-variant-requests') || vendorCan('create-variant-requests'))
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('vendor.variant-requests*') ? 'active' : '' }}" href="{{ route('vendor.variant-requests.index') }}">
                                    <i class="bi bi-inbox"></i>
                                    <span>{{ __('Variant Requests') }}</span>
                                </a>
                            </li>
                        @endif
                        <li class="nav-item">
                            <a class="nav-link {{ request()->routeIs('reports*') ? 'active' : '' }}" href="{{ route('reports') }}">
                                <i class="bi bi-graph-up"></i>
                                <span>{{ __('Reports') }}</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ request()->routeIs('help*') ? 'active' : '' }}" href="{{ route('help') }}">
                                <i class="bi bi-question-circle"></i>
                                <span>{{ __('Help & Support') }}</span>
                            </a>
                        </li>

                    @else
                        <!-- Default Menu (for users without specific role) -->
                        <li class="nav-item">
                            <a class="nav-link {{ request()->routeIs('dashboard') ? 'active' : '' }}" href="{{ route('dashboard') }}">
                                <i class="bi bi-speedometer2"></i>
                                <span>{{ __('Dashboard') }}</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link {{ request()->routeIs('profile*') ? 'active' : '' }}" href="{{ route('profile') }}">
                                <i class="bi bi-person"></i>
                                <span>{{ __('Profile') }}</span>
                            </a>
                        </li>
                    @endif
                @endauth
            </ul>
        </nav>
    </div>
</aside>
