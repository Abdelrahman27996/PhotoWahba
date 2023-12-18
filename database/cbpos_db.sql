-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2023 at 05:18 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cbpos_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `image_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `image_path`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'Wooden', 'A great quality of wood', 'uploads/brands/1.jpeg?v=1702905777', 1, 0, '2022-02-17 10:55:02'),
(3, 'Plex', '3 sizes of plex u can put your photos in', 'uploads/brands/3.jpeg?v=1702905862', 1, 0, '2022-02-17 10:59:32'),
(4, 'Digital', 'Digital frames', 'uploads/brands/4.jpeg?v=1702905636', 1, 0, '2022-02-17 11:00:18'),
(5, '3*1', '3 photos in 1 album', 'uploads/brands/5.jpeg?v=1702904464', 1, 0, '2022-02-17 11:01:12'),
(6, '2*1', '2 photos in album', 'uploads/brands/6.jpeg?v=1702904518', 1, 0, '2022-02-17 11:01:49'),
(7, 'Pillow', 'print you pictures on pillow', 'uploads/brands/7.jpeg?v=1702906129', 1, 0, '2023-12-17 14:41:10'),
(8, 'Mug', '35thtrhehtrh', NULL, 1, 0, '2023-12-17 14:41:10'),
(9, 'Print', 'Printing all sizes :\r\n\r\n10x15\r\n\r\n13x18\r\n\r\n15x21\r\n\r\n20x25\r\n\r\n20x30\r\n\r\n30x40\r\n\r\n30x45\r\n\r\n40x50\r\n\r\n50x60\r\n\r\n50x70\r\n\r\nمترx70', 'uploads/brands/9.jpeg?v=1702906009', 1, 0, '2023-12-17 14:43:30'),
(10, 'Ready products', 'Ready-to-buy products', NULL, 1, 0, '2023-12-17 14:43:30');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `delete_flag`, `date_created`) VALUES
(1, 'Frames', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi congue interdum pellentesque. Praesent bibendum vehicula libero a congue. In molestie rhoncus finibus.', 1, 0, '2022-02-17 11:27:11'),
(2, 'Albums', 'n interdum quis urna sed auctor. Vivamus a ligula ut dui aliquam efficitur ut eu ante. Phasellus pretium ut risus vitae euismod. Cras ac velit mollis, sodales urna vitae, pharetra dui. Mauris et sem vel est interdum lobortis sit amet quis felis.', 1, 0, '2022-02-17 11:27:24'),
(3, 'Accessories', 'n interdum quis urna sed auctor. Vivamus a ligula ut dui aliquam efficitur ut eu ante. Phasellus pretium ut risus vitae euismod. Cras ac velit mollis, sodales urna vitae, pharetra dui. Mauris et sem vel est interdum lobortis sit amet quis felis.', 1, 0, '2022-02-17 11:27:45'),
(4, 'Photoprint', 'Donec sit amet consectetur leo, eu lacinia risus. Donec dignissim magna lectus, vitae viverra lacus blandit vitae.', 1, 0, '2022-02-17 11:27:55'),
(5, 'Ready products', 'Proin sit amet elit in massa posuere ullamcorper quis quis sem. Phasellus accumsan augue vitae varius rhoncus. Proin vitae leo ante. Praesent a lorem justo.', 1, 0, '2022-02-17 11:28:38');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `status`, `delete_flag`, `date_created`) VALUES
(2, 'Samantha Jane', 'Miller', 'Female', '09123456789', 'sam23@sample.com', '45bff2a14658fc9b21c6e5e9bf75186b', 'Sample Address', 1, 0, '2022-02-17 14:24:00'),
(3, 'sherry', 'sherry', 'Male', '01234567', 'a@a.com', '202cb962ac59075b964b07152d234b70', 'awwqqw', 1, 0, '2023-12-17 14:17:17'),
(4, 'yahia', 'eissa', 'Male', '0123456789', 'yahia@gmail.com', '202cb962ac59075b964b07152d234b70', 'El rehab', 1, 0, '2023-12-18 18:14:43');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `variant` text NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `variant`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(1, 'Variant 1', 1, 10, 155, '2022-02-17 11:57:52', NULL),
(2, 'Variant 2', 1, 5, 200, '2022-02-17 12:01:15', NULL),
(3, 'Variant 2', 1, 10, 1055.58, '2022-02-17 12:04:15', '2023-12-17 15:09:30'),
(4, 'Variant 1', 3, 25, 250, '2022-02-17 13:22:54', NULL),
(5, 'Variant 2', 3, 25, 300, '2022-02-17 13:23:05', NULL),
(6, 'Variant 1', 4, 100, 350, '2022-02-17 16:28:14', NULL),
(7, '', 2, 10, 250, '2023-12-17 14:34:03', NULL),
(8, '1', 5, 10, 90, '2023-12-17 14:36:45', NULL),
(9, '1', 6, 10, 90, '2023-12-17 14:45:35', NULL),
(10, '1', 7, 10, 250, '2023-12-17 14:45:35', NULL),
(11, '1', 15, 4, 250, '2023-12-17 14:46:16', NULL),
(12, '2', 15, 5, 300, '2023-12-17 14:46:16', NULL),
(13, '1', 5, 10, 80, '2023-12-17 14:46:51', NULL),
(14, '1', 12, 10, 300, '2023-12-17 14:46:51', NULL),
(15, '1', 14, 10, 70, '2023-12-17 14:47:54', NULL),
(16, '1', 13, 5, 89, '2023-12-17 14:47:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `ref_code` varchar(100) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 = pending,\r\n1= Packed,\r\n2 = Out for Delivery,\r\n3=Delivered,\r\n4=cancelled',
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `ref_code`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(3, '20220200001', 2, 'Sample Address', 'cod', 0, 900, 4, 0, '2022-02-17 14:51:58', '2022-02-17 15:04:38'),
(4, '20220200002', 2, 'Sample Address', 'Online Payment', 0, 1800, 3, 1, '2022-02-17 15:26:17', '2022-02-17 15:35:45'),
(5, '20220200003', 2, 'Sample Address', 'cod', 0, 500, 3, 1, '2022-02-17 15:32:52', '2022-02-17 15:35:32'),
(6, '20231200001', 3, 'awwqqw', 'cod', 0, 155, 0, 0, '2023-12-17 14:17:53', NULL),
(7, '20231200002', 3, 'test1', 'cod', 0, 250, 0, 0, '2023-12-17 14:24:12', NULL),
(8, '20231200003', 3, 'test wood', 'cod', 0, 155, 0, 0, '2023-12-17 14:29:40', NULL),
(9, '20231200004', 3, 'aw', 'cod', 0, 250, 0, 0, '2023-12-17 14:34:33', NULL),
(10, '20231200005', 3, 'awwqqw', 'cod', 0, 90, 0, 0, '2023-12-17 14:37:19', NULL),
(11, '20231200006', 3, 'test4', 'cod', 0, 920, 0, 0, '2023-12-17 14:49:06', NULL),
(12, '20231200007', 3, 'test eav', 'cod', 0, 409, 0, 0, '2023-12-17 15:07:55', NULL),
(13, '20231200008', 3, 'check deletion', 'cod', 0, 640, 0, 0, '2023-12-17 15:12:30', NULL),
(14, '20231200009', 3, 'awwqqw', 'cod', 0, 250, 0, 0, '2023-12-17 15:19:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `inventory_id`, `quantity`, `price`, `total`) VALUES
(4, 3, 3, 3, 300, 900),
(5, 4, 3, 4, 300, 1200),
(6, 4, 1, 3, 200, 600),
(7, 5, 3, 2, 250, 500),
(8, 6, 1, 1, 155, 155),
(9, 7, 3, 1, 250, 250),
(10, 8, 1, 1, 155, 155),
(11, 9, 2, 1, 250, 250),
(12, 10, 5, 1, 90, 90),
(13, 11, 4, 1, 350, 350),
(14, 11, 5, 3, 90, 270),
(15, 11, 15, 1, 300, 300),
(16, 12, 13, 1, 89, 89),
(17, 12, 2, 1, 250, 250),
(18, 12, 14, 1, 70, 70),
(19, 13, 6, 1, 90, 90),
(20, 13, 15, 1, 250, 250),
(21, 13, 15, 1, 300, 300),
(22, 14, 2, 1, 250, 250);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `specs` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `name`, `specs`, `status`, `delete_flag`, `date_created`) VALUES
(1, 10, 1, 'Tripod', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif;&quot;&gt;Get a stand for your camera&amp;nbsp;&lt;/p&gt;', 1, 0, '2022-02-17 11:50:19'),
(2, 1, 1, 'More than 3 photos Frame', '&lt;p&gt;Get the best design of your photos&amp;nbsp;&lt;/p&gt;', 1, 0, '2022-02-17 11:54:02'),
(3, 1, 1, 'Wooden frame', '&lt;p&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;All sizes available :&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;10x15&lt;/p&gt;&lt;p&gt;13x18&lt;/p&gt;&lt;p&gt;15x21&lt;/p&gt;&lt;p&gt;20x25&lt;/p&gt;&lt;p&gt;20x30&lt;/p&gt;&lt;p&gt;30x40&lt;/p&gt;&lt;p&gt;30x45&lt;/p&gt;&lt;p&gt;40x50&lt;/p&gt;&lt;p&gt;50x60&lt;/p&gt;&lt;p&gt;50x70&lt;/p&gt;&lt;p&gt;مترx70&lt;/p&gt;', 1, 0, '2022-02-17 13:22:33'),
(4, 3, 1, 'Plex Frame ', '&lt;p&gt;&lt;span style=&quot;font-size: 0.875rem;&quot;&gt;All sizes available :&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;10x15&lt;/p&gt;&lt;p&gt;13x18&lt;/p&gt;&lt;p&gt;15x21&lt;/p&gt;&lt;p&gt;20x25&lt;/p&gt;&lt;p&gt;20x30&lt;/p&gt;&lt;p&gt;30x40&lt;/p&gt;&lt;p&gt;30x45&lt;/p&gt;&lt;p&gt;40x50&lt;/p&gt;&lt;p&gt;50x60&lt;/p&gt;&lt;p&gt;50x70&lt;/p&gt;&lt;p&gt;مترx70&lt;/p&gt;', 1, 0, '2022-02-17 16:27:41'),
(5, 4, 1, 'Digital Frame', '', 1, 0, '2023-12-17 14:35:55'),
(6, 5, 2, 'Album 3 in 1', '&lt;p&gt;You can put 3 photos in 1 album.&lt;/p&gt;&lt;p&gt;All sizes available :&lt;/p&gt;&lt;p&gt;10x15&lt;/p&gt;&lt;p&gt;13x18&lt;/p&gt;&lt;p&gt;15x21&lt;/p&gt;&lt;p&gt;20x25&lt;/p&gt;&lt;p&gt;20x30&lt;/p&gt;&lt;p&gt;30x40&lt;/p&gt;&lt;p&gt;30x45&lt;/p&gt;&lt;p&gt;40x50&lt;/p&gt;&lt;p&gt;50x60&lt;/p&gt;&lt;p&gt;50x70&lt;/p&gt;&lt;p&gt;مترx70&lt;/p&gt;', 1, 0, '2023-12-17 14:39:59'),
(7, 6, 2, 'Album 2 in 1', '&lt;p&gt;You can put 2 photos in 1 album.&lt;/p&gt;&lt;p&gt;All sizes available :&lt;/p&gt;&lt;p&gt;10x15&lt;/p&gt;&lt;p&gt;13x18&lt;/p&gt;&lt;p&gt;15x21&lt;/p&gt;&lt;p&gt;20x25&lt;/p&gt;&lt;p&gt;20x30&lt;/p&gt;&lt;p&gt;30x40&lt;/p&gt;&lt;p&gt;30x45&lt;/p&gt;&lt;p&gt;40x50&lt;/p&gt;&lt;p&gt;50x60&lt;/p&gt;&lt;p&gt;50x70&lt;/p&gt;&lt;p&gt;مترx70&lt;/p&gt;', 1, 0, '2023-12-17 14:39:59'),
(12, 8, 3, 'Mug', 'Send all your photos and get the best customized photo collage on your mug.', 1, 0, '2023-12-17 14:42:41'),
(13, 7, 3, 'Pillow', 'Get you photo printed on our pillow', 1, 0, '2023-12-17 14:42:41'),
(14, 9, 4, 'Printing Photo', 'Can also print passports to all countries&amp;nbsp;', 1, 0, '2023-12-17 14:44:18'),
(15, 10, 5, 'Camera', '&lt;p&gt;Colors available:&lt;/p&gt;&lt;p&gt;White&lt;/p&gt;&lt;p&gt;Green&lt;/p&gt;&lt;p&gt;Babyblue&lt;/p&gt;&lt;p&gt;Blue&lt;/p&gt;&lt;p&gt;Pink&lt;/p&gt;', 1, 0, '2023-12-17 14:44:18');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(3, 3, 900, '2022-02-17 14:51:58'),
(4, 4, 1800, '2022-02-17 15:26:17'),
(5, 5, 500, '2022-02-17 15:32:52'),
(6, 6, 155, '2023-12-17 14:17:53'),
(7, 7, 250, '2023-12-17 14:24:12'),
(8, 8, 155, '2023-12-17 14:29:40'),
(9, 9, 250, '2023-12-17 14:34:33'),
(10, 10, 90, '2023-12-17 14:37:19'),
(11, 11, 920, '2023-12-17 14:49:06'),
(12, 12, 409, '2023-12-17 15:07:55'),
(13, 13, 640, '2023-12-17 15:12:30'),
(14, 14, 250, '2023-12-17 15:19:03');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Photo Wahba Studio'),
(6, 'short_name', 'PhotoWahba'),
(11, 'logo', 'uploads/logo-1702900568.jpeg?v=1702900568'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1702900569.jpeg?v=1702900569');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatars/1.png?v=1645064505', NULL, 1, '2021-01-20 14:02:37', '2022-02-17 10:21:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
