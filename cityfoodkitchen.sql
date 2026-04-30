-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 30, 2026 at 09:47 AM
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
CREATE DATABASE IF NOT EXISTS `cityfoodkitchen` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cityfoodkitchen`;

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
--
-- Database: `cityfoodkitchentesting`
--
CREATE DATABASE IF NOT EXISTS `cityfoodkitchentesting` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cityfoodkitchentesting`;
--
-- Database: `deliveryservice`
--
CREATE DATABASE IF NOT EXISTS `deliveryservice` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `deliveryservice`;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `C_ID` varchar(5) NOT NULL,
  `C_First_Name` varchar(30) NOT NULL,
  `C_Last_Name` varchar(30) NOT NULL,
  `C_Phone_Number` varchar(12) NOT NULL,
  `C_Email` varchar(30) NOT NULL,
  `CR_ID` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`C_ID`, `C_First_Name`, `C_Last_Name`, `C_Phone_Number`, `C_Email`, `CR_ID`) VALUES
('CM001', 'Tom', 'Smith', '+95935758095', 'tomsmith1@gmail.com', 'C0001'),
('CM002', 'Liam', 'Baker', '+9597832572', 'liambaker@gmail.com', 'C0002'),
('CM003', 'James', 'Jones', '+95963539573', 'jamesjones24@gmail.com', 'C0003'),
('CM004', 'Olivia', 'Taylar', '+95967522444', 'oliviataylor555@gmail.com', 'C0004'),
('CM005', 'Amelia', 'Brown', '+95923574221', 'ameliabrown12@gmail.com', 'C0005'),
('CM006', 'Emily', 'Williams', '+9594830284', 'emilywilliam25@gmail.com', 'C0006'),
('CM007', 'Michael', 'Wilson', '+95934207537', 'michaelwilson@gmail.com', 'C0007'),
('CM008', 'Sophia', 'Cooper', '+95932308970', 'sophiacooper452@gmail.com', 'C0008'),
('CM009', 'Noah', 'Martin', '+9594720809', 'noahmartin1998@gmail.com', 'C0009'),
('CM010', 'Jacob', 'Harris', '+9595709957', 'jacobharris212@gmail,com', 'C0010');

-- --------------------------------------------------------

--
-- Table structure for table `customers_region`
--

