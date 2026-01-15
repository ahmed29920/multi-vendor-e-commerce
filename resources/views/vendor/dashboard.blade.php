@extends('layouts.app')

@php
    $page = 'dashboard';
@endphp

@php
    use Illuminate\Support\Str;
@endphp

@section('title', __('Vendor Dashboard'))

@section('content')
    <div class="container-fluid p-4 p-lg-4">
        <!-- Success/Error Messages -->
        @if(session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="bi bi-check-circle me-2"></i>{{ session('success') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif

        @if(session('error'))
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="bi bi-exclamation-circle me-2"></i>{{ session('error') }}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        @endif

        <!-- Page Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h1 class="h3 mb-0">{{ __('Vendor Dashboard') }}</h1>
                <p class="text-muted mb-0">{{ __('Welcome back! Here\'s what\'s happening.') }}</p>
            </div>
        </div>


        <!-- Stats Cards -->
        <div class="row g-4 mb-4">
            <div class="col-xl-3 col-lg-6">
                <div class="card stats-card">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-shrink-0">
                                <div class="stats-icon bg-primary bg-opacity-10 text-primary">
                                    <i class="bi bi-box-seam"></i>
                                </div>
                            </div>
                            <div class="flex-grow-1 ms-3">
                                <h6 class="mb-0 text-muted">{{ __('Total Products') }}</h6>
                                <h3 class="mb-0">0</h3>
                                <small class="text-muted">{{ __('No products yet') }}</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-lg-6">
                <div class="card stats-card">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-shrink-0">
                                <div class="stats-icon bg-success bg-opacity-10 text-success">
                                    <i class="bi bi-cart-check"></i>
                                </div>
                            </div>
                            <div class="flex-grow-1 ms-3">
                                <h6 class="mb-0 text-muted">{{ __('Total Orders') }}</h6>
                                <h3 class="mb-0">0</h3>
                                <small class="text-muted">{{ __('No orders yet') }}</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-lg-6">
                <div class="card stats-card">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-shrink-0">
                                <div class="stats-icon bg-info bg-opacity-10 text-info">
                                    <i class="bi bi-currency-dollar"></i>
                                </div>
                            </div>
                            <div class="flex-grow-1 ms-3">
                                <h6 class="mb-0 text-muted">{{ __('Balance') }}</h6>
                                <h3 class="mb-0">{{ number_format($vendor->balance ?? 0, 2) }} {{ setting('currency', 'USD') }}</h3>
                                <small class="text-muted">{{ __('Available balance') }}</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-lg-6">
                <div class="card stats-card">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-shrink-0">
                                <div class="stats-icon bg-warning bg-opacity-10 text-warning">
                                    <i class="bi bi-grid"></i>
                                </div>
                            </div>
                            <div class="flex-grow-1 ms-3">
                                <h6 class="mb-0 text-muted">{{ __('Categories') }}</h6>
                                <h3 class="mb-0">{{ $categories->count() }}</h3>
                                <small class="text-muted">{{ __('Available categories') }}</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('modals')
<!-- Request Category Modal -->
<div class="modal fade" id="requestCategoryModal" tabindex="-1" aria-labelledby="requestCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="requestCategoryModalLabel">
                    <i class="bi bi-plus-circle text-primary me-2"></i>{{ __('Request New Category') }}
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="{{ route('vendor.category-requests.store') }}" method="POST" id="categoryRequestForm">
                @csrf
                <div class="modal-body">
                    <p class="text-muted small mb-4">{{ __('Submit a request to add a new category. Admin will review and approve it.') }}</p>

                    <div class="mb-3">
                        <label for="name_en" class="form-label">{{ __('Category Name (English)') }} *</label>
                        <input type="text" class="form-control @error('name.en') is-invalid @enderror"
                            id="name_en" name="name[en]" value="{{ old('name.en', '') }}" required>
                        @error('name.en')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="mb-3">
                        <label for="name_ar" class="form-label">{{ __('Category Name (Arabic)') }} *</label>
                        <input type="text" class="form-control @error('name.ar') is-invalid @enderror"
                            id="name_ar" name="name[ar]" value="{{ old('name.ar', '') }}" required>
                        @error('name.ar')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>

                    <div class="mb-3">
                        <label for="description" class="form-label">{{ __('Description') }}</label>
                        <textarea class="form-control @error('description') is-invalid @enderror"
                            id="description" name="description" rows="3"
                            placeholder="{{ __('Optional: Describe why this category is needed...') }}">{{ old('description', '') }}</textarea>
                        @error('description')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                        <small class="text-muted">{{ __('Maximum 1000 characters') }}</small>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">{{ __('Cancel') }}</button>
                    <button type="submit" class="btn btn-primary">
                        <i class="bi bi-send me-2"></i>{{ __('Submit Request') }}
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
@endpush

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Handle form submission success
    const form = document.getElementById('categoryRequestForm');
    if (form) {
        form.addEventListener('submit', function(e) {
            // Form will submit normally, modal will close via data-bs-dismiss if needed
        });
    }

    // Reset form when modal is closed
    const modal = document.getElementById('requestCategoryModal');
    if (modal) {
        modal.addEventListener('hidden.bs.modal', function() {
            form.reset();
            // Clear validation errors
            form.querySelectorAll('.is-invalid').forEach(el => {
                el.classList.remove('is-invalid');
            });
        });
    }
});
</script>
@endpush
