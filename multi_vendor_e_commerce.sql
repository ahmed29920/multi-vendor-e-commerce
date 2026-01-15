-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 15, 2026 at 05:25 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multi_vendor_e_commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `name` json NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `vendor_id`, `name`, `address`, `latitude`, `longitude`, `phone`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 3, '{\"ar\": \"فرع مدينة نصر\", \"en\": \"Nasr City Branch\"}', '3 Makram St, Cairo, Egypt', '30.055042487809665', '31.34618611072683', '+201201201200', 1, '2026-01-13 14:14:29', '2026-01-13 14:14:29'),
(2, 3, '{\"ar\": \"فرع المعادي\", \"en\": \"Maadie Branch\"}', '3 El Zouhour St, Cairo, Egypt', '29.971355197986814', '31.256119981158342', '+201201201201', 1, '2026-01-13 14:15:38', '2026-01-13 14:15:38'),
(3, 2, '{\"ar\": \"فرع شبرا\", \"en\": \"Shoubra Branch\"}', '3 Shoubra St, Cairo, Egypt', '30.079717469227067', '31.245198043761018', '+201231231231', 1, '2026-01-13 14:17:05', '2026-01-13 14:17:05'),
(4, 12, '{\"ar\": \"حدائق القبة\", \"en\": \"Hadayek El Kouba\"}', '15 walli el aahd st, Cairo, Egypt', '30.091851589259132', '31.28748148112548', '+2012001120120', 1, '2026-01-14 12:20:26', '2026-01-14 12:20:26'),
(5, 13, '{\"ar\": \"فرع مدينة نصر\", \"en\": \"Nasr City Branch\"}', '3 Makram St, Cairo, Egypt', '30.055042487809665', '31.34618611072683', '+201201201211', 1, '2026-01-15 10:45:42', '2026-01-15 10:45:42');

-- --------------------------------------------------------

--
-- Table structure for table `branch_product_stocks`
--

CREATE TABLE `branch_product_stocks` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branch_product_stocks`
--

INSERT INTO `branch_product_stocks` (`id`, `branch_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(3, 3, 1, 45, '2026-01-13 15:24:06', '2026-01-13 15:24:06'),
(4, 4, 8, 5, '2026-01-14 12:21:31', '2026-01-14 12:21:31'),
(5, 4, 9, 50, '2026-01-14 12:38:43', '2026-01-14 12:38:43'),
(7, 5, 10, 7, '2026-01-15 11:40:37', '2026-01-15 11:40:37');

-- --------------------------------------------------------

--
-- Table structure for table `branch_product_variant_stocks`
--