CREATE TABLE `customers_region` (
  `CR_ID` varchar(5) NOT NULL,
  `CR_Township` varchar(30) NOT NULL,
  `CR_Quarter` varchar(30) NOT NULL,
  `CR_Street` varchar(30) NOT NULL,
  `CR_Home_Number` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers_region`
--

INSERT INTO `customers_region` (`CR_ID`, `CR_Township`, `CR_Quarter`, `CR_Street`, `CR_Home_Number`) VALUES
('C0001', 'Botahtaung', 'Ahnawyahtar', 'Gandamar Street', '34'),
('C0002', 'Bahan', 'Bahtoo', 'Thitkhwa Street', '46'),
('C0003', 'Hlaing', 'Sayarsan', 'Kyarphyu Street', '55'),
('C0004', 'Dagon', 'Aungzayya', 'Aungthukha Street', '67'),
('C0005', 'Tarmwe', 'Yaykyaw', 'Kyarni Street', '31'),
('C0006', 'Ahlone', 'Kyansitthar', 'Myine Street', '89'),
('C0007', 'Sanchaung', 'Bandula', 'Manaw Street', '92'),
('C0008', 'North Oakalarpa', 'Tayza', 'Ayetharyar Street', '73'),
('C0009', 'South Oakalarpa', 'Tharlon', 'Thayet Street', '29'),
('C0010', 'Yankin', 'Aungchanthar', 'Kantharyar Street', '13');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man`
--

CREATE TABLE `delivery_man` (
  `DM_Staff_ID` varchar(5) NOT NULL,
  `DM_firstname` varchar(30) DEFAULT NULL,
  `DM_lastname` varchar(30) DEFAULT NULL,
  `DM_age` int(2) DEFAULT NULL,
  `DM_Phone_Number` varchar(12) DEFAULT NULL,
  `DM_Email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_man`
--

INSERT INTO `delivery_man` (`DM_Staff_ID`, `DM_firstname`, `DM_lastname`, `DM_age`, `DM_Phone_Number`, `DM_Email`) VALUES
('A0001', 'Leo', 'Potter', 20, '+95956375344', 'leopotter1@gmail.com'),
('A0002', 'Peter', 'Parker', 23, '+95966311944', 'peterparker7@gmail.com'),
('A0003', 'David', 'Diggory', 21, '+95925634568', 'daviddiggory77@gmail.com'),
('A0004', 'Samuel', 'Christopher', 20, '+95978101679', 'samuelchristopher9@gmail.com'),
('A0005', 'John', 'Riddle', 22, '+95944853822', 'johnriddle199@gmail.com'),
('A0006', 'James', 'Terry', 24, '+95977766681', 'jamesterry25@gmail.com'),
('A0007', 'Fred', 'Cahill', 25, '+95942078192', 'fredcahill24@gmail.com'),
('A0008', 'Tom', 'Weasley', 21, '+95941002419', 'tomweasley44@gmail.com'),
('A0009', 'Stephen', 'Garfield', 25, '+95952784981', 'stephengarfield23@gmail.com'),
('A0010', 'Mason', 'Rice', 20, '+95965683341', 'masonrice1941@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `motorcycles`
--

CREATE TABLE `motorcycles` (
  `M_License_Number` varchar(6) NOT NULL,
  `M_Brand` varchar(30) NOT NULL,
  `M_Type` varchar(30) NOT NULL,
  `DM_Staff_ID` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `motorcycles`
--

INSERT INTO `motorcycles` (`M_License_Number`, `M_Brand`, `M_Type`, `DM_Staff_ID`) VALUES
('M0001', 'Honda', 'TMX125 Alpha', 'A0001'),
('M0002', 'Kawasaki', 'CT 100', 'A0002'),
('M0003', 'Yamaha', 'Sight 115', 'A0003'),
('M0004', 'TVS', 'Neo XR', 'A0004'),
('M0005', 'Suzuki', 'Nex 110', 'A0005'),
('M0006', 'TVS', 'MAX4R', 'A0006'),
('M0007', 'Yamaha', 'Mio Sporty', 'A0007'),
('M0008', 'Honda', 'XRM 125 Alpha', 'A0008'),
('M0009', 'Yamaha', 'Mio Sporty', 'A0009'),
('M0010', 'Suzuki', 'Raider J Crossover', 'A0010');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `O_ID` varchar(5) NOT NULL,
  `O_Date` date NOT NULL,
  `O_Delivery_Fees` int(11) NOT NULL,
  `DM_Staff_ID` varchar(5) DEFAULT NULL,
  `S_Shop_ID` varchar(5) DEFAULT NULL,
  `C_ID` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`O_ID`, `O_Date`, `O_Delivery_Fees`, `DM_Staff_ID`, `S_Shop_ID`, `C_ID`) VALUES
('OR001', '2022-02-13', 2000, 'A0001', 'SE001', 'CM001'),
('OR002', '2022-02-14', 2000, 'A0002', 'SE002', 'CM002'),
('OR003', '2022-02-14', 2000, 'A0003', 'SE003', 'CM003'),
('OR004', '2022-02-14', 2000, 'A0004', 'SE004', 'CM004'),
('OR005', '2022-02-14', 2000, 'A0005', 'SE005', 'CM005'),
('OR006', '2022-02-15', 2000, 'A0006', 'SE006', 'CM006'),
('OR007', '2022-02-15', 2000, 'A0007', 'SE007', 'CM007'),
('OR008', '2022-02-15', 2000, 'A0008', 'SE005', 'CM008'),
('OR009', '2022-02-15', 2000, 'A0009', 'SE003', 'CM009'),
('OR010', '2022-02-15', 2000, 'A0010', 'SE001', 'CM010');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `S_Shop_ID` varchar(5) NOT NULL,
  `S_Shop_Name` varchar(30) NOT NULL,
  `S_Shop_Phone_Number` varchar(12) NOT NULL,
  `S_Shop_Email` varchar(30) NOT NULL,
  `SR_ID` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`S_Shop_ID`, `S_Shop_Name`, `S_Shop_Phone_Number`, `S_Shop_Email`, `SR_ID`) VALUES
('SE001', 'KFC', '+95934567239', 'kfcyangon@gmail.com', 'S0001'),
('SE002', 'YKKO', '+95956890345', 'yankinkyaeooe@gmail.com', 'S0002'),
('SE003', 'Lotteria', '+95943904779', 'lotteriayangon@gmail.com', 'S0003'),
('SE004', 'Feel Cafe', '+9593490478', 'feelcafe123@gmail.com', 'S0004'),
('SE005', 'Golden Duck', '+95934780247', 'goldenduck@gmail.com', 'S0005'),
('SE006', 'Shwe Palin', '+95949204025', 'shwepalin445@gmail.com', 'S0002'),
('SE007', 'Rangoon Tea House', '+95997356012', 'rangoonteahouse@gmail.com', 'S0005');

-- --------------------------------------------------------

--
-- Table structure for table `sellers_region`
--

CREATE TABLE `sellers_region` (
  `SR_ID` varchar(5) NOT NULL,
  `SR_Township` varchar(30) NOT NULL,
  `SR_Quarter` varchar(30) NOT NULL,
  `SR_Street` varchar(30) NOT NULL,
  `SR_Shop_Number` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sellers_region`
--

INSERT INTO `sellers_region` (`SR_ID`, `SR_Township`, `SR_Quarter`, `SR_Street`, `SR_Shop_Number`) VALUES
('S0001', 'Dagon', 'Bayinnaung', 'Thitsar Street', '73'),
('S0002', 'North Oakkalarpa', 'Tharyar', 'Sabal Street', '61'),
('S0003', 'South Oakalarpa', 'Phayarphyu', 'Padauk Street', '52'),
('S0004', 'Sanchaung', 'Aungsan', 'Hninsi Street', '83'),
('S0005', 'Ahlone', 'Myanaung', 'Warso Street', '32'),
('S0006', 'Tarmwe', 'Cherry', 'Boaungkyaw Street', '45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`C_ID`),
  ADD KEY `CR_ID` (`CR_ID`);

--
-- Indexes for table `customers_region`
--
ALTER TABLE `customers_region`
  ADD PRIMARY KEY (`CR_ID`);

--
-- Indexes for table `delivery_man`
--
ALTER TABLE `delivery_man`
  ADD PRIMARY KEY (`DM_Staff_ID`);

--
-- Indexes for table `motorcycles`
--
ALTER TABLE `motorcycles`
  ADD PRIMARY KEY (`M_License_Number`),
  ADD KEY `DM_Staff_ID` (`DM_Staff_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`O_ID`),
  ADD KEY `DM_Staff_ID` (`DM_Staff_ID`),
  ADD KEY `S_Shop_ID` (`S_Shop_ID`),
  ADD KEY `C_ID` (`C_ID`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`S_Shop_ID`),
  ADD KEY `SR_ID` (`SR_ID`);

--
-- Indexes for table `sellers_region`
--
ALTER TABLE `sellers_region`
  ADD PRIMARY KEY (`SR_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`CR_ID`) REFERENCES `customers_region` (`CR_ID`);

--
-- Constraints for table `motorcycles`
--
ALTER TABLE `motorcycles`
  ADD CONSTRAINT `motorcycles_ibfk_1` FOREIGN KEY (`DM_Staff_ID`) REFERENCES `delivery_man` (`DM_Staff_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`DM_Staff_ID`) REFERENCES `delivery_man` (`DM_Staff_ID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`S_Shop_ID`) REFERENCES `sellers` (`S_Shop_ID`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`C_ID`) REFERENCES `customers` (`C_ID`);

--
-- Constraints for table `sellers`
--
ALTER TABLE `sellers`
  ADD CONSTRAINT `sellers_ibfk_1` FOREIGN KEY (`SR_ID`) REFERENCES `sellers_region` (`SR_ID`);
--
-- Database: `foodpanda`
--
CREATE DATABASE IF NOT EXISTS `foodpanda` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `foodpanda`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `C_ID` varchar(5) NOT NULL,
  `C_Name` varchar(30) DEFAULT NULL,
  `C_Address` varchar(200) DEFAULT NULL,
  `C_PhoneNo` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`C_ID`, `C_Name`, `C_Address`, `C_PhoneNo`) VALUES
('C01', 'Samuel', 'Between 34 and 35 street, Mandalay', 912312312),
('C02', 'Steven', '73 Street, Mandalay', 923423423),
('C03', 'Alice', 'Between 81 and 82 street, Mandalay', 934534534),
('C04', 'Susan', 'Between 74 and 75 street, Mandalay', 945645645),
('C05', 'Jack', 'Between 101and Science Street, Mandalay', 956756756);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `F_ID` varchar(5) NOT NULL,
  `F_Name` varchar(30) DEFAULT NULL,
  `F_Price` int(10) DEFAULT NULL,
  `RD_ID` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`F_ID`, `F_Name`, `F_Price`, `RD_ID`) VALUES
('F01', 'Spicy Noodles', 6500, 'RD01'),
('F02', 'Korean Chicken Wings', 5200, 'RD01'),
('F03', 'Seafood Spicy', 7800, 'RD02'),
('F04', 'Topokki', 2600, 'RD02'),
('F05', 'Mala Curry', 8000, 'RD03'),
('F06', 'Seafood', 3700, 'RD03'),
('F07', 'fish with Lemon Sauce', 8500, 'RD04'),
('F08', 'Fried Pork Ribs', 11000, 'RD04'),
('F09', 'Rice with Curry', 2500, 'RD05'),
('F10', 'Braised Mutton', 3800, 'RD06'),
('F11', 'Braised Pork Belly', 3800, 'RD06'),
('F12', 'Fried Burma Chicken', 3800, 'RD06'),
('F13', 'Rice with Curry', 2000, 'RD07'),
('F14', 'Pork Curry', 1500, 'RD08'),
('F15', 'Beef Curry', 1500, 'RD08'),
('F16', 'Chicken Curry', 1500, 'RD08'),
('F17', 'Seafood Pizza', 12000, 'RD09'),
('F18', 'Cheese Pizza', 12000, 'RD09'),
('F19', 'Sausage Pizza', 12000, 'RD09'),
('F20', 'Coke', 2000, 'RD10'),
('F21', 'Ossobugo', 18000, 'RD11'),
('F22', 'Hamburger', 5000, 'RD11'),
('F23', 'Italian Spaghetti', 15000, 'RD12'),
('F24', 'Orange Juice', 2000, 'RD13');

-- --------------------------------------------------------

--
-- Table structure for table `foodpandas_staff`
--

CREATE TABLE `foodpandas_staff` (
  `S_ID` varchar(5) NOT NULL,
  `S_Name` varchar(30) DEFAULT NULL,
  `S_PhoneNo` int(10) DEFAULT NULL,
  `S_Email` varchar(50) DEFAULT NULL,
  `ST_ID` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `foodpandas_staff`
--

INSERT INTO `foodpandas_staff` (`S_ID`, `S_Name`, `S_PhoneNo`, `S_Email`, `ST_ID`) VALUES
('S01', 'David', 911121314, 'David1@gmail.com', 'ST01'),
('S02', 'Benjamin', 921222324, 'Benjamin12@gmail.com', 'ST02'),
('S03', 'James', 931323334, 'James03@gmail.com', 'ST03'),
('S04', 'Julia', 941424344, 'Julia44@gmail.com', 'ST04'),
('S05', 'Daisy', 951525354, 'Daisy55@gmail.com', 'ST05'),
('S06', 'William', 961626364, 'William16@gmail.com', 'ST06'),
('S07', 'Mark', 971727374, 'Mark111@gmail.com', 'ST06'),
('S08', 'Kylian', 981828384, 'Kylian2@gmail.com', 'ST06'),
('S09', 'Kevin', 991929394, 'Kevin345@gmail.com', 'ST06'),
('S10', 'Tony', 910110214, 'Tony56@gmail.com', 'ST06');

-- --------------------------------------------------------

--
-- Table structure for table `food_menu`
--

CREATE TABLE `food_menu` (
  `FM_ID` varchar(5) NOT NULL,
  `FM_Name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_menu`
--

INSERT INTO `food_menu` (`FM_ID`, `FM_Name`) VALUES
('FM01', 'Main Menu'),
('FM02', 'Popular Menu'),
('FM03', 'Juice and Soft Drinks');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `O_ID` varchar(5) NOT NULL,
  `C_ID` varchar(5) DEFAULT NULL,
  `S_ID` varchar(5) DEFAULT NULL,
  `O_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`O_ID`, `C_ID`, `S_ID`, `O_Date`) VALUES
('O01', 'C01', 'S06', '2023-03-01'),
('O02', 'C02', 'S07', '2023-03-02'),
('O03', 'C03', 'S08', '2023-03-02'),
('O04', 'C04', 'S09', '2023-03-03'),
('O05', 'C05', 'S10', '2023-03-03');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `OD_ID` varchar(5) NOT NULL,
  `O_ID` varchar(5) DEFAULT NULL,
  `F_ID` varchar(5) DEFAULT NULL,
  `OD_Quantity` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`OD_ID`, `O_ID`, `F_ID`, `OD_Quantity`) VALUES
('OD01', 'O01', 'F01', 1),
('OD02', 'O02', 'F05', 1),
('OD03', 'O02', 'F06', 1),
('OD04', 'O03', 'F09', 3),
('OD05', 'O03', 'F11', 1),
('OD06', 'O04', 'F23', 2),
('OD07', 'O04', 'F24', 2),
('OD08', 'O05', 'F19', 3);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `R_ID` varchar(5) NOT NULL,
  `R_Name` varchar(50) DEFAULT NULL,
  `R_Address` varchar(200) DEFAULT NULL,
  `R_PhoneNo` int(10) DEFAULT NULL,
  `RT_ID` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`R_ID`, `R_Name`, `R_Address`, `R_PhoneNo`, `RT_ID`) VALUES
