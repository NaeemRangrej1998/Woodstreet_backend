-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2020 at 07:29 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `additional_service`
--

CREATE TABLE `additional_service` (
  `As_id` int(20) NOT NULL,
  `As_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$nvuKE/lEupX3W065ewlKhO1g61e0291Xte/NYYnDyXB8k7Zsykibi');

-- --------------------------------------------------------

--
-- Table structure for table `admin_address`
--

CREATE TABLE `admin_address` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line_1` text COLLATE utf8_unicode_ci NOT NULL,
  `line_2` text COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin_address`
--

INSERT INTO `admin_address` (`id`, `company_name`, `line_1`, `line_2`, `city`, `zip`, `state`, `country`, `admin_id`) VALUES
(1, 'W3engineers Ltd.', '4th floor, Tayamun Centre, Upper Jessore Rd', 'null', 'Khulna', '9001', 'Khulna', 'Bangladesh', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admob`
--

CREATE TABLE `admob` (
  `id` int(11) NOT NULL,
  `banner_status` int(11) NOT NULL,
  `banner_id` varchar(100) NOT NULL,
  `banner_unit_id` varchar(100) NOT NULL,
  `interstitial_status` int(11) NOT NULL,
  `interstitial_id` varchar(100) NOT NULL,
  `interstitial_unit_id` varchar(100) NOT NULL,
  `video_status` int(11) NOT NULL,
  `video_id` varchar(100) NOT NULL,
  `video_unit_id` varchar(100) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admob`
--

INSERT INTO `admob` (`id`, `banner_status`, `banner_id`, `banner_unit_id`, `interstitial_status`, `interstitial_id`, `interstitial_unit_id`, `video_status`, `video_id`, `video_unit_id`, `admin_id`) VALUES
(1, 1, 'ca-app-pub-3940256099942544~3347511713', 'ca-app-pub-3940256099942544/6300978111', 1, 'ca-app-pub-3940256099942544~3347511713', 'ca-app-pub-3940256099942544/8691691433', 1, 'ca-app-pub-4761500786576152~8215465788', 'ca-app-pub-3940256099942544/5224354917', 1);

-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE `attribute` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attribute`
--

INSERT INTO `attribute` (`id`, `admin_id`, `title`) VALUES
(7, 1, 'colour');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_value`
--

CREATE TABLE `attribute_value` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `attribute` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attribute_value`
--

INSERT INTO `attribute_value` (`id`, `admin_id`, `attribute`, `title`) VALUES
(34, 1, 7, 'black'),
(35, 1, 7, 'green'),
(36, 1, 7, 'purpule'),
(37, 1, 7, 'red'),
(38, 1, 7, 'yellow');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_resolution` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `admin_id`, `status`, `title`, `image_name`, `image_resolution`) VALUES
(28, 1, 1, 'best ', '5.jpg', '308:164');

-- --------------------------------------------------------

--
-- Table structure for table `favourite`
--

CREATE TABLE `favourite` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `favourite`
--

INSERT INTO `favourite` (`id`, `item_id`, `user_id`, `admin_id`) VALUES
(1, 9, 67, 1);

-- --------------------------------------------------------

--
-- Table structure for table `home_banner`
--

CREATE TABLE `home_banner` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resolution` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `category_1` int(11) NOT NULL,
  `category_2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `home_banner`
--

INSERT INTO `home_banner` (`id`, `admin_id`, `image_name`, `resolution`, `tag`, `category_1`, `category_2`) VALUES
(4, 1, 'bwtcllqbv9c0808s.png', '540:222', 'banner_1', 3, 4),
(5, 1, 'ojieb6w02lcgk8k0.png', '540:228', 'banner_2', 4, 6),
(6, 1, 'looy6suab9ws8w4k.jpg', '480:480', 'ladki', 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `attributes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product`, `quantity`, `attributes`) VALUES
(78, 66, 12, NULL),
(79, 67, 111, NULL),
(80, 68, 11111, NULL),
(81, 69, 145, NULL),
(82, 70, 10, NULL),
(83, 71, 10, NULL),
(84, 72, 10, NULL),
(85, 73, 10, NULL),
(86, 74, 10, NULL),
(88, 76, 10, NULL),
(89, 77, 10, NULL),
(90, 78, 10, NULL),
(91, 79, 10, NULL),
(93, 81, 10, NULL),
(94, 82, 10, NULL),
(95, 83, 10, NULL),
(96, 84, 10, NULL),
(97, 85, 10, NULL),
(98, 86, 10, NULL),
(99, 87, 10, NULL),
(100, 88, 10, NULL),
(101, 89, 10, NULL),
(102, 90, 10, NULL),
(103, 91, 10, NULL),
(104, 92, 10, NULL),
(105, 93, 10, NULL),
(106, 94, 10, NULL),
(107, 95, 10, NULL),
(108, 96, 10, NULL),
(109, 97, 10, NULL),
(122, 110, 10, NULL),
(124, 112, 10, NULL),
(125, 113, 10, NULL),
(126, 114, 10, NULL),
(127, 115, 10, NULL),
(128, 116, 10, NULL),
(129, 117, 100, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_image`
--

CREATE TABLE `item_image` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `resolution` varchar(100) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_image`
--

INSERT INTO `item_image` (`id`, `item_id`, `image_name`, `resolution`, `admin_id`) VALUES
(15, 72, 'l018e8qfodso40ws.jpg', '225:225', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ordered_product`
--

CREATE TABLE `ordered_product` (
  `id` int(11) NOT NULL,
  `product_order` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `price` float NOT NULL,
  `revenue` float NOT NULL DEFAULT 0,
  `inventory` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ordered_product`
--

INSERT INTO `ordered_product` (`id`, `product_order`, `product`, `price`, `revenue`, `inventory`, `quantity`) VALUES
(1, 1, 8, 200, 100, 10, 1),
(2, 2, 9, 200, 50, 11, 1),
(3, 3, 13, 200, 100, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` float NOT NULL,
  `user` int(11) NOT NULL,
  `address` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT 0,
  `notification` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `admin_id`, `method`, `amount`, `user`, `address`, `time`, `status`, `notification`) VALUES
(1, 1, 'Credit Card', 260, 3, 1, '2019-05-10 12:51:38', 0, 0),
(2, 1, 'Credit Card', 260, 4, 2, '2019-05-10 12:52:09', 0, 0),
(3, 1, 'Paypal Account', 260, 3, 1, '2019-05-10 12:53:55', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `environment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `merchant_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `public_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `private_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `admin_id`, `environment`, `merchant_id`, `public_key`, `private_key`) VALUES
(1, 1, 'sandbox', 'k2dk75vhbmd8wthg', 'ktb9336dmpq6c266', '47affb07fa413ffb9a6d12d8e5ddf209');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_resolution` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `tags` text COLLATE utf8_unicode_ci NOT NULL,
  `purchase_price` float NOT NULL,
  `prev_price` float DEFAULT NULL,
  `current_price` float NOT NULL,
  `featured` int(11) NOT NULL,
  `sell` int(11) DEFAULT 0,
  `ar_featured` int(11) NOT NULL,
  `dim_featured` int(11) NOT NULL,
  `ar_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dim_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ar_image_resolution` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dim_image_resolution` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sub_cat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `status`, `admin_id`, `category`, `title`, `image_name`, `image_resolution`, `description`, `tags`, `purchase_price`, `prev_price`, `current_price`, `featured`, `sell`, `ar_featured`, `dim_featured`, `ar_image`, `dim_image`, `ar_image_resolution`, `dim_image_resolution`, `sub_cat`) VALUES
(110, 1, 1, 28, 'Some text here', '3.jpg', '302:167', 'some test desc', 'some test desc', 0, -1, 100, 1, 0, 1, 2, '5.jpg', '2.jpg', '308:164', '302:167', 24),
(112, 1, 1, 28, 'Some text here', 'hju00m1ht68sockw.jpg', '225:225', 'some test desc\r\nyuli\';l', 'some testkl\'yl desc', 0, -1, 100, 1, 0, 1, 1, 'kluplr5pz68ckook.jpg', '3.jpg', '302:167', '302:167', 24),
(113, 1, 1, 28, 'testing', '9zmksa3kvqgo08ww.jpg', '225:225', 'some test desc', 'some test desc', 0, -1, 100, 1, 0, 1, 1, '3yimrviuigw0040g.jpg', '3.jpg', '293:172', '302:167', 24),
(114, 1, 1, 28, 'Some text here', 'oshtfbtyxasscsg0.jpg', '308:164', 'some test desc', 'some test desc', 0, -1, 100, 2, 0, 2, 2, 'cottage_obj.obj', 'ffdfjwrrabwocs88.jpg', '', '308:164', 23),
(115, 1, 1, 28, 'Some text here', 'ihwhbf189e88sg40.jpg', '302:167', 'some test desc', 'some test desc', 0, -1, 100, 2, 0, 2, 2, 'cottage_obj.obj', 'pgi198tjrtc88ogw.jpg', '', '302:167', 23),
(116, 1, 1, 28, 'Some text here', '3.jpg', '', 'some test desc', 'some test desc', 0, -1, 100, 2, 0, 0, 0, '', '', '', '', 23),
(117, 1, 1, 28, 'Naim test', '7.jpg', '267:189', 'some test desc', 'some test desc', 0, -1, 2000, 2, 0, 1, 1, 'cottage_obj.obj', 'sa1uryd18wgcskow.jpg', '', '302:167', 23);

-- --------------------------------------------------------

--
-- Table structure for table `product_add_service`
--

CREATE TABLE `product_add_service` (
  `pro_id` int(10) NOT NULL,
  `as_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `push_notification`
--

CREATE TABLE `push_notification` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `message` mediumtext NOT NULL,
  `admin_id` int(11) NOT NULL,
  `img` varchar(50) NOT NULL,
  `image_resolution` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `push_notification`
--

INSERT INTO `push_notification` (`id`, `title`, `message`, `admin_id`, `img`, `image_resolution`) VALUES
(24, 'kjg', 'iug', 1, '4.jpg', '275:183');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `rating` float NOT NULL,
  `review` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_image`
--

CREATE TABLE `review_image` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resolution` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `api_token` varchar(100) NOT NULL,
  `currency_name` varchar(100) NOT NULL,
  `currency_font` varchar(10) NOT NULL,
  `tax` float NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `api_token`, `currency_name`, `currency_font`, `tax`, `admin_id`) VALUES
(2, 'www', 'Dollar', '$', 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `site_config`
--

CREATE TABLE `site_config` (
  `id` int(11) NOT NULL,
  `image_name` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `tag_line` varchar(100) NOT NULL,
  `firebase_auth` mediumtext NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `site_config`
--

INSERT INTO `site_config` (`id`, `image_name`, `title`, `tag_line`, `firebase_auth`, `admin_id`) VALUES
(1, 'ic_splash_logo.png', 'Uniqa', 'An android eCommerce app with admin panel', 'AAAA1lHJRqU:APA91bH0n2WlP4M5I1MMYzHQkFJvCQ11fznZEv8fSuNfuHttCQupG-IboR88c_kYbUjmsxURfc2gYtrnWwkfKqAQ8mqFvkvfYB0YqJ8f4RJTAeG-5PkqRQYCmPCsq8T4APqogHS_D1g-', 1);

-- --------------------------------------------------------

--
-- Table structure for table `slider_image`
--

CREATE TABLE `slider_image` (
  `id` int(11) NOT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resolution` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slider_image`
--

INSERT INTO `slider_image` (`id`, `tag`, `image_name`, `resolution`, `admin_id`) VALUES
(20, 'table', 'moinmemon.jpg', '225:225', 1);

-- --------------------------------------------------------

--
-- Table structure for table `smtp_config`
--

CREATE TABLE `smtp_config` (
  `id` int(11) NOT NULL,
  `host` varchar(100) NOT NULL,
  `sender_email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `encryption` varchar(10) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `smtp_config`
--

INSERT INTO `smtp_config` (`id`, `host`, `sender_email`, `username`, `password`, `port`, `encryption`, `admin_id`) VALUES
(1, 'smtp.gmail.com', 'johnruggles63@gmail.com', 'johnruggles63@gmail.com', 'BaPk9YljlX', 587, 'tls', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `Sub_id` int(11) NOT NULL,
  `Sub_name` varchar(15) NOT NULL,
  `parent_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`Sub_id`, `Sub_name`, `parent_id`) VALUES
(23, 'Kid', 28),
(24, 'naim', 28);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` mediumtext NOT NULL,
  `type` int(11) NOT NULL,
  `social_id` varchar(50) DEFAULT NULL,
  `verification_token` varchar(10) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `image_name` varchar(255) NOT NULL,
  `image_resolution` varchar(100) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `type`, `social_id`, `verification_token`, `status`, `image_name`, `image_resolution`, `admin_id`) VALUES
(1, 'Jordan Elmore', 'jordan.elmore23@gmail.com', '$2y$10$rZvZw53Ly5FKjX5ECzgBdOweLl3pDnxHDGqCVSx30XNbcr0gxhZO.', 3, '1.1419876941415e20', '2058', NULL, 'profile_default.jpg', '500:500', 1),
(2, 'JackÃ±', 'a', '$2y$10$t4NXmahHkURoIe5II6GWMukdk4pw9qvsxi2.PyfbSPGcObCgEUoL2', 2, '827642734259720', '1583', NULL, 'profile_default.jpg', '500:500', 1),
(5, 'NAIM RANGREKJ', 'naimrangrej554@gmail.com', '', 0, NULL, '', NULL, '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `line_1` text NOT NULL,
  `line_2` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `zip` varchar(100) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_address`
--

INSERT INTO `user_address` (`id`, `user`, `line_1`, `line_2`, `city`, `zip`, `state`, `country`) VALUES
(1, 3, 'xyyd', 'dye', 'gzdh', '8368', 'xhxh', 'dgdy'),
(2, 4, 'cjcjfi', 'dhduf', 'dhfu', '6565', 'hfuf', 'gkg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_service`
--
ALTER TABLE `additional_service`
  ADD PRIMARY KEY (`As_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_address`
--
ALTER TABLE `admin_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admob`
--
ALTER TABLE `admob`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute`
--
ALTER TABLE `attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_value`
--
ALTER TABLE `attribute_value`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourite`
--
ALTER TABLE `favourite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_banner`
--
ALTER TABLE `home_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_image`
--
ALTER TABLE `item_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordered_product`
--
ALTER TABLE `ordered_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_cat` (`sub_cat`);

--
-- Indexes for table `push_notification`
--
ALTER TABLE `push_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review_image`
--
ALTER TABLE `review_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_config`
--
ALTER TABLE `site_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider_image`
--
ALTER TABLE `slider_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `smtp_config`
--
ALTER TABLE `smtp_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`Sub_id`),
  ADD KEY `sub_category_ibfk_1` (`parent_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_address`
--
ALTER TABLE `admin_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admob`
--
ALTER TABLE `admob`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attribute`
--
ALTER TABLE `attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `attribute_value`
--
ALTER TABLE `attribute_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `favourite`
--
ALTER TABLE `favourite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `home_banner`
--
ALTER TABLE `home_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `item_image`
--
ALTER TABLE `item_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ordered_product`
--
ALTER TABLE `ordered_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `push_notification`
--
ALTER TABLE `push_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review_image`
--
ALTER TABLE `review_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `site_config`
--
ALTER TABLE `site_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `slider_image`
--
ALTER TABLE `slider_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `smtp_config`
--
ALTER TABLE `smtp_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `Sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`sub_cat`) REFERENCES `sub_category` (`Sub_id`);

--
-- Constraints for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD CONSTRAINT `sub_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
