-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 18, 2026 at 07:06 AM
-- Server version: 11.8.6-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u948859228_news`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `forgot_unique_code` text DEFAULT NULL,
  `forgot_at` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `email`, `forgot_unique_code`, `forgot_at`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$10QWx56663BMenZQS6oK4.G8L/XVaOzsi3HvZ/lYj/9fT5mfeeBMO', 'admin@gmail.com', '', '', 'admin/profile.jpg', 1, '2026-06-15 14:47:22', '2026-06-15 14:47:22');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_11_27_064401_create_all_tables', 1),
(6, '2024_04_10_104520_create_admin_table', 1),
(7, '2024_04_10_104525_create_tbl_users_table', 1),
(8, '2024_04_10_104530_create_tbl_languages_table', 1),
(9, '2024_04_10_105710_create_tbl_category_table', 1),
(10, '2024_04_10_110701_create_tbl_subcategory_table', 1),
(11, '2024_04_10_114540_create_tbl_tag_table', 1),
(12, '2024_04_10_115137_create_tbl_news_table', 1),
(13, '2024_04_10_115178_create_tbl_news_image_table', 1),
(14, '2024_04_10_120536_create_tbl_breaking_news_table', 1),
(15, '2024_04_10_122518_create_tbl_live_streaming_table', 1),
(16, '2024_04_12_091014_create_tbl_settings_table', 1),
(17, '2024_04_12_091153_create_tbl_bookmark_table', 1),
(18, '2024_04_12_091423_create_tbl_news_like_table', 1),
(19, '2024_04_12_091725_create_tbl_news_view_table', 1),
(20, '2024_04_12_092110_create_tbl_breaking_news_view_table', 1),
(21, '2024_04_12_092330_create_tbl_comment_table', 1),
(22, '2024_04_12_093239_create_tbl_comment_flag_table', 1),
(23, '2024_04_12_095441_create_tbl_comment_like_table', 1),
(24, '2024_04_12_100023_create_tbl_comment_notification_table', 1),
(25, '2024_04_12_100436_create_tbl_survey_question_table', 1),
(26, '2024_04_12_100901_create_tbl_survey_option_table', 1),
(27, '2024_04_12_102723_create_tbl_survey_result_table', 1),
(28, '2024_04_12_103031_create_tbl_location_table', 1),
(29, '2024_04_12_103211_create_tbl_notifications_table', 1),
(30, '2024_04_13_052620_create_tbl_token_table', 1),
(31, '2024_04_13_052717_create_tbl_users_category_table', 1),
(32, '2024_04_13_053529_create_tbl_pages_table', 1),
(33, '2024_04_13_054156_create_tbl_featured_sections_table', 1),
(34, '2024_04_13_055248_create_tbl_ad_spaces_table', 1),
(35, '2024_04_13_055535_create_tbl_web_settings_table', 1),
(36, '2024_04_13_055705_create_tbl_web_seo_pages_table', 1),
(37, '2024_07_15_161407_create_tbl_social_media_table', 1),
(38, '2024_11_09_150136_create_tbl_rss_table', 1),
(39, '2025_01_23_100907_version_3_2_0', 1),
(40, '2025_04_07_051450_version_3_2_1', 1),
(41, '2026_06_14_000001_create_tbl_ai_news_settings_table', 1),
(42, '2026_06_14_000002_create_tbl_ai_news_logs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'category-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(2, 'category-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(3, 'category-edit', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(4, 'category-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(5, 'category-order-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(6, 'sub-category-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(7, 'sub-category-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(8, 'sub-category-edit', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(9, 'sub-category-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(10, 'sub-category-order-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(11, 'tag-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(12, 'tag-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(13, 'tag-edit', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(14, 'tag-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(15, 'news-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(16, 'news-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(17, 'news-edit', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(18, 'news-edit-description', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(19, 'news-clone', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(20, 'news-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(21, 'news-bulk-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(22, 'breaking-news-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(23, 'breaking-news-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(24, 'breaking-news-edit', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(25, 'breaking-news-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(26, 'breaking-news-bulk-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(27, 'live-streaming-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(28, 'live-streaming-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(29, 'live-streaming-edit', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(30, 'live-streaming-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(31, 'rss-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(32, 'rss-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(33, 'rss-edit', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(34, 'rss-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(35, 'rss-bulk-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(36, 'featured-section-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(37, 'featured-section-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(38, 'featured-section-edit', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(39, 'featured-section-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(40, 'featured-section-order-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(41, 'ad-space-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(42, 'ad-space-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(43, 'ad-space-edit', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(44, 'ad-space-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(45, 'user-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(46, 'user-edit', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(47, 'comment-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(48, 'comment-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(49, 'comment-bulk-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(50, 'comment-flag-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(51, 'comment-flag-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(52, 'notification-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(53, 'notification-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(54, 'notification-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(55, 'survey-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(56, 'survey-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(57, 'survey-edit', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(58, 'survey-view', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(59, 'survey-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(60, 'survey-bulk-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(61, 'location-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(62, 'location-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(63, 'location-edit', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(64, 'location-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(65, 'page-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(66, 'page-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(67, 'page-edit', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(68, 'page-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(69, 'staff-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(70, 'staff-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(71, 'staff-edit', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(72, 'staff-change-password', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(73, 'staff-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(74, 'role-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(75, 'role-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(76, 'role-edit', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(77, 'role-view', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(78, 'role-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(79, 'general-settings', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(80, 'panel-settings', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(81, 'web-settings', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(82, 'app-settings', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(83, 'language-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(84, 'language-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(85, 'language-edit', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(86, 'language-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(87, 'seo-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(88, 'seo-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(89, 'seo-edit', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(90, 'seo-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(91, 'firebase-configuration', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(92, 'social-media-list', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(93, 'social-media-create', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(94, 'social-media-edit', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(95, 'social-media-delete', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(96, 'system-update', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', '2026-06-15 14:47:20', '2026-06-15 14:47:20');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ad_spaces`
--

CREATE TABLE `tbl_ad_spaces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL,
  `ad_space` varchar(255) NOT NULL,
  `ad_featured_section_id` int(11) NOT NULL,
  `ad_image` varchar(255) DEFAULT NULL,
  `web_ad_image` varchar(255) DEFAULT NULL,
  `ad_url` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0-deactive, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ai_news_logs`
--

CREATE TABLE `tbl_ai_news_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `news_id` int(11) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `provider` varchar(30) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'success' COMMENT 'success | failed | skipped',
  `message` text DEFAULT NULL,
  `source_mode` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_ai_news_logs`
--