('R01', 'Mommy\'s Kitchen', '39 street ,Between 73 street & yayni, 05041 Mandalay', 912345678, 'RT01'),
('R02', 'HotHot Chinese BBQ', '80 street , Bet 38 street & 39 Street, Mandalay', 987654321, 'RT01'),
('R03', 'Aung Family Restaurant', 'Between 78 Street & 45 Street, Maharaungmyay , Mandalay', 923456789, 'RT02'),
('R04', 'Shwe Myanmar Restaurant', '73 Street , Bet 40 & 41 Street, Mandalay', 998765432, 'RT02'),
('R05', 'The Pizza Company', '73rd Street, Block-7, Unit-12, Mingalar Mandalay, Mandalay', 911122233, 'RT03'),
('R06', 'Ostello Bello', '28 Street, Between 73 & 74 street, Mandalay', 933222111, 'RT03');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_details`
--

CREATE TABLE `restaurant_details` (
  `RD_ID` varchar(5) NOT NULL,
  `R_ID` varchar(5) DEFAULT NULL,
  `FM_ID` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant_details`
--

INSERT INTO `restaurant_details` (`RD_ID`, `R_ID`, `FM_ID`) VALUES
('RD01', 'R01', 'FM01'),
('RD02', 'R01', 'FM02'),
('RD03', 'R02', 'FM01'),
('RD04', 'R02', 'FM02'),
('RD05', 'R03', 'FM01'),
('RD06', 'R03', 'FM02'),
('RD07', 'R04', 'FM01'),
('RD08', 'R04', 'FM02'),
('RD09', 'R05', 'FM01'),
('RD10', 'R05', 'FM03'),
('RD11', 'R06', 'FM01'),
('RD12', 'R06', 'FM02'),
('RD13', 'R06', 'FM03');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_type`
--

CREATE TABLE `restaurant_type` (
  `RT_ID` varchar(5) NOT NULL,
  `RT_Name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant_type`
--

INSERT INTO `restaurant_type` (`RT_ID`, `RT_Name`) VALUES
('RT01', 'Asian Food'),
('RT02', 'Burmese Food'),
('RT03', 'European Food');

-- --------------------------------------------------------

--
-- Table structure for table `staff_type`
--

CREATE TABLE `staff_type` (
  `ST_ID` varchar(5) NOT NULL,
  `ST_Type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff_type`
--

INSERT INTO `staff_type` (`ST_ID`, `ST_Type`) VALUES
('ST01', 'Manager'),
('ST02', 'HR Manager'),
('ST03', 'Marketing & Web Developer'),
('ST04', 'Accoutant'),
('ST05', 'Secretary'),
('ST06', 'Delivery Driver');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`C_ID`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`F_ID`),
  ADD KEY `RD_ID` (`RD_ID`);

--
-- Indexes for table `foodpandas_staff`
--
ALTER TABLE `foodpandas_staff`
  ADD PRIMARY KEY (`S_ID`),
  ADD KEY `ST_ID` (`ST_ID`);

--
-- Indexes for table `food_menu`
--
ALTER TABLE `food_menu`
  ADD PRIMARY KEY (`FM_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`O_ID`),
  ADD KEY `C_ID` (`C_ID`),
  ADD KEY `S_ID` (`S_ID`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`OD_ID`),
  ADD KEY `O_ID` (`O_ID`),
  ADD KEY `F_ID` (`F_ID`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`R_ID`),
  ADD KEY `RT_ID` (`RT_ID`);

