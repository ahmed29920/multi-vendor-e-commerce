<?php

namespace App\Http\Requests\Vendor\VendorUsers;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class CreateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return $this->user()->hasRole('vendor');
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['nullable', 'email', 'max:255', Rule::unique('users', 'email')->whereNull('deleted_at')],
            'phone' => ['nullable', 'string', 'max:20', Rule::unique('users', 'phone')->whereNull('deleted_at')],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'is_active' => ['boolean'],
            'permissions' => ['nullable', 'array'],
            'permissions.*' => ['string', 'exists:permissions,name'],
        ];
    }

    /**
     * Get custom messages for validator errors.
     *
     * @return array<string, string>
     */
    public function messages(): array
    {
        return [
            'name.required' => __('The name field is required.'),
            'name.max' => __('The name must not exceed 255 characters.'),
            'email.email' => __('The email must be a valid email address.'),
            'email.unique' => __('The email has already been taken.'),
            'phone.unique' => __('The phone number has already been taken.'),
            'password.required' => __('The password field is required.'),
            'password.min' => __('The password must be at least 8 characters.'),
            'password.confirmed' => __('The password confirmation does not match.'),
        ];
    }

    /**
     * Configure the validator instance.
     */
    public function withValidator($validator): void
    {
        $validator->after(function ($validator) {
            if (!$this->email && !$this->phone) {
                $validator->errors()->add('email', __('You must provide at least an email or phone number.'));
            }
        });
    }
}
