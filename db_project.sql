-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2016 at 01:49 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
`message_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `message` varchar(1000) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `name`, `Email`, `message`) VALUES
(7, 'JOHN ODURO', 'Jouewk@gmail.com', 'kddddddFRANK YAY ONLINE SHOP');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
`order_id` int(11) NOT NULL,
  `memberID` int(11) NOT NULL,
  `poruductID` int(11) NOT NULL,
  `price` double(11,2) NOT NULL,
  `total` double(11,2) NOT NULL,
  `status` varchar(100) NOT NULL,
  `payment_type` varchar(100) NOT NULL,
  `transaction_code` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE IF NOT EXISTS `order_details` (
`orderid` int(11) NOT NULL,
  `memberID` int(11) NOT NULL,
  `qty` int(5) NOT NULL,
  `price` double(11,2) NOT NULL,
  `productID` int(11) NOT NULL,
  `total` double(11,2) NOT NULL,
  `status` varchar(100) NOT NULL,
  `modeofpayment` varchar(100) NOT NULL,
  `transaction_code` varchar(200) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`orderid`, `memberID`, `qty`, `price`, `productID`, `total`, `status`, `modeofpayment`, `transaction_code`) VALUES
(21, 18, 1, 25.00, 16, 25.00, 'Delivered', 'MTN Mobile Money', ''),
(20, 18, 20, 30.00, 26, 600.00, 'Delivered', 'MTN Mobile Money', ''),
(19, 18, 8, 30.00, 27, 240.00, 'Delivered', 'MTN Mobile Money', ''),
(18, 18, 1, 32.00, 23, 32.00, 'Delivered', 'MTN Mobile Money', ''),
(15, 18, 1, 25.00, 16, 25.00, 'Delivered', 'MTN Mobile Money', ''),
(17, 18, 2, 40.00, 18, 80.00, 'Delivered', 'MTN Mobile Money', ''),
(33, 1, 1, 32.00, 23, 32.00, 'Delivered', 'MTN Mobile Money', ''),
(23, 18, 1, 30.00, 17, 30.00, 'Delivered', 'MTN Mobile Money', ''),
(24, 18, 3, 50.00, 25, 150.00, 'Delivered', 'MTN Mobile Money', ''),
(34, 1, 12, 78.00, 21, 936.00, 'Delivered', 'MTN Mobile Money', ''),
(26, 19, 1, 50.00, 25, 50.00, 'Delivered', 'MTN Mobile Money', ''),
(27, 19, 1, 25.00, 16, 25.00, 'Delivered', 'MTN Mobile Money', ''),
(28, 19, 2, 40.00, 18, 80.00, 'Delivered', 'MTN Mobile Money', ''),
(29, 19, 4, 40.00, 24, 160.00, 'Delivered', 'MTN Mobile Money', ''),
(30, 18, 1, 25.00, 16, 25.00, 'Delivered', 'MTN Mobile Money', ''),
(31, 18, 2, 50.00, 25, 100.00, 'Delivered', 'MTN Mobile Money', ''),
(32, 18, 3, 78.00, 21, 234.00, 'Delivered', 'MTN Mobile Money', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_member`
--

CREATE TABLE IF NOT EXISTS `tb_member` (
`memberID` int(25) NOT NULL,
  `Firstname` varchar(25) NOT NULL,
  `Lastname` varchar(25) NOT NULL,
  `Email` varchar(25) NOT NULL,
  `Password` varchar(25) NOT NULL,
  `Contact_Number` varchar(25) NOT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_member`
--

INSERT INTO `tb_member` (`memberID`, `Firstname`, `Lastname`, `Email`, `Password`, `Contact_Number`, `address`) VALUES
(18, 'john', 'oduro', 'jouewk@gmail.com', 'pastee', '0242724849', 'kdk'),
(19, 'ATAKORAH', 'SAMUEL', 'owasdat@gmail.com', 'owass', '0245454546', 'TANOSO'),
(20, 'Kwabena', 'Agyapong', 'kobbiagyapong04@gmail.com', 'fab1739gas', '0242070021', 'box 4, Kumasi'),
(22, 'Pastee', 'Oduro', 'jouewk@gmail.com', 'Pastee', '0242545454', 'TANOSO');

-- --------------------------------------------------------

--
-- Table structure for table `tb_products`
--

CREATE TABLE IF NOT EXISTS `tb_products` (
`productID` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `description` varchar(500) NOT NULL,
  `category` varchar(200) NOT NULL,
  `originated` varchar(500) NOT NULL,
  `price` double(11,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `location` varchar(500) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_products`
--

INSERT INTO `tb_products` (`productID`, `name`, `description`, `category`, `originated`, `price`, `quantity`, `location`) VALUES
(18, 'Young 3', 'lectures choice', 'School', 'UK', 40.00, 4, 'upload/3.jpg'),
(19, 'Boga Boga t9', 'Boga Bag', 'Travelling', 'USA', 50.00, 7, 'upload/10.jpg'),
(20, 'Boga Boga s8', 'Boga Bag', 'Travelling', 'USA', 80.00, 9, 'upload/2.jpg'),
(21, 'Boga Boga PP', 'UNIVERSITY T BAG', 'Travelling', 'UK', 78.00, 5, 'upload/3.jpg'),
(22, 'Hanga 5', 'Hand N', 'Hand', 'UK', 30.00, 8, 'upload/1.jpg'),
(16, 'Le 25', 'lectures choice', 'School', 'UK', 25.00, 4, 'upload/7.jpg'),
(17, 'LB 4', 'lectures choice', 'School', 'UK', 30.00, 3, 'upload/12.jpg'),
(23, 'Hanga 5TD', 'Hand ME', 'Hand', 'USA', 32.00, 12, 'upload/5.jpg'),
(24, 'Young Gallet', 'Lecture Bag for Ladies', 'Hand', 'UK', 40.00, 15, 'upload/13.jpg'),
(25, 'Old school ', 'for all', 'School', 'UK', 50.00, 5, 'upload/15.jpg'),
(26, 'University Bag', 'University Core Bag ', 'Travelling', 'USA', 30.00, 20, 'upload/4.jpg'),
(27, 'Old school Tea', 'Hard core Leather for Ladies', 'School', 'UK', 30.00, 8, 'upload/16.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE IF NOT EXISTS `tb_user` (
`user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`user_id`, `username`, `password`, `firstname`, `lastname`) VALUES
(1, 'admin', 'admin', 'Samuel Atakora', 'Oware'),
(17, 'Emma', 'Emma', 'Emmanuel', 'Maako');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
 ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
 ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
 ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `tb_member`
--
ALTER TABLE `tb_member`
 ADD PRIMARY KEY (`memberID`);

--
-- Indexes for table `tb_products`
--
ALTER TABLE `tb_products`
 ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
 ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `tb_member`
--
ALTER TABLE `tb_member`
MODIFY `memberID` int(25) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `tb_products`
--
ALTER TABLE `tb_products`
MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
