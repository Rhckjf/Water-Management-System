-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2024 at 09:19 PM
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
-- Database: `water-managment`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(500) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `type`) VALUES
(1, 'root', '', 'user', 'admin'),
(2, 'root', 'dik@gmail.com', 'user2', 'admin'),
(3, 'root', 'pass@waa', 'user3', 'admin'),
(4, 'admin', 'admin@gmail.com', 'user4', 'admin'),
(6, 'dik', 'dik@gmail.com', 'user5', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_phone` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_phone`) VALUES
(1, 'Ihsan', '99750576266'),
(3, 'Zaki', '1223');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `type` int(50) NOT NULL COMMENT '0-bought 1-Sold',
  `vendor_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `total` int(11) NOT NULL DEFAULT 0,
  `payment_status` varchar(50) NOT NULL COMMENT '0=pending 1=paid',
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `type`, `vendor_id`, `customer_id`, `total`, `payment_status`, `date`) VALUES
(1046, 1, NULL, 1, 0, 'pending', '2024-02-14'),
(1047, 1, NULL, 1, 0, 'pending', '2024-02-14'),
(1049, 1, NULL, 1, 0, 'paid', '2024-02-14'),
(1050, 1, NULL, 1, 0, 'pending', '2024-02-14'),
(1052, 1, NULL, 1, 0, 'paid', '2024-02-14'),
(1053, 1, NULL, 1, 0, 'pending', '2024-02-14'),
(1054, 1, NULL, 1, 0, 'pending', '2024-02-14'),
(1055, 1, NULL, 1, 0, 'pending', '2024-02-14'),
(1056, 1, NULL, 1, 0, 'pending', '2024-02-14'),
(1057, 1, NULL, 1, 0, 'pending', '2024-02-14'),
(1058, 1, NULL, 1, 0, 'pending', '2024-02-14'),
(1059, 1, NULL, 1, 0, 'pending', '2024-02-14'),
(1060, 1, NULL, 1, 0, 'pending', '2024-02-14'),
(1061, 1, NULL, 1, 0, 'pending', '2024-02-14'),
(1062, 1, NULL, 1, 0, 'pending', '2024-02-14'),
(1063, 1, NULL, 1, 0, 'pending', '2024-02-14'),
(1064, 1, NULL, 1, 0, 'pending', '2024-02-14'),
(1065, 1, NULL, 1, 0, 'pending', '2024-02-14'),
(1066, 1, NULL, 3, 0, 'pending', '2024-02-15'),
(1067, 1, NULL, 3, 0, 'pending', '2024-02-15'),
(1068, 1, NULL, 3, 0, 'pending', '2024-02-15'),
(1069, 1, NULL, 1, 0, 'pending', '2024-02-15'),
(1070, 1, NULL, 1, 0, 'pending', '2024-02-15'),
(1071, 1, NULL, 1, 300, 'pending', '2024-02-15'),
(1072, 1, NULL, 1, 0, 'pending', '2024-02-15'),
(1073, 1, NULL, 1, 0, 'pending', '2024-02-15'),
(1074, 1, NULL, 1, 0, 'pending', '2024-02-15'),
(1075, 1, NULL, 1, 0, 'pending', '2024-02-15'),
(1076, 1, NULL, 1, 0, 'pending', '2024-02-15'),
(1077, 1, NULL, 1, 0, 'pending', '2024-02-15'),
(1078, 1, NULL, 1, 0, 'pending', '2024-02-15'),
(1079, 1, NULL, 1, 0, 'pending', '2024-02-15'),
(1080, 1, NULL, 1, 0, 'pending', '2024-02-15'),
(1082, 1, NULL, 1, 1700, 'paid', '2024-02-16'),
(1083, 0, 88, NULL, 0, 'pending', '2024-02-16'),
(1084, 0, 74, NULL, 0, 'pending', '2024-04-25'),
(1085, 0, 74, NULL, 0, 'pending', '2024-04-25'),
(1086, 0, 94, NULL, 0, 'pending', '2024-04-25'),
(1087, 1, NULL, 1, 60, 'pending', '2024-04-25'),
(1092, 1, NULL, 1, 0, 'paid', '2024-04-25'),
(1093, 1, NULL, 1, 0, 'pending', '2024-04-25'),
(1094, 1, NULL, 1, 0, 'paid', '2024-04-25'),
(1096, 1, NULL, 1, 0, 'paid', '2024-04-25'),
(1099, 0, 74, NULL, 0, 'pending', '2024-04-29');

-- --------------------------------------------------------

--
-- Table structure for table `orders_product`
--

CREATE TABLE `orders_product` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_product`
--

INSERT INTO `orders_product` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(7, 1053, 1, 11),
(12, 1082, 1, 85),
(13, 1087, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_category` varchar(100) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_cost` int(11) NOT NULL,
  `product_price` int(11) NOT NULL DEFAULT 0,
  `product_stock` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_category`, `product_name`, `product_cost`, `product_price`, `product_stock`) VALUES
(1, 'Water Sanqua', 'Danang', 0, 20, 5437),
(2, 'Water Jar', 'Siti', 0, 355, 79),
(3, 'Water Aqua', 'Jajang', 0, 12, 10),
(4, 'Water Vit', 'Kelly', 0, 233, 213123),
(5, 'water ajim', 'nisan', 0, 1234, 1234);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL,
  `vendor_name` varchar(100) NOT NULL,
  `vendor_phone` varchar(100) NOT NULL,
  `product_id` int(11) DEFAULT 1,
  `vendor_quantity` int(11) NOT NULL,
  `vendor_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`id`, `vendor_name`, `vendor_phone`, `product_id`, `vendor_quantity`, `vendor_price`) VALUES
(74, 'Eny', '11113243132', 1, 1243, 43),
(88, 'Krishna', '88888888888', 1, 23, 233),
(94, 'angb', '12345678910', 1, 13, 134),
(98, 'asep', '087639265', 1, 12, 10000),
(99, 'anas', '0876437653', 2, 18, 1765443),
(100, 'ajeng', '0816249876', 5, 19, 20000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `vendor_id` (`vendor_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `orders_product`
--
ALTER TABLE `orders_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendor_phone` (`vendor_phone`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1100;

--
-- AUTO_INCREMENT for table `orders_product`
--
ALTER TABLE `orders_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `orders_product`
--
ALTER TABLE `orders_product`
  ADD CONSTRAINT `orders_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orders_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `vendor`
--
ALTER TABLE `vendor`
  ADD CONSTRAINT `vendor_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
