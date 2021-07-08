-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2021 at 03:30 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `americansoaq`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(12, 'Makeup', NULL, 'active', '2021-03-17 09:37:34', '2021-03-18 18:20:37'),
(13, 'Skin care', NULL, 'active', '2021-03-18 12:28:15', '2021-03-18 13:26:24'),
(14, 'Toners 2', NULL, 'active', '2021-03-18 12:28:21', '2021-03-19 19:25:55');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci DEFAULT 'new',
  `quantity` int(11) DEFAULT NULL,
  `amount` double(20,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(74, 34, 29, 58472, 1221.00, 'new', 1, 1221.00, '2021-03-29 14:58:01', '2021-03-29 14:58:28'),
(75, 34, 31, 1, 1221.00, 'new', 2, 2442.00, '2021-03-29 15:12:00', '2021-03-29 15:24:34'),
(76, 34, 30, 42854, 1221.00, 'new', 2, 2442.00, '2021-03-29 15:15:11', '2021-03-29 15:15:48'),
(77, 34, NULL, 42854, 1221.00, 'new', 2, 2442.00, '2021-03-29 15:16:47', '2021-03-29 15:16:47'),
(78, 34, NULL, 33871, 1221.00, 'new', 11, 13431.00, '2021-04-01 19:32:21', '2021-04-01 19:32:21'),
(79, 36, NULL, 29717, 200.00, 'new', 3, 600.00, '2021-04-03 01:12:07', '2021-04-03 01:12:09'),
(80, 37, NULL, 37857, 100.00, 'new', 6, 600.00, '2021-07-08 07:00:34', '2021-07-08 07:30:00'),
(81, 35, NULL, 37857, 200.00, 'new', 1, 200.00, '2021-07-08 07:07:45', '2021-07-08 07:07:45');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(14, 'Curent Products', 'tv-home', '<p>Curent Products<br></p>', 'backend/product/Yqk4bHzL579YzhsCO5TGkVv822HY0EwYXyoWyfVR.png', 1, NULL, NULL, 'active', '2021-03-25 20:06:41', '2021-04-02 20:11:51', NULL),
(15, 'Whole Sale', 'whole-sale', '<p>Whole Sale<br></p>', 'backend/product/vvQTOvVOy2L6kiMxfYIrmfoyPx3tTQnVXd2wiERV.png', 1, NULL, NULL, 'active', '2021-04-02 20:12:59', '2021-04-02 20:12:59', NULL),
(16, 'Clearence', 'clearence', '<p>Clearence<br></p>', 'backend/product/deGd3o5nbevqgPat8vGte0ENmNhdzCxOFk1dp4xE.png', 1, NULL, NULL, 'active', '2021-04-02 20:13:37', '2021-04-02 20:13:37', NULL),
(17, 'Special', 'special', '<p>Special<br></p>', 'backend/product/s81y7mxlj6g0HoZ2TIzHHGbxMgUHBk23uPaRMeXa.png', 1, NULL, NULL, 'active', '2021-04-02 20:14:11', '2021-04-02 20:14:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` bigint(20) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `admin_vendor_id` int(11) DEFAULT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mileage` double DEFAULT NULL,
  `transmission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fuel_type` tinyint(4) DEFAULT NULL,
  `fuel_economy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registered_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `steering` tinyint(4) DEFAULT NULL,
  `condition` tinyint(4) DEFAULT NULL,
  `no_of_seats` tinyint(4) DEFAULT NULL,
  `drive_train` tinyint(4) DEFAULT NULL,
  `product_engine` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exterior_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interior_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `front_ac_status` tinyint(4) DEFAULT NULL,
  `power_steering_status` tinyint(4) DEFAULT NULL,
  `air_bags_status` tinyint(4) DEFAULT NULL,
  `abs_status` tinyint(4) DEFAULT NULL,
  `air_conditioner_status` tinyint(4) DEFAULT NULL,
  `leather_seats_status` tinyint(4) DEFAULT NULL,
  `fog_light_status` tinyint(4) DEFAULT NULL,
  `cd_dvd_player_status` tinyint(4) DEFAULT NULL,
  `sound_system_status` tinyint(4) DEFAULT NULL,
  `am_fm_status` tinyint(4) DEFAULT NULL,
  `safety_belts_status` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'inactive',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'Prajwal Rai', 'About price', 'prajwal.iar@gmail.com', NULL, '9807009999', 'Hello sir i am from kathmandu nepal.', '2020-08-14 08:25:46', '2020-08-14 08:00:01', '2020-08-14 08:25:46'),
(2, 'Prajwal Rai', 'About Price', 'prajwal.iar@gmail.com', NULL, '9800099000', 'Hello i am Prajwal Rai', '2020-08-18 03:04:15', '2020-08-15 07:52:39', '2020-08-18 03:04:16'),
(3, 'Prajwal Rai', 'lorem ipsum', 'prajwal.iar@gmail.com', NULL, '1200990009', 'hello sir sdfdfd dfdjf ;dfjd fd ldkfd', '2021-02-01 05:43:04', '2020-08-17 21:15:12', '2021-02-01 05:43:04');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('00778c1d-c84c-462b-83fa-f101a4e3a773', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-05 06:33:07', '2021-02-05 06:33:07'),
('1d9e7961-c486-4572-8211-39bbb9c36510', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/18\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-15 03:41:29', '2021-02-15 03:41:29'),
('2145a8e3-687d-444a-8873-b3b2fb77a342', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:31:21', '2020-08-15 07:31:21'),
('24eb9b6a-454d-455d-b6e2-28096b3ce2ba', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"https:\\/\\/americansook.catchadesigninc.com\\/admin\\/order\\/26\",\"fas\":\"fa-file-alt\"}', NULL, '2021-03-23 13:09:40', '2021-03-23 13:09:40'),
('2ce8de73-3904-451c-aa4d-e824202cfa6b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/americansook\\/admin\\/order\\/32\",\"fas\":\"fa-file-alt\"}', NULL, '2021-07-08 07:08:06', '2021-07-08 07:08:06'),
('34637c17-adeb-497f-ab8f-0e8644a87793', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/14\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-10 04:24:19', '2021-02-10 04:24:19'),
('39ffafac-09ca-4c49-942d-8b35998ce9ac', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/13\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-10 04:22:53', '2021-02-10 04:22:53'),
('3a4eb1d4-ee6b-49e0-b50f-b6b7cca58221', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/24\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-18 03:50:21', '2021-02-18 03:50:21'),
('3af39f84-cab4-4152-9202-d448435c67de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 07:54:52', '2020-08-15 07:54:52'),
('443a7740-d855-4626-b218-6d34a0d91bf6', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-05 07:31:11', '2021-02-05 07:31:11'),
('4a0afdb0-71ad-4ce6-bc70-c92ef491a525', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:51', '2020-08-17 21:13:51'),
('51c55893-fa1a-4e97-a13c-50e306084e7c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/11\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-08 08:15:34', '2021-02-08 08:15:34'),
('52d841f4-9244-475f-b87c-4685c8660a52', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"https:\\/\\/americansook.catchadesigninc.com\\/admin\\/order\\/25\",\"fas\":\"fa-file-alt\"}', NULL, '2021-03-23 13:08:23', '2021-03-23 13:08:23'),
('540ca3e9-0ff9-4e2e-9db3-6b5abc823422', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', '2020-08-15 07:30:44', '2020-08-14 07:12:28', '2020-08-15 07:30:44'),
('57689920-c1f8-416d-b5e3-87de44e49cea', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/12\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-10 03:59:05', '2021-02-10 03:59:05'),
('5c5fbb10-808d-4e02-9ddb-bba2a26b0480', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"https:\\/\\/americansook.catchadesigninc.com\\/admin\\/order\\/28\",\"fas\":\"fa-file-alt\"}', NULL, '2021-03-24 13:22:15', '2021-03-24 13:22:15'),
('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:51:02', '2020-08-15 07:51:02'),
('5e91e603-024e-45c5-b22f-36931fef0d90', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t\",\"fas\":\"fa-star\"}', NULL, '2020-08-15 07:44:07', '2020-08-15 07:44:07'),
('62844b0d-fe69-4cb3-8c44-bd4225d61bd5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/21\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-18 03:35:15', '2021-02-18 03:35:15'),
('6370aa2e-25c2-43bf-a873-49776357237e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/22\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-18 03:42:01', '2021-02-18 03:42:01'),
('6cce38ed-98ae-492c-866b-34fa47df2d5e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/16\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-10 04:27:36', '2021-02-10 04:27:36'),
('72265a51-3e4c-403a-a64f-8a13f43f99b0', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/10\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-08 08:13:08', '2021-02-08 08:13:08'),
('73a3b51a-416a-4e7d-8ca2-53b216d9ad8e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
('810db222-5729-443c-acc3-4736dbbda164', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/20\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-18 03:31:45', '2021-02-18 03:31:45'),
('8605db5d-1462-496e-8b5f-8b923d88912c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-14 07:20:44', '2020-08-14 07:20:44'),
('88fe9252-f91e-4fa7-85fb-a2a5600d1519', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-05 06:22:56', '2021-02-05 06:22:56'),
('8fe3d70f-1324-4ec0-8d12-dd5aa30e4d73', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/19\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-15 04:01:33', '2021-02-15 04:01:33'),
('9cce545b-8457-4859-81d8-7bca89a5889f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/17\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-15 03:10:56', '2021-02-15 03:10:56'),
('a6ec5643-748c-4128-92e2-9a9f293f53b5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-17 21:17:03', '2020-08-17 21:17:03'),
('b11915df-a383-44da-a8c1-e849bb1154f3', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/9\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-08 08:09:25', '2021-02-08 08:09:25'),
('b186a883-42f2-4a05-8fc5-f0d3e10309ff', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2020-08-15 04:17:24', '2020-08-14 22:14:55', '2020-08-15 04:17:24'),
('b22fad6c-55a6-4c8d-9de7-2d7311f2b231', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/15\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-10 04:25:51', '2021-02-10 04:25:51'),
('b8df32f2-a8cd-440f-b081-66d689652fb2', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-05 08:01:22', '2021-02-05 08:01:22'),
('bc6e7e47-fad9-46c1-a5ac-df7a84c2a167', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"https:\\/\\/americansook.catchadesigninc.com\\/admin\\/order\\/31\",\"fas\":\"fa-file-alt\"}', NULL, '2021-03-29 15:24:34', '2021-03-29 15:24:34'),
('bdf0e02e-4ad0-4525-beb8-05a2427b952b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/23\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-18 03:44:55', '2021-02-18 03:44:55'),
('c4d972b2-90db-4303-8707-32913a6053ce', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"https:\\/\\/americansook.catchadesigninc.com\\/admin\\/order\\/29\",\"fas\":\"fa-file-alt\"}', NULL, '2021-03-29 14:58:28', '2021-03-29 14:58:28'),
('d1f6bb89-f0ee-49a2-b82b-47542c0b7128', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-05 06:21:09', '2021-02-05 06:21:09'),
('d2fd7c33-b0fe-47d6-8bc6-f377d404080d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:08:50', '2020-08-14 07:08:50'),
('d3daeb21-ab19-43bb-a1c5-7d755b64acbd', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"https:\\/\\/americansook.catchadesigninc.com\\/admin\\/order\\/30\",\"fas\":\"fa-file-alt\"}', NULL, '2021-03-29 15:15:48', '2021-03-29 15:15:48'),
('d6ae3bf0-9be1-4b0f-b983-497b150d5ecb', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"https:\\/\\/americansook.catchadesigninc.com\\/admin\\/order\\/27\",\"fas\":\"fa-file-alt\"}', NULL, '2021-03-24 13:00:59', '2021-03-24 13:00:59'),
('dff78b90-85c8-42ee-a5b1-de8ad0b21be4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 06:40:54', '2020-08-15 06:40:54'),
('e28b0a73-4819-4016-b915-0e525d4148f5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}', NULL, '2020-08-17 21:08:16', '2020-08-17 21:08:16'),
('e5269985-0717-4e4e-83af-a3ccfe0e3ed1', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost\\/Carjeep\\/public\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2021-02-05 07:41:49', '2021-02-05 07:41:49'),
('ffffa177-c54e-4dfe-ba43-27c466ff1f4b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(20,2) DEFAULT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(20,2) DEFAULT NULL,
  `total_amount` double(20,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `vender_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`, `product_id`, `vender_id`) VALUES
(25, 'ORD-OCLO1IKEBJ', 1, 123.00, 5, NULL, 133.00, 1, 'cod', 'unpaid', 'new', 'sdadas', 'dasdas', 'admin@gmail.comasdasdasdsd', '2132132', NULL, NULL, 'dasdas', 'dasdasd', '2021-03-23 13:08:23', '2021-03-23 13:08:23', NULL, NULL),
(26, 'ORD-T1LWNEPGMJ', 15, 24.00, 5, NULL, 34.00, 2, 'cod', 'unpaid', 'new', 'sdadas', 'dasdas', 'user@gmail.com', '1231232', NULL, NULL, 'dasdas', 'dasdasd', '2021-03-23 13:09:40', '2021-03-23 13:09:40', NULL, NULL),
(27, 'ORD-BYTHGCYNU8', 1, 9.00, 5, NULL, 19.00, 1, 'cod', 'unpaid', 'new', 'pknOW6kLWv', 'm2yIyaxrrE', '4HQrlcyg2V', '491486', NULL, NULL, 'fHASnPWYIX', '9FlbljcX73', '2021-03-24 13:00:59', '2021-03-24 13:00:59', NULL, NULL),
(28, 'ORD-7H9VKQYK5O', 15, 30.00, 6, NULL, 30.00, 3, 'cod', 'unpaid', 'new', 'Felicia', 'Dakota', 'Emery', '36', NULL, NULL, 'Montana', 'Linus', '2021-03-24 13:22:15', '2021-03-24 13:22:15', NULL, NULL),
(29, 'ORD-RKZJU6AVDO', 58472, 1221.00, 5, NULL, 1231.00, 1, 'cod', 'unpaid', 'new', 'Tanya', 'Mechelle', 'Wilma', '20', 'WF', NULL, 'Jessica', 'Miriam', '2021-03-29 14:58:28', '2021-03-29 14:58:28', NULL, NULL),
(30, 'ORD-BWKLAAI55J', 42854, 2442.00, 5, NULL, 2452.00, 1, 'cod', 'unpaid', 'new', 'Allen', 'Hayes', 'Tad', '28', 'FO', NULL, 'MacKenzie', 'Casey', '2021-03-29 15:15:48', '2021-03-29 15:15:48', NULL, NULL),
(31, 'ORD-MD09IFELJ3', 1, 2442.00, 5, NULL, 2452.00, 1, 'cod', 'unpaid', 'new', 'Graham', 'Amaya', 'Eric', '50', 'NU', NULL, 'Christen', 'Alma', '2021-03-29 15:24:34', '2021-03-29 15:24:34', NULL, NULL),
(32, 'ORD-BE8DBNAWBD', 37857, 400.00, 6, NULL, 405.00, 2, 'paypal', 'paid', 'new', 'Channing', 'Zachary', 'Curran', '87', 'NP', NULL, 'Fletcher', 'Kaden', '2021-07-08 07:08:06', '2021-07-08 07:08:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_vendor_id` bigint(20) DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int(11) DEFAULT 1,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'inactive',
  `price` double(8,2) DEFAULT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_new` tinyint(4) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `is_approved` tinyint(4) NOT NULL DEFAULT 0,
  `type` tinyint(4) DEFAULT NULL,
  `product_type` tinyint(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `admin_vendor_id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`, `year`, `old_new`, `quantity`, `is_approved`, `type`, `product_type`) VALUES
(35, 1, 'Baebaby Eyes Cream', 'baebaby-eyes-cream', '<p>Baebaby Eyes Cream<br></p>', NULL, 'backend/product/qJCoy7oAaadwvWMZPqBuBLB8d7znF9xVaZNf44qY.png', 20, 'M', 'default', 'active', 200.00, NULL, 1, 1, NULL, 12, '2021-04-02 20:22:45', '2021-04-02 20:24:53', '2020', 1, NULL, 1, 2, NULL),
(36, 1, 'Shoes', 'shoes', '<p>Shoes Shoes Shoes<br></p>', NULL, 'backend/product/83y8hUfRGraCuy8YAczyJv5BnHmwe39EdkQpq4qY.png', 200, 'M', 'default', 'active', 200.00, NULL, 1, 2, NULL, 12, '2021-04-02 20:27:13', '2021-04-02 20:35:38', '200', 1, NULL, 1, 2, NULL),
(37, 1, 'Toys', 'toys', '<p>Toys&nbsp;Toys&nbsp;Toys&nbsp;Toys&nbsp;Toys<br></p>', NULL, 'backend/product/4NwDynWCCgXH2HEthUJEekUWRb4qUSAJjRGSfsli.png', 200, 'M', 'default', 'active', 100.00, NULL, 1, 1, NULL, 12, '2021-04-02 20:30:12', '2021-04-02 20:35:35', '2021', 1, NULL, 1, 2, NULL),
(38, 1, 'Joggers', 'joggers', '<p>Joggers&nbsp;<br></p>', NULL, 'backend/product/bSYfpeVVkYefwcwj4MxCBxg7mg7sImTUd4AU89uz.png', 100, 'M', 'default', 'active', 70.00, NULL, 1, 4, NULL, 12, '2021-04-02 20:33:20', '2021-04-02 20:35:33', '2021', 1, NULL, 1, 2, NULL),
(39, 1, 'Baebaby Eyes Cream', 'baebaby-eyes-cream-2104023525-998', '<p>Baebaby Eyes Cream<br></p>', NULL, 'backend/product/QJMyLltClxTQmt55SZ9dYqC06urcLcbWDXhcvJxN.png', 21, 'M', 'default', 'active', 2.00, NULL, 1, 1, NULL, 12, '2021-04-02 20:35:25', '2021-04-02 20:35:31', '2022', 1, NULL, 1, 2, NULL),
(44, 1, 'Baebaby Eyes Cream  Cream', 'baebaby-eyes-cream-cream', '<p>Baebaby Eyes Cream&nbsp; Cream&nbsp;<br></p>', NULL, 'backend/product/1eV5XdXV6Oso9FfeQtzJvocDPud7CnobYyrFoXSP.png', 200, 'M', 'default', 'active', 100.00, NULL, 1, 3, NULL, 13, '2021-04-02 20:47:33', '2021-04-02 20:47:39', '2021', 1, NULL, 1, 2, NULL),
(45, 1, 'Skin Cream', 'skin-cream', '<p>Skin Cream&nbsp;Skin Cream&nbsp;<br></p>', NULL, 'backend/product/j2TOOkXNdcwfoFN1Lq5uIjZkXTcmVjcllL2QR881.png', 100, 'M', 'default', 'active', 19.00, NULL, 1, 3, NULL, 13, '2021-04-02 20:50:22', '2021-04-02 20:52:41', '2010', 1, NULL, 1, 2, NULL),
(46, 1, 'Tonner Cream', 'tonner-cream', '<p>Tonner Cream&nbsp;Tonner Cream&nbsp;<br></p>', NULL, 'backend/product/kdtgEoG7loQr0xPR8XHF6JSYMmTAoiKq7d3uso47.png', 300, 'M', 'default', 'active', 200.00, NULL, 1, 1, NULL, 14, '2021-04-02 20:53:56', '2021-04-02 20:54:01', '2010', 1, NULL, 1, 2, NULL),
(47, 1, 'Jogger', 'jogger', '<p>Jogger&nbsp;Jogger<br></p>', NULL, 'backend/product/MwjMZa76oIOAXgTb1BouWD0wNNmVME4jIUEYjo8R.png', 122, 'M', 'default', 'active', 12.00, NULL, 1, 2, NULL, 13, '2021-04-02 20:56:47', '2021-04-02 20:56:52', '121', 1, NULL, 1, 2, NULL),
(48, 1, 'Tonner Eyes Cream', 'tonner-eyes-cream', '<p>Tonner Eyes Cream&nbsp;Tonner Eyes Cream<br></p>', NULL, 'backend/product/869MYtXgPWaZq6Udp3YWKrxqJR5ZQaIwYEaOXe2d.png', 2000, 'M', 'default', 'active', 211.00, NULL, 1, 1, NULL, 14, '2021-04-02 20:58:20', '2021-04-02 21:00:38', '2101', 1, NULL, 1, 2, NULL),
(49, 1, 'Tonner Eyes Cream 3', 'tonner-eyes-cream-3', '<p>Tonner Eyes Cream&nbsp;Tonner Eyes Cream<br></p>', NULL, 'backend/product/iNfm9tozUmSSr8oxMDkHYFoGoCpTRkou9RRM3WQH.png', 200, 'M', 'default', 'active', 21.00, NULL, 1, 1, NULL, 13, '2021-04-02 20:59:21', '2021-04-02 21:00:36', '2101', 1, NULL, 1, 2, NULL),
(50, 1, 'Shoes', 'shoes-2104020030-234', '<p>Shoes<br></p>', NULL, 'backend/product/Xt1vPNGXrkinDWCqRBhgaC9Rb2L8irihEEJ6iWEk.png', 21, 'M', 'default', 'active', 12.00, NULL, 1, 2, NULL, 13, '2021-04-02 21:00:30', '2021-04-02 21:00:34', '2101', 1, NULL, 1, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) DEFAULT 0,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_types`
--

CREATE TABLE `product_types` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde omnis iste natus error sit voluptatem Excepteu\r\n\r\n                            sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspi deserunt mollit anim id est laborum. sed ut perspi.', 'Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue, magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.', '/storage/photos/1/logo.png', '/storage/photos/1/blog3.jpg', 'NO. 342 - London Oxford Street, 012 United Kingdom', '+060 (800) 801-582', '', NULL, '2020-08-14 01:49:09');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(5, 'USA', '10.00', 'active', '2021-02-05 07:59:59', '2021-03-29 15:24:09'),
(6, 'Omani', '5.00', 'active', '2021-02-08 08:00:21', '2021-03-29 15:24:16');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_id` tinyint(1) DEFAULT 1,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_parent` int(11) DEFAULT NULL,
  `parent_id` int(22) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `title`, `slug`, `summary`, `photo`, `cat_id`, `status`, `created_at`, `updated_at`, `is_parent`, `parent_id`) VALUES
(1, 'Curent Products', 'led', '<p>Mobiles</p>', 'backend/product/HF6VhWv4aNTAoMwELXxN2iKLtzRHsetzS6Mg6lBa.png', 14, 'active', '2021-03-25 20:11:11', '2021-04-02 20:16:01', NULL, NULL),
(2, 'Shoes', 'home-products', '<p>Home Products<br></p>', 'backend/product/Iyz0h10cjV8Gj2aqZAPlucsJXtwswlx7i53fSbgJ.png', 16, 'active', '2021-04-02 20:16:47', '2021-04-02 20:19:38', NULL, NULL),
(3, 'Specials Products', 'specials-products', '<p>Specials Products<br></p>', 'backend/product/OF22jxtGFIKG8hpu1Hn76Za2Njtxh5fewv9IPZos.png', 17, 'active', '2021-04-02 20:17:28', '2021-04-02 20:17:28', NULL, NULL),
(4, 'Whole Sales Products', 'whole-sales-products', '<p>Whole Sales Products&nbsp;<br></p>', 'backend/product/rgVHzhOOs2IUqh6Tkh5uRshAkCZFdaVjaEV2IROc.png', 15, 'active', '2021-04-02 20:18:10', '2021-04-02 20:18:10', NULL, NULL),
(5, 'LED', 'led-2104020156-875', '<p>LED&nbsp;LED<br></p>', 'backend/product/GZGAKpgsH5SLQZ8PevrCv7IQOSyDg5XttsoaPcma.png', 16, 'active', '2021-04-02 21:01:56', '2021-04-02 21:01:56', NULL, NULL),
(6, 'Shoes', 'shoes', '<p>Shoes<br></p>', 'backend/product/9K7BUbuPy8ytMUkfAryaFdaxbsaHA73bfHC2xNMG.png', 16, 'active', '2021-04-02 21:02:22', '2021-04-02 21:02:22', NULL, NULL),
(7, 'Shoes 2', 'shoes-2', '<p>Shoes<br></p>', 'backend/product/V2vqUerjqvegyHoGIm0F59LcGzsHseLTcfRP0ljU.png', 14, 'active', '2021-04-02 21:02:41', '2021-04-02 21:02:41', NULL, NULL),
(8, 'Tonner Cream', 'tonner-cream', '<p>Tonner Cream<br></p>', 'backend/product/RBjlUMEDJFADcRiESdGKcMleQRq2KWMVapmgPTI3.png', 17, 'active', '2021-04-02 21:03:07', '2021-04-02 21:03:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user','vendor') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_vendor` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`, `is_vendor`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$12$Fk6vml5lb8EdyngsspSUXeVd2p6yZQAElfsOPvrbryG32hbvsKMwK', NULL, 'admin', NULL, NULL, 'active', NULL, NULL, NULL, 0),
(2, 'Steve', 'steve@gmail.com', NULL, '$2y$10$aNAS0yRR0PLqA8sQMF9UXuHKyUf1MVkzmsfSRc1dvPIt4ZimT2A/W', NULL, 'vendor', NULL, NULL, 'active', NULL, '2021-02-03 10:20:51', '2021-02-05 03:00:38', 2),
(12, 'testvender2@gmail.com', 'testvender2@gmail.com', NULL, '$2y$10$6MOMcJxymE00kT0YLWai5eYmXeftWa8XvmRoMUpApkPZd.aHUyQiy', NULL, 'vendor', NULL, NULL, 'active', NULL, '2021-02-09 02:46:12', '2021-02-09 02:49:50', 2),
(13, 'testtt@@gmail.com', 'testtt@@gmail.com', NULL, '$2y$10$LtzzTDmvHevcPeUraS8f8uwNUxiYn4FzIVPR8pjFB.a0mKvH9iW3e', NULL, 'vendor', NULL, NULL, 'active', NULL, '2021-02-09 06:05:30', '2021-02-09 06:06:25', 2),
(15, 'user@gmail.com', 'user@gmail.com', NULL, '$2y$10$./TP0RTNF7YcXzrHC95afuD/ZSUjE.heeNqh7TRFqJ.xCilxZNHF2', NULL, 'user', NULL, NULL, 'active', NULL, '2021-03-17 10:32:14', '2021-03-17 10:32:14', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_types`
--
ALTER TABLE `product_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