--
-- Indexes for table `restaurant_details`
--
ALTER TABLE `restaurant_details`
  ADD PRIMARY KEY (`RD_ID`),
  ADD KEY `R_ID` (`R_ID`),
  ADD KEY `FM_ID` (`FM_ID`);

--
-- Indexes for table `restaurant_type`
--
ALTER TABLE `restaurant_type`
  ADD PRIMARY KEY (`RT_ID`);

--
-- Indexes for table `staff_type`
--
ALTER TABLE `staff_type`
  ADD PRIMARY KEY (`ST_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_ibfk_1` FOREIGN KEY (`RD_ID`) REFERENCES `restaurant_details` (`RD_ID`);

--
-- Constraints for table `foodpandas_staff`
--
ALTER TABLE `foodpandas_staff`
  ADD CONSTRAINT `foodpandas_staff_ibfk_1` FOREIGN KEY (`ST_ID`) REFERENCES `staff_type` (`ST_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`C_ID`) REFERENCES `customer` (`C_ID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`S_ID`) REFERENCES `foodpandas_staff` (`S_ID`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`O_ID`) REFERENCES `orders` (`O_ID`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`F_ID`) REFERENCES `food` (`F_ID`);

--
-- Constraints for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`RT_ID`) REFERENCES `restaurant_type` (`RT_ID`);

--
-- Constraints for table `restaurant_details`
--
ALTER TABLE `restaurant_details`
  ADD CONSTRAINT `restaurant_details_ibfk_1` FOREIGN KEY (`R_ID`) REFERENCES `restaurant` (`R_ID`),
  ADD CONSTRAINT `restaurant_details_ibfk_2` FOREIGN KEY (`FM_ID`) REFERENCES `food_menu` (`FM_ID`);
--
-- Database: `gwsc`
--
CREATE DATABASE IF NOT EXISTS `gwsc` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gwsc`;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `cid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`cid`, `email`, `message`) VALUES
(0, 'sitthmuenaing1@gmail.com', 'Hello');

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `fid` int(10) NOT NULL,
  `fname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`fid`, `fname`) VALUES
(1, 'Car Parking'),
(2, 'Showers'),
(3, 'Wi-Fi'),
(4, 'Pets Welcome'),
(5, 'Washbasins'),
(6, 'Dedicated accessible facilities'),
(7, 'Motorhome service point'),
(8, 'Children play area'),
(9, 'Fishing'),
(10, 'Designated dog walk'),
(11, 'Shop'),
(12, 'Flushing toilet');

-- --------------------------------------------------------

--
-- Table structure for table `locals`
--

CREATE TABLE `locals` (
  `lid` int(10) NOT NULL,
  `lname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locals`
--

INSERT INTO `locals` (`lid`, `lname`) VALUES
(1, ' Blue Lagoon, Pembrokeshire'),
(2, 'River Dart, Staverton, Devon'),
(3, ' Mourne Mountains, Northern Ireland'),
(4, 'Skye\'s Fairy Pools, Scotland'),
(5, 'River Trent, Anchor Church, Ingleby, Derbyshire');

-- --------------------------------------------------------

--
-- Table structure for table `pitches`
--

CREATE TABLE `pitches` (
  `pid` int(10) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `ptype` varchar(50) NOT NULL,
  `ploanfees` varchar(50) NOT NULL,
  `pimgs` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pitches`
--