INSERT INTO `tbl_ai_news_logs` (`id`, `news_id`, `title`, `provider`, `status`, `message`, `source_mode`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'openai', 'skipped', 'No source topics / RSS items available to generate from.', 'topics', '2026-06-16 16:24:02', '2026-06-16 16:24:02'),
(2, NULL, NULL, 'openai', 'skipped', 'No source topics / RSS items available to generate from.', 'topics', '2026-06-16 16:38:33', '2026-06-16 16:38:33'),
(3, NULL, NULL, 'openai', 'skipped', 'No source topics / RSS items available to generate from.', 'topics', '2026-06-16 16:40:34', '2026-06-16 16:40:34'),
(4, NULL, NULL, 'openai', 'skipped', 'No source topics / RSS items available to generate from.', 'topics', '2026-06-16 16:40:40', '2026-06-16 16:40:40'),
(5, NULL, NULL, 'openai', 'skipped', 'No source topics / RSS items available to generate from.', 'topics', '2026-06-16 16:40:56', '2026-06-16 16:40:56'),
(6, NULL, NULL, 'openai', 'skipped', 'No source topics / RSS items available to generate from.', 'topics', '2026-06-16 16:47:49', '2026-06-16 16:47:49'),
(7, NULL, NULL, 'openai', 'skipped', 'No source topics / RSS items available to generate from.', 'topics', '2026-06-16 16:49:49', '2026-06-16 16:49:49'),
(8, NULL, 'Abhijeet Dipake', 'openai', 'failed', 'OpenAI error: 429 {\n    \"error\": {\n        \"message\": \"You exceeded your current quota, please check your plan and billing details. For more information on this error, read the docs: https://platform.openai.com/docs/guides/error-codes/api-errors.\",\n        \"type\": \"insufficient_quota\",\n        \"param\": null,\n        \"code\": \"insufficient_quota\"\n    }\n}\n', 'topics', '2026-06-16 16:50:43', '2026-06-16 16:50:43'),
(9, NULL, 'Bollywood news', 'openai', 'failed', 'OpenAI error: 429 {\n    \"error\": {\n        \"message\": \"You exceeded your current quota, please check your plan and billing details. For more information on this error, read the docs: https://platform.openai.com/docs/guides/error-codes/api-errors.\",\n        \"type\": \"insufficient_quota\",\n        \"param\": null,\n        \"code\": \"insufficient_quota\"\n    }\n}\n', 'topics', '2026-06-16 16:50:44', '2026-06-16 16:50:44'),
(10, NULL, 'Adelsocial Technologies', 'openai', 'failed', 'OpenAI error: 429 {\n    \"error\": {\n        \"message\": \"You exceeded your current quota, please check your plan and billing details. For more information on this error, read the docs: https://platform.openai.com/docs/guides/error-codes/api-errors.\",\n        \"type\": \"insufficient_quota\",\n        \"param\": null,\n        \"code\": \"insufficient_quota\"\n    }\n}\n', 'topics', '2026-06-16 16:50:44', '2026-06-16 16:50:44'),
(11, NULL, 'Bollywood news', 'openai', 'failed', 'OpenAI error: 401 {\n    \"error\": {\n        \"message\": \"Incorrect API key provided: 1234. You can find your API key at https://platform.openai.com/account/api-keys.\",\n        \"type\": \"invalid_request_error\",\n        \"param\": null,\n        \"code\": \"invalid_api_key\"\n    }\n}\n', 'topics', '2026-06-16 16:54:52', '2026-06-16 16:54:52'),
(12, NULL, 'Adelsocial Technologies', 'openai', 'failed', 'OpenAI error: 401 {\n    \"error\": {\n        \"message\": \"Incorrect API key provided: 1234. You can find your API key at https://platform.openai.com/account/api-keys.\",\n        \"type\": \"invalid_request_error\",\n        \"param\": null,\n        \"code\": \"invalid_api_key\"\n    }\n}\n', 'topics', '2026-06-16 16:54:53', '2026-06-16 16:54:53'),
(13, NULL, 'Abhijeet Dipake', 'openai', 'failed', 'OpenAI error: 401 {\n    \"error\": {\n        \"message\": \"Incorrect API key provided: 1234. You can find your API key at https://platform.openai.com/account/api-keys.\",\n        \"type\": \"invalid_request_error\",\n        \"param\": null,\n        \"code\": \"invalid_api_key\"\n    }\n}\n', 'topics', '2026-06-16 16:54:53', '2026-06-16 16:54:53'),
(14, NULL, 'Adelsocial Technologies', 'gemini', 'failed', 'Gemini error: 404 {\n  \"error\": {\n    \"code\": 404,\n    \"message\": \"models/gemini-1.5-flash is not found for API version v1beta, or is not supported for generateContent. Call ModelService.ListModels to see the list of available models and their supported methods.\",\n    \"status\": \"NOT_FOUND\"\n  }\n}\n', 'topics', '2026-06-16 16:58:42', '2026-06-16 16:58:42'),
(15, NULL, 'Bollywood news', 'gemini', 'failed', 'Gemini error: 404 {\n  \"error\": {\n    \"code\": 404,\n    \"message\": \"models/gemini-1.5-flash is not found for API version v1beta, or is not supported for generateContent. Call ModelService.ListModels to see the list of available models and their supported methods.\",\n    \"status\": \"NOT_FOUND\"\n  }\n}\n', 'topics', '2026-06-16 16:58:43', '2026-06-16 16:58:43'),
(16, NULL, 'Abhijeet Dipake', 'gemini', 'failed', 'Gemini error: 404 {\n  \"error\": {\n    \"code\": 404,\n    \"message\": \"models/gemini-1.5-flash is not found for API version v1beta, or is not supported for generateContent. Call ModelService.ListModels to see the list of available models and their supported methods.\",\n    \"status\": \"NOT_FOUND\"\n  }\n}\n', 'topics', '2026-06-16 16:58:43', '2026-06-16 16:58:43'),
(17, NULL, 'Adelsocial Technologies', 'gemini', 'failed', 'Gemini error: 429 {\n  \"error\": {\n    \"code\": 429,\n    \"message\": \"You exceeded your current quota, please check your plan and billing details. For more information on this error, head to: https://ai.google.dev/gemini-api/docs/rate-limits. To monitor your current usage, head to: https://ai.dev/rate-limit. \\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_input_token_count, limit: 0, model: gemini-2.0-flash\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 0, model: gemini-2.0-flash\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 0, model: gemini-2.0-flash\\nPlease retry in 20.660365761s.\",\n    \"status\": \"RESOURCE_EXHAUSTED\",\n    \"details\": [\n      {\n        \"@type\": \"type.googleapis.com/google.rpc.Help\",\n        \"links\": [\n          {\n            \"description\": \"Learn more about Gemini API quotas\",\n            \"url\": \"https://ai.g', 'topics', '2026-06-16 16:59:39', '2026-06-16 16:59:39'),
(18, NULL, 'Abhijeet Dipake', 'gemini', 'failed', 'Gemini error: 429 {\n  \"error\": {\n    \"code\": 429,\n    \"message\": \"You exceeded your current quota, please check your plan and billing details. For more information on this error, head to: https://ai.google.dev/gemini-api/docs/rate-limits. To monitor your current usage, head to: https://ai.dev/rate-limit. \\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_input_token_count, limit: 0, model: gemini-2.0-flash\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 0, model: gemini-2.0-flash\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 0, model: gemini-2.0-flash\\nPlease retry in 20.434622597s.\",\n    \"status\": \"RESOURCE_EXHAUSTED\",\n    \"details\": [\n      {\n        \"@type\": \"type.googleapis.com/google.rpc.Help\",\n        \"links\": [\n          {\n            \"description\": \"Learn more about Gemini API quotas\",\n            \"url\": \"https://ai.g', 'topics', '2026-06-16 16:59:39', '2026-06-16 16:59:39'),
(19, NULL, 'Bollywood news', 'gemini', 'failed', 'Gemini error: 429 {\n  \"error\": {\n    \"code\": 429,\n    \"message\": \"You exceeded your current quota, please check your plan and billing details. For more information on this error, head to: https://ai.google.dev/gemini-api/docs/rate-limits. To monitor your current usage, head to: https://ai.dev/rate-limit. \\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_input_token_count, limit: 0, model: gemini-2.0-flash\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 0, model: gemini-2.0-flash\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 0, model: gemini-2.0-flash\\nPlease retry in 20.246843098s.\",\n    \"status\": \"RESOURCE_EXHAUSTED\",\n    \"details\": [\n      {\n        \"@type\": \"type.googleapis.com/google.rpc.Help\",\n        \"links\": [\n          {\n            \"description\": \"Learn more about Gemini API quotas\",\n            \"url\": \"https://ai.g', 'topics', '2026-06-16 16:59:39', '2026-06-16 16:59:39'),
(20, NULL, 'Bollywood news', 'gemini', 'failed', 'Gemini error: 429 {\n  \"error\": {\n    \"code\": 429,\n    \"message\": \"You exceeded your current quota, please check your plan and billing details. For more information on this error, head to: https://ai.google.dev/gemini-api/docs/rate-limits. To monitor your current usage, head to: https://ai.dev/rate-limit. \\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_input_token_count, limit: 0, model: gemini-2.0-flash\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 0, model: gemini-2.0-flash\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 0, model: gemini-2.0-flash\\nPlease retry in 23.561921242s.\",\n    \"status\": \"RESOURCE_EXHAUSTED\",\n    \"details\": [\n      {\n        \"@type\": \"type.googleapis.com/google.rpc.Help\",\n        \"links\": [\n          {\n            \"description\": \"Learn more about Gemini API quotas\",\n            \"url\": \"https://ai.g', 'topics', '2026-06-16 17:02:36', '2026-06-16 17:02:36'),
(21, NULL, 'Adelsocial Technologies', 'gemini', 'failed', 'Gemini error: 429 {\n  \"error\": {\n    \"code\": 429,\n    \"message\": \"You exceeded your current quota, please check your plan and billing details. For more information on this error, head to: https://ai.google.dev/gemini-api/docs/rate-limits. To monitor your current usage, head to: https://ai.dev/rate-limit. \\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_input_token_count, limit: 0, model: gemini-2.0-flash\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 0, model: gemini-2.0-flash\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 0, model: gemini-2.0-flash\\nPlease retry in 21.965601904s.\",\n    \"status\": \"RESOURCE_EXHAUSTED\",\n    \"details\": [\n      {\n        \"@type\": \"type.googleapis.com/google.rpc.Help\",\n        \"links\": [\n          {\n            \"description\": \"Learn more about Gemini API quotas\",\n            \"url\": \"https://ai.g', 'topics', '2026-06-16 17:02:38', '2026-06-16 17:02:38'),
(22, NULL, 'Abhijeet Dipake', 'gemini', 'failed', 'Gemini error: 503 {\n  \"error\": {\n    \"code\": 503,\n    \"message\": \"The service is currently unavailable.\",\n    \"status\": \"UNAVAILABLE\"\n  }\n}\n', 'topics', '2026-06-16 17:02:38', '2026-06-16 17:02:38'),
(23, NULL, 'Bollywood news', 'gemini', 'failed', 'Gemini error: 429 {\n  \"error\": {\n    \"code\": 429,\n    \"message\": \"You exceeded your current quota, please check your plan and billing details. For more information on this error, head to: https://ai.google.dev/gemini-api/docs/rate-limits. To monitor your current usage, head to: https://ai.dev/rate-limit. \\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 0, model: gemini-2.5-pro\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 0, model: gemini-2.5-pro\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_input_token_count, limit: 0, model: gemini-2.5-pro\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_input_token_count, limit: 0, model: gemini-2.5-pro\\nPlease retry in 22.274559967s.\",\n    \"status\": \"RESOURCE_EXHAUSTED\",\n    \"details\": [\n      {\n        \"@type\": \"type.googleapis.com/google.rpc', 'topics', '2026-06-16 17:03:37', '2026-06-16 17:03:37'),
(24, NULL, 'Abhijeet Dipake', 'gemini', 'failed', 'Gemini error: 429 {\n  \"error\": {\n    \"code\": 429,\n    \"message\": \"You exceeded your current quota, please check your plan and billing details. For more information on this error, head to: https://ai.google.dev/gemini-api/docs/rate-limits. To monitor your current usage, head to: https://ai.dev/rate-limit. \\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_input_token_count, limit: 0, model: gemini-2.5-pro\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_input_token_count, limit: 0, model: gemini-2.5-pro\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 0, model: gemini-2.5-pro\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 0, model: gemini-2.5-pro\\nPlease retry in 21.937361439s.\",\n    \"status\": \"RESOURCE_EXHAUSTED\",\n    \"details\": [\n      {\n        \"@type\": \"type.googleapis.com/google.rpc', 'topics', '2026-06-16 17:03:38', '2026-06-16 17:03:38'),
(25, NULL, 'Adelsocial Technologies', 'gemini', 'failed', 'Gemini error: 429 {\n  \"error\": {\n    \"code\": 429,\n    \"message\": \"You exceeded your current quota, please check your plan and billing details. For more information on this error, head to: https://ai.google.dev/gemini-api/docs/rate-limits. To monitor your current usage, head to: https://ai.dev/rate-limit. \\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_input_token_count, limit: 0, model: gemini-2.5-pro\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 0, model: gemini-2.5-pro\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 0, model: gemini-2.5-pro\\n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_input_token_count, limit: 0, model: gemini-2.5-pro\\nPlease retry in 21.800507619s.\",\n    \"status\": \"RESOURCE_EXHAUSTED\",\n    \"details\": [\n      {\n        \"@type\": \"type.googleapis.com/google.rpc', 'topics', '2026-06-16 17:03:38', '2026-06-16 17:03:38'),
(26, NULL, 'Adelsocial Technologies', 'gemini', 'failed', 'Gemini error: 400 {\n  \"error\": {\n    \"code\": 400,\n    \"message\": \"* GenerateContentRequest.model: unexpected model name format\\n\",\n    \"status\": \"INVALID_ARGUMENT\"\n  }\n}\n', 'topics', '2026-06-16 17:05:08', '2026-06-16 17:05:08'),
(27, NULL, 'Abhijeet Dipake', 'gemini', 'failed', 'Gemini error: 400 {\n  \"error\": {\n    \"code\": 400,\n    \"message\": \"* GenerateContentRequest.model: unexpected model name format\\n\",\n    \"status\": \"INVALID_ARGUMENT\"\n  }\n}\n', 'topics', '2026-06-16 17:05:08', '2026-06-16 17:05:08'),
(28, NULL, 'Bollywood news', 'gemini', 'failed', 'Gemini error: 400 {\n  \"error\": {\n    \"code\": 400,\n    \"message\": \"* GenerateContentRequest.model: unexpected model name format\\n\",\n    \"status\": \"INVALID_ARGUMENT\"\n  }\n}\n', 'topics', '2026-06-16 17:05:09', '2026-06-16 17:05:09'),
(29, 7, 'Adelsocial Technologies Unveils Innovative Platform to Streamline Social Media Management', 'gemini', 'success', 'Generated via gemini', 'topics', '2026-06-16 17:06:14', '2026-06-16 17:06:14'),
(30, 8, 'Abhijeet Dipake Champions Sustainable Urban Development Through Innovative Technology', 'gemini', 'success', 'Generated via gemini', 'topics', '2026-06-16 17:06:17', '2026-06-16 17:06:17'),
(31, 9, 'Bollywood Gears Up for a Busy Release Calendar and New Talent Emergence', 'gemini', 'success', 'Generated via gemini', 'topics', '2026-06-16 17:06:21', '2026-06-16 17:06:21'),
(32, 10, 'Tanishq Tiwari Launches \'Adelsocial\' Platform for Social Impact Initiatives', 'gemini', 'success', 'Generated via gemini', 'topics', '2026-06-16 17:08:01', '2026-06-16 17:08:01'),
(33, 11, 'Tanishq Tiwari Adelsocial: Unpacking the Persona Behind Viral Content', 'gemini', 'success', 'Generated via gemini', 'topics', '2026-06-16 17:08:55', '2026-06-16 17:08:55'),
(34, 12, 'Tanishq Tiwari: Steering AdelSocial Technologies Towards Digital Innovation', 'gemini', 'success', 'Generated via gemini', 'topics', '2026-06-16 17:10:17', '2026-06-16 17:10:17'),
(35, 13, 'Shah Rukh Khan: The Enduring Reign of Bollywood\'s King Khan', 'gemini', 'success', 'Generated via gemini', 'topics', '2026-06-17 22:26:30', '2026-06-17 22:26:30'),
(36, 14, 'Shah Rukh Khan: A Cinematic Journey from Delhi to Stardom', 'gemini', 'success', 'Generated via gemini', 'topics', '2026-06-18 10:50:37', '2026-06-18 10:50:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ai_news_settings`
--

CREATE TABLE `tbl_ai_news_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1-on, 0-off',
  `provider` varchar(30) NOT NULL DEFAULT 'openai',
  `openai_api_key` text DEFAULT NULL,
  `openai_model` varchar(60) NOT NULL DEFAULT 'gpt-4o-mini',
  `gemini_api_key` text DEFAULT NULL,
  `gemini_model` varchar(60) NOT NULL DEFAULT 'gemini-1.5-flash',
  `claude_api_key` text DEFAULT NULL,
  `claude_model` varchar(60) NOT NULL DEFAULT 'claude-3-5-sonnet-20241022',
  `default_language_id` int(11) NOT NULL DEFAULT 0,
  `default_category_id` int(11) NOT NULL DEFAULT 0,
  `auto_publish` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1-publish live, 0-save as draft',
  `per_run_count` int(11) NOT NULL DEFAULT 3,
  `source_mode` varchar(20) NOT NULL DEFAULT 'topics',
  `topics` longtext DEFAULT NULL COMMENT 'one seed topic / keyword per line',
  `rss_urls` longtext DEFAULT NULL COMMENT 'one RSS feed URL per line',
  `tone` text DEFAULT NULL,
  `min_words` int(11) NOT NULL DEFAULT 350,
  `max_words` int(11) NOT NULL DEFAULT 700,
  `last_run_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_ai_news_settings`
--

INSERT INTO `tbl_ai_news_settings` (`id`, `is_enabled`, `provider`, `openai_api_key`, `openai_model`, `gemini_api_key`, `gemini_model`, `claude_api_key`, `claude_model`, `default_language_id`, `default_category_id`, `auto_publish`, `per_run_count`, `source_mode`, `topics`, `rss_urls`, `tone`, `min_words`, `max_words`, `last_run_at`, `created_at`, `updated_at`) VALUES
(1, 0, 'gemini', NULL, 'gpt-4o-mini', 'eyJpdiI6IjNPdDM0S1RVTjZCY01vS3VjVXhQeXc9PSIsInZhbHVlIjoiQWZyU0FuTUlRbXpvdFpWQ015VjNaTStabW9wWXdRbXhmc2JqWW1NeS9HajhPTGUxOFdWUEV2eE9LM0gwdk9SU3ZUMHRBaUdNSFpCd1Qrcm1aVXhWZWc9PSIsIm1hYyI6IjAwZjIwYmFjZGJmYWEwZGU2NzJkMjEwZDI0ZWNlNDk5YzJmOTc3NDhmOWJkZmQyZGEwZjNmMzNmOGFhODFhZGMiLCJ0YWciOiIifQ==', 'gemini-2.5-flash-lite', NULL, 'claude-3-5-sonnet-20241022', 1, 1, 1, 3, 'topics', 'Write about SRK life', NULL, 'Neutral, factual, journalistic. Indian English. No clickbait. Cite no fabricated sources.', 350, 700, '2026-06-18 10:50:37', '2026-06-15 14:47:20', '2026-06-18 10:50:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bookmark`
--

CREATE TABLE `tbl_bookmark` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_breaking_news`
--

CREATE TABLE `tbl_breaking_news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `content_type` varchar(50) DEFAULT NULL,
  `content_value` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `schema_markup` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_breaking_news_view`
--

CREATE TABLE `tbl_breaking_news_view` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `breaking_news_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `schema_markup` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`id`, `language_id`, `category_name`, `slug`, `row_order`, `image`, `meta_title`, `meta_description`, `meta_keyword`, `schema_markup`, `created_at`, `updated_at`) VALUES
(1, 1, 'General', 'general', 1, NULL, NULL, NULL, NULL, NULL, '2026-06-16 10:59:28', '2026-06-16 10:59:28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-unapproved, 1-approved',
  `date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment_flag`
--

CREATE TABLE `tbl_comment_flag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0-deactive, 1-active',
  `date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment_like`
--

CREATE TABLE `tbl_comment_like` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1-like, 2-dislike',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment_notification`
--

CREATE TABLE `tbl_comment_notification` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `master_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_featured_sections`
--

CREATE TABLE `tbl_featured_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `slug` varchar(500) DEFAULT NULL,
  `short_description` varchar(500) DEFAULT NULL,
  `news_type` varchar(500) DEFAULT NULL,
  `videos_type` varchar(100) DEFAULT NULL,
  `filter_type` varchar(500) DEFAULT NULL,
  `category_ids` varchar(255) NOT NULL,
  `subcategory_ids` varchar(255) NOT NULL,
  `news_ids` varchar(255) NOT NULL,
  `style_app` varchar(100) DEFAULT NULL,
  `style_web` varchar(100) DEFAULT NULL,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0-deactive, 1-active',
  `is_based_on_user_choice` tinyint(4) NOT NULL COMMENT '0-filter_section, 1-news from users category',
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `schema_markup` text DEFAULT NULL,
  `og_image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_languages`
--

CREATE TABLE `tbl_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1-active, 0-deactive',
  `isRTL` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1-yes, 0-no',
  `image` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_languages`
--

INSERT INTO `tbl_languages` (`id`, `language`, `code`, `status`, `isRTL`, `image`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'English (US)', 'en', 1, 0, 'flags/en.webp', 'English (US)', '2026-06-15 14:47:20', '2026-06-15 14:47:20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_live_streaming`
--

CREATE TABLE `tbl_live_streaming` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `schema_markup` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_location`
--

CREATE TABLE `tbl_location` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_name` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL DEFAULT 0,
  `tag_id` text NOT NULL,
  `location_id` int(11) NOT NULL DEFAULT 0,
  `title` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `published_date` date NOT NULL,
  `content_type` varchar(50) NOT NULL,
  `content_value` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `show_till` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1-active, 0-deactive',
  `is_clone` int(11) NOT NULL DEFAULT 0,
  `counter` int(11) NOT NULL DEFAULT 0,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `schema_markup` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_news`
--

INSERT INTO `tbl_news` (`id`, `language_id`, `category_id`, `subcategory_id`, `tag_id`, `location_id`, `title`, `slug`, `image`, `date`, `published_date`, `content_type`, `content_value`, `description`, `user_id`, `admin_id`, `show_till`, `status`, `is_clone`, `counter`, `meta_title`, `meta_description`, `meta_keyword`, `schema_markup`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, '', 0, 'Welcome to NewsNow', 'welcome-to-newsnow-demo', '', '2026-06-16 10:59:28', '2026-06-16', 'default', '', '<p>Welcome to NewsNow, your destination for the latest headlines and stories that matter. This is a demo article confirming that your publishing pipeline is working end to end.</p><p>You can now add your own stories from the admin panel, or let the AI News Engine generate them automatically.</p>', 0, 0, '0000-00-00', 1, 0, 12, 'Welcome to NewsNow', 'NewsNow is live and ready to publish daily news.', 'news,welcome,demo', '', '2026-06-16 10:59:28', '2026-06-16 10:59:28'),
(2, 1, 1, 0, '', 0, 'How Our Newsroom Picks the Day\'s Top Stories', 'newsroom-top-stories-demo', '', '2026-06-16 10:59:28', '2026-06-16', 'default', '', '<p>Behind every front page is a set of choices about relevance, timing and impact. This demo piece walks through how a modern newsroom prioritises what readers see first.</p><p>Replace this with your own editorial content whenever you are ready.</p>', 0, 0, '0000-00-00', 1, 0, 34, 'How We Pick Top Stories', 'A look at how the day\'s leading stories are chosen.', 'newsroom,editorial,demo', '', '2026-06-16 10:59:28', '2026-06-16 10:59:28'),
(3, 1, 1, 0, '', 0, 'Technology Trends Shaping the Year Ahead', 'technology-trends-demo', '', '2026-06-16 10:59:28', '2026-06-16', 'default', '', '<p>From practical AI tools to faster connectivity, technology keeps reshaping daily life. This sample story highlights the kind of long-form coverage your site can host.</p><p>Edit or delete this once your real articles are in place.</p>', 0, 0, '0000-00-00', 1, 0, 27, 'Tech Trends This Year', 'Sample coverage of the technology trends to watch.', 'technology,trends,demo', '', '2026-06-16 10:59:28', '2026-06-16 10:59:28'),
(4, 1, 1, 0, '', 0, 'Markets Steady as Investors Weigh New Data', 'markets-steady-demo', '', '2026-06-16 10:59:28', '2026-06-16', 'default', '', '<p>Investors took a measured view as fresh economic data landed. This placeholder business story demonstrates how category pages and detail views render on your theme.</p>', 0, 0, '0000-00-00', 1, 0, 19, 'Markets Hold Steady', 'A demo business and markets update for your site.', 'markets,business,demo', '', '2026-06-16 10:59:28', '2026-06-16 10:59:28'),
(5, 1, 1, 0, '', 0, 'Local Community Event Draws Record Crowd', 'community-event-demo', '', '2026-06-16 10:59:28', '2026-06-16', 'default', '', '<p>Community coverage builds loyal local readership. This sample article shows how human-interest stories appear in your feed and on social shares.</p>', 0, 0, '0000-00-00', 1, 0, 41, 'Community Event Recap', 'A sample local community story for NewsNow.', 'community,local,demo', '', '2026-06-16 10:59:28', '2026-06-16 10:59:28'),
(6, 1, 1, 0, '', 0, 'Sports Roundup: Highlights and Results', 'sports-roundup-demo', '', '2026-06-16 10:59:28', '2026-06-16', 'default', '', '<p>A quick roundup of results and standout moments. Use stories like this to keep readers returning daily. Swap in your real reporting at any time.</p>', 0, 0, '0000-00-00', 1, 0, 53, 'Sports Roundup', 'Demo sports highlights and results for your site.', 'sports,roundup,demo', '', '2026-06-16 10:59:28', '2026-06-16 10:59:28'),
(7, 1, 1, 0, '1,2,3', 0, 'Adelsocial Technologies Unveils Innovative Platform to Streamline Social Media Management', 'adelsocial-technologies-unveils-innovative-platform-to-streamline-social-media-management', '', '2026-06-16 17:06:14', '2026-06-16', 'default', '', '<p>Adelsocial Technologies, a burgeoning player in the digital solutions sector, has announced the launch of its comprehensive social media management platform. The new offering aims to simplify the complex landscape of online presence management for businesses and individuals alike, consolidating various tools into a single, intuitive interface.</p><h2>Key Features and Benefits</h2><p>The platform boasts a suite of features designed to enhance efficiency and effectiveness in social media operations. These include advanced content scheduling capabilities, allowing users to plan and automate posts across multiple networks. Real-time analytics provide deep insights into audience engagement, campaign performance, and overall social media impact, enabling data-driven decision-making. Furthermore, Adelsocial Technologies emphasizes its integrated social listening tools, which monitor brand mentions, industry trends, and competitor activities, offering a competitive edge.</p><p>A significant aspect of the platform is its collaborative functionality. Teams can work together on content creation, approval workflows, and performance reporting, fostering better communication and alignment. The user interface has been meticulously designed for ease of use, catering to both novice and experienced social media managers.</p><h2>Target Audience and Market Impact</h2><p>Adelsocial Technologies is targeting a broad spectrum of clients, from small and medium-sized enterprises (SMEs) seeking to establish or improve their digital footprint, to larger corporations aiming to optimize their existing social media strategies. The company believes its platform will democratize access to sophisticated social media management tools, previously often reserved for larger organizations with substantial budgets.</p><p>Industry analysts suggest that the market for social media management tools continues to grow as businesses increasingly recognize the importance of a strong online presence. Adelsocial Technologies\' entry with a feature-rich and potentially cost-effective solution could present a compelling alternative to established players.</p><h2>Future Outlook</h2><p>The company has indicated plans for continuous development, with future updates expected to include AI-powered content suggestions, enhanced community management features, and expanded integrations with emerging social media channels. Adelsocial Technologies is positioning itself as a forward-thinking provider committed to adapting to the ever-evolving digital marketing environment.</p>', 0, 0, '0000-00-00', 1, 0, 0, 'Adelsocial Technologies Launches Social Media Management Platform', 'Adelsocial Technologies introduces an innovative platform for streamlined social media management, featuring content scheduling, analytics, and social listening tools for businesses.', 'Adelsocial Technologies,social media management,digital marketing,content scheduling,social media analytics,social listening,SME solutions', '', '2026-06-16 17:06:14', '2026-06-16 17:06:14'),
(8, 1, 1, 0, '4,1,5', 0, 'Abhijeet Dipake Champions Sustainable Urban Development Through Innovative Technology', 'abhijeet-dipake-champions-sustainable-urban-development-through-innovative-technology', '', '2026-06-16 17:06:17', '2026-06-16', 'default', '', '<p>Abhijeet Dipake, a prominent figure in the field of urban planning and technology, is increasingly recognized for his contributions to sustainable development. Dipake\'s work focuses on leveraging cutting-edge technological solutions to address the complex challenges faced by modern cities, ranging from traffic congestion and waste management to energy efficiency and citizen engagement.</p><h2>Pioneering Smart City Initiatives</h2><p>Dipake has been a vocal advocate for the integration of smart city principles into urban development strategies. His approach emphasizes data-driven decision-making and the use of IoT (Internet of Things) devices to create more responsive and efficient urban environments. Through various projects and discussions, he has highlighted how smart technologies can optimize resource allocation, reduce environmental impact, and improve the overall quality of life for residents.</p><h2>Focus on Green Technologies</h2><p>A significant aspect of Dipake\'s advocacy centers on the adoption of green technologies. He believes that technological innovation must go hand-in-hand with environmental responsibility. This includes promoting renewable energy sources, developing intelligent waste management systems that facilitate recycling and reduction, and implementing smart grids that enhance energy distribution and minimize wastage. His insights often point towards a future where cities are not just technologically advanced but also ecologically sound.</p><h2>Enhancing Citizen Participation</h2><p>Beyond infrastructure and technology, Dipake also stresses the importance of citizen participation in shaping urban futures. He champions digital platforms and tools that empower residents to voice their concerns, provide feedback, and actively engage in local governance. According to Dipake, truly sustainable cities are those that are built with and for their people, fostering a sense of community and shared responsibility.</p><h2>Future Outlook</h2><p>As cities worldwide grapple with rapid urbanization and climate change, the insights and initiatives championed by Abhijeet Dipake offer a compelling roadmap. His emphasis on a holistic approach, integrating technology, sustainability, and community, positions him as a key voice in the ongoing evolution of urban living.</p>', 0, 0, '0000-00-00', 1, 0, 0, 'Abhijeet Dipake: Sustainable Urban Development & Smart Cities', 'Explore Abhijeet Dipake\'s vision for sustainable urban development, focusing on smart city initiatives, green technologies, and enhanced citizen participation for future cities.', 'Abhijeet Dipake,Sustainable Urban Development,Smart Cities,Green Technology,Urban Planning,Citizen Engagement,IoT,Future Cities', '', '2026-06-16 17:06:17', '2026-06-16 17:06:17'),
(9, 1, 1, 0, '6,7,8,9', 0, 'Bollywood Gears Up for a Busy Release Calendar and New Talent Emergence', 'bollywood-gears-up-for-a-busy-release-calendar-and-new-talent-emergence', '', '2026-06-16 17:06:21', '2026-06-16', 'default', '', '<h2>Bollywood Anticipates a Packed Release Schedule and Fresh Faces</h2>\n\n<p>The Indian film industry, colloquially known as Bollywood, is gearing up for a dynamic period marked by a substantial slate of upcoming releases and the promising debut of new talent. Industry analysts are observing a renewed vigour as major studios and independent production houses prepare to launch a diverse range of films across various genres, from action-thrillers and romantic comedies to historical dramas and social commentaries.</p>\n\n<p>Several high-profile projects are slated for theatrical release in the coming months, featuring a mix of established superstars and rising stars. The industry is particularly keen to see how these films perform at the box office, following a period of fluctuating audience attendance. Producers are investing in extensive promotional campaigns, aiming to recapture the pre-pandemic levels of audience engagement and enthusiasm.</p>\n\n<h2>Emergence of New Talent</h2>\n\n<p>Beyond the established names, Bollywood is also witnessing the emergence of a new generation of actors, directors, and technicians. Several debut films are generating considerable buzz, with their creators promising fresh perspectives and innovative storytelling. This influx of new talent is often seen as a crucial factor in the industry\'s ability to evolve and stay relevant to contemporary audiences.</p>\n\n<p>Industry insiders suggest that the focus on diverse narratives and character-driven stories is likely to continue. This shift, driven by both creative ambition and audience demand for more relatable content, is expected to shape the future trajectory of Bollywood cinema. The accessibility of streaming platforms has also played a role, encouraging filmmakers to experiment with subject matter that might have previously been considered niche.</p>\n\n<h2>Industry Adapts to Evolving Landscape</h2>\n\n<p>The business of filmmaking in Mumbai continues to adapt to an ever-changing media landscape. While traditional theatrical releases remain a cornerstone, the integration of digital platforms for content distribution and promotion is now an integral part of the strategy for most productions. This dual approach allows films to reach a wider audience and caters to different viewing preferences.</p>\n\n<p>As the industry navigates these developments, the focus remains on delivering compelling cinematic experiences. The anticipation surrounding upcoming releases and the excitement for new voices underscore a period of significant activity and potential growth for Bollywood.</p>', 0, 0, '0000-00-00', 1, 0, 0, 'Bollywood News: Upcoming Releases and New Talent', 'Stay updated on the latest Bollywood news, including upcoming film releases, emerging talent, and industry trends. Discover what\'s next for the Indian film industry.', 'Bollywood,Indian cinema,film releases,new actors,directors,entertainment news,Hindi films', '', '2026-06-16 17:06:21', '2026-06-16 17:06:21'),
(10, 1, 1, 0, '10,1,11', 0, 'Tanishq Tiwari Launches \'Adelsocial\' Platform for Social Impact Initiatives', 'tanishq-tiwari-launches-adelsocial-platform-for-social-impact-initiatives', '', '2026-06-16 17:08:01', '2026-06-16', 'default', '', '<p>Tanishq Tiwari, a prominent figure known for his entrepreneurial ventures, has announced the launch of \'Adelsocial,\' a new digital platform aimed at fostering and amplifying social impact initiatives. The platform seeks to connect individuals, non-profit organizations, and corporations interested in contributing to societal betterment.</p><p>Adelsocial is envisioned as a comprehensive ecosystem where users can discover, engage with, and support various social causes. The platform will feature a range of functionalities designed to facilitate seamless participation, including project showcasing, volunteer recruitment, donation management, and impact reporting. The goal is to streamline the process of social engagement and make it more accessible to a wider audience.</p><h2>Key Features and Objectives</h2><ul><li><strong>Project Discovery:</strong> Adelsocial will host a curated list of social projects across diverse sectors such as education, healthcare, environmental sustainability, and poverty alleviation. Users can browse these projects based on their interests and geographical focus.</li><li><strong>Volunteer Mobilization:</strong> The platform aims to be a central hub for individuals looking to volunteer their time and skills. Organizations can post volunteer opportunities, and interested individuals can apply directly through Adelsocial.</li><li><strong>Fundraising and Donations:</strong> A transparent and secure system for managing donations will be integrated, allowing individuals and organizations to contribute financially to causes they believe in. The platform emphasizes accountability and clear reporting on fund utilization.</li><li><strong>Impact Measurement:</strong> Adelsocial intends to incorporate tools for measuring and demonstrating the tangible impact of supported initiatives, fostering greater trust and encouraging continued engagement.</li><li><strong>Collaboration and Networking:</strong> The platform will also serve as a networking space for social entrepreneurs, NGOs, and corporate social responsibility (CSR) departments to collaborate on larger-scale projects and share best practices.</li></ul><p>Tiwari stated that Adelsocial was conceptualized out of a desire to bridge the gap between intention and action in the social impact space. \"We believe that technology can play a pivotal role in democratizing social change,\" Tiwari commented. \"Adelsocial is designed to empower everyone to contribute meaningfully, whether through their time, resources, or expertise.\"</p><p>The launch of Adelsocial is expected to provide a much-needed boost to the social sector, offering a modern and efficient avenue for engagement and support. Further details regarding the platform\'s rollout and initial partnerships are anticipated in the coming weeks.</p>', 0, 0, '0000-00-00', 1, 0, 0, 'Tanishq Tiwari launches Adelsocial for social impact', 'Tanishq Tiwari introduces Adelsocial, a digital platform designed to connect individuals, NGOs, and corporations for social impact initiatives, volunteerism, and fundraising.', 'Tanishq Tiwari,Adelsocial,social impact,non-profit organizations,CSR,volunteering,fundraising platform,social entrepreneurship', '', '2026-06-16 17:08:01', '2026-06-16 17:08:01'),
(11, 1, 1, 0, '12,13,14,15', 0, 'Tanishq Tiwari Adelsocial: Unpacking the Persona Behind Viral Content', 'tanishq-tiwari-adelsocial-unpacking-the-persona-behind-viral-content', '', '2026-06-16 17:08:55', '2026-06-16', 'default', '', '<p>The name Tanishq Tiwari Adelsocial has surfaced across social media platforms, sparking curiosity about the individual behind the often-viral content. While not a mainstream celebrity, Tiwari has carved a niche for himself, primarily through short-form video platforms, where his unique style and relatable content have garnered a substantial following.</p><h2>Rise to Prominence</h2><p>Tiwari\'s ascent on platforms like Instagram Reels and YouTube Shorts can be attributed to his ability to create engaging and often humorous content that resonates with a young audience. His videos frequently feature observational comedy, everyday situations, and a distinct personal flair. The \"Adelsocial\" moniker appears to be an extension of his online identity, possibly signifying a focus on social commentary or a play on words related to his social media presence.</p><h2>Content Style and Themes</h2><p>The core of Tanishq Tiwari Adelsocial\'s content revolves around:</p><ul><li>Relatable everyday scenarios, often with a comedic twist.</li><li>Short, punchy narratives that capture attention quickly.</li><li>Use of trending audio and visual formats.</li><li>A persona that is perceived as authentic and approachable.</li></ul><p>While specific details about his personal life remain largely private, his online persona suggests an individual adept at understanding and leveraging social media trends to connect with a broad audience. The \"Adelsocial\" part of his name might also hint at an interest in social issues or a commentary on societal norms, though this is often presented through a lighthearted, comedic lens.</p><h2>Audience and Impact</h2><p>Tiwari\'s followers appreciate his ability to distill common experiences into shareable, entertaining clips. His content often goes viral, leading to wider recognition and engagement. This viral potential is a key factor in his growing influence within the digital content creation space. As with many social media personalities, the exact extent of his professional background or the methodology behind his content creation process is not widely publicized, allowing the focus to remain on the content itself.</p><h2>The \"Adelsocial\" Identity</h2><p>The \"Adelsocial\" component of his name remains a subject of interpretation among his followers. It could denote a brand, a specific content category, or simply a creative pseudonym. Regardless of its precise meaning, it has become an integral part of his recognized online identity, distinguishing him in the crowded social media landscape.</p><p>In essence, Tanishq Tiwari Adelsocial represents a modern archetype of a digital creator who has found success through consistent, engaging content tailored for the fast-paced world of social media consumption. His journey highlights the power of relatability and trend-awareness in building a significant online presence.</p>', 0, 0, '0000-00-00', 1, 0, 0, 'Who is Tanishq Tiwari Adelsocial? Viral Content Creator Profile', 'Explore the online persona and content style of Tanishq Tiwari Adelsocial, a popular creator known for viral videos on platforms like Instagram Reels and YouTube Shorts.', 'Tanishq Tiwari Adelsocial,viral content creator,social media personality,Instagram Reels,YouTube Shorts,digital creator,online trends,Indian social media', '', '2026-06-16 17:08:55', '2026-06-16 17:08:55'),
(12, 1, 1, 0, '1,16,17,2', 0, 'Tanishq Tiwari: Steering AdelSocial Technologies Towards Digital Innovation', 'tanishq-tiwari-steering-adelsocial-technologies-towards-digital-innovation', '', '2026-06-16 17:10:17', '2026-06-16', 'default', '', '<p>Tanishq Tiwari, the driving force behind AdelSocial Technologies OPC Private Limited, has emerged as a notable figure in India\'s burgeoning digital solutions landscape. From humble beginnings, Tiwari\'s vision has been instrumental in shaping the company\'s trajectory, focusing on delivering innovative and accessible technological services.</p><h2>Early Career and Founding Vision</h2><p>Tanishq Tiwari\'s journey into entrepreneurship was marked by a keen observation of the evolving digital needs across various sectors. Recognizing the potential for technology to streamline operations and enhance customer engagement, Tiwari established AdelSocial Technologies with a clear objective: to bridge the gap between businesses and effective digital tools. The company, operating as an One Person Company (OPC), highlights Tiwari\'s hands-on approach and commitment to leading from the front.</p><h2>Focus on Digital Solutions</h2><p>Under Tiwari\'s directorship, AdelSocial Technologies has concentrated on developing and implementing a range of digital solutions. These often include social media management, digital marketing strategies, website development, and other online presence enhancement services tailored for small and medium-sized enterprises (SMEs). The company\'s philosophy revolves around providing cost-effective and impactful digital transformations, enabling clients to compete effectively in an increasingly online marketplace.</p><h2>Growth and Future Outlook</h2><p>AdelSocial Technologies, guided by Tiwari\'s leadership, has steadily grown its client base and service portfolio. The emphasis remains on adapting to the rapid changes in the digital domain and consistently offering value to its clientele. Tiwari\'s strategic direction suggests a future where AdelSocial Technologies continues to be a reliable partner for businesses seeking to leverage digital platforms for growth and sustainability. The company\'s operational model as an OPC allows for agility and focused decision-making, crucial in the fast-paced tech industry.</p>', 0, 0, '0000-00-00', 1, 0, 0, 'Tanishq Tiwari: Director at AdelSocial Technologies', 'Explore the life story and vision of Tanishq Tiwari, the Director of AdelSocial Technologies OPC Private Limited, a company focused on digital innovation and solutions.', 'Tanishq Tiwari,AdelSocial Technologies,Digital Solutions,Entrepreneurship,India Tech,SME Digitalization,OPC Private Limited', '', '2026-06-16 17:10:17', '2026-06-16 17:10:17'),
(13, 1, 1, 0, '6,18,7,8', 0, 'Shah Rukh Khan: The Enduring Reign of Bollywood\'s King Khan', 'shah-rukh-khan-the-enduring-reign-of-bollywood-s-king-khan', '', '2026-06-17 22:26:30', '2026-06-17', 'default', '', '<p>Shah Rukh Khan, often hailed as \'King Khan\' or \'SRK\', stands as one of India\'s most iconic and globally recognized film stars. His journey from a relatively unknown television actor to a Bollywood superstar is a testament to his charisma, dedication, and remarkable screen presence.</p><p>Born on November 2, 1965, in New Delhi, Khan\'s early life was marked by tragedy and resilience. He pursued a degree in Economics before venturing into acting, making his debut in the television serial \'Fauji\' in 1988. This led to early film roles, but it was his breakthrough performance in Yash Chopra\'s \'Deewana\' (1992) that catapulted him to stardom.</p><h2>A Career Defined by Diverse Roles and Box Office Success</h2><p>Throughout the 1990s and 2000s, SRK established himself as the king of romantic dramas and action thrillers. Films like \'Dilwale Dulhania Le Jayenge\' (1995), \'Kuch Kuch Hota Hai\' (1998), and \'Kabhi Khushi Kabhie Gham...\' (2001) became cultural phenomena, cementing his image as Bollywood\'s quintessential romantic hero. His signature open-arm pose became instantly recognizable worldwide.</p><p>Beyond romance, Khan also proved his mettle in more intense roles. \'Baazigar\' (1993) and \'Darr\' (1993) saw him playing complex anti-heroes, showcasing his versatility. Later, films like \'Swades\' (2004), \'Chak De! India\' (2007), and \'My Name Is Khan\' (2010) demonstrated his ability to deliver nuanced performances in socially relevant narratives.</p><h2>Beyond the Silver Screen: Business Acumen and Global Influence</h2><p>Shah Rukh Khan\'s influence extends far beyond cinema. He is a successful film producer, co-chairman of the production company Red Chillies Entertainment, and has a significant presence in the Indian Premier League (IPL) as the co-owner of the Kolkata Knight Riders (KKR). His business ventures highlight a sharp entrepreneurial spirit.</p><p>His global appeal is undeniable, with a massive fan following across Asia, Europe, and North America. He has been recognized with numerous awards, including multiple Filmfare Awards, and has been honored by the Indian government with the Padma Shri. His philanthropic efforts, particularly through the Meer Foundation, also underscore his commitment to social causes.</p><h2>The Comeback and Future Prospects</h2><p>After a hiatus, Shah Rukh Khan made a triumphant return to the big screen in 2023 with \'Pathaan\' and \'Jawan\', both of which shattered box office records, proving his enduring star power. His upcoming projects continue to generate immense anticipation, signaling that King Khan\'s reign in Bollywood is far from over.</p><p>SRK\'s journey is a compelling narrative of talent, hard work, and the ability to connect with audiences on a profound level, making him an enduring icon of Indian cinema.</p>', 0, 0, '0000-00-00', 1, 0, 0, 'Shah Rukh Khan: Bollywood King Khan\'s Life and Career', 'Explore the life, career, and enduring legacy of Shah Rukh Khan, Bollywood\'s King Khan. From TV to global superstardom and business ventures.', 'Shah Rukh Khan,SRK,Bollywood,King Khan,Indian Cinema,Filmography,Red Chillies Entertainment,Kolkata Knight Riders', '', '2026-06-17 22:26:30', '2026-06-17 22:26:30'),
(14, 1, 1, 0, '6,19,8,20', 0, 'Shah Rukh Khan: A Cinematic Journey from Delhi to Stardom', 'shah-rukh-khan-a-cinematic-journey-from-delhi-to-stardom', '', '2026-06-18 10:50:37', '2026-06-18', 'default', '', '<p>Shah Rukh Khan, often hailed as the \'King Khan\' of Bollywood, has carved an indelible legacy in Indian cinema. His journey from a middle-class upbringing in New Delhi to becoming one of the world\'s most recognizable film stars is a testament to his talent, charisma, and unwavering dedication.</p><h2>Early Life and Education</h2><p>Born on November 2, 1965, in New Delhi, Shah Rukh Khan\'s early life was marked by a blend of academic pursuits and early forays into theatre. He attended St. Columba\'s School, where he excelled in sports and academics. Later, he enrolled at Hansraj College, graduating with a degree in Economics. His passion for acting bloomed during his college years, leading him to pursue a Master\'s degree in Mass Communications at Jamia Millia Islamia before ultimately dedicating himself to acting.</p><h2>The Ascent to Stardom</h2><p>Khan\'s career began in earnest with television roles in the late 1980s, notably in the popular series \'Fauji\' and \'Circus\'. These early appearances showcased his raw talent and magnetic screen presence, catching the eye of filmmakers. His transition to the big screen in the early 1990s marked the beginning of a meteoric rise. Films like \'Deewana\', \'Baazigar\', and \'Darr\' established him as a formidable actor, capable of portraying complex and often unconventional characters.</p><p>The mid-to-late 1990s saw him solidify his position as a romantic icon with a string of blockbuster hits. \'Dilwale Dulhania Le Jayenge\' (DDLJ), released in 1995, became an all-time classic and continues to run in theatres, a rare feat in cinematic history. Other significant films from this era include \'Kuch Kuch Hota Hai\', \'Dil To Pagal Hai\', and \'Kabhi Khushi Kabhie Gham...\', cementing his image as Bollywood\'s \'King of Romance\'.</p><h2>Beyond Romance: Versatility and Global Appeal</h2><p>While his romantic roles brought him widespread adoration, Shah Rukh Khan has consistently challenged himself with diverse characters. He has delivered powerful performances in critically acclaimed films such as \'Swades\', \'Chak De! India\', and \'My Name Is Khan\', showcasing his range as an actor. These roles often explored themes of patriotism, social issues, and personal struggle, resonating deeply with audiences both in India and internationally.</p><p>His global appeal is undeniable. Khan is not just a star in India but a phenomenon across continents, with a massive fan following in countries across Asia, Europe, and North America. His films often achieve significant box office success worldwide, making him one of the most commercially successful actors globally.</p><h2>Business Ventures and Philanthropy</h2><p>Beyond his acting career, Shah Rukh Khan is a successful businessman. He is the co-chairman of Red Chillies Entertainment, a leading production house, and has stakes in the Indian Premier League (IPL) cricket team, Kolkata Knight Riders. He is also known for his philanthropic efforts, particularly through his Meer Foundation, which supports various charitable causes.</p><h2>Legacy</h2><p>Shah Rukh Khan\'s enduring appeal lies in his ability to connect with audiences on an emotional level, his infectious charm, and his dedication to his craft. He has not only entertained millions for decades but has also inspired aspiring actors and entrepreneurs, embodying the spirit of a true cinematic icon.</p>', 0, 0, '0000-00-00', 1, 0, 0, 'Shah Rukh Khan: Bollywood King\'s Journey to Global Stardom', 'Explore the remarkable life and career of Shah Rukh Khan, from his early days in Delhi to becoming a global Bollywood superstar and successful entrepreneur.', 'Shah Rukh Khan,Bollywood,Indian Cinema,King Khan,Actor,Red Chillies Entertainment,SRK', '', '2026-06-18 10:50:37', '2026-06-18 10:50:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news_image`
--

CREATE TABLE `tbl_news_image` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `news_id` int(11) NOT NULL,
  `other_image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news_like`
--

CREATE TABLE `tbl_news_like` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1-like, 2-dislike, 0-none',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news_view`
--

CREATE TABLE `tbl_news_view` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notifications`
--

CREATE TABLE `tbl_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `subcategory_id` int(11) NOT NULL DEFAULT 0,
  `news_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `type` varchar(12) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date_sent` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pages`
--

CREATE TABLE `tbl_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `page_type` varchar(50) NOT NULL,
  `slug` varchar(500) NOT NULL,
  `page_content` mediumtext DEFAULT NULL,
  `page_icon` varchar(255) DEFAULT NULL,
  `og_image` varchar(255) DEFAULT NULL,
  `schema_markup` text DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `is_custom` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0-default, 1-custom',
  `is_termspolicy` tinyint(4) NOT NULL DEFAULT 0,
  `is_privacypolicy` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0-deactive, 1-active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_pages`
--

INSERT INTO `tbl_pages` (`id`, `language_id`, `title`, `page_type`, `slug`, `page_content`, `page_icon`, `og_image`, `schema_markup`, `meta_title`, `meta_description`, `meta_keywords`, `is_custom`, `is_termspolicy`, `is_privacypolicy`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Privacy Policy', 'privacy-policy', 'privacy-policy', '<p style=\"text-align: left;\">NEWS APP &amp; CONTENT POLICY</p>', '', '', '', '', 'Privacy Policy', 'Policy', 0, 0, 1, 1, '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(2, 1, 'Terms & Conditions', 'terms-condition', 'terms-condition', '<p style=\"text-align: left;\"><strong>1. Terms Conditions</strong></p>', '', '', '', '', 'Terms & Conditions', 'Terms', 0, 1, 0, 1, '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(3, 1, 'Contact Us', 'contact-us', 'contact-us', '<p style=\"text-align: center;\"><strong>How can we help you?</strong></p>', '', '', '', '', 'Contact Us', 'Contact', 0, 0, 0, 1, '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(4, 1, 'About Us', 'about-us', 'about-us', '<p><strong>About Us:</strong></p>', '', '', '', '', 'About Us', 'About', 0, 0, 0, 1, '2026-06-15 14:47:20', '2026-06-15 14:47:20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rss`
--

CREATE TABLE `tbl_rss` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL DEFAULT 0,
  `tag_id` varchar(255) NOT NULL,
  `feed_name` varchar(255) NOT NULL,
  `feed_url` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1-active, 0-deactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `type`, `message`, `created_at`, `updated_at`) VALUES
