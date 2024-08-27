-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 01, 2023 at 08:28 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `the_shoebox`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(70) NOT NULL,
  `delivery_address` varchar(100) NOT NULL,
  `cell_phone_number` varchar(15) NOT NULL,
  `sa_id_number` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `email`, `delivery_address`, `cell_phone_number`, `sa_id_number`) VALUES
(2, 'Zuhar', 'Regal', 'zuharregall@gmail.com', '162 St Kilda Road Lansdowne', '0815128866', '0310210092089'),
(3, 'Aqilah', 'Regal', 'aqilahregal@gmail.com', '162 St Kilda Road Lansdowne', '0718767654', '0011090123081'),
(9, 'Shaheed', 'Regal', 'shaheed.regal@airports.co.za', '162 St Kilda Road', '+ 270824182571', '7607225181085'),
(10, 'Aashiqah', 'Regal', 'aashiqahregal8@gmail.com', '162 St Kilda Rd Lansdowne', '0815185588', '0011090124089'),
(11, 'Fatima', 'Isaacs', 'fatimaisaacs@gmail.com', '7 Church Street, Athlone ', '+ 270715672255', '7507290143087'),
(31, 'Tashreeq', 'Isaacs', 'tashreeq@gmail.com', '7 Church Street, Athlone', '0834657766', '1112233423123'),
(36, 'Tahliah', 'Toffar', 'tahliahtoffar@gmail.com', '(address)', '0667481234', '0411210086088');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_status`) VALUES
(51, 11, 'Unfilled'),
(52, 2, 'Unfilled'),
(53, 9, 'Unfilled'),
(54, 10, 'Unfilled'),
(55, 3, 'Unfilled'),
(57, 31, 'Unfilled'),
(58, 36, 'Filled');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_id` int(11) NOT NULL,
  `shoe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_id`, `shoe_id`) VALUES
(51, 1),
(52, 3),
(53, 4),
(54, 5),
(55, 4),
(57, 1),
(58, 1),
(58, 2);

-- --------------------------------------------------------

--
-- Table structure for table `shoes`
--

CREATE TABLE `shoes` (
  `shoe_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `brand` varchar(30) NOT NULL,
  `colour` varchar(20) NOT NULL,
  `material` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shoes`
--

INSERT INTO `shoes` (`shoe_id`, `name`, `price`, `brand`, `colour`, `material`, `description`, `image`) VALUES
(1, 'Slingback Heel', '350.00', 'H&M', 'Beige', 'Suede', 'Slingbacks in imitation suede with pointed toes, a narrow ankle strap and angular heels. Satin linings and imitation leather insoles. Heel 6.5 cm.', 'Shoe1.jpg'),
(2, 'Mule Heel', '300.00', 'Cotton on', 'Black', 'Faux Leather', 'Square toe with a slide-on design, lightweight and versatile', 'Shoe2.jpg'),
(3, 'Mule Heel', '300.00', 'Cotton On', 'White', 'Faux Leather', 'Square toe with a slide-on design, lightweight and versatile', 'Shoe3.jpg'),
(4, 'Ankle Boot', '500.00', 'H&M', 'Black', 'Faux Leather', 'Ankle boots, covered block heels and a concealed zip on one side with jersey linings. Heel 8.5 cm.', 'Shoe4.jpg'),
(5, 'Court Heel', '600.00', 'Mango', 'Black', 'Suede', 'Soft finish with asymmetric design. Pointed side slit stiletto heel.', 'Shoe5.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `shoe_id` (`shoe_id`);

--
-- Indexes for table `shoes`
--
ALTER TABLE `shoes`
  ADD PRIMARY KEY (`shoe_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `shoes`
--
ALTER TABLE `shoes`
  MODIFY `shoe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`shoe_id`) REFERENCES `shoes` (`shoe_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