CREATE TABLE `branch_product_variant_stocks` (
  `id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED NOT NULL,
  `product_variant_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branch_product_variant_stocks`
--

INSERT INTO `branch_product_variant_stocks` (`id`, `branch_id`, `product_variant_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 3, 4, 15, '2026-01-13 15:43:07', '2026-01-13 15:43:07'),
(2, 3, 5, 6, '2026-01-13 15:43:07', '2026-01-13 15:43:07'),
(3, 3, 6, 20, '2026-01-13 15:43:07', '2026-01-13 15:43:07'),
(4, 3, 7, 13, '2026-01-13 15:43:07', '2026-01-13 15:43:07'),
(5, 1, 8, 5, '2026-01-13 16:02:37', '2026-01-13 16:02:37'),
(6, 2, 8, 7, '2026-01-13 16:02:37', '2026-01-13 16:02:37'),
(7, 1, 9, 8, '2026-01-13 16:02:37', '2026-01-13 16:02:37'),
(8, 2, 9, 11, '2026-01-13 16:02:37', '2026-01-13 16:02:37'),
(9, 1, 10, 17, '2026-01-13 16:02:37', '2026-01-13 16:02:37'),
(10, 2, 10, 3, '2026-01-13 16:02:37', '2026-01-13 16:02:37'),
(11, 1, 11, 5, '2026-01-13 16:02:37', '2026-01-13 16:02:37'),
(12, 2, 11, 0, '2026-01-13 16:02:37', '2026-01-13 16:02:37');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-boost.roster.scan', 'a:2:{s:6:\"roster\";O:21:\"Laravel\\Roster\\Roster\":3:{s:13:\"\0*\0approaches\";O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:11:\"\0*\0packages\";O:32:\"Laravel\\Roster\\PackageCollection\":2:{s:8:\"\0*\0items\";a:9:{i:0;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^12.0\";s:10:\"\0*\0package\";E:37:\"Laravel\\Roster\\Enums\\Packages:LARAVEL\";s:14:\"\0*\0packageName\";s:17:\"laravel/framework\";s:10:\"\0*\0version\";s:7:\"12.46.0\";s:6:\"\0*\0dev\";b:0;}i:1;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:6:\"v0.3.8\";s:10:\"\0*\0package\";E:37:\"Laravel\\Roster\\Enums\\Packages:PROMPTS\";s:14:\"\0*\0packageName\";s:15:\"laravel/prompts\";s:10:\"\0*\0version\";s:5:\"0.3.8\";s:6:\"\0*\0dev\";b:0;}i:2;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:4:\"^4.0\";s:10:\"\0*\0package\";E:37:\"Laravel\\Roster\\Enums\\Packages:SANCTUM\";s:14:\"\0*\0packageName\";s:15:\"laravel/sanctum\";s:10:\"\0*\0version\";s:5:\"4.2.2\";s:6:\"\0*\0dev\";b:0;}i:3;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:6:\"v0.5.2\";s:10:\"\0*\0package\";E:33:\"Laravel\\Roster\\Enums\\Packages:MCP\";s:14:\"\0*\0packageName\";s:11:\"laravel/mcp\";s:10:\"\0*\0version\";s:5:\"0.5.2\";s:6:\"\0*\0dev\";b:1;}i:4;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^1.24\";s:10:\"\0*\0package\";E:34:\"Laravel\\Roster\\Enums\\Packages:PINT\";s:14:\"\0*\0packageName\";s:12:\"laravel/pint\";s:10:\"\0*\0version\";s:6:\"1.27.0\";s:6:\"\0*\0dev\";b:1;}i:5;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^1.41\";s:10:\"\0*\0package\";E:34:\"Laravel\\Roster\\Enums\\Packages:SAIL\";s:14:\"\0*\0packageName\";s:12:\"laravel/sail\";s:10:\"\0*\0version\";s:6:\"1.52.0\";s:6:\"\0*\0dev\";b:1;}i:6;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:7:\"^11.5.3\";s:10:\"\0*\0package\";E:37:\"Laravel\\Roster\\Enums\\Packages:PHPUNIT\";s:14:\"\0*\0packageName\";s:15:\"phpunit/phpunit\";s:10:\"\0*\0version\";s:7:\"11.5.46\";s:6:\"\0*\0dev\";b:1;}i:7;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:10:\"\0*\0package\";E:38:\"Laravel\\Roster\\Enums\\Packages:ALPINEJS\";s:14:\"\0*\0packageName\";s:8:\"alpinejs\";s:10:\"\0*\0version\";s:6:\"3.15.3\";s:6:\"\0*\0dev\";b:0;}i:8;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:10:\"\0*\0package\";E:41:\"Laravel\\Roster\\Enums\\Packages:TAILWINDCSS\";s:14:\"\0*\0packageName\";s:11:\"tailwindcss\";s:10:\"\0*\0version\";s:6:\"4.1.18\";s:6:\"\0*\0dev\";b:1;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:21:\"\0*\0nodePackageManager\";E:43:\"Laravel\\Roster\\Enums\\NodePackageManager:NPM\";}s:9:\"timestamp\";i:1768149091;}', 1768235491),
('laravel-cache-setting:app_icon', 's:53:\"settings/BXPoHAUDV7tHZzlJIJRx7u5jsBSPzwp2EhvsQKz9.jpg\";', 1768152315),
('laravel-cache-setting:app_logo', 's:53:\"settings/FtzkBtvL5StDe8LhqFVOmkJG8VPDQ57GhYrCwK6D.jpg\";', 1768152315),
('laravel-cache-setting:app_name', 's:18:\"Multi Vendor Store\";', 1768152315),
('laravel-cache-setting:profit_type', 's:12:\"subscription\";', 1768152315),
('laravel-cache-setting:profit_value', 'N;', 1768152466);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` json NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `is_active`, `is_featured`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"ar\": \"خضروات\", \"en\": \"Vegetables\"}', 'vegetables', 'categories/cIsORXZGwiG8IbARr8mnD69Q7obRuQtWP7IOAnW1.png', 1, 1, NULL, '2026-01-11 14:50:10', '2026-01-12 11:57:38', NULL),
(2, '{\"ar\": \"فواكة\", \"en\": \"Fruits\"}', 'fruits', 'categories/8GV8HvvSL5VlaxhGIYGiFFwYimI5nB5toTuC4f2o.png', 1, 1, NULL, '2026-01-11 15:14:59', '2026-01-12 11:57:38', NULL),
(3, '{\"ar\": \"مخبوزات\", \"en\": \"Breads\"}', 'breads', 'categories/1Cuo9gWIAY38jAqpVzgMt7zHaykLCJdAInouXd1V.png', 1, 0, NULL, '2026-01-11 15:17:26', '2026-01-12 11:57:38', NULL),
(4, '{\"ar\": \"فواكة استوائية\", \"en\": \"tropical fruits\"}', 'tropical-fruits', 'categories/Nc1vyz1ow52ep4XB0T6jG8HqOuwQCMKvqj5v33Nf.png', 1, 0, 2, '2026-01-11 15:18:54', '2026-01-12 11:57:38', NULL),
(5, '{\"ar\": \"test\", \"en\": \"test\"}', 'test', NULL, 1, 0, NULL, '2026-01-12 08:19:35', '2026-01-12 08:23:59', '2026-01-12 08:23:59'),
(7, '{\"ar\": \"p\", \"en\": \"p\"}', 'p', NULL, 1, 0, NULL, '2026-01-12 08:19:51', '2026-01-12 08:28:00', '2026-01-12 08:28:00'),
(8, '{\"ar\": \"سندويتشات\", \"en\": \"Sandwiches\"}', NULL, 'categories/ynwOP9JYxQ34KwLT6CzcnQRRiesmGa2i5UruLdsa.png', 1, 0, 3, '2026-01-13 11:34:51', '2026-01-13 11:34:51', NULL),
(9, '{\"ar\": \"حلويات\", \"en\": \"Sweets\"}', NULL, 'categories/wp81c2qduftlqKlrBmoInj0PQbUqqB73P9lRtsNr.jpg', 1, 0, NULL, '2026-01-13 15:06:14', '2026-01-13 15:06:14', NULL),
(10, '{\"ar\": \"مشروبات ساخنة\", \"en\": \"Hot Drinks\"}', NULL, 'categories/GEidezjdA2HyVcA36YzhFWKJ47dIuIlF28nLDsO5.webp', 1, 0, NULL, '2026-01-15 11:40:07', '2026-01-15 11:40:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_product`
--

CREATE TABLE `category_product` (
  `product_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_product`
--

INSERT INTO `category_product` (`product_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 9, NULL, NULL),
(6, 9, NULL, NULL),
(7, 9, NULL, NULL),
(8, 9, NULL, NULL),
(9, 9, NULL, NULL),
(10, 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_requests`
--

CREATE TABLE `category_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `name` json NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `admin_notes` text COLLATE utf8mb4_unicode_ci,
  `reviewed_by` bigint UNSIGNED DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_requests`
--

INSERT INTO `category_requests` (`id`, `vendor_id`, `name`, `description`, `status`, `admin_notes`, `reviewed_by`, `reviewed_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, '{\"ar\": \"11 سندويتشات\", \"en\": \"Sandwiches 11\"}', 'أريد اضافة فئة للسندويتشات تكون متفرعة من فئة المخبوزات', 'rejected', 'the category name is not correct', 1, '2026-01-13 11:21:48', '2026-01-13 11:18:49', '2026-01-13 11:21:48', NULL),
(2, 3, '{\"ar\": \"سندويتشات\", \"en\": \"Sandwiches\"}', 'أريد اضافة فئة للسندويتشات تكون متفرعة من فئة المخبوزات', 'approved', 'we will create it', 1, '2026-01-13 11:33:52', '2026-01-13 11:18:49', '2026-01-13 11:33:52', NULL),
(3, 3, '{\"ar\": \"test\", \"en\": \"test\"}', NULL, 'rejected', 'no', 1, '2026-01-13 11:27:27', '2026-01-13 11:27:16', '2026-01-13 11:27:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6, '0001_01_01_000000_create_users_table', 1),
(7, '0001_01_01_000001_create_cache_table', 1),
(8, '0001_01_01_000002_create_jobs_table', 1),
(9, '2026_01_11_095605_create_personal_access_tokens_table', 1),
(10, '2026_01_11_100028_create_permission_tables', 1),
(11, '2026_01_11_124557_create_notifications_table', 2),
(12, '2026_01_11_141610_create_settings_table', 3),
(13, '2026_01_11_163311_create_categories_table', 4),
(14, '2026_01_12_130211_create_plans_table', 5),
(15, '2026_01_12_135549_add_slug_to_categories_table', 6),
(16, '2026_01_12_161042_create_vendors_table', 7),
(17, '2026_01_12_162533_create_vendor_subscriptions_table', 7),
(18, '2026_01_13_125308_create_vendor_users_table', 8),
(19, '2026_01_13_131630_create_category_requests_table', 8),
(20, '2026_01_13_135759_create_variants_table', 9),
(21, '2026_01_13_135856_create_variant_options_table', 9),
(22, '2026_01_13_143158_create_variant_requests_table', 10),
(23, '2026_01_13_144228_create_branches_table', 11),
(25, '2026_01_13_144357_create_products_table', 12),
(26, '2026_01_13_145620_create_product_relations_table', 12),
(27, '2026_01_13_145646_create_category_product_table.', 12),
(28, '2026_01_13_145651_create_product_images_table', 13),
(29, '2026_01_13_145844_create_product_variants_table', 13),
(30, '2026_01_13_150009_create_product_variant_values_table', 13),
(31, '2026_01_13_151212_create_branch_product_stocks_table', 13),
(32, '2026_01_13_151220_create_branch_product_variant_stocks_table', 13),
(33, '2026_01_13_164459_add_thumbnail_to_product_variants_table', 14),
(34, '2026_01_13_170757_remove_stock_from_products_table', 15),
(35, '2026_01_14_113523_create_verifications_table', 16),
(36, '2026_01_15_154722_add_expires_at_to_password_reset_tokens_table', 17);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 17),
(7, 'App\\Models\\User', 17),
(11, 'App\\Models\\User', 17),
(12, 'App\\Models\\User', 17),
(13, 'App\\Models\\User', 17),
(14, 'App\\Models\\User', 17),
(16, 'App\\Models\\User', 17),
(27, 'App\\Models\\User', 17);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 8),
(2, 'App\\Models\\User', 9),
(2, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(2, 'App\\Models\\User', 12),
(2, 'App\\Models\\User', 13),
(2, 'App\\Models\\User', 14),
(2, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 16),
(4, 'App\\Models\\User', 17),
(3, 'App\\Models\\User', 18);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'manage-products', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(2, 'view-products', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(3, 'create-products', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(4, 'edit-products', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(5, 'delete-products', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(6, 'manage-branches', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(7, 'view-branches', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(8, 'create-branches', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(9, 'edit-branches', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(10, 'delete-branches', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(11, 'view-categories', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(12, 'view-variants', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(13, 'create-variant-requests', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(14, 'view-variant-requests', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(15, 'create-category-requests', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(16, 'view-category-requests', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(17, 'view-plans', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(18, 'subscribe-plans', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(19, 'view-subscriptions', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(20, 'cancel-subscriptions', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(21, 'manage-vendor-users', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(22, 'view-vendor-users', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(23, 'create-vendor-users', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(24, 'edit-vendor-users', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(25, 'delete-vendor-users', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(26, 'edit-profile', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12'),
(27, 'view-dashboard', 'web', '2026-01-15 10:39:12', '2026-01-15 10:39:12');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 18, 'auth-token', 'fbd632b7f4f48b2a5f17fc1be65ba09b9af9da1531708aa984056dc8b886fb55', '[\"*\"]', NULL, NULL, '2026-01-15 12:39:06', '2026-01-15 12:39:06'),
(2, 'App\\Models\\User', 18, 'auth-token', '3cd639fe7b6102a92bde130df86654687cf99f1b0451ed4a2d53f5d1f51cadfb', '[\"*\"]', '2026-01-15 15:23:01', NULL, '2026-01-15 12:40:15', '2026-01-15 15:23:01'),
(3, 'App\\Models\\User', 18, 'auth-token', '2338e4efe22337f513d435594d031ebf3f99a577e550e0d44db3a27d55427b4e', '[\"*\"]', NULL, NULL, '2026-01-15 13:49:47', '2026-01-15 13:49:47');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint UNSIGNED NOT NULL,
  `name` json NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` json NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration_days` int NOT NULL DEFAULT '1',
  `can_feature_products` tinyint(1) NOT NULL DEFAULT '0',
  `max_products_count` int DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `slug`, `description`, `price`, `duration_days`, `can_feature_products`, `max_products_count`, `is_active`, `is_featured`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"ar\": \"خطة مبدئية\", \"en\": \"Basic Plan\"}', 'basic-plan', '{\"ar\": \"مناسب للبائعين الصغار. ميزات محدودة.\", \"en\": \"Ideal for small vendors. Limited features.\"}', 250.00, 30, 0, 3, 1, 0, '2026-01-12 13:16:34', '2026-01-14 10:32:56', NULL),
(2, '{\"ar\": \"خطة بريميم\", \"en\": \"Premium Plan\"}', 'premium-plan', '{\"ar\": \"مثالي للبائعين المتوسّعين. يشمل خيار المنتجات المميزة.\", \"en\": \"Perfect for growing vendors. Includes featured products option.\"}', 500.00, 30, 1, 35, 1, 1, '2026-01-12 13:19:52', '2026-01-14 10:33:20', NULL),
(3, '{\"ar\": \"خطة برو\", \"en\": \"Pro Blan\"}', 'pro-blan', '{\"ar\": \"الأفضل للبائعين الكبار. منتجات غير محدودة وجميع الميزات متاحة.\", \"en\": \"Best for large vendors. Unlimited products and all features included.\"}', 850.00, 30, 1, NULL, 1, 0, '2026-01-12 13:20:43', '2026-01-14 10:33:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `type` enum('simple','variable') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'simple',
  `name` json NOT NULL,
  `description` json NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `discount_type` enum('percentage','fixed') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_new` tinyint(1) NOT NULL DEFAULT '0',
  `is_approved` tinyint(1) NOT NULL DEFAULT '1',
  `is_bookable` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `vendor_id`, `type`, `name`, `description`, `thumbnail`, `sku`, `slug`, `price`, `discount`, `discount_type`, `is_active`, `is_featured`, `is_new`, `is_approved`, `is_bookable`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'simple', '{\"ar\": \"دوريتوس\", \"en\": \"Doritos\"}', '{\"ar\": \"إذا كنت مستعداً للتحدي، فاحصل على كيس من رقائق دوريتوس واستعد للتجربة. إنها تجربة جريئة في عالم الوجبات الخفيفة وأكثر.\", \"en\": \"If youre up to the challenge, grab a bag of DORITOS chips and get ready for the experience. Its a bold experience in snacking and beyond.\"}', 'products/9YrSXTaHJwWGnJ0X1e8F8TBmjC8dwVR1Dw7HmK3V.jpg', 'CH-123', 'doritos', 10.00, 0.00, 'percentage', 1, 0, 0, 1, 0, '2026-01-13 14:53:34', '2026-01-13 14:53:34', NULL),
(6, 2, 'variable', '{\"ar\": \"كاندي\", \"en\": \"Candy\"}', '{\"ar\": \"تُتيح لك حلوى نيردز تجربة حسية مميزة. استمتع بتناولها، أو احتفظ بها في مكتبك لتنشيط نفسك، أو قدمها كحلوى في حفلاتك لإسعاد الصغار والكبار. اختر من بين حلوى نيردز الأصلية، أو نيردز روب، أو نيردز غامي كلاستر، أو نيردز جوسي غامي كلاستر. مع نكهات متنوعة من الحلو إلى اللاذع، جرب جميع الأنواع!\", \"en\": \"candies take you on a sensory adventure. Eat them yourself, keep them at the office for a pick-me-up or as your party candy to make kids and adults happy. Choose from original NERDS candy, NERDS Rope, NERDS Gummy Clusters or our NERDS Juicy Gummy Clusters. With flavors ranging from sweet to tangy, try out all the varieties!\"}', 'products/X02YJZCmx7WvFmSOmdllrpCo7QmYyfrSER1bc5GS.jpg', 'CA-120', 'candy', 0.00, 0.00, 'percentage', 1, 0, 0, 1, 0, '2026-01-13 15:43:07', '2026-01-13 15:43:07', NULL),
(7, 3, 'variable', '{\"ar\": \"هوهوز\", \"en\": \"Hohos\"}', '{\"ar\": \"هوهوز كينج كيك ملفوف شوكولاتة بالكريمة، 60 غرام متوفر ويباع على طلبات عن طريق طلبات مارت، مع خدمة توصيل لكافة أنحاء Egypt وفي أقل من دقيقة. تسوق أونلاين الآن وتمتع بخدمة توصيل البقالة السريعة.\", \"en\": \"HoHo\'s King Cake Chocolate Cream Roll, 60g, is available and sold on Talabat through Talabat Mart, with delivery across Egypt in under a minute. Shop online now and enjoy fast grocery delivery.\"}', 'products/fTOk4dIRNoULDoWjs9NPk9x8VnbXnHJS9EsaCeJi.webp', 'HO-123', 'hohos', 0.00, 0.00, 'percentage', 1, 1, 1, 1, 0, '2026-01-13 16:02:37', '2026-01-13 16:02:37', NULL),
(8, 12, 'simple', '{\"ar\": \"منتج تجريبي\", \"en\": \"Test Product\"}', '{\"ar\": null}', NULL, 'TES-123', 'test-product', 350.00, 15.00, 'percentage', 1, 0, 0, 1, 0, '2026-01-14 12:21:31', '2026-01-15 09:21:28', NULL),
(9, 12, 'simple', '{\"ar\": \"منتج تجريبي 2\", \"en\": \"Test Product 2\"}', '{\"ar\": null}', NULL, 'TES-121', 'test-product-2', 300.00, 10.00, 'percentage', 0, 0, 0, 0, 0, '2026-01-14 12:38:43', '2026-01-14 12:40:48', NULL),
(10, 13, 'simple', '{\"ar\": \"نسكافية جولد 190 جرام\", \"en\": \"Nescafe Gold - 190 g\"}', '{\"ar\": \"نسكافيه جولد 190 جم قهوة فاخرة مصنوعة من أجود أنواع حبوب البن المختارة بعناية،\\r\\nتتميز بمذاق غني وناعم ورائحة مميزة تمنحك تجربة قهوة راقية في كل كوب.\\r\\n\\r\\nسواء كنت تفضلها سادة أو بالحليب، نسكافيه جولد هي الاختيار المثالي لعشاق القهوة المميزة.\", \"en\": \"Nescafé Gold 190g offers a rich, smooth, and aromatic coffee experience made from carefully selected premium coffee beans.\\r\\nIts well-balanced flavor and refined taste make it perfect for coffee lovers who enjoy a high-quality cup every time.\\r\\n\\r\\nWhether you prefer it black or with milk, Nescafé Gold delivers a satisfying and elegant coffee moment.\"}', 'products/Lioc9Z8E4kb9xm5nmyKqKJI4Jg3vMvxJyO6ZWsOZ.webp', 'NS-012', 'nescafe-gold-190-g', 440.00, 20.00, 'fixed', 1, 1, 0, 1, 0, '2026-01-15 10:46:23', '2026-01-15 10:46:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint UNSIGNED NOT NULL,
  `imageable_id` bigint UNSIGNED NOT NULL,
  `imageable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `imageable_id`, `imageable_type`, `path`, `created_at`, `updated_at`) VALUES
(3, 1, 'App\\Models\\Product', 'products/ZTwlBkIlqy7rrsss0Xo0cc17vU3qDRpXjDF3tSjV.jpg', '2026-01-13 15:18:10', '2026-01-13 15:18:10'),
(4, 1, 'App\\Models\\Product', 'products/1wa5bUFu5j7jR5pzsj3SpvTH60DiFVW1QTr25bh2.webp', '2026-01-13 15:18:10', '2026-01-13 15:18:10'),
(13, 6, 'App\\Models\\Product', 'products/WTXhI7DMnWhivXKaRbYijdmxRmNfaDsuYH2mPRDH.jpg', '2026-01-13 15:43:07', '2026-01-13 15:43:07'),
(14, 6, 'App\\Models\\Product', 'products/6FksgnhInLKxZv55hw7qTPbncwOAMmq6hSsKPVsa.jpg', '2026-01-13 15:43:07', '2026-01-13 15:43:07'),
(15, 7, 'App\\Models\\Product', 'products/yIMkex3QrGPuzfhPWwP4txM5uID7lZ10TRKSs1mn.jpg', '2026-01-13 16:02:37', '2026-01-13 16:02:37'),
(16, 7, 'App\\Models\\Product', 'products/spIGPU3rxuHwZpeEROqvbmzabEiKUtsGCEerMdgT.webp', '2026-01-13 16:02:37', '2026-01-13 16:02:37'),
(17, 10, 'App\\Models\\Product', 'products/CafzXMUr04u4p6XTXRRmylRSC45mPtk684rGaQ1Z.webp', '2026-01-15 10:46:23', '2026-01-15 10:46:23'),
(18, 10, 'App\\Models\\Product', 'products/x5nWxsnFnB4VZjae6Vae0tmB3Gvwowf1M9SFUUGi.webp', '2026-01-15 10:46:23', '2026-01-15 10:46:23');

-- --------------------------------------------------------

--
-- Table structure for table `product_relations`
--

CREATE TABLE `product_relations` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `related_product_id` bigint UNSIGNED NOT NULL,
  `type` enum('related','cross_sell','up_sell') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'related',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_relations`
--

INSERT INTO `product_relations` (`id`, `product_id`, `related_product_id`, `type`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 'related', '2026-01-13 15:43:07', '2026-01-13 15:43:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `name` json NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `discount_type` enum('percentage','fixed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `name`, `sku`, `slug`, `thumbnail`, `price`, `discount`, `discount_type`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 6, '{\"ar\": \"كاندي بالبطيخ صغيرة\", \"en\": \"Watermelon Candy S\"}', 'CA-120-red-s', 'watermelon-candy-s', 'products/variants/J7J12Ma1YFYH8GlgLNgbBAJm85ovIRgXr2iemS80.jpg', 45.00, NULL, 'percentage', 1, '2026-01-13 15:43:07', '2026-01-13 15:43:07', NULL),
(5, 6, '{\"ar\": \"كاندي بالبطيخ وسط\", \"en\": \"Watermelon Candy M\"}', 'CA-120-red-m', 'watermelon-candy-m', 'products/variants/tVGsahmlx79qGfUf1qsRBxnQcSNtxuzXJVZ6Sh88.jpg', 60.00, NULL, 'percentage', 1, '2026-01-13 15:43:07', '2026-01-13 15:43:07', NULL),
(6, 6, '{\"ar\": \"كاندي بالتفاح الاخضر صغيرة\", \"en\": \"Green Apple Candy S\"}', 'CA-120-green-s', 'green-apple-candy-s', 'products/variants/fkNHWPxVP1ljp00pXiu2TqMYHwiKpVPh8Kso8FlF.jpg', 45.00, NULL, 'percentage', 1, '2026-01-13 15:43:07', '2026-01-13 15:43:07', NULL),
(7, 6, '{\"ar\": \"كاندي بالتفاح الاخضر وسط\", \"en\": \"Green Apple Candy M\"}', 'CA-120-green-m', 'green-apple-candy-m', 'products/variants/4z2vw7xXiFaOJU1yqJizE3SnNNVodP4PEgRtinq6.jpg', 60.00, NULL, 'percentage', 1, '2026-01-13 15:43:07', '2026-01-13 15:43:07', NULL),
(8, 7, '{\"ar\": \"هوهوز بالشيكولاتة صغيرة\", \"en\": \"Chocolate Hohos  S\"}', 'HO-123-red-s', 'chocolate-hohos-s', 'products/variants/JqJxLtlYzAp2l9PgBIDHbGbvUVtFSdDkQr91V3d6.webp', 10.00, NULL, 'percentage', 1, '2026-01-13 16:02:37', '2026-01-13 16:02:37', NULL),
(9, 7, '{\"ar\": \"هوهوز بالشيكولاتة وسط\", \"en\": \"Chocolate Hohos  M\"}', 'HO-123-red-m', 'chocolate-hohos-m', 'products/variants/9NcrtLYKxT8KS8c1dgJRcHkwjP3oyxSM7keVrE4d.webp', 15.00, NULL, 'percentage', 1, '2026-01-13 16:02:37', '2026-01-13 16:02:37', NULL),
(10, 7, '{\"ar\": \"هوهوز بالقهوة صغيرة\", \"en\": \"Coffee Hohos  S\"}', 'HO-123-green-s', 'coffee-hohos-s', 'products/variants/ZPTQ4yE8KJkbQ0VC8zG1y624D3wCXnn92Yp9Tn4W.jpg', 10.00, NULL, 'percentage', 1, '2026-01-13 16:02:37', '2026-01-13 16:02:37', NULL),
(11, 7, '{\"ar\": \"هوهوز بالقهوة وسط\", \"en\": \"Coffee Hohos  M\"}', 'HO-123-green-m', 'coffee-hohos-m', 'products/variants/r45Xj222MOG4HfSLq4viLI8AXIc4oTOPuknKd6P9.jpg', 15.00, NULL, 'percentage', 1, '2026-01-13 16:02:37', '2026-01-13 16:02:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_variant_values`
--

CREATE TABLE `product_variant_values` (
  `id` bigint UNSIGNED NOT NULL,
  `product_variant_id` bigint UNSIGNED NOT NULL,
  `variant_option_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variant_values`
--

INSERT INTO `product_variant_values` (`id`, `product_variant_id`, `variant_option_id`, `created_at`, `updated_at`) VALUES
(1, 4, 1, '2026-01-13 15:43:07', '2026-01-13 15:43:07'),
(2, 4, 4, '2026-01-13 15:43:07', '2026-01-13 15:43:07'),
(3, 5, 1, '2026-01-13 15:43:07', '2026-01-13 15:43:07'),
(4, 5, 5, '2026-01-13 15:43:07', '2026-01-13 15:43:07'),
(5, 6, 2, '2026-01-13 15:43:07', '2026-01-13 15:43:07'),
(6, 6, 4, '2026-01-13 15:43:07', '2026-01-13 15:43:07'),
(7, 7, 2, '2026-01-13 15:43:07', '2026-01-13 15:43:07'),
(8, 7, 5, '2026-01-13 15:43:07', '2026-01-13 15:43:07'),
(9, 8, 1, '2026-01-13 16:02:37', '2026-01-13 16:02:37'),
(10, 8, 4, '2026-01-13 16:02:37', '2026-01-13 16:02:37'),
(11, 9, 1, '2026-01-13 16:02:37', '2026-01-13 16:02:37'),
(12, 9, 5, '2026-01-13 16:02:37', '2026-01-13 16:02:37'),
(13, 10, 2, '2026-01-13 16:02:37', '2026-01-13 16:02:37'),
(14, 10, 4, '2026-01-13 16:02:37', '2026-01-13 16:02:37'),
(15, 11, 2, '2026-01-13 16:02:37', '2026-01-13 16:02:37'),
(16, 11, 5, '2026-01-13 16:02:37', '2026-01-13 16:02:37');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2026-01-11 10:44:25', '2026-01-11 10:44:25'),
(2, 'vendor', 'web', '2026-01-11 10:44:25', '2026-01-11 10:44:25'),
(3, 'user', 'web', '2026-01-11 10:44:25', '2026-01-11 10:44:25'),
(4, 'vendor_employee', 'web', '2026-01-11 10:44:25', '2026-01-11 10:44:25');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('CBPmtqw8xYYiGZavsH0vo9k1lh5SR5oBQD5WtekB', NULL, '127.0.0.1', 'PostmanRuntime/7.51.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiSzhEY2tDckJwNDVrMlM4aXVpNGFvQkRKY0QwWjRzWEk3Qk1zTUdLcyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNToiaHR0cDovL211bHRpLXZlbmRvci1lLWNvbW1lcmNlLnRlc3QiO31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czo0MToiaHR0cDovL211bHRpLXZlbmRvci1lLWNvbW1lcmNlLnRlc3QvbG9naW4iO3M6NToicm91dGUiO3M6NToibG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1768488542),
('OVdg5HOBRgU4OygJ4HGqY5Xn1h84pZylwo0H1eEB', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiOEJrZ0NpVlFiNFBSdm41VlNJaDc4a2h1ZE1mRVd6SDZ5QnliWTgyViI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly9tdWx0aS12ZW5kb3ItZS1jb21tZXJjZS50ZXN0L2FkbWluL3N1YnNjcmlwdGlvbnMiO3M6NToicm91dGUiO3M6MjU6ImFkbWluLnN1YnNjcmlwdGlvbnMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1768485307),
('soR8L4r2yuhbsYywnDPitvEZKIwLP7RdJoAm2C8M', 17, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQXd5N1Nwa2Q5QkhFZGIyUnN0blVieWFQUVZPa1dON0RPUVNrV3JVeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly9tdWx0aS12ZW5kb3ItZS1jb21tZXJjZS50ZXN0L3ZlbmRvci9wcm9kdWN0cy8xMC9lZGl0IjtzOjU6InJvdXRlIjtzOjIwOiJ2ZW5kb3IucHJvZHVjdHMuZWRpdCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE3O30=', 1768483542),
('xVtKsIo1b63cDZzAsEJJDqrd8xLFFNPvZa5H6G1r', 16, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMFFqaEpYazN3cEtIclp5Q2pQaUVrVDluTmZKdW9yMUllMlVuOEwwUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly9tdWx0aS12ZW5kb3ItZS1jb21tZXJjZS50ZXN0L3ZlbmRvci9zdWJzY3JpcHRpb25zIjtzOjU6InJvdXRlIjtzOjI2OiJ2ZW5kb3Iuc3Vic2NyaXB0aW9ucy5pbmRleCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE2O30=', 1768485417);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `type` enum('string','number','boolean','image') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 'app_name', 'Multi Vendor Store', 'string', '2026-01-11 12:23:03', '2026-01-11 12:23:03'),
(2, 'app_logo', 'settings/FtzkBtvL5StDe8LhqFVOmkJG8VPDQ57GhYrCwK6D.jpg', 'image', '2026-01-11 12:23:14', '2026-01-11 14:18:43'),
(3, 'app_icon', 'settings/BXPoHAUDV7tHZzlJIJRx7u5jsBSPzwp2EhvsQKz9.jpg', 'image', '2026-01-11 12:23:20', '2026-01-11 14:18:43'),
(4, 'profit_type', 'subscription', 'string', '2026-01-11 12:41:59', '2026-01-15 08:15:55'),
(5, 'profit_value', '0', 'number', '2026-01-11 12:42:20', '2026-01-15 08:15:55'),
(6, 'currency', 'EGP', 'string', '2026-01-11 12:42:20', '2026-01-11 14:21:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `role` enum('admin','vendor','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `phone_verified_at`, `role`, `is_active`, `is_verified`, `password`, `image`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@admin.com', '01234567890', NULL, NULL, 'admin', 1, 1, '$2y$12$d7i2L.FlERwj2OBj/S9O.eiuxMmBCe3q0rQ1MHaSD1gLhgbRqw1u.', NULL, NULL, '2026-01-11 10:45:25', '2026-01-11 10:45:25', NULL),
(3, 'Test Vendor', 'test@vendor.com', '01233211230', NULL, NULL, 'user', 1, 0, '$2y$12$1BGvAlnxPs2yiEXtIZrWbuJyjI4y05UNHAqckOCzOgT4jb42gKD/y', NULL, NULL, '2026-01-12 15:10:07', '2026-01-12 15:10:07', NULL),
(4, 'Test Vendor 2', 'test@vendor2.com', '01233211231', NULL, NULL, 'user', 1, 0, '$2y$12$Cn9yN8era2hZ1uC.8shbMepvmx2MRq0qScjtQRidXBwFIJPYHNahS', NULL, NULL, '2026-01-12 15:23:47', '2026-01-12 15:23:47', NULL),
(15, 'khaled', 'khaled@vendor.com', '+20109988770', '2026-01-14 10:06:50', NULL, 'vendor', 1, 1, '$2y$12$1iqV2iaWG6FrfpN6tGoXLeTMf8uha9LwRLBcKH5xADu2ChZMx7fvS', 'users/eVdwuWMErtxikpWJNi3c2GzCz3uN3CpLOCijY0yK.png', NULL, '2026-01-14 10:06:38', '2026-01-14 14:58:44', NULL),
(16, 'Islam', 'islam@vendor.com', '+20123032101', '2026-01-15 08:08:18', NULL, 'vendor', 1, 1, '$2y$12$3RHRfXqnCxm6zNpvRG66m.db/fFT0cXqYBQdBOGr.AB6kmJRWfd/y', NULL, NULL, '2026-01-15 08:07:55', '2026-01-15 08:08:18', NULL),
(17, 'islam 2', 'islam2@vendor.com', '+201023230231', NULL, NULL, 'user', 1, 0, '$2y$12$OFi68bFc/VuOeEoCNV0X4us2yvOPzKDoTxF5v2Gen38G6UjI2KfFW', NULL, NULL, '2026-01-15 10:40:43', '2026-01-15 10:40:43', NULL),
(18, 'Test User Updated', 'test@user.com', '+201234567890', NULL, NULL, 'user', 1, 1, '$2y$12$ULTfZljbkO/B4cAQAlva9OOrNabUH6q8a4fAqwkWE7r9OmCxEhPv2', 'users/OofEca30obQjClbwg88umNT7bLBl6H1qDJ2sR6Z3.png', NULL, '2026-01-15 12:33:55', '2026-01-15 13:49:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variants`
--

CREATE TABLE `variants` (
  `id` bigint UNSIGNED NOT NULL,
  `name` json NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variants`
--

INSERT INTO `variants` (`id`, `name`, `is_required`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '{\"ar\": \"اللون\", \"en\": \"Color\"}', 0, 1, '2026-01-13 12:30:07', '2026-01-13 12:30:07', NULL),
(2, '{\"ar\": \"المقاس\", \"en\": \"Size\"}', 0, 1, '2026-01-13 12:30:32', '2026-01-13 12:30:32', NULL),
(3, '{\"ar\": \"الخامة\", \"en\": \"Material\"}', 0, 1, '2026-01-13 12:37:59', '2026-01-13 12:39:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variant_options`
--

CREATE TABLE `variant_options` (
  `id` bigint UNSIGNED NOT NULL,
  `variant_id` bigint UNSIGNED NOT NULL,
  `name` json NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variant_options`
--

INSERT INTO `variant_options` (`id`, `variant_id`, `name`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '{\"ar\": \"أحمر\", \"en\": \"Red\"}', 'red', '2026-01-13 12:30:07', '2026-01-13 12:30:07', NULL),
(2, 1, '{\"ar\": \"أخضر\", \"en\": \"Green\"}', 'green', '2026-01-13 12:30:07', '2026-01-13 12:30:07', NULL),
(3, 1, '{\"ar\": \"أسود\", \"en\": \"Black\"}', 'black', '2026-01-13 12:30:07', '2026-01-13 12:30:07', NULL),
(4, 2, '{\"ar\": \"صغير\", \"en\": \"S\"}', 's', '2026-01-13 12:30:32', '2026-01-13 12:30:32', NULL),
(5, 2, '{\"ar\": \"متوسط\", \"en\": \"M\"}', 'm', '2026-01-13 12:30:32', '2026-01-13 12:30:32', NULL),
(6, 2, '{\"ar\": \"كبير\", \"en\": \"L\"}', 'l', '2026-01-13 12:30:32', '2026-01-13 12:30:32', NULL),
(7, 3, '{\"ar\": \"قطن\", \"en\": \"Cotton\"}', 'cotton', '2026-01-13 12:37:59', '2026-01-13 12:37:59', NULL),
(8, 3, '{\"ar\": \"صوف\", \"en\": \"Wool\"}', 'wool', '2026-01-13 12:37:59', '2026-01-13 12:37:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `variant_requests`
--

CREATE TABLE `variant_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `name` json NOT NULL,
  `options` json DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `admin_notes` text COLLATE utf8mb4_unicode_ci,
  `reviewed_by` bigint UNSIGNED DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variant_requests`
--

INSERT INTO `variant_requests` (`id`, `vendor_id`, `name`, `options`, `description`, `status`, `admin_notes`, `reviewed_by`, `reviewed_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, '{\"ar\": \"الخامة\", \"en\": \"Material\"}', '[{\"code\": null, \"name\": {\"ar\": \"قطن\", \"en\": \"Cotton\"}}, {\"code\": null, \"name\": {\"ar\": \"صوف\", \"en\": \"Wool\"}}]', NULL, 'approved', NULL, 1, '2026-01-13 12:37:55', '2026-01-13 12:36:59', '2026-01-13 12:37:55', NULL),
(2, 3, '{\"ar\": \"test\", \"en\": \"test\"}', '[]', NULL, 'rejected', 'reject reason', 1, '2026-01-13 12:37:28', '2026-01-13 12:37:10', '2026-01-13 12:37:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` bigint UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` json NOT NULL,
  `owner_id` bigint UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `balance` double NOT NULL DEFAULT '0',
  `commission_rate` double NOT NULL DEFAULT '0',
  `plan_id` bigint UNSIGNED DEFAULT NULL,
  `subscription_start` date DEFAULT NULL,
  `subscription_end` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `slug`, `name`, `owner_id`, `phone`, `address`, `image`, `is_active`, `is_featured`, `balance`, `commission_rate`, `plan_id`, `subscription_start`, `subscription_end`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'banda-vendor', '{\"ar\": \"ماركت باندا\", \"en\": \"Banda Vendor\"}', 3, '01233211230', '3 wzf st Cairo. Egypt', 'vendors/27RqJdLmLF1nHArn6d7PxMeOrvOVs2A5a2qgWWaM.png', 1, 0, 0, 0, 1, '2026-01-12', '2026-02-11', '2026-01-12 15:10:07', '2026-01-14 07:54:12', NULL),
(3, 'hayper-vendor', '{\"ar\": \"ماركت هايبر\", \"en\": \"Hayper Vendor\"}', 4, '01233211231', '3 wzf st Cairo. Egypt', 'vendors/f11PzLAar52uyvJfQQkRfubvgHmNFTp0GcogVcmc.png', 1, 0, 0, 0, 1, '2026-01-12', '2026-02-11', '2026-01-12 15:23:47', '2026-01-14 07:55:18', NULL),
(12, 'fathalla-market', '{\"ar\": \"فتح الله ماركت\", \"en\": \"Fathalla Market\"}', 15, '+20109988770', '3 abbas st. nasr city, Cairo, Egypt', 'vendors/ox7x0kfsews9fSuoRvvRfSqvb1vJBSCjp0VrHsu2.jpg', 1, 0, 0, 0, 1, '2026-01-14', '2026-02-13', '2026-01-14 10:06:38', '2026-01-14 14:29:42', NULL),
(13, 'saudi-market', '{\"ar\": \"سعودي ماركت\", \"en\": \"Saudi Market\"}', 16, '+20123032101', '3 Makram St. Cairo Egypt', 'vendors/ln8IAKuQUZmw8Xx2VPhYgiMDievBF3kCxYzAbiLN.webp', 1, 0, 0, 10, 2, '2026-01-15', '2026-02-14', '2026-01-15 08:07:55', '2026-01-15 11:42:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_subscriptions`
--

CREATE TABLE `vendor_subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `plan_id` bigint UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `price` double NOT NULL,
  `status` enum('active','inactive','expired') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_subscriptions`
--

INSERT INTO `vendor_subscriptions` (`id`, `vendor_id`, `plan_id`, `start_date`, `end_date`, `price`, `status`, `created_at`, `updated_at`) VALUES
(2, 12, 2, '2026-01-14', '2026-02-13', 500, 'inactive', '2026-01-14 12:15:02', '2026-01-14 12:41:05'),
(3, 12, 1, '2026-01-14', '2026-02-13', 250, 'active', '2026-01-14 12:41:05', '2026-01-14 12:41:05'),
(4, 13, 2, '2026-01-15', '2026-02-14', 500, 'active', '2026-01-15 10:09:44', '2026-01-15 10:09:44');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_users`
--

CREATE TABLE `vendor_users` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_users`
--

INSERT INTO `vendor_users` (`id`, `vendor_id`, `user_id`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 13, 17, 1, '2026-01-15 10:40:43', '2026-01-15 10:40:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE `verifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` timestamp NOT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verifications`
--

INSERT INTO `verifications` (`id`, `user_id`, `type`, `target`, `code`, `expires_at`, `verified_at`, `created_at`, `updated_at`) VALUES
(6, 15, 'email', 'khaled@vendor.com', '739701', '2026-01-14 10:16:38', '2026-01-14 10:06:50', '2026-01-14 10:06:38', '2026-01-14 10:06:50'),
(7, 16, 'email', 'islam@vendor.com', '475013', '2026-01-15 08:17:55', '2026-01-15 08:08:18', '2026-01-15 08:07:55', '2026-01-15 08:08:18'),
(9, 18, 'email', 'newemail@user.com', '980517', '2026-01-15 12:59:51', NULL, '2026-01-15 12:49:51', '2026-01-15 12:49:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branches_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `branch_product_stocks`
--
ALTER TABLE `branch_product_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_product_stocks_branch_id_foreign` (`branch_id`),
  ADD KEY `branch_product_stocks_product_id_foreign` (`product_id`);

--
-- Indexes for table `branch_product_variant_stocks`
--
ALTER TABLE `branch_product_variant_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_product_variant_stocks_branch_id_foreign` (`branch_id`),
  ADD KEY `branch_product_variant_stocks_product_variant_id_foreign` (`product_variant_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `category_product`
--
ALTER TABLE `category_product`
  ADD UNIQUE KEY `category_product_product_id_category_id_unique` (`product_id`,`category_id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`);

--
-- Indexes for table `category_requests`
--
ALTER TABLE `category_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_requests_vendor_id_foreign` (`vendor_id`),
  ADD KEY `category_requests_reviewed_by_foreign` (`reviewed_by`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_vendor_id_foreign` (`vendor_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_imageable_id_imageable_type_index` (`imageable_id`,`imageable_type`);

--
-- Indexes for table `product_relations`
--
ALTER TABLE `product_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_relations_product_id_foreign` (`product_id`),
  ADD KEY `product_relations_related_product_id_foreign` (`related_product_id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_variants_sku_unique` (`sku`),
  ADD UNIQUE KEY `product_variants_slug_unique` (`slug`),
  ADD KEY `product_variants_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_variant_values`
--
ALTER TABLE `product_variant_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variant_values_product_variant_id_foreign` (`product_variant_id`),
  ADD KEY `product_variant_values_variant_option_id_foreign` (`variant_option_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `variants`
--
ALTER TABLE `variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `variant_options`
--
ALTER TABLE `variant_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `variant_options_code_unique` (`code`),
  ADD KEY `variant_options_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `variant_requests`
--
ALTER TABLE `variant_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variant_requests_vendor_id_foreign` (`vendor_id`),
  ADD KEY `variant_requests_reviewed_by_foreign` (`reviewed_by`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_slug_unique` (`slug`),
  ADD KEY `vendors_owner_id_foreign` (`owner_id`),
  ADD KEY `vendors_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `vendor_subscriptions`
--
ALTER TABLE `vendor_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_subscriptions_vendor_id_foreign` (`vendor_id`),
  ADD KEY `vendor_subscriptions_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `vendor_users`
--
ALTER TABLE `vendor_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_users_vendor_id_foreign` (`vendor_id`),
  ADD KEY `vendor_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verifications_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `branch_product_stocks`
--
ALTER TABLE `branch_product_stocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `branch_product_variant_stocks`
--
ALTER TABLE `branch_product_variant_stocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category_requests`
--
ALTER TABLE `category_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product_relations`
--
ALTER TABLE `product_relations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_variant_values`
--
ALTER TABLE `product_variant_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `variant_options`
--
ALTER TABLE `variant_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `variant_requests`
--
ALTER TABLE `variant_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vendor_subscriptions`
--
ALTER TABLE `vendor_subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vendor_users`
--
ALTER TABLE `vendor_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE `verifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `branch_product_stocks`
--
ALTER TABLE `branch_product_stocks`
  ADD CONSTRAINT `branch_product_stocks_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `branch_product_stocks_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `branch_product_variant_stocks`
--
ALTER TABLE `branch_product_variant_stocks`
  ADD CONSTRAINT `branch_product_variant_stocks_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `branch_product_variant_stocks_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_requests`
--
ALTER TABLE `category_requests`
  ADD CONSTRAINT `category_requests_reviewed_by_foreign` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `category_requests_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_relations`
--
ALTER TABLE `product_relations`
  ADD CONSTRAINT `product_relations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_relations_related_product_id_foreign` FOREIGN KEY (`related_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variant_values`
--
ALTER TABLE `product_variant_values`
  ADD CONSTRAINT `product_variant_values_product_variant_id_foreign` FOREIGN KEY (`product_variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variant_values_variant_option_id_foreign` FOREIGN KEY (`variant_option_id`) REFERENCES `variant_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variant_options`
--
ALTER TABLE `variant_options`
  ADD CONSTRAINT `variant_options_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variant_requests`
--
ALTER TABLE `variant_requests`
  ADD CONSTRAINT `variant_requests_reviewed_by_foreign` FOREIGN KEY (`reviewed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `variant_requests_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendors`
--
ALTER TABLE `vendors`
  ADD CONSTRAINT `vendors_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendors_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_subscriptions`
--
ALTER TABLE `vendor_subscriptions`
  ADD CONSTRAINT `vendor_subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_subscriptions_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_users`
--
ALTER TABLE `vendor_users`
  ADD CONSTRAINT `vendor_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_users_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `verifications`
--
ALTER TABLE `verifications`
  ADD CONSTRAINT `verifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