INSERT INTO `pitches` (`pid`, `pname`, `ptype`, `ploanfees`, `pimgs`) VALUES
(1, 'A-Frame Tent', 'Tent Pitch', '$20 per day', 'p21.jpg'),
(2, 'Multi-Room Tent', 'Tent Pitch', '$25 per day', 'p22.jpg'),
(3, 'Geodesic and Semi-Geodesic Tent', 'Tent Pitch', '$30 per day', 'p23.png'),
(4, 'Tunnel Tent', 'Tent Pitch', '$35 per day', 'p24.jpg'),
(5, 'Backpacking Tent', 'Tent Pitch', '$20 per day', 'p25.jpg'),
(6, 'Swift Sprite Compact (2 berth)', 'Caravan Pitch', '$35 per day', 'p26.png'),
(7, 'Swift Sprite Grande (4 to 6 berth)', 'Caravan Pitch', '$50 per day', 'p27.png'),
(8, 'Swift Elegance Grande (4 berth)', 'Caravan Pitch', '$60 per day', 'p28.png'),
(9, 'Swift Challenger SE (2 to 4 berth)', 'Caravan Pitch', '$40 per day', 'p29.png'),
(10, 'Swift Challenger Grande SE (4 to 6 berth)', 'Caravan Pitch', '$70 per day', 'p30.png'),
(11, 'Winnebago Vista 31BE', 'Motorhome Pitch ', '$300 per day', 'p16.jpg'),
(12, 'Thor A.C.E. 30.2', 'Motorhome Pitch', '$350 per day', 'p17.jpg'),
(13, 'Thor Chateau 31E', 'Motorhome Pitch', '$400 per day', 'p18.jpg'),
(14, 'Coachmen Freelander 31BH', 'Motorhome Pitch', '$450 per day', 'p19.jpg'),
(15, 'Fleetwood Bounder 36H', 'Motorhome Pitch', '$500 per day', 'p20.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `rid` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `review` text NOT NULL,
  `sid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`rid`, `name`, `review`, `sid`) VALUES
(1, 'Samuel', 'Good Camping Site.', 4),
(2, 'Susan', 'It need more facilities.', 3),
(3, 'David', 'Very Good Camping Site. It\'s beautiful. I want to vist again to this Camping Site.', 1),
(4, 'Frank', 'I was very happy in this campsite with my family.', 5),
(5, 'Ella', 'It is perfet campsite. It is beautiful and has many key facilities.', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sitefeatures`
--

CREATE TABLE `sitefeatures` (
  `sfid` int(10) NOT NULL,
  `sid` int(10) NOT NULL,
  `fid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sitefeatures`
--

INSERT INTO `sitefeatures` (`sfid`, `sid`, `fid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 12),
(7, 2, 1),
(8, 2, 2),
(9, 2, 3),
(10, 2, 4),
(11, 2, 5),
(12, 2, 6),
(13, 2, 7),
(14, 2, 8),
(15, 2, 12),
(16, 3, 1),
(17, 3, 2),
(18, 3, 3),
(19, 3, 6),
(20, 3, 4),
(21, 3, 12),
(22, 4, 1),
(23, 4, 2),
(24, 4, 3),
(25, 4, 4),
(26, 4, 5),
(27, 4, 7),
(28, 4, 9),
(29, 4, 10),
(30, 4, 12),
(31, 5, 1),
(32, 5, 2),
(33, 5, 3),
(34, 5, 4),
(35, 5, 5),
(36, 5, 6),
(37, 5, 10),
(38, 5, 11),
(39, 5, 12);

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `sid` int(10) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `sdescription` varchar(2000) NOT NULL,
  `simgs` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`sid`, `sname`, `sdescription`, `simgs`) VALUES
(1, 'St Davids Campsite', 'St Davids Campsite is located in St Davids, Haverfordwest, England. If you\'re searching for a campsite with breathtaking sea views, gorgeous sunsets, and brisk walks, our St. David\'s Club campsite could be the right fit for you. Visitors to this appealing campground will also have the opportunity to take in the region\'s historic structures, traditional arts and crafts, and abundant wildlife, all of which are located just a mile from the Heritage Coast.', 'p11.jpg'),
(2, 'California Cross Campsite', 'California Cross Campsite is located in Modbury, Devon, England. In South Hams, a region of outstanding natural beauty, you may locate California Cross Club campground. The campground is tucked between the spectacular Dartmoor National Park environment and the sandy beaches of South Devon\'s Heritage coast, off the main path and surrounded by undulating hills.\r\n\r\n', 'p12.jpeg'),
(3, 'Delamont Country Park Campsite', 'Delamont Country Park Campsite is located in Killyleagh, County Down, Northern Ireland. In this beautiful County Down campground, you can take advantage of the warm Northern Irish friendliness.\r\n', 'p13.jpg'),
(4, 'Skye Campsite ', 'Skye Campsite is located in Isle of Skye, Scotland. It has beautiful views of the Isle of Skye.\r\n', 'p14.jpg'),
(5, 'Conkers Campsite', 'Conkers Campsite is located in Swadlincote, England. It is surrounded by the national forest with easy access by foot or bicycle.\r\n', 'p15.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(10) NOT NULL,
  `ufirstname` varchar(50) NOT NULL,
  `usurname` varchar(50) NOT NULL,
  `uemail` varchar(50) NOT NULL,
  `upassword` varchar(50) NOT NULL,
  `urepassword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `ufirstname`, `usurname`, `uemail`, `upassword`, `urepassword`) VALUES
(1, 'Sitt Hmue', 'Naing', 'sitthmuenaing1@gmail.com', '6ea5ca400a2a1129264adf1e22db2ebb', '6ea5ca400a2a1129264adf1e22db2ebb');

-- --------------------------------------------------------

--
-- Table structure for table `views_counter`
--

CREATE TABLE `views_counter` (
  `VCID` int(3) NOT NULL,
  `VCCount` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `views_counter`
--

INSERT INTO `views_counter` (`VCID`, `VCCount`) VALUES
(1, 1743);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `locals`
--
ALTER TABLE `locals`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `pitches`
--
ALTER TABLE `pitches`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `sitefeatures`
--
ALTER TABLE `sitefeatures`
  ADD PRIMARY KEY (`sfid`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `views_counter`
--
ALTER TABLE `views_counter`
  ADD PRIMARY KEY (`VCID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `fid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `locals`
--
ALTER TABLE `locals`
  MODIFY `lid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pitches`
--
ALTER TABLE `pitches`
  MODIFY `pid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `rid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sitefeatures`
--
ALTER TABLE `sitefeatures`
  MODIFY `sfid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `sid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `views_counter`
--
ALTER TABLE `views_counter`
  MODIFY `VCID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `hydetravel`
--
CREATE DATABASE IF NOT EXISTS `hydetravel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hydetravel`;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `B_ID` int(5) NOT NULL,
  `B_Date` date DEFAULT NULL,
  `No_of_Passengers` int(5) DEFAULT NULL,
  `C_ID` int(5) DEFAULT NULL,
  `T_ID` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`B_ID`, `B_Date`, `No_of_Passengers`, `C_ID`, `T_ID`) VALUES
(43343, '2022-04-01', 4, 1, 101),
(43350, '2022-05-06', 2, 4, 102),
(43353, '2022-05-07', 7, 5, 103),
(43367, '2022-05-07', 5, 6, 102),
(43389, '2022-05-03', 1, 2, 101),
(43399, '2022-05-05', 2, 3, 101);

-- --------------------------------------------------------

--
-- Table structure for table `components`
--

CREATE TABLE `components` (
  `Co_ID` int(5) NOT NULL,
  `Co_Code` varchar(5) DEFAULT NULL,
  `Co_Detail` varchar(100) DEFAULT NULL,
  `P_ID` int(5) DEFAULT NULL,
  `V_ID` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `components`
--

INSERT INTO `components` (`Co_ID`, `Co_Code`, `Co_Detail`, `P_ID`, `V_ID`) VALUES
(1, 'COUT', 'Folkestone to Cologne via Eurotunnel Railway and then Cruise to Konigswinter', 1, 7),
(2, 'C2', 'Cruise from Konigswinter to Koblenz ', 2, 3),
(3, 'C3', 'Cruise from Koblenz to Zell', 3, 3),
(4, 'C5', 'Coach travel Zell to Cologne', 4, 5),
(5, 'CRET', 'Cologne to Folkestone via Eurotunnel', 5, 2),
(6, 'C10', 'City break Koblenz', 6, 8),
(7, 'C11', 'Cruise Koblenz to Cologne', 7, 4),
(8, 'COUT2', 'Folkestone to Calais via Eurotunnel Railway', 8, 2),
(9, 'C22', 'Calais to Amiens', 9, 5),
(10, 'C23', 'Apple Orchard tour (Starts and ends in Amiens)', 10, 5),
(11, 'C25', 'River Somme cruise', 11, 6),
(12, 'CRET2', 'Calais to Folkestone via Eurotunnel Railway', 12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `components_of_trips`
--

CREATE TABLE `components_of_trips` (
  `CT_ID` int(5) NOT NULL,
  `CT_Date` varchar(30) DEFAULT NULL,
  `Co_ID` int(5) DEFAULT NULL,
  `T_ID` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `components_of_trips`
--

INSERT INTO `components_of_trips` (`CT_ID`, `CT_Date`, `Co_ID`, `T_ID`) VALUES
(1, '1st June 2022', 1, 101),
(2, '2nd June 2022', 2, 101),
(3, '3rd June 2022', 3, 101),
(4, '4th June 2022', 4, 101),
(5, '5th June 2022', 5, 101),
(6, '22nd June 2022', 1, 102),
(7, '23rd June 2022', 2, 102),
(8, '23rd to 25th June 2022', 6, 102),
(9, '26th June 2022', 7, 102),
(10, '27th June 2022', 5, 102),
(11, '1st June 2022', 8, 103),
(12, '2nd June 2022', 9, 103),
(13, '3rd June 2022', 10, 103),
(14, '4th June 2022', 11, 103),
(15, '5th June 2022', 12, 103);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `C_ID` int(5) NOT NULL,
  `C_Name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`C_ID`, `C_Name`) VALUES
(1, 'Jhonny Johnson'),
(2, 'Amada Brown'),
(3, 'Talal Khan'),
(4, 'Pretti Patel'),
(5, 'Dave Smith'),
(6, 'Colin Robinson');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

CREATE TABLE `places` (
  `P_ID` int(5) NOT NULL,
  `Start_P` varchar(30) DEFAULT NULL,
  `Break_P` varchar(30) DEFAULT NULL,
  `End_P` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`P_ID`, `Start_P`, `Break_P`, `End_P`) VALUES
(1, 'Folkestone', 'Cologne', 'Konigswinter'),
(2, 'Konigswinter', '', 'Koblenz'),
(3, 'Koblenz', '', 'Zell'),
(4, 'Zell', '', 'Cologne'),
(5, 'Cologne', '', 'Folkestone'),
(6, '', 'Koblenz', ''),
(7, 'Koblenz', '', 'Cologne'),
(8, 'Folkestone', '', 'Calais'),
(9, 'Calais', '', 'Amiens'),
(10, 'Amiens', '', 'Amiens'),
(11, 'River Somme', '', 'River Somme'),
(12, 'Calais', '', 'Folkestone');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `T_ID` int(5) NOT NULL,
  `T_Type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`T_ID`, `T_Type`) VALUES
(101, 'Rhine Cruise'),
(102, 'Rhine Cruise'),
(103, 'Apple Orchad Tour');

-- --------------------------------------------------------

--
-- Table structure for table `vessels`
--

CREATE TABLE `vessels` (
  `V_ID` int(5) NOT NULL,
  `V_Name` varchar(30) DEFAULT NULL,
  `VT_ID` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vessels`
--

INSERT INTO `vessels` (`V_ID`, `V_Name`, `VT_ID`) VALUES
(1, 'Deluxe Coach', 1),
(2, 'Eurostar', 2),
(3, 'MS Serenity', 3),
(4, 'MS Eddie', 3),
(5, 'Standard Coach', 1),
(6, 'MS Sophie', 3),
(7, 'Eurostar, Deluxe Coach', 4),
(8, 'No Vessel (City Break)', 5);

-- --------------------------------------------------------

--
-- Table structure for table `vessel_type`
--

CREATE TABLE `vessel_type` (
  `VT_ID` int(5) NOT NULL,
  `VT_Name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vessel_type`
--

INSERT INTO `vessel_type` (`VT_ID`, `VT_Name`) VALUES
(1, 'Coach'),
(2, 'Train'),
(3, 'River Ship'),
(4, 'Train, Coach'),
(5, 'No Vessel (City Break)');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`B_ID`),
  ADD KEY `C_ID` (`C_ID`),
  ADD KEY `T_ID` (`T_ID`);

--
-- Indexes for table `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`Co_ID`),
  ADD KEY `P_ID` (`P_ID`),
  ADD KEY `V_ID` (`V_ID`);

--
-- Indexes for table `components_of_trips`
--
ALTER TABLE `components_of_trips`
  ADD PRIMARY KEY (`CT_ID`),
  ADD KEY `Co_ID` (`Co_ID`),
  ADD KEY `T_ID` (`T_ID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`C_ID`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`P_ID`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`T_ID`);

--
-- Indexes for table `vessels`
--
ALTER TABLE `vessels`
  ADD PRIMARY KEY (`V_ID`),
  ADD KEY `VT_ID` (`VT_ID`);

--
-- Indexes for table `vessel_type`
--
ALTER TABLE `vessel_type`
  ADD PRIMARY KEY (`VT_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`C_ID`) REFERENCES `customers` (`C_ID`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`T_ID`) REFERENCES `trips` (`T_ID`);

--
-- Constraints for table `components`
--
ALTER TABLE `components`
  ADD CONSTRAINT `components_ibfk_1` FOREIGN KEY (`P_ID`) REFERENCES `places` (`P_ID`),
  ADD CONSTRAINT `components_ibfk_2` FOREIGN KEY (`V_ID`) REFERENCES `vessels` (`V_ID`);

--
-- Constraints for table `components_of_trips`
--
ALTER TABLE `components_of_trips`
  ADD CONSTRAINT `components_of_trips_ibfk_1` FOREIGN KEY (`Co_ID`) REFERENCES `components` (`Co_ID`),
  ADD CONSTRAINT `components_of_trips_ibfk_2` FOREIGN KEY (`T_ID`) REFERENCES `trips` (`T_ID`);

--
-- Constraints for table `vessels`
--
ALTER TABLE `vessels`
  ADD CONSTRAINT `vessels_ibfk_1` FOREIGN KEY (`VT_ID`) REFERENCES `vessel_type` (`VT_ID`);
--
-- Database: `luckygamingstore`
--
CREATE DATABASE IF NOT EXISTS `luckygamingstore` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `luckygamingstore`;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `bid` int(5) NOT NULL,
  `bname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`bid`, `bname`) VALUES
(1, 'PlayStation'),
(2, 'Xbox'),
(3, 'Nintendo');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `cid` int(10) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phnumber` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`cid`, `firstname`, `surname`, `email`, `password`, `phnumber`) VALUES
(1, 'Sitt Hmue', 'Naing', 'sitthmuenaing1@gmail.com', 'e6e33f339afb49e90d0781a00b703412', '+10112233445'),
(2, 'Thomas', 'Jackson', 'thomas1234@gmail.com', 'ac4d061d45e485f5c282851768b3431c', '+10987654321'),
(3, 'Red', 'Apple', 'redapple98677@icloud.com', '00fab137dd776ea4f434b1bcb29f8ae9', '+10998877665'),
(4, 'Jenner', 'Orlanda', 'jennerolanda2@gmail.com', '0dc8796bfed768106486d7224dcfc372', '+1022334455');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `mid` int(10) NOT NULL,
  `message` text NOT NULL,
  `cid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`mid`, `message`, `cid`) VALUES
(1, 'Is there any promotions?', 1),
(2, 'Can I know about PS5 Pro?', 2),
(3, 'What is difference between Xbox Series S and Xbox Series X?', 3),
(4, 'Is there any promotions?', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `oid` int(10) NOT NULL,
  `odate` date NOT NULL,
  `qty` int(5) NOT NULL,
  `pid` int(5) NOT NULL,
  `cid` int(10) NOT NULL,
  `payment` varchar(20) NOT NULL,
  `address` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`oid`, `odate`, `qty`, `pid`, `cid`, `payment`, `address`) VALUES
(1, '2024-11-16', 1, 5, 1, 'Credit Card', '47 W 13th St, New York, NY 10011, USA'),
(2, '2024-11-16', 2, 20, 1, 'Credit Card', '47 W 13th St, New York, NY 10011, USA'),
(3, '2024-11-17', 1, 2, 2, 'PayPal', 'Grove St, Los Angeles, CA, USA'),
(4, '2024-11-17', 1, 13, 2, 'PayPal', 'Grove St, Los Angeles, CA, USA'),
(5, '2024-11-18', 2, 8, 3, 'Bank Transfer', '11, Goodlett Place, San Francisco, California, USA'),
(6, '2024-11-18', 2, 14, 3, 'Bank Transfer', '11, Goodlett Place, San Francisco, California, USA'),
(7, '2024-11-22', 1, 11, 1, 'Credit Card', '47 W 13th St, New York, NY 10011, USA'),
(8, '2024-11-26', 1, 21, 2, 'PayPal', 'Grove Street, Los Angeles, CA, USA'),
(9, '2024-11-28', 2, 11, 2, 'PayPal', 'Grove Street, Los Angeles, CA, USA'),
(10, '2024-11-28', 3, 14, 2, 'PayPal', 'Grove Street, Los Angeles, CA, USA');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pid` int(5) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `releaseyear` int(5) NOT NULL,
  `storage` varchar(100) NOT NULL,
  `ram` varchar(100) NOT NULL,
  `resolution` varchar(100) NOT NULL,
  `features` varchar(200) NOT NULL,
  `price` int(5) NOT NULL,
  `imgs` varchar(100) NOT NULL,
  `bid` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pid`, `pname`, `releaseyear`, `storage`, `ram`, `resolution`, `features`, `price`, `imgs`, `bid`) VALUES
(1, 'PlayStation 1 (PS1)', 1994, 'None (used CDs)', '2MB', '240p to 480i', 'First console to use CD-ROMs, groundbreaking 3D graphics for the time', 150, 'ps1.jpg', 1),
(2, 'PlayStation 2 (PS2)', 2000, 'Memory cards up to 8MB, 40GB HDD', '32MB', 'Up to 480p (some games support 1080i)', 'DVD playback, backward compatibility with PS1 games', 170, 'ps2.jpg', 1),
(3, 'PlayStation 3 (PS3)', 2006, '160GB HDD', '256MB XDR main RAM + 256MB GDDR3 VRAM', 'Up to 1080p', 'Blu-ray support, online play through PlayStation Network ', 200, 'ps3.jpg', 1),
(4, 'PlayStation 4 (PS4)', 2013, '500GB HDD', '8GB GDDR5', 'Up to 4K', 'Share Play, Remote Play, VR support with PlayStation VR, online play through PlayStation Network', 250, 'ps4.jpg', 1),
(5, 'PlayStation 5 (PS5)', 2020, '825GB SSD', '16GB GDDR6', 'Up to 8K (some games), typically 4K for gaming', 'Ultra-fast SSD for quick load times, haptic feedback, adaptive triggers, ray tracing', 500, 'ps5.jpg', 1),
(6, 'PlayStation 5 Pro (PS5 Pro)', 2024, '825GB SSD (expandable)', '16GB GDDR6', 'Up to 8K ', 'Almost same features with PS5 but PS5 Pro expected to improve performance with higher resolutions and frame rates than PS5', 700, 'ps5pro.jpg', 1),
(7, 'Xbox Original', 2001, '10GB HDD', '64MB DDR', 'Up to 480p (some games supported 720p)', 'First console with an internal hard drive, supported online play through Xbox Live', 140, 'xboxorig.jpg', 2),
(8, 'Xbox 360', 2005, '500GB HDD', '512MB GDDR3', 'Up to 1080p (with HDMI cable)', 'Xbox Live Marketplace, online multiplayer, achievements, Kinect support', 155, 'xbox360.jpg', 2),
(9, 'Xbox One S', 2016, '1TB HDD', '8GB DDR3', 'Up to 1080p for games, 4K upscaling', 'Slimmer design, 4K Blu-ray support, HDR for games and video, IR blaster, no dedicated Kinect port', 200, 'xboxones.jpg', 2),
(10, 'Xbox One X', 2017, '1TB HDD', '12GB GDDR5', 'True 4K gaming, up to 60 FPS', 'Enhanced for 4K gaming, improved cooling, backward compatibility with select Xbox 360 and original Xbox games', 250, 'xboxonex.jpg', 2),
(11, 'Xbox Series S', 2020, '512GB custom NVMe SSD (expandable)', '10GB GDDR6', 'Up to 1440p for gaming, 4K upscaling', 'Compact design, supports next-gen features like ray tracing and Quick Resume, affordable alternative to Series X', 350, 'xboxss.png', 2),
(12, 'Xbox Series X', 2020, '1TB custom NVMe SSD (expandable)', '16GB GDDR6', 'Up to 8K, typically 4K at 60-120 FPS', 'Quick Resume, DirectStorage for faster load times, ray tracing, Smart Delivery Games, backward compatibility across Xbox generations', 500, 'xboxsx.jpg', 2),
(13, 'Nintendo Entertainment System (NES)', 1983, 'Game cartridges', '2KB', '256 x 240 pixels', 'Introduced the D-pad controller, popularized home gaming with titles like Super Mario Bros. and The Legend of Zelda', 130, 'nes.jpg', 3),
(14, 'Super Nintendo Entertainment System (SNES)', 1990, ' Game cartridges', '128KB', 'Up to 512 x 448 pixels', 'Mode 7 graphics for 3D-like effects, compatibility with iconic games like Super Mario World, The Legend of Zelda: A Link to the Past', 150, 'snes.jpg', 3),
(15, 'Nintendo 64 (N64)', 1996, 'Game cartridges', '8MB', 'Up to 640 x 480 pixels', 'First Nintendo console with 3D graphics, analog stick, compatibility with iconic games like Super Mario 64, The Legend of Zelda: Ocarina of Time', 160, 'n64.jpg', 3),
(16, 'Nintendo GameCube', 2001, '1.5GB mini-discs', '24MB main RAM + 16MB video RAM', 'Up to 480p', 'Compact design, handle for portability, strong third-party game library, compatibility with games like Super Smash Bros. Melee and Metroid Prime', 200, 'gamecube.jpg', 3),
(17, 'Nintendo Wii', 2006, '512MB internal memory (expandable with SD cards)', '88MB', 'Up to 480p', 'Motion-controlled gameplay, backward compatibility with GameCube games, titles like Wii Sports, Mario Kart Wii', 250, 'wii.jpg', 3),
(18, 'Nintendo Wii U', 2012, '32GB internal storage (expandable with external USB storage)', '2GB', 'Up to 1080p', 'GamePad controller with touchscreen, asymmetric gameplay, backward compatibility with Wii games, games like Super Mario 3D World', 250, 'wiiu.jpg', 3),
(19, 'Nintendo Switch', 2017, '32GB (expandable with microSD)', '4GB', 'Up to 1080p (docked), 720p (handheld)', 'Hybrid design for home and portable play, detachable Joy-Con controllers, motion controls, large library with popular titles like The Legend of Zelda: Breath of the Wild, Animal Crossing: New Horizons', 300, 'switch.jpg', 3),
(20, 'Nintendo Switch Lite', 2019, '32GB (expandable with microSD)', '4GB', '720p (handheld only)', 'Compact, handheld-only version of the Switch, non-detachable controls, compatible with most Switch games that support handheld mode, affordable option', 200, 'switchlite.jpg', 3),
(21, 'Nintendo Switch OLED', 2021, '64GB (expandable with microSD)', '4GB', 'Up to 1080p (docked), 720p (handheld)', 'More vibrant colors and deeper contrasts than the original Switch\'s LCD, improved audio, more flexible kickstand for tabletop mode, dock with LAN port for more stable online connections', 350, 'oled.jpg', 3);

-- --------------------------------------------------------

--
-- Table structure for table `views_counter`
--

CREATE TABLE `views_counter` (
  `vcid` int(11) NOT NULL,
  `vccount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `views_counter`
--

INSERT INTO `views_counter` (`vcid`, `vccount`) VALUES
(1, 3969);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `cid` (`cid`) USING BTREE;

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `bid` (`bid`) USING BTREE;

--
-- Indexes for table `views_counter`
--
ALTER TABLE `views_counter`
  ADD PRIMARY KEY (`vcid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `bid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `cid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `mid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `oid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `views_counter`
--
ALTER TABLE `views_counter`
  MODIFY `vcid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `FOREIGN` FOREIGN KEY (`cid`) REFERENCES `customers` (`cid`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `customers` (`cid`),
  ADD CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `bid` FOREIGN KEY (`bid`) REFERENCES `brands` (`bid`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"snap_to_grid\":\"off\",\"relation_lines\":\"true\",\"angular_direct\":\"direct\",\"side_menu\":\"true\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'luckygamingstore', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"brands\",\"customers\",\"messages\",\"orders\",\"products\",\"views_counter\"],\"table_structure[]\":[\"brands\",\"customers\",\"messages\",\"orders\",\"products\",\"views_counter\"],\"table_data[]\":[\"brands\",\"customers\",\"messages\",\"orders\",\"products\",\"views_counter\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(3, 'root', 'database', 'cityfoodkitchen', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"failed_jobs\",\"menu\",\"menutype\",\"migrations\",\"orders\",\"password_reset_tokens\",\"personal_access_tokens\",\"users\"],\"table_structure[]\":[\"failed_jobs\",\"menu\",\"menutype\",\"migrations\",\"orders\",\"password_reset_tokens\",\"personal_access_tokens\",\"users\"],\"table_data[]\":[\"failed_jobs\",\"menu\",\"menutype\",\"migrations\",\"orders\",\"password_reset_tokens\",\"personal_access_tokens\",\"users\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(5, 'root', 'database', 'cityfoodkitchen1', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"admins\",\"failed_jobs\",\"menu\",\"menutype\",\"migrations\",\"orders\",\"password_reset_tokens\",\"personal_access_tokens\",\"users\"],\"table_structure[]\":[\"admins\",\"failed_jobs\",\"menu\",\"menutype\",\"migrations\",\"orders\",\"password_reset_tokens\",\"personal_access_tokens\",\"users\"],\"table_data[]\":[\"admins\",\"failed_jobs\",\"menu\",\"menutype\",\"migrations\",\"orders\",\"password_reset_tokens\",\"personal_access_tokens\",\"users\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(7, 'root', 'server', 'cityfoodkitchen', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"cityfoodkitchen\",\"cityfoodkitchentesting\",\"deliveryservice\",\"foodpanda\",\"gwsc\",\"hydetravel\",\"luckygamingstore\",\"phpmyadmin\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

--
-- Dumping data for table `pma__navigationhiding`
--

INSERT INTO `pma__navigationhiding` (`username`, `item_name`, `item_type`, `db_name`, `table_name`) VALUES
('root', 'pma__column_info', 'table', 'phpmyadmin', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"cityfoodkitchen\",\"table\":\"menu\"},{\"db\":\"cityfoodkitchen\",\"table\":\"orders\"},{\"db\":\"cityfoodkitchen\",\"table\":\"users\"},{\"db\":\"luckygamingstore\",\"table\":\"customers\"},{\"db\":\"luckygamingstore\",\"table\":\"brands\"},{\"db\":\"cityfoodkitchen\",\"table\":\"migrations\"},{\"db\":\"cityfoodkitchen\",\"table\":\"password_reset_tokens\"},{\"db\":\"cityfoodkitchen\",\"table\":\"admins\"},{\"db\":\"luckygamingstore\",\"table\":\"orders\"},{\"db\":\"hydetravel\",\"table\":\"places\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Dumping data for table `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('cityfoodkitchen', 'menu', 'mname'),
('cityfoodkitchen', 'orderitems', 'orderid'),
('cityfoodkitchen', 'orders', 'payment'),
('cityfoodkitchen', 'payment', 'cardnumber'),
('luckygamingstore', 'messages', 'message'),
('luckygamingstore', 'products', 'pname');

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'gwsc', 'pitches', '[]', '2023-10-20 08:55:09'),
('root', 'gwsc', 'sites', '[]', '2023-10-19 13:44:59'),
('root', 'gwsc', 'views_counter', '{\"CREATE_TIME\":\"2023-10-12 12:17:12\",\"col_order\":[0,1],\"col_visib\":[1,1]}', '2023-10-12 05:47:54');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2026-04-30 07:47:15', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"en_GB\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
