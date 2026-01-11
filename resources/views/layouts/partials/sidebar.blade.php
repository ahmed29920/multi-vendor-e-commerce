<!-- Sidebar -->
<aside class="admin-sidebar" id="admin-sidebar">
    <div class="sidebar-content">
        <nav class="sidebar-nav">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link {{ request()->routeIs('dashboard') ? 'active' : '' }}" href="{{ route('dashboard') }}">
                        <i class="bi bi-speedometer2"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{ request()->routeIs('analytics*') ? 'active' : '' }}" href="{{ route('analytics') }}">
                        <i class="bi bi-graph-up"></i>
                        <span>Analytics</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{ request()->routeIs('users*') ? 'active' : '' }}" href="{{ route('users.index') }}">
                        <i class="bi bi-people"></i>
                        <span>Users</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{ request()->routeIs('products*') ? 'active' : '' }}" href="{{ route('products.index') }}">
                        <i class="bi bi-box"></i>
                        <span>Products</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{ request()->routeIs('orders*') ? 'active' : '' }}" href="{{ route('orders.index') }}">
                        <i class="bi bi-bag-check"></i>
                        <span>Orders</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{ request()->routeIs('forms*') ? 'active' : '' }}" href="{{ route('forms') }}">
                        <i class="bi bi-ui-checks"></i>
                        <span>Forms</span>
                        <span class="badge bg-success rounded-pill ms-auto">New</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{ request()->routeIs('elements*') ? 'active' : '' }}" 
                       href="#" 
                       data-bs-toggle="collapse" 
                       data-bs-target="#elementsSubmenu" 
                       aria-expanded="{{ request()->routeIs('elements*') ? 'true' : 'false' }}">
                        <i class="bi bi-puzzle"></i>
                        <span>Elements</span>
                        <span class="badge bg-primary rounded-pill ms-2 me-2">New</span>
                        <i class="bi bi-chevron-down ms-auto"></i>
                    </a>
                    <div class="collapse {{ request()->routeIs('elements*') ? 'show' : '' }}" id="elementsSubmenu">
                        <ul class="nav nav-submenu">
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('elements.index') ? 'active' : '' }}" href="{{ route('elements.index') }}">
                                    <i class="bi bi-grid"></i>
                                    <span>Overview</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('elements.buttons') ? 'active' : '' }}" href="{{ route('elements.buttons') }}">
                                    <i class="bi bi-square"></i>
                                    <span>Buttons</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('elements.alerts') ? 'active' : '' }}" href="{{ route('elements.alerts') }}">
                                    <i class="bi bi-exclamation-triangle"></i>
                                    <span>Alerts</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('elements.badges') ? 'active' : '' }}" href="{{ route('elements.badges') }}">
                                    <i class="bi bi-award"></i>
                                    <span>Badges</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('elements.cards') ? 'active' : '' }}" href="{{ route('elements.cards') }}">
                                    <i class="bi bi-card-text"></i>
                                    <span>Cards</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('elements.modals') ? 'active' : '' }}" href="{{ route('elements.modals') }}">
                                    <i class="bi bi-window"></i>
                                    <span>Modals</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('elements.forms') ? 'active' : '' }}" href="{{ route('elements.forms') }}">
                                    <i class="bi bi-ui-checks"></i>
                                    <span>Forms</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link {{ request()->routeIs('elements.tables') ? 'active' : '' }}" href="{{ route('elements.tables') }}">
                                    <i class="bi bi-table"></i>
                                    <span>Tables</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{ request()->routeIs('reports*') ? 'active' : '' }}" href="{{ route('reports') }}">
                        <i class="bi bi-file-earmark-text"></i>
                        <span>Reports</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{ request()->routeIs('messages*') ? 'active' : '' }}" href="{{ route('messages.index') }}">
                        <i class="bi bi-chat-dots"></i>
                        <span>Messages</span>
                        @if(auth()->check() && method_exists(auth()->user(), 'unreadMessages'))
                            <span class="badge bg-danger rounded-pill ms-auto">{{ auth()->user()->unreadMessages()->count() }}</span>
                        @endif
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{ request()->routeIs('calendar*') ? 'active' : '' }}" href="{{ route('calendar') }}">
                        <i class="bi bi-calendar-event"></i>
                        <span>Calendar</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{ request()->routeIs('files*') ? 'active' : '' }}" href="{{ route('files.index') }}">
                        <i class="bi bi-folder2-open"></i>
                        <span>Files</span>
                    </a>
                </li>
                <li class="nav-item mt-3">
                    <small class="text-muted px-3 text-uppercase fw-bold">Admin</small>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{ request()->routeIs('settings*') ? 'active' : '' }}" href="{{ route('settings') }}">
                        <i class="bi bi-gear"></i>
                        <span>Settings</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{ request()->routeIs('security*') ? 'active' : '' }}" href="{{ route('security') }}">
                        <i class="bi bi-shield-check"></i>
                        <span>Security</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link {{ request()->routeIs('help*') ? 'active' : '' }}" href="{{ route('help') }}">
                        <i class="bi bi-question-circle"></i>
                        <span>Help & Support</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</aside>
