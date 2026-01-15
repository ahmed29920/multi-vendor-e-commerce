# Multi-Vendor E-Commerce API Documentation

## Overview

This is the REST API documentation for the Multi-Vendor E-Commerce Platform. The API uses Laravel Sanctum for authentication and returns JSON responses.

## Base URL

```
http://localhost:8000/api
```

For production, replace `localhost:8000` with your production domain.

## Authentication

Most endpoints require Bearer token authentication. To authenticate:

1. **Login** using `/api/login` endpoint with email/phone and password
2. Receive a **token** in the response
3. Include the token in subsequent requests:
   ```
   Authorization: Bearer {your_token}
   ```

## Rate Limiting

- **Login endpoint**: Limited to 5 attempts per minute per IP address
- After exceeding the limit, you'll receive a `429 Too Many Requests` response

## Response Format

All API responses follow this structure:

### Success Response
```json
{
  "success": true,
  "message": "Operation successful message",
  "data": {
    // Response data
  }
}
```

### Error Response
```json
{
  "message": "Error message",
  "errors": {
    "field_name": ["Error message for this field"]
  }
}
```

## Endpoints

### Authentication

#### Register
**POST** `/api/register`

Register a new user account.

**Request Body:**
```json
{
  "name": "John Doe",
  "email": "user@example.com",
  "phone": "+1234567890",  // optional
  "password": "password123",
  "password_confirmation": "password123"
}
```

**Validation:**
- `name` (required, string): Maximum 255 characters
- `email` (required, email): Must be valid email, unique, lowercase
- `phone` (optional, string|null): Maximum 255 characters, unique
- `password` (required, string): Minimum 8 characters, must match confirmation
- `password_confirmation` (required, string): Must match password

**Success Response (201):**
```json
{
  "success": true,
  "message": "Registration successful. Please verify your account before logging in.",
  "data": {
    "user": {
      "id": 1,
      "name": "John Doe",
      "email": "user@example.com",
      "phone": "+1234567890",
      "image": "http://example.com/storage/users/default.png",
      "email_verified_at": null,
      "phone_verified_at": null,
      "is_active": true,
      "is_verified": false,
      "roles": [],
      "permissions": [],
      "created_at": "2026-01-15T12:00:00Z",
      "updated_at": "2026-01-15T12:00:00Z"
    }
  }
}
```

**Error Responses:**
- `422`: Validation errors (email taken, password mismatch, etc.)

**Important Notes:**
- After registration, user account is created with `is_verified: false`
- Users **cannot log in** until their account is verified
- Verification process must be completed through the verification system

---

#### Login
**POST** `/api/login`

Authenticate a user and receive an access token.

**Request Body:**
```json
{
  "login": "user@example.com",  // or phone number
  "password": "password123"
}
```

**Validation:**
- `login` (required, string): Email address or phone number
- `password` (required, string): User's password

**Success Response (200):**
```json
{
  "success": true,
  "message": "Login successful.",
  "data": {
    "user": {
      "id": 1,
      "name": "John Doe",
      "email": "user@example.com",
      "phone": "+1234567890",
      "image": "http://example.com/storage/users/image.jpg",
      "email_verified_at": "2026-01-15T10:30:00Z",
      "phone_verified_at": null,
      "is_active": true,
      "is_verified": true,
      "roles": ["vendor"],
      "permissions": ["view-dashboard", "manage-products"],
      "created_at": "2026-01-01T00:00:00Z",
      "updated_at": "2026-01-15T10:30:00Z"
    },
    "token": "1|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
    "token_type": "Bearer"
  }
}
```

**Error Responses:**
- `422`: Validation error, invalid credentials, account deactivated, or account not verified
- `429`: Too many login attempts

**Important Notes:**
- Users must have `is_verified: true` to log in
- Unverified users will receive a 422 error indicating they need to verify their account first

---

#### Logout
**POST** `/api/logout`

Log out the authenticated user and invalidate the current token.

**Headers:**
```
Authorization: Bearer {token}
```

**Success Response (200):**
```json
{
  "success": true,
  "message": "Logged out successfully."
}
```

---

#### Get Current User
**GET** `/api/user`

Get the currently authenticated user's information.

**Headers:**
```
Authorization: Bearer {token}
```

