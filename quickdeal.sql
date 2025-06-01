-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2025 at 06:31 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quickdeal`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, 'Electronics'),
(2, 'Fashion'),
(3, 'Home & Garden'),
(4, 'Health & Beauty'),
(5, 'Sports & Outdoors');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `submitted_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `user_id`, `message`, `rating`, `submitted_at`) VALUES
(1, 10, 'Say I love you but Im out of time', 2, '2025-05-20 21:39:29'),
(2, 10, 'Say I love you but Im out of time', 2, '2025-05-20 21:42:53'),
(3, 10, 'Say I love you but Im out of time', 2, '2025-05-20 21:44:25');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `condition` varchar(50) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Pending',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image_url` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT 0,
  `featured_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `user_id`, `title`, `description`, `category_id`, `subcategory_id`, `price`, `condition`, `location`, `status`, `created_at`, `updated_at`, `image_url`, `is_featured`, `featured_at`) VALUES
(1, 10, 'Hiking', 'Bachelor of Science in Electronics Engineering', 1, 1, 1233.00, 'new', 'Oas, Albay', 'Available', '2025-05-20 16:46:51', '2025-05-20 22:48:29', 'uploads/682c95dbd3e22_hiking.png', 0, NULL),
(2, 10, '1100000', 'Bachelor of Science in Electronics Engineering', 1, 2, 110000.00, 'new', 'Ligao', 'Available', '2025-05-20 16:47:45', '2025-05-20 22:48:29', 'uploads/682c961139f03_health and beauty.png', 0, NULL),
(3, 10, '100', 'Bachelor of Science in Electronics Engineering', 1, 3, 100.00, 'new', 'Oas, Albay', 'Available', '2025-05-20 16:48:12', '2025-05-20 22:48:28', 'uploads/682c962c69699_responsive.png', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `sent_at` datetime DEFAULT current_timestamp(),
  `is_read` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `sender_id`, `receiver_id`, `item_id`, `content`, `sent_at`, `is_read`) VALUES
(1, 8, 10, 1, 'Hey', '2025-05-21 11:57:01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sponsored_ads`
--

CREATE TABLE `sponsored_ads` (
  `ad_id` int(11) NOT NULL,
  `business_name` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sponsored_ads`
--

INSERT INTO `sponsored_ads` (`ad_id`, `business_name`, `image_url`, `link_url`, `start_date`, `end_date`, `is_active`, `created_at`) VALUES
(1, 'Youtube', 'ads/Migraine.png', 'https://www.messenger.com/e2ee/t/8342093465840799', '2025-05-15', '2025-05-31', 1, '2025-05-15 00:28:49'),
(2, 'Netflix', 'ads/ic_launcher.png', 'https://www.messenger.com/e2ee/t/8342093465840799', '2025-05-20', '2025-05-24', 1, '2025-05-20 14:15:38'),
(3, 'QuickDeal', 'ads/camera.png', 'https://www.messenger.com/e2ee/t/8342093465840799', '2025-05-20', '2025-05-28', 1, '2025-05-20 14:29:47'),
(4, 'QuickDeal', 'ads/camera.png', 'https://www.messenger.com/e2ee/t/8342093465840799', '2025-05-20', '2025-05-28', 1, '2025-05-20 14:34:12'),
(5, 'QuickDeal', 'ads/camera.png', 'https://www.messenger.com/e2ee/t/8342093465840799', '2025-05-20', '2025-05-28', 1, '2025-05-20 14:39:14'),
(6, 'QuickDeal', 'ads/camera.png', 'https://www.messenger.com/e2ee/t/8342093465840799', '2025-05-20', '2025-05-28', 1, '2025-05-20 14:41:33');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `subcategory_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`subcategory_id`, `category_id`, `name`) VALUES
(1, 1, 'Phones'),
(2, 1, 'Computers'),
(3, 1, 'Accessories'),
(4, 1, 'Laptops'),
(5, 1, 'Monitors'),
(6, 1, 'Networking'),
(7, 1, 'PC Gaming'),
(8, 2, 'Womens'),
(9, 2, 'Mens'),
(10, 2, 'Kids'),
(11, 2, 'Footwear'),
(12, 2, 'Accessories'),
(13, 2, 'Unisex'),
(14, 3, 'Furniture'),
(15, 3, 'Garden'),
(16, 3, 'Home Decor'),
(17, 3, 'Cleaning'),
(18, 3, 'Kitchen'),
(19, 3, 'Bedding'),
(20, 4, 'Skincare'),
(21, 4, 'Beauty'),
(22, 4, 'Health'),
(23, 4, 'Hygiene Essentials'),
(24, 4, 'Personal Care'),
(25, 4, 'Hair Care');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `subscription_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan` enum('free','premium') DEFAULT 'free',
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `subscription_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(50) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `userpass` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `user_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fullname`, `email`, `phone`, `location`, `userpass`, `date_added`, `role`, `user_img`) VALUES
(1, 'Dexter Nero', 'nerodexter26@gmail.com', NULL, NULL, 'nero', '2025-03-09 22:48:51', 'user', ''),
(2, 'Jeremy Rellama', 'jeremy@gmail.com', NULL, NULL, 'gago', '2025-03-09 22:58:24', 'user', ''),
(3, 'Makoy Rivero', 'makoy@gmail.com', NULL, NULL, 'kapeatyose', '2025-03-09 23:00:46', 'user', ''),
(4, 'Marc Elijah', 'elijah@gmail.com', NULL, NULL, 'elijah123', '2025-03-09 23:02:25', 'user', ''),
(5, 'bugoy drilon', 'bugoy@gmail.com', NULL, NULL, 'bugoy', '2025-03-09 23:05:04', 'user', ''),
(6, 'Jem', 'hehe@gmail.com', NULL, NULL, 'qwerty17', '2025-04-30 21:32:56', 'user', ''),
(7, 'marc', 'marc@gmail.com', NULL, NULL, 'marc', '2025-05-10 15:30:40', 'user', ''),
(8, 'ui', 'ui@gmail.com', NULL, NULL, 'ui', '2025-05-10 18:17:56', 'user', ''),
(9, 'admin', 'admin@gmail.com', NULL, NULL, 'admin', '2025-05-13 13:44:29', 'admin', ''),
(10, 'Paulo Avelino', 'paulo@gmail.com', NULL, NULL, 'avelino', '2025-05-15 09:54:23', 'user', 'paulo.jpg'),
(11, 'Alden Recharge', 'alden17@gmail.com', '0909090909', 'Oas, Albay', 'alden', '2025-05-20 16:55:09', 'user', 'f5ef5000641ee61a1866e04430db71fd.gif');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `sponsored_ads`
--
ALTER TABLE `sponsored_ads`
  ADD PRIMARY KEY (`ad_id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`subcategory_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `fk_user` (`user_id`),
  ADD KEY `fk_item` (`item_id`),
  ADD KEY `fk_subscription` (`subscription_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sponsored_ads`
--
ALTER TABLE `sponsored_ads`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `subcategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `subscription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_subscription` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`subscription_id`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
