@extends('layouts.app')

@php
    $page = 'dashboard';
@endphp

@php
    use Illuminate\Support\Str;
@endphp

@section('title', __('Admin Dashboard'))

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
                <h1 class="h3 mb-0">{{ __('Admin Dashboard') }}</h1>
                <p class="text-muted mb-0">{{ __('Welcome back! Here\'s what\'s happening.') }}</p>
            </div>
        </div>

        <!-- Category Requests Section -->
        <div class="row g-4 mb-4">
            <!-- Pending Requests -->
            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="card-title mb-0">
                            <i class="bi bi-clock-history me-2"></i>{{ __('Pending Category Requests') }}
                        </h5>
                        <span class="badge bg-warning">{{ $pendingRequests->count() }} {{ __('pending') }}</span>
                    </div>
                    <div class="card-body p-3 rounded-3">
                        @if($pendingRequests->count() > 0)
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>{{ __('Category Name') }}</th>
                                            <th>{{ __('Vendor') }}</th>
                                            <th>{{ __('Description') }}</th>
                                            <th>{{ __('Requested') }}</th>
                                            <th>{{ __('Actions') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($pendingRequests as $request)
                                            <tr>
                                                <td class="p-3">
                                                    <strong>{{ $request->getTranslation('name', app()->getLocale()) }}</strong>
                                                </td>
                                                <td class="p-3">
                                                    {{ $request->vendor->getTranslation('name', app()->getLocale()) }}
                                                </td>
                                                <td class="p-3">
                                                    <small class="text-muted">
                                                        {{ Str::limit($request->description ?? __('No description'), 50) }}
                                                    </small>
                                                </td>
                                                <td class="p-3">
                                                    <small class="text-muted">{{ $request->created_at->diffForHumans() }}</small>
                                                </td>
                                                <td class="p-3">
                                                    <div class="btn-group btn-group-sm">
                                                        <button type="button" class="btn btn-success"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#approveModal{{ $request->id }}">
                                                            <i class="bi bi-check-lg"></i> {{ __('Approve') }}
                                                        </button>
                                                        <button type="button" class="btn btn-danger"
                                                                data-bs-toggle="modal"
                                                                data-bs-target="#rejectModal{{ $request->id }}">
                                                            <i class="bi bi-x-lg"></i> {{ __('Reject') }}
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        @else
                            <div class="text-center py-5">
                                <i class="bi bi-check-circle display-1 text-success"></i>
                                <p class="text-muted mt-3">{{ __('No pending category requests.') }}</p>
                            </div>
                        @endif
                    </div>
                </div>
            </div>

            <!-- Recent Requests -->
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title mb-0">
                            <i class="bi bi-list-check me-2"></i>{{ __('Recent Requests') }}
                        </h5>
                    </div>
                    <div class="card-body p-3 rounded-3">
                        @if($recentRequests->count() > 0)
                            <div class="list-group list-group-flush">
                                @foreach($recentRequests as $request)
                                    <div class="list-group-item p-4 rounded-3">
                                        <div class="d-flex justify-content-between align-items-start mb-2 ">
                                            <strong class="mb-1">{{ $request->getTranslation('name', app()->getLocale()) }}</strong>
                                            @if($request->status === 'approved')
                                                <span class="badge bg-success">{{ __('Approved') }}</span>
                                            @else
                                                <span class="badge bg-danger">{{ __('Rejected') }}</span>
                                            @endif
                                        </div>
                                        <small class="text-muted d-block">{{ $request->vendor->getTranslation('name', app()->getLocale()) }}</small>
                                        <small class="text-muted">{{ $request->reviewed_at->diffForHumans() }}</small>
                                    </div>
                                @endforeach
                            </div>
                        @else
                            <p class="text-muted text-center py-3">{{ __('No recent requests.') }}</p>
                        @endif
                    </div>
                </div>
            </div>
        </div>

        <!-- Stats Cards -->
        <div class="row g-4">
            <div class="col-xl-3 col-lg-6">
                <div class="card stats-card">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="flex-shrink-0">
                                <div class="stats-icon bg-warning bg-opacity-10 text-warning">
                                    <i class="bi bi-clock-history"></i>
                                </div>
                            </div>
                            <div class="flex-grow-1 ms-3">
                                <h6 class="mb-0 text-muted">{{ __('Pending Requests') }}</h6>
                                <h3 class="mb-0">{{ $pendingRequests->count() }}</h3>
                                <small class="text-muted">{{ __('Awaiting review') }}</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('modals')
@foreach($pendingRequests as $request)
    <!-- Approve Modal -->
    <div class="modal fade" id="approveModal{{ $request->id }}" tabindex="-1" aria-labelledby="approveModalLabel{{ $request->id }}" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="approveModalLabel{{ $request->id }}">
                        <i class="bi bi-check-circle text-success me-2"></i>{{ __('Approve Category Request') }}
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="{{ route('admin.category-requests.approve', $request) }}" method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label"><strong>{{ __('Category Name') }}:</strong></label>
                            <p>{{ $request->getTranslation('name', 'en') }} / {{ $request->getTranslation('name', 'ar') }}</p>
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><strong>{{ __('Vendor') }}:</strong></label>
                            <p>{{ $request->vendor->getTranslation('name', app()->getLocale()) }}</p>
                        </div>
                        @if($request->description)
                            <div class="mb-3">
                                <label class="form-label"><strong>{{ __('Description') }}:</strong></label>
                                <p class="text-muted">{{ $request->description }}</p>
                            </div>
                        @endif
                        <div class="mb-3">
                            <label for="admin_notes{{ $request->id }}" class="form-label">{{ __('Admin Notes') }}</label>
                            <textarea class="form-control" id="admin_notes{{ $request->id }}" name="admin_notes" rows="3"
                                placeholder="{{ __('Optional notes for the vendor...') }}"></textarea>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="create_category{{ $request->id }}" name="create_category" value="1" checked>
                            <label class="form-check-label" for="create_category{{ $request->id }}">
                                {{ __('Create category immediately') }}
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">{{ __('Cancel') }}</button>
                        <button type="submit" class="btn btn-success">
                            <i class="bi bi-check-lg me-2"></i>{{ __('Approve') }}
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Reject Modal -->
    <div class="modal fade" id="rejectModal{{ $request->id }}" tabindex="-1" aria-labelledby="rejectModalLabel{{ $request->id }}" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="rejectModalLabel{{ $request->id }}">
                        <i class="bi bi-x-circle text-danger me-2"></i>{{ __('Reject Category Request') }}
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="{{ route('admin.category-requests.reject', $request) }}" method="POST">
                    @csrf
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label"><strong>{{ __('Category Name') }}:</strong></label>
                            <p>{{ $request->getTranslation('name', 'en') }} / {{ $request->getTranslation('name', 'ar') }}</p>
                        </div>
                        <div class="mb-3">
                            <label class="form-label"><strong>{{ __('Vendor') }}:</strong></label>
                            <p>{{ $request->vendor->getTranslation('name', app()->getLocale()) }}</p>
                        </div>
                        <div class="mb-3">
                            <label for="reject_notes{{ $request->id }}" class="form-label">{{ __('Rejection Reason') }} *</label>
                            <textarea class="form-control" id="reject_notes{{ $request->id }}" name="admin_notes" rows="3"
                                placeholder="{{ __('Please provide a reason for rejection...') }}" required></textarea>
                            <small class="text-muted">{{ __('This will be visible to the vendor.') }}</small>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">{{ __('Cancel') }}</button>
                        <button type="submit" class="btn btn-danger">
                            <i class="bi bi-x-lg me-2"></i>{{ __('Reject') }}
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endforeach
@endpush
