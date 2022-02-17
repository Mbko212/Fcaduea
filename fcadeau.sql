-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 17, 2022 at 04:14 PM
-- Server version: 5.7.37
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fcadeau`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_role_id` bigint(20) NOT NULL DEFAULT '2',
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `admin_role_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'fcadeo Admin', NULL, 1, '2022-01-03-61d3008753078.png', 'admin@gmail.com', NULL, '$2y$10$9OsUdaR6UyxVtZz6Ln9Zo.7vDp.zgQRYcmtqu9OFVX47qi5XgPENi', 'DCczxiFjBhpOd8P5WdKksToEbOGimWrRkCOtujwvBzKkLfGA8lvmQU4R2gzN', '2021-09-07 22:19:37', '2022-01-03 19:56:23'),
(2, 'shob', '03453368866', 7, '2021-09-07-61377b8a5c5d3.png', 'shob@sharklasers.com', NULL, '$2y$10$A.hmXiFcFcklTiM0TLlh7OCCx3Aj9vRagr3kMG6xy9JrNR0shzhN.', NULL, '2021-09-08 00:47:38', '2021-09-08 00:57:47'),
(3, 'William', '123456789', 7, '2021-09-09-613a3ffb4624b.png', 'william@rchive.com', NULL, '$2y$10$YvkbF57T.nNMEz.F/Ok/0eHcXnIoZKmLJ2t.klCOiwB0wHUtzaOD.', 'KSSmGLZ18YWoPPPNuVuXkSveceUPlNtH8nlYpgakD4bvMrl5CpynYOjz222B', '2021-09-10 03:10:19', '2021-09-10 03:10:19');

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_access` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL),
(7, 'Sub Admin', '[\"order\",\"product\",\"marketing\",\"business_section\",\"user_section\",\"support_section\",\"business_settings\",\"web_&_app_settings\",\"blog_management\"]', 1, '2021-09-08 00:46:28', '2021-10-25 19:12:27');

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `balance` double NOT NULL DEFAULT '0',
  `withdrawn` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `balance`, `withdrawn`, `created_at`, `updated_at`) VALUES
