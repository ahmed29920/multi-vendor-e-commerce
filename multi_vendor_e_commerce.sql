-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 22, 2026 at 06:31 PM
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
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `address`, `latitude`, `longitude`, `name`, `phone`, `city`, `state`, `is_default`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 18, '3 abbas st. Nasr City, Cairo, Egypt', '30.06857688631472', '31.336199295502478', 'Home', '0123456789', 'Cairo', 'Nasr City', 1, 1, '2026-01-18 13:29:20', '2026-01-18 13:29:20'),
(2, 18, '3 abbas st. Nasr City, Cairo, Egypt', '30.06857688631472', '31.336199295502478', 'Home', '0123456789', 'Cairo', 'Nasr City', 1, 0, '2026-01-18 13:35:07', '2026-01-18 13:35:46');

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
(5, 13, '{\"ar\": \"فرع مدينة نصر\", \"en\": \"Nasr City Branch\"}', '3 Makram St, Cairo, Egypt', '30.055042487809665', '31.34618611072683', '+201201201211', 1, '2026-01-15 10:45:42', '2026-01-15 10:45:42'),
(6, 13, '{\"ar\": \"فرع نيو جيزا\", \"en\": \"New Giza Branch\"}', 'قسم أول 6 أكتوبر، محافظة الجيزة', '30.022166044738704', '31.054311714840942', '+201022033012', 1, '2026-01-18 09:42:21', '2026-01-18 09:42:21');

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
(3, 3, 1, 21, '2026-01-13 15:24:06', '2026-01-20 10:54:13'),
(4, 4, 8, 5, '2026-01-14 12:21:31', '2026-01-14 12:21:31'),
(5, 4, 9, 50, '2026-01-14 12:38:43', '2026-01-14 12:38:43'),
(10, 5, 10, 1, '2026-01-18 09:52:42', '2026-01-19 13:16:43'),
(11, 6, 10, 6, '2026-01-18 09:52:42', '2026-01-20 10:54:13'),
(12, 5, 14, 20, '2026-01-22 12:15:36', '2026-01-22 12:15:36'),
(13, 6, 14, 15, '2026-01-22 12:15:36', '2026-01-22 12:15:36');

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
(12, 2, 11, 0, '2026-01-13 16:02:37', '2026-01-13 16:02:37'),
(73, 5, 12, 5, '2026-01-22 11:38:48', '2026-01-22 11:38:48'),
(74, 6, 12, 5, '2026-01-22 11:38:48', '2026-01-22 11:38:48'),
(75, 5, 13, 10, '2026-01-22 11:38:48', '2026-01-22 11:38:48'),
(76, 6, 13, 9, '2026-01-22 11:38:48', '2026-01-22 11:38:48'),
(77, 5, 14, 5, '2026-01-22 11:38:48', '2026-01-22 11:38:48'),
(78, 6, 14, 5, '2026-01-22 11:38:48', '2026-01-22 11:38:48'),
(103, 5, 28, 6, '2026-01-22 15:25:11', '2026-01-22 15:25:11'),
(104, 6, 28, 5, '2026-01-22 15:25:11', '2026-01-22 15:25:11'),
(105, 5, 29, 4, '2026-01-22 15:25:11', '2026-01-22 15:25:11'),
(106, 6, 29, 7, '2026-01-22 15:25:11', '2026-01-22 15:25:11');

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
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `variant_id` bigint UNSIGNED DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(10, '{\"ar\": \"مشروبات ساخنة\", \"en\": \"Hot Drinks\"}', NULL, 'categories/GEidezjdA2HyVcA36YzhFWKJ47dIuIlF28nLDsO5.webp', 1, 0, NULL, '2026-01-15 11:40:07', '2026-01-15 11:40:07', NULL),
(11, '{\"ar\": \"الألبان، البيض والجبنة\", \"en\": \"Dairy, Eggs & Cheese\"}', NULL, 'categories/e0eT7mFt5ZH4MJPO33Resc2Bz7c94mNmArKym89d.webp', 1, 0, NULL, '2026-01-18 11:26:45', '2026-01-18 11:26:45', NULL),
(12, '{\"ar\": \"العناية بالطفل\", \"en\": \"Baby Care\"}', NULL, 'categories/kL7GdupdbhhiEUi032qdkleCDsPC54KBvNR8JQ0M.png', 1, 0, NULL, '2026-01-22 11:00:33', '2026-01-22 11:00:33', NULL),
(13, '{\"ar\": \"البسكويت والكعك\", \"en\": \"Biscuits & Cookies\"}', NULL, 'categories/iRUYPTKAltqXswJzS3IvGTIStO4hQWZoSrxQXzJh.png', 1, 1, 3, '2026-01-22 11:00:33', '2026-01-22 11:00:33', NULL),
(14, '{\"ar\": \"الآيس كريم والحلويات\", \"en\": \"Ice cream & Desserts\"}', NULL, 'categories/BNwGA6jjDpEkLZqD4TuEDgEwDZ0J0nyeZgYY8JrD.png', 1, 0, 9, '2026-01-22 11:13:56', '2026-01-22 11:13:56', NULL),
(15, '{\"ar\": \"شيبس والوجبات الخفيفة\", \"en\": \"Chips, Dips & Snacks\"}', NULL, 'categories/xNWPoX6yVXriQb24XEnAGh0Zf8aEIdDa2WpZCULZ.png', 1, 0, 9, '2026-01-22 11:13:56', '2026-01-22 11:13:56', NULL);

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
(10, 10, NULL, NULL),
(11, 11, NULL, NULL),
(11, 12, NULL, NULL),
(14, 3, NULL, NULL),
(14, 9, NULL, NULL),
(14, 13, NULL, NULL),
(15, 3, NULL, NULL),
(15, 9, NULL, NULL),
(15, 13, NULL, NULL);

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
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('percentage','fixed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `min_cart_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `usage_limit_per_user` int DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `discount_value`, `min_cart_amount`, `usage_limit_per_user`, `start_date`, `end_date`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'HELLO25', 'percentage', 25.00, 500.00, 1, NULL, NULL, 1, '2026-01-19 14:52:16', '2026-01-19 14:52:16');

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

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '70fdbc5c-1785-4683-a7bf-a387f9e24866', 'database', 'default', '{\"uuid\":\"70fdbc5c-1785-4683-a7bf-a387f9e24866\",\"displayName\":\"App\\\\Mail\\\\OrderStatusUpdatedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:31:\\\"App\\\\Mail\\\\OrderStatusUpdatedMail\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:6:\\\"status\\\";s:10:\\\"processing\\\";s:11:\\\"vendorOrder\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\VendorOrder\\\";s:2:\\\"id\\\";i:10;s:9:\\\"relations\\\";a:8:{i:0;s:5:\\\"order\\\";i:1;s:10:\\\"order.user\\\";i:2;s:13:\\\"order.address\\\";i:3;s:6:\\\"vendor\\\";i:4;s:6:\\\"branch\\\";i:5;s:5:\\\"items\\\";i:6;s:13:\\\"items.product\\\";i:7;s:13:\\\"items.variant\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:13:\\\"test@user.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"},\"createdAt\":1768915701,\"delay\":null}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550 5.7.0 Too many emails per second. Please upgrade your plan https://mailtrap.io/billing/plans/testing\". in C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php:331\nStack trace:\n#0 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(187): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode(\'550 5.7.0 Too m...\', Array)\n#1 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(150): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand(\'DATA\\r\\n\', Array)\n#2 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(209): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'DATA\\r\\n\', Array)\n#3 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#4 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#5 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#6 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#7 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(207): Illuminate\\Mail\\Mailer->send(\'emails.orders.s...\', Array, Object(Closure))\n#8 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(200): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\SendQueuedMailable.php(82): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#11 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#12 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#13 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#14 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#17 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#18 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#19 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#21 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#22 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#23 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#25 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#26 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#27 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#28 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#29 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#31 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#32 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#33 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#34 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#35 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#36 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#37 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#38 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#39 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\console\\Application.php(1102): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 C:\\laragon\\www\\multi-vendor-e-commerce\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#45 {main}', '2026-01-22 11:09:42'),
(2, '11157a2d-0871-4acf-a02e-4b66b56abee7', 'database', 'default', '{\"uuid\":\"11157a2d-0871-4acf-a02e-4b66b56abee7\",\"displayName\":\"App\\\\Mail\\\\OrderStatusUpdatedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:31:\\\"App\\\\Mail\\\\OrderStatusUpdatedMail\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:6:\\\"status\\\";s:10:\\\"processing\\\";s:11:\\\"vendorOrder\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\VendorOrder\\\";s:2:\\\"id\\\";i:10;s:9:\\\"relations\\\";a:8:{i:0;s:5:\\\"order\\\";i:1;s:10:\\\"order.user\\\";i:2;s:13:\\\"order.address\\\";i:3;s:6:\\\"vendor\\\";i:4;s:6:\\\"branch\\\";i:5;s:5:\\\"items\\\";i:6;s:13:\\\"items.product\\\";i:7;s:13:\\\"items.variant\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:13:\\\"test@user.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"},\"createdAt\":1768915884,\"delay\":null}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550 5.7.0 Too many emails per second. Please upgrade your plan https://mailtrap.io/billing/plans/testing\". in C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php:331\nStack trace:\n#0 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(187): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode(\'550 5.7.0 Too m...\', Array)\n#1 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(150): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand(\'DATA\\r\\n\', Array)\n#2 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(209): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'DATA\\r\\n\', Array)\n#3 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#4 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#5 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#6 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#7 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(207): Illuminate\\Mail\\Mailer->send(\'emails.orders.s...\', Array, Object(Closure))\n#8 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(200): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\SendQueuedMailable.php(82): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#11 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#12 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#13 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#14 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#17 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#18 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#19 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#21 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#22 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#23 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#25 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#26 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#27 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#28 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#29 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#31 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#32 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#33 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#34 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#35 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#36 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#37 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#38 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#39 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\console\\Application.php(1102): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 C:\\laragon\\www\\multi-vendor-e-commerce\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#45 {main}', '2026-01-22 11:09:43'),
(3, '67976a64-a642-43f5-84c7-61618e9d5fd9', 'database', 'default', '{\"uuid\":\"67976a64-a642-43f5-84c7-61618e9d5fd9\",\"displayName\":\"App\\\\Mail\\\\OrderStatusUpdatedMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Mail\\\\SendQueuedMailable\",\"command\":\"O:34:\\\"Illuminate\\\\Mail\\\\SendQueuedMailable\\\":17:{s:8:\\\"mailable\\\";O:31:\\\"App\\\\Mail\\\\OrderStatusUpdatedMail\\\":5:{s:5:\\\"order\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:16:\\\"App\\\\Models\\\\Order\\\";s:2:\\\"id\\\";i:6;s:9:\\\"relations\\\";a:1:{i:0;s:4:\\\"user\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:6:\\\"status\\\";s:10:\\\"processing\\\";s:11:\\\"vendorOrder\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:22:\\\"App\\\\Models\\\\VendorOrder\\\";s:2:\\\"id\\\";i:10;s:9:\\\"relations\\\";a:8:{i:0;s:5:\\\"order\\\";i:1;s:10:\\\"order.user\\\";i:2;s:13:\\\"order.address\\\";i:3;s:6:\\\"vendor\\\";i:4;s:6:\\\"branch\\\";i:5;s:5:\\\"items\\\";i:6;s:13:\\\"items.product\\\";i:7;s:13:\\\"items.variant\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:2:\\\"to\\\";a:1:{i:0;a:2:{s:4:\\\"name\\\";N;s:7:\\\"address\\\";s:13:\\\"test@user.com\\\";}}s:6:\\\"mailer\\\";s:4:\\\"smtp\\\";}s:5:\\\"tries\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"maxExceptions\\\";N;s:17:\\\"shouldBeEncrypted\\\";b:0;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:3:\\\"job\\\";N;}\"},\"createdAt\":1768916054,\"delay\":null}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"354\" but got code \"550\", with message \"550 5.7.0 Too many emails per second. Please upgrade your plan https://mailtrap.io/billing/plans/testing\". in C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php:331\nStack trace:\n#0 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(187): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode(\'550 5.7.0 Too m...\', Array)\n#1 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(150): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand(\'DATA\\r\\n\', Array)\n#2 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(209): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'DATA\\r\\n\', Array)\n#3 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#4 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#5 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(584): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#6 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(331): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#7 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(207): Illuminate\\Mail\\Mailer->send(\'emails.orders.s...\', Array, Object(Closure))\n#8 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(200): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\SendQueuedMailable.php(82): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\MailManager))\n#11 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Mail\\SendQueuedMailable->handle(Object(Illuminate\\Mail\\MailManager))\n#12 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#13 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#14 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#15 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#16 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#17 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#18 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#19 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#20 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Mail\\SendQueuedMailable), false)\n#21 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#22 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Mail\\SendQueuedMailable))\n#23 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Mail\\SendQueuedMailable))\n#25 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#26 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#27 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#28 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#29 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#30 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#31 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#32 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#33 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#34 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#35 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#36 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#37 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#38 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#39 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\console\\Application.php(1102): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#40 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#41 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#42 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 C:\\laragon\\www\\multi-vendor-e-commerce\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#45 {main}', '2026-01-22 11:09:44');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(4, '5cf7ef28-5f7d-46ba-b0ee-00c3bc022678', 'database', 'default', '{\"uuid\":\"5cf7ef28-5f7d-46ba-b0ee-00c3bc022678\",\"displayName\":\"Maatwebsite\\\\Excel\\\\Jobs\\\\ReadChunk\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Maatwebsite\\\\Excel\\\\Jobs\\\\ReadChunk\",\"command\":\"O:32:\\\"Maatwebsite\\\\Excel\\\\Jobs\\\\ReadChunk\\\":25:{s:7:\\\"timeout\\\";N;s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:5:\\\"queue\\\";N;s:10:\\\"connection\\\";N;s:40:\\\"\\u0000Maatwebsite\\\\Excel\\\\Jobs\\\\ReadChunk\\u0000import\\\";O:26:\\\"App\\\\Imports\\\\ProductsImport\\\":7:{s:14:\\\"\\u0000*\\u0000vendorsById\\\";a:4:{i:2;O:17:\\\"App\\\\Models\\\\Vendor\\\":36:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:7:\\\"vendors\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:0;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:2:{s:2:\\\"id\\\";i:2;s:4:\\\"name\\\";s:53:\\\"{\\\"ar\\\": \\\"ماركت باندا\\\", \\\"en\\\": \\\"Banda Vendor\\\"}\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:2:{s:2:\\\"id\\\";i:2;s:4:\\\"name\\\";s:53:\\\"{\\\"ar\\\": \\\"ماركت باندا\\\", \\\"en\\\": \\\"Banda Vendor\\\"}\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:0:{}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:4:\\\"name\\\";s:5:\\\"array\\\";s:9:\\\"is_active\\\";s:7:\\\"boolean\\\";s:11:\\\"is_featured\\\";s:7:\\\"boolean\\\";s:10:\\\"deleted_at\\\";s:8:\\\"datetime\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:13:{i:0;s:4:\\\"slug\\\";i:1;s:4:\\\"name\\\";i:2;s:8:\\\"owner_id\\\";i:3;s:5:\\\"phone\\\";i:4;s:7:\\\"address\\\";i:5;s:5:\\\"image\\\";i:6;s:9:\\\"is_active\\\";i:7;s:11:\\\"is_featured\\\";i:8;s:7:\\\"balance\\\";i:9;s:15:\\\"commission_rate\\\";i:10;s:7:\\\"plan_id\\\";i:11;s:18:\\\"subscription_start\\\";i:12;s:16:\\\"subscription_end\\\";}s:10:\\\"\\u0000*\\u0000guarded\\\";a:1:{i:0;s:1:\\\"*\\\";}s:15:\\\"\\u0000*\\u0000translatable\\\";a:1:{i:0;s:4:\\\"name\\\";}s:20:\\\"\\u0000*\\u0000translationLocale\\\";N;s:16:\\\"\\u0000*\\u0000forceDeleting\\\";b:0;}i:3;O:17:\\\"App\\\\Models\\\\Vendor\\\":36:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:7:\\\"vendors\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:0;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:2:{s:2:\\\"id\\\";i:3;s:4:\\\"name\\\";s:54:\\\"{\\\"ar\\\": \\\"ماركت هايبر\\\", \\\"en\\\": \\\"Hayper Vendor\\\"}\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:2:{s:2:\\\"id\\\";i:3;s:4:\\\"name\\\";s:54:\\\"{\\\"ar\\\": \\\"ماركت هايبر\\\", \\\"en\\\": \\\"Hayper Vendor\\\"}\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:0:{}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:4:\\\"name\\\";s:5:\\\"array\\\";s:9:\\\"is_active\\\";s:7:\\\"boolean\\\";s:11:\\\"is_featured\\\";s:7:\\\"boolean\\\";s:10:\\\"deleted_at\\\";s:8:\\\"datetime\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:13:{i:0;s:4:\\\"slug\\\";i:1;s:4:\\\"name\\\";i:2;s:8:\\\"owner_id\\\";i:3;s:5:\\\"phone\\\";i:4;s:7:\\\"address\\\";i:5;s:5:\\\"image\\\";i:6;s:9:\\\"is_active\\\";i:7;s:11:\\\"is_featured\\\";i:8;s:7:\\\"balance\\\";i:9;s:15:\\\"commission_rate\\\";i:10;s:7:\\\"plan_id\\\";i:11;s:18:\\\"subscription_start\\\";i:12;s:16:\\\"subscription_end\\\";}s:10:\\\"\\u0000*\\u0000guarded\\\";a:1:{i:0;s:1:\\\"*\\\";}s:15:\\\"\\u0000*\\u0000translatable\\\";a:1:{i:0;s:4:\\\"name\\\";}s:20:\\\"\\u0000*\\u0000translationLocale\\\";N;s:16:\\\"\\u0000*\\u0000forceDeleting\\\";b:0;}i:12;O:17:\\\"App\\\\Models\\\\Vendor\\\":36:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:7:\\\"vendors\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:0;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:2:{s:2:\\\"id\\\";i:12;s:4:\\\"name\\\";s:61:\\\"{\\\"ar\\\": \\\"فتح الله ماركت\\\", \\\"en\\\": \\\"Fathalla Market\\\"}\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:2:{s:2:\\\"id\\\";i:12;s:4:\\\"name\\\";s:61:\\\"{\\\"ar\\\": \\\"فتح الله ماركت\\\", \\\"en\\\": \\\"Fathalla Market\\\"}\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:0:{}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:4:\\\"name\\\";s:5:\\\"array\\\";s:9:\\\"is_active\\\";s:7:\\\"boolean\\\";s:11:\\\"is_featured\\\";s:7:\\\"boolean\\\";s:10:\\\"deleted_at\\\";s:8:\\\"datetime\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:13:{i:0;s:4:\\\"slug\\\";i:1;s:4:\\\"name\\\";i:2;s:8:\\\"owner_id\\\";i:3;s:5:\\\"phone\\\";i:4;s:7:\\\"address\\\";i:5;s:5:\\\"image\\\";i:6;s:9:\\\"is_active\\\";i:7;s:11:\\\"is_featured\\\";i:8;s:7:\\\"balance\\\";i:9;s:15:\\\"commission_rate\\\";i:10;s:7:\\\"plan_id\\\";i:11;s:18:\\\"subscription_start\\\";i:12;s:16:\\\"subscription_end\\\";}s:10:\\\"\\u0000*\\u0000guarded\\\";a:1:{i:0;s:1:\\\"*\\\";}s:15:\\\"\\u0000*\\u0000translatable\\\";a:1:{i:0;s:4:\\\"name\\\";}s:20:\\\"\\u0000*\\u0000translationLocale\\\";N;s:16:\\\"\\u0000*\\u0000forceDeleting\\\";b:0;}i:13;O:17:\\\"App\\\\Models\\\\Vendor\\\":36:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:7:\\\"vendors\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:0;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:2:{s:2:\\\"id\\\";i:13;s:4:\\\"name\\\";s:53:\\\"{\\\"ar\\\": \\\"سعودي ماركت\\\", \\\"en\\\": \\\"Saudi Market\\\"}\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:2:{s:2:\\\"id\\\";i:13;s:4:\\\"name\\\";s:53:\\\"{\\\"ar\\\": \\\"سعودي ماركت\\\", \\\"en\\\": \\\"Saudi Market\\\"}\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:0:{}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:4:\\\"name\\\";s:5:\\\"array\\\";s:9:\\\"is_active\\\";s:7:\\\"boolean\\\";s:11:\\\"is_featured\\\";s:7:\\\"boolean\\\";s:10:\\\"deleted_at\\\";s:8:\\\"datetime\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:13:{i:0;s:4:\\\"slug\\\";i:1;s:4:\\\"name\\\";i:2;s:8:\\\"owner_id\\\";i:3;s:5:\\\"phone\\\";i:4;s:7:\\\"address\\\";i:5;s:5:\\\"image\\\";i:6;s:9:\\\"is_active\\\";i:7;s:11:\\\"is_featured\\\";i:8;s:7:\\\"balance\\\";i:9;s:15:\\\"commission_rate\\\";i:10;s:7:\\\"plan_id\\\";i:11;s:18:\\\"subscription_start\\\";i:12;s:16:\\\"subscription_end\\\";}s:10:\\\"\\u0000*\\u0000guarded\\\";a:1:{i:0;s:1:\\\"*\\\";}s:15:\\\"\\u0000*\\u0000translatable\\\";a:1:{i:0;s:4:\\\"name\\\";}s:20:\\\"\\u0000*\\u0000translationLocale\\\";N;s:16:\\\"\\u0000*\\u0000forceDeleting\\\";b:0;}}s:16:\\\"\\u0000*\\u0000vendorsByName\\\";a:0:{}s:11:\\\"\\u0000*\\u0000rowCount\\\";i:0;s:9:\\\"\\u0000*\\u0000userId\\\";i:1;s:9:\\\"\\u0000*\\u0000output\\\";N;s:9:\\\"\\u0000*\\u0000errors\\\";a:0:{}s:11:\\\"\\u0000*\\u0000failures\\\";a:0:{}}s:40:\\\"\\u0000Maatwebsite\\\\Excel\\\\Jobs\\\\ReadChunk\\u0000reader\\\";O:36:\\\"PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\Xlsx\\\":13:{s:15:\\\"\\u0000*\\u0000readDataOnly\\\";b:1;s:17:\\\"\\u0000*\\u0000readEmptyCells\\\";b:1;s:16:\\\"\\u0000*\\u0000includeCharts\\\";b:0;s:17:\\\"\\u0000*\\u0000loadSheetsOnly\\\";N;s:22:\\\"\\u0000*\\u0000allowExternalImages\\\";b:0;s:13:\\\"\\u0000*\\u0000readFilter\\\";O:49:\\\"PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\DefaultReadFilter\\\":0:{}s:13:\\\"\\u0000*\\u0000fileHandle\\\";N;s:18:\\\"\\u0000*\\u0000securityScanner\\\";O:51:\\\"PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\Security\\\\XmlScanner\\\":2:{s:60:\\\"\\u0000PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\Security\\\\XmlScanner\\u0000pattern\\\";s:9:\\\"<!DOCTYPE\\\";s:61:\\\"\\u0000PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\Security\\\\XmlScanner\\u0000callback\\\";N;}s:53:\\\"\\u0000PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\Xlsx\\u0000referenceHelper\\\";O:40:\\\"PhpOffice\\\\PhpSpreadsheet\\\\ReferenceHelper\\\":1:{s:61:\\\"\\u0000PhpOffice\\\\PhpSpreadsheet\\\\ReferenceHelper\\u0000cellReferenceHelper\\\";N;}s:41:\\\"\\u0000PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\Xlsx\\u0000zip\\\";O:10:\\\"ZipArchive\\\":6:{s:6:\\\"lastId\\\";i:-1;s:6:\\\"status\\\";i:0;s:9:\\\"statusSys\\\";i:0;s:8:\\\"numFiles\\\";i:0;s:8:\\\"filename\\\";s:0:\\\"\\\";s:7:\\\"comment\\\";s:0:\\\"\\\";}s:49:\\\"\\u0000PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\Xlsx\\u0000styleReader\\\";N;s:52:\\\"\\u0000PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\Xlsx\\u0000sharedFormulae\\\";a:0:{}s:47:\\\"\\u0000PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\Xlsx\\u0000parseHuge\\\";b:0;}s:47:\\\"\\u0000Maatwebsite\\\\Excel\\\\Jobs\\\\ReadChunk\\u0000temporaryFile\\\";O:42:\\\"Maatwebsite\\\\Excel\\\\Files\\\\LocalTemporaryFile\\\":1:{s:52:\\\"\\u0000Maatwebsite\\\\Excel\\\\Files\\\\LocalTemporaryFile\\u0000filePath\\\";s:128:\\\"C:\\\\laragon\\\\www\\\\multi-vendor-e-commerce\\\\storage\\\\framework\\\\cache\\\\laravel-excel\\\\laravel-excel-MUxwgSoOs8ceH0hdGnFQ9T7U5jTzPaRZ.xlsx\\\";}s:43:\\\"\\u0000Maatwebsite\\\\Excel\\\\Jobs\\\\ReadChunk\\u0000sheetName\\\";s:9:\\\"Worksheet\\\";s:45:\\\"\\u0000Maatwebsite\\\\Excel\\\\Jobs\\\\ReadChunk\\u0000sheetImport\\\";r:8;s:42:\\\"\\u0000Maatwebsite\\\\Excel\\\\Jobs\\\\ReadChunk\\u0000startRow\\\";i:2;s:43:\\\"\\u0000Maatwebsite\\\\Excel\\\\Jobs\\\\ReadChunk\\u0000chunkSize\\\";i:250;s:42:\\\"\\u0000Maatwebsite\\\\Excel\\\\Jobs\\\\ReadChunk\\u0000uniqueId\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:1:{i:0;s:8943:\\\"O:37:\\\"Maatwebsite\\\\Excel\\\\Jobs\\\\AfterImportJob\\\":17:{s:45:\\\"\\u0000Maatwebsite\\\\Excel\\\\Jobs\\\\AfterImportJob\\u0000import\\\";O:26:\\\"App\\\\Imports\\\\ProductsImport\\\":7:{s:14:\\\"\\u0000*\\u0000vendorsById\\\";a:4:{i:2;O:17:\\\"App\\\\Models\\\\Vendor\\\":36:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:7:\\\"vendors\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:0;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:2:{s:2:\\\"id\\\";i:2;s:4:\\\"name\\\";s:53:\\\"{\\\"ar\\\": \\\"ماركت باندا\\\", \\\"en\\\": \\\"Banda Vendor\\\"}\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:2:{s:2:\\\"id\\\";i:2;s:4:\\\"name\\\";s:53:\\\"{\\\"ar\\\": \\\"ماركت باندا\\\", \\\"en\\\": \\\"Banda Vendor\\\"}\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:0:{}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:4:\\\"name\\\";s:5:\\\"array\\\";s:9:\\\"is_active\\\";s:7:\\\"boolean\\\";s:11:\\\"is_featured\\\";s:7:\\\"boolean\\\";s:10:\\\"deleted_at\\\";s:8:\\\"datetime\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:13:{i:0;s:4:\\\"slug\\\";i:1;s:4:\\\"name\\\";i:2;s:8:\\\"owner_id\\\";i:3;s:5:\\\"phone\\\";i:4;s:7:\\\"address\\\";i:5;s:5:\\\"image\\\";i:6;s:9:\\\"is_active\\\";i:7;s:11:\\\"is_featured\\\";i:8;s:7:\\\"balance\\\";i:9;s:15:\\\"commission_rate\\\";i:10;s:7:\\\"plan_id\\\";i:11;s:18:\\\"subscription_start\\\";i:12;s:16:\\\"subscription_end\\\";}s:10:\\\"\\u0000*\\u0000guarded\\\";a:1:{i:0;s:1:\\\"*\\\";}s:15:\\\"\\u0000*\\u0000translatable\\\";a:1:{i:0;s:4:\\\"name\\\";}s:20:\\\"\\u0000*\\u0000translationLocale\\\";N;s:16:\\\"\\u0000*\\u0000forceDeleting\\\";b:0;}i:3;O:17:\\\"App\\\\Models\\\\Vendor\\\":36:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:7:\\\"vendors\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:0;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:2:{s:2:\\\"id\\\";i:3;s:4:\\\"name\\\";s:54:\\\"{\\\"ar\\\": \\\"ماركت هايبر\\\", \\\"en\\\": \\\"Hayper Vendor\\\"}\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:2:{s:2:\\\"id\\\";i:3;s:4:\\\"name\\\";s:54:\\\"{\\\"ar\\\": \\\"ماركت هايبر\\\", \\\"en\\\": \\\"Hayper Vendor\\\"}\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:0:{}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:4:\\\"name\\\";s:5:\\\"array\\\";s:9:\\\"is_active\\\";s:7:\\\"boolean\\\";s:11:\\\"is_featured\\\";s:7:\\\"boolean\\\";s:10:\\\"deleted_at\\\";s:8:\\\"datetime\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:13:{i:0;s:4:\\\"slug\\\";i:1;s:4:\\\"name\\\";i:2;s:8:\\\"owner_id\\\";i:3;s:5:\\\"phone\\\";i:4;s:7:\\\"address\\\";i:5;s:5:\\\"image\\\";i:6;s:9:\\\"is_active\\\";i:7;s:11:\\\"is_featured\\\";i:8;s:7:\\\"balance\\\";i:9;s:15:\\\"commission_rate\\\";i:10;s:7:\\\"plan_id\\\";i:11;s:18:\\\"subscription_start\\\";i:12;s:16:\\\"subscription_end\\\";}s:10:\\\"\\u0000*\\u0000guarded\\\";a:1:{i:0;s:1:\\\"*\\\";}s:15:\\\"\\u0000*\\u0000translatable\\\";a:1:{i:0;s:4:\\\"name\\\";}s:20:\\\"\\u0000*\\u0000translationLocale\\\";N;s:16:\\\"\\u0000*\\u0000forceDeleting\\\";b:0;}i:12;O:17:\\\"App\\\\Models\\\\Vendor\\\":36:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:7:\\\"vendors\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:0;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:2:{s:2:\\\"id\\\";i:12;s:4:\\\"name\\\";s:61:\\\"{\\\"ar\\\": \\\"فتح الله ماركت\\\", \\\"en\\\": \\\"Fathalla Market\\\"}\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:2:{s:2:\\\"id\\\";i:12;s:4:\\\"name\\\";s:61:\\\"{\\\"ar\\\": \\\"فتح الله ماركت\\\", \\\"en\\\": \\\"Fathalla Market\\\"}\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:0:{}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:4:\\\"name\\\";s:5:\\\"array\\\";s:9:\\\"is_active\\\";s:7:\\\"boolean\\\";s:11:\\\"is_featured\\\";s:7:\\\"boolean\\\";s:10:\\\"deleted_at\\\";s:8:\\\"datetime\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:13:{i:0;s:4:\\\"slug\\\";i:1;s:4:\\\"name\\\";i:2;s:8:\\\"owner_id\\\";i:3;s:5:\\\"phone\\\";i:4;s:7:\\\"address\\\";i:5;s:5:\\\"image\\\";i:6;s:9:\\\"is_active\\\";i:7;s:11:\\\"is_featured\\\";i:8;s:7:\\\"balance\\\";i:9;s:15:\\\"commission_rate\\\";i:10;s:7:\\\"plan_id\\\";i:11;s:18:\\\"subscription_start\\\";i:12;s:16:\\\"subscription_end\\\";}s:10:\\\"\\u0000*\\u0000guarded\\\";a:1:{i:0;s:1:\\\"*\\\";}s:15:\\\"\\u0000*\\u0000translatable\\\";a:1:{i:0;s:4:\\\"name\\\";}s:20:\\\"\\u0000*\\u0000translationLocale\\\";N;s:16:\\\"\\u0000*\\u0000forceDeleting\\\";b:0;}i:13;O:17:\\\"App\\\\Models\\\\Vendor\\\":36:{s:13:\\\"\\u0000*\\u0000connection\\\";s:5:\\\"mysql\\\";s:8:\\\"\\u0000*\\u0000table\\\";s:7:\\\"vendors\\\";s:13:\\\"\\u0000*\\u0000primaryKey\\\";s:2:\\\"id\\\";s:10:\\\"\\u0000*\\u0000keyType\\\";s:3:\\\"int\\\";s:12:\\\"incrementing\\\";b:1;s:7:\\\"\\u0000*\\u0000with\\\";a:0:{}s:12:\\\"\\u0000*\\u0000withCount\\\";a:0:{}s:19:\\\"preventsLazyLoading\\\";b:0;s:10:\\\"\\u0000*\\u0000perPage\\\";i:15;s:6:\\\"exists\\\";b:1;s:18:\\\"wasRecentlyCreated\\\";b:0;s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;s:13:\\\"\\u0000*\\u0000attributes\\\";a:2:{s:2:\\\"id\\\";i:13;s:4:\\\"name\\\";s:53:\\\"{\\\"ar\\\": \\\"سعودي ماركت\\\", \\\"en\\\": \\\"Saudi Market\\\"}\\\";}s:11:\\\"\\u0000*\\u0000original\\\";a:2:{s:2:\\\"id\\\";i:13;s:4:\\\"name\\\";s:53:\\\"{\\\"ar\\\": \\\"سعودي ماركت\\\", \\\"en\\\": \\\"Saudi Market\\\"}\\\";}s:10:\\\"\\u0000*\\u0000changes\\\";a:0:{}s:11:\\\"\\u0000*\\u0000previous\\\";a:0:{}s:8:\\\"\\u0000*\\u0000casts\\\";a:4:{s:4:\\\"name\\\";s:5:\\\"array\\\";s:9:\\\"is_active\\\";s:7:\\\"boolean\\\";s:11:\\\"is_featured\\\";s:7:\\\"boolean\\\";s:10:\\\"deleted_at\\\";s:8:\\\"datetime\\\";}s:17:\\\"\\u0000*\\u0000classCastCache\\\";a:0:{}s:21:\\\"\\u0000*\\u0000attributeCastCache\\\";a:0:{}s:13:\\\"\\u0000*\\u0000dateFormat\\\";N;s:10:\\\"\\u0000*\\u0000appends\\\";a:0:{}s:19:\\\"\\u0000*\\u0000dispatchesEvents\\\";a:0:{}s:14:\\\"\\u0000*\\u0000observables\\\";a:0:{}s:12:\\\"\\u0000*\\u0000relations\\\";a:0:{}s:10:\\\"\\u0000*\\u0000touches\\\";a:0:{}s:27:\\\"\\u0000*\\u0000relationAutoloadCallback\\\";N;s:26:\\\"\\u0000*\\u0000relationAutoloadContext\\\";N;s:10:\\\"timestamps\\\";b:1;s:13:\\\"usesUniqueIds\\\";b:0;s:9:\\\"\\u0000*\\u0000hidden\\\";a:0:{}s:10:\\\"\\u0000*\\u0000visible\\\";a:0:{}s:11:\\\"\\u0000*\\u0000fillable\\\";a:13:{i:0;s:4:\\\"slug\\\";i:1;s:4:\\\"name\\\";i:2;s:8:\\\"owner_id\\\";i:3;s:5:\\\"phone\\\";i:4;s:7:\\\"address\\\";i:5;s:5:\\\"image\\\";i:6;s:9:\\\"is_active\\\";i:7;s:11:\\\"is_featured\\\";i:8;s:7:\\\"balance\\\";i:9;s:15:\\\"commission_rate\\\";i:10;s:7:\\\"plan_id\\\";i:11;s:18:\\\"subscription_start\\\";i:12;s:16:\\\"subscription_end\\\";}s:10:\\\"\\u0000*\\u0000guarded\\\";a:1:{i:0;s:1:\\\"*\\\";}s:15:\\\"\\u0000*\\u0000translatable\\\";a:1:{i:0;s:4:\\\"name\\\";}s:20:\\\"\\u0000*\\u0000translationLocale\\\";N;s:16:\\\"\\u0000*\\u0000forceDeleting\\\";b:0;}}s:16:\\\"\\u0000*\\u0000vendorsByName\\\";a:0:{}s:11:\\\"\\u0000*\\u0000rowCount\\\";i:0;s:9:\\\"\\u0000*\\u0000userId\\\";i:1;s:9:\\\"\\u0000*\\u0000output\\\";N;s:9:\\\"\\u0000*\\u0000errors\\\";a:0:{}s:11:\\\"\\u0000*\\u0000failures\\\";a:0:{}}s:45:\\\"\\u0000Maatwebsite\\\\Excel\\\\Jobs\\\\AfterImportJob\\u0000reader\\\";O:24:\\\"Maatwebsite\\\\Excel\\\\Reader\\\":5:{s:14:\\\"\\u0000*\\u0000spreadsheet\\\";N;s:15:\\\"\\u0000*\\u0000sheetImports\\\";a:0:{}s:14:\\\"\\u0000*\\u0000currentFile\\\";O:42:\\\"Maatwebsite\\\\Excel\\\\Files\\\\LocalTemporaryFile\\\":1:{s:52:\\\"\\u0000Maatwebsite\\\\Excel\\\\Files\\\\LocalTemporaryFile\\u0000filePath\\\";s:128:\\\"C:\\\\laragon\\\\www\\\\multi-vendor-e-commerce\\\\storage\\\\framework\\\\cache\\\\laravel-excel\\\\laravel-excel-MUxwgSoOs8ceH0hdGnFQ9T7U5jTzPaRZ.xlsx\\\";}s:23:\\\"\\u0000*\\u0000temporaryFileFactory\\\";O:44:\\\"Maatwebsite\\\\Excel\\\\Files\\\\TemporaryFileFactory\\\":2:{s:59:\\\"\\u0000Maatwebsite\\\\Excel\\\\Files\\\\TemporaryFileFactory\\u0000temporaryPath\\\";s:76:\\\"C:\\\\laragon\\\\www\\\\multi-vendor-e-commerce\\\\storage\\\\framework\\/cache\\/laravel-excel\\\";s:59:\\\"\\u0000Maatwebsite\\\\Excel\\\\Files\\\\TemporaryFileFactory\\u0000temporaryDisk\\\";N;}s:9:\\\"\\u0000*\\u0000reader\\\";O:36:\\\"PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\Xlsx\\\":13:{s:15:\\\"\\u0000*\\u0000readDataOnly\\\";b:1;s:17:\\\"\\u0000*\\u0000readEmptyCells\\\";b:1;s:16:\\\"\\u0000*\\u0000includeCharts\\\";b:0;s:17:\\\"\\u0000*\\u0000loadSheetsOnly\\\";N;s:22:\\\"\\u0000*\\u0000allowExternalImages\\\";b:0;s:13:\\\"\\u0000*\\u0000readFilter\\\";O:49:\\\"PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\DefaultReadFilter\\\":0:{}s:13:\\\"\\u0000*\\u0000fileHandle\\\";N;s:18:\\\"\\u0000*\\u0000securityScanner\\\";O:51:\\\"PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\Security\\\\XmlScanner\\\":2:{s:60:\\\"\\u0000PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\Security\\\\XmlScanner\\u0000pattern\\\";s:9:\\\"<!DOCTYPE\\\";s:61:\\\"\\u0000PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\Security\\\\XmlScanner\\u0000callback\\\";N;}s:53:\\\"\\u0000PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\Xlsx\\u0000referenceHelper\\\";O:40:\\\"PhpOffice\\\\PhpSpreadsheet\\\\ReferenceHelper\\\":1:{s:61:\\\"\\u0000PhpOffice\\\\PhpSpreadsheet\\\\ReferenceHelper\\u0000cellReferenceHelper\\\";N;}s:41:\\\"\\u0000PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\Xlsx\\u0000zip\\\";O:10:\\\"ZipArchive\\\":6:{s:6:\\\"lastId\\\";i:-1;s:6:\\\"status\\\";i:0;s:9:\\\"statusSys\\\";i:0;s:8:\\\"numFiles\\\";i:0;s:8:\\\"filename\\\";s:0:\\\"\\\";s:7:\\\"comment\\\";s:0:\\\"\\\";}s:49:\\\"\\u0000PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\Xlsx\\u0000styleReader\\\";N;s:52:\\\"\\u0000PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\Xlsx\\u0000sharedFormulae\\\";a:0:{}s:47:\\\"\\u0000PhpOffice\\\\PhpSpreadsheet\\\\Reader\\\\Xlsx\\u0000parseHuge\\\";b:0;}}s:52:\\\"\\u0000Maatwebsite\\\\Excel\\\\Jobs\\\\AfterImportJob\\u0000dependencyIds\\\";a:0:{}s:47:\\\"\\u0000Maatwebsite\\\\Excel\\\\Jobs\\\\AfterImportJob\\u0000interval\\\";i:60;s:9:\\\"\\u0000*\\u0000events\\\";a:0:{}s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:12:\\\"messageGroup\\\";N;s:12:\\\"deduplicator\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\\\";}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:9:\\\"\\u0000*\\u0000events\\\";a:0:{}s:3:\\\"job\\\";N;}\"},\"createdAt\":1769090563,\"delay\":null}', 'Exception: Vendor not found. Please provide a valid vendor ID or name. in C:\\laragon\\www\\multi-vendor-e-commerce\\app\\Imports\\ProductsImport.php:79\nStack trace:\n#0 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\maatwebsite\\excel\\src\\Imports\\ModelManager.php(100): App\\Imports\\ProductsImport->model(Array)\n#1 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\maatwebsite\\excel\\src\\Imports\\ModelManager.php(110): Maatwebsite\\Excel\\Imports\\ModelManager->toModels(Object(App\\Imports\\ProductsImport), Array, 2)\n#2 [internal function]: Maatwebsite\\Excel\\Imports\\ModelManager->Maatwebsite\\Excel\\Imports\\{closure}(Array, 2)\n#3 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Collections\\Arr.php(820): array_map(Object(Closure), Array, Array)\n#4 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Collections\\Collection.php(846): Illuminate\\Support\\Arr::map(Array, Object(Closure))\n#5 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Collections\\Traits\\EnumeratesValues.php(441): Illuminate\\Support\\Collection->map(Object(Closure))\n#6 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\maatwebsite\\excel\\src\\Imports\\ModelManager.php(109): Illuminate\\Support\\Collection->flatMap(Object(Closure))\n#7 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\maatwebsite\\excel\\src\\Imports\\ModelManager.php(80): Maatwebsite\\Excel\\Imports\\ModelManager->massFlush(Object(App\\Imports\\ProductsImport))\n#8 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\maatwebsite\\excel\\src\\Imports\\ModelImporter.php(114): Maatwebsite\\Excel\\Imports\\ModelManager->flush(Object(App\\Imports\\ProductsImport), true)\n#9 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\maatwebsite\\excel\\src\\Imports\\ModelImporter.php(108): Maatwebsite\\Excel\\Imports\\ModelImporter->flush(Object(App\\Imports\\ProductsImport), 250, 2)\n#10 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\maatwebsite\\excel\\src\\Sheet.php(256): Maatwebsite\\Excel\\Imports\\ModelImporter->import(Object(PhpOffice\\PhpSpreadsheet\\Worksheet\\Worksheet), Object(App\\Imports\\ProductsImport), 2)\n#11 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\maatwebsite\\excel\\src\\Jobs\\ReadChunk.php(211): Maatwebsite\\Excel\\Sheet->import(Object(App\\Imports\\ProductsImport), 2)\n#12 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Concerns\\ManagesTransactions.php(35): Maatwebsite\\Excel\\Jobs\\ReadChunk->Maatwebsite\\Excel\\Jobs\\{closure}(Object(Illuminate\\Database\\MySqlConnection))\n#13 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\maatwebsite\\excel\\src\\Transactions\\DbTransactionHandler.php(30): Illuminate\\Database\\Connection->transaction(Object(Closure))\n#14 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\maatwebsite\\excel\\src\\Jobs\\ReadChunk.php(210): Maatwebsite\\Excel\\Transactions\\DbTransactionHandler->__invoke(Object(Closure))\n#15 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Maatwebsite\\Excel\\Jobs\\ReadChunk->handle(Object(Maatwebsite\\Excel\\Transactions\\DbTransactionHandler))\n#16 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#18 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#19 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#20 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Container\\Container->call(Array)\n#21 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Maatwebsite\\Excel\\Jobs\\ReadChunk))\n#22 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Maatwebsite\\Excel\\Jobs\\ReadChunk))\n#23 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(133): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(134): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Maatwebsite\\Excel\\Jobs\\ReadChunk), false)\n#25 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(180): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Maatwebsite\\Excel\\Jobs\\ReadChunk))\n#26 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(137): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Maatwebsite\\Excel\\Jobs\\ReadChunk))\n#27 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(127): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Maatwebsite\\Excel\\Jobs\\ReadChunk))\n#29 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#30 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(485): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(435): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#32 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(201): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#33 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#35 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#37 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#38 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#39 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(799): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#40 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#41 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\console\\Command\\Command.php(341): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#42 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\console\\Application.php(1102): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\console\\Application.php(356): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\symfony\\console\\Application.php(195): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\laragon\\www\\multi-vendor-e-commerce\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\laragon\\www\\multi-vendor-e-commerce\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#49 {main}', '2026-01-22 12:02:43');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(36, '2026_01_15_154722_add_expires_at_to_password_reset_tokens_table', 17),
(37, '2026_01_18_101930_add_user_type_to_vendor_users_table', 18),
(38, '2026_01_18_120717_create_vendor_settings_table', 19),
(39, '2026_01_18_145542_create_favorites_table', 20),
(40, '2026_01_18_145810_create_addresses_table', 20),
(41, '2026_01_18_150006_create_sliders_table', 20),
(42, '2026_01_18_153221_add_is_active_to_addresses_table', 21),
(43, '2026_01_18_155417_create_tickets_table', 22),
(44, '2026_01_18_155427_create_ticket_messages_table', 22),
(46, '2026_01_18_165734_create_cart_items_table', 23),
(52, '2026_01_19_110102_create_coupons_table', 24),
(53, '2026_01_19_111832_add_wallet_to_users_table', 24),
(54, '2026_01_19_112342_create_wallet_transactions_table', 24),
(55, '2026_01_19_112643_create_point_transactions_table', 24),
(56, '2026_01_19_113050_create_orders_table copy', 24),
(57, '2026_01_19_115012_create_vendor_orders_table', 24),
(58, '2026_01_19_115950_create_vendor_order_items_table', 24),
(59, '2026_01_19_175224_add_payment_status_to_orders_table', 25),
(60, '2026_01_20_111524_add_refund_fields_to_orders_table', 25),
(61, '2026_01_20_132014_create_order_logs_table', 26),
(62, '2026_01_20_140401_create_product_ratings_table', 27),
(63, '2026_01_20_140411_create_vendor_ratings_table', 27),
(64, '2026_01_20_140500_create_product_reports_table', 27),
(65, '2026_01_20_140510_create_vendor_reports_table', 27),
(66, '2026_01_20_162810_add_is_visible_to_product_and_vendor_ratings', 28),
(67, '2026_01_21_123017_add_payment_method_and_paid_at_to_orders_table', 29),
(68, '2026_01_21_123031_create_vendor_balance_transactions_table', 29),
(69, '2026_01_21_124126_create_vendor_withdrawals_table', 30),
(71, '2026_01_21_125125_create_order_refund_requests_table', 31),
(72, '2026_01_22_112608_add_performance_indexes_to_tables', 32);

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
(11, 'App\\Models\\User', 17),
(12, 'App\\Models\\User', 17),
(13, 'App\\Models\\User', 17),
(14, 'App\\Models\\User', 17),
(16, 'App\\Models\\User', 17),
(27, 'App\\Models\\User', 17),
(1, 'App\\Models\\User', 19),
(2, 'App\\Models\\User', 19),
(11, 'App\\Models\\User', 19),
(12, 'App\\Models\\User', 19),
(13, 'App\\Models\\User', 19),
(14, 'App\\Models\\User', 19),
(15, 'App\\Models\\User', 19),
(16, 'App\\Models\\User', 19),
(27, 'App\\Models\\User', 19);

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
(3, 'App\\Models\\User', 18),
(4, 'App\\Models\\User', 19);

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

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0b711f26-6b16-45d1-adfb-45aebc069123', 'App\\Notifications\\OrderStatusUpdatedNotification', 'App\\Models\\User', 18, '{\"order_id\":6,\"vendor_order_id\":11,\"status\":\"processing\",\"title\":\"Your order status has been updated\",\"message\":\"Vendor order #11 of order #6 status changed to processing\"}', NULL, '2026-01-21 11:03:10', '2026-01-21 11:03:10'),
('345a271f-4ae6-42a8-874a-c0028bc28cbf', 'App\\Notifications\\AdminManualNotification', 'App\\Models\\User', 18, '{\"title\":\"Test Notification\",\"message\":\"Test Content\",\"sent_by_admin_id\":1}', NULL, '2026-01-21 10:15:03', '2026-01-21 10:15:03'),
('baabb43e-9a75-4cd2-b456-56187862e465', 'App\\Notifications\\TicketCreatedNotification', 'App\\Models\\User', 1, '{\"ticket_id\":6,\"title\":\"New support ticket\",\"message\":\"Ticket #6 - Test Subject\",\"status\":null,\"ticket_from\":\"user\",\"vendor_id\":null}', NULL, '2026-01-20 14:28:35', '2026-01-20 14:28:35'),
('db5ac76d-f9ce-4396-8f60-6ed22cb1e020', 'App\\Notifications\\AdminManualNotification', 'App\\Models\\User', 18, '{\"title\":\"Test Notification\",\"message\":\"Test Content\",\"sent_by_admin_id\":1}', NULL, '2026-01-21 10:15:04', '2026-01-21 10:15:04'),
('dc7e7c1d-4b69-4d56-9100-166c1804e3b3', 'App\\Notifications\\OrderStatusUpdatedNotification', 'App\\Models\\User', 18, '{\"order_id\":6,\"vendor_order_id\":11,\"status\":\"shipped\",\"title\":\"Your order status has been updated\",\"message\":\"Vendor order #11 of order #6 status changed to shipped\"}', NULL, '2026-01-21 11:03:15', '2026-01-21 11:03:15'),
('f145a841-f382-407c-818d-38b3ab7134e7', 'App\\Notifications\\TicketCreatedNotification', 'App\\Models\\User', 1, '{\"ticket_id\":5,\"title\":\"New support ticket\",\"message\":\"Ticket #5 - Test Subject\",\"status\":null,\"ticket_from\":\"user\",\"vendor_id\":null}', NULL, '2026-01-20 11:55:56', '2026-01-20 11:55:56'),
('f26d0868-b478-486a-9c2c-70af06c2be21', 'App\\Notifications\\OrderStatusUpdatedNotification', 'App\\Models\\User', 18, '{\"order_id\":6,\"vendor_order_id\":11,\"status\":\"delivered\",\"title\":\"Your order status has been updated\",\"message\":\"Vendor order #11 of order #6 status changed to delivered\"}', NULL, '2026-01-21 11:03:20', '2026-01-21 11:03:20'),
('f936d24e-9971-49e3-bddf-0b84bc1086b6', 'App\\Notifications\\OrderStatusUpdatedNotification', 'App\\Models\\User', 18, '{\"order_id\":6,\"vendor_order_id\":10,\"status\":\"delivered\",\"title\":\"Your order status has been updated\",\"message\":\"Vendor order #10 of order #6 status changed to delivered\"}', NULL, '2026-01-21 11:04:57', '2026-01-21 11:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `order_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `coupon_id` bigint UNSIGNED DEFAULT NULL,
  `coupon_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_shipping` decimal(10,2) NOT NULL DEFAULT '0.00',
  `points_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL,
  `wallet_used` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('pending','processing','shipped','delivered','cancelled','refunded') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_status` enum('pending','paid','failed','refunded') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `vendor_balance_processed_at` timestamp NULL DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `address_id` bigint UNSIGNED DEFAULT NULL,
  `total_commission` decimal(10,2) NOT NULL DEFAULT '0.00',
  `refund_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `refunded_total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `sub_total`, `order_discount`, `coupon_id`, `coupon_discount`, `total_shipping`, `points_discount`, `total`, `wallet_used`, `status`, `payment_status`, `payment_method`, `paid_at`, `vendor_balance_processed_at`, `notes`, `address_id`, `total_commission`, `refund_status`, `refunded_total`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 18, 55.00, 0.00, NULL, 0.00, 25.00, 0.00, 80.00, 0.00, 'pending', 'pending', NULL, NULL, NULL, NULL, 1, 0.00, 'none', 0.00, '2026-01-19 11:57:37', '2026-01-19 11:57:37', NULL),
(2, 18, 960.00, 0.00, NULL, 0.00, 25.00, 0.00, 985.00, 0.00, 'cancelled', 'pending', NULL, NULL, NULL, NULL, 1, 0.00, 'none', 0.00, '2026-01-19 12:52:44', '2026-01-19 13:44:51', NULL),
(3, 18, 971.00, 49.00, NULL, 0.00, 25.00, 0.00, 996.00, 0.00, 'pending', 'paid', 'COD', '2026-01-21 10:35:47', '2026-01-21 10:35:47', NULL, 1, 0.00, 'none', 0.00, '2026-01-19 13:08:22', '2026-01-21 10:35:47', NULL),
(4, 18, 971.00, 49.00, NULL, 0.00, 25.00, 0.00, 947.00, 0.00, 'processing', 'pending', NULL, NULL, NULL, NULL, 1, 0.00, 'none', 0.00, '2026-01-19 13:16:43', '2026-01-20 08:23:26', NULL),
(5, 18, 50.00, 0.00, NULL, 0.00, 0.00, 0.00, 50.00, 0.00, 'pending', 'pending', NULL, NULL, NULL, NULL, 1, 0.00, 'none', 0.00, '2026-01-19 13:50:08', '2026-01-19 13:50:08', NULL),
(6, 18, 971.00, 49.00, NULL, 0.00, 100.00, 0.00, 1022.00, 0.00, 'delivered', 'pending', NULL, NULL, NULL, NULL, 1, 0.00, 'none', 0.00, '2026-01-19 14:54:26', '2026-01-21 11:04:54', NULL),
(7, 18, 971.00, 49.00, 1, 242.75, 100.00, 0.00, 779.25, 0.00, 'refunded', 'refunded', NULL, NULL, NULL, NULL, 1, 0.00, 'refunded', 779.25, '2026-01-19 14:57:29', '2026-01-20 10:54:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_logs`
--

CREATE TABLE `order_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `vendor_order_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_logs`
--

INSERT INTO `order_logs` (`id`, `order_id`, `vendor_order_id`, `user_id`, `type`, `from_status`, `to_status`, `payload`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 18, 'order_seed', NULL, 'pending', '{\"total\": 80, \"payment_status\": \"pending\"}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(2, 1, 1, 18, 'vendor_seed', NULL, 'pending', '{\"total\": 70, \"vendor_id\": 13}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(3, 1, 2, 18, 'vendor_seed', NULL, 'pending', '{\"total\": 10, \"vendor_id\": 2}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(4, 2, NULL, 18, 'order_seed', NULL, 'cancelled', '{\"total\": 985, \"payment_status\": \"pending\"}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(5, 2, 3, 18, 'vendor_seed', NULL, 'cancelled', '{\"total\": 30, \"vendor_id\": 2}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(6, 2, 4, 18, 'vendor_seed', NULL, 'cancelled', '{\"total\": 955, \"vendor_id\": 13}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(7, 3, NULL, 18, 'order_seed', NULL, 'pending', '{\"total\": 996, \"payment_status\": \"pending\"}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(8, 3, 5, 18, 'vendor_seed', NULL, 'pending', '{\"total\": 946, \"vendor_id\": 13}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(9, 3, 6, 18, 'vendor_seed', NULL, 'pending', '{\"total\": 50, \"vendor_id\": 2}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(10, 4, NULL, 18, 'order_seed', NULL, 'processing', '{\"total\": 947, \"payment_status\": \"pending\"}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(11, 4, 7, 18, 'vendor_seed', NULL, 'processing', '{\"total\": 946, \"vendor_id\": 13}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(12, 4, 8, 18, 'vendor_seed', NULL, 'pending', '{\"total\": 50, \"vendor_id\": 2}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(13, 5, NULL, 18, 'order_seed', NULL, 'pending', '{\"total\": 50, \"payment_status\": \"pending\"}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(14, 5, 9, 18, 'vendor_seed', NULL, 'pending', '{\"total\": 50, \"vendor_id\": 2}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(15, 6, NULL, 18, 'order_seed', NULL, 'pending', '{\"total\": 1022, \"payment_status\": \"pending\"}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(16, 6, 10, 18, 'vendor_seed', NULL, 'pending', '{\"total\": 1021, \"vendor_id\": 13}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(17, 6, 11, 18, 'vendor_seed', NULL, 'pending', '{\"total\": 50, \"vendor_id\": 2}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(18, 7, NULL, 18, 'order_seed', NULL, 'refunded', '{\"total\": 779.25, \"payment_status\": \"refunded\"}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(19, 7, 12, 18, 'vendor_seed', NULL, 'refunded', '{\"total\": 790.75, \"vendor_id\": 13}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(20, 7, 13, 18, 'vendor_seed', NULL, 'refunded', '{\"total\": 37.5, \"vendor_id\": 2}', '2026-01-20 11:26:43', '2026-01-20 11:26:43'),
(21, 6, 10, 16, 'vendor_status_change', 'pending', 'processing', NULL, '2026-01-20 11:34:14', '2026-01-20 11:34:14'),
(22, 6, 10, 16, 'vendor_status_change', 'processing', 'shipped', NULL, '2026-01-20 11:38:02', '2026-01-20 11:38:02'),
(23, 3, NULL, 18, 'payment_change', 'pending', 'paid', '{\"payment_method\": \"COD\"}', '2026-01-21 10:35:47', '2026-01-21 10:35:47'),
(24, 6, 11, 3, 'vendor_status_change', 'pending', 'processing', NULL, '2026-01-21 11:03:10', '2026-01-21 11:03:10'),
(25, 6, 11, 3, 'vendor_status_change', 'processing', 'shipped', NULL, '2026-01-21 11:03:15', '2026-01-21 11:03:15'),
(26, 6, 11, 3, 'vendor_status_change', 'shipped', 'delivered', NULL, '2026-01-21 11:03:20', '2026-01-21 11:03:20'),
(27, 6, 10, 16, 'order_status_change', 'processing', 'delivered', NULL, '2026-01-21 11:04:54', '2026-01-21 11:04:54'),
(28, 6, 10, 16, 'vendor_status_change', 'shipped', 'delivered', NULL, '2026-01-21 11:04:57', '2026-01-21 11:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `order_refund_requests`
--

CREATE TABLE `order_refund_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `processed_by` bigint UNSIGNED DEFAULT NULL,
  `processed_at` timestamp NULL DEFAULT NULL,
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

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`id`, `email`, `phone`, `token`, `expires_at`, `created_at`) VALUES
(3, 'test@user.com', NULL, '$2y$12$twBtOza3Ij4Ibj6K1Etz6u9ya/W5.NdBTpuumDukF1SkVlM9JVNdO', NULL, '2026-01-21 10:07:57'),
(4, 'test@user.com', '+201234567890', '329056', '2026-01-21 10:22:49', '2026-01-21 10:12:49');

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
(2, 'App\\Models\\User', 18, 'auth-token', '3cd639fe7b6102a92bde130df86654687cf99f1b0451ed4a2d53f5d1f51cadfb', '[\"*\"]', '2026-01-21 11:05:00', NULL, '2026-01-15 12:40:15', '2026-01-21 11:05:00'),
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
-- Table structure for table `point_transactions`
--

CREATE TABLE `point_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `type` enum('addition','subtraction') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int NOT NULL,
  `balance_after` int NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `point_transactions`
--

INSERT INTO `point_transactions` (`id`, `user_id`, `type`, `amount`, `balance_after`, `notes`, `created_at`, `updated_at`) VALUES
(1, 18, 'addition', 0, 0, 'Order #3', '2026-01-19 13:08:22', '2026-01-19 13:08:22'),
(2, 18, 'addition', 0, 0, 'Order #4', '2026-01-19 13:16:43', '2026-01-19 13:16:43'),
(3, 18, 'addition', 5, 5, 'Cashback for Order #5', '2026-01-19 13:50:08', '2026-01-19 13:50:08'),
(4, 18, 'addition', 102, 107, 'Cashback for Order #6', '2026-01-19 14:54:26', '2026-01-19 14:54:26'),
(5, 18, 'addition', 78, 185, 'Cashback for Order #7', '2026-01-19 14:57:29', '2026-01-19 14:57:29'),
(6, 18, 'subtraction', 5, 180, 'test action by admin', '2026-01-21 10:07:42', '2026-01-21 10:07:42');

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
(10, 13, 'simple', '{\"ar\": \"نسكافية جولد 190 جرام\", \"en\": \"Nescafe Gold - 190 g\"}', '{\"ar\": \"نسكافيه جولد 190 جم قهوة فاخرة مصنوعة من أجود أنواع حبوب البن المختارة بعناية،\\r\\nتتميز بمذاق غني وناعم ورائحة مميزة تمنحك تجربة قهوة راقية في كل كوب.\\r\\n\\r\\nسواء كنت تفضلها سادة أو بالحليب، نسكافيه جولد هي الاختيار المثالي لعشاق القهوة المميزة.\", \"en\": \"Nescafé Gold 190g offers a rich, smooth, and aromatic coffee experience made from carefully selected premium coffee beans.\\r\\nIts well-balanced flavor and refined taste make it perfect for coffee lovers who enjoy a high-quality cup every time.\\r\\n\\r\\nWhether you prefer it black or with milk, Nescafé Gold delivers a satisfying and elegant coffee moment.\"}', 'products/Lioc9Z8E4kb9xm5nmyKqKJI4Jg3vMvxJyO6ZWsOZ.webp', 'NS-012', 'nescafe-gold-190-g', 440.00, 20.00, 'fixed', 1, 1, 0, 1, 0, '2026-01-15 10:46:23', '2026-01-15 10:46:42', NULL),
(11, 13, 'variable', '{\"ar\": \"نيدو لبن بودر\", \"en\": \"Nido Powdered Milk\"}', '{\"ar\": \"حليب نيدو المجفف هو خيار مثالي للعائلة، يتميز بطعم غني وقيمة غذائية عالية. غني بالكالسيوم والبروتينات والفيتامينات الأساسية التي تساعد على تقوية العظام ودعم النمو الصحي. يمكن استخدامه في تحضير المشروبات الساخنة، الحلويات، أو إضافته للوصفات اليومية بسهولة.\", \"en\": \"Nido Powdered Milk is a nutritious and delicious choice for the whole family. It is rich in calcium, protein, and essential vitamins that support strong bones and healthy growth. Perfect for hot drinks, desserts, or everyday recipes, Nido offers a creamy taste and easy preparation.\"}', 'products/dLRFQznTyk26GnNgafkCdZDfpjXUNbRM4R1sUdon.webp', 'MI-120', 'nido-powdered-milk', 0.00, 10.00, 'percentage', 1, 1, 0, 1, 0, '2026-01-18 10:37:46', '2026-01-18 11:06:47', NULL),
(14, 13, 'simple', '{\"ar\": \"العبد كوكيز شانكس بالشوكولاتة - 18 قطعة\", \"en\": \"El Abd Chunks Chocolate Cookies - 18 Pieces\"}', '{\"ar\": \"استمتع بالمذاق الغني لـ كوكيز العبد بقطع الشوكولاتة، المخبوزة بعناية والمليئة بقطع الشوكولاتة اللذيذة في كل قضمة. تتميز بقوام مقرمش من الخارج وطري من الداخل، مما يجعلها خيارًا مثاليًا للمشاركة مع العائلة والأصدقاء.\", \"en\": \"Enjoy the rich taste of El Abd Chunks Chocolate Cookies, baked to perfection with generous chocolate chunks in every bite. These delicious cookies offer a crispy texture on the outside and a soft, flavorful inside, making them perfect for sharing with family and friends.\"}', 'products/yfGooOAVAwq61Dj0dc6A95xQsRoFZ5rpKVG6BOoZ.jpg', 'PRD-101', 'el-abd-chunks-chocolate-cookies-18-pieces', 100.00, 5.00, 'fixed', 1, 0, 1, 1, 0, '2026-01-22 12:10:01', '2026-01-22 12:10:02', NULL),
(15, 13, 'variable', '{\"ar\": \"العبد كوكيز بالشوكولاتة\", \"en\": \"El Abd Chocolate Cookies\"}', '{\"ar\": \"استمتع بالمذاق الغني لـ كوكيز العبد الشوكولاتة، المخبوزة بعناية والمليئة بقطع الشوكولاتة اللذيذة في كل قضمة. تتميز بقوام مقرمش من الخارج وطري من الداخل، مما يجعلها خيارًا مثاليًا للمشاركة مع العائلة والأصدقاء.\", \"en\": \"Enjoy the rich taste of El Abd Chocolate Cookies, baked to perfection with generous chocolate in every bite. These delicious cookies offer a crispy texture on the outside and a soft, flavorful inside, making them perfect for sharing with family and friends.\"}', 'products/Yyvqrv2ABVRy3dxpkHTdNQBL49p6blPdKD9nSnuM.jpg', 'PRD-103', 'el-abd-chocolate-cookies', 0.00, 10.00, 'percentage', 1, 0, 1, 1, 0, '2026-01-22 12:20:40', '2026-01-22 12:57:15', NULL);

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
(18, 10, 'App\\Models\\Product', 'products/x5nWxsnFnB4VZjae6Vae0tmB3Gvwowf1M9SFUUGi.webp', '2026-01-15 10:46:23', '2026-01-15 10:46:23'),
(51, 11, 'App\\Models\\Product', 'products/ht6PLvdIjgBBNUhvMST4wK1039d8oRslKASJmh9p.webp', '2026-01-18 11:24:25', '2026-01-18 11:24:25'),
(53, 11, 'App\\Models\\Product', 'products/7iPGhfFcRAohusghVd03HomwLXBcsZOcARf4kPAv.webp', '2026-01-18 11:24:25', '2026-01-18 11:24:25'),
(54, 11, 'App\\Models\\Product', 'products/m46IwYDG177gxRYs3FBLpooU12Zwj4kX5jy4hgW7.webp', '2026-01-18 11:24:25', '2026-01-18 11:24:25'),
(55, 11, 'App\\Models\\Product', 'products/Nqk1GuhUWNDtmK29xhQ8cwCEgSoAKJlcsaiEPK2e.webp', '2026-01-18 11:24:25', '2026-01-18 11:24:25'),
(56, 11, 'App\\Models\\Product', 'products/OFQg29hi6BUYLZXjiKy2ip3RbknuL1l5JCNMO5ub.webp', '2026-01-18 11:25:00', '2026-01-18 11:25:00'),
(57, 12, 'App\\Models\\Product', 'products/HdJ1MX3T9G6qOdrIosWnhnnMSHt5dZ95mpcVJVQB.jpg', '2026-01-22 12:03:51', '2026-01-22 12:03:51'),
(58, 13, 'App\\Models\\Product', 'products/RsqWZA7vXZZZdgRQhpnf9KxUIu3VEjuBzcG2XSYo.jpg', '2026-01-22 12:07:55', '2026-01-22 12:07:55'),
(59, 14, 'App\\Models\\Product', 'products/1BPC6QnMogXzUVa1hF9z4ZOUpEQGRmePQVWMNQO7.jpg', '2026-01-22 12:10:03', '2026-01-22 12:10:03'),
(60, 14, 'App\\Models\\Product', 'products/tB2eubuO2s0iUEtFXSsCKmkRBiuMGzsAmhf9GPPv.webp', '2026-01-22 12:15:36', '2026-01-22 12:15:36'),
(61, 15, 'App\\Models\\Product', 'products/J4Jnrm9ZltrU1sB0023XxhbsqQxhEnQbx0kZBoEw.jpg', '2026-01-22 12:20:41', '2026-01-22 12:20:41'),
(62, 15, 'App\\Models\\Product', 'products/rNDh49frgMpMhrKUcjeV46X4d4FsDJtJk3nFD5Qo.jpg', '2026-01-22 12:20:41', '2026-01-22 12:20:41'),
(63, 15, 'App\\Models\\Product', 'products/iZfgKzRxtPo7lBdPmnZt5N7BiNUMPdyzJsMonXRa.jpg', '2026-01-22 12:20:42', '2026-01-22 12:20:42'),
(72, 15, 'App\\Models\\Product', 'products/QDKHQIPqDI0RlnhvDFBCWObpKA9BZgf6Qo8oQbRn.webp', '2026-01-22 12:57:15', '2026-01-22 12:57:15');

-- --------------------------------------------------------

--
-- Table structure for table `product_ratings`
--

CREATE TABLE `product_ratings` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `rating` tinyint UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_ratings`
--

INSERT INTO `product_ratings` (`id`, `product_id`, `user_id`, `rating`, `comment`, `is_visible`, `created_at`, `updated_at`) VALUES
(1, 11, 18, 3, 'Great Product', 1, '2026-01-20 14:10:44', '2026-01-20 14:38:35');

-- --------------------------------------------------------

--
-- Table structure for table `product_relations`
--

CREATE TABLE `product_relations` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `related_product_id` bigint UNSIGNED NOT NULL,
  `type` enum('related','cross_sell','up_sell','upsell') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'related',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_relations`
--

INSERT INTO `product_relations` (`id`, `product_id`, `related_product_id`, `type`, `created_at`, `updated_at`) VALUES
(1, 6, 1, 'related', '2026-01-13 15:43:07', '2026-01-13 15:43:07'),
(26, 15, 14, 'related', '2026-01-22 15:25:11', '2026-01-22 15:25:11'),
(27, 15, 14, 'cross_sell', '2026-01-22 15:25:11', '2026-01-22 15:25:11'),
(28, 15, 14, 'upsell', '2026-01-22 15:25:11', '2026-01-22 15:25:11');

-- --------------------------------------------------------

--
-- Table structure for table `product_reports`
--

CREATE TABLE `product_reports` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `handled_by` bigint UNSIGNED DEFAULT NULL,
  `handled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_reports`
--

INSERT INTO `product_reports` (`id`, `product_id`, `user_id`, `reason`, `description`, `status`, `handled_by`, `handled_at`, `created_at`, `updated_at`) VALUES
(1, 1, 18, 'Expired Product', 'I bought this product and it arrived expired.', 'reviewed', 1, '2026-01-20 14:42:20', '2026-01-20 14:12:07', '2026-01-20 14:42:20'),
(2, 7, 18, 'Expired Product', 'I bought this product and it arrived expired.', 'ignored', 1, '2026-01-20 14:42:13', '2026-01-20 14:42:02', '2026-01-20 14:42:13');

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
(11, 7, '{\"ar\": \"هوهوز بالقهوة وسط\", \"en\": \"Coffee Hohos  M\"}', 'HO-123-green-m', 'coffee-hohos-m', 'products/variants/r45Xj222MOG4HfSLq4viLI8AXIc4oTOPuknKd6P9.jpg', 15.00, NULL, 'percentage', 1, '2026-01-13 16:02:37', '2026-01-13 16:02:37', NULL),
(12, 11, '{\"ar\": \"نيدو لبن بودر 100 جم\", \"en\": \"Nido Powdered Milk 100g\"}', 'MI-120-s', 'nido-powdered-milk-100g', 'products/variants/SeoVR3Tk4WrL2AgLIPDgITi4tCOK29FvXT4qQgAX.webp', 45.00, NULL, 'percentage', 1, '2026-01-18 10:37:46', '2026-01-18 11:06:30', NULL),
(13, 11, '{\"ar\": \"نيدو لبن بودر 500 جم\", \"en\": \"Nido Powdered Milk 500g\"}', 'MI-120-m', 'nido-powdered-milk-500g', 'products/variants/MD493smL9EOOHrBgUW8wCyAGNYxG3q9dwJRktNNM.webp', 220.00, NULL, 'percentage', 1, '2026-01-18 10:37:46', '2026-01-18 11:06:30', NULL),
(14, 11, '{\"ar\": \"نيدو لبن بودر 900 + 100 جم\", \"en\": \"Nido Powdered Milk 900+100 g\"}', 'MI-120-l', 'nido-powdered-milk-900100-g', 'products/variants/I9L8SMfqhR7UbctCgjqOzL8iqGBIqMbl28ACr4TO.webp', 400.00, NULL, 'percentage', 1, '2026-01-18 10:37:46', '2026-01-18 11:06:30', NULL),
(28, 15, '{\"ar\": \"كوكيز شوكولاتة العبد - 2 قطعة\", \"en\": \"El Abd Chocolate Cookies - 2 Pieces\"}', 'PRD-103-s', 'el-abd-chocolate-cookies-2-pieces', 'products/variants/dEkSdxdiZMKVKc4dt6NBtvq3VFOerMOULd9XTotQ.webp', 15.00, NULL, 'percentage', 1, '2026-01-22 14:58:04', '2026-01-22 15:25:11', NULL),
(29, 15, '{\"ar\": \"كوكيز شوكولاتة العبد - 6 قطعة\", \"en\": \"El Abd Chocolate Cookies - 6 Pieces\"}', 'PRD-103-m', 'el-abd-chocolate-cookies-6-pieces', 'products/variants/IwpCAnKmewPcvJdsV8r7ShouOqYX7Vf8NZYkTxNQ.webp', 25.00, NULL, 'percentage', 1, '2026-01-22 14:58:04', '2026-01-22 15:25:11', NULL);

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
(16, 11, 5, '2026-01-13 16:02:37', '2026-01-13 16:02:37'),
(17, 12, 4, '2026-01-18 10:37:46', '2026-01-18 10:37:46'),
(18, 13, 5, '2026-01-18 10:37:46', '2026-01-18 10:37:46'),
(19, 14, 6, '2026-01-18 10:37:46', '2026-01-18 10:37:46'),
(22, 28, 4, '2026-01-22 15:25:11', '2026-01-22 15:25:11'),
(23, 29, 5, '2026-01-22 15:25:11', '2026-01-22 15:25:11');

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
('CIxTlfilplQOEyfZNIwGhiD5HRCpjnopmootnvrz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaXBMMERTd1N4UDNHdG0yYkZ6d3RhVTJlNXF3MEpyazZFOE5HUWtHcCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9tdWx0aS12ZW5kb3ItZS1jb21tZXJjZS50ZXN0IjtzOjU6InJvdXRlIjtzOjk6ImRhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NjoibG9jYWxlIjtzOjI6ImFyIjtzOjIyOiJQSFBERUJVR0JBUl9TVEFDS19EQVRBIjthOjA6e319', 1769098921),
('hFJi3VMoPEpR1cmlxqc3fQwuOiFosTl1xzHxUw5f', 16, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoic0M1STJPV1d0VWdCbTN2Y3p3MlNNRXdyWk4wYkFiMUFjTWpFZGlXRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly9tdWx0aS12ZW5kb3ItZS1jb21tZXJjZS50ZXN0L3ZlbmRvci9wcm9kdWN0cy8xNS9lZGl0IjtzOjU6InJvdXRlIjtzOjIwOiJ2ZW5kb3IucHJvZHVjdHMuZWRpdCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE2O3M6MjI6IlBIUERFQlVHQkFSX1NUQUNLX0RBVEEiO2E6MDp7fX0=', 1769102713),
('VVYy94PV9uVm1jG2S0X1WipetIoFwci9o9tlHJIg', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiSG94czVUc2U1WFJkQm1QOEN3dXZ3Nkg5MThiVnZLV0ZlRVBnSVBIaiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjU4OiJodHRwOi8vbXVsdGktdmVuZG9yLWUtY29tbWVyY2UudGVzdC9hZG1pbi9wcm9kdWN0cy8xNS9lZGl0IjtzOjU6InJvdXRlIjtzOjE5OiJhZG1pbi5wcm9kdWN0cy5lZGl0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjIyOiJQSFBERUJVR0JBUl9TVEFDS19EQVRBIjthOjA6e319', 1769103099);

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
(6, 'currency', 'EGP', 'string', '2026-01-11 12:42:20', '2026-01-11 14:21:41'),
(7, 'referral_points', '50', 'number', '2026-01-11 12:42:20', '2026-01-15 08:15:55'),
(8, 'cache_back_points_rate', '10', 'number', '2026-01-11 12:42:20', '2026-01-19 10:42:41');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `created_at`, `updated_at`) VALUES
(1, 'sliders/2FQiEUZVCxavkYNXPCPLXr58EB4DD6eMBunjd6ON.webp', '2026-01-18 13:09:17', '2026-01-18 13:09:17'),
(2, 'sliders/ZNMS4uZRVJGfq7uQfaxVihrz9OJ0EW0FXQrZyhkS.webp', '2026-01-18 13:09:28', '2026-01-18 13:09:28'),
(3, 'sliders/FgfQ6A7J7tDUu2CcepSTmbjzysYEAqnKDNSz7cAE.webp', '2026-01-18 13:09:33', '2026-01-18 13:09:33'),
(4, 'sliders/3Yrw6PI2wrOft7TXDTKLlAKZLvxMa85N3hWC1YSQ.webp', '2026-01-18 13:09:39', '2026-01-18 13:09:39'),
(5, 'sliders/kDN9AuDPsgg1emGk52876zjZz6bOgfkXz0lk5gf7.webp', '2026-01-18 13:09:43', '2026-01-18 13:09:53');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','resolved','closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `ticket_from` enum('user','vendor') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `attachments` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `vendor_id`, `subject`, `description`, `status`, `ticket_from`, `attachments`, `created_at`, `updated_at`) VALUES
(1, 16, NULL, 'Test Support Ticket', 'This is a test support ticket created to verify that the ticketing system is working correctly.\r\nNo real issue is being reported. Please ignore or close this ticket after confirmation.', 'resolved', 'vendor', '[\"tickets/0HZWTGCAk00LBKOdFF4OENMOEhQQG7EHoxevbes9.jpg\"]', '2026-01-18 14:08:38', '2026-01-18 14:20:49'),
(2, 16, NULL, 'Test Support Ticket 2', 'This is a test support ticket created to verify that the ticketing system is working correctly.\r\nNo real issue is being reported. Please ignore or close this ticket after confirmation.', 'pending', 'vendor', NULL, '2026-01-18 14:10:24', '2026-01-18 14:10:24'),
(3, 18, NULL, 'Test Subject', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni earum aliquam, quisquam blanditiis iusto nam fuga deserunt quo. Quam nobis excepturi ipsa repellat doloremque illum laboriosam reprehenderit iure quod soluta.', 'resolved', 'user', '[\"tickets/OUZ0rvXizMCPb4Hx1kBYib9DF3KgtKwDxftdAZYw.png\", \"tickets/bC2FIGlCj7W7QVPxRcqC24gfALwc1gqSjyiLWbOo.png\"]', '2026-01-18 14:39:35', '2026-01-18 14:46:54'),
(5, 18, NULL, 'Test Subject', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni earum aliquam, quisquam blanditiis iusto nam fuga deserunt quo. Quam nobis excepturi ipsa repellat doloremque illum laboriosam reprehenderit iure quod soluta.', 'pending', 'user', '[\"tickets/YnjMHF6v6z1amT4gIK9TxBMoTgI5DIChYCaJIxsq.png\", \"tickets/YS9uqliWO4M0Bl3hURBnJaOe4TPv8tLrArj9ZTPO.png\"]', '2026-01-20 11:55:53', '2026-01-20 11:55:53'),
(6, 18, NULL, 'Test Subject', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni earum aliquam, quisquam blanditiis iusto nam fuga deserunt quo. Quam nobis excepturi ipsa repellat doloremque illum laboriosam reprehenderit iure quod soluta.', 'pending', 'user', '[\"tickets/YuZP1i16lxTppWFf5YUv1J1fjkGus3HTQQxU1Oht.png\", \"tickets/WLAfR2ciFESSvt69ldpPfWsW2tE8KmhPWu3N9b8J.png\"]', '2026-01-20 14:28:32', '2026-01-20 14:28:32');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_messages`
--

CREATE TABLE `ticket_messages` (
  `id` bigint UNSIGNED NOT NULL,
  `ticket_id` bigint UNSIGNED NOT NULL,
  `sender_type` enum('user','vendor','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `sender_id` bigint UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachments` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_messages`
--

INSERT INTO `ticket_messages` (`id`, `ticket_id`, `sender_type`, `sender_id`, `message`, `attachments`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 1, 'test message', '[\"tickets/messages/pnfS7fhi7HelbeVBMrwtlcqEkpf2RAiziNCLVnbZ.png\"]', '2026-01-18 14:11:33', '2026-01-18 14:11:33'),
(2, 1, 'vendor', 16, 'test 2', '[]', '2026-01-18 14:13:29', '2026-01-18 14:13:29'),
(3, 1, 'admin', 1, '123', '[]', '2026-01-18 14:17:09', '2026-01-18 14:17:09'),
(4, 3, 'admin', 1, 'Test Message', '[\"tickets/messages/fPsXL68ulQePyhOE1zzqhWd4BGbR6SDD2vqSG5Qt.png\"]', '2026-01-18 14:42:57', '2026-01-18 14:42:57'),
(5, 3, 'user', 18, 'tset user reply', '[]', '2026-01-18 14:43:59', '2026-01-18 14:43:59');

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
  `wallet` decimal(10,2) NOT NULL DEFAULT '0.00',
  `points` decimal(10,2) NOT NULL DEFAULT '0.00',
  `referral_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referred_by_id` bigint UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `email_verified_at`, `phone_verified_at`, `role`, `is_active`, `is_verified`, `password`, `image`, `wallet`, `points`, `referral_code`, `referred_by_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@admin.com', '01234567890', NULL, NULL, 'admin', 1, 1, '$2y$12$d7i2L.FlERwj2OBj/S9O.eiuxMmBCe3q0rQ1MHaSD1gLhgbRqw1u.', NULL, 0.00, 0.00, NULL, NULL, NULL, '2026-01-11 10:45:25', '2026-01-11 10:45:25', NULL),
(3, 'Test Vendor', 'test@vendor.com', '01233211230', NULL, NULL, 'vendor', 1, 0, '$2y$12$1BGvAlnxPs2yiEXtIZrWbuJyjI4y05UNHAqckOCzOgT4jb42gKD/y', NULL, 0.00, 0.00, NULL, NULL, NULL, '2026-01-12 15:10:07', '2026-01-12 15:10:07', NULL),
(4, 'Test Vendor 2', 'test@vendor2.com', '01233211231', NULL, NULL, 'vendor', 1, 0, '$2y$12$Cn9yN8era2hZ1uC.8shbMepvmx2MRq0qScjtQRidXBwFIJPYHNahS', NULL, 0.00, 0.00, NULL, NULL, NULL, '2026-01-12 15:23:47', '2026-01-12 15:23:47', NULL),
(15, 'khaled', 'khaled@vendor.com', '+20109988770', '2026-01-14 10:06:50', NULL, 'vendor', 1, 1, '$2y$12$1iqV2iaWG6FrfpN6tGoXLeTMf8uha9LwRLBcKH5xADu2ChZMx7fvS', 'users/eVdwuWMErtxikpWJNi3c2GzCz3uN3CpLOCijY0yK.png', 0.00, 0.00, NULL, NULL, NULL, '2026-01-14 10:06:38', '2026-01-14 14:58:44', NULL),
(16, 'Islam', 'islam@vendor.com', '+20123032101', '2026-01-15 08:08:18', NULL, 'vendor', 1, 1, '$2y$12$3RHRfXqnCxm6zNpvRG66m.db/fFT0cXqYBQdBOGr.AB6kmJRWfd/y', NULL, 0.00, 0.00, NULL, NULL, NULL, '2026-01-15 08:07:55', '2026-01-15 08:08:18', NULL),
(17, 'islam 2', 'islam2@vendor.com', '+201023230231', NULL, NULL, 'vendor', 1, 0, '$2y$12$OFi68bFc/VuOeEoCNV0X4us2yvOPzKDoTxF5v2Gen38G6UjI2KfFW', NULL, 0.00, 0.00, NULL, NULL, NULL, '2026-01-15 10:40:43', '2026-01-15 10:40:43', NULL),
(18, 'Test User', 'test@user.com', '+201234567890', NULL, NULL, 'user', 1, 1, '$2y$12$ULTfZljbkO/B4cAQAlva9OOrNabUH6q8a4fAqwkWE7r9OmCxEhPv2', 'users/OofEca30obQjClbwg88umNT7bLBl6H1qDJ2sR6Z3.png', 779.25, 180.00, 'AHMED123', NULL, NULL, '2026-01-15 12:33:55', '2026-01-21 10:18:44', NULL),
(19, 'islam 3', 'islam3@vendor.com', '+201109002010', NULL, NULL, 'vendor', 1, 0, '$2y$12$ylGfk4Rsi43m6ctSqkgwLuObmoO1W.w1eBtcAnU2yS0h/G9dpxXyq', NULL, 0.00, 0.00, NULL, NULL, NULL, '2026-01-18 09:43:34', '2026-01-18 09:43:34', NULL);

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
(3, '{\"ar\": \"الخامة\", \"en\": \"Material\"}', 0, 1, '2026-01-13 12:37:59', '2026-01-13 12:39:13', NULL),
(4, '{\"ar\": \"فارينت تجريبي\", \"en\": \"Test VAR\"}', 1, 1, '2026-01-22 11:24:37', '2026-01-22 11:24:48', '2026-01-22 11:24:48');

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
(8, 3, '{\"ar\": \"صوف\", \"en\": \"Wool\"}', 'wool', '2026-01-13 12:37:59', '2026-01-13 12:37:59', NULL),
(9, 4, '{\"ar\": \"اختيار اول\", \"en\": \"OPT1\"}', 'opt1', '2026-01-22 11:24:37', '2026-01-22 11:24:37', NULL),
(10, 4, '{\"ar\": \"اختيار ثاني\", \"en\": \"OPT2\"}', 'opt2', '2026-01-22 11:24:37', '2026-01-22 11:24:37', NULL),
(11, 4, '{\"ar\": \"اختيار ثالث\", \"en\": \"OPT3\"}', 'opt3', '2026-01-22 11:24:37', '2026-01-22 11:24:37', NULL),
(12, 4, '{\"ar\": \"اختيار رابع\", \"en\": \"OPT4\"}', 'opt4', '2026-01-22 11:24:37', '2026-01-22 11:24:37', NULL);

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
(2, 'banda-vendor', '{\"ar\": \"ماركت باندا\", \"en\": \"Banda Vendor\"}', 3, '01233211230', '3 wzf st Cairo. Egypt', 'vendors/27RqJdLmLF1nHArn6d7PxMeOrvOVs2A5a2qgWWaM.png', 1, 0, 50, 0, 1, '2026-01-12', '2026-02-11', '2026-01-12 15:10:07', '2026-01-21 10:35:47', NULL),
(3, 'hayper-vendor', '{\"ar\": \"ماركت هايبر\", \"en\": \"Hayper Vendor\"}', 4, '01233211231', '3 wzf st Cairo. Egypt', 'vendors/f11PzLAar52uyvJfQQkRfubvgHmNFTp0GcogVcmc.png', 1, 0, 0, 0, 1, '2026-01-12', '2026-02-11', '2026-01-12 15:23:47', '2026-01-14 07:55:18', NULL),
(12, 'fathalla-market', '{\"ar\": \"فتح الله ماركت\", \"en\": \"Fathalla Market\"}', 15, '+20109988770', '3 abbas st. nasr city, Cairo, Egypt', 'vendors/ox7x0kfsews9fSuoRvvRfSqvb1vJBSCjp0VrHsu2.jpg', 1, 0, 0, 0, 1, '2026-01-14', '2026-02-13', '2026-01-14 10:06:38', '2026-01-14 14:29:42', NULL),
(13, 'saudi-market', '{\"ar\": \"سعودي ماركت\", \"en\": \"Saudi Market\"}', 16, '+20123032101', '3 Makram St. Cairo Egypt', 'vendors/ln8IAKuQUZmw8Xx2VPhYgiMDievBF3kCxYzAbiLN.webp', 1, 0, 940, 10, 2, '2026-01-15', '2026-02-14', '2026-01-15 08:07:55', '2026-01-21 10:49:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_balance_transactions`
--

CREATE TABLE `vendor_balance_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `vendor_order_id` bigint UNSIGNED DEFAULT NULL,
  `type` enum('addition','subtraction') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `balance_after` decimal(10,2) NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_balance_transactions`
--

INSERT INTO `vendor_balance_transactions` (`id`, `vendor_id`, `order_id`, `vendor_order_id`, `type`, `amount`, `balance_after`, `notes`, `payload`, `created_at`, `updated_at`) VALUES
(1, 13, 3, 5, 'addition', 946.00, 946.00, 'Order #3 (Vendor Order #5)', '{\"gross\": 946, \"commission\": 0, \"profit_type\": \"subscription\", \"payment_method\": \"COD\"}', '2026-01-21 10:35:47', '2026-01-21 10:35:47'),
(2, 2, 3, 6, 'addition', 50.00, 50.00, 'Order #3 (Vendor Order #6)', '{\"gross\": 50, \"commission\": 0, \"profit_type\": \"subscription\", \"payment_method\": \"COD\"}', '2026-01-21 10:35:47', '2026-01-21 10:35:47'),
(3, 13, NULL, NULL, 'subtraction', 6.00, 940.00, 'Withdrawal #1', '{\"method\": \"InstaPay\", \"processed_by\": 1}', '2026-01-21 10:49:24', '2026-01-21 10:49:24');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_orders`
--

CREATE TABLE `vendor_orders` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL,
  `status` enum('pending','processing','shipped','delivered','cancelled','refunded') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `commission` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_orders`
--

INSERT INTO `vendor_orders` (`id`, `order_id`, `vendor_id`, `branch_id`, `sub_total`, `discount`, `shipping_cost`, `total`, `status`, `notes`, `commission`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 13, 5, 45.00, 0.00, 25.00, 70.00, 'pending', NULL, 0.00, '2026-01-19 11:57:37', '2026-01-19 11:57:37', NULL),
(2, 1, 2, 3, 10.00, 0.00, 0.00, 10.00, 'pending', NULL, 0.00, '2026-01-19 11:57:37', '2026-01-19 11:57:37', NULL),
(3, 2, 2, 3, 30.00, 0.00, 0.00, 30.00, 'cancelled', NULL, 0.00, '2026-01-19 12:52:44', '2026-01-19 12:52:44', NULL),
(4, 2, 13, 5, 930.00, 0.00, 25.00, 955.00, 'cancelled', NULL, 0.00, '2026-01-19 12:52:44', '2026-01-19 12:52:44', NULL),
(5, 3, 13, 5, 921.00, 0.00, 25.00, 946.00, 'pending', NULL, 0.00, '2026-01-19 13:08:22', '2026-01-19 13:08:22', NULL),
(6, 3, 2, 3, 50.00, 0.00, 0.00, 50.00, 'pending', NULL, 0.00, '2026-01-19 13:08:22', '2026-01-19 13:08:22', NULL),
(7, 4, 13, 5, 921.00, 0.00, 25.00, 946.00, 'processing', NULL, 0.00, '2026-01-19 13:16:43', '2026-01-20 07:42:11', NULL),
(8, 4, 2, 3, 50.00, 0.00, 0.00, 50.00, 'pending', NULL, 0.00, '2026-01-19 13:16:43', '2026-01-19 13:16:43', NULL),
(9, 5, 2, 3, 50.00, 0.00, 0.00, 50.00, 'pending', NULL, 0.00, '2026-01-19 13:50:08', '2026-01-19 13:50:08', NULL),
(10, 6, 13, 6, 921.00, 0.00, 100.00, 1021.00, 'delivered', NULL, 0.00, '2026-01-19 14:54:26', '2026-01-21 11:04:54', NULL),
(11, 6, 2, 3, 50.00, 0.00, 0.00, 50.00, 'delivered', NULL, 0.00, '2026-01-19 14:54:26', '2026-01-21 11:03:18', NULL),
(12, 7, 13, 6, 921.00, 230.25, 100.00, 790.75, 'refunded', NULL, 0.00, '2026-01-19 14:57:29', '2026-01-20 09:23:29', NULL),
(13, 7, 2, 3, 50.00, 12.50, 0.00, 37.50, 'refunded', NULL, 0.00, '2026-01-19 14:57:29', '2026-01-20 09:24:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_order_items`
--

CREATE TABLE `vendor_order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `variant_id` bigint UNSIGNED DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `total` decimal(10,2) NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_order_items`
--

INSERT INTO `vendor_order_items` (`id`, `vendor_order_id`, `product_id`, `variant_id`, `price`, `quantity`, `total`, `notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 11, 12, 45.00, 1, 45.00, NULL, '2026-01-19 11:57:37', '2026-01-19 11:57:37', NULL),
(2, 2, 1, NULL, 10.00, 1, 10.00, NULL, '2026-01-19 11:57:37', '2026-01-19 11:57:37', NULL),
(3, 3, 1, NULL, 10.00, 3, 30.00, NULL, '2026-01-19 12:52:44', '2026-01-19 12:52:44', NULL),
(4, 4, 11, 12, 45.00, 2, 90.00, NULL, '2026-01-19 12:52:44', '2026-01-19 12:52:44', NULL),
(5, 4, 10, NULL, 420.00, 2, 840.00, NULL, '2026-01-19 12:52:44', '2026-01-19 12:52:44', NULL),
(6, 5, 10, NULL, 420.00, 2, 840.00, NULL, '2026-01-19 13:08:22', '2026-01-19 13:08:22', NULL),
(7, 5, 11, 12, 40.50, 2, 81.00, NULL, '2026-01-19 13:08:22', '2026-01-19 13:08:22', NULL),
(8, 6, 1, NULL, 10.00, 5, 50.00, NULL, '2026-01-19 13:08:22', '2026-01-19 13:08:22', NULL),
(9, 7, 10, NULL, 420.00, 2, 840.00, NULL, '2026-01-19 13:16:43', '2026-01-19 13:16:43', NULL),
(10, 7, 11, 12, 40.50, 2, 81.00, NULL, '2026-01-19 13:16:43', '2026-01-19 13:16:43', NULL),
(11, 8, 1, NULL, 10.00, 5, 50.00, NULL, '2026-01-19 13:16:43', '2026-01-19 13:16:43', NULL),
(12, 9, 1, NULL, 10.00, 5, 50.00, NULL, '2026-01-19 13:50:08', '2026-01-19 13:50:08', NULL),
(13, 10, 10, NULL, 420.00, 2, 840.00, NULL, '2026-01-19 14:54:26', '2026-01-19 14:54:26', NULL),
(14, 10, 11, 12, 40.50, 2, 81.00, NULL, '2026-01-19 14:54:26', '2026-01-19 14:54:26', NULL),
(15, 11, 1, NULL, 10.00, 5, 50.00, NULL, '2026-01-19 14:54:26', '2026-01-19 14:54:26', NULL),
(16, 12, 10, NULL, 420.00, 2, 840.00, NULL, '2026-01-19 14:57:29', '2026-01-19 14:57:29', NULL),
(17, 12, 11, 12, 40.50, 2, 81.00, NULL, '2026-01-19 14:57:29', '2026-01-19 14:57:29', NULL),
(18, 13, 1, NULL, 10.00, 5, 50.00, NULL, '2026-01-19 14:57:29', '2026-01-19 14:57:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_ratings`
--

CREATE TABLE `vendor_ratings` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `rating` tinyint UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_ratings`
--

INSERT INTO `vendor_ratings` (`id`, `vendor_id`, `user_id`, `rating`, `comment`, `is_visible`, `created_at`, `updated_at`) VALUES
(1, 2, 18, 3, 'Great Product', 1, '2026-01-20 14:44:06', '2026-01-20 14:59:28');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_reports`
--

CREATE TABLE `vendor_reports` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `handled_by` bigint UNSIGNED DEFAULT NULL,
  `handled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_reports`
--

INSERT INTO `vendor_reports` (`id`, `vendor_id`, `user_id`, `reason`, `description`, `status`, `handled_by`, `handled_at`, `created_at`, `updated_at`) VALUES
(1, 3, 18, 'Very Bad Store', 'I bought a product from this stpre and it arrived expired.', 'reviewed', 1, '2026-01-20 14:59:05', '2026-01-20 14:44:48', '2026-01-20 14:59:05');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_settings`
--

CREATE TABLE `vendor_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `type` enum('string','number','boolean','json') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'string',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_settings`
--

INSERT INTO `vendor_settings` (`id`, `vendor_id`, `key`, `value`, `type`, `created_at`, `updated_at`) VALUES
(1, 13, 'allow_branch_user_to_edit_stock', '0', 'boolean', '2026-01-18 10:14:37', '2026-01-18 10:21:53'),
(2, 13, 'free_shipping_threshold', '0', 'number', '2026-01-18 10:14:37', '2026-01-18 10:14:37'),
(3, 13, 'shipping_cost_per_km', '10', 'number', '2026-01-18 10:14:37', '2026-01-18 10:14:37'),
(4, 13, 'minimum_shipping_cost', '25', 'number', '2026-01-18 10:14:37', '2026-01-18 10:14:37'),
(5, 13, 'maximum_shipping_cost', '100', 'number', '2026-01-18 10:14:37', '2026-01-18 10:14:37'),
(6, 13, 'allow_free_shipping_threshold', '', 'boolean', '2026-01-18 10:21:53', '2026-01-18 10:21:53');

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
  `user_type` enum('owner','branch') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'owner',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `branch_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_users`
--

INSERT INTO `vendor_users` (`id`, `vendor_id`, `user_id`, `is_active`, `user_type`, `created_at`, `updated_at`, `deleted_at`, `branch_id`) VALUES
(1, 13, 17, 1, 'owner', '2026-01-15 10:40:43', '2026-01-15 10:40:43', NULL, NULL),
(2, 13, 19, 1, 'branch', '2026-01-18 09:43:34', '2026-01-18 09:43:34', NULL, 6);

-- --------------------------------------------------------

--
-- Table structure for table `vendor_withdrawals`
--

CREATE TABLE `vendor_withdrawals` (
  `id` bigint UNSIGNED NOT NULL,
  `vendor_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processed_by` bigint UNSIGNED DEFAULT NULL,
  `processed_at` timestamp NULL DEFAULT NULL,
  `balance_before` decimal(10,2) DEFAULT NULL,
  `balance_after` decimal(10,2) DEFAULT NULL,
  `payload` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_withdrawals`
--

INSERT INTO `vendor_withdrawals` (`id`, `vendor_id`, `amount`, `status`, `method`, `notes`, `processed_by`, `processed_at`, `balance_before`, `balance_after`, `payload`, `created_at`, `updated_at`) VALUES
(1, 13, 6.00, 'approved', 'InstaPay', NULL, 1, '2026-01-21 10:49:24', 946.00, 940.00, NULL, '2026-01-21 10:48:08', '2026-01-21 10:49:24'),
(2, 13, 100.00, 'rejected', 'Wallet', 'Test Request', 1, '2026-01-21 10:49:30', 946.00, 946.00, NULL, '2026-01-21 10:48:45', '2026-01-21 10:49:30');

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

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `type` enum('addition','subtraction') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `balance_after` decimal(10,2) NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet_transactions`
--

INSERT INTO `wallet_transactions` (`id`, `user_id`, `type`, `amount`, `balance_after`, `notes`, `created_at`, `updated_at`) VALUES
(1, 18, 'addition', 0.00, 0.00, 'Order #3', '2026-01-19 13:08:22', '2026-01-19 13:08:22'),
(2, 18, 'addition', 0.00, 0.00, 'Order #4', '2026-01-19 13:16:43', '2026-01-19 13:16:43'),
(3, 18, 'addition', 779.25, 779.25, 'Refund for Order #7', '2026-01-20 10:54:13', '2026-01-20 10:54:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_index` (`user_id`);

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
  ADD KEY `branch_product_stocks_branch_product_index` (`branch_id`,`product_id`),
  ADD KEY `branch_product_stocks_branch_quantity_index` (`branch_id`,`quantity`),
  ADD KEY `branch_product_stocks_product_quantity_index` (`product_id`,`quantity`);

--
-- Indexes for table `branch_product_variant_stocks`
--
ALTER TABLE `branch_product_variant_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_variant_stocks_branch_variant_index` (`branch_id`,`product_variant_id`),
  ADD KEY `branch_variant_stocks_branch_quantity_index` (`branch_id`,`quantity`),
  ADD KEY `branch_variant_stocks_variant_quantity_index` (`product_variant_id`,`quantity`);

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
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`),
  ADD KEY `cart_items_variant_id_foreign` (`variant_id`),
  ADD KEY `cart_items_user_product_index` (`user_id`,`product_id`),
  ADD KEY `cart_items_user_product_variant_index` (`user_id`,`product_id`,`variant_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_status_index` (`is_active`,`is_featured`),
  ADD KEY `categories_parent_id_index` (`parent_id`),
  ADD KEY `categories_created_at_index` (`created_at`);

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
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_active_end_date_index` (`is_active`,`end_date`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `favorites_user_id_product_id_unique` (`user_id`,`product_id`),
  ADD KEY `favorites_product_id_foreign` (`product_id`),
  ADD KEY `favorites_user_product_index` (`user_id`,`product_id`);

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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_coupon_id_foreign` (`coupon_id`),
  ADD KEY `orders_address_id_foreign` (`address_id`),
  ADD KEY `orders_user_status_index` (`user_id`,`status`),
  ADD KEY `orders_status_payment_index` (`status`,`payment_status`),
  ADD KEY `orders_created_at_index` (`created_at`),
  ADD KEY `orders_total_index` (`total`),
  ADD KEY `orders_payment_method_index` (`payment_method`),
  ADD KEY `orders_refund_status_index` (`refund_status`);

--
-- Indexes for table `order_logs`
--
ALTER TABLE `order_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_logs_order_id_foreign` (`order_id`),
  ADD KEY `order_logs_vendor_order_id_foreign` (`vendor_order_id`),
  ADD KEY `order_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_refund_requests`
--
ALTER TABLE `order_refund_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_refund_requests_user_id_foreign` (`user_id`),
  ADD KEY `order_refund_requests_processed_by_foreign` (`processed_by`),
  ADD KEY `order_refund_requests_order_id_status_index` (`order_id`,`status`);

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
-- Indexes for table `point_transactions`
--
ALTER TABLE `point_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `point_transactions_user_id_foreign` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_status_index` (`is_active`,`is_approved`,`is_featured`),
  ADD KEY `products_price_index` (`price`),
  ADD KEY `products_vendor_id_index` (`vendor_id`),
  ADD KEY `products_type_index` (`type`),
  ADD KEY `products_created_at_index` (`created_at`),
  ADD KEY `products_is_new_index` (`is_new`),
  ADD KEY `products_is_bookable_index` (`is_bookable`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_imageable_id_imageable_type_index` (`imageable_id`,`imageable_type`);

--
-- Indexes for table `product_ratings`
--
ALTER TABLE `product_ratings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_ratings_product_id_user_id_unique` (`product_id`,`user_id`),
  ADD KEY `product_ratings_product_visible_index` (`product_id`,`is_visible`),
  ADD KEY `product_ratings_user_id_index` (`user_id`);

--
-- Indexes for table `product_relations`
--
ALTER TABLE `product_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_relations_product_id_foreign` (`product_id`),
  ADD KEY `product_relations_related_product_id_foreign` (`related_product_id`);

--
-- Indexes for table `product_reports`
--
ALTER TABLE `product_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reports_product_id_foreign` (`product_id`),
  ADD KEY `product_reports_user_id_foreign` (`user_id`),
  ADD KEY `product_reports_handled_by_foreign` (`handled_by`);

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
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_vendor_id_foreign` (`vendor_id`),
  ADD KEY `tickets_user_status_index` (`user_id`,`status`),
  ADD KEY `tickets_status_index` (`status`);

--
-- Indexes for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_messages_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_messages_sender_id_foreign` (`sender_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD UNIQUE KEY `users_referral_code_unique` (`referral_code`),
  ADD KEY `users_referred_by_id_foreign` (`referred_by_id`),
  ADD KEY `users_role_status_index` (`role`,`is_active`),
  ADD KEY `users_created_at_index` (`created_at`);

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
  ADD KEY `vendors_status_index` (`is_active`,`is_featured`),
  ADD KEY `vendors_owner_id_index` (`owner_id`),
  ADD KEY `vendors_plan_id_index` (`plan_id`),
  ADD KEY `vendors_balance_index` (`balance`),
  ADD KEY `vendors_commission_rate_index` (`commission_rate`),
  ADD KEY `vendors_created_at_index` (`created_at`);

--
-- Indexes for table `vendor_balance_transactions`
--
ALTER TABLE `vendor_balance_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_balance_transactions_vendor_id_created_at_index` (`vendor_id`,`created_at`),
  ADD KEY `vendor_balance_transactions_order_id_index` (`order_id`),
  ADD KEY `vendor_balance_transactions_vendor_order_id_index` (`vendor_order_id`);

--
-- Indexes for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_orders_vendor_status_index` (`vendor_id`,`status`),
  ADD KEY `vendor_orders_order_vendor_index` (`order_id`,`vendor_id`),
  ADD KEY `vendor_orders_branch_id_index` (`branch_id`),
  ADD KEY `vendor_orders_status_index` (`status`);

--
-- Indexes for table `vendor_order_items`
--
ALTER TABLE `vendor_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_order_items_vendor_order_id_foreign` (`vendor_order_id`),
  ADD KEY `vendor_order_items_product_id_foreign` (`product_id`),
  ADD KEY `vendor_order_items_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `vendor_ratings`
--
ALTER TABLE `vendor_ratings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendor_ratings_vendor_id_user_id_unique` (`vendor_id`,`user_id`),
  ADD KEY `vendor_ratings_vendor_visible_index` (`vendor_id`,`is_visible`),
  ADD KEY `vendor_ratings_user_id_index` (`user_id`);

--
-- Indexes for table `vendor_reports`
--
ALTER TABLE `vendor_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_reports_vendor_id_foreign` (`vendor_id`),
  ADD KEY `vendor_reports_user_id_foreign` (`user_id`),
  ADD KEY `vendor_reports_handled_by_foreign` (`handled_by`);

--
-- Indexes for table `vendor_settings`
--
ALTER TABLE `vendor_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendor_settings_vendor_id_key_unique` (`vendor_id`,`key`);

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
  ADD KEY `vendor_users_user_id_foreign` (`user_id`),
  ADD KEY `vendor_users_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `vendor_withdrawals`
--
ALTER TABLE `vendor_withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendor_withdrawals_vendor_id_status_index` (`vendor_id`,`status`);

--
-- Indexes for table `verifications`
--
ALTER TABLE `verifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_transactions_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `branch_product_stocks`
--
ALTER TABLE `branch_product_stocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `branch_product_variant_stocks`
--
ALTER TABLE `branch_product_variant_stocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `category_requests`
--
ALTER TABLE `category_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_logs`
--
ALTER TABLE `order_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `order_refund_requests`
--
ALTER TABLE `order_refund_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT for table `point_transactions`
--
ALTER TABLE `point_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `product_ratings`
--
ALTER TABLE `product_ratings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_relations`
--
ALTER TABLE `product_relations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `product_reports`
--
ALTER TABLE `product_reports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `product_variant_values`
--
ALTER TABLE `product_variant_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `variants`
--
ALTER TABLE `variants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `variant_options`
--
ALTER TABLE `variant_options`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
-- AUTO_INCREMENT for table `vendor_balance_transactions`
--
ALTER TABLE `vendor_balance_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vendor_order_items`
--
ALTER TABLE `vendor_order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `vendor_ratings`
--
ALTER TABLE `vendor_ratings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vendor_reports`
--
ALTER TABLE `vendor_reports`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vendor_settings`
--
ALTER TABLE `vendor_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vendor_subscriptions`
--
ALTER TABLE `vendor_subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vendor_users`
--
ALTER TABLE `vendor_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vendor_withdrawals`
--
ALTER TABLE `vendor_withdrawals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `verifications`
--
ALTER TABLE `verifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE;

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
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

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
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_logs`
--
ALTER TABLE `order_logs`
  ADD CONSTRAINT `order_logs_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_logs_vendor_order_id_foreign` FOREIGN KEY (`vendor_order_id`) REFERENCES `vendor_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_refund_requests`
--
ALTER TABLE `order_refund_requests`
  ADD CONSTRAINT `order_refund_requests_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_refund_requests_processed_by_foreign` FOREIGN KEY (`processed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_refund_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `point_transactions`
--
ALTER TABLE `point_transactions`
  ADD CONSTRAINT `point_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_ratings`
--
ALTER TABLE `product_ratings`
  ADD CONSTRAINT `product_ratings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_relations`
--
ALTER TABLE `product_relations`
  ADD CONSTRAINT `product_relations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_relations_related_product_id_foreign` FOREIGN KEY (`related_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_reports`
--
ALTER TABLE `product_reports`
  ADD CONSTRAINT `product_reports_handled_by_foreign` FOREIGN KEY (`handled_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reports_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

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
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tickets_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD CONSTRAINT `ticket_messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_messages_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_referred_by_id_foreign` FOREIGN KEY (`referred_by_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

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
-- Constraints for table `vendor_balance_transactions`
--
ALTER TABLE `vendor_balance_transactions`
  ADD CONSTRAINT `vendor_balance_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vendor_balance_transactions_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_balance_transactions_vendor_order_id_foreign` FOREIGN KEY (`vendor_order_id`) REFERENCES `vendor_orders` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `vendor_orders`
--
ALTER TABLE `vendor_orders`
  ADD CONSTRAINT `vendor_orders_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_orders_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_order_items`
--
ALTER TABLE `vendor_order_items`
  ADD CONSTRAINT `vendor_order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_order_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_order_items_vendor_order_id_foreign` FOREIGN KEY (`vendor_order_id`) REFERENCES `vendor_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_ratings`
--
ALTER TABLE `vendor_ratings`
  ADD CONSTRAINT `vendor_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_ratings_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_reports`
--
ALTER TABLE `vendor_reports`
  ADD CONSTRAINT `vendor_reports_handled_by_foreign` FOREIGN KEY (`handled_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vendor_reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `vendor_reports_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_settings`
--
ALTER TABLE `vendor_settings`
  ADD CONSTRAINT `vendor_settings_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `vendor_users_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_users_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_withdrawals`
--
ALTER TABLE `vendor_withdrawals`
  ADD CONSTRAINT `vendor_withdrawals_vendor_id_foreign` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `verifications`
--
ALTER TABLE `verifications`
  ADD CONSTRAINT `verifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD CONSTRAINT `wallet_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