(1, 'rss_feed_mode', '1', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(2, 'mobile_login_mode', '0', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(3, 'country_code', 'IN', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(4, 'shareapp_text', 'You can find our app from below url', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(5, 'appstore_app_id', '', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(6, 'association_file', '', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(7, 'assetlinks_file', '', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(8, 'app_version', '3.2.1', NULL, NULL),
(9, 'default_language', '1', NULL, NULL),
(10, 'system_timezone', 'Asia/Kolkata', NULL, NULL),
(11, 'app_name', 'News', NULL, NULL),
(12, 'primary_color', '#000000', NULL, NULL),
(13, 'secondary_color', '#ba2028', NULL, NULL),
(14, 'auto_delete_expire_news_mode', '0', NULL, NULL),
(15, 'app_logo_full', 'logo.png', NULL, NULL),
(16, 'app_logo', 'favicon.png', NULL, NULL),
(17, 'smtp_host', 'smtp.googlemail.com', NULL, NULL),
(18, 'smtp_user', 'SMTP User', NULL, NULL),
(19, 'smtp_password', 'SMTP Password', NULL, NULL),
(20, 'smtp_port', '465', NULL, NULL),
(21, 'smtp_crypto', 'tls', NULL, NULL),
(22, 'from_name', 'News', NULL, NULL),
(23, 'category_mode', '1', NULL, NULL),
(24, 'subcategory_mode', '1', NULL, NULL),
(25, 'breaking_news_mode', '1', NULL, NULL),
(26, 'live_streaming_mode', '1', NULL, NULL),
(27, 'comments_mode', '1', NULL, NULL),
(28, 'weather_mode', '0', NULL, NULL),
(29, 'location_news_mode', '0', NULL, NULL),
(30, 'nearest_location_measure', '1000', NULL, NULL),
(31, 'maintenance_mode', '0', NULL, NULL),
(32, 'in_app_ads_mode', '0', NULL, NULL),
(33, 'ads_type', '1', NULL, NULL),
(34, 'google_rewarded_video_id', 'google Rewarded Video Id', NULL, NULL),
(35, 'google_interstitial_id', 'google Interstitial Id', NULL, NULL),
(36, 'google_banner_id', 'google Banner Id', NULL, NULL),
(37, 'google_native_unit_id', 'google Native Unit Id', NULL, NULL),
(38, 'unity_rewarded_video_id', '1', NULL, NULL),
(39, 'unity_interstitial_id', '1', NULL, NULL),
(40, 'unity_banner_id', '1', NULL, NULL),
(41, 'android_game_id', '1', NULL, NULL),
(42, 'ios_in_app_ads_mode', '0', NULL, NULL),
(43, 'ios_ads_type', '1', NULL, NULL),
(44, 'ios_google_rewarded_video_id', 'google Rewarded Video Id', NULL, NULL),
(45, 'ios_google_interstitial_id', 'google Interstitial Id', NULL, NULL),
(46, 'ios_google_banner_id', 'google Banner Id', NULL, NULL),
(47, 'ios_google_native_unit_id', 'google Native Unit Id', NULL, NULL),
(48, 'ios_unity_rewarded_video_id', '1', NULL, NULL),
(49, 'ios_unity_interstitial_id', '1', NULL, NULL),
(50, 'ios_unity_banner_id', '1', NULL, NULL),
(51, 'ios_game_id', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_social_media`
--

CREATE TABLE `tbl_social_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` char(255) NOT NULL,
  `link` char(255) NOT NULL,
  `row_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategory`
--

CREATE TABLE `tbl_subcategory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `row_order` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_survey_option`
--

CREATE TABLE `tbl_survey_option` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` int(11) NOT NULL,
  `options` text NOT NULL,
  `counter` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_survey_question`
--

CREATE TABLE `tbl_survey_question` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_survey_result`
--

CREATE TABLE `tbl_survey_result` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tag`
--

CREATE TABLE `tbl_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_id` int(11) NOT NULL,
  `tag_name` varchar(100) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `schema_markup` text DEFAULT NULL,
  `og_image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_tag`
--

INSERT INTO `tbl_tag` (`id`, `language_id`, `tag_name`, `slug`, `meta_title`, `meta_description`, `meta_keyword`, `schema_markup`, `og_image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Technology', 'technology', NULL, NULL, NULL, NULL, NULL, '2026-06-16 17:06:14', '2026-06-16 17:06:14'),
(2, 1, 'Digital Marketing', 'digital-marketing', NULL, NULL, NULL, NULL, NULL, '2026-06-16 17:06:14', '2026-06-16 17:06:14'),
(3, 1, 'Business Solutions', 'business-solutions', NULL, NULL, NULL, NULL, NULL, '2026-06-16 17:06:14', '2026-06-16 17:06:14'),
(4, 1, 'Urban Development', 'urban-development', NULL, NULL, NULL, NULL, NULL, '2026-06-16 17:06:17', '2026-06-16 17:06:17'),
(5, 1, 'Sustainability', 'sustainability', NULL, NULL, NULL, NULL, NULL, '2026-06-16 17:06:17', '2026-06-16 17:06:17'),
(6, 1, 'Bollywood', 'bollywood', NULL, NULL, NULL, NULL, NULL, '2026-06-16 17:06:21', '2026-06-16 17:06:21'),
(7, 1, 'Indian Cinema', 'indian-cinema', NULL, NULL, NULL, NULL, NULL, '2026-06-16 17:06:21', '2026-06-16 17:06:21'),
(8, 1, 'Film Industry', 'film-industry', NULL, NULL, NULL, NULL, NULL, '2026-06-16 17:06:21', '2026-06-16 17:06:21'),
(9, 1, 'Entertainment', 'entertainment', NULL, NULL, NULL, NULL, NULL, '2026-06-16 17:06:21', '2026-06-16 17:06:21'),
(10, 1, 'Social Impact', 'social-impact', NULL, NULL, NULL, NULL, NULL, '2026-06-16 17:08:01', '2026-06-16 17:08:01'),
(11, 1, 'Philanthropy', 'philanthropy', NULL, NULL, NULL, NULL, NULL, '2026-06-16 17:08:01', '2026-06-16 17:08:01'),
(12, 1, 'Social Media', 'social-media', NULL, NULL, NULL, NULL, NULL, '2026-06-16 17:08:55', '2026-06-16 17:08:55'),
(13, 1, 'Content Creation', 'content-creation', NULL, NULL, NULL, NULL, NULL, '2026-06-16 17:08:55', '2026-06-16 17:08:55'),
(14, 1, 'Digital Trends', 'digital-trends', NULL, NULL, NULL, NULL, NULL, '2026-06-16 17:08:55', '2026-06-16 17:08:55'),
(15, 1, 'Internet Personalities', 'internet-personalities', NULL, NULL, NULL, NULL, NULL, '2026-06-16 17:08:55', '2026-06-16 17:08:55'),
(16, 1, 'Business', 'business', NULL, NULL, NULL, NULL, NULL, '2026-06-16 17:10:17', '2026-06-16 17:10:17'),
(17, 1, 'Leadership', 'leadership', NULL, NULL, NULL, NULL, NULL, '2026-06-16 17:10:17', '2026-06-16 17:10:17'),
(18, 1, 'Shah Rukh Khan', 'shah-rukh-khan', NULL, NULL, NULL, NULL, NULL, '2026-06-17 22:26:30', '2026-06-17 22:26:30'),
(19, 1, 'Celebrity', 'celebrity', NULL, NULL, NULL, NULL, NULL, '2026-06-18 10:50:37', '2026-06-18 10:50:37'),
(20, 1, 'SRK', 'srk', NULL, NULL, NULL, NULL, NULL, '2026-06-18 10:50:37', '2026-06-18 10:50:37');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_token`
--

CREATE TABLE `tbl_token` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `token` text NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firebase_id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `profile` text DEFAULT NULL,
  `fcm_id` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1-active, 0-deactive',
  `date` datetime NOT NULL,
  `role` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users_category`
--

CREATE TABLE `tbl_users_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_roles`
--

CREATE TABLE `tbl_user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_web_seo_pages`
--

CREATE TABLE `tbl_web_seo_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_type` varchar(50) NOT NULL,
  `og_image` varchar(255) NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `schema_markup` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_web_settings`
--

CREATE TABLE `tbl_web_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_web_settings`
--

INSERT INTO `tbl_web_settings` (`id`, `type`, `message`, `created_at`, `updated_at`) VALUES
(1, 'web_name', 'News', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(2, 'light_body_color', '#f5f5f5', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(3, 'light_hover_color', '#122342', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(4, 'light_primary_color', '#ee2934', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(5, 'light_secondary_color', '#1a2e51', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(6, 'light_text_primary_color', '#0f1f40', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(7, 'light_text_secondary_color', '#65686d', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(8, 'light_header_logo', 'logos/header-logo.svg', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(9, 'light_footer_logo', 'logos/footer-logo.svg', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(10, 'light_placeholder_image', 'logos/placeholder.png', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(11, 'dark_body_color', '#0a1935', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(12, 'dark_hover_color', '#15346d', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(13, 'dark_primary_color', '#ce2b2b', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(14, 'dark_secondary_color', '#122342', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(15, 'dark_text_primary_color', '#ffffff', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(16, 'dark_text_secondary_color', '#98a2b3', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(17, 'dark_header_logo', 'logos/header-logo-dark.svg', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(18, 'dark_footer_logo', 'logos/footer-logo-dark.svg', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(19, 'dark_placeholder_image', 'logos/placeholder-dark.png', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(20, 'favicon_icon', 'logos/favicon-icon.png', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(21, 'web_footer_description', 'News Web website is an online platform that provides news and information about various topics, including current events, entertainment, politics, sports, technology, and more.', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(22, 'google_adsense', '', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(23, 'android_app_link', '', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(24, 'ios_app_link', '', '2026-06-15 14:47:20', '2026-06-15 14:47:20'),
(25, 'accept_cookie', '0', '2026-06-15 14:47:20', '2026-06-15 14:47:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

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
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- Indexes for table `tbl_ad_spaces`
--
ALTER TABLE `tbl_ad_spaces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `tbl_ai_news_logs`
--
ALTER TABLE `tbl_ai_news_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_id` (`news_id`);

--
-- Indexes for table `tbl_ai_news_settings`
--
ALTER TABLE `tbl_ai_news_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_bookmark`
--
ALTER TABLE `tbl_bookmark`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `news_id` (`news_id`);

--
-- Indexes for table `tbl_breaking_news`
--
ALTER TABLE `tbl_breaking_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `tbl_breaking_news_view`
--
ALTER TABLE `tbl_breaking_news_view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `breaking_news_id` (`breaking_news_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `slug` (`slug`),
  ADD KEY `row_order` (`row_order`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `news_id` (`news_id`);

--
-- Indexes for table `tbl_comment_flag`
--
ALTER TABLE `tbl_comment_flag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `news_id` (`news_id`);

--
-- Indexes for table `tbl_comment_like`
--
ALTER TABLE `tbl_comment_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_comment_notification`
--
ALTER TABLE `tbl_comment_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `master_id` (`master_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `tbl_featured_sections`
--
ALTER TABLE `tbl_featured_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `tbl_languages`
--
ALTER TABLE `tbl_languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `tbl_live_streaming`
--
ALTER TABLE `tbl_live_streaming`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `tbl_location`
--
ALTER TABLE `tbl_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `subcategory_id` (`subcategory_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `slug` (`slug`),
  ADD KEY `published_date` (`published_date`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_news_image`
--
ALTER TABLE `tbl_news_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_id` (`news_id`);

--
-- Indexes for table `tbl_news_like`
--
ALTER TABLE `tbl_news_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `news_id` (`news_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_news_view`
--
ALTER TABLE `tbl_news_view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `news_id` (`news_id`);

--
-- Indexes for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `subcategory_id` (`subcategory_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `tbl_pages`
--
ALTER TABLE `tbl_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `tbl_rss`
--
ALTER TABLE `tbl_rss`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `subcategory_id` (`subcategory_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_social_media`
--
ALTER TABLE `tbl_social_media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `slug` (`slug`),
  ADD KEY `row_order` (`row_order`);

--
-- Indexes for table `tbl_survey_option`
--
ALTER TABLE `tbl_survey_option`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `tbl_survey_question`
--
ALTER TABLE `tbl_survey_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`);

--
-- Indexes for table `tbl_survey_result`
--
ALTER TABLE `tbl_survey_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_tag`
--
ALTER TABLE `tbl_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `tbl_token`
--
ALTER TABLE `tbl_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users_category`
--
ALTER TABLE `tbl_users_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_user_roles`
--
ALTER TABLE `tbl_user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_web_seo_pages`
--
ALTER TABLE `tbl_web_seo_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_type` (`page_type`);

--
-- Indexes for table `tbl_web_settings`
--
ALTER TABLE `tbl_web_settings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_ad_spaces`
--
ALTER TABLE `tbl_ad_spaces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_ai_news_logs`
--
ALTER TABLE `tbl_ai_news_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_ai_news_settings`
--
ALTER TABLE `tbl_ai_news_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_bookmark`
--
ALTER TABLE `tbl_bookmark`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_breaking_news`
--
ALTER TABLE `tbl_breaking_news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_breaking_news_view`
--
ALTER TABLE `tbl_breaking_news_view`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_comment_flag`
--
ALTER TABLE `tbl_comment_flag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_comment_like`
--
ALTER TABLE `tbl_comment_like`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_comment_notification`
--
ALTER TABLE `tbl_comment_notification`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_featured_sections`
--
ALTER TABLE `tbl_featured_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_languages`
--
ALTER TABLE `tbl_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_live_streaming`
--
ALTER TABLE `tbl_live_streaming`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_location`
--
ALTER TABLE `tbl_location`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_news`
--
ALTER TABLE `tbl_news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_news_image`
--
ALTER TABLE `tbl_news_image`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_news_like`
--
ALTER TABLE `tbl_news_like`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_news_view`
--
ALTER TABLE `tbl_news_view`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_pages`
--
ALTER TABLE `tbl_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_rss`
--
ALTER TABLE `tbl_rss`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `tbl_social_media`
--
ALTER TABLE `tbl_social_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_survey_option`
--
ALTER TABLE `tbl_survey_option`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_survey_question`
--
ALTER TABLE `tbl_survey_question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_survey_result`
--
ALTER TABLE `tbl_survey_result`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_tag`
--
ALTER TABLE `tbl_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_token`
--
ALTER TABLE `tbl_token`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_users_category`
--
ALTER TABLE `tbl_users_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user_roles`
--
ALTER TABLE `tbl_user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_web_seo_pages`
--
ALTER TABLE `tbl_web_seo_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_web_settings`
--
ALTER TABLE `tbl_web_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

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
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
