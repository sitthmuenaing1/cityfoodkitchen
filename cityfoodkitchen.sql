-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2026 at 03:09 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cityfoodkitchen`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `adminid` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`adminid`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'admin@cityfoodkitchen.com', '@admin123', '2026-04-13 03:59:42', '2026-04-13 03:59:42'),
(2, 'customerservice@cityfoodkitchen.com', '@customerservice123', '2026-04-13 04:03:43', '2026-04-13 04:03:43'),
(3, 'management@cityfoodkitchen.com', '@management123', '2026-04-13 03:59:25', '2026-04-13 03:59:25'),
(4, 'finance@cityfoodkitchen.com', '@finance123', '2026-04-13 04:04:53', '2026-04-13 04:04:53'),
(5, 'operation@cityfoodkitchen.com', '@operation123', '2026-04-13 04:00:58', '2026-04-13 04:00:58');

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
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `mid` int(5) NOT NULL,
  `mname` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `imgs` varchar(100) NOT NULL,
  `mtid` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`mid`, `mname`, `price`, `imgs`, `mtid`) VALUES
(1, 'Chicken Burger', 5, '01.jpg', 1),
(2, 'Beef Burger', 6, '02.jpg', 1),
(3, 'Double Cheese Burger (Chicken)', 7, '03.jpg', 1),
(4, 'Double Cheese Burger (Beef)', 8, '04.jpg', 1),
(5, 'Chicken Hot Dog', 4, '05.png', 1),
(6, 'Cheese Pizza', 9, '06.jpg', 1),
(7, 'Pepperoni Pizza', 10, '07.png', 1),
(8, 'BBQ Chicken Pizza', 11, '08.jpg', 1),
(9, 'Fried Chicken', 6, '09.jpg', 1),
(10, 'Spicy Fried Chicken', 7, '10.jpg', 1),
(11, 'Chicken Nuggets', 3, '11.jpg', 1),
(12, 'Fried Onion Rings', 3, '12.jpg', 1),
(13, 'French Fries', 3, '13.jpg', 1),
(14, 'Chicken Taco', 3, '14.jpg', 1),
(15, 'Beef Taco', 4, '15.jpg', 1),
(16, 'Coca-Cola', 2, '16.png', 2),
(17, 'Pepsi', 2, '17.jpg', 2),
(18, 'Fanta Orange', 2, '18.jpg', 2),
(19, 'Sprite Lemon-Lime', 2, '19.jpg', 2),
(20, 'Ice Coffee', 3, '20.jpg', 2),
(21, 'Bubble Tea', 4, '21.jpg', 2),
(22, 'Strawberry Milkshake', 4, '22.jpg', 2),
(23, 'Avocado Milkshake ', 4, '23.jpg', 2),
(24, 'Water', 1, '24.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `menutype`
--

CREATE TABLE `menutype` (
  `mtid` int(5) NOT NULL,
  `mtname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menutype`
--

INSERT INTO `menutype` (`mtid`, `mtname`) VALUES
(1, 'Food'),
(2, 'Drinks');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `ordertime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment` varchar(20) NOT NULL,
  `billingaddress` varchar(500) NOT NULL,
  `phonenumber` varchar(15) NOT NULL,
  `ordernumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderid`, `mid`, `quantity`, `ordertime`, `id`, `payment`, `billingaddress`, `phonenumber`, `ordernumber`) VALUES
(1, 6, 1, '2026-04-09 02:15:06', 1, 'Credit Card', '245 W 34th St, New York, NY 10001', '+123456789', 1),
(2, 24, 1, '2026-04-09 02:15:06', 1, 'Credit Card', '245 W 34th St, New York, NY 10001', '+123456789', 1),
(3, 2, 2, '2026-04-09 02:15:06', 1, 'Credit Card', '245 W 34th St, New York, NY 10001', '+123456789', 1),
(4, 16, 1, '2026-04-09 02:15:06', 1, 'Credit Card', '245 W 34th St, New York, NY 10001', '+123456789', 1),
(5, 12, 1, '2026-04-09 03:36:22', 2, 'Credit Card', '18 E 47th St, New York, NY 10017', '+198765432', 2),
(6, 19, 1, '2026-04-09 03:36:22', 2, 'Credit Card', '18 E 47th St, New York, NY 10017', '+198765432', 2),
(7, 7, 1, '2026-04-09 04:08:41', 2, 'Credit Card', '18 E 47th St, New York, NY 10017', '+198765432', 3),
(8, 11, 2, '2026-04-11 12:21:40', 3, 'PayPal', '502 9th Ave, New York, NY 10018', '+1112223334', 4),
(9, 8, 1, '2026-04-11 12:21:40', 3, 'PayPal', '502 9th Ave, New York, NY 10018', '+1112223334', 4),
(10, 22, 1, '2026-04-11 12:21:40', 3, 'PayPal', '502 9th Ave, New York, NY 10018', '+1112223334', 4),
(11, 16, 1, '2026-04-11 05:56:42', 4, 'Cash', '77 Water St, New York, NY 10005', '+12223334445', 5),
(12, 7, 1, '2026-04-11 05:56:42', 4, 'Cash', '77 Water St, New York, NY 10005', '+12223334445', 5),
(13, 3, 1, '2026-04-11 08:23:58', 1, 'Credit Card', '245 W 34th St, New York, NY 10001', '+123456789', 6),
(14, 14, 3, '2026-04-12 10:30:34', 1, 'Credit Card', '245 W 34th St, New York, NY 10001', '+123456789', 7),
(15, 6, 1, '2026-04-12 10:30:34', 1, 'Credit Card', '245 W 34th St, New York, NY 10001', '+123456789', 7),
(16, 21, 1, '2026-04-12 10:30:34', 1, 'Credit Card', '245 W 34th St, New York, NY 10001', '+123456789', 7),
(17, 3, 1, '2026-04-13 03:57:05', 2, 'Credit Card', '18 E 47th St, New York, NY 10017', '+198765432', 8),
(18, 21, 1, '2026-04-13 03:57:05', 2, 'Credit Card', '18 E 47th St, New York, NY 10017', '+198765432', 8),
(19, 9, 2, '2026-04-13 04:19:09', 6, 'PayPal', '120 W 23rd St, New York, NY 10011', '+1777666999', 9),
(20, 12, 1, '2026-04-13 04:19:09', 6, 'PayPal', '120 W 23rd St, New York, NY 10011', '+1777666999', 9),
(21, 1, 1, '2026-04-13 04:19:09', 6, 'PayPal', '120 W 23rd St, New York, NY 10011', '+1777666999', 9),
(22, 3, 2, '2026-04-26 08:13:18', 7, 'PayPal', '89 E Houston St, New York, NY 10002', '+1998877665', 10),
(23, 18, 1, '2026-04-26 08:13:18', 7, 'PayPal', '89 E Houston St, New York, NY 10002', '+1998877665', 10),
(24, 7, 1, '2026-04-26 08:18:57', 5, 'Credit Card', '310 Lexington Ave, New York, NY 10016', '+14445556667', 11),
(25, 11, 1, '2026-04-26 08:18:57', 5, 'Credit Card', '310 Lexington Ave, New York, NY 10016', '+14445556667', 11),
(26, 21, 1, '2026-04-26 08:18:57', 5, 'Credit Card', '310 Lexington Ave, New York, NY 10016', '+14445556667', 11),
(27, 9, 3, '2026-04-26 08:30:24', 2, 'PayPal', '18 E 47th St, New York, NY 10017', '+198765432', 12),
(28, 13, 2, '2026-04-26 08:30:24', 2, 'PayPal', '18 E 47th St, New York, NY 10017', '+198765432', 12),
(29, 16, 3, '2026-04-26 08:30:24', 2, 'PayPal', '18 E 47th St, New York, NY 10017', '+198765432', 12),
(30, 2, 1, '2026-04-28 21:24:39', 1, 'Credit Card', '245 W 34th St, New York, NY 10001', '+123456789', 13),
(31, 8, 1, '2026-04-28 22:01:30', 8, 'Credit Card', '150 Broadway, New York, NY 10038', '+1888777666', 14),
(32, 9, 1, '2026-04-28 22:01:30', 8, 'Credit Card', '150 Broadway, New York, NY 10038', '+1888777666', 14),
(33, 22, 1, '2026-04-28 22:01:30', 8, 'Credit Card', '150 Broadway, New York, NY 10038', '+1888777666', 14),
(34, 1, 1, '2026-04-28 22:07:33', 9, 'PayPal', '33 W 17th St, New York, NY 10011', '+1999000111', 15),
(35, 11, 1, '2026-04-28 22:07:33', 9, 'PayPal', '33 W 17th St, New York, NY 10011', '+1999000111', 15),
(36, 21, 1, '2026-04-28 22:07:33', 9, 'PayPal', '33 W 17th St, New York, NY 10011', '+1999000111', 15),
(37, 5, 1, '2026-04-28 22:07:33', 9, 'PayPal', '33 W 17th St, New York, NY 10011', '+1999000111', 15),
(38, 1, 1, '2026-04-28 22:20:59', 10, 'Credit Card', '625 Madison Ave, New York, NY 10022', '+1333444555', 16),
(39, 16, 1, '2026-04-28 22:20:59', 10, 'Credit Card', '625 Madison Ave, New York, NY 10022', '+1333444555', 16);

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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Samuel', 'samuel1@gmail.com', NULL, '$2y$12$2MDK73L1FI.MaO8sqJqUneNhRcrbAkb2zAP6THO9qo8iHlwsadB2O', NULL, '2026-04-02 22:09:49', '2026-04-02 22:09:49'),
(2, 'Nick', 'nick23@gmail.com', NULL, '$2y$12$4PCA1A.7N4e.XpyfP6Qs7uuw2ZgkREmPFCenl6Yr.M2ARmTWbuPs6', NULL, '2026-04-06 10:53:38', '2026-04-06 10:53:38'),
(3, 'Susan', 'susan123@gmail.com', NULL, '$2y$12$i0S9BehBI8ELK5vDwwpBl.pg0X9vLyjas.1IdHItYL0DM6Bb3mu/G', NULL, '2026-04-10 23:01:11', '2026-04-10 23:01:11'),
(4, 'Robert', 'robert99@gmail.com', NULL, '$2y$12$8hktDOsUx/na4MXhLHpwyu4PmRKExCMJtJseQVXM7Ot97GSauuHD2', NULL, '2026-04-11 05:49:13', '2026-04-11 05:49:13'),
(5, 'Lily', 'lily.lily@gmail.com', NULL, '$2y$12$jUUbxmDaq1lRzy7fwDD.wuSAygh0TG8PlGg8bQKTGEX75yHyZ.pz.', NULL, '2026-04-12 11:25:12', '2026-04-12 11:25:12'),
(6, 'David', 'david7@gmail.com', NULL, '$2y$12$76czv7gjzY2Sm6yPBJx0e.18DbMHqcy6UoR255IPrGd0K30swky6e', NULL, '2026-04-13 04:17:44', '2026-04-13 04:17:44'),
(7, 'John', 'john7655@gmail.com', NULL, '$2y$12$D0mDHL8WhRniyyyYP02k5.fKJsnNuTDvbrmqqnEl6PfAgcV9NXo4i', NULL, '2026-04-26 08:10:19', '2026-04-26 08:10:19'),
(8, 'Emma', 'emma123@gmail.com', NULL, '$2y$12$XoQddnqnZaUu7ZJzPXWj9ONZjnlVyBVTzg6PDMXtKYF8LnEd/I7kG', NULL, '2026-04-28 22:00:14', '2026-04-28 22:00:14'),
(9, 'Ruby', 'rubyhoshino@gmail.com', NULL, '$2y$12$oEK7C6TdNrAkhQ/Mvaw0m.KjT3A3jZhNDCO4zHyAjJrb45FCcbDfe', NULL, '2026-04-28 22:05:36', '2026-04-28 22:05:36'),
(10, 'Michael', 'michael7@gmail.com', NULL, '$2y$12$JFQjLrBG3cduymjZvKQeMOqkV6C9OnStTXdt867m7/Vvxfk9Qj1fK', NULL, '2026-04-28 22:15:13', '2026-04-28 22:15:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`adminid`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `mtid` (`mtid`) USING BTREE;

--
-- Indexes for table `menutype`
--
ALTER TABLE `menutype`
  ADD PRIMARY KEY (`mtid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `mid` (`mid`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `adminid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `mid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `menutype`
--
ALTER TABLE `menutype`
  MODIFY `mtid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`mtid`) REFERENCES `menutype` (`mtid`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `mid` FOREIGN KEY (`mid`) REFERENCES `menu` (`mid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