(1, 1, 804.8, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet_histories`
--

CREATE TABLE `admin_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallet_histories`
--

INSERT INTO `admin_wallet_histories` (`id`, `admin_id`, `amount`, `order_id`, `product_id`, `payment`, `created_at`, `updated_at`) VALUES
(1, 1, 310, 100001, 86, 'received', '2021-11-22 21:53:29', '2021-11-22 21:53:29'),
(2, 1, 140, 100019, 102, 'received', '2022-01-28 22:12:43', '2022-01-28 22:12:43'),
(3, 1, 140, 100019, 102, 'received', '2022-01-28 22:13:10', '2022-01-28 22:13:10');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Size', '2021-09-14 02:45:01', '2021-09-14 02:45:01'),
(2, 'Tagline', '2021-09-14 19:52:06', '2021-09-14 19:52:06'),
(3, 'Condition', '2021-09-14 19:52:25', '2021-09-14 19:52:25');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `sub_title`, `description`, `photo`, `banner_type`, `published`, `created_at`, `updated_at`, `url`) VALUES
(1, 'NEWEST COLLECTION', 'NEWEST COLLECTION', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '2022-01-28-61f4007f59250.png', 'Main Banner', 1, '2021-09-25 03:40:21', '2022-01-28 20:41:03', 'https://developer-ourbase-camp.com/fcadeau/shop'),
(2, 'Best Products for Gifts', 'Best Products for Gifts', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '2022-01-28-61f40022d428e.png', 'Main Banner', 1, '2021-09-25 03:40:53', '2022-01-28 20:39:30', 'https://developer-ourbase-camp.com/fcadeau/shop'),
(3, 'Demo Banner 1', 'Banner Sub Title', 'This is the demo description For Banner', '2022-01-28-61f400096d0eb.png', 'Main Banner', 1, '2022-01-05 02:47:20', '2022-01-28 20:47:56', 'https://developer-ourbase-camp.com/fcadeau/shop'),
(4, 'mazen', 'fgjkgjkj', 'glyb lgyghghiljijlbn  uhbibnl', '2022-01-30-61f65b3ee1674.png', 'Main Banner', 1, '2022-01-30 15:32:46', '2022-01-30 15:33:15', 'https://developer-ourbase-camp.com/fcadeau/');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_category_id` bigint(20) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `blog_category_id`, `title`, `slug`, `content`, `image`, `published`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam nec mollis tellus, ac blandit orci. Phasellus interdum nec est ac suscipit. Fusce porta nibh in sem pulvinar sodales. Cras vel euismod odio. In suscipit nisl magna, quis cursus neque pretium eu. Ut mollis efficitur enim eget suscipit. Nulla vulputate, metus porta placerat ullamcorper, ipsum nunc tempor nisi, ac mattis metus dui a mauris. Sed sollicitudin neque id dui commodo ultrices.</p>\r\n\r\n<p>Vestibulum ullamcorper non urna fringilla porta. Nam elit ex, feugiat sed lorem ut, pretium gravida elit. Praesent sed tristique urna. In quis laoreet eros. In vitae magna pellentesque, faucibus nibh eget, efficitur tortor. Ut eget ligula in ex vestibulum laoreet. Nam gravida molestie commodo. Pellentesque convallis accumsan lorem. In ac fermentum erat, ac rhoncus lectus. Nulla in pellentesque ipsum. Aenean tincidunt, ex sit amet porttitor pellentesque, neque nulla vestibulum justo, at vestibulum est orci a ex. Ut ac lectus sit amet diam dapibus volutpat. Etiam hendrerit risus eget venenatis dignissim. Nulla eu faucibus nibh. Etiam quis dolor egestas, molestie ante quis, vulputate sapien.</p>', '2021-09-24-614dfa9645868.png', 1, NULL, '2021-09-25 02:19:34', '2021-09-25 02:20:50'),
(2, 1, 'Nam accumsan volutpat congue', 'nam-accumsan-volutpat-congue', '<p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque pulvinar laoreet vehicula. Phasellus vitae ligula ligula. Donec pharetra libero quis euismod varius. Nam accumsan volutpat congue. Nunc sed pulvinar ligula. Vestibulum condimentum ex augue, ut rhoncus est commodo vestibulum. Nulla sit amet varius erat. Donec nunc tortor, porta sed rutrum nec, condimentum in quam. Vivamus non enim et lacus convallis dignissim eget ut elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi hendrerit fringilla nibh, sed auctor justo venenatis viverra. Aenean euismod, magna vitae vestibulum imperdiet, urna ligula tempus diam, ac auctor lectus lacus sed nunc.</p>\r\n\r\n<p>Aliquam congue egestas lacus, non vulputate ligula malesuada ac. Duis pulvinar non massa ultrices porta. Suspendisse potenti. Suspendisse a risus eget leo cursus maximus. Praesent vitae magna a lorem feugiat suscipit. Vivamus ac nisi ex. Aenean vulputate condimentum tortor.</p>', '2021-09-24-614dfaacec9d9.png', 1, NULL, '2021-09-25 02:19:56', '2021-09-25 02:20:49');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Fashion', 'fashion', NULL, '2021-09-25 02:16:20', '2021-09-25 02:16:20'),
(2, 'Life', 'life', NULL, '2021-09-25 02:18:48', '2021-09-25 02:18:48'),
(3, 'Style', 'style', NULL, '2021-09-25 02:18:52', '2021-09-25 02:18:52'),
(4, 'test test test', 'test-test-test', NULL, '2022-01-05 01:21:34', '2022-01-05 01:21:34');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'def.png',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, '032c Workshop', '032c-workshop', NULL, 1, '2021-10-06 19:02:40', '2021-10-06 19:02:40'),
(2, '1017 ALYX 9sm', '1017-alyx-9sm', NULL, 1, '2021-10-06 19:02:46', '2021-10-06 19:02:46'),
(3, '11 by Boris Bidjan Saberi', '11-by-boris-bidjan-saberi', NULL, 1, '2021-10-06 19:02:50', '2021-10-06 19:02:50'),
(4, '3.1 Phillip Lim', '31-phillip-lim', NULL, 1, '2021-10-06 19:02:53', '2021-10-06 19:02:53'),
(5, '3x1', '3x1', NULL, 1, '2021-10-06 19:02:56', '2021-10-06 19:02:56');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '1', '2020-10-11 16:43:44', '2021-06-05 03:25:29'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"english\",\"code\":\"en\",\"status\":1},{\"id\":4,\"name\":\"Hindi\",\"code\":\"hn\",\"status\":0}]', '2020-10-11 16:53:02', '2021-09-07 22:34:42'),
(3, 'mail_config', '{\"name\":\"Rechive\",\"host\":\"smtp.mailtrap.io\",\"driver\":\"smtp\",\"port\":\"2525\",\"username\":\"55b7452773998a\",\"email_id\":\"info@rchive.pk\",\"encryption\":\"tls\",\"password\":\"6e6999eeaac74f\"}', '2020-10-12 19:29:18', '2021-09-09 22:17:24'),
(4, 'cash_on_delivery', '{\"status\":\"1\"}', NULL, '2021-05-26 06:21:15'),
(6, 'ssl_commerz_payment', '{\"status\":\"0\",\"store_id\":null,\"store_password\":null}', '2020-11-09 18:36:51', '2021-07-06 21:29:46'),
(7, 'paypal', '{\"status\":\"0\",\"paypal_client_id\":null,\"paypal_secret\":null}', '2020-11-09 18:51:39', '2021-07-06 21:29:57'),
(8, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2020-11-09 19:01:47', '2021-07-06 21:30:05'),
(9, 'paytm', '{\"status\":\"0\",\"paytm_merchant_id\":\"dbzfb\",\"paytm_merchant_key\":\"sdfbsdfb\",\"paytm_merchant_website\":\"dsfbsdf\",\"paytm_channel\":\"sdfbsdf\",\"paytm_industry_type\":\"sdfb\"}', '2020-11-09 19:19:08', '2020-11-09 19:19:56'),
(10, 'company_phone', '+88017 33 66 88 44', NULL, '2020-12-09 00:15:01'),
(11, 'company_name', 'Fcadean', NULL, '2022-01-03 19:57:31'),
(12, 'company_web_logo', '2022-01-03-61d300dd5b70b.png', NULL, '2022-01-03 19:57:49'),
(13, 'company_mobile_logo', '2021-02-20-6030c88c91911.png', NULL, '2021-02-21 00:30:04'),
(14, 'terms_condition', '<p>eeverferfervtsS</p>', NULL, '2021-06-11 10:51:36'),
(15, 'about_us', '<p>this is about us page. hello and hi from about page description..</p>', NULL, '2021-06-11 10:42:53'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'info@fcadean.com', NULL, '2022-01-05 02:57:58'),
(18, 'colors', '{\"primary\":\"#86b672\",\"secondary\":\"#061fe0\"}', '2020-10-11 22:53:02', '2021-05-26 06:43:11'),
(19, 'company_footer_logo', '2021-02-20-6030c8a02a5f9.png', NULL, '2021-02-21 00:30:24'),
(20, 'company_copyright_text', '2022', NULL, '2022-01-19 19:58:50'),
(21, 'download_app_apple_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/www.target.com\\/s\\/apple+store++now?ref=tgt_adv_XS000000&AFID=msn&fndsrc=tgtao&DFA=71700000012505188&CPNG=Electronics_Portable+Computers&adgroup=Portable+Computers&LID=700000001176246&LNM=apple+store+near+me+now&MT=b&network=s&device=c&location=12&targetid=kwd-81913773633608:loc-12&ds_rl=1246978&ds_rl=1248099&gclsrc=ds\"}', NULL, '2021-09-10 01:59:53'),
(22, 'download_app_google_stroe', '{\"status\":\"0\",\"link\":\"https:\\/\\/play.google.com\\/store?hl=en_US&gl=US\"}', NULL, '2021-09-10 01:59:48'),
(23, 'company_fav_icon', '2021-03-02-603df1634614f.png', '2020-10-11 22:53:02', '2021-03-03 00:03:48'),
(24, 'fcm_topic', '', NULL, NULL),
(25, 'fcm_project_id', '', NULL, NULL),
(26, 'push_notification_key', 'Put your firebase server key here.', NULL, NULL),
(27, 'order_pending_message', '{\"status\":\"1\",\"message\":\"order pen message\"}', NULL, NULL),
(28, 'order_confirmation_msg', '{\"status\":\"1\",\"message\":\"Order con Message\"}', NULL, NULL),
(29, 'order_processing_message', '{\"status\":\"1\",\"message\":\"Order pro Message\"}', NULL, NULL),
(30, 'out_for_delivery_message', '{\"status\":\"1\",\"message\":\"Order ouut Message\"}', NULL, NULL),
(31, 'order_delivered_message', '{\"status\":\"1\",\"message\":\"Order del Message\"}', NULL, NULL),
(32, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', NULL, '2021-07-06 21:30:14'),
(33, 'sales_commission', '0', NULL, '2021-06-12 03:13:13'),
(34, 'seller_registration', '0', NULL, '2021-09-07 22:36:15'),
(35, 'pnc_language', '[\"en\",\"af\"]', NULL, NULL),
(36, 'order_returned_message', '{\"status\":\"1\",\"message\":\"Order hh Message\"}', NULL, NULL),
(37, 'order_failed_message', '{\"status\":null,\"message\":\"Order fa Message\"}', NULL, NULL),
(40, 'delivery_boy_assign_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(41, 'delivery_boy_start_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(42, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(43, 'terms_and_conditions', '<h3>OVERVIEW</h3>\r\n\r\n<p>This website is operated by RCHIVE. Throughout the site, the terms &ldquo;we&rdquo;, &ldquo;us&rdquo; and &ldquo;our&rdquo; refer to RCHIVE. RCHIVE offers this website, including all information, tools and services available from this site to you, the user, conditioned upon your acceptance of all terms, conditions, policies and notices stated here.</p>\r\n\r\n<p>By visiting our site and/ or purchasing something from us, you engage in our &ldquo;Service&rdquo; and agree to be bound by the following terms and conditions (&ldquo;Terms of Service&rdquo;, &ldquo;Terms&rdquo;), including those additional terms and conditions and policies referenced herein and/or available by hyperlink. These Terms of Service apply to all users of the site, including without limitation users who are browsers, vendors, customers, merchants, and/ or contributors of content.</p>\r\n\r\n<p>Please read these Terms of Service carefully before accessing or using our website. By accessing or using any part of the site, you agree to be bound by these Terms of Service. If you do not agree to all the terms and conditions of this agreement, then you may not access the website or use any services. If these Terms of Service are considered an offer, acceptance is expressly limited to these Terms of Service.</p>\r\n\r\n<p>Any new features or tools which are added to the current store shall also be subject to the Terms of Service. You can review the most current version of the Terms of Service at any time on this page. We reserve the right to update, change or replace any part of these Terms of Service by posting updates and/or changes to our website. It is your responsibility to check this page periodically for changes. Your continued use of or access to the website following the posting of any changes constitutes acceptance of those changes.</p>\r\n\r\n<p>Our store is hosted on WordPress. They provide us with an online e-commerce platform that allows us to sell our products and services to you.</p>\r\n\r\n<h3>SECTION 1 &ndash; ONLINE STORE TERMS</h3>\r\n\r\n<p>By agreeing to these Terms of Service, you represent that you are at least the age of majority in your state or province of residence, or that you are the age of majority in your state or province of residence and you have given us your consent to allow any of your minor dependents to use this site.</p>\r\n\r\n<p>You may not use our products for any illegal or unauthorized purpose nor may you, in the use of the Service, violate any laws in your jurisdiction (including but not limited to copyright laws).</p>\r\n\r\n<p>You must not transmit any worms or viruses or any code of a destructive nature.</p>\r\n\r\n<p>A breach or violation of any of the Terms will result in an immediate termination of your Services.</p>\r\n\r\n<h3>SECTION 2 &ndash; GENERAL CONDITIONS</h3>\r\n\r\n<p>We reserve the right to refuse service to anyone for any reason at any time.</p>\r\n\r\n<p>You understand that your content (not including credit card information), may be transferred unencrypted and involve (a) transmissions over various networks; and (b) changes to conform and adapt to technical requirements of connecting networks or devices. Credit card information is always encrypted during transfer over networks.</p>\r\n\r\n<p>You agree not to reproduce, duplicate, copy, sell, resell or exploit any portion of the Service, use of the Service, or access to the Service or any contact on the website through which the service is provided, without express written permission by us.</p>\r\n\r\n<p>The headings used in this agreement are included for convenience only and will not limit or otherwise affect these Terms.</p>\r\n\r\n<h3>SECTION 3 &ndash; ACCURACY, COMPLETENESS AND TIMELINESS OF INFORMATION</h3>\r\n\r\n<p>We are not responsible if information made available on this site is not accurate, complete or current. The material on this site is provided for general information only and should not be relied upon or used as the sole basis for making decisions without consulting primary, more accurate, more complete or more timely sources of information. Any reliance on the material on this site is at your own risk.</p>\r\n\r\n<p>This site may contain certain historical information. Historical information, necessarily, is not current and is provided for your reference only. We reserve the right to modify the contents of this site at any time, but we have no obligation to update any information on our site. You agree that it is your responsibility to monitor changes to our site.</p>\r\n\r\n<h3>SECTION 4 &ndash; MODIFICATIONS TO THE SERVICE AND PRICES</h3>\r\n\r\n<p>Prices for our products are subject to change without notice.</p>\r\n\r\n<p>We reserve the right at any time to modify or discontinue the Service (or any part or content thereof) without notice at any time.</p>\r\n\r\n<p>We shall not be liable to you or to any third-party for any modification, price change, suspension or discontinuance of the Service.</p>\r\n\r\n<h3>SECTION 5 &ndash; PRODUCTS OR SERVICES</h3>\r\n\r\n<p>Certain products or services may be available exclusively online through the website. These products or services may have limited quantities and are subject to exchange only according to our Return Policy.</p>\r\n\r\n<p>We have made every effort to display as accurately as possible the colours and images of our products that appear at the store. We cannot guarantee that your computer monitor&rsquo;s display of any colour will be accurate.</p>\r\n\r\n<p>We reserve the right but are not obligated, to limit the sales of our products or Services to any person, geographic region or jurisdiction. We may exercise this right on a case-by-case basis. We reserve the right to limit the quantities of any products or services that we offer. All descriptions of products or product pricing are subject to change at any time without notice, at the sole discretion of us. We reserve the right to discontinue any product at any time. Any offer for any product or service made on this site is void where prohibited.</p>\r\n\r\n<p>We do not warrant that the quality of any products, services, information, or other material purchased or obtained by you will meet your expectations, or that any errors in the Service will be corrected.</p>\r\n\r\n<h3>SECTION 6 &ndash; ACCURACY OF BILLING AND ACCOUNT INFORMATION</h3>\r\n\r\n<p>We reserve the right to refuse any order you place with us. We may, in our sole discretion, limit or cancel quantities purchased per person, per household or per order. These restrictions may include orders placed by or under the same customer account, the same credit card, and/or orders that use the same billing and/or shipping address. In the event that we make a change to or cancel an order, we may attempt to notify you by contacting the e-mail and/or billing address/phone number provided at the time the order was made. We reserve the right to limit or prohibit orders that, in our sole judgment, appear to be placed by dealers, resellers or distributors.</p>\r\n\r\n<p>You agree to provide current, complete and accurate purchase and account information for all purchases made at our store. You agree to promptly update your account and other information, including your email address and credit card numbers and expiration dates so that we can complete your transactions and contact you as needed.</p>\r\n\r\n<p>For more detail, please review our Returns Policy available online: www.rchive.ca/shipping-exchange</p>\r\n\r\n<h3>SECTION 7 &ndash; OPTIONAL TOOLS</h3>\r\n\r\n<p>We may provide you with access to third-party tools over which we neither monitor nor have any control nor input.</p>\r\n\r\n<p>You acknowledge and agree that we provide access to such tools &rdquo;as is&rdquo; and &ldquo;as available&rdquo; without any warranties, representations or conditions of any kind and without any endorsement. We shall have no liability whatsoever arising from or relating to your use of optional third-party tools.</p>\r\n\r\n<p>Any use by you of optional tools offered through the site is entirely at your own risk and discretion and you should ensure that you are familiar with and approve of the terms on which tools are provided by the relevant third-party provider(s).</p>\r\n\r\n<p>We may also, in the future, offer new services and/or features through the website (including, the release of new tools and resources). Such new features and/or services shall also be subject to these Terms of Service.</p>\r\n\r\n<h3>SECTION 8 &ndash; THIRD-PARTY LINKS</h3>\r\n\r\n<p>Certain content, products and services available via our Service may include materials from third-parties.</p>\r\n\r\n<p>Third-party links on this site may direct you to third-party websites that are not affiliated with us. We are not responsible for examining or evaluating the content or accuracy and we do not warrant and will not have any liability or responsibility for any third-party materials or websites, or for any other materials, products, or services of third-parties.</p>\r\n\r\n<p>We are not liable for any harm or damages related to the purchase or use of goods, services, resources, content, or any other transactions made in connection with any third-party websites. Please review carefully the third-party&rsquo;s policies and practices and make sure you understand them before you engage in any transaction. Complaints, claims, concerns, or questions regarding third-party products should be directed to the third-party.</p>\r\n\r\n<h3>SECTION 9 &ndash; USER COMMENTS, FEEDBACK AND OTHER SUBMISSIONS</h3>\r\n\r\n<p>If at our request, you send certain specific submissions (for example contest entries) or without a request from us you send creative ideas, suggestions, proposals, plans, or other materials, whether online, by email, by postal mail, or otherwise (collectively, &lsquo;comments&rsquo;), you agree that we may, at any time, without restriction, edit, copy, publish, distribute, translate and otherwise use in any medium any comments that you forward to us. We are and shall be under no obligation (1) to maintain any comments in confidence; (2) to pay compensation for any comments; or (3) to respond to any comments.</p>\r\n\r\n<p>We may, but have no obligation to, monitor, edit or remove content that we determine in our sole discretion are unlawful, offensive, threatening, libelous, defamatory, pornographic, obscene or otherwise objectionable or violates any party&rsquo;s intellectual property or these Terms of Service.</p>\r\n\r\n<p>You agree that your comments will not violate any rights of any third-party, including copyright, trademark, privacy, personality or other personal or proprietary rights. You further agree that your comments will not contain libelous or otherwise unlawful, abusive or obscene material, or contain any computer virus or other malware that could in any way affect the operation of the Service or any related website. You may not use a false e-mail address, pretend to be someone other than yourself, or otherwise mislead us or third-parties as to the origin of any comments. You are solely responsible for any comments you make and their accuracy. We take no responsibility and assume no liability for any comments posted by you or any third-party.</p>\r\n\r\n<h3>SECTION 10 &ndash; PERSONAL INFORMATION</h3>\r\n\r\n<p>Your submission of personal information through the store is governed by our Privacy Policy. To view our Privacy Policy: www.rchive.ca/privacy-policy.</p>\r\n\r\n<h3>SECTION 11 &ndash; ERRORS, INACCURACIES AND OMISSIONS</h3>\r\n\r\n<p>Occasionally there may be information on our site or in the Service that contains typographical errors, inaccuracies or omissions that may relate to product descriptions, pricing, promotions, offers, product shipping charges, transit times and availability. We reserve the right to correct any errors, inaccuracies or omissions, and to change or update information or cancel orders if any information in the Service or on any related website is inaccurate at any time without prior notice (including after you have submitted your order).</p>\r\n\r\n<p>We undertake no obligation to update, amend or clarify information in the Service or on any related website, including without limitation, pricing information, except as required by law. No specified update or refresh date applied in the Service or on any related website should be taken to indicate that all information in the Service or on any related website has been modified or updated.</p>\r\n\r\n<h3>SECTION 12 &ndash; PROHIBITED USES</h3>\r\n\r\n<p>In addition to other prohibitions as set forth in the Terms of Service, you are prohibited from using the site or its content: (a) for any unlawful purpose; (b) to solicit others to perform or participate in any unlawful acts; (c) to violate any international, federal, provincial or state regulations, rules, laws, or local ordinances; (d) to infringe upon or violate our intellectual property rights or the intellectual property rights of others; (e) to harass, abuse, insult, harm, defame, slander, disparage, intimidate, or discriminate based on gender, sexual orientation, religion, ethnicity, race, age, national origin, or disability; (f) to submit false or misleading information; (g) to upload or transmit viruses or any other type of malicious code that will or may be used in any way that will affect the functionality or operation of the Service or of any related website, other websites, or the Internet; (h) to collect or track the personal information of others; (i) to spam, phish, pharm, pretext, spider, crawl, or scrape; (j) for any obscene or immoral purpose; or (k) to interfere with or circumvent the security features of the Service or any related website, other websites, or the Internet.</p>\r\n\r\n<p>We reserve the right to terminate your use of the Service or any related website for violating any of the prohibited uses.</p>\r\n\r\n<h3>SECTION 13 &ndash; DISCLAIMER OF WARRANTIES; LIMITATION OF LIABILITY</h3>\r\n\r\n<p>We do not guarantee, represent or warrant that your use of our service will be uninterrupted, timely, secure or error-free.</p>\r\n\r\n<p>We do not warrant that the results that may be obtained from the use of the service will be accurate or reliable.</p>\r\n\r\n<p>You agree that from time to time we may remove the service for indefinite periods of time or cancel the service at any time, without notice to you.</p>\r\n\r\n<p>You expressly agree that your use of, or inability to use, the service is at your sole risk. The service and all products and services delivered to you through the service are (except as expressly stated by us) provided &lsquo;as is&rsquo; and &lsquo;as available&rsquo; for your use, without any representation, warranties or conditions of any kind, either express or implied, including all implied warranties or conditions of merchantability, merchantable quality, fitness for a particular purpose, durability, title, and non-infringement.</p>\r\n\r\n<p>In no case shall RCHIVE, our directors, officers, employees, affiliates, agents, contractors, interns, suppliers, service providers or licensors be liable for any injury, loss, claim, or any direct, indirect, incidental, punitive, special, or consequential damages of any kind, including, without limitation lost profits, lost revenue, lost savings, loss of data, replacement costs, or any similar damages, whether based in contract, tort (including negligence), strict liability or otherwise, arising from your use of any of the service or any products procured using the service, or for any other claim related in any way to your use of the service or any product, including, but not limited to, any errors or omissions in any content, or any loss or damage of any kind incurred as a result of the use of the service or any content (or product) posted, transmitted, or otherwise made available via the service, even if advised of their possibility. Because some states or jurisdictions do not allow the exclusion or the limitation of liability for consequential or incidental damages, in such states or jurisdictions, our liability shall be limited to the maximum extent permitted by law.</p>\r\n\r\n<h3>SECTION 14 &ndash; INDEMNIFICATION</h3>\r\n\r\n<p>You agree to indemnify, defend and hold harmless RCHIVE and our parent, subsidiaries, affiliates, partners, officers, directors, agents, contractors, licensors, service providers, subcontractors, suppliers, interns and employees, harmless from any claim or demand, including reasonable attorneys&rsquo; fees, made by any third party due to or arising out of your breach of these Terms of Service or the documents they incorporate by reference or your violation of any law or the rights of a third-party.</p>\r\n\r\n<h3>SECTION 15 &ndash; SEVERABILITY</h3>\r\n\r\n<p>In the event that any provision of these Terms of Service is determined to be unlawful, void or unenforceable, such provision shall nonetheless be enforceable to the fullest extent permitted by applicable law, and the unenforceable portion shall be deemed to be severed from these Terms of Service, such determination shall not affect the validity and enforceability of any other remaining provisions.</p>\r\n\r\n<h3>SECTION 16 &ndash; TERMINATION</h3>\r\n\r\n<p>The obligations and liabilities of the parties incurred prior to the termination date shall survive the termination of this agreement for all purposes.</p>\r\n\r\n<p>These Terms of Service are effective unless and until terminated by either you or us. You may terminate these Terms of Service at any time by notifying us that you no longer wish to use our Services, or when you cease using our site.</p>\r\n\r\n<p>If in our sole judgment you fail, or we suspect that you have failed, to comply with any term or provision of these Terms of Service, we also may terminate this agreement at any time without notice and you will remain liable for all amounts due up to and including the date of termination; and/or accordingly may deny you access to our Services (or any part thereof).</p>\r\n\r\n<h3>SECTION 17 &ndash; ENTIRE AGREEMENT</h3>\r\n\r\n<p>The failure of us to exercise or enforce any right or provision of these Terms of Service shall not constitute a waiver of such right or provision.</p>\r\n\r\n<p>These Terms of Service and any policies or operating rules posted by us on this site or in respect to The Service constitutes the entire agreement and understanding between you and us and govern your use of the Service, superseding any prior or contemporaneous agreements, communications and proposals, whether oral or written, between you and us (including, but not limited to, any prior versions of the Terms of Service).</p>\r\n\r\n<p>Any ambiguities in the interpretation of these Terms of Service shall not be construed against the drafting party.</p>\r\n\r\n<h3>SECTION 18 &ndash; GOVERNING LAW</h3>\r\n\r\n<p>These Terms of Service and any separate agreements whereby we provide you Services shall be governed by and construed in accordance with the laws of the province of Ontario, Canada and applicable federal laws of Canada, excluding any rules of private international law or the conflict of laws that would lead to the application of the laws of any other jurisdiction and excluding any law that implements the United Nations Convention on Contracts for the International Sale of Goods</p>\r\n\r\n<h3>SECTION 19 &ndash; CHANGES TO TERMS OF SERVICE</h3>\r\n\r\n<p>You can review the most current version of the Terms of Service at any time at this page.</p>\r\n\r\n<p>We reserve the right, at our sole discretion, to update, change or replace any part of these Terms of Service by posting updates and changes to our website. It is your responsibility to check our website periodically for changes. Your continued use of or access to our website or the Service following the posting of any changes to these Terms of Service constitutes acceptance of those changes.</p>\r\n\r\n<h3>SECTION 20 &ndash; CONTACT INFORMATION</h3>\r\n\r\n<p>Questions about the Terms of Service should be sent to us at info@rchive.ca</p>', NULL, '2022-01-20 21:49:15'),
(44, 'minimum_order_value', '1', NULL, NULL),
(45, 'privacy_policy', '<h3><strong>This Privacy Policy describes how your personal<br />\r\ninformation is collected, used, and shared when you<br />\r\nvisit or make a purchase from rchive.ca (the &ldquo;Site&rdquo;).</strong></h3>\r\n\r\n<h3>PERSONAL INFORMATION WE COLLECT</h3>\r\n\r\n<p>When you visit the Site, we automatically collect certain information about your device, including information about your web browser, IP address, time zone, and some of the cookies that are installed on your device. Additionally, as you browse the Site, we collect information about the individual web pages or products that you view, what websites or search terms referred you to the Site and information about how you interact with the Site. We refer to this automatically-collected information as &ldquo;Device Information.&rdquo;</p>\r\n\r\n<p>We collect Device Information using the following technologies:</p>\r\n\r\n<p>&ldquo;Cookies&rdquo; are data files that are placed on your device or computer and often include an anonymous unique identifier. For more information about cookies, and how to disable cookies, visit http://www.allaboutcookies.org.</p>\r\n\r\n<p>Additionally, when you make a purchase or attempt to make a purchase through the Site, we collect certain information from you, including your name, billing address, shipping address, payment information, email address, and phone number. We refer to this information as &ldquo;Order Information.&rdquo;</p>\r\n\r\n<p>When we talk about &ldquo;Personal Information&rdquo; in this Privacy Policy, we are talking both about Device Information and Order Information.</p>\r\n\r\n<h3>HOW DO WE USE YOUR PERSONAL INFORMATION?</h3>\r\n\r\n<p>We use the Order Information that we collect generally to fulfill any orders placed through the Site (including processing your payment information, arranging for shipping, and providing you with invoices and/or order confirmations). Additionally, we use this Order Information to:</p>\r\n\r\n<p>Communicate with you;</p>\r\n\r\n<p>Screen our orders for potential risk or fraud; and</p>\r\n\r\n<p>When in line with the preferences you have shared with us, provide you with information or advertising relating to our products or services.</p>\r\n\r\n<p>We use the Device Information that we collect to help us screen for potential risk and fraud (in particular, your IP address), and more generally to improve and optimize our Site (for example, by generating analytics about how our customers browse and interact with the Site, and to assess the success of our marketing and advertising campaigns).</p>\r\n\r\n<h3>SHARING YOUR PERSONAL INFORMATION</h3>\r\n\r\n<p>We share your Personal Information with third parties to help us use your Personal Information, as described above. For example, we use WordPress to power our online store&ndash;you can read more about how WordPress uses your Personal Information here: https://automattic.com/privacy/ We also use Google Analytics to help us understand how our customers use the Site&ndash;you can read more about how Google uses your Personal Information here: https://www.google.com/intl/en/policies/privacy/. You can also opt-out of Google Analytics here: https://tools.google.com/dlpage/gaoptout.</p>\r\n\r\n<p>Finally, we may also share your Personal Information to comply with applicable laws and regulations, to respond to a subpoena, search warrant or other lawful requests for information we receive, or to otherwise protect our rights.</p>\r\n\r\n<h3>DO NOT TRACK</h3>\r\n\r\n<p>Please note that we do not alter our Site&rsquo;s data collection and use practices when we see a Do Not Track signal from your browser.</p>\r\n\r\n<h3>YOUR RIGHTS</h3>\r\n\r\n<p>If you are a European resident, you have the right to access personal information we hold about you and to ask that your personal information be corrected, updated, or deleted. If you would like to exercise this right, please contact us through the contact information below.</p>\r\n\r\n<p>Additionally, if you are a European resident we note that we are processing your information in order to fulfill contracts we might have with you (for example if you make an order through the Site), or otherwise to pursue our legitimate business interests listed above. Additionally, please note that your information will be transferred outside of Europe, including to Canada and the United States.</p>\r\n\r\n<h3>DATA RETENTION &amp; CHANGES</h3>\r\n\r\n<p>When you place an order through the Site, we will maintain your Order Information for our records unless and until you ask us to delete this information. We may update this privacy policy from time to time in order to reflect, for example, changes to our practices or for other operational, legal or regulatory reasons.</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2022-01-05 03:02:18'),
(46, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}', NULL, '2021-07-06 21:30:35'),
(47, 'senang_pay', '{\"status\":\"0\",\"secret_key\":null,\"merchant_id\":null}', NULL, '2021-07-06 21:30:23'),
(48, 'maintenance_mode', '0', '2021-09-08 01:47:56', '2022-01-30 15:26:36'),
(49, 'pull_policy', '<h3>PERSONAL INFORMATION WE COLLECT</h3>\r\n\r\n<p>When you visit the Site, we automatically collect certain information about your device, including information about your web browser, IP address, time zone, and some of the cookies that are installed on your device. Additionally, as you browse the Site, we collect information about the individual web pages or products that you view, what websites or search terms referred you to the Site and information about how you interact with the Site. We refer to this automatically-collected information as &ldquo;Device Information.&rdquo;</p>\r\n\r\n<p>We collect Device Information using the following technologies:</p>\r\n\r\n<p>&ldquo;Cookies&rdquo; are data files that are placed on your device or computer and often include an anonymous unique identifier. For more information about cookies, and how to disable cookies, visit http://www.allaboutcookies.org.</p>\r\n\r\n<p>Additionally, when you make a purchase or attempt to make a purchase through the Site, we collect certain information from you, including your name, billing address, shipping address, payment information, email address, and phone number. We refer to this information as &ldquo;Order Information.&rdquo;</p>\r\n\r\n<p>When we talk about &ldquo;Personal Information&rdquo; in this Privacy Policy, we are talking both about Device Information and Order Information.</p>\r\n\r\n<h3>HOW DO WE USE YOUR PERSONAL INFORMATION?</h3>\r\n\r\n<p>We use the Order Information that we collect generally to fulfill any orders placed through the Site (including processing your payment information, arranging for shipping, and providing you with invoices and/or order confirmations). Additionally, we use this Order Information to:</p>\r\n\r\n<p>Communicate with you;</p>\r\n\r\n<p>Screen our orders for potential risk or fraud; and</p>\r\n\r\n<p>When in line with the preferences you have shared with us, provide you with information or advertising relating to our products or services.</p>\r\n\r\n<p>We use the Device Information that we collect to help us screen for potential risk and fraud (in particular, your IP address), and more generally to improve and optimize our Site (for example, by generating analytics about how our customers browse and interact with the Site, and to assess the success of our marketing and advertising campaigns).</p>\r\n\r\n<h3>SHARING YOUR PERSONAL INFORMATION</h3>\r\n\r\n<p>We share your Personal Information with third parties to help us use your Personal Information, as described above. For example, we use WordPress to power our online store&ndash;you can read more about how WordPress uses your Personal Information here: https://automattic.com/privacy/ We also use Google Analytics to help us understand how our customers use the Site&ndash;you can read more about how Google uses your Personal Information here: https://www.google.com/intl/en/policies/privacy/. You can also opt-out of Google Analytics here: https://tools.google.com/dlpage/gaoptout.</p>\r\n\r\n<p>Finally, we may also share your Personal Information to comply with applicable laws and regulations, to respond to a subpoena, search warrant or other lawful requests for information we receive, or to otherwise protect our rights.</p>\r\n\r\n<h3>DATA RETENTION &amp; CHANGES</h3>\r\n\r\n<p>When you place an order through the Site, we will maintain your Order Information for our records unless and until you ask us to delete this information. We may update this privacy policy from time to time in order to reflect, for example, changes to our practices or for other operational, legal or regulatory reasons.</p>', NULL, NULL),
(50, 'pull', '<h3>PERSONAL INFORMATION WE COLLECT</h3>\r\n\r\n<p>When you visit the Site, we automatically collect certain information about your device, including information about your web browser, IP address, time zone, and some of the cookies that are installed on your device. Additionally, as you browse the Site, we collect information about the individual web pages or products that you view, what websites or search terms referred you to the Site and information about how you interact with the Site. We refer to this automatically-collected information as &ldquo;Device Information.&rdquo;</p>\r\n\r\n<p>We collect Device Information using the following technologies:</p>\r\n\r\n<p>&ldquo;Cookies&rdquo; are data files that are placed on your device or computer and often include an anonymous unique identifier. For more information about cookies, and how to disable cookies, visit http://www.allaboutcookies.org.</p>\r\n\r\n<p>Additionally, when you make a purchase or attempt to make a purchase through the Site, we collect certain information from you, including your name, billing address, shipping address, payment information, email address, and phone number. We refer to this information as &ldquo;Order Information.&rdquo;</p>\r\n\r\n<p>When we talk about &ldquo;Personal Information&rdquo; in this Privacy Policy, we are talking both about Device Information and Order Information.</p>\r\n\r\n<h3>HOW DO WE USE YOUR PERSONAL INFORMATION?</h3>\r\n\r\n<p>We use the Order Information that we collect generally to fulfill any orders placed through the Site (including processing your payment information, arranging for shipping, and providing you with invoices and/or order confirmations). Additionally, we use this Order Information to:</p>\r\n\r\n<p>Communicate with you;</p>\r\n\r\n<p>Screen our orders for potential risk or fraud; and</p>\r\n\r\n<p>When in line with the preferences you have shared with us, provide you with information or advertising relating to our products or services.</p>\r\n\r\n<p>We use the Device Information that we collect to help us screen for potential risk and fraud (in particular, your IP address), and more generally to improve and optimize our Site (for example, by generating analytics about how our customers browse and interact with the Site, and to assess the success of our marketing and advertising campaigns).</p>\r\n\r\n<h3>SHARING YOUR PERSONAL INFORMATION</h3>\r\n\r\n<p>We share your Personal Information with third parties to help us use your Personal Information, as described above. For example, we use WordPress to power our online store&ndash;you can read more about how WordPress uses your Personal Information here: https://automattic.com/privacy/ We also use Google Analytics to help us understand how our customers use the Site&ndash;you can read more about how Google uses your Personal Information here: https://www.google.com/intl/en/policies/privacy/. You can also opt-out of Google Analytics here: https://tools.google.com/dlpage/gaoptout.</p>\r\n\r\n<p>Finally, we may also share your Personal Information to comply with applicable laws and regulations, to respond to a subpoena, search warrant or other lawful requests for information we receive, or to otherwise protect our rights.</p>\r\n\r\n<h3>DATA RETENTION &amp; CHANGES</h3>\r\n\r\n<p>When you place an order through the Site, we will maintain your Order Information for our records unless and until you ask us to delete this information. We may update this privacy policy from time to time in order to reflect, for example, changes to our practices or for other operational, legal or regulatory reasons.</p>', NULL, NULL),
(51, 'currency_symbol_position', 'left', '2022-01-05 02:56:26', '2022-01-30 15:26:16');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `created_at`, `updated_at`, `home_status`) VALUES
(28, 'Souvenir', 'souvenir', NULL, 0, 0, '2021-12-17 14:14:16', '2021-12-17 14:14:21', 1),
(32, 'Chocolates', 'chocolates', '2022-01-30-61f6569d1f067.png', 0, 1, '2021-12-17 14:15:14', '2022-01-30 15:13:01', 1),
(34, 'Baby Shower', 'baby-shower', '2021-12-17-61bc8e1a74b40.png', 28, 1, '2021-12-17 14:18:18', '2021-12-17 14:18:18', 0),
(35, 'Bridal Shower', 'bridal-shower', '2021-12-17-61bc8e258aae1.png', 28, 1, '2021-12-17 14:18:29', '2021-12-17 14:18:29', 0),
(36, 'Henna Night', 'henna-night', '2021-12-17-61bc8e358c1f3.png', 28, 1, '2021-12-17 14:18:45', '2021-12-17 14:18:45', 0),
(37, 'Wedding', 'wedding', '2021-12-17-61bc8e437b13a.png', 28, 1, '2021-12-17 14:18:59', '2021-12-17 14:18:59', 0),
(38, 'Graduation', 'graduation', '2021-12-17-61bc8ecb61921.png', 28, 1, '2021-12-17 14:21:15', '2021-12-17 14:21:15', 0),
(44, 'Kitkat', 'kitkat', '2021-12-17-61bc8f4194a1a.png', 32, 1, '2021-12-17 14:23:13', '2021-12-17 14:23:13', 0),
(47, 'mazen', 'mazen', '2022-01-30-61f657479ef98.png', 0, 0, '2022-01-30 15:15:51', '2022-01-30 15:15:56', 1),
(52, 'Mabkhara', 'mabkhara', '2022-02-09-6203907393366.png', 0, 0, '2022-02-09 15:59:15', '2022-02-17 22:14:25', 1),
(53, 'Concrete', 'concrete', '2022-02-09-620390b24e8ef.png', 52, 1, '2022-02-09 16:00:18', '2022-02-09 16:00:18', 0),
(54, 'Stone', 'stone', '2022-02-09-620390d3ccdd3.png', 52, 1, '2022-02-09 16:00:51', '2022-02-09 16:00:51', 0),
(55, 'Leather', 'leather', '2022-02-09-620390f8b07af.png', 52, 1, '2022-02-09 16:01:28', '2022-02-09 16:01:28', 0),
(56, 'Pillow', 'pillow', '2022-02-09-6203912de4408.png', 0, 0, '2022-02-09 16:02:21', '2022-02-17 12:13:30', 1),
(57, 'Orchid', 'orchid', '2022-02-09-6203915b3c995.png', 56, 1, '2022-02-09 16:03:07', '2022-02-09 16:03:07', 0);

-- --------------------------------------------------------

--
-- Table structure for table `chattings`
--

CREATE TABLE `chattings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_by_customer` tinyint(1) NOT NULL DEFAULT '0',
  `sent_by_seller` tinyint(1) NOT NULL DEFAULT '0',
  `seen_by_customer` tinyint(1) NOT NULL DEFAULT '1',
  `seen_by_seller` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 12:12:26', '2018-11-05 12:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(47, 'Purple', '#800080', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 12:12:27', '2018-11-05 12:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(64, 'Green', '#008000', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(68, 'Olive', '#808000', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(74, 'Teal', '#008080', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(76, 'Cyan', '#00FFFF', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(98, 'Navy', '#000080', '2018-11-05 12:12:28', '2018-11-05 12:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 12:12:29', '2018-11-05 12:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 12:12:30', '2018-11-05 12:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 12:12:30', '2018-11-05 12:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 12:12:30', '2018-11-05 12:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 12:12:30', '2018-11-05 12:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 12:12:30', '2018-11-05 12:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 12:12:30', '2018-11-05 12:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 12:12:30', '2018-11-05 12:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 12:12:30', '2018-11-05 12:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 12:12:30', '2018-11-05 12:12:30'),
(138, 'Gray', '#808080', '2018-11-05 12:12:30', '2018-11-05 12:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 12:12:30', '2018-11-05 12:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 12:12:30', '2018-11-05 12:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 12:12:30', '2018-11-05 12:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 12:12:30', '2018-11-05 12:12:30'),
(143, 'Black', '#000000', '2018-11-05 12:12:30', '2018-11-05 12:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `consignments`
--

CREATE TABLE `consignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `feedback` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_type`, `title`, `code`, `start_date`, `expire_date`, `min_purchase`, `max_discount`, `discount`, `discount_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'discount_on_purchase', 'free', 'free', '2022-02-16', '2022-02-26', 2.00, 100.00, 100.00, 'amount', 1, '2022-01-04 23:27:29', '2022-02-17 01:33:42'),
(2, 'discount_on_purchase', 'Free', 'Free', '2022-01-04', '2022-05-27', 10.00, 10.00, 10.00, 'percentage', 1, '2022-01-18 21:59:41', '2022-01-18 21:59:41'),
(3, 'discount_on_purchase', 'ar', 'ar', '2022-01-10', '2022-02-05', 1.00, 200.00, 200.00, 'amount', 1, '2022-01-20 21:57:35', '2022-01-28 22:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', 'USD', 'USD', '1', 1, NULL, '2021-06-27 22:39:37'),
(2, 'BDT', '৳', 'BDT', '84', 1, NULL, '2021-07-06 20:52:58'),
(3, 'Indian Rupi', '₹', 'INR', '60', 1, '2020-10-16 02:23:04', '2021-06-05 03:26:38'),
(4, 'Euro', '€', 'EUR', '100', 1, '2021-05-26 06:00:23', '2021-06-05 03:25:29'),
(5, 'YEN', '¥', 'JPY', '110', 1, '2021-06-11 07:08:31', '2021-06-26 23:21:10'),
(6, 'Ringgit', 'RM', 'MYR', '4.16', 1, '2021-07-03 20:08:33', '2021-07-03 20:10:37'),
(7, 'Rand', 'R', 'ZAR', '14.26', 1, '2021-07-03 20:12:38', '2021-07-03 20:12:42');

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallets`
--

CREATE TABLE `customer_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `royality_points` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_histories`
--

CREATE TABLE `customer_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `transaction_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_days`
--

CREATE TABLE `deal_of_the_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `status` tinyint(1) NOT NULL DEFAULT '0',
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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_deals`
--

CREATE TABLE `feature_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `deal_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_topics`
--

CREATE TABLE `help_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  `ranking` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `help_topics`
--

INSERT INTO `help_topics` (`id`, `question`, `answer`, `ranking`, `status`, `created_at`, `updated_at`) VALUES
(1, 'What is consignment?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ali qua. Ut enim ad minim veniam, quis nostrud exercitation ulla mco laboris nisi ut aliquip ex ea commodo consequat.', 1, 1, '2021-11-23 02:40:13', '2021-11-23 02:40:13'),
(2, 'What items do you accept?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ali qua. Ut enim ad minim veniam, quis nostrud exercitation ulla mco laboris nisi ut aliquip ex ea commodo consequat.', 1, 1, '2021-11-25 21:26:34', '2022-01-27 16:44:02'),
(3, 'How do you price?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ali qua. Ut enim ad minim veniam, quis nostrud exercitation ulla mco laboris nisi ut aliquip ex ea commodo consequat.', 1, 1, '2021-11-25 21:26:51', '2021-11-25 21:26:51'),
(4, 'How much will I earn?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ali qua. Ut enim ad minim veniam, quis nostrud exercitation ulla mco laboris nisi ut aliquip ex ea commodo consequat.', 1, 1, '2021-11-25 21:27:04', '2022-01-27 16:43:42'),
(5, 'Can anyone consign?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ali qua. Ut enim ad minim veniam, quis nostrud exercitation ulla mco laboris nisi ut aliquip ex ea commodo consequat.', 1, 0, '2021-11-25 21:27:14', '2022-01-27 16:43:36'),
(6, 'What if my items don\'t sell?', 'So, what gems do you have hidden in your closet? Do you have something valuable, but you just don’t wear it? Consider consigning with us!bbbbb', 1, 0, '2021-11-25 21:27:24', '2022-01-28 22:53:07');

-- --------------------------------------------------------

--
-- Table structure for table `look_books`
--

CREATE TABLE `look_books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0- In-Active, 1- Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `look_books`
--

INSERT INTO `look_books` (`id`, `title`, `slug`, `banner`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Look book season 1', 'look-book-season-1', '2021-12-02-61a8ddd084185.png', 1, '2021-12-03 01:53:04', '2021-12-03 01:55:52'),
(2, 'Look book season 2', 'look-book-season-2', '2021-12-02-61a8de58f09f2.png', 1, '2021-12-03 01:55:20', '2021-12-03 01:55:45');

-- --------------------------------------------------------

--
-- Table structure for table `look_book_attachments`
--

CREATE TABLE `look_book_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `look_book_id` bigint(20) NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `look_book_products`
--

CREATE TABLE `look_book_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `look_book_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(4, '2020_09_08_105159_create_admins_table', 1),
(5, '2020_09_08_111837_create_admin_roles_table', 1),
(6, '2020_09_16_142451_create_categories_table', 2),
(7, '2020_09_16_181753_create_categories_table', 3),
(8, '2020_09_17_134238_create_brands_table', 4),
(9, '2020_09_17_203054_create_attributes_table', 5),
(10, '2020_09_19_112509_create_coupons_table', 6),
(11, '2020_09_19_161802_create_curriencies_table', 7),
(12, '2020_09_20_114509_create_sellers_table', 8),
(13, '2020_09_23_113454_create_shops_table', 9),
(14, '2020_09_23_115615_create_shops_table', 10),
(15, '2020_09_23_153822_create_shops_table', 11),
(16, '2020_09_21_122817_create_products_table', 12),
(17, '2020_09_22_140800_create_colors_table', 12),
(18, '2020_09_28_175020_create_products_table', 13),
(19, '2020_09_28_180311_create_products_table', 14),
(20, '2020_10_04_105041_create_search_functions_table', 15),
(21, '2020_10_05_150730_create_customers_table', 15),
(22, '2020_10_08_133548_create_wishlists_table', 16),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 17),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 17),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 17),
(26, '2016_06_01_000004_create_oauth_clients_table', 17),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 17),
(28, '2020_10_06_133710_create_product_stocks_table', 17),
(29, '2020_10_06_134636_create_flash_deals_table', 17),
(30, '2020_10_06_134719_create_flash_deal_products_table', 17),
(31, '2020_10_08_115439_create_orders_table', 17),
(32, '2020_10_08_115453_create_order_details_table', 17),
(33, '2020_10_08_121135_create_shipping_addresses_table', 17),
(34, '2020_10_10_171722_create_business_settings_table', 17),
(35, '2020_09_19_161802_create_currencies_table', 18),
(36, '2020_10_12_152350_create_reviews_table', 18),
(37, '2020_10_12_161834_create_reviews_table', 19),
(38, '2020_10_12_180510_create_support_tickets_table', 20),
(39, '2020_10_14_140130_create_transactions_table', 21),
(40, '2020_10_14_143553_create_customer_wallets_table', 21),
(41, '2020_10_14_143607_create_customer_wallet_histories_table', 21),
(42, '2020_10_22_142212_create_support_ticket_convs_table', 21),
(43, '2020_10_24_234813_create_banners_table', 22),
(44, '2020_10_27_111557_create_shipping_methods_table', 23),
(45, '2020_10_27_114154_add_url_to_banners_table', 24),
(46, '2020_10_28_170308_add_shipping_id_to_order_details', 25),
(47, '2020_11_02_140528_add_discount_to_order_table', 26),
(48, '2020_11_03_162723_add_column_to_order_details', 27),
(49, '2020_11_08_202351_add_url_to_banners_table', 28),
(50, '2020_11_10_112713_create_help_topic', 29),
(51, '2020_11_10_141513_create_contacts_table', 29),
(52, '2020_11_15_180036_add_address_column_user_table', 30),
(53, '2020_11_18_170209_add_status_column_to_product_table', 31),
(54, '2020_11_19_115453_add_featured_status_product', 32),
(55, '2020_11_21_133302_create_deal_of_the_days_table', 33),
(56, '2020_11_20_172332_add_product_id_to_products', 34),
(57, '2020_11_27_234439_add_state_to_shipping_addresses', 34),
(58, '2020_11_28_091929_create_chattings_table', 35),
(59, '2020_12_02_011815_add_bank_info_to_sellers', 36),
(60, '2020_12_08_193234_create_social_medias_table', 37),
(61, '2020_12_13_122649_shop_id_to_chattings', 37),
(62, '2020_12_14_145116_create_seller_wallet_histories_table', 38),
(63, '2020_12_14_145127_create_seller_wallets_table', 38),
(64, '2020_12_15_174804_create_admin_wallets_table', 39),
(65, '2020_12_15_174821_create_admin_wallet_histories_table', 39),
(66, '2020_12_15_214312_create_feature_deals_table', 40),
(67, '2020_12_17_205712_create_withdraw_requests_table', 41),
(68, '2021_02_22_161510_create_notifications_table', 42),
(69, '2021_02_24_154706_add_deal_type_to_flash_deals', 43),
(70, '2021_03_03_204349_add_cm_firebase_token_to_users', 44),
(71, '2021_04_17_134848_add_column_to_order_details_stock', 45),
(72, '2021_05_12_155401_add_auth_token_seller', 46),
(73, '2021_06_03_104531_ex_rate_update', 47),
(74, '2021_06_03_222413_amount_withdraw_req', 48),
(75, '2021_06_04_154501_seller_wallet_withdraw_bal', 49),
(76, '2021_06_04_195853_product_dis_tax', 50),
(77, '2021_05_27_103505_create_product_translations_table', 51),
(78, '2021_06_17_054551_create_soft_credentials_table', 51),
(79, '2021_06_29_212549_add_active_col_user_table', 52),
(80, '2021_06_30_212619_add_col_to_contact', 53),
(81, '2021_07_01_160828_add_col_daily_needs_products', 54),
(82, '2021_07_04_182331_add_col_seller_sales_commission', 55),
(83, '2021_08_07_190655_add_seo_columns_to_products', 56),
(84, '2021_08_07_205913_add_col_to_category_table', 56),
(85, '2021_08_07_210808_add_col_to_shops_table', 56),
(86, '2021_08_14_205216_change_product_price_col_type', 56),
(87, '2021_08_16_201505_change_order_price_col', 56),
(88, '2021_08_16_201552_change_order_details_price_col', 56),
(93, '2021_08_17_213934_change_col_type_seller_earning_history', 57),
(94, '2021_08_17_214109_change_col_type_admin_earning_history', 57),
(95, '2021_08_17_214232_change_col_type_admin_wallet', 57),
(96, '2021_08_17_214405_change_col_type_seller_wallet', 57),
(97, '2021_09_22_144337_alter_table_banners_add_columns', 57),
(98, '2021_09_22_211550_create_blog_categories_table', 57),
(99, '2021_09_23_151547_create_blogs_table', 57),
(100, '2021_10_06_144601_alter_table_brands_modify_column_image', 58),
(101, '2021_10_06_145937_alter_table_brands_add_column_slug', 58),
(102, '2021_10_07_212343_alter_products_table_modify_column_category_ids', 58),
(103, '2021_11_23_185800_create_request_items_table', 59),
(104, '2021_11_29_154302_create_look_books_table', 60),
(105, '2021_12_02_182120_create_look_book_products_table', 60),
(106, '2021_12_02_184945_create_look_book_attachments_table', 60),
(108, '2021_12_10_151519_create_consignments_table', 61),
(109, '2021_12_21_172556_add_two_column_in_users_table', 61),
(110, '2022_01_04_210724_create_newsletters_table', 62),
(111, '2022_01_18_211311_drop_ref_column_in_order_table', 63),
(112, '2022_01_18_211355_add_ref_column_in_order_table', 63);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletters`
--

INSERT INTO `newsletters` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'test@gmail.com', '2022-01-04 21:39:45', '2022-01-04 21:39:45'),
(2, '99@gmail.com', '2022-01-05 01:47:50', '2022-01-05 01:47:50'),
(3, 'aaa@gmail.com', '2022-01-05 01:48:00', '2022-01-05 01:48:00'),
(4, 'aaa@ss', '2022-01-05 01:55:37', '2022-01-05 01:55:37'),
(5, 'john@examplecom', '2022-01-06 21:34:23', '2022-01-06 21:34:23');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('6840b7d4ed685bf2e0dc593affa0bd3b968065f47cc226d39ab09f1422b5a1d9666601f3f60a79c1', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 18:25:41', '2021-07-05 18:25:41', '2022-07-05 15:25:41'),
('c42cdd5ae652b8b2cbac4f2f4b496e889e1a803b08672954c8bbe06722b54160e71dce3e02331544', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 18:24:36', '2021-07-05 18:24:36', '2022-07-05 15:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, '6amtech', 'GEUx5tqkviM6AAQcz4oi1dcm1KtRdJPgw41lj0eI', 'http://localhost', 1, 0, 0, '2020-10-22 03:27:22', '2020-10-22 03:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-22 03:27:23', '2020-10-22 03:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT '0',
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT '0',
  `discount_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_ref` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `customer_type`, `payment_status`, `order_status`, `payment_method`, `order_amount`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `transaction_ref`) VALUES
(100001, '11', 'customer', 'paid', 'pending', 'not choosen yet', 30, '14 Henry Street', '2022-01-18 22:07:51', '2022-01-18 22:08:24', 20, 'coupon_discount', '557a4c672e8dad88ff984db290ab7928'),
(100002, '11', 'customer', 'unpaid', 'pending', 'not choosen yet', 50, '14 Henry Street\r\nX5FpNbr9u4', '2022-01-19 16:56:13', '2022-01-19 16:56:13', 0, NULL, NULL),
(100003, '11', 'customer', 'unpaid', 'pending', 'not choosen yet', 50, 'AeThbXavBr\r\nX5FpNbr9u4', '2022-01-19 16:56:28', '2022-01-19 16:56:28', 0, NULL, NULL),
(100004, '11', 'customer', 'paid', 'pending', 'not choosen yet', 50, '14 Henry Street', '2022-01-19 16:56:59', '2022-01-19 16:57:26', 0, NULL, '84a53a8bcfccc1fd1c34af24c67c9221'),
(100005, '12', 'customer', 'paid', 'pending', 'not choosen yet', 50, 'street 4', '2022-01-19 20:00:14', '2022-01-19 20:01:48', 0, NULL, '931cd5bc2babd869026501f4722e0f40'),
(100006, '13', 'customer', 'unpaid', 'pending', 'not choosen yet', -8.2, 'as', '2022-01-20 21:33:39', '2022-01-20 21:33:39', 20, 'coupon_discount', NULL),
(100007, '13', 'customer', 'unpaid', 'pending', 'not choosen yet', -8.2, 'as', '2022-01-20 21:37:10', '2022-01-20 21:37:11', 20, 'coupon_discount', '511570cdbf18ff3fc137518be0648e9b'),
(100008, '13', 'customer', 'unpaid', 'pending', 'not choosen yet', -70.8, 'as', '2022-01-20 21:39:08', '2022-01-20 21:39:09', 0, NULL, '8e95994a5b0810e1594e275de1d912ad'),
(100009, '13', 'customer', 'unpaid', 'pending', 'not choosen yet', 124.45, 'as', '2022-01-20 21:54:27', '2022-01-20 21:54:28', 20, 'coupon_discount', '3c11745f8ffb3f733fd23d140a69fcba'),
(100010, '13', 'customer', 'unpaid', 'pending', 'not choosen yet', 124.45, 'as', '2022-01-20 21:54:43', '2022-01-20 21:54:44', 20, 'coupon_discount', '16024dbe5517ec21db030fff89a34ce1'),
(100011, '15', 'customer', 'unpaid', 'pending', 'not choosen yet', 90, 'as', '2022-01-28 21:35:28', '2022-01-28 21:35:32', 0, NULL, '34767e1eeb08339dde07ea3ef33516e0'),
(100012, '15', 'customer', 'unpaid', 'pending', 'not choosen yet', 90, 'as', '2022-01-28 21:37:51', '2022-01-28 21:37:51', 0, NULL, '5c4c6bbc84e4918b81a7776888026636'),
(100013, '15', 'customer', 'unpaid', 'pending', 'not choosen yet', 90, 'as', '2022-01-28 21:38:02', '2022-01-28 21:38:02', 0, NULL, NULL),
(100014, '15', 'customer', 'unpaid', 'pending', 'not choosen yet', 90, 'as', '2022-01-28 21:38:14', '2022-01-28 21:38:15', 0, NULL, '170f1dc15df2468163027080080abddc'),
(100015, '15', 'customer', 'unpaid', 'pending', 'not choosen yet', 80, 'as', '2022-01-28 21:41:14', '2022-01-28 21:41:15', 10, 'coupon_discount', '0fd70a0ded5c4b5307a3a7048b705960'),
(100016, '15', 'customer', 'unpaid', 'pending', 'not choosen yet', 230, 'as', '2022-01-28 21:49:12', '2022-01-28 21:49:12', 0, NULL, NULL),
(100017, '15', 'customer', 'unpaid', 'pending', 'not choosen yet', 230, 'as', '2022-01-28 21:49:53', '2022-01-28 21:49:54', 0, NULL, '66b3965adeb1bfeeef9b837c7431a84d'),
(100018, '15', 'customer', 'unpaid', 'pending', 'not choosen yet', 230, 'as', '2022-01-28 21:49:53', '2022-01-28 21:49:53', 0, NULL, NULL),
(100019, '15', 'customer', 'unpaid', 'delivered', 'not choosen yet', 230, 'as', '2022-01-28 21:49:57', '2022-01-28 22:13:10', 0, NULL, '64d35c9e55f46fd70b4c14b55178626c'),
(100020, '16', 'customer', 'unpaid', 'pending', 'not choosen yet', 90, '4ugigfuyfvgg', '2022-01-30 15:18:56', '2022-01-30 15:19:05', 0, NULL, 'c0004eca19d1d534ae7543a42b07a652'),
(100021, '16', 'customer', 'paid', 'pending', 'not choosen yet', 90, '4ugigfuyfvgg', '2022-01-30 15:19:19', '2022-01-30 15:38:36', 0, NULL, NULL),
(100022, '16', 'customer', 'paid', 'pending', 'not choosen yet', 90, 'hbvjklgbbjh', '2022-01-30 15:19:35', '2022-01-30 15:24:06', 0, NULL, '2bead400cf216b82953940eb6f2d9191'),
(100023, '16', 'customer', 'paid', 'pending', 'not choosen yet', 90, 'setgsdfg', '2022-01-30 16:26:39', '2022-01-30 16:28:10', 0, NULL, '01356d70648e8a6527cb3ccdc2c4ee82'),
(100024, '8', 'customer', 'unpaid', 'pending', 'not choosen yet', 80, '14 Henry Street', '2022-01-31 20:25:40', '2022-01-31 20:25:40', 10, 'coupon_discount', NULL),
(100025, '8', 'customer', 'paid', 'pending', 'not choosen yet', 80, '14 Henry Street', '2022-01-31 20:25:55', '2022-01-31 20:26:31', 10, 'coupon_discount', '7187ff5a9680387679f9e3bb5f2470ff'),
(100026, '17', 'customer', 'paid', 'canceled', 'not choosen yet', 80, 'aaa', '2022-01-31 20:37:33', '2022-01-31 20:40:16', 10, 'coupon_discount', '03d8ef417c0da7f7cdbeb819052b9bd4'),
(100027, '20', 'customer', 'unpaid', 'pending', 'not choosen yet', -110, 'dfg', '2022-01-31 21:49:10', '2022-01-31 21:49:10', 200, 'coupon_discount', NULL),
(100028, '20', 'customer', 'unpaid', 'pending', 'not choosen yet', -110, 'fgh', '2022-01-31 21:49:33', '2022-01-31 21:49:34', 200, 'coupon_discount', 'fe66bfab3b7f5afef42b692c830ef560'),
(100029, '20', 'customer', 'unpaid', 'pending', 'not choosen yet', -110, 'dfg', '2022-01-31 21:52:18', '2022-01-31 21:52:18', 200, 'coupon_discount', '9ccdff4fb99b106032f49cac4b15acf1'),
(100030, '20', 'customer', 'unpaid', 'pending', 'not choosen yet', -110, 'dfg', '2022-01-31 21:53:56', '2022-01-31 21:53:57', 200, 'coupon_discount', '9c70fe6c996a6ffcb1e9df0712e19018'),
(100031, '20', 'customer', 'unpaid', 'pending', 'not choosen yet', -110, 'aaa', '2022-01-31 21:57:22', '2022-01-31 21:57:22', 200, 'coupon_discount', NULL),
(100032, '20', 'customer', 'unpaid', 'pending', 'not choosen yet', -110, 'aaa', '2022-01-31 21:57:29', '2022-01-31 21:57:29', 200, 'coupon_discount', 'd2b32f3602b6958649315eadf8ed5948'),
(100033, '18', 'customer', 'unpaid', 'pending', 'not choosen yet', 90, '5BN3fipvua\r\nX5FpNbr9u4', '2022-01-31 22:00:17', '2022-01-31 22:00:17', 0, NULL, NULL),
(100034, '18', 'customer', 'unpaid', 'pending', 'not choosen yet', 90, 'AeThbXavBr\r\nX5FpNbr9u4', '2022-01-31 22:00:26', '2022-01-31 22:00:26', 0, NULL, NULL),
(100035, '18', 'customer', 'unpaid', 'pending', 'not choosen yet', 90, '5BN3fipvua\r\nX5FpNbr9u4', '2022-01-31 22:00:37', '2022-01-31 22:00:37', 0, NULL, NULL),
(100036, '18', 'customer', 'paid', 'canceled', 'not choosen yet', 90, 'NAuGQ8DGDN\r\nX5FpNbr9u4', '2022-01-31 22:00:53', '2022-01-31 22:10:30', 0, NULL, '7dc13eb6bd12047879d42e730c1bcfa9'),
(100037, '20', 'customer', 'unpaid', 'pending', 'not choosen yet', -110, 'aaa', '2022-01-31 22:14:41', '2022-01-31 22:14:41', 200, 'coupon_discount', NULL),
(100038, '20', 'customer', 'unpaid', 'pending', 'not choosen yet', -110, 'aaa', '2022-01-31 22:14:51', '2022-01-31 22:14:51', 200, 'coupon_discount', NULL),
(100039, '20', 'customer', 'unpaid', 'pending', 'not choosen yet', -110, 'aaa', '2022-01-31 22:15:10', '2022-01-31 22:15:11', 200, 'coupon_discount', '7c33361be1fdcf51eb8295da2d6d6f65'),
(100040, '20', 'customer', 'unpaid', 'pending', 'not choosen yet', -110, 'aaa', '2022-01-31 22:15:29', '2022-01-31 22:15:29', 200, 'coupon_discount', NULL),
(100041, '20', 'customer', 'unpaid', 'pending', 'not choosen yet', -110, 'aaa', '2022-01-31 22:15:41', '2022-01-31 22:15:41', 200, 'coupon_discount', NULL),
(100042, '20', 'customer', 'unpaid', 'pending', 'not choosen yet', -110, 'aaa', '2022-01-31 22:15:55', '2022-01-31 22:15:55', 200, 'coupon_discount', '5d2b0c808d8656b0446d36936a72712c'),
(100043, '20', 'customer', 'unpaid', 'pending', 'not choosen yet', -110, 'aaa', '2022-01-31 22:16:06', '2022-01-31 22:16:06', 200, 'coupon_discount', '557b7305f52050e3a01f13680251292e'),
(100044, '20', 'customer', 'unpaid', 'pending', 'not choosen yet', -110, 'aaa', '2022-01-31 22:16:06', '2022-01-31 22:16:06', 200, 'coupon_discount', NULL),
(100045, '20', 'customer', 'unpaid', 'pending', 'not choosen yet', -110, 'aaa', '2022-01-31 22:16:15', '2022-01-31 22:16:16', 200, 'coupon_discount', '9e53ac3b34128423dc538de27e87a49a'),
(100046, '21', 'customer', 'unpaid', 'pending', 'not choosen yet', 280, '5345346', '2022-02-02 16:18:56', '2022-02-02 16:18:57', 0, NULL, '4d411ce56de5102df842e65fd54e7cdf'),
(100047, '21', 'customer', 'unpaid', 'pending', 'not choosen yet', 280, '5345346', '2022-02-02 16:19:19', '2022-02-02 16:19:19', 0, NULL, NULL),
(100048, '21', 'customer', 'unpaid', 'pending', 'not choosen yet', 270, 'Nihil adipisicing ex', '2022-02-02 16:36:28', '2022-02-02 16:36:28', 10, 'coupon_discount', NULL),
(100049, '21', 'customer', 'unpaid', 'pending', 'not choosen yet', 270, 'Tempor magni dolore', '2022-02-02 16:36:41', '2022-02-02 16:36:41', 10, 'coupon_discount', NULL),
(100050, '21', 'customer', 'unpaid', 'pending', 'not choosen yet', 270, 'A voluptas provident', '2022-02-02 16:37:13', '2022-02-02 16:37:13', 10, 'coupon_discount', NULL),
(100051, '21', 'customer', 'paid', 'pending', 'not choosen yet', 270, 'Soluta proident ess', '2022-02-02 16:37:55', '2022-02-02 16:38:19', 10, 'coupon_discount', '52bfdb011c4d8d2fd97621bd9f27d1f1'),
(100052, '21', 'customer', 'paid', 'pending', 'not choosen yet', 280, 'gsdfgsdfgds', '2022-02-02 18:55:18', '2022-02-02 18:58:23', 0, NULL, '23c515cbc7b3ae5e2368af1795c94fc3'),
(100053, '22', 'customer', 'unpaid', 'pending', 'not choosen yet', 45, 'Sint dolor modi erro', '2022-02-14 20:16:22', '2022-02-14 20:16:22', 0, NULL, NULL),
(100054, '22', 'customer', 'unpaid', 'pending', 'not choosen yet', 45, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', '2022-02-14 20:16:52', '2022-02-14 20:16:52', 0, NULL, NULL),
(100055, '22', 'customer', 'unpaid', 'pending', 'not choosen yet', 45, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', '2022-02-14 20:17:07', '2022-02-14 20:17:07', 0, NULL, NULL),
(100056, '22', 'customer', 'unpaid', 'pending', 'not choosen yet', 45, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', '2022-02-14 20:21:57', '2022-02-14 20:21:58', 0, NULL, 'babb25637e9a28e18192c0d2e4d9e3da'),
(100057, '23', 'customer', 'paid', 'pending', 'not choosen yet', 185, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', '2022-02-14 20:28:16', '2022-02-14 20:28:40', 0, NULL, '8664593dae6168a277a4ae5668696a70'),
(100058, '24', 'customer', 'paid', 'pending', 'not choosen yet', 140, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', '2022-02-15 14:13:31', '2022-02-15 14:13:56', 0, NULL, '851feed86082f1bd1c52d834bcbbd52b'),
(100059, '24', 'customer', 'unpaid', 'pending', 'not choosen yet', 140, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', '2022-02-15 15:11:35', '2022-02-15 15:11:35', 0, NULL, NULL),
(100060, '24', 'customer', 'unpaid', 'pending', 'not choosen yet', 140, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', '2022-02-15 15:11:41', '2022-02-15 15:11:42', 0, NULL, 'c938fe2d055552b335ff97caa536f3f0'),
(100061, '24', 'customer', 'unpaid', 'pending', 'not choosen yet', 140, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', '2022-02-15 15:12:28', '2022-02-15 15:12:29', 0, NULL, '235d8c7df564181cbe231c4804559c00'),
(100062, '24', 'customer', 'unpaid', 'pending', 'not choosen yet', 140, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', '2022-02-15 15:13:42', '2022-02-15 15:13:43', 0, NULL, 'd352aefae448cbb92fb5c6b0770f4cf7'),
(100063, '25', 'customer', 'unpaid', 'pending', 'not choosen yet', 280, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', '2022-02-15 15:38:03', '2022-02-15 15:38:03', 0, NULL, NULL),
(100064, '25', 'customer', 'unpaid', 'pending', 'not choosen yet', 280, '244 New Extension\r\nEst nisi accusantiu', '2022-02-15 15:38:59', '2022-02-15 15:39:01', 0, NULL, '8d6e296fb6e70aeae11686db813165c4'),
(100065, '25', 'customer', 'unpaid', 'pending', 'not choosen yet', 140, '23sfdsdfsd', '2022-02-15 15:42:20', '2022-02-15 15:42:21', 0, NULL, '4cefe5525b7d72a101a2fc2dd49b2608'),
(100066, '25', 'customer', 'unpaid', 'pending', 'not choosen yet', 140, 'ASDFSDAFSDF', '2022-02-15 15:45:46', '2022-02-15 15:45:46', 0, NULL, NULL),
(100067, '25', 'customer', 'unpaid', 'pending', 'not choosen yet', 140, 'fdsgdfsgd', '2022-02-15 15:46:10', '2022-02-15 15:46:11', 0, NULL, '2bf1da9bc8ec5b14e14f54447f0d00b7'),
(100068, '26', 'customer', 'unpaid', 'pending', 'not choosen yet', 280, 'rtyeretyrt', '2022-02-15 16:08:46', '2022-02-15 16:08:51', 0, NULL, '7b1605c027a49bd2eeeaded91ca31b36'),
(100069, '27', 'customer', 'unpaid', 'pending', 'not choosen yet', 59.4, 'A', '2022-02-17 00:28:22', '2022-02-17 00:28:22', 0, NULL, NULL),
(100070, '27', 'customer', 'unpaid', 'pending', 'not choosen yet', 59.4, 'A', '2022-02-17 00:28:47', '2022-02-17 00:28:48', 0, NULL, 'cccb1f876bfaee5076f0461284c01d24'),
(100071, '27', 'customer', 'unpaid', 'pending', 'not choosen yet', 59.4, 'A', '2022-02-17 00:32:51', '2022-02-17 00:32:51', 0, NULL, 'b46f037507f21fa949a1db7493a868c0'),
(100072, '27', 'customer', 'unpaid', 'pending', 'not choosen yet', 59.4, 'A', '2022-02-17 01:29:05', '2022-02-17 01:29:10', 0, NULL, '091972bba89fd15023fcc09f98f4eb03'),
(100073, '27', 'customer', 'unpaid', 'pending', 'not choosen yet', 59.4, 'A', '2022-02-17 01:34:14', '2022-02-17 01:34:15', 0, NULL, 'b9c55ea4661e18700937f126e481183c');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `product_details` text COLLATE utf8mb4_unicode_ci,
  `qty` int(11) NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `tax` double NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `delivery_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`) VALUES
(6, 100001, 90, 0, '{\"id\":90,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"F Cadeau Homemade Soy Shower\",\"slug\":\"f-cadeau-homemade-soy-shower-wteytX\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-04-61d45dac03cce.png\\\"]\",\"thumbnail\":\"2021-12-17-61bc9470a3c18.png\",\"featured\":0,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":50,\"purchase_price\":102.06999999999999317878973670303821563720703125,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":48,\"details\":\"<h2>What is Lorem Ipsum?<\\/h2>\\r\\n\\r\\n<p><strong>Lorem Ipsum<\\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<h2>Why do we use it?<\\/h2>\\r\\n\\r\\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2021-12-17 14:45:20\",\"updated_at\":\"2022-01-18 22:06:10\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2021-12-17-61bc9470b5283.png\",\"translations\":[]}', 1, 50, 0, 0, 'pending', 'unpaid', '2022-01-18 22:07:51', '2022-01-18 22:07:51', 1, '', '[]', 'discount_on_product', 1),
(7, 100002, 90, 0, '{\"id\":90,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"F Cadeau Homemade Soy Shower\",\"slug\":\"f-cadeau-homemade-soy-shower-wteytX\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-04-61d45dac03cce.png\\\"]\",\"thumbnail\":\"2021-12-17-61bc9470a3c18.png\",\"featured\":0,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":50,\"purchase_price\":102.06999999999999317878973670303821563720703125,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":47,\"details\":\"<h2>What is Lorem Ipsum?<\\/h2>\\r\\n\\r\\n<p><strong>Lorem Ipsum<\\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<h2>Why do we use it?<\\/h2>\\r\\n\\r\\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2021-12-17 14:45:20\",\"updated_at\":\"2022-01-18 22:07:51\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2021-12-17-61bc9470b5283.png\",\"translations\":[]}', 1, 50, 0, 0, 'pending', 'unpaid', '2022-01-19 16:56:13', '2022-01-19 16:56:13', 1, '', '[]', 'discount_on_product', 1),
(8, 100003, 90, 0, '{\"id\":90,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"F Cadeau Homemade Soy Shower\",\"slug\":\"f-cadeau-homemade-soy-shower-wteytX\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-04-61d45dac03cce.png\\\"]\",\"thumbnail\":\"2021-12-17-61bc9470a3c18.png\",\"featured\":0,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":50,\"purchase_price\":102.06999999999999317878973670303821563720703125,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":46,\"details\":\"<h2>What is Lorem Ipsum?<\\/h2>\\r\\n\\r\\n<p><strong>Lorem Ipsum<\\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<h2>Why do we use it?<\\/h2>\\r\\n\\r\\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2021-12-17 14:45:20\",\"updated_at\":\"2022-01-19 16:56:13\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2021-12-17-61bc9470b5283.png\",\"translations\":[]}', 1, 50, 0, 0, 'pending', 'unpaid', '2022-01-19 16:56:28', '2022-01-19 16:56:28', 1, '', '[]', 'discount_on_product', 1),
(9, 100004, 90, 0, '{\"id\":90,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"F Cadeau Homemade Soy Shower\",\"slug\":\"f-cadeau-homemade-soy-shower-wteytX\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-04-61d45dac03cce.png\\\"]\",\"thumbnail\":\"2021-12-17-61bc9470a3c18.png\",\"featured\":0,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":50,\"purchase_price\":102.06999999999999317878973670303821563720703125,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":45,\"details\":\"<h2>What is Lorem Ipsum?<\\/h2>\\r\\n\\r\\n<p><strong>Lorem Ipsum<\\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<h2>Why do we use it?<\\/h2>\\r\\n\\r\\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2021-12-17 14:45:20\",\"updated_at\":\"2022-01-19 16:56:28\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2021-12-17-61bc9470b5283.png\",\"translations\":[]}', 1, 50, 0, 0, 'pending', 'unpaid', '2022-01-19 16:56:59', '2022-01-19 16:56:59', 1, '', '[]', 'discount_on_product', 1),
(10, 100005, 90, 0, '{\"id\":90,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"F Cadeau Homemade Soy Shower\",\"slug\":\"f-cadeau-homemade-soy-shower-wteytX\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-04-61d45dac03cce.png\\\"]\",\"thumbnail\":\"2021-12-17-61bc9470a3c18.png\",\"featured\":0,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":50,\"purchase_price\":102.06999999999999317878973670303821563720703125,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":44,\"details\":\"<h2>What is Lorem Ipsum?<\\/h2>\\r\\n\\r\\n<p><strong>Lorem Ipsum<\\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<h2>Why do we use it?<\\/h2>\\r\\n\\r\\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2021-12-17 14:45:20\",\"updated_at\":\"2022-01-19 16:56:59\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2021-12-17-61bc9470b5283.png\",\"translations\":[]}', 1, 50, 0, 0, 'pending', 'unpaid', '2022-01-19 20:00:14', '2022-01-19 20:00:14', 1, '', '[]', 'discount_on_product', 1),
(11, 100006, 91, 0, '{\"id\":91,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"test123\",\"slug\":\"test123-BPqELn\",\"category_ids\":\"[{\\\"id\\\":\\\"45\\\",\\\"name\\\":\\\"test\\\",\\\"slug\\\":\\\"test\\\",\\\"position\\\":1},{\\\"id\\\":\\\"46\\\",\\\"name\\\":\\\"testtt\\\",\\\"slug\\\":\\\"testtt\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"gms\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-05-61d4abe837ac3.png\\\"]\",\"thumbnail\":\"2022-01-05-61d4abe838ada.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":20,\"purchase_price\":20,\"tax\":9,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":3,\"details\":\"<p>jkhjdhjdshjjdsjksdjdskhjdshjkdshjsdjh<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-05 02:19:52\",\"updated_at\":\"2022-01-05 02:44:16\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-01-05-61d4abe83b097.png\",\"translations\":[]}', 1, 20, 1.8, 10, 'pending', 'unpaid', '2022-01-20 21:33:39', '2022-01-20 21:33:39', 1, '', '[]', 'discount_on_product', 1),
(12, 100007, 91, 0, '{\"id\":91,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"test123\",\"slug\":\"test123-BPqELn\",\"category_ids\":\"[{\\\"id\\\":\\\"45\\\",\\\"name\\\":\\\"test\\\",\\\"slug\\\":\\\"test\\\",\\\"position\\\":1},{\\\"id\\\":\\\"46\\\",\\\"name\\\":\\\"testtt\\\",\\\"slug\\\":\\\"testtt\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"gms\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-05-61d4abe837ac3.png\\\"]\",\"thumbnail\":\"2022-01-05-61d4abe838ada.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":20,\"purchase_price\":20,\"tax\":9,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":2,\"details\":\"<p>jkhjdhjdshjjdsjksdjdskhjdshjkdshjsdjh<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-05 02:19:52\",\"updated_at\":\"2022-01-20 21:33:39\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-01-05-61d4abe83b097.png\",\"translations\":[]}', 1, 20, 1.8, 10, 'pending', 'unpaid', '2022-01-20 21:37:10', '2022-01-20 21:37:10', 1, '', '[]', 'discount_on_product', 1),
(13, 100008, 91, 0, '{\"id\":91,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"test123\",\"slug\":\"test123-BPqELn\",\"category_ids\":\"[{\\\"id\\\":\\\"45\\\",\\\"name\\\":\\\"test\\\",\\\"slug\\\":\\\"test\\\",\\\"position\\\":1},{\\\"id\\\":\\\"46\\\",\\\"name\\\":\\\"testtt\\\",\\\"slug\\\":\\\"testtt\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"gms\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-05-61d4abe837ac3.png\\\"]\",\"thumbnail\":\"2022-01-05-61d4abe838ada.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":20,\"purchase_price\":20,\"tax\":9,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":1,\"details\":\"<p>jkhjdhjdshjjdsjksdjdskhjdshjkdshjsdjh<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-05 02:19:52\",\"updated_at\":\"2022-01-20 21:37:10\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-01-05-61d4abe83b097.png\",\"translations\":[]}', -6, 20, -10.8, -60, 'pending', 'unpaid', '2022-01-20 21:39:08', '2022-01-20 21:39:08', 1, '', '[]', 'discount_on_product', 1),
(14, 100009, 91, 0, '{\"id\":91,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"test123\",\"slug\":\"test123-BPqELn\",\"category_ids\":\"[{\\\"id\\\":\\\"45\\\",\\\"name\\\":\\\"test\\\",\\\"slug\\\":\\\"test\\\",\\\"position\\\":1},{\\\"id\\\":\\\"46\\\",\\\"name\\\":\\\"testtt\\\",\\\"slug\\\":\\\"testtt\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"gms\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-05-61d4abe837ac3.png\\\"]\",\"thumbnail\":\"2022-01-05-61d4abe838ada.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":20,\"purchase_price\":20,\"tax\":9,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":7,\"details\":\"<p>jkhjdhjdshjjdsjksdjdskhjdshjkdshjsdjh<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-05 02:19:52\",\"updated_at\":\"2022-01-20 21:39:08\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-01-05-61d4abe83b097.png\",\"translations\":[]}', 5, 20, 9, 50, 'pending', 'unpaid', '2022-01-20 21:54:27', '2022-01-20 21:54:27', 1, '', '[]', 'discount_on_product', 1),
(15, 100009, 92, 0, '{\"id\":92,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"adsfasdf\",\"slug\":\"adsfasdf-2MXGa5\",\"category_ids\":\"[{\\\"id\\\":\\\"45\\\",\\\"name\\\":\\\"test\\\",\\\"slug\\\":\\\"test\\\",\\\"position\\\":1},{\\\"id\\\":\\\"46\\\",\\\"name\\\":\\\"testtt\\\",\\\"slug\\\":\\\"testtt\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-20-61e9856f45dfb.png\\\"]\",\"thumbnail\":\"2022-01-20-61e9856f47066.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":89,\"purchase_price\":98,\"tax\":5,\"tax_type\":\"percent\",\"discount\":8,\"discount_type\":\"flat\",\"current_stock\":1,\"details\":\"<p>ashghdahfjsadkj<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-20 21:53:19\",\"updated_at\":\"2022-01-20 21:53:19\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-01-20-61e9856f4a0e2.png\",\"translations\":[]}', 1, 89, 4.45, 8, 'pending', 'unpaid', '2022-01-20 21:54:27', '2022-01-20 21:54:27', 1, '', '[]', 'discount_on_product', 1),
(16, 100010, 91, 0, '{\"id\":91,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"test123\",\"slug\":\"test123-BPqELn\",\"category_ids\":\"[{\\\"id\\\":\\\"45\\\",\\\"name\\\":\\\"test\\\",\\\"slug\\\":\\\"test\\\",\\\"position\\\":1},{\\\"id\\\":\\\"46\\\",\\\"name\\\":\\\"testtt\\\",\\\"slug\\\":\\\"testtt\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"gms\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-05-61d4abe837ac3.png\\\"]\",\"thumbnail\":\"2022-01-05-61d4abe838ada.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":20,\"purchase_price\":20,\"tax\":9,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":2,\"details\":\"<p>jkhjdhjdshjjdsjksdjdskhjdshjkdshjsdjh<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-05 02:19:52\",\"updated_at\":\"2022-01-20 21:54:27\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-01-05-61d4abe83b097.png\",\"translations\":[]}', 5, 20, 9, 50, 'pending', 'unpaid', '2022-01-20 21:54:43', '2022-01-20 21:54:43', 1, '', '[]', 'discount_on_product', 1),
(17, 100010, 92, 0, '{\"id\":92,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"adsfasdf\",\"slug\":\"adsfasdf-2MXGa5\",\"category_ids\":\"[{\\\"id\\\":\\\"45\\\",\\\"name\\\":\\\"test\\\",\\\"slug\\\":\\\"test\\\",\\\"position\\\":1},{\\\"id\\\":\\\"46\\\",\\\"name\\\":\\\"testtt\\\",\\\"slug\\\":\\\"testtt\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-20-61e9856f45dfb.png\\\"]\",\"thumbnail\":\"2022-01-20-61e9856f47066.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":89,\"purchase_price\":98,\"tax\":5,\"tax_type\":\"percent\",\"discount\":8,\"discount_type\":\"flat\",\"current_stock\":0,\"details\":\"<p>ashghdahfjsadkj<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-20 21:53:19\",\"updated_at\":\"2022-01-20 21:54:27\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-01-20-61e9856f4a0e2.png\",\"translations\":[]}', 1, 89, 4.45, 8, 'pending', 'unpaid', '2022-01-20 21:54:43', '2022-01-20 21:54:43', 1, '', '[]', 'discount_on_product', 1),
(18, 100011, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":20,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-27 18:57:16\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-28 21:35:28', '2022-01-28 21:35:28', 1, '', '[]', 'discount_on_product', 1),
(19, 100012, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":19,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-28 21:35:28\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-28 21:37:51', '2022-01-28 21:37:51', 1, '', '[]', 'discount_on_product', 1),
(20, 100013, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":18,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-28 21:37:51\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-28 21:38:02', '2022-01-28 21:38:02', 1, '', '[]', 'discount_on_product', 1),
(21, 100014, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":17,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-28 21:38:02\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-28 21:38:14', '2022-01-28 21:38:14', 1, '', '[]', 'discount_on_product', 1),
(22, 100015, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":16,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-28 21:38:14\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-28 21:41:14', '2022-01-28 21:41:14', 1, '', '[]', 'discount_on_product', 1),
(23, 100016, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":15,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-28 21:41:14\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-28 21:49:12', '2022-01-28 21:49:12', 1, '', '[]', 'discount_on_product', 1),
(24, 100016, 102, 0, '{\"id\":102,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"vitae eros finibus\",\"slug\":\"vitae-eros-finibus-7CR0nm\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f2a08c2c131.png\\\"]\",\"thumbnail\":\"2022-01-27-61f2a08c2e0f9.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":99.9899999999999948840923025272786617279052734375,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":19,\"details\":\"<p>augue vitae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Nulla egestas sed nibh ut vulputate. Nam in convallis quam<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 19:39:24\",\"updated_at\":\"2022-01-27 19:39:24\",\"status\":1,\"featured_status\":1,\"meta_title\":\"vitae eros finibus\",\"meta_description\":\"augue vitae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Nulla egestas sed nibh ut vulputate. Nam in convallis quam\",\"meta_image\":\"2022-01-27-61f2a08c32344.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-01-28 21:49:12', '2022-01-28 21:49:12', 1, '', '[]', 'discount_on_product', 1),
(25, 100017, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":14,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-28 21:49:12\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'failed', 'unpaid', '2022-01-28 21:49:53', '2022-01-28 22:20:41', 1, '', '[]', 'discount_on_product', 0),
(26, 100017, 102, 0, '{\"id\":102,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"vitae eros finibus\",\"slug\":\"vitae-eros-finibus-7CR0nm\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f2a08c2c131.png\\\"]\",\"thumbnail\":\"2022-01-27-61f2a08c2e0f9.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":99.9899999999999948840923025272786617279052734375,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":18,\"details\":\"<p>augue vitae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Nulla egestas sed nibh ut vulputate. Nam in convallis quam<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 19:39:24\",\"updated_at\":\"2022-01-28 21:49:12\",\"status\":1,\"featured_status\":1,\"meta_title\":\"vitae eros finibus\",\"meta_description\":\"augue vitae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Nulla egestas sed nibh ut vulputate. Nam in convallis quam\",\"meta_image\":\"2022-01-27-61f2a08c32344.png\",\"translations\":[]}', 1, 150, 0, 10, 'failed', 'unpaid', '2022-01-28 21:49:53', '2022-01-28 22:20:47', 1, '', '[]', 'discount_on_product', 0),
(27, 100018, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":13,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-28 21:49:53\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-28 21:49:53', '2022-01-28 21:49:53', 1, '', '[]', 'discount_on_product', 1);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`) VALUES
(28, 100018, 102, 0, '{\"id\":102,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"vitae eros finibus\",\"slug\":\"vitae-eros-finibus-7CR0nm\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f2a08c2c131.png\\\"]\",\"thumbnail\":\"2022-01-27-61f2a08c2e0f9.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":99.9899999999999948840923025272786617279052734375,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":17,\"details\":\"<p>augue vitae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Nulla egestas sed nibh ut vulputate. Nam in convallis quam<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 19:39:24\",\"updated_at\":\"2022-01-28 21:49:53\",\"status\":1,\"featured_status\":1,\"meta_title\":\"vitae eros finibus\",\"meta_description\":\"augue vitae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Nulla egestas sed nibh ut vulputate. Nam in convallis quam\",\"meta_image\":\"2022-01-27-61f2a08c32344.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-01-28 21:49:53', '2022-01-28 21:49:53', 1, '', '[]', 'discount_on_product', 1),
(29, 100019, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":12,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-28 21:49:53\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'delivered', 'unpaid', '2022-01-28 21:49:57', '2022-01-28 22:12:43', 1, '', '[]', 'discount_on_product', 1),
(30, 100019, 102, 0, '{\"id\":102,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"vitae eros finibus\",\"slug\":\"vitae-eros-finibus-7CR0nm\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f2a08c2c131.png\\\"]\",\"thumbnail\":\"2022-01-27-61f2a08c2e0f9.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":99.9899999999999948840923025272786617279052734375,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":16,\"details\":\"<p>augue vitae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Nulla egestas sed nibh ut vulputate. Nam in convallis quam<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 19:39:24\",\"updated_at\":\"2022-01-28 21:49:53\",\"status\":1,\"featured_status\":1,\"meta_title\":\"vitae eros finibus\",\"meta_description\":\"augue vitae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Nulla egestas sed nibh ut vulputate. Nam in convallis quam\",\"meta_image\":\"2022-01-27-61f2a08c32344.png\",\"translations\":[]}', 1, 150, 0, 10, 'delivered', 'unpaid', '2022-01-28 21:49:57', '2022-01-28 22:13:10', 1, '', '[]', 'discount_on_product', 1),
(31, 100020, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":12,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-28 22:17:33\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-30 15:18:56', '2022-01-30 15:18:56', 1, '', '[]', 'discount_on_product', 1),
(32, 100021, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":11,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-30 15:18:56\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-30 15:19:19', '2022-01-30 15:19:19', 1, '', '[]', 'discount_on_product', 1),
(33, 100022, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":10,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-30 15:19:19\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'processing', 'unpaid', '2022-01-30 15:19:35', '2022-01-30 15:25:02', 1, '', '[]', 'discount_on_product', 1),
(34, 100023, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":9,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-30 15:19:35\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-30 16:26:39', '2022-01-30 16:26:39', 1, '', '[]', 'discount_on_product', 1),
(35, 100024, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":8,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-30 16:26:39\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 20:25:40', '2022-01-31 20:25:40', 1, '', '[]', 'discount_on_product', 1),
(36, 100025, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":7,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-31 20:25:40\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 20:25:55', '2022-01-31 20:25:55', 1, '', '[]', 'discount_on_product', 1),
(37, 100026, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":6,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-31 20:25:55\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 20:37:33', '2022-01-31 20:39:47', 1, '', '[]', 'discount_on_product', 0),
(38, 100027, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":6,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-31 20:39:47\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 21:49:10', '2022-01-31 21:49:10', 1, '', '[]', 'discount_on_product', 1),
(39, 100028, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":5,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-31 21:49:10\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 21:49:33', '2022-01-31 21:49:33', 1, '', '[]', 'discount_on_product', 1),
(40, 100029, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":4,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-31 21:49:33\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 21:52:18', '2022-01-31 21:52:18', 1, '', '[]', 'discount_on_product', 1),
(41, 100030, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":3,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-31 21:52:18\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 21:53:56', '2022-01-31 21:53:56', 1, '', '[]', 'discount_on_product', 1),
(42, 100031, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":2,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-31 21:53:56\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 21:57:22', '2022-01-31 21:57:22', 1, '', '[]', 'discount_on_product', 1),
(43, 100032, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":1,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-31 21:57:22\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 21:57:29', '2022-01-31 21:57:29', 1, '', '[]', 'discount_on_product', 1),
(44, 100033, 94, 0, '{\"id\":94,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-dmZsCq\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296cf2752e.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296cf2919d.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":20,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:51\",\"updated_at\":\"2022-01-27 18:57:51\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296cf2c08d.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 22:00:17', '2022-01-31 22:00:17', 1, '', '[]', 'discount_on_product', 1),
(45, 100034, 94, 0, '{\"id\":94,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-dmZsCq\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296cf2752e.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296cf2919d.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":19,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:51\",\"updated_at\":\"2022-01-31 22:00:17\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296cf2c08d.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 22:00:26', '2022-01-31 22:00:26', 1, '', '[]', 'discount_on_product', 1);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`) VALUES
(46, 100035, 94, 0, '{\"id\":94,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-dmZsCq\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296cf2752e.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296cf2919d.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":18,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:51\",\"updated_at\":\"2022-01-31 22:00:26\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296cf2c08d.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 22:00:37', '2022-01-31 22:00:37', 1, '', '[]', 'discount_on_product', 1),
(47, 100036, 94, 0, '{\"id\":94,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-dmZsCq\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296cf2752e.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296cf2919d.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":17,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:51\",\"updated_at\":\"2022-01-31 22:00:37\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296cf2c08d.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 22:00:53', '2022-01-31 22:10:30', 1, '', '[]', 'discount_on_product', 0),
(48, 100037, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":0,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-31 21:57:29\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 22:14:41', '2022-01-31 22:14:41', 1, '', '[]', 'discount_on_product', 1),
(49, 100038, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":-1,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-31 22:14:41\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 22:14:51', '2022-01-31 22:14:51', 1, '', '[]', 'discount_on_product', 1),
(50, 100039, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":-2,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-31 22:14:51\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 22:15:10', '2022-01-31 22:15:10', 1, '', '[]', 'discount_on_product', 1),
(51, 100040, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":-3,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-31 22:15:10\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 22:15:29', '2022-01-31 22:15:29', 1, '', '[]', 'discount_on_product', 1),
(52, 100041, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":-4,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-31 22:15:29\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 22:15:41', '2022-01-31 22:15:41', 1, '', '[]', 'discount_on_product', 1),
(53, 100042, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":-5,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-31 22:15:41\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 22:15:55', '2022-01-31 22:15:55', 1, '', '[]', 'discount_on_product', 1),
(54, 100043, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":-6,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-31 22:15:55\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 22:16:06', '2022-01-31 22:16:06', 1, '', '[]', 'discount_on_product', 1),
(55, 100044, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":-7,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-31 22:16:06\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 22:16:06', '2022-01-31 22:16:06', 1, '', '[]', 'discount_on_product', 1),
(56, 100045, 93, 0, '{\"id\":93,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Contrary to popular belief\",\"slug\":\"contrary-to-popular-belief-3DAZgC\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f296acd7ddd.png\\\"]\",\"thumbnail\":\"2022-01-27-61f296acdbc72.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":100,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":-8,\"details\":\"<p>What is Lorem Ipsum?<br \\/>\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\\r\\n\\r\\n<p>Why do we use it?<br \\/>\\r\\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 18:57:16\",\"updated_at\":\"2022-01-31 22:16:06\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Contrary to popular belief\",\"meta_description\":\"What is Lorem Ipsum?\\r\\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown \",\"meta_image\":\"2022-01-27-61f296ace2190.png\",\"translations\":[]}', 1, 100, 0, 10, 'pending', 'unpaid', '2022-01-31 22:16:15', '2022-01-31 22:16:15', 1, '', '[]', 'discount_on_product', 1),
(57, 100046, 137, 0, '{\"id\":137,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Pellentesque\",\"slug\":\"pellentesque-1qh4D3\",\"category_ids\":\"[{\\\"id\\\":\\\"29\\\",\\\"name\\\":\\\"Gifts\\\",\\\"slug\\\":\\\"gifts\\\",\\\"position\\\":1},{\\\"id\\\":\\\"40\\\",\\\"name\\\":\\\"Mother Day\\\",\\\"slug\\\":\\\"mother-day\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3afade9ab0.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3afadeb9cc.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":99,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":21,\"details\":\"<p>In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero, laoreet vitae volutpat id, lobortis luctus arcu. Nulla vestibulum justo sed mauris rutrum, vel iaculis velit porta. Curabitur vestibulum commodo accumsan.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 14:56:13\",\"updated_at\":\"2022-01-28 14:56:13\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Pellentesque\",\"meta_description\":\"In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero, laoreet vitae volutpat id, lobortis luctus arcu. Nulla vestibulum \",\"meta_image\":\"2022-01-28-61f3afadef071.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-02 16:18:56', '2022-02-02 16:18:56', 1, '', '[]', 'discount_on_product', 1),
(58, 100046, 139, 0, '{\"id\":139,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Morbi\",\"slug\":\"morbi-OahV5q\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"name\\\":\\\"Candels\\\",\\\"slug\\\":\\\"candels\\\",\\\"position\\\":1},{\\\"id\\\":\\\"42\\\",\\\"name\\\":\\\"Dinner Candels\\\",\\\"slug\\\":\\\"dinner-candels\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b090bb6e7.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b090be8e4.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":11,\"details\":\"<p>Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:00:00\",\"updated_at\":\"2022-01-28 20:42:24\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Morbi\",\"meta_description\":\"Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis\",\"meta_image\":\"2022-01-28-61f3b090c6f65.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-02 16:18:56', '2022-02-02 16:18:56', 1, '', '[]', 'discount_on_product', 1),
(59, 100047, 137, 0, '{\"id\":137,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Pellentesque\",\"slug\":\"pellentesque-1qh4D3\",\"category_ids\":\"[{\\\"id\\\":\\\"29\\\",\\\"name\\\":\\\"Gifts\\\",\\\"slug\\\":\\\"gifts\\\",\\\"position\\\":1},{\\\"id\\\":\\\"40\\\",\\\"name\\\":\\\"Mother Day\\\",\\\"slug\\\":\\\"mother-day\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3afade9ab0.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3afadeb9cc.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":99,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":20,\"details\":\"<p>In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero, laoreet vitae volutpat id, lobortis luctus arcu. Nulla vestibulum justo sed mauris rutrum, vel iaculis velit porta. Curabitur vestibulum commodo accumsan.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 14:56:13\",\"updated_at\":\"2022-02-02 16:18:56\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Pellentesque\",\"meta_description\":\"In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero, laoreet vitae volutpat id, lobortis luctus arcu. Nulla vestibulum \",\"meta_image\":\"2022-01-28-61f3afadef071.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-02 16:19:19', '2022-02-02 16:19:19', 1, '', '[]', 'discount_on_product', 1),
(60, 100047, 139, 0, '{\"id\":139,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Morbi\",\"slug\":\"morbi-OahV5q\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"name\\\":\\\"Candels\\\",\\\"slug\\\":\\\"candels\\\",\\\"position\\\":1},{\\\"id\\\":\\\"42\\\",\\\"name\\\":\\\"Dinner Candels\\\",\\\"slug\\\":\\\"dinner-candels\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b090bb6e7.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b090be8e4.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":10,\"details\":\"<p>Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:00:00\",\"updated_at\":\"2022-02-02 16:18:56\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Morbi\",\"meta_description\":\"Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis\",\"meta_image\":\"2022-01-28-61f3b090c6f65.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-02 16:19:19', '2022-02-02 16:19:19', 1, '', '[]', 'discount_on_product', 1),
(61, 100048, 137, 0, '{\"id\":137,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Pellentesque\",\"slug\":\"pellentesque-1qh4D3\",\"category_ids\":\"[{\\\"id\\\":\\\"29\\\",\\\"name\\\":\\\"Gifts\\\",\\\"slug\\\":\\\"gifts\\\",\\\"position\\\":1},{\\\"id\\\":\\\"40\\\",\\\"name\\\":\\\"Mother Day\\\",\\\"slug\\\":\\\"mother-day\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3afade9ab0.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3afadeb9cc.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":99,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":19,\"details\":\"<p>In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero, laoreet vitae volutpat id, lobortis luctus arcu. Nulla vestibulum justo sed mauris rutrum, vel iaculis velit porta. Curabitur vestibulum commodo accumsan.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 14:56:13\",\"updated_at\":\"2022-02-02 16:19:19\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Pellentesque\",\"meta_description\":\"In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero, laoreet vitae volutpat id, lobortis luctus arcu. Nulla vestibulum \",\"meta_image\":\"2022-01-28-61f3afadef071.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-02 16:36:28', '2022-02-02 16:36:28', 1, '', '[]', 'discount_on_product', 1),
(62, 100048, 139, 0, '{\"id\":139,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Morbi\",\"slug\":\"morbi-OahV5q\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"name\\\":\\\"Candels\\\",\\\"slug\\\":\\\"candels\\\",\\\"position\\\":1},{\\\"id\\\":\\\"42\\\",\\\"name\\\":\\\"Dinner Candels\\\",\\\"slug\\\":\\\"dinner-candels\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b090bb6e7.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b090be8e4.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":9,\"details\":\"<p>Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:00:00\",\"updated_at\":\"2022-02-02 16:19:19\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Morbi\",\"meta_description\":\"Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis\",\"meta_image\":\"2022-01-28-61f3b090c6f65.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-02 16:36:28', '2022-02-02 16:36:28', 1, '', '[]', 'discount_on_product', 1),
(63, 100049, 137, 0, '{\"id\":137,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Pellentesque\",\"slug\":\"pellentesque-1qh4D3\",\"category_ids\":\"[{\\\"id\\\":\\\"29\\\",\\\"name\\\":\\\"Gifts\\\",\\\"slug\\\":\\\"gifts\\\",\\\"position\\\":1},{\\\"id\\\":\\\"40\\\",\\\"name\\\":\\\"Mother Day\\\",\\\"slug\\\":\\\"mother-day\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3afade9ab0.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3afadeb9cc.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":99,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":18,\"details\":\"<p>In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero, laoreet vitae volutpat id, lobortis luctus arcu. Nulla vestibulum justo sed mauris rutrum, vel iaculis velit porta. Curabitur vestibulum commodo accumsan.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 14:56:13\",\"updated_at\":\"2022-02-02 16:36:28\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Pellentesque\",\"meta_description\":\"In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero, laoreet vitae volutpat id, lobortis luctus arcu. Nulla vestibulum \",\"meta_image\":\"2022-01-28-61f3afadef071.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-02 16:36:41', '2022-02-02 16:36:41', 1, '', '[]', 'discount_on_product', 1),
(64, 100049, 139, 0, '{\"id\":139,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Morbi\",\"slug\":\"morbi-OahV5q\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"name\\\":\\\"Candels\\\",\\\"slug\\\":\\\"candels\\\",\\\"position\\\":1},{\\\"id\\\":\\\"42\\\",\\\"name\\\":\\\"Dinner Candels\\\",\\\"slug\\\":\\\"dinner-candels\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b090bb6e7.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b090be8e4.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":8,\"details\":\"<p>Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:00:00\",\"updated_at\":\"2022-02-02 16:36:28\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Morbi\",\"meta_description\":\"Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis\",\"meta_image\":\"2022-01-28-61f3b090c6f65.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-02 16:36:41', '2022-02-02 16:36:41', 1, '', '[]', 'discount_on_product', 1),
(65, 100050, 137, 0, '{\"id\":137,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Pellentesque\",\"slug\":\"pellentesque-1qh4D3\",\"category_ids\":\"[{\\\"id\\\":\\\"29\\\",\\\"name\\\":\\\"Gifts\\\",\\\"slug\\\":\\\"gifts\\\",\\\"position\\\":1},{\\\"id\\\":\\\"40\\\",\\\"name\\\":\\\"Mother Day\\\",\\\"slug\\\":\\\"mother-day\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3afade9ab0.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3afadeb9cc.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":99,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":17,\"details\":\"<p>In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero, laoreet vitae volutpat id, lobortis luctus arcu. Nulla vestibulum justo sed mauris rutrum, vel iaculis velit porta. Curabitur vestibulum commodo accumsan.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 14:56:13\",\"updated_at\":\"2022-02-02 16:36:41\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Pellentesque\",\"meta_description\":\"In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero, laoreet vitae volutpat id, lobortis luctus arcu. Nulla vestibulum \",\"meta_image\":\"2022-01-28-61f3afadef071.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-02 16:37:13', '2022-02-02 16:37:13', 1, '', '[]', 'discount_on_product', 1),
(66, 100050, 139, 0, '{\"id\":139,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Morbi\",\"slug\":\"morbi-OahV5q\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"name\\\":\\\"Candels\\\",\\\"slug\\\":\\\"candels\\\",\\\"position\\\":1},{\\\"id\\\":\\\"42\\\",\\\"name\\\":\\\"Dinner Candels\\\",\\\"slug\\\":\\\"dinner-candels\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b090bb6e7.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b090be8e4.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":7,\"details\":\"<p>Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:00:00\",\"updated_at\":\"2022-02-02 16:36:41\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Morbi\",\"meta_description\":\"Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis\",\"meta_image\":\"2022-01-28-61f3b090c6f65.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-02 16:37:13', '2022-02-02 16:37:13', 1, '', '[]', 'discount_on_product', 1);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`) VALUES
(67, 100051, 137, 0, '{\"id\":137,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Pellentesque\",\"slug\":\"pellentesque-1qh4D3\",\"category_ids\":\"[{\\\"id\\\":\\\"29\\\",\\\"name\\\":\\\"Gifts\\\",\\\"slug\\\":\\\"gifts\\\",\\\"position\\\":1},{\\\"id\\\":\\\"40\\\",\\\"name\\\":\\\"Mother Day\\\",\\\"slug\\\":\\\"mother-day\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3afade9ab0.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3afadeb9cc.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":99,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":16,\"details\":\"<p>In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero, laoreet vitae volutpat id, lobortis luctus arcu. Nulla vestibulum justo sed mauris rutrum, vel iaculis velit porta. Curabitur vestibulum commodo accumsan.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 14:56:13\",\"updated_at\":\"2022-02-02 16:37:13\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Pellentesque\",\"meta_description\":\"In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero, laoreet vitae volutpat id, lobortis luctus arcu. Nulla vestibulum \",\"meta_image\":\"2022-01-28-61f3afadef071.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-02 16:37:55', '2022-02-02 16:37:55', 1, '', '[]', 'discount_on_product', 1),
(68, 100051, 139, 0, '{\"id\":139,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Morbi\",\"slug\":\"morbi-OahV5q\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"name\\\":\\\"Candels\\\",\\\"slug\\\":\\\"candels\\\",\\\"position\\\":1},{\\\"id\\\":\\\"42\\\",\\\"name\\\":\\\"Dinner Candels\\\",\\\"slug\\\":\\\"dinner-candels\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b090bb6e7.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b090be8e4.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":6,\"details\":\"<p>Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:00:00\",\"updated_at\":\"2022-02-02 16:37:13\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Morbi\",\"meta_description\":\"Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis\",\"meta_image\":\"2022-01-28-61f3b090c6f65.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-02 16:37:55', '2022-02-02 16:37:55', 1, '', '[]', 'discount_on_product', 1),
(69, 100052, 139, 0, '{\"id\":139,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Morbi\",\"slug\":\"morbi-OahV5q\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"name\\\":\\\"Candels\\\",\\\"slug\\\":\\\"candels\\\",\\\"position\\\":1},{\\\"id\\\":\\\"42\\\",\\\"name\\\":\\\"Dinner Candels\\\",\\\"slug\\\":\\\"dinner-candels\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b090bb6e7.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b090be8e4.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":5,\"details\":\"<p>Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:00:00\",\"updated_at\":\"2022-02-02 16:37:55\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Morbi\",\"meta_description\":\"Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis\",\"meta_image\":\"2022-01-28-61f3b090c6f65.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-02 18:55:18', '2022-02-02 18:55:18', 1, '', '[]', 'discount_on_product', 1),
(70, 100052, 142, 0, '{\"id\":142,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Aliquam\",\"slug\":\"aliquam-Pys5T1\",\"category_ids\":\"[{\\\"id\\\":\\\"29\\\",\\\"name\\\":\\\"Gifts\\\",\\\"slug\\\":\\\"gifts\\\",\\\"position\\\":1},{\\\"id\\\":\\\"40\\\",\\\"name\\\":\\\"Mother Day\\\",\\\"slug\\\":\\\"mother-day\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b1c30b04d.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b1c30cfd2.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":10,\"details\":\"<p>Morbi id ipsum lacinia, viverra lorem quis, tempor turpis. In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla.&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:05:07\",\"updated_at\":\"2022-01-28 20:42:21\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Aliquam\",\"meta_description\":\"Morbi id ipsum lacinia, viverra lorem quis, tempor turpis. In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla.\",\"meta_image\":\"2022-01-28-61f3b1c310f08.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-02 18:55:18', '2022-02-02 18:55:18', 1, '', '[]', 'discount_on_product', 1),
(71, 100053, 144, 0, '{\"id\":144,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Air balloon\",\"slug\":\"air-balloon-kdGiR9\",\"category_ids\":\"[{\\\"id\\\":\\\"48\\\",\\\"name\\\":\\\"Baby\\\",\\\"slug\\\":\\\"baby\\\",\\\"position\\\":1},{\\\"id\\\":\\\"49\\\",\\\"name\\\":\\\"Born Collection\\\",\\\"slug\\\":\\\"born-collection\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-09-6203952ed65b4.png\\\"]\",\"thumbnail\":\"2022-02-09-6203952ed729a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":45,\"purchase_price\":45,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":50,\"details\":\"<p>Air balloon with blue \\/ pink color and having&nbsp; blue , pink ribbon and blue \\/ white \\/ marble box<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-09 16:19:26\",\"updated_at\":\"2022-02-09 16:19:26\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Air Balloon\",\"meta_description\":\"Air balloon with blue \\/ pink color and having\\u00a0 blue , pink ribbon and blue \\/ white \\/ marble box.\",\"meta_image\":\"2022-02-09-6203952ed9306.png\",\"translations\":[]}', 1, 45, 0, 0, 'pending', 'unpaid', '2022-02-14 20:16:22', '2022-02-14 20:16:22', 1, '', '[]', 'discount_on_product', 1),
(72, 100054, 144, 0, '{\"id\":144,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Air balloon\",\"slug\":\"air-balloon-kdGiR9\",\"category_ids\":\"[{\\\"id\\\":\\\"48\\\",\\\"name\\\":\\\"Baby\\\",\\\"slug\\\":\\\"baby\\\",\\\"position\\\":1},{\\\"id\\\":\\\"49\\\",\\\"name\\\":\\\"Born Collection\\\",\\\"slug\\\":\\\"born-collection\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-09-6203952ed65b4.png\\\"]\",\"thumbnail\":\"2022-02-09-6203952ed729a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":45,\"purchase_price\":45,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":49,\"details\":\"<p>Air balloon with blue \\/ pink color and having&nbsp; blue , pink ribbon and blue \\/ white \\/ marble box<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-09 16:19:26\",\"updated_at\":\"2022-02-14 20:16:22\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Air Balloon\",\"meta_description\":\"Air balloon with blue \\/ pink color and having\\u00a0 blue , pink ribbon and blue \\/ white \\/ marble box.\",\"meta_image\":\"2022-02-09-6203952ed9306.png\",\"translations\":[]}', 1, 45, 0, 0, 'pending', 'unpaid', '2022-02-14 20:16:52', '2022-02-14 20:16:52', 1, '', '[]', 'discount_on_product', 1),
(73, 100055, 144, 0, '{\"id\":144,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Air balloon\",\"slug\":\"air-balloon-kdGiR9\",\"category_ids\":\"[{\\\"id\\\":\\\"48\\\",\\\"name\\\":\\\"Baby\\\",\\\"slug\\\":\\\"baby\\\",\\\"position\\\":1},{\\\"id\\\":\\\"49\\\",\\\"name\\\":\\\"Born Collection\\\",\\\"slug\\\":\\\"born-collection\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-09-6203952ed65b4.png\\\"]\",\"thumbnail\":\"2022-02-09-6203952ed729a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":45,\"purchase_price\":45,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":48,\"details\":\"<p>Air balloon with blue \\/ pink color and having&nbsp; blue , pink ribbon and blue \\/ white \\/ marble box<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-09 16:19:26\",\"updated_at\":\"2022-02-14 20:16:52\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Air Balloon\",\"meta_description\":\"Air balloon with blue \\/ pink color and having\\u00a0 blue , pink ribbon and blue \\/ white \\/ marble box.\",\"meta_image\":\"2022-02-09-6203952ed9306.png\",\"translations\":[]}', 1, 45, 0, 0, 'pending', 'unpaid', '2022-02-14 20:17:07', '2022-02-14 20:17:07', 1, '', '[]', 'discount_on_product', 1),
(74, 100056, 144, 0, '{\"id\":144,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Air balloon\",\"slug\":\"air-balloon-kdGiR9\",\"category_ids\":\"[{\\\"id\\\":\\\"48\\\",\\\"name\\\":\\\"Baby\\\",\\\"slug\\\":\\\"baby\\\",\\\"position\\\":1},{\\\"id\\\":\\\"49\\\",\\\"name\\\":\\\"Born Collection\\\",\\\"slug\\\":\\\"born-collection\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-09-6203952ed65b4.png\\\"]\",\"thumbnail\":\"2022-02-09-6203952ed729a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":45,\"purchase_price\":45,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":47,\"details\":\"<p>Air balloon with blue \\/ pink color and having&nbsp; blue , pink ribbon and blue \\/ white \\/ marble box<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-09 16:19:26\",\"updated_at\":\"2022-02-14 20:17:07\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Air Balloon\",\"meta_description\":\"Air balloon with blue \\/ pink color and having\\u00a0 blue , pink ribbon and blue \\/ white \\/ marble box.\",\"meta_image\":\"2022-02-09-6203952ed9306.png\",\"translations\":[]}', 1, 45, 0, 0, 'pending', 'unpaid', '2022-02-14 20:21:57', '2022-02-14 20:21:57', 1, '', '[]', 'discount_on_product', 1),
(75, 100057, 144, 0, '{\"id\":144,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Air balloon\",\"slug\":\"air-balloon-kdGiR9\",\"category_ids\":\"[{\\\"id\\\":\\\"48\\\",\\\"name\\\":\\\"Baby\\\",\\\"slug\\\":\\\"baby\\\",\\\"position\\\":1},{\\\"id\\\":\\\"49\\\",\\\"name\\\":\\\"Born Collection\\\",\\\"slug\\\":\\\"born-collection\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-09-6203952ed65b4.png\\\"]\",\"thumbnail\":\"2022-02-09-6203952ed729a.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":45,\"purchase_price\":45,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":46,\"details\":\"<p>Air balloon with blue \\/ pink color and having&nbsp; blue , pink ribbon and blue \\/ white \\/ marble box<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-09 16:19:26\",\"updated_at\":\"2022-02-14 20:21:57\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Air Balloon\",\"meta_description\":\"Air balloon with blue \\/ pink color and having\\u00a0 blue , pink ribbon and blue \\/ white \\/ marble box.\",\"meta_image\":\"2022-02-09-6203952ed9306.png\",\"translations\":[]}', 1, 45, 0, 0, 'pending', 'unpaid', '2022-02-14 20:28:16', '2022-02-14 20:28:16', 1, '', '[]', 'discount_on_product', 1),
(76, 100057, 141, 0, '{\"id\":141,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"elementum\",\"slug\":\"elementum-mzDSq3\",\"category_ids\":\"[{\\\"id\\\":\\\"31\\\",\\\"name\\\":\\\"Soap\\\",\\\"slug\\\":\\\"soap\\\",\\\"position\\\":1},{\\\"id\\\":\\\"43\\\",\\\"name\\\":\\\"Pink Soap\\\",\\\"slug\\\":\\\"pink-soap\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b16d54dcc.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b16d56745.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":11,\"details\":\"<p>Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio placerat. Praesent imperdiet bibendum erat nec suscipit. Sed placerat sapien nibh, vel imperdiet metus condimentum sit amet. Pellentesque venenatis accumsan libero vel elementum.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:03:41\",\"updated_at\":\"2022-01-28 20:42:22\",\"status\":1,\"featured_status\":1,\"meta_title\":\"elementum\",\"meta_description\":\"Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio plac\",\"meta_image\":\"2022-01-28-61f3b16d59640.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-14 20:28:16', '2022-02-14 20:28:16', 1, '', '[]', 'discount_on_product', 1),
(77, 100058, 141, 0, '{\"id\":141,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"elementum\",\"slug\":\"elementum-mzDSq3\",\"category_ids\":\"[{\\\"id\\\":\\\"31\\\",\\\"name\\\":\\\"Soap\\\",\\\"slug\\\":\\\"soap\\\",\\\"position\\\":1},{\\\"id\\\":\\\"43\\\",\\\"name\\\":\\\"Pink Soap\\\",\\\"slug\\\":\\\"pink-soap\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b16d54dcc.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b16d56745.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":10,\"details\":\"<p>Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio placerat. Praesent imperdiet bibendum erat nec suscipit. Sed placerat sapien nibh, vel imperdiet metus condimentum sit amet. Pellentesque venenatis accumsan libero vel elementum.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:03:41\",\"updated_at\":\"2022-02-14 20:28:16\",\"status\":1,\"featured_status\":1,\"meta_title\":\"elementum\",\"meta_description\":\"Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio plac\",\"meta_image\":\"2022-01-28-61f3b16d59640.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-15 14:13:31', '2022-02-15 14:13:31', 1, '', '[]', 'discount_on_product', 1),
(78, 100059, 141, 0, '{\"id\":141,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"elementum\",\"slug\":\"elementum-mzDSq3\",\"category_ids\":\"[{\\\"id\\\":\\\"31\\\",\\\"name\\\":\\\"Soap\\\",\\\"slug\\\":\\\"soap\\\",\\\"position\\\":1},{\\\"id\\\":\\\"43\\\",\\\"name\\\":\\\"Pink Soap\\\",\\\"slug\\\":\\\"pink-soap\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b16d54dcc.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b16d56745.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":9,\"details\":\"<p>Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio placerat. Praesent imperdiet bibendum erat nec suscipit. Sed placerat sapien nibh, vel imperdiet metus condimentum sit amet. Pellentesque venenatis accumsan libero vel elementum.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:03:41\",\"updated_at\":\"2022-02-15 14:13:31\",\"status\":1,\"featured_status\":1,\"meta_title\":\"elementum\",\"meta_description\":\"Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio plac\",\"meta_image\":\"2022-01-28-61f3b16d59640.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-15 15:11:35', '2022-02-15 15:11:35', 1, '', '[]', 'discount_on_product', 1),
(79, 100060, 141, 0, '{\"id\":141,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"elementum\",\"slug\":\"elementum-mzDSq3\",\"category_ids\":\"[{\\\"id\\\":\\\"31\\\",\\\"name\\\":\\\"Soap\\\",\\\"slug\\\":\\\"soap\\\",\\\"position\\\":1},{\\\"id\\\":\\\"43\\\",\\\"name\\\":\\\"Pink Soap\\\",\\\"slug\\\":\\\"pink-soap\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b16d54dcc.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b16d56745.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":8,\"details\":\"<p>Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio placerat. Praesent imperdiet bibendum erat nec suscipit. Sed placerat sapien nibh, vel imperdiet metus condimentum sit amet. Pellentesque venenatis accumsan libero vel elementum.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:03:41\",\"updated_at\":\"2022-02-15 15:11:35\",\"status\":1,\"featured_status\":1,\"meta_title\":\"elementum\",\"meta_description\":\"Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio plac\",\"meta_image\":\"2022-01-28-61f3b16d59640.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-15 15:11:41', '2022-02-15 15:11:41', 1, '', '[]', 'discount_on_product', 1),
(80, 100061, 141, 0, '{\"id\":141,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"elementum\",\"slug\":\"elementum-mzDSq3\",\"category_ids\":\"[{\\\"id\\\":\\\"31\\\",\\\"name\\\":\\\"Soap\\\",\\\"slug\\\":\\\"soap\\\",\\\"position\\\":1},{\\\"id\\\":\\\"43\\\",\\\"name\\\":\\\"Pink Soap\\\",\\\"slug\\\":\\\"pink-soap\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b16d54dcc.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b16d56745.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":7,\"details\":\"<p>Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio placerat. Praesent imperdiet bibendum erat nec suscipit. Sed placerat sapien nibh, vel imperdiet metus condimentum sit amet. Pellentesque venenatis accumsan libero vel elementum.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:03:41\",\"updated_at\":\"2022-02-15 15:11:41\",\"status\":1,\"featured_status\":1,\"meta_title\":\"elementum\",\"meta_description\":\"Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio plac\",\"meta_image\":\"2022-01-28-61f3b16d59640.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-15 15:12:28', '2022-02-15 15:12:28', 1, '', '[]', 'discount_on_product', 1),
(81, 100062, 141, 0, '{\"id\":141,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"elementum\",\"slug\":\"elementum-mzDSq3\",\"category_ids\":\"[{\\\"id\\\":\\\"31\\\",\\\"name\\\":\\\"Soap\\\",\\\"slug\\\":\\\"soap\\\",\\\"position\\\":1},{\\\"id\\\":\\\"43\\\",\\\"name\\\":\\\"Pink Soap\\\",\\\"slug\\\":\\\"pink-soap\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b16d54dcc.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b16d56745.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":6,\"details\":\"<p>Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio placerat. Praesent imperdiet bibendum erat nec suscipit. Sed placerat sapien nibh, vel imperdiet metus condimentum sit amet. Pellentesque venenatis accumsan libero vel elementum.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:03:41\",\"updated_at\":\"2022-02-15 15:12:28\",\"status\":1,\"featured_status\":1,\"meta_title\":\"elementum\",\"meta_description\":\"Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio plac\",\"meta_image\":\"2022-01-28-61f3b16d59640.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-15 15:13:42', '2022-02-15 15:13:42', 1, '', '[]', 'discount_on_product', 1),
(82, 100063, 141, 0, '{\"id\":141,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"elementum\",\"slug\":\"elementum-mzDSq3\",\"category_ids\":\"[{\\\"id\\\":\\\"31\\\",\\\"name\\\":\\\"Soap\\\",\\\"slug\\\":\\\"soap\\\",\\\"position\\\":1},{\\\"id\\\":\\\"43\\\",\\\"name\\\":\\\"Pink Soap\\\",\\\"slug\\\":\\\"pink-soap\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b16d54dcc.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b16d56745.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":5,\"details\":\"<p>Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio placerat. Praesent imperdiet bibendum erat nec suscipit. Sed placerat sapien nibh, vel imperdiet metus condimentum sit amet. Pellentesque venenatis accumsan libero vel elementum.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:03:41\",\"updated_at\":\"2022-02-15 15:13:42\",\"status\":1,\"featured_status\":1,\"meta_title\":\"elementum\",\"meta_description\":\"Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio plac\",\"meta_image\":\"2022-01-28-61f3b16d59640.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-15 15:38:03', '2022-02-15 15:38:03', 1, '', '[]', 'discount_on_product', 1),
(83, 100063, 139, 0, '{\"id\":139,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Morbi\",\"slug\":\"morbi-OahV5q\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"name\\\":\\\"Candels\\\",\\\"slug\\\":\\\"candels\\\",\\\"position\\\":1},{\\\"id\\\":\\\"42\\\",\\\"name\\\":\\\"Dinner Candels\\\",\\\"slug\\\":\\\"dinner-candels\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b090bb6e7.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b090be8e4.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":4,\"details\":\"<p>Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:00:00\",\"updated_at\":\"2022-02-02 18:55:18\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Morbi\",\"meta_description\":\"Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis\",\"meta_image\":\"2022-01-28-61f3b090c6f65.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-15 15:38:03', '2022-02-15 15:38:03', 1, '', '[]', 'discount_on_product', 1),
(84, 100064, 141, 0, '{\"id\":141,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"elementum\",\"slug\":\"elementum-mzDSq3\",\"category_ids\":\"[{\\\"id\\\":\\\"31\\\",\\\"name\\\":\\\"Soap\\\",\\\"slug\\\":\\\"soap\\\",\\\"position\\\":1},{\\\"id\\\":\\\"43\\\",\\\"name\\\":\\\"Pink Soap\\\",\\\"slug\\\":\\\"pink-soap\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b16d54dcc.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b16d56745.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":4,\"details\":\"<p>Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio placerat. Praesent imperdiet bibendum erat nec suscipit. Sed placerat sapien nibh, vel imperdiet metus condimentum sit amet. Pellentesque venenatis accumsan libero vel elementum.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:03:41\",\"updated_at\":\"2022-02-15 15:38:03\",\"status\":1,\"featured_status\":1,\"meta_title\":\"elementum\",\"meta_description\":\"Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio plac\",\"meta_image\":\"2022-01-28-61f3b16d59640.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-15 15:38:59', '2022-02-15 15:38:59', 1, '', '[]', 'discount_on_product', 1),
(85, 100064, 139, 0, '{\"id\":139,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Morbi\",\"slug\":\"morbi-OahV5q\",\"category_ids\":\"[{\\\"id\\\":\\\"30\\\",\\\"name\\\":\\\"Candels\\\",\\\"slug\\\":\\\"candels\\\",\\\"position\\\":1},{\\\"id\\\":\\\"42\\\",\\\"name\\\":\\\"Dinner Candels\\\",\\\"slug\\\":\\\"dinner-candels\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b090bb6e7.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b090be8e4.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":3,\"details\":\"<p>Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:00:00\",\"updated_at\":\"2022-02-15 15:38:03\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Morbi\",\"meta_description\":\"Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis\",\"meta_image\":\"2022-01-28-61f3b090c6f65.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-15 15:38:59', '2022-02-15 15:38:59', 1, '', '[]', 'discount_on_product', 1),
(86, 100065, 137, 0, '{\"id\":137,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Pellentesque\",\"slug\":\"pellentesque-1qh4D3\",\"category_ids\":\"[{\\\"id\\\":\\\"29\\\",\\\"name\\\":\\\"Gifts\\\",\\\"slug\\\":\\\"gifts\\\",\\\"position\\\":1},{\\\"id\\\":\\\"40\\\",\\\"name\\\":\\\"Mother Day\\\",\\\"slug\\\":\\\"mother-day\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3afade9ab0.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3afadeb9cc.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":99,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":15,\"details\":\"<p>In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero, laoreet vitae volutpat id, lobortis luctus arcu. Nulla vestibulum justo sed mauris rutrum, vel iaculis velit porta. Curabitur vestibulum commodo accumsan.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 14:56:13\",\"updated_at\":\"2022-02-02 16:37:55\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Pellentesque\",\"meta_description\":\"In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero, laoreet vitae volutpat id, lobortis luctus arcu. Nulla vestibulum \",\"meta_image\":\"2022-01-28-61f3afadef071.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-15 15:42:20', '2022-02-15 15:42:20', 1, '', '[]', 'discount_on_product', 1),
(87, 100066, 141, 0, '{\"id\":141,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"elementum\",\"slug\":\"elementum-mzDSq3\",\"category_ids\":\"[{\\\"id\\\":\\\"31\\\",\\\"name\\\":\\\"Soap\\\",\\\"slug\\\":\\\"soap\\\",\\\"position\\\":1},{\\\"id\\\":\\\"43\\\",\\\"name\\\":\\\"Pink Soap\\\",\\\"slug\\\":\\\"pink-soap\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b16d54dcc.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b16d56745.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":3,\"details\":\"<p>Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio placerat. Praesent imperdiet bibendum erat nec suscipit. Sed placerat sapien nibh, vel imperdiet metus condimentum sit amet. Pellentesque venenatis accumsan libero vel elementum.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:03:41\",\"updated_at\":\"2022-02-15 15:38:59\",\"status\":1,\"featured_status\":1,\"meta_title\":\"elementum\",\"meta_description\":\"Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio plac\",\"meta_image\":\"2022-01-28-61f3b16d59640.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-15 15:45:46', '2022-02-15 15:45:46', 1, '', '[]', 'discount_on_product', 1),
(88, 100067, 141, 0, '{\"id\":141,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"elementum\",\"slug\":\"elementum-mzDSq3\",\"category_ids\":\"[{\\\"id\\\":\\\"31\\\",\\\"name\\\":\\\"Soap\\\",\\\"slug\\\":\\\"soap\\\",\\\"position\\\":1},{\\\"id\\\":\\\"43\\\",\\\"name\\\":\\\"Pink Soap\\\",\\\"slug\\\":\\\"pink-soap\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b16d54dcc.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b16d56745.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":2,\"details\":\"<p>Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio placerat. Praesent imperdiet bibendum erat nec suscipit. Sed placerat sapien nibh, vel imperdiet metus condimentum sit amet. Pellentesque venenatis accumsan libero vel elementum.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:03:41\",\"updated_at\":\"2022-02-15 15:45:46\",\"status\":1,\"featured_status\":1,\"meta_title\":\"elementum\",\"meta_description\":\"Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio plac\",\"meta_image\":\"2022-01-28-61f3b16d59640.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-15 15:46:10', '2022-02-15 15:46:10', 1, '', '[]', 'discount_on_product', 1),
(89, 100068, 141, 0, '{\"id\":141,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"elementum\",\"slug\":\"elementum-mzDSq3\",\"category_ids\":\"[{\\\"id\\\":\\\"31\\\",\\\"name\\\":\\\"Soap\\\",\\\"slug\\\":\\\"soap\\\",\\\"position\\\":1},{\\\"id\\\":\\\"43\\\",\\\"name\\\":\\\"Pink Soap\\\",\\\"slug\\\":\\\"pink-soap\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-28-61f3b16d54dcc.png\\\"]\",\"thumbnail\":\"2022-01-28-61f3b16d56745.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":100,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":1,\"details\":\"<p>Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio placerat. Praesent imperdiet bibendum erat nec suscipit. Sed placerat sapien nibh, vel imperdiet metus condimentum sit amet. Pellentesque venenatis accumsan libero vel elementum.<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-28 15:03:41\",\"updated_at\":\"2022-02-15 15:46:10\",\"status\":1,\"featured_status\":1,\"meta_title\":\"elementum\",\"meta_description\":\"Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio plac\",\"meta_image\":\"2022-01-28-61f3b16d59640.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-15 16:08:46', '2022-02-15 16:08:46', 1, '', '[]', 'discount_on_product', 1),
(90, 100068, 103, 0, '{\"id\":103,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"tus et ultrices posue\",\"slug\":\"tus-et-ultrices-posue-H6pD3P\",\"category_ids\":\"[{\\\"id\\\":\\\"28\\\",\\\"name\\\":\\\"Souvenir\\\",\\\"slug\\\":\\\"souvenir\\\",\\\"position\\\":1},{\\\"id\\\":\\\"34\\\",\\\"name\\\":\\\"Baby Shower\\\",\\\"slug\\\":\\\"baby-shower\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-01-27-61f2a0de793e5.png\\\"]\",\"thumbnail\":\"2022-01-27-61f2a0de7ae44.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":150,\"purchase_price\":99.9899999999999948840923025272786617279052734375,\"tax\":0,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"flat\",\"current_stock\":21,\"details\":\"<p>t dui, ut congue nisi. Etiam ut augue vitae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Null<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-01-27 19:40:46\",\"updated_at\":\"2022-01-27 19:40:46\",\"status\":1,\"featured_status\":1,\"meta_title\":\"tus et ultrices posue\",\"meta_description\":\"t dui, ut congue nisi. Etiam ut augue vitae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Null\",\"meta_image\":\"2022-01-27-61f2a0de7e33d.png\",\"translations\":[]}', 1, 150, 0, 10, 'pending', 'unpaid', '2022-02-15 16:08:46', '2022-02-15 16:08:46', 1, '', '[]', 'discount_on_product', 1),
(91, 100069, 162, 0, '{\"id\":162,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"test\",\"slug\":\"test-RbQjSq\",\"category_ids\":\"[{\\\"id\\\":\\\"60\\\",\\\"name\\\":\\\"test\\\",\\\"slug\\\":\\\"test\\\",\\\"position\\\":1},{\\\"id\\\":\\\"61\\\",\\\"name\\\":\\\"test\\\",\\\"slug\\\":\\\"test\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-16-620d3b486eef1.png\\\"]\",\"thumbnail\":\"2022-02-16-620d3b486fbc2.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":66,\"purchase_price\":33,\"tax\":12,\"tax_type\":\"percent\",\"discount\":22,\"discount_type\":\"percent\",\"current_stock\":12,\"details\":\"<p>test<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-16 23:58:32\",\"updated_at\":\"2022-02-17 00:24:58\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-02-16-620d3b4871254.png\",\"translations\":[]}', 1, 66, 7.92, 14.52, 'pending', 'unpaid', '2022-02-17 00:28:22', '2022-02-17 00:28:22', 1, '', '[]', 'discount_on_product', 1),
(92, 100070, 162, 0, '{\"id\":162,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"test\",\"slug\":\"test-RbQjSq\",\"category_ids\":\"[{\\\"id\\\":\\\"60\\\",\\\"name\\\":\\\"test\\\",\\\"slug\\\":\\\"test\\\",\\\"position\\\":1},{\\\"id\\\":\\\"61\\\",\\\"name\\\":\\\"test\\\",\\\"slug\\\":\\\"test\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-16-620d3b486eef1.png\\\"]\",\"thumbnail\":\"2022-02-16-620d3b486fbc2.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":66,\"purchase_price\":33,\"tax\":12,\"tax_type\":\"percent\",\"discount\":22,\"discount_type\":\"percent\",\"current_stock\":11,\"details\":\"<p>test<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-16 23:58:32\",\"updated_at\":\"2022-02-17 00:28:22\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-02-16-620d3b4871254.png\",\"translations\":[]}', 1, 66, 7.92, 14.52, 'pending', 'unpaid', '2022-02-17 00:28:47', '2022-02-17 00:28:47', 1, '', '[]', 'discount_on_product', 1),
(93, 100071, 162, 0, '{\"id\":162,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"test\",\"slug\":\"test-RbQjSq\",\"category_ids\":\"[{\\\"id\\\":\\\"60\\\",\\\"name\\\":\\\"test\\\",\\\"slug\\\":\\\"test\\\",\\\"position\\\":1},{\\\"id\\\":\\\"61\\\",\\\"name\\\":\\\"test\\\",\\\"slug\\\":\\\"test\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-16-620d3b486eef1.png\\\"]\",\"thumbnail\":\"2022-02-16-620d3b486fbc2.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":66,\"purchase_price\":33,\"tax\":12,\"tax_type\":\"percent\",\"discount\":22,\"discount_type\":\"percent\",\"current_stock\":10,\"details\":\"<p>test<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-16 23:58:32\",\"updated_at\":\"2022-02-17 00:28:47\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-02-16-620d3b4871254.png\",\"translations\":[]}', 1, 66, 7.92, 14.52, 'pending', 'unpaid', '2022-02-17 00:32:51', '2022-02-17 00:32:51', 1, '', '[]', 'discount_on_product', 1),
(94, 100072, 162, 0, '{\"id\":162,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"test\",\"slug\":\"test-RbQjSq\",\"category_ids\":\"[{\\\"id\\\":\\\"60\\\",\\\"name\\\":\\\"test\\\",\\\"slug\\\":\\\"test\\\",\\\"position\\\":1},{\\\"id\\\":\\\"61\\\",\\\"name\\\":\\\"test\\\",\\\"slug\\\":\\\"test\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-16-620d3b486eef1.png\\\"]\",\"thumbnail\":\"2022-02-16-620d3b486fbc2.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":66,\"purchase_price\":33,\"tax\":12,\"tax_type\":\"percent\",\"discount\":22,\"discount_type\":\"percent\",\"current_stock\":9,\"details\":\"<p>test<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-16 23:58:32\",\"updated_at\":\"2022-02-17 00:32:51\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-02-16-620d3b4871254.png\",\"translations\":[]}', 1, 66, 7.92, 14.52, 'pending', 'unpaid', '2022-02-17 01:29:05', '2022-02-17 01:29:05', 1, '', '[]', 'discount_on_product', 1),
(95, 100073, 162, 0, '{\"id\":162,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"test\",\"slug\":\"test-RbQjSq\",\"category_ids\":\"[{\\\"id\\\":\\\"60\\\",\\\"name\\\":\\\"test\\\",\\\"slug\\\":\\\"test\\\",\\\"position\\\":1},{\\\"id\\\":\\\"61\\\",\\\"name\\\":\\\"test\\\",\\\"slug\\\":\\\"test\\\",\\\"position\\\":2}]\",\"brand_id\":null,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-02-16-620d3b486eef1.png\\\"]\",\"thumbnail\":\"2022-02-16-620d3b486fbc2.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":66,\"purchase_price\":33,\"tax\":12,\"tax_type\":\"percent\",\"discount\":22,\"discount_type\":\"percent\",\"current_stock\":8,\"details\":\"<p>test<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-02-16 23:58:32\",\"updated_at\":\"2022-02-17 01:29:05\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"2022-02-16-620d3b4871254.png\",\"translations\":[]}', 1, 66, 7.92, 14.52, 'pending', 'unpaid', '2022-02-17 01:34:14', '2022-02-17 01:34:14', 1, '', '[]', 'discount_on_product', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('salman@sharklasers.com', '14lUcQshzInvTHQOY1lTz8NFjngCzn01t8GyAjEDDkmEAUwOWHsb6enH2X4SFitoaq5Cofnn7OvCdZMftqzqRo2061BaN4RWFfURGGMg6k6JLcIathUzEQUM', '2021-09-09 22:19:52'),
('shahab@inoviotech.com', '4qsayyrZ9btUNLSrJNUyGwocQjc10oHDSI3KoEz4S0PHIcZp44aVgitfATJUWk3WaZG5ZuPJdHUpF8MUAOwoTz9t61SJSt2MKu54e1ZqaAr4NBytJLXdbp3B', '2021-09-10 01:13:37'),
('shahab@inoviotech.com', 'wjWwxrQX1PHFD8uDDuiZwVXxBowBqG03m7xsYUEirn5KJvXdbfjjWIOBzei13OIVUxUEknTrnOG84JzAQf0dl6xX6CCcELI0XpN3a7xj0HeGqXVJhEfIfNJY', '2021-09-10 01:14:54'),
('aa@a.com', '4Gn8VEICT8dFkuuzghWwaPiSYy11uCjbAD3XnC2T6oocLuaSrXhCgcewpBtplXAGk04WaIOfApgDZS7dRNjP4O6OrczimGe1rr725Bwbd31vMH4qba8Y4cmz', '2022-01-20 20:35:30'),
('lauralwest.lw@gmail.com', '3av6piGJ154x2GPkgKRPDbYjzANDxywhZdJfmriFl5MO1mZVU2cmwHgqu3zivaFUoABCnlCAA5FBefCn4hzsD3ofq0kAtS28wZDPrkk5HKMXeSUC8nW2KErM', '2022-01-20 20:37:06'),
('leqifi@thichanthit.com', 'IAMV6PRhru4zgt5OelKGin0Nj127ZNVoZsjUkrYDKmEj83gex6TE6ipR5pr19BbfiHEt4oriNo7uMjBOdDkTDRtvAm6zqWnKWRTlN1X7JGf8Pa2RIHvKGWr0', '2022-01-28 21:15:07'),
('leqifi@thichanthit.com', 'j5vsP2f6OmIqdmrzG9mYgRB6E8lC5YySDYj3TjzC1rQ5xoWT1XoyyG1Nx1DBoeVosOJAj5wlURwcfqeDuUPHZW3KU4VSjycNIgDcTMJ62w53smrqfgrdF2Gc', '2022-01-28 21:15:32'),
('usamaasif4190@gmail.com', 'GrnDduPiObg57d5wCHb27ZqdPUodLFOvwp00Xn8HMuUKdwUj7oI18ozmxm1wVi048Ud4FpTSOYXyaiKNkuDQHT9aVjR8J4uxexdjW6GCR2MYQ3YjX2RXeSqt', '2022-01-31 20:50:07'),
('usamaasif4190@gmail.com', 'GXWE5zJ2MUbM3Fnl5BHSHwMvbJY5FgIAtutaZnwlEVsa1xHLMSJocLmgBQ15tQdoqWXiTxkEfnhH8jEXhEBLNS8e3xgbGwI9pKpFXXvCXpKsh3cMI5U386xd', '2022-01-31 20:52:23'),
('usamaasif4190@gmail.com', 'G8KU3OdKIUbfbvcFs0gDAiE3CZIlCieZFNasYui7v5PQsJqVv5alzzHKsA325kvQUd1BB2I0p96OFhCTYIBTNV5Qn2mvmaWB5cqIbeInX38pQFjUMXhtj5n6', '2022-01-31 21:01:48'),
('usamaasif4190@gmail.com', '3PIbU42EWLZgOyAFVQ7ZQmD02dexuHzCkszGFmlaxHwm4LpCz1Pq6uRvWXqfzfeUEvqEDlSH95E7SFSUfU8pXx68Rc1fOiZ1cJCxsTC1YOyLovh8qWtD2Esi', '2022-01-31 21:06:43'),
('usamaasif4190@gmail.com', 'hxfl8x17WNMJd0NiQSeX9sDWi68Wy6CLEGJMuWD3JOqbvmCqTizkpwKl86DcAIsUbnEAhqn4cgXJ1m7QejjOV1hJrWYyVN200IlqbR7d9BTgMp4QPl0VP7uz', '2022-01-31 21:12:58'),
('usamaasif4190@gmail.com', 'N8tgQcIjgwbuC9OyHx1pAalmxUrGhoJLQxUJ1cb33vyZbHMn66WalsRLlxGuIX8dTmdz7uefXzD9H6jPvDJZa6Mk8s2SMuIOnluhD25iTFCdlLewYbj98SOJ', '2022-01-31 21:22:06'),
('usamaasif4190@gmail.com', 'B1OXljfuGGvxTYIYGLJSDCSmo348BZLIMIlXiLjJfkWVNQxCJ44Oiz81DLJuobBmdqIJgrCmnDqm791hLtnnNCHd1mNscM7ixgtPdfkL42ukDfmVSrzuaIWW', '2022-01-31 21:27:42'),
('bygyno@norwegischlernen.info', '7iaJAGfahT2SjC87Q7nQ4ty2jphD0H45CNPlSkkeEgDBb8gvLFMCwhEN1d7ljRIxO0KOxqusBND027NNZHrKZed3S5Z3Ok4sYHqxaye6zACpRP3yQ0kVH9Sq', '2022-02-15 14:37:24'),
('bygyno@norwegischlernen.info', 'QAjYtmWAW5qjlgpxOIS5GPq0zcaZUSl01kkeJRPjkn7fVkDPpArA8PsRRMfzzDWnM0z7VpE2ZfNuY4HXNsRMFPYCW40iBdpA2exD4Jb7GjQbnt46IaYVcCZf', '2022-02-15 15:10:44');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_ids` longtext COLLATE utf8mb4_unicode_ci,
  `brand_id` bigint(20) DEFAULT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT '1',
  `refundable` tinyint(1) NOT NULL DEFAULT '1',
  `images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flash_deal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_provider` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colors` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT '0',
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci,
  `variation` text COLLATE utf8mb4_unicode_ci,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `purchase_price` double NOT NULL DEFAULT '0',
  `tax` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `tax_type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `discount_type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_stock` int(11) DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `featured_status` tinyint(1) NOT NULL DEFAULT '1',
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`) VALUES
(93, 'admin', 1, 'Contrary to popular belief', 'contrary-to-popular-belief-3DAZgC', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f296acd7ddd.png\"]', '2022-01-27-61f296acdbc72.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 100, 150, '0', 'percent', '10', 'percent', -9, '<p>What is Lorem Ipsum?<br />\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>Why do we use it?<br />\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', 0, NULL, '2022-01-27 18:57:16', '2022-01-31 22:16:15', 1, 1, 'Contrary to popular belief', 'What is Lorem Ipsum?\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown ', '2022-01-27-61f296ace2190.png'),
(94, 'admin', 1, 'Contrary to popular belief', 'contrary-to-popular-belief-dmZsCq', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f296cf2752e.png\"]', '2022-01-27-61f296cf2919d.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 100, 150, '0', 'percent', '10', 'percent', 17, '<p>What is Lorem Ipsum?<br />\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>Why do we use it?<br />\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', 0, NULL, '2022-01-27 18:57:51', '2022-01-31 22:10:30', 1, 1, 'Contrary to popular belief', 'What is Lorem Ipsum?\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown ', '2022-01-27-61f296cf2c08d.png'),
(95, 'admin', 1, 'Contrary to popular belief', 'contrary-to-popular-belief-BbY2vD', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f296f2cdfe5.png\"]', '2022-01-27-61f296f2cf9ed.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 100, 150, '0', 'percent', '10', 'percent', 20, '<p>What is Lorem Ipsum?<br />\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>Why do we use it?<br />\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', 0, NULL, '2022-01-27 18:58:26', '2022-01-27 18:58:26', 1, 1, 'Contrary to popular belief', 'What is Lorem Ipsum?\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown ', '2022-01-27-61f296f2d220c.png'),
(96, 'admin', 1, 'orem Ipsum is simply', 'orem-ipsum-is-simply-SSLe1q', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f29c1b54cdf.png\"]', '2022-01-27-61f29c1b566be.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'percent', 19, '<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 0, NULL, '2022-01-27 19:20:27', '2022-01-27 19:20:27', 1, 1, 'orem Ipsum is simply', 'What is Lorem Ipsum?\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown ', '2022-01-27-61f29c1b594ff.png'),
(97, 'admin', 1, 'orem Ipsum is simply', 'orem-ipsum-is-simply-48mvT9', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f29c2fe6ea5.png\"]', '2022-01-27-61f29c2fe895a.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'percent', 19, '<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 0, NULL, '2022-01-27 19:20:47', '2022-01-27 19:20:47', 1, 1, 'orem Ipsum is simply', 'What is Lorem Ipsum?\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown ', '2022-01-27-61f29c2feb3ea.png'),
(98, 'admin', 1, 'Lorem ipsum dolor sit amet', 'lorem-ipsum-dolor-sit-amet-MAf5Mb', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f29cb463b58.png\"]', '2022-01-27-61f29cb465ae9.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 18, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ut urna vel augue facilisis ullamcorper pulvinar nec felis. Donec nec pretium tortor. Nunc id tincidunt dui, ut congue nisi. Etiam ut augue vitae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Nulla egestas sed nibh ut vulputate. Nam in convallis quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla rhoncus nisl vitae risus euismod venenatis. Integer euismod scelerisque diam, id porta est. Nunc nisl massa, ultrices in quam nec, pharetra pharetra purus.</p>', 0, NULL, '2022-01-27 19:23:00', '2022-01-27 19:23:00', 1, 1, 'Lorem ipsum dolor sit amet', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ut urna vel augue facilisis ullamcorper pulvinar nec felis. Donec nec pretium tortor. Nunc id tincidunt dui, ut congue nisi. Etia', '2022-01-27-61f29cb469847.png'),
(99, 'admin', 1, 'Quisque lacus leo', 'quisque-lacus-leo-W7RL2S', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f29d1bd7528.png\"]', '2022-01-27-61f29d1bd97f7.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 19, '<p>Quisque lacus leo, venenatis vel facilisis a, malesuada a neque. Cras ac elementum risus. Integer ut leo fermentum, egestas urna ut, cursus neque. Mauris sapien libero, mattis non ultrices id, pharetra non ipsum. Praesent ut laoreet lacus, a varius arcu. Sed feugiat arcu vitae odio malesuada vulputate. Vivamus ultrices sit amet magna vitae feugiat. Nullam non pharetra urna. Phasellus sed lorem sapien. Cras vel molestie velit.</p>', 0, NULL, '2022-01-27 19:24:43', '2022-01-27 19:24:43', 1, 1, 'Quisque lacus leo', 'Quisque lacus leo, venenatis vel facilisis a, malesuada a neque. Cras ac elementum risus. Integer ut leo fermentum, egestas urna ut, cursus neque. Mauris sapien libero, mattis non ultrices id', '2022-01-27-61f29d1bde3b8.png'),
(100, 'admin', 1, 'Nulla ac porta ante.', 'nulla-ac-porta-ante-EVQfAe', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f29d8c0146c.png\"]', '2022-01-27-61f29d8c035d0.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 149.99, 99.99, '0', 'percent', '10', 'flat', 19, '<p>Nulla ac porta ante. Cras eu rhoncus ipsum. Duis vestibulum eleifend neque, in egestas nibh tristique sit amet. Aenean feugiat dui et nulla dapibus varius. Fusce eu tincidunt lorem. Aliquam imperdie</p>', 0, NULL, '2022-01-27 19:26:36', '2022-01-27 19:26:36', 1, 1, 'Nulla ac porta ante.', 'Nulla ac porta ante. Cras eu rhoncus ipsum. Duis vestibulum eleifend neque, in egestas nibh tristique sit amet. Aenean feugiat dui et nulla dapibus varius. Fusce eu tincidunt lorem. Aliquam i', '2022-01-27-61f29d8c0762b.png'),
(101, 'admin', 1, 'Nullam eleifend,', 'nullam-eleifend-nfSQYc', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f29e09818ad.png\"]', '2022-01-27-61f29e0983771.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 19, '<p>Nullam eleifend, tellus a placerat maximus, est arcu fringilla leo, ac hendrerit quam eros a quam. Aliquam dignissim, lectus ac finibus accumsan, arcu risus facilisis tellus, sit amet fringilla enim dolor pellentesque lectus. Suspendisse blandit orci eu purus egestas, sit amet porttitor lorem vehicula. Pel</p>', 0, NULL, '2022-01-27 19:28:41', '2022-01-27 19:28:41', 1, 1, 'Nullam eleifend,', 'Nullam eleifend, tellus a placerat maximus, est arcu fringilla leo, ac hendrerit quam eros a quam. Aliquam dignissim, lectus ac finibus accumsan, arcu risus facilisis tellus, sit amet fringil', '2022-01-27-61f29e0987d7e.png'),
(102, 'admin', 1, 'vitae eros finibus', 'vitae-eros-finibus-7CR0nm', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2a08c2c131.png\"]', '2022-01-27-61f2a08c2e0f9.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 16, '<p>augue vitae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Nulla egestas sed nibh ut vulputate. Nam in convallis quam</p>', 0, NULL, '2022-01-27 19:39:24', '2022-01-28 22:18:04', 1, 1, 'vitae eros finibus', 'augue vitae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Nulla egestas sed nibh ut vulputate. Nam in convallis quam', '2022-01-27-61f2a08c32344.png'),
(103, 'admin', 1, 'tus et ultrices posue', 'tus-et-ultrices-posue-H6pD3P', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2a0de793e5.png\"]', '2022-01-27-61f2a0de7ae44.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 20, '<p>t dui, ut congue nisi. Etiam ut augue vitae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Null</p>', 0, NULL, '2022-01-27 19:40:46', '2022-02-15 16:08:46', 1, 1, 'tus et ultrices posue', 't dui, ut congue nisi. Etiam ut augue vitae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Null', '2022-01-27-61f2a0de7e33d.png'),
(104, 'admin', 1, 'egestas sed nibh', 'egestas-sed-nibh-YBkqSX', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2a155c6f06.png\"]', '2022-01-27-61f2a155ca489.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 12, '<p>isi. Etiam ut augue vitae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Nulla egestas sed nibh ut vulputate. Nam in convallis quam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nu</p>', 0, NULL, '2022-01-27 19:42:45', '2022-01-27 19:42:45', 1, 1, 'egestas sed nibh', 'isi. Etiam ut augue vitae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Nulla egestas sed nibh ut vulputate. Nam in conva', '2022-01-27-61f2a155d2e66.png'),
(105, 'admin', 1, 'ante in, rhon', 'ante-in-rhon-uS5IZJ', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2a1d6306a1.png\"]', '2022-01-27-61f2a1d632a45.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 21, '<p>ae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Nulla egestas sed nibh ut vulputate. Na</p>', 0, NULL, '2022-01-27 19:44:54', '2022-01-27 19:44:54', 1, 1, 'ante in, rhon', 'ae eros finibus ornare consectetur nec dui. Vestibulum elementum id lacus non suscipit. Duis suscipit fermentum felis. Nulla egestas sed nibh ut vulputate. Na', '2022-01-27-61f2a1d6370ae.png'),
(106, 'admin', 1, 'scing elit. Nunc', 'scing-elit-nunc-bF013a', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2a24220a75.png\"]', '2022-01-27-61f2a242227ad.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 20, '<p>eget porttitor. Morbi sed tincidunt metus. Interdum et malesuada fames ac ante ipsum primis in faucibus</p>', 0, NULL, '2022-01-27 19:46:42', '2022-01-27 19:46:42', 1, 1, 'scing elit. Nunc', 'eget porttitor. Morbi sed tincidunt metus. Interdum et malesuada fames ac ante ipsum primis in faucibus', '2022-01-27-61f2a24226abd.png'),
(107, 'admin', 1, 'is non ultrices', 'is-non-ultrices-tzTk6D', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2a2a827cf8.png\"]', '2022-01-27-61f2a2a829d4c.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 21, '<p>mattis non ultrices id, pharetra non ipsum. Praesent ut laoreet lacus, a varius arcu. Sed feugiat arcu vitae odio malesuada vulputate. Vivamus ultrices sit amet magna vitae feugiat. Nullam non pharetra urna. Phasellus sed lorem sapien. Cras vel molestie velit.</p>', 0, NULL, '2022-01-27 19:48:24', '2022-01-27 19:48:24', 1, 1, 'is non ultrices', 'mattis non ultrices id, pharetra non ipsum. Praesent ut laoreet lacus, a varius arcu. Sed feugiat arcu vitae odio malesuada vulputate. Vivamus ultrices sit amet magna vitae feugiat. Nullam no', '2022-01-27-61f2a2a82e0c3.png'),
(108, 'admin', 1, 'sum primis in fa', 'sum-primis-in-fa-G6Gj8g', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2a334b88f4.png\"]', '2022-01-27-61f2a334ba7eb.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 21, '<p>on pretium. Phasellus semper ipsum rhoncus elit vehicula congue. Maecenas eu orci sed est consectetur eleifend. Aliquam sit amet tempor lacus. Vestibulum</p>', 0, NULL, '2022-01-27 19:50:44', '2022-01-27 19:50:44', 1, 1, 'sum primis in fa', 'on pretium. Phasellus semper ipsum rhoncus elit vehicula congue. Maecenas eu orci sed est consectetur eleifend. Aliquam sit amet tempor lacus. Vestibulum', '2022-01-27-61f2a334be432.png'),
(109, 'admin', 1, 'cilisis a, malesu', 'cilisis-a-malesu-acglOF', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2a3a3aa982.png\"]', '2022-01-27-61f2a3a3aca26.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 159, 99.99, '0', 'percent', '10', 'flat', 19, '<p>quat maximus. Cras ex enim, semper quis ante in, rhoncus tristique lacus. Aliquam ullamcorper felis sed accumsan feugiat. Mauris sagittis porta mauris non pretium. Phasellus semper ipsum rhoncus elit vehicula congue. Maecenas eu orci sed est consectetur eleifend. Aliquam sit amet tempor l</p>', 0, NULL, '2022-01-27 19:52:35', '2022-01-27 19:52:35', 1, 1, 'cilisis a, malesu', 'quat maximus. Cras ex enim, semper quis ante in, rhoncus tristique lacus. Aliquam ullamcorper felis sed accumsan feugiat. Mauris sagittis porta mauris non pretium. Phasellus semper ipsum rhon', '2022-01-27-61f2a3a3b12be.png'),
(110, 'admin', 1, 'sent ut laoreet', 'sent-ut-laoreet-rjubbj', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2a4341f1e4.png\"]', '2022-01-27-61f2a434277c1.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 20, '<p>ucibus orci luctus et ultrices posuere cubilia curae; Pellentesque et odio sit amet urna blandit ultricies. Phasellus aliquet id lacus eget porttitor. Morbi sed tincidunt metus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce id urna pellentesque, pharetra risus in, luctus libero.</p>', 0, NULL, '2022-01-27 19:55:00', '2022-01-27 19:55:00', 1, 1, 'sent ut laoreet', 'ucibus orci luctus et ultrices posuere cubilia curae; Pellentesque et odio sit amet urna blandit ultricies. Phasellus aliquet id lacus eget porttitor. Morbi sed tincidunt metus. Interdum et m', '2022-01-27-61f2a434370c7.png'),
(111, 'admin', 1, 'Cras ac elementum', 'cras-ac-elementum-MqIhiT', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2a52554950.png\"]', '2022-01-27-61f2a52556986.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 21, '<p>eugiat. Mauris sagittis porta mauris non pretium. Phasellus semper ipsum rhoncus elit vehicula congue. Maecenas eu orci sed est consectetur eleifend. Aliquam&nbsp;</p>', 0, NULL, '2022-01-27 19:59:01', '2022-01-27 19:59:01', 1, 1, '. Cras ac elementum', 'eugiat. Mauris sagittis porta mauris non pretium. Phasellus semper ipsum rhoncus elit vehicula congue. Maecenas eu orci sed est consectetur eleifend. Aliquam', '2022-01-27-61f2a5255af94.png'),
(112, 'admin', 1, 'simply dummy', 'simply-dummy-dUQXDB', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2a52d27195.png\"]', '2022-01-27-61f2a52d28d33.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 100, '0', 'percent', '10', 'flat', 20, '<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h2>Why do we use it?</h2>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', 0, NULL, '2022-01-27 19:59:09', '2022-01-27 19:59:09', 1, 1, NULL, 'What is Lorem Ipsum?\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown ', '2022-01-27-61f2a52d2d9ee.png'),
(113, 'admin', 1, 'in egestas nibh tri', 'in-egestas-nibh-tri-Zpj9bj', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2a5badd8ef.png\"]', '2022-01-27-61f2a5badf09b.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 21, '<p>sum. Duis vestibulum eleifend neque, in egestas nibh tristique sit amet. Aenean feugiat dui et nulla dapibus varius. Fusce eu tincidunt lorem. Aliqu</p>', 0, NULL, '2022-01-27 20:01:30', '2022-01-27 20:01:30', 1, 1, 'in egestas nibh tri', 'sum. Duis vestibulum eleifend neque, in egestas nibh tristique sit amet. Aenean feugiat dui et nulla dapibus varius. Fusce eu tincidunt lorem. Aliqu', '2022-01-27-61f2a5bae1fea.png'),
(114, 'admin', 1, 'Fusce', 'fusce-fnKS4q', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2a6183aff6.png\"]', '2022-01-27-61f2a6183ce0c.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 21, '<p>ro, mattis non ultrices id, pharetra non ipsum. Praesent ut laoreet lacus, a varius arcu. Sed feugiat arcu vitae odio malesuada vulputate. Vivamus ultrices sit amet magna vitae feugi</p>', 0, NULL, '2022-01-27 20:03:04', '2022-01-27 20:03:04', 1, 1, 'Fusce', 'ro, mattis non ultrices id, pharetra non ipsum. Praesent ut laoreet lacus, a varius arcu. Sed feugiat arcu vitae odio malesuada vulputate. Vivamus ultrices sit amet magna vitae feugi', '2022-01-27-61f2a61840f41.png'),
(115, 'admin', 1, 'Lorem Ipsum', 'lorem-ipsum-thEU7b', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2a6ee3753a.png\"]', '2022-01-27-61f2a6ee39589.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 100, '0', 'percent', '10', 'flat', 5, '<h2>What is Lorem Ipsum?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h2>Why do we use it?</h2>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', 0, NULL, '2022-01-27 20:06:38', '2022-01-27 20:13:42', 1, 1, NULL, 'What is Lorem Ipsum?\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown ', '2022-01-27-61f2a6ee3dbc8.png'),
(116, 'admin', 1, 'Phasellus', 'phasellus-74wWfz', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2ab212c3bd.png\"]', '2022-01-27-61f2ab212de32.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 21, '<p>sit amet tempor lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Pellentesque et odio sit amet urna blandit ultricies. Phasellus aliquet id lacus eget porttitor. Morbi sed tincidunt metus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce id urna pel</p>', 0, NULL, '2022-01-27 20:24:33', '2022-01-27 20:24:33', 1, 1, 'Phasellus', 'sit amet tempor lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Pellentesque et odio sit amet urna blandit ultricies. Phasellus aliquet id lacus', '2022-01-27-61f2ab21315ee.png'),
(117, 'admin', 1, 'tristique', 'tristique-T3AtWA', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2ab78afae2.png\"]', '2022-01-27-61f2ab78b15dc.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 180, 99.99, '0', 'percent', '10', 'flat', 18, '<p>ipsum rhoncus elit vehicula congue. Maecenas eu orci sed est consectetur eleifend. Aliquam sit amet tempor lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Pellentesque et odio sit amet urna blandit ultricies. Phasellus aliquet id lacus eget porttitor. Morbi sed tincidunt</p>', 0, NULL, '2022-01-27 20:26:00', '2022-01-27 20:26:00', 1, 1, 'tristique', 'ipsum rhoncus elit vehicula congue. Maecenas eu orci sed est consectetur eleifend. Aliquam sit amet tempor lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubi', '2022-01-27-61f2ab78b502e.png'),
(118, 'admin', 1, 'laoreet', 'laoreet-bXTbwm', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2abb7f0cf5.png\"]', '2022-01-27-61f2abb7f29b7.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 999.99, '0', 'percent', '10', 'flat', 21, '<p>odio commodo, eget tincidunt lectus luctus.</p>', 0, NULL, '2022-01-27 20:27:04', '2022-01-28 20:43:41', 1, 1, 'laoreet', 'odio commodo, eget tincidunt lectus luctus.', '2022-01-27-61f2abb802074.png'),
(119, 'admin', 1, 'Aliquam', 'aliquam-GjItnL', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2bb0368cd2.png\"]', '2022-01-27-61f2bb036ac9b.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 14, '<p>Duis vestibulum eleifend neque, in egestas nibh tristique sit amet. Aenean feugiat dui et nulla dapibus varius. Fusce eu tincidunt lorem.</p>', 0, NULL, '2022-01-27 21:32:19', '2022-01-28 20:43:40', 1, 1, 'Aliquam', 'Duis vestibulum eleifend neque, in egestas nibh tristique sit amet. Aenean feugiat dui et nulla dapibus varius. Fusce eu tincidunt lorem.', '2022-01-27-61f2bb036e129.png'),
(120, 'admin', 1, 'hendrerit', 'hendrerit-6CgBUL', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2bc784c0c5.png\"]', '2022-01-27-61f2bc784d801.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 21, '<p>malesuada a neque. Cras ac elementum risus. Integer ut leo fermentum, egestas urna ut, cursus neque. Mauris sapien libero, mattis non ultrices id, pharetra non ipsum. Praesent ut laoreet lacus, a varius arcu. Sed feugiat arcu vitae odio malesuada vulputate. Vivamus&nbsp;</p>', 0, NULL, '2022-01-27 21:38:32', '2022-01-27 21:38:32', 1, 1, 'hendrerit', 'malesuada a neque. Cras ac elementum risus. Integer ut leo fermentum, egestas urna ut, cursus neque. Mauris sapien libero, mattis non ultrices id, pharetra non ipsum. Praesent ut laoreet lacu', '2022-01-27-61f2bc7850d13.png'),
(121, 'admin', 1, 'faucibus', 'faucibus-xB2pwm', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2bcd38de62.png\"]', '2022-01-27-61f2bcd38f6d8.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 21, '<p>n egestas nibh tristique sit amet. Aenean feugiat dui et nulla dapibus varius. Fusce eu tincidunt lorem. Aliquam imperdiet orci eu tincidunt gravida. Nunc luctus at turpis nec tempor. Vivamus in blandit massa, at condimentum metus. Sed laoreet dui tempus odio commodo, eget tincidunt lectus luctus.</p>', 0, NULL, '2022-01-27 21:40:03', '2022-01-27 21:40:03', 1, 1, 'faucibus', 'n egestas nibh tristique sit amet. Aenean feugiat dui et nulla dapibus varius. Fusce eu tincidunt lorem. Aliquam imperdiet orci eu tincidunt gravida. Nunc luctus at turpis nec tempor. Vivamus', '2022-01-27-61f2bcd3929fc.png'),
(122, 'admin', 1, 'hendrerit', 'hendrerit-o7We4g', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2bd58629bb.png\"]', '2022-01-27-61f2bd58649c5.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 21, '<p>Nullam eleifend, tellus a placerat maximus, est arcu fringilla leo, ac hendrerit quam eros a quam. Aliquam dignissim, lectus ac finibus accumsan, arcu risus facilisis tellus, sit amet fringilla enim dolor pellentesque lectus. Suspendisse blandit orci eu purus egestas, sit amet porttitor lorem vehicula.&nbsp;</p>', 0, NULL, '2022-01-27 21:42:16', '2022-01-27 21:42:16', 1, 1, 'hendrerit', 'Nullam eleifend, tellus a placerat maximus, est arcu fringilla leo, ac hendrerit quam eros a quam. Aliquam dignissim, lectus ac finibus accumsan, arcu risus facilisis tellus, sit amet fringil', '2022-01-27-61f2bd5868abc.png'),
(123, 'admin', 1, 'gravida', 'gravida-1ICcoq', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2bda90d01d.png\"]', '2022-01-27-61f2bda90e8c1.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 21, '<p>sit amet suscipit sapien placerat. In ac massa risus. Cras id tortor sed eros ultricies bibendum. Vivamus id diam eget felis ullamcorper scelerisque vitae sit amet metus. Maecenas et convallis lorem, non maximus mauris. In id massa erat.</p>', 0, NULL, '2022-01-27 21:43:37', '2022-01-27 21:43:37', 1, 1, 'gravida', 'sit amet suscipit sapien placerat. In ac massa risus. Cras id tortor sed eros ultricies bibendum. Vivamus id diam eget felis ullamcorper scelerisque vitae sit amet metus. Maecenas et convalli', '2022-01-27-61f2bda911fc8.png'),
(124, 'admin', 1, 'eget', 'eget-OkbAoe', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2bdfae8427.png\"]', '2022-01-27-61f2bdfae9e30.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 22, '<p>Phasellus aliquet id lacus eget porttitor. Morbi sed tincidunt metus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce id urna pellentesque, pharetra risus in, luctus libero.</p>', 0, NULL, '2022-01-27 21:44:58', '2022-01-27 21:44:58', 1, 1, 'eget', 'Phasellus aliquet id lacus eget porttitor. Morbi sed tincidunt metus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce id urna pellentesque, pharetra risus in, luctus liber', '2022-01-27-61f2bdfaecabc.png'),
(125, 'admin', 1, 'maximus', 'maximus-K7QTCy', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2be4d256fc.png\"]', '2022-01-27-61f2be4d2700c.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 180, 100, '0', 'percent', '10', 'flat', 21, '<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Pellentesque et odio sit amet urna blandit ultricies. Phasellus aliquet id lacus eget porttitor. Morbi sed tincidunt metus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce id urna pellentesque, pharetra risus in, luctus libero.</p>', 0, NULL, '2022-01-27 21:46:21', '2022-01-27 21:46:21', 1, 1, 'maximus', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Pellentesque et odio sit amet urna blandit ultricies. Phasellus aliquet id lacus eget porttitor. Morbi ', '2022-01-27-61f2be4d2ae46.png'),
(126, 'admin', 1, 'lectus', 'lectus-oLlUx8', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2bebf0194c.png\"]', '2022-01-27-61f2bebf0388d.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 100, '0', 'percent', '10', 'flat', 21, '<p>Phasellus aliquet id lacus eget porttitor. Morbi sed tincidunt metus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce id urna pellentesque, pharetra risus in, luctus libero.</p>', 0, NULL, '2022-01-27 21:48:15', '2022-01-27 21:48:15', 1, 1, 'lectus', 'Phasellus aliquet id lacus eget porttitor. Morbi sed tincidunt metus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce id urna pellentesque, pharetra risus in, luctus liber', '2022-01-27-61f2bebf080c4.png'),
(127, 'admin', 1, 'nibh', 'nibh-J599t0', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2bf1f0a4df.png\"]', '2022-01-27-61f2bf1f0c470.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 100, '0', 'percent', '10', 'flat', 19, '<p>Duis vestibulum eleifend neque, in egestas nibh tristique sit amet. Aenean feugiat dui et nulla dapibus varius. Fusce eu tincidunt lorem. Aliquam imperdiet orci eu tincidunt gravida. Nunc luctus at turpis nec tempor. Vivamus in blandit massa, at condimentum metus. Sed laoreet dui tempus odio commodo, eget tincidunt lectus luctus.</p>', 0, NULL, '2022-01-27 21:49:51', '2022-01-27 21:49:51', 1, 1, 'nibh', 'Duis vestibulum eleifend neque, in egestas nibh tristique sit amet. Aenean feugiat dui et nulla dapibus varius. Fusce eu tincidunt lorem. Aliquam imperdiet orci eu tincidunt gravida. Nunc luc', '2022-01-27-61f2bf1f103ac.png'),
(128, 'admin', 1, 'Aliquam', 'aliquam-QGaYFi', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2bf9395f32.png\"]', '2022-01-27-61f2bf9397efb.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 100, '0', 'percent', '10', 'flat', 19, '<p>Nullam eleifend, tellus a placerat maximus, est arcu fringilla leo, ac hendrerit quam eros a quam. Aliquam dignissim, lectus ac finibus accumsan, arcu risus facilisis tellus, sit amet fringilla enim dolor pellentesque lectus. Suspendisse blandit orci eu purus egestas, sit amet porttitor lorem vehicula.&nbsp;</p>', 0, NULL, '2022-01-27 21:51:47', '2022-01-27 21:51:47', 1, 1, 'Aliquam', 'Nullam eleifend, tellus a placerat maximus, est arcu fringilla leo, ac hendrerit quam eros a quam. Aliquam dignissim, lectus ac finibus accumsan, arcu risus facilisis tellus, sit amet fringil', '2022-01-27-61f2bf939b80d.png'),
(129, 'admin', 1, 'ultrices', 'ultrices-hCExl3', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2c2198c80b.png\"]', '2022-01-27-61f2c2198e96b.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99.99, '0', 'percent', '10', 'flat', 19, '<p>emper quis ante in, rhoncus tristique lacus. Aliquam ullamcorper felis sed accumsan feugiat. Mauris sagittis porta mauris non pretium. Phasellus semper ipsum rhoncus elit vehicula congue. Maecenas eu orci sed est consectetur eleifend. Aliquam sit amet tempor lacus.&nbsp;</p>', 0, NULL, '2022-01-27 22:02:33', '2022-01-27 22:02:33', 1, 1, 'ultrices', 'emper quis ante in, rhoncus tristique lacus. Aliquam ullamcorper felis sed accumsan feugiat. Mauris sagittis porta mauris non pretium. Phasellus semper ipsum rhoncus elit vehicula congue. Mae', '2022-01-27-61f2c21993344.png'),
(130, 'admin', 1, 'elementum', 'elementum-2mgugm', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2c281cca8a.png\"]', '2022-01-27-61f2c281ce931.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 100, '0', 'percent', '10', 'flat', 21, '<p>mattis non ultrices id, pharetra non ipsum. Praesent ut laoreet lacus, a varius arcu. Sed feugiat arcu vitae odio malesuada vulputate. Vivamus ultrices sit amet magna vitae feugiat. Nullam non pharetra urna. Phasellus sed lorem sapien. Cras vel molestie velit.</p>', 0, NULL, '2022-01-27 22:04:17', '2022-01-27 22:04:17', 1, 1, 'elementum', 'mattis non ultrices id, pharetra non ipsum. Praesent ut laoreet lacus, a varius arcu. Sed feugiat arcu vitae odio malesuada vulputate. Vivamus ultrices sit amet magna vitae feugiat. Nullam no', '2022-01-27-61f2c281d23bc.png'),
(131, 'admin', 1, 'feugiat', 'feugiat-EULny1', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2c2e326683.png\"]', '2022-01-27-61f2c2e328767.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 100, '0', 'percent', '10', 'flat', 12, '<p>uisque rutrum massa in consequat maximus. Cras ex enim, semper quis ante in, rhoncus tristique lacus. Aliquam ullamcorper felis sed accumsan feugiat. Mauris sagittis porta mauris non pretium. Phasellus semper ipsum rhoncus elit vehicula congue. Maecenas eu orci sed est consectetur</p>', 0, NULL, '2022-01-27 22:05:55', '2022-01-27 22:05:55', 1, 1, 'feugiat', 'uisque rutrum massa in consequat maximus. Cras ex enim, semper quis ante in, rhoncus tristique lacus. Aliquam ullamcorper felis sed accumsan feugiat. Mauris sagittis porta mauris non pretium.', '2022-01-27-61f2c2e32c873.png'),
(132, 'admin', 1, 'scelerisque', 'scelerisque-f9Dw5M', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2c32b38063.png\"]', '2022-01-27-61f2c32b39f9e.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 100, '0', 'percent', '10', 'flat', 10, '<p>Cras ac elementum risus. Integer ut leo fermentum, egestas urna ut, cursus neque. Mauris sapien libero, mattis non ultrices id, pharetra non ipsum. Praesent ut laoreet lacus, a varius arcu. Sed feugiat arcu vitae odio malesuada vulputate. Vivamus ultrices sit amet magna</p>', 0, NULL, '2022-01-27 22:07:07', '2022-01-27 22:07:07', 1, 1, 'scelerisque', 'Cras ac elementum risus. Integer ut leo fermentum, egestas urna ut, cursus neque. Mauris sapien libero, mattis non ultrices id, pharetra non ipsum. Praesent ut laoreet lacus, a varius arcu. S', '2022-01-27-61f2c32b3ddce.png'),
(133, 'admin', 1, 'consequat', 'consequat-6a5z7W', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2c37cddf86.png\"]', '2022-01-27-61f2c37cdff97.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 100, '0', 'percent', '10', 'flat', 11, '<p>Phasellus aliquet id lacus eget porttitor. Morbi sed tincidunt metus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce id urna pellentesque, pharetra risus in, luctus libero.</p>', 0, NULL, '2022-01-27 22:08:28', '2022-01-27 22:08:28', 1, 1, 'consequat', 'Phasellus aliquet id lacus eget porttitor. Morbi sed tincidunt metus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce id urna pellentesque, pharetra risus in, luctus liber', '2022-01-27-61f2c37ce4599.png'),
(134, 'admin', 1, 'Phasellus', 'phasellus-f2jyC6', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2c3e6990c7.png\"]', '2022-01-27-61f2c3e69b458.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 9.99, '0', 'percent', '10', 'flat', 11, '<p>Cras ex enim, semper quis ante in, rhoncus tristique lacus. Aliquam ullamcorper felis sed accumsan feugiat. Mauris sagittis porta mauris non pretium. Phasellus semper ipsum rhoncus elit vehicula congue. Maecenas eu orci sed est consectetur eleifend. Aliquam sit amet tempor lacus</p>', 0, NULL, '2022-01-27 22:10:14', '2022-01-27 22:10:14', 1, 1, 'Phasellus', 'Cras ex enim, semper quis ante in, rhoncus tristique lacus. Aliquam ullamcorper felis sed accumsan feugiat. Mauris sagittis porta mauris non pretium. Phasellus semper ipsum rhoncus elit vehic', '2022-01-27-61f2c3e6a0861.png'),
(135, 'admin', 1, 'primis', 'primis-b01uSk', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2c4497faaa.png\"]', '2022-01-27-61f2c449815c3.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 100, '0', 'percent', '10', 'flat', 10, '<p>malesuada a neque. Cras ac elementum risus. Integer ut leo fermentum, egestas urna ut, cursus neque. Mauris sapien libero, mattis non ultrices id, pharetra non ipsum. Praesent ut laoreet lacus, a varius arcu. Sed feugiat arcu vitae odio malesuada vulputate.</p>', 0, NULL, '2022-01-27 22:11:53', '2022-01-27 22:11:53', 1, 1, 'primis', 'malesuada a neque. Cras ac elementum risus. Integer ut leo fermentum, egestas urna ut, cursus neque. Mauris sapien libero, mattis non ultrices id, pharetra non ipsum. Praesent ut laoreet lacu', '2022-01-27-61f2c449859ba.png'),
(136, 'admin', 1, 'Aenean', 'aenean-EU6nYb', '[{\"id\":\"28\",\"name\":\"Souvenir\",\"slug\":\"souvenir\",\"position\":1},{\"id\":\"34\",\"name\":\"Baby Shower\",\"slug\":\"baby-shower\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-27-61f2c48b872bd.png\"]', '2022-01-27-61f2c48b8929c.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 100, '0', 'percent', '10', 'flat', 12, '<p>Aenean feugiat dui et nulla dapibus varius. Fusce eu tincidunt lorem. Aliquam imperdiet orci eu tincidunt gravida. Nunc luctus at turpis nec tempor. Vivamus in blandit massa, at condimentum metus. Sed laoreet dui tempus odio commodo, eget tincidunt lectus luctus.</p>', 0, NULL, '2022-01-27 22:12:59', '2022-01-27 22:12:59', 1, 1, 'Aenean', 'Aenean feugiat dui et nulla dapibus varius. Fusce eu tincidunt lorem. Aliquam imperdiet orci eu tincidunt gravida. Nunc luctus at turpis nec tempor. Vivamus in blandit massa, at condimentum m', '2022-01-27-61f2c48b8d99a.png');
INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`) VALUES
(137, 'admin', 1, 'Pellentesque', 'pellentesque-1qh4D3', '[{\"id\":\"29\",\"name\":\"Gifts\",\"slug\":\"gifts\",\"position\":1},{\"id\":\"40\",\"name\":\"Mother Day\",\"slug\":\"mother-day\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-28-61f3afade9ab0.png\"]', '2022-01-28-61f3afadeb9cc.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 99, '0', 'percent', '10', 'flat', 14, '<p>In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero, laoreet vitae volutpat id, lobortis luctus arcu. Nulla vestibulum justo sed mauris rutrum, vel iaculis velit porta. Curabitur vestibulum commodo accumsan.</p>', 0, NULL, '2022-01-28 14:56:13', '2022-02-15 15:42:20', 1, 1, 'Pellentesque', 'In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero, laoreet vitae volutpat id, lobortis luctus arcu. Nulla vestibulum ', '2022-01-28-61f3afadef071.png'),
(138, 'admin', 1, 'tempus', 'tempus-zEmCdl', '[{\"id\":\"29\",\"name\":\"Gifts\",\"slug\":\"gifts\",\"position\":1},{\"id\":\"41\",\"name\":\"Breast Cancer Day\",\"slug\":\"breast-cancer-day\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-28-61f3b022b5f1d.png\"]', '2022-01-28-61f3b022b801c.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 100, '0', 'percent', '10', 'flat', 12, '<p>neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero, laoreet vitae volutpat id, lobortis luctus arcu. Nulla vestibulum justo sed mauris rutrum, vel iaculis velit porta. Curabitur vestibulum commodo accumsan. Phasellus</p>', 0, NULL, '2022-01-28 14:58:10', '2022-01-28 14:58:10', 1, 1, 'tempus', 'neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero, laoreet vitae volutpat id, lobortis luctus arcu. Nulla vestibulum justo sed ma', '2022-01-28-61f3b022bb51d.png'),
(139, 'admin', 1, 'Morbi', 'morbi-OahV5q', '[{\"id\":\"30\",\"name\":\"Candels\",\"slug\":\"candels\",\"position\":1},{\"id\":\"42\",\"name\":\"Dinner Candels\",\"slug\":\"dinner-candels\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-28-61f3b090bb6e7.png\"]', '2022-01-28-61f3b090be8e4.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 100, '0', 'percent', '10', 'flat', 2, '<p>Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis&nbsp;</p>', 0, NULL, '2022-01-28 15:00:00', '2022-02-15 15:38:59', 1, 1, 'Morbi', 'Nulla maximus, velit sed tempus ultricies, tortor ligula viverra mauris, posuere blandit ante sapien ac magna. Sed non rutrum libero. Pellentesque sagittis', '2022-01-28-61f3b090c6f65.png'),
(140, 'admin', 1, 'accumsan', 'accumsan-EyGDxl', '[{\"id\":\"30\",\"name\":\"Candels\",\"slug\":\"candels\",\"position\":1},{\"id\":\"42\",\"name\":\"Dinner Candels\",\"slug\":\"dinner-candels\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-28-61f3b0fe3dc40.png\"]', '2022-01-28-61f3b0fe3fa58.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 120, 100, '0', 'percent', '10', 'flat', 12, '<p>Morbi id ipsum lacinia, viverra lorem quis, tempor turpis. In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero</p>', 0, NULL, '2022-01-28 15:01:50', '2022-01-28 20:42:23', 1, 1, 'accumsan', 'Morbi id ipsum lacinia, viverra lorem quis, tempor turpis. In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla. Pellentesque nulla libero', '2022-01-28-61f3b0fe42fc8.png'),
(141, 'admin', 1, 'elementum', 'elementum-mzDSq3', '[{\"id\":\"31\",\"name\":\"Soap\",\"slug\":\"soap\",\"position\":1},{\"id\":\"43\",\"name\":\"Pink Soap\",\"slug\":\"pink-soap\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-28-61f3b16d54dcc.png\"]', '2022-01-28-61f3b16d56745.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 100, '0', 'percent', '10', 'flat', 0, '<p>Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio placerat. Praesent imperdiet bibendum erat nec suscipit. Sed placerat sapien nibh, vel imperdiet metus condimentum sit amet. Pellentesque venenatis accumsan libero vel elementum.</p>', 0, NULL, '2022-01-28 15:03:41', '2022-02-15 16:08:46', 1, 1, 'elementum', 'Proin varius odio eros, ac venenatis neque interdum eu. Nullam varius vestibulum justo. Proin vitae varius felis, in lacinia leo. Suspendisse ornare turpis at nisl tempus, at tempus odio plac', '2022-01-28-61f3b16d59640.png'),
(142, 'admin', 1, 'Aliquam', 'aliquam-Pys5T1', '[{\"id\":\"29\",\"name\":\"Gifts\",\"slug\":\"gifts\",\"position\":1},{\"id\":\"40\",\"name\":\"Mother Day\",\"slug\":\"mother-day\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-01-28-61f3b1c30b04d.png\"]', '2022-01-28-61f3b1c30cfd2.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 150, 100, '0', 'percent', '10', 'flat', 9, '<p>Morbi id ipsum lacinia, viverra lorem quis, tempor turpis. In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla.&nbsp;</p>', 0, NULL, '2022-01-28 15:05:07', '2022-02-02 18:55:18', 1, 1, 'Aliquam', 'Morbi id ipsum lacinia, viverra lorem quis, tempor turpis. In accumsan neque ac mauris maximus, facilisis feugiat tellus imperdiet. Nulla a malesuada nulla.', '2022-01-28-61f3b1c310f08.png'),
(143, 'admin', 1, '3 pieces', '3-pcs-uRwyO5', '[{\"id\":\"30\",\"name\":\"Candels\",\"slug\":\"candels\",\"position\":1},{\"id\":\"59\",\"name\":\"Box\",\"slug\":\"box\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-02-09-6203940fbd251.png\"]', '2022-02-09-6203940fc3f9a.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 120, 120, '0', 'percent', '0', 'flat', 50, '<p>Candle boxed three pieces , white color and&nbsp;gold / silver / white ribbion</p>', 0, NULL, '2022-02-09 16:14:39', '2022-02-09 16:15:03', 1, 1, 'candle boxes 3 pieces', 'Candle boxed three pieces , white color and gold / silver / white ribbion.', '2022-02-09-6203940fd4a73.png'),
(144, 'admin', 1, 'Air balloon', 'air-balloon-kdGiR9', '[{\"id\":\"48\",\"name\":\"Baby\",\"slug\":\"baby\",\"position\":1},{\"id\":\"49\",\"name\":\"Born Collection\",\"slug\":\"born-collection\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-02-09-6203952ed65b4.png\"]', '2022-02-09-6203952ed729a.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 45, 45, '0', 'percent', '0', 'flat', 45, '<p>Air balloon with blue / pink color and having&nbsp; blue , pink ribbon and blue / white / marble box</p>', 0, NULL, '2022-02-09 16:19:26', '2022-02-14 20:28:16', 1, 1, 'Air Balloon', 'Air balloon with blue / pink color and having  blue , pink ribbon and blue / white / marble box.', '2022-02-09-6203952ed9306.png'),
(145, 'admin', 1, 'Barbary dress', 'barbary-dress-bl5Xyp', '[{\"id\":\"48\",\"name\":\"Baby\",\"slug\":\"baby\",\"position\":1},{\"id\":\"49\",\"name\":\"Born Collection\",\"slug\":\"born-collection\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-02-09-6203962e18e67.png\"]', '2022-02-09-6203962e19ba5.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 45, 45, '0', 'percent', '0', 'flat', 50, '<p>barbary dress with brown color and gold / white / maroon ribbon&nbsp;</p>', 0, NULL, '2022-02-09 16:23:42', '2022-02-09 16:23:42', 1, 1, 'Barbary dress', 'barbary dress with brown color and gold / white / maroon ribbon ', '2022-02-09-6203962e1bcfd.png'),
(146, 'admin', 1, 'Elephant Baby', 'elephant-baby-5FxWyd', '[{\"id\":\"48\",\"name\":\"Baby\",\"slug\":\"baby\",\"position\":1},{\"id\":\"49\",\"name\":\"Born Collection\",\"slug\":\"born-collection\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-02-09-620396af1df5d.png\"]', '2022-02-09-620396af1eca3.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 45, 45, '0', 'percent', '0', 'flat', 50, '<p>Elephant baby born collection , having pink / blue color with pink / blue ribbon</p>', 0, NULL, '2022-02-09 16:25:51', '2022-02-09 16:25:51', 1, 1, 'Elephant Baby', 'Elephant baby born collection , having pink / blue color with pink / blue ribbon', '2022-02-09-620396af20ca1.png'),
(147, 'admin', 1, 'Fram teddy bear', 'fram-teddy-bear-jAg9Zu', '[{\"id\":\"48\",\"name\":\"Baby\",\"slug\":\"baby\",\"position\":1},{\"id\":\"49\",\"name\":\"Born Collection\",\"slug\":\"born-collection\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-02-09-62039a7471e8e.png\"]', '2022-02-09-62039a7472bb3.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 40, 40, '0', 'percent', '0', 'flat', 0, '<p>Fram teddy bear having pink / blue color with pink / blue ribbon and white box</p>', 0, NULL, '2022-02-09 16:41:56', '2022-02-09 16:41:56', 1, 1, 'Fram teddy bear', 'Fram teddy bear having pink / blue color with pink / blue ribbon and white box', '2022-02-09-62039a7474a94.png'),
(148, 'admin', 1, 'Pear', 'pear-5dN8GZ', '[{\"id\":\"48\",\"name\":\"Baby\",\"slug\":\"baby\",\"position\":1},{\"id\":\"49\",\"name\":\"Born Collection\",\"slug\":\"born-collection\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-02-09-62039b3400354.png\"]', '2022-02-09-62039b34011e1.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 45, 45, '0', 'percent', '0', 'flat', 50, '<p>Pear with blue / pink color and white&nbsp;box along with pink / blue ribbon</p>', 0, NULL, '2022-02-09 16:45:08', '2022-02-09 16:45:08', 1, 1, 'Pear', 'Pear with blue / pink color and white box along with pink / blue ribbon', '2022-02-09-62039b3403579.png'),
(149, 'admin', 1, 'Rabbit', 'rabbit-8Jk2J8', '[{\"id\":\"48\",\"name\":\"Baby\",\"slug\":\"baby\",\"position\":1},{\"id\":\"49\",\"name\":\"Born Collection\",\"slug\":\"born-collection\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-02-09-62039bef3a907.png\"]', '2022-02-09-62039bef3b646.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 45, 45, '0', 'percent', '0', 'flat', 50, '<p>Rabbit having biege / pink / blue / green&nbsp;color along with white box and blue / pink ribbon</p>', 0, NULL, '2022-02-09 16:48:15', '2022-02-09 16:48:15', 1, 1, 'Rabbit', 'Rabbit having beige / pink / blue / green color along with white box and blue / pink ribbon', '2022-02-09-62039bef3d76b.png'),
(150, 'admin', 1, 'Horse', 'horse-CSGGFY', '[{\"id\":\"48\",\"name\":\"Baby\",\"slug\":\"baby\",\"position\":1},{\"id\":\"50\",\"name\":\"Boy Collection\",\"slug\":\"boy-collection\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-02-09-62039c8d23d9e.png\"]', '2022-02-09-62039c8d24a82.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 40, 40, '0', 'percent', '0', 'flat', 0, '<p>Horse having blue color along with white box and white / blue ribbon</p>', 0, NULL, '2022-02-09 16:50:53', '2022-02-09 16:50:53', 1, 1, 'Horse', 'Horse having blue color along with white box and white / blue ribbon', '2022-02-09-62039c8d2699f.png'),
(151, 'admin', 1, 'Blue Dress', 'blue-dress-XN0SxE', '[{\"id\":\"48\",\"name\":\"Baby\",\"slug\":\"baby\",\"position\":1},{\"id\":\"50\",\"name\":\"Boy Collection\",\"slug\":\"boy-collection\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-02-09-62039d319fdbe.png\"]', '2022-02-09-62039d31a0a9b.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 45, 45, '0', 'percent', '0', 'flat', 50, '<p>blue colored dress with white box and blue / white ribbon</p>', 0, NULL, '2022-02-09 16:53:37', '2022-02-09 16:53:37', 1, 1, 'Blue Dress', 'blue colored dress with white box and blue / white ribbon', '2022-02-09-62039d31a2923.png'),
(152, 'admin', 1, 'Flower Frame', 'flower-frame-KRYW8i', '[{\"id\":\"48\",\"name\":\"Baby\",\"slug\":\"baby\",\"position\":1},{\"id\":\"51\",\"name\":\"Girl Collection\",\"slug\":\"girl-collection\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-02-09-62039d93e24c2.png\"]', '2022-02-09-62039d93e31ff.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 40, 40, '0', 'percent', '0', 'flat', 50, '<p>Flower frame having pink color with pink / white ribbon</p>', 0, NULL, '2022-02-09 16:55:15', '2022-02-09 16:55:15', 1, 1, 'Flower Frame', 'Flower frame having pink color with pink / white ribbon', '2022-02-09-62039d93e5489.png'),
(153, 'admin', 1, 'Pink Dress', 'pink-dress-WYt3tp', '[{\"id\":\"48\",\"name\":\"Baby\",\"slug\":\"baby\",\"position\":1},{\"id\":\"51\",\"name\":\"Girl Collection\",\"slug\":\"girl-collection\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-02-09-62039e10a97cd.png\"]', '2022-02-09-62039e10aac53.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 45, 45, '0', 'percent', '0', 'flat', 50, '<p>pink dress&nbsp;with pink color having&nbsp; white / pink / ribbon and white box</p>', 0, NULL, '2022-02-09 16:57:20', '2022-02-09 16:57:20', 1, 1, 'Pink Dress', 'pink dress with pink color having  white / pink / ribbon and white box', '2022-02-09-62039e10adb8e.png'),
(154, 'admin', 1, 'Concrete Mabkhara', 'concrete-mabkhara-E0Xgf2', '[{\"id\":\"52\",\"name\":\"Mabkhara\",\"slug\":\"mabkhara\",\"position\":1},{\"id\":\"53\",\"name\":\"Concrete\",\"slug\":\"concrete\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-02-09-6203a65672b45.png\"]', '2022-02-09-6203a656737d3.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 55, 55, '0', 'percent', '0', 'flat', 50, '<p>Mabkhara having blue / pink / white / marble color with gold /&nbsp;&nbsp;blue /&nbsp;pink / ribbon&nbsp;</p>', 0, NULL, '2022-02-09 17:32:38', '2022-02-09 17:32:38', 1, 1, 'Concrete Mabkhara', 'Mabkhara having blue / pink / white / marble color with gold /  blue / pink / ribbon ', '2022-02-09-6203a656756f9.png'),
(155, 'admin', 1, 'Flower', 'flower-887CZj', '[{\"id\":\"52\",\"name\":\"Mabkhara\",\"slug\":\"mabkhara\",\"position\":1},{\"id\":\"54\",\"name\":\"Stone\",\"slug\":\"stone\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-02-09-6203a70b0afed.png\"]', '2022-02-09-6203a70b0bd46.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 48, 48, '0', 'percent', '0', 'flat', 0, '<p>Flower Mabkhara having white / blue / pink color with gold / blue / pink ribbon</p>', 0, NULL, '2022-02-09 17:35:39', '2022-02-09 17:35:39', 1, 1, 'Flower', 'Flower Mabkhara having white / blue / pink color with gold / blue / pink ribbon', '2022-02-09-6203a70b0e1da.png'),
(156, 'admin', 1, 'Leather Mabkhara', 'leather-mabkhara-CmDA5Z', '[{\"id\":\"52\",\"name\":\"Mabkhara\",\"slug\":\"mabkhara\",\"position\":1},{\"id\":\"55\",\"name\":\"Leather\",\"slug\":\"leather\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-02-09-6203a7bc2c002.png\"]', '2022-02-09-6203a7bc2ce9c.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 230, 230, '0', 'percent', '0', 'flat', 50, '<p>Mabkhara with acrylic having beige / brown / gray / black / maroon having gold / black / maroon / grey ribbon</p>', 0, NULL, '2022-02-09 17:38:36', '2022-02-09 17:38:36', 1, 1, 'Leather Mabkhara', 'Mabkhara with acrylic having beige / brown / gray / black / maroon having gold / black / maroon / grey ribbon', '2022-02-09-6203a7bc2f01b.png'),
(157, 'admin', 1, 'orchid', 'orchid-VNr2q1', '[{\"id\":\"56\",\"name\":\"Pillow\",\"slug\":\"pillow\",\"position\":1},{\"id\":\"57\",\"name\":\"Orchid\",\"slug\":\"orchid\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-02-09-6203a85d35e78.png\"]', '2022-02-09-6203a85d36b0e.png', NULL, NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 38, 38, '0', 'percent', '0', 'flat', 50, '<p>pillow having blue / pink / yellow color along with blue / pink / white ribbon</p>', 0, NULL, '2022-02-09 17:41:17', '2022-02-09 17:41:17', 1, 1, 'orchid', 'pillow having blue / pink / yellow color along with blue / pink / white ribbon', '2022-02-09-6203a85d38cab.png'),
(158, 'admin', 1, 'Gelcerain', 'gelcerain-Ci0jK7', '[{\"id\":\"31\",\"name\":\"Soap\",\"slug\":\"soap\",\"position\":1},{\"id\":\"58\",\"name\":\"Dress\",\"slug\":\"dress\",\"position\":2}]', NULL, 'kg', 1, 1, '[\"2022-02-09-6203a90458b48.png\"]', '2022-02-09-6203a90459ad7.png', '0', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 38, 38, '0', 'percent', '0', 'flat', 50, '<p>Gelcerain soap dress having colors as per request along with blue / pink / white / green / yellow / purple&nbsp;</p>', 0, NULL, '2022-02-09 17:44:04', '2022-02-17 01:42:07', 1, 1, 'Gelcerain', 'Gelcerain soap dress having colors as per request along with blue / pink / white / green / yellow / purple ', '2022-02-09-6203a9045beca.png');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `qty` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request_items`
--

CREATE TABLE `request_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `first_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `customer_id`, `comment`, `attachment`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 23, 97, 'good', '[\"review\\/GZznygozmDapxWtpb1jmFucm51aoRTzAVu4iQyDK.jpg\"]', 5, 1, '2021-06-04 20:55:16', '2021-06-04 20:55:16'),
(2, 34, 97, 'good', '[]', 1, 1, '2021-06-05 01:47:53', '2021-06-05 01:47:53'),
(3, 34, 97, 'okay', '[]', 5, 1, '2021-06-05 06:24:51', '2021-06-05 06:24:51'),
(4, 41, 97, 'oka', '[]', 1, 1, '2021-06-05 06:34:09', '2021-06-05 06:34:09'),
(5, 40, 97, 'great', '[\"review\\/pqXIjC40O8rYU7WFBwQaMUD32ObIObvKCRssLdF6.jpg\"]', 1, 1, '2021-06-05 06:36:56', '2021-06-05 06:36:56'),
(6, 1, 101, 'Nice', '[\"review\\/DQh9xsD7fiyjheN9qOI6gXmFwEXrRebHzuliR4lY.jpg\"]', 1, 1, '2021-06-05 06:42:05', '2021-06-05 06:42:05'),
(7, 40, 97, 'very 5', '[]', 5, 1, '2021-06-05 06:42:41', '2021-06-05 06:42:41'),
(8, 40, 97, 'okaaaa', '[]', 4, 1, '2021-06-05 07:27:09', '2021-06-05 07:27:09'),
(9, 41, 97, 'abcd123', '[]', 4, 1, '2021-06-05 07:28:31', '2021-06-05 07:28:31');

-- --------------------------------------------------------

--
-- Table structure for table `search_functions`
--

CREATE TABLE `search_functions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search_functions`
--

INSERT INTO `search_functions` (`id`, `key`, `url`, `visible_for`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'admin/dashboard', 'admin', NULL, NULL),
(2, 'Order All', 'admin/orders/list/all', 'admin', NULL, NULL),
(3, 'Order Pending', 'admin/orders/list/pending', 'admin', NULL, NULL),
(4, 'Order Processed', 'admin/orders/list/processed', 'admin', NULL, NULL),
(5, 'Order Delivered', 'admin/orders/list/delivered', 'admin', NULL, NULL),
(6, 'Order Returned', 'admin/orders/list/returned', 'admin', NULL, NULL),
(7, 'Order Failed', 'admin/orders/list/failed', 'admin', NULL, NULL),
(8, 'Brand Add', 'admin/brand/add-new', 'admin', NULL, NULL),
(9, 'Brand List', 'admin/brand/list', 'admin', NULL, NULL),
(10, 'Banner', 'admin/banner/list', 'admin', NULL, NULL),
(11, 'Category', 'admin/category/view', 'admin', NULL, NULL),
(12, 'Sub Category', 'admin/category/sub-category/view', 'admin', NULL, NULL),
(13, 'Sub sub category', 'admin/category/sub-sub-category/view', 'admin', NULL, NULL),
(14, 'Attribute', 'admin/attribute/view', 'admin', NULL, NULL),
(15, 'Product', 'admin/product/list', 'admin', NULL, NULL),
(16, 'Coupon', 'admin/coupon/add-new', 'admin', NULL, NULL),
(17, 'Custom Role', 'admin/custom-role/create', 'admin', NULL, NULL),
(18, 'Employee', 'admin/employee/add-new', 'admin', NULL, NULL),
(19, 'Seller', 'admin/sellers/seller-list', 'admin', NULL, NULL),
(20, 'Contacts', 'admin/contact/list', 'admin', NULL, NULL),
(21, 'Flash Deal', 'admin/deal/flash', 'admin', NULL, NULL),
(22, 'Deal of the day', 'admin/deal/day', 'admin', NULL, NULL),
(23, 'Language', 'admin/business-settings/language', 'admin', NULL, NULL),
(24, 'Mail', 'admin/business-settings/mail', 'admin', NULL, NULL),
(25, 'Shipping method', 'admin/business-settings/shipping-method/add', 'admin', NULL, NULL),
(26, 'Currency', 'admin/currency/view', 'admin', NULL, NULL),
(27, 'Payment method', 'admin/business-settings/payment-method', 'admin', NULL, NULL),
(28, 'SMS Gateway', 'admin/business-settings/sms-gateway', 'admin', NULL, NULL),
(29, 'Support Ticket', 'admin/support-ticket/view', 'admin', NULL, NULL),
(30, 'FAQ', 'admin/helpTopic/list', 'admin', NULL, NULL),
(31, 'About Us', 'admin/business-settings/about-us', 'admin', NULL, NULL),
(32, 'Terms and Conditions', 'admin/business-settings/terms-condition', 'admin', NULL, NULL),
(33, 'Web Config', 'admin/business-settings/web-config', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` text COLLATE utf8mb4_unicode_ci,
  `sales_commission_percentage` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallets`
--

CREATE TABLE `seller_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `balance` double NOT NULL DEFAULT '0',
  `withdrawn` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_histories`
--

CREATE TABLE `seller_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'home',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `customer_id`, `contact_person_name`, `address_type`, `address`, `city`, `zip`, `phone`, `created_at`, `updated_at`, `state`, `country`) VALUES
(1, '6', 'Hope', 'home', '33 Hanley St York ON M6S 2H3', 'Toronto', '66777', '12345678910', '2021-11-22 21:26:25', '2021-11-22 21:26:25', NULL, 'Canada'),
(2, '7', 'jkh', 'permanent', 'jkhasdkhk', 'khkasdhkh', 'jkhasdjkhj', 'asdjhk', '2021-12-13 15:08:33', '2021-12-13 15:08:33', NULL, 'kjhasdjkh');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT '0.00',
  `duration` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `creator_id`, `creator_type`, `title`, `cost`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'Courier', 0.00, '4-6 days', 0, '2020-10-27 23:44:01', '2020-12-22 00:01:29'),
(2, 1, 'admin', 'Company Vehicle', 5.00, '2 Week', 1, '2021-05-26 05:57:04', '2021-05-26 05:57:04'),
(4, 1, 'admin', 'Slow shipping', 10.00, '40 days', 1, '2020-12-14 22:43:46', '2021-02-28 05:17:48'),
(5, 1, 'admin', 'by air', 100.00, '2 days', 1, '2021-05-26 05:57:40', '2021-05-26 05:57:40'),
(6, 10, 'seller', 'by air', 100.00, '4 days', 1, '2021-05-30 01:12:40', '2021-05-30 01:12:40');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `name`, `link`, `icon`, `active_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 'twitter', 'https://www.w3schools.com/howto/howto_css_table_responsive.asp', 'twitter.svg', 1, 1, '2021-01-01 07:18:03', '2021-01-01 07:18:25'),
(4, 'youtube', 'https://dev.6amtech.com/', 'youtube.svg', 1, 1, '2021-02-28 02:24:14', '2022-01-04 16:25:47'),
(5, 'instagram', 'https://dev.6amtech.com/', 'instagram.svg', 1, 1, '2021-02-28 02:24:36', '2021-10-12 22:07:32'),
(6, 'facebook', 'https://www.facebook.com', 'facebook.svg', 1, 1, '2021-02-28 05:19:42', '2022-01-04 16:13:27');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `subject` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'low',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_convs`
--

CREATE TABLE `support_ticket_convs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `customer_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_for` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` bigint(20) DEFAULT NULL,
  `payment_receiver_id` bigint(20) DEFAULT NULL,
  `paid_by` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_to` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) NOT NULL,
  `translationable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `translationable_type`, `translationable_id`, `locale`, `key`, `value`) VALUES
(0, 'App\\Model\\Product', 83, 'af', 'name', 'TSA HOODIE'),
(0, 'App\\Model\\Product', 83, 'af', 'description', '<p><strong>Materials and Features</strong></p>\r\n\r\n<p>Heavyweight cut and sewn pullover hooded sweatshirt in black. Item features infrared graphic printed across the front. Perfect condition, item comes in original packaging. 12oz/340g cotton.</p>\r\n\r\n<p><strong>Size and Fit</strong></p>\r\n\r\n<p>Fits true to size.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `f_name`, `l_name`, `phone`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `street_address`, `country`, `city`, `zip`, `house_no`, `apartment_no`, `cm_firebase_token`, `is_active`, `gender`, `dob`) VALUES
(1, NULL, 'Jason', 'Brown', '03453368866', 'def.png', 'jason.brown@sharklasers.com', NULL, '$2y$10$Wkygbv8RnipCO.Mlz.jb6.LT0M1P8LZwglbQft2ZmOkN9jAJri1j6', 'gXHIDZdah1Bw8pOkpHYYva9RkQCYbsiv10bRu5Xftf3LSZtM3dUTunEGSRvs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(2, NULL, 'Will', 'Smith', '03453368866', 'def.png', 'will.smith@inoviotech.com', NULL, '$2y$10$LFoQ6M7ek7WuXGuBxtvbmOWvn7ASJcX2efdkzaYkOPrXmL00Gmwa6', NULL, NULL, '2021-09-09 19:05:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(3, NULL, 'David', 'Warner', '03453368866', '1631188425-6139f5c9a2d7b.png', 'david.warner@inoviotech.com', NULL, '$2y$10$EV/koJi4t29AEc0IZugFN.h9RN0mhNqN0lIs2L//RrwsvTtS2vcGS', NULL, NULL, '2021-09-09 21:53:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(4, NULL, 'TEST', 'TEST', '4555', 'def.png', 'TEST@GMAIL.COM', NULL, '$2y$10$aliM18UTTFXNOSWGV3uuqO.edwzJqL2HxcaEYxnGq9mySQwp50agu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(5, NULL, 'Hope', 'Frank', '00000000000', 'def.png', 'hope@gmailcom', NULL, '$2y$10$Jo7dQJW8nlK79LSnOPobRu1wdbOx18EhNcpCf1SKMvOW61sVmgstK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(6, NULL, 'Hope', 'Miles', '00000000000', '1637571755-619b5cab3289e.png', 'hope@gmail.com', NULL, '$2y$10$X.InhZKclvJje71Qxnm3PeZVJufKUgCaJi/Q9aNMO8VL10uMDDiHm', NULL, NULL, '2021-11-22 20:02:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(7, NULL, 'AB', 'Dar', '123123123', 'def.png', 'abdar@gmail.com', NULL, '$2y$10$SB4Cm.QwgAFHb4EXrqhx1O6gXKEjvQFj/Jpwk.ufYfOaw3Pq.R.oK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(8, NULL, 'John', 'Martin', '7923486942', 'def.png', 'john@gmail.com', NULL, '$2y$10$Re/cNrbTEq5l1kRkVq1Cg.KG3z1duGQ9NMnXE3Z0O.v4rjq1t7Olu', NULL, NULL, '2022-01-31 20:42:09', '14 Henry Street', 'United States', 'Fort Lauderdale', '33309', NULL, NULL, NULL, 1, 'male', '2021-12-23'),
(9, NULL, '3333', '3333', 'dssd', 'def.png', 'aaa@gmail.com', NULL, '$2y$10$HmWll.dF9jX54CojsSuypexByBDDeZoVpwY58kmT5Dgf1Ubgby4g2', NULL, NULL, '2022-01-05 03:07:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL),
(10, NULL, 'test', 'test', '12345678', 'def.png', 'testdevM@gmail.com', NULL, '$2y$10$Bae176viva2vkHTN8yLlruVUqCq9NhJRfxQd3uwgZkNjd4ErUHbmm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(11, NULL, 'test', 'test', '1234567890', 'def.png', 'test123@gmail.com', NULL, '$2y$10$oFp48zR06gbjVKHUGkyRMOSg72zwLOfjYxWJpAy6i84ZfLdIzFwm.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(12, NULL, 'kane', 'clinton', '+123123123', 'def.png', 'kaneclinton064@gmail.com', NULL, '$2y$10$kMwxGObxUoBdDVm7.2jtZu4qdv6/p33UcsVluT2dfRFLACIoZ53eu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(13, NULL, 'aaasss', 'aaasss', '12345999999', 'def.png', 'aa@a.com', NULL, '$2y$10$UVqeULuFcXeGhpiDqrrBausxDcAO.nQxAqBOSRz8.BqkXYnqZW4B2', NULL, NULL, '2022-01-20 20:58:57', 'as', 'as', 'sa', 'as', NULL, NULL, NULL, 1, 'male', '2022-01-05'),
(14, NULL, 'tt', 'tt', '1234567890', 'def.png', 'lauralwest.lw@gmail.com', NULL, '$2y$10$qQtTAQWZqJUQJRVjoK3S2OwIaqwK7z7aQ6qOoIuIhq4kC.rQmrSsO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(15, NULL, 'afass', 'afa', '665564654465', 'def.png', 'leqifi@thichanthit.com', NULL, '$2y$10$7.e/rVWSQN.KeL9hgKO4vOrEY8n6LiGU8DqvMjAhx1Pi0tyIBBb5C', NULL, NULL, '2022-01-28 21:30:20', 'as', 'as', 'as', 'as', NULL, NULL, NULL, 1, 'male', '2022-01-12'),
(16, NULL, 'mazen', 'mekdad', '3333349136', 'def.png', 'mazenkm96@gmail.com', NULL, '$2y$10$a.NPklzR4U1ldB7oc/V26OHRX4Mdz3AEVx6dGYU1Pg15DSBHrqKjm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(17, NULL, 'aaa aaa', 'aaa aaa', '56565656565', 'def.png', 'yy@gmail.com', NULL, '$2y$10$EjRbSmmsf9LOjuxIScdZQuRT3zHrKmYLunkZdEu2cL2EljKHjzRIC', NULL, NULL, '2022-01-31 20:35:47', 'aaa', 'United States', 'aaa', '99502', NULL, NULL, NULL, 1, 'male', '2022-01-06'),
(18, NULL, 'test', 'test', '1234567890', 'def.png', 'test4190@gmail.com', NULL, '$2y$10$o2zmjQQG3EyHJ5dacy10w.Ewa9V8mix/2xN8w1W92CYEVcYwg./gK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(19, NULL, 'tt', 'ttt', '465654654654654654', 'def.png', 'pp@gmail.com', NULL, '$2y$10$WL/oEr/Q0VuN5iiwZPArRezz8FdTh0ApKjfPDOeKBSEj0jlbA6Swy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(20, NULL, 'ii', 'ii', '56654465654645', 'def.png', 'ii@gmail.com', NULL, '$2y$10$2LwV9eLQGp956x3koSxhAOcahabLCF/BEGCOUCVomON6d3ZFtVvz6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(21, NULL, 'Igor', 'Porter', '+1 (704) 773-3286', NULL, 'sihoza@mailinator.com', NULL, '$2y$10$Z2KoXu7Uu1AW1fWySbyk2.ULCaLZ8r0eXDyG0QuWwXRpvdVYBuP9.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(22, NULL, 'Gloria', 'Avila', '+1 (306) 833-5486', NULL, 'qikuh@mailinator.com', NULL, '$2y$10$ZA8FmTeyb7J5UqMGJeYh9elkNU2.1eWvH0qy42NFdHB6IhxN1YPcy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(23, NULL, 'Thor', 'Huffman', '+1 (879) 649-5759', NULL, 'pofaxo5345@petloca.com', NULL, '$2y$10$sYXaWQAfPGOhUicRhmeaVOSu.1dNsTWg6PR9RR9msUqPRZADAG1G6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(24, NULL, 'Hanae', 'Bradley', '+1 (689) 269-1216', NULL, 'bygyno@norwegischlernen.info', NULL, '$2y$10$IG310yrgX5vt.IF1toxVruh2UR2aw7w5CzCjEkde6IJaWssY/YXqW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(25, NULL, 'Julian', 'Lynn', '+1 (201) 916-5214', NULL, 'jr90b6vzem@thejoker5.com', NULL, '$2y$10$xMCNNhfMtiv1Zp4AIDopMe/kaXWSMW7N0pPF/xbm6k.q5AoyN9ZYi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(26, NULL, 'Anjolie', 'Barron', '+1 (645) 205-3693', NULL, 'prnrpzapcbylswr@sinaite.net', NULL, '$2y$10$tkImcVx20ZKYuRUmXjeVX.vpEHKwwkdBTc92YNpBJd8XwBDmVFN/6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(27, NULL, 'test1', 'test', '464564565654645', NULL, 'danielpearl2132@gmail.com', NULL, '$2y$10$3R4Q/7XyUeMj9LyW1WIE3O0k1x7xyus.qVGSR/qSFaLm7EPi7qxsy', NULL, NULL, '2022-02-17 00:31:10', 'A', 'A', 'A', '64564', NULL, NULL, NULL, 1, 'female', '2022-02-17');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `customer_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 4, 89, '2021-10-21 15:07:55', '2021-10-21 15:07:55'),
(2, 4, 82, '2021-10-21 15:08:07', '2021-10-21 15:08:07'),
(3, 6, 88, '2021-11-22 21:55:10', '2021-11-22 21:55:10'),
(4, 7, 88, '2021-12-12 11:54:03', '2021-12-12 11:54:03'),
(8, 8, 90, '2021-12-21 15:23:10', '2021-12-21 15:23:10'),
(11, 9, 91, '2022-01-05 02:42:08', '2022-01-05 02:42:08'),
(14, 13, 90, '2022-01-20 21:25:56', '2022-01-20 21:25:56'),
(15, 8, 91, '2022-01-27 16:34:04', '2022-01-27 16:34:04'),
(16, 8, 92, '2022-01-27 16:34:12', '2022-01-27 16:34:12'),
(17, 15, 93, '2022-01-28 22:34:07', '2022-01-28 22:34:07'),
(21, 20, 98, '2022-01-31 22:24:38', '2022-01-31 22:24:38');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `transaction_note` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chattings`
--
ALTER TABLE `chattings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consignments`
--
ALTER TABLE `consignments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_deals`
--
ALTER TABLE `feature_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_topics`
--
ALTER TABLE `help_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `look_books`
--
ALTER TABLE `look_books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `look_book_attachments`
--
ALTER TABLE `look_book_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `look_book_products`
--
ALTER TABLE `look_book_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_items`
--
ALTER TABLE `request_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_functions`
--
ALTER TABLE `search_functions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD UNIQUE KEY `transactions_id_unique` (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `chattings`
--
ALTER TABLE `chattings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `consignments`
--
ALTER TABLE `consignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_deals`
--
ALTER TABLE `feature_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_topics`
--
ALTER TABLE `help_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `look_books`
--
ALTER TABLE `look_books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `look_book_attachments`
--
ALTER TABLE `look_book_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `look_book_products`
--
ALTER TABLE `look_book_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100074;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_items`
--
ALTER TABLE `request_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `search_functions`
--
ALTER TABLE `search_functions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