**Success Response (200):**
```json
{
  "success": true,
  "data": {
    "user": {
      "id": 1,
      "name": "John Doe",
      "email": "user@example.com",
      "phone": "+1234567890",
      "image": "http://example.com/storage/users/image.jpg",
      "email_verified_at": "2026-01-15T10:30:00Z",
      "phone_verified_at": null,
      "is_active": true,
      "is_verified": true,
      "roles": ["vendor"],
      "permissions": ["view-dashboard", "manage-products"],
      "created_at": "2026-01-01T00:00:00Z",
      "updated_at": "2026-01-15T10:30:00Z"
    }
  }
}
```

---

### Profile

#### Get Profile
**GET** `/api/profile`

Get the authenticated user's profile information.

**Headers:**
```
Authorization: Bearer {token}
```

**Success Response (200):**
Same as Get Current User endpoint.

---

#### Update Profile
**PUT** `/api/profile`

Update the authenticated user's profile information.

**Headers:**
```
Authorization: Bearer {token}
Content-Type: application/json
```

**Request Body (all fields optional):**
```json
{
  "name": "John Doe Updated",
  "email": "newemail@example.com",
  "phone": "+9876543210"
}
```

**Validation:**
- `name` (optional, string): Maximum 255 characters
- `email` (optional, email): Must be valid email, unique, lowercase
- `phone` (optional, string|null): Maximum 255 characters, unique
- `image` (optional, file): Image file (jpeg, png, jpg, gif, svg, webp), max 5MB

**Note:** When updating email or phone, verification status is reset.

**Success Response (200):**
```json
{
  "success": true,
  "message": "Profile updated successfully.",
  "data": {
    "user": {
      // Updated user object
    }
  }
}
```

**Error Responses:**
- `422`: Validation errors (email taken, invalid format, etc.)

---

### Password

#### Update Password
**PUT** `/api/password`

Update the authenticated user's password.

**Headers:**
```
Authorization: Bearer {token}
Content-Type: application/json
```

**Request Body:**
```json
{
  "current_password": "oldpassword123",
  "password": "newpassword123",
  "password_confirmation": "newpassword123"
}
```

**Validation:**
- `current_password` (required, string): Must match user's current password
- `password` (required, string): New password (minimum 8 characters)
- `password_confirmation` (required, string): Must match `password`

**Success Response (200):**
```json
{
  "success": true,
  "message": "Password updated successfully."
}
```

**Error Responses:**
- `422`: Current password incorrect, password confirmation mismatch, or validation errors

---

## Postman Collection

A complete Postman collection is available in the project root:

- **Collection**: `postman_collection.json`
- **Environment**: `postman_environment.json`

### Import Instructions

1. Open Postman
2. Click **Import** button
3. Select `postman_collection.json` file
4. Import the environment file (`postman_environment.json`)
5. Set the `base_url` variable in the environment (default: `http://localhost:8000`)

### Using the Collection

1. **Set Environment Variables:**
   - `base_url`: Your API base URL (e.g., `http://localhost:8000`)
   - `auth_token`: Will be automatically set after login (or set manually)

2. **Login:**
   - Use the **Login** request in the Authentication folder
   - Copy the `token` from the response
   - Set it in the `auth_token` environment variable (or use Postman's automatic token extraction)

3. **Use Authenticated Endpoints:**
   - All protected endpoints automatically use the `auth_token` variable
   - Make sure you're logged in before using protected endpoints

## Error Codes

| Code | Description |
|------|-------------|
| 200 | Success |
| 401 | Unauthenticated (missing or invalid token) |
| 422 | Validation Error |
| 429 | Too Many Requests (rate limit exceeded) |
| 500 | Server Error |

## User Model Fields

| Field | Type | Description |
|-------|------|-------------|
| id | integer | User ID |
| name | string | User's full name |
| email | string | Email address |
| phone | string\|null | Phone number |
| image | string | Profile image URL |
| email_verified_at | datetime\|null | Email verification timestamp |
| phone_verified_at | datetime\|null | Phone verification timestamp |
| is_active | boolean | Account active status |
| is_verified | boolean | Account verification status |
| roles | array | User roles |
| permissions | array | User permissions |
| created_at | datetime | Account creation timestamp |
| updated_at | datetime | Last update timestamp |

## Notes

- All datetime fields are returned in ISO 8601 format
- Image URLs are absolute URLs
- When email or phone is updated, verification status is reset
- Old profile images are automatically deleted when a new one is uploaded
- Password must meet Laravel's default requirements (minimum 8 characters)

## Support

For issues or questions, please contact the development team.

---

**Last Updated**: January 2026  
**API Version**: 1.0.0
