-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2023 at 04:05 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auto_pro_hub`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessories_tb`
--

CREATE TABLE `accessories_tb` (
  `acc_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rate` int(11) NOT NULL,
  `des` varchar(300) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accessories_tb`
--

INSERT INTO `accessories_tb` (`acc_id`, `name`, `rate`, `des`, `brand`, `type`, `image`, `quantity`, `pro_id`) VALUES
(1, '$name', 350, '$description', '$brand', 'Bike', 'images (63).jpg', 4, 1),
(2, 'PQR', 550, 'sknxsjk sjs xsmskjxs sxjks xsxsjxsjsmslkjxnsx lnlksnxs xskjxnsm x', 'KKK', 'car', 'images (63).jpg', 8, 2),
(4, 'sgsgxbd', 850, 'dgehv sg dvdv ', 'cbdhcn', 'Bike', 'images (63).jpg', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `acc_booking_tb`
--

CREATE TABLE `acc_booking_tb` (
  `acc_book_id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `tot` int(11) NOT NULL,
  `pay_type` varchar(50) NOT NULL,
  `pay_method` varchar(50) NOT NULL,
  `pay_status` varchar(50) NOT NULL DEFAULT 'pending',
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'requested'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `acc_booking_tb`
--

INSERT INTO `acc_booking_tb` (`acc_book_id`, `acc_id`, `quantity`, `tot`, `pay_type`, `pay_method`, `pay_status`, `user_id`, `date`, `status`) VALUES
(1, 1, 2, 700, 'Online', 'GPay', 'paid', 6, '2023-07-13', 'completed'),
(2, 1, 3, 2100, 'COD', 'Cash', 'paid', 7, '2023-07-13', 'completed'),
(3, 2, 1, 550, 'COD', 'Cash', 'pay on delivery', 7, '2023-07-20', 'accepted'),
(4, 2, 2, 1100, '', '', 'pending', 6, '2023-07-22', 'requested'),
(5, 2, 2, 1100, '', '', 'pending', 6, '2023-07-22', 'requested'),
(6, 2, 2, 1100, 'Online', 'GPay', 'paid', 6, '2023-07-22', 'completed'),
(7, 2, 2, 1100, '', '', 'pending', 6, '2023-07-22', 'requested'),
(8, 1, 1, 350, '', '', 'pending', 7, '2023-07-28', 'accepted');

-- --------------------------------------------------------

--
-- Table structure for table `admin_tb`
--

CREATE TABLE `admin_tb` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin_tb`
--

INSERT INTO `admin_tb` (`id`, `username`, `password`) VALUES
(1, 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `booking_tb`
--

CREATE TABLE `booking_tb` (
  `book_id` int(11) NOT NULL,
  `cab_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `source` varchar(100) NOT NULL,
  `dest` varchar(100) NOT NULL,
  `bookingDate` date NOT NULL,
  `bookingTime` varchar(50) NOT NULL,
  `tot` int(11) NOT NULL,
  `pay_type` varchar(100) NOT NULL,
  `pay_method` varchar(100) NOT NULL,
  `pay_status` varchar(100) NOT NULL DEFAULT 'pending',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'requested',
  `tot_hr` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_tb`
--

INSERT INTO `booking_tb` (`book_id`, `cab_id`, `user_id`, `source`, `dest`, `bookingDate`, `bookingTime`, `tot`, `pay_type`, `pay_method`, `pay_status`, `date`, `status`, `tot_hr`) VALUES
(1, 2, 6, 'Malappuram', 'Calicut', '2023-03-05', '10.00 AM', 2001, '', '', 'pending', '2023-07-09', 'accepted', 3),
(2, 2, 7, 'Perinthalmanna', 'Palakkad', '2023-08-14', '2.00 PM', 2001, '', '', 'pending', '2023-07-12', 'requested', 0),
(3, 2, 6, 'Calicut', 'Nilambur', '2023-05-03', '8.00 AM', 2001, 'COD', 'Cash', 'paid', '2023-07-19', 'completed', 0),
(4, 2, 7, 'manjeri', 'calicut', '2023-05-06', '10.AM', 2001, 'Online', 'Other', 'pending', '2023-07-21', 'completed', 0),
(5, 3, 6, 'Palakkad', 'Malappuram', '2023-05-03', '8.00AM', 2500, '', '', 'pending', '2023-07-22', 'requested', 0),
(6, 2, 6, 'Kondotty', 'Palakkad', '0203-05-02', '7.00 AM', 2001, '', '', 'pending', '2023-07-22', 'requested', 0),
(7, 2, 7, 'malappuram ', 'palakkad ', '2023-08-31', '8:00 AM', 2001, '', '', 'paid', '2023-07-28', 'completed', 0),
(8, 4, 7, 'Perinthalmanna ', 'Kannur', '2023-08-05', '9:00 AM', 1201, '', '', 'pending', '2023-07-28', 'requested', 0),
(9, 2, 7, 'manjeri', 'malappuram', '2023-08-09', '4:30 PM', 2001, '', '', 'pending', '2023-08-05', 'requested', 0),
(10, 2, 7, '', '', '0000-00-00', '', 2001, '', '', 'pending', '2023-08-05', 'requested', 0),
(11, 2, 7, '', '', '0000-00-00', '', 2001, '', '', 'pending', '2023-08-05', 'requested', 0),
(12, 8, 7, 'Trissur', 'Calicut', '2023-08-14', '7:00 PM', 700, '', '', 'pending', '2023-08-06', 'requested', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cabs_tb`
--

CREATE TABLE `cabs_tb` (
  `cab_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rate` int(11) NOT NULL,
  `size` varchar(50) NOT NULL,
  `person` int(11) NOT NULL,
  `des` varchar(300) NOT NULL,
  `image` text NOT NULL,
  `pro_id` int(11) NOT NULL,
  `availability` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cabs_tb`
--

INSERT INTO `cabs_tb` (`cab_id`, `type`, `name`, `rate`, `size`, `person`, `des`, `image`, `pro_id`, `availability`) VALUES
(2, 'Car', 'ABC', 2001, '', 5, 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur,', 'b.png.jpeg', 1, 1),
(3, 'Car', 'xyz', 2500, 'NA', 5, 'ycxh  uvh ychh y nb h b', 'images (10).jpg', 3, 1),
(4, 'Auto', 'gztxgcy ', 1201, 'NA', 4, 'ycfyvu u  ycj  hcy ', 'images (63).jpg', 1, 1),
(5, 'Goods', 'y  h  jjvu  hc', 1700, 'S', 0, 'uc6ch g ych tch g g ', 'IMG-20230701-WA0020.jpg', 1, 1),
(6, 'Goods', 'cufucu', 800, 'S', 0, 'fuducn fj hyc h  hdhdyxu udyx', 'IMG-20230701-WA0020.jpg', 3, 1),
(8, 'Car', 'kl651126', 700, 'NA', 5, 'vyaby  vyaby h ', 'images (10).jpg', 1, 1),
(9, 'Car', 'kl764545', 1200, 'NA', 9, 'jfjvy f g  this is a cab by  gh86IN hbj ', 'images (9).jpg', 2, 1),
(10, 'Traveller', 'vamii', 3500, '', 12, 'sakcnacm cacj adcjmac j c', 'images (10).jpg', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `feedback_tb`
--

CREATE TABLE `feedback_tb` (
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service` varchar(100) NOT NULL,
  `star` int(11) NOT NULL,
  `feedback` varchar(200) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback_tb`
--

INSERT INTO `feedback_tb` (`feedback_id`, `user_id`, `service`, `star`, `feedback`, `date`) VALUES
(1, 6, 'Accessories', 2, 'Good Service💫', '2023-07-23'),
(2, 6, 'Rental', 2, 'Good service and helpful', '2023-07-23'),
(3, 7, 'Workshop', 2, 'Good service and helpful', '2023-07-23'),
(4, 7, 'Cab', 4, 'Bad service bcdjkcn dcjkdc djc dkc  jdwcwd cdcwc ', '2023-07-23'),
(5, 6, 'Rental', 2, 'Happy Service ..thank you', '2023-07-23'),
(6, 7, 'Workshop', 2, 'Good service ...thank you🙏', '2023-07-23'),
(7, 6, 'Workshop', 4, 'Liked the services', '2023-07-23'),
(8, 7, 'Cab', 3, 'Good service', '2023-08-03'),
(9, 7, 'Cab', 4, 'Helpful', '2023-08-03'),
(10, 7, 'Cab', 3, 'good', '2023-08-03'),
(11, 7, 'Cab', 1, 'bad', '2023-08-03'),
(12, 7, 'Rental', 2, 'helping', '2023-08-03');

-- --------------------------------------------------------

--
-- Table structure for table `login_tb`
--

CREATE TABLE `login_tb` (
  `log_id` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `type` varchar(50) NOT NULL,
  `approval_status` varchar(50) NOT NULL DEFAULT 'requested'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login_tb`
--

INSERT INTO `login_tb` (`log_id`, `email`, `password`, `type`, `approval_status`) VALUES
(1, 'malik@gmail.com', '123123', 'provider', 'approved'),
(2, 'pqr@gmail.com', '123123', 'provider', 'approved'),
(3, 'john@gmail.com', '123123', 'provider', 'requested'),
(4, 'mehra@gmail.com', '123123', 'provider', 'approved'),
(5, 'jo@gmail.com', '123123', 'provider', 'rejected'),
(6, 'test@gmail.com', '123123', 'user', 'approved'),
(7, 'abc@gmail.com', '123123', 'user', 'approved'),
(8, 'twizz@gmail.com', '123123', 'provider', 'approved'),
(9, 'promo11@gmail.com', '123123', 'provider', 'approved'),
(10, 'mahi@gmail.com', '123123', 'user', 'approved'),
(11, 'hasba123@gmail.com', '123123', 'user', 'requested');

-- --------------------------------------------------------

--
-- Table structure for table `offer_tb`
--

CREATE TABLE `offer_tb` (
  `offer_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `offer` longblob NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offer_tb`
--

INSERT INTO `offer_tb` (`offer_id`, `pro_id`, `offer`, `start_date`, `end_date`) VALUES
(1, 1, 0x6361725f616363322e6a7067, '2023-07-03', '2023-07-15'),
(2, 2, 0x6c75785f6361725f72656e74616c2e6a7067, '2023-08-01', '2023-08-15'),
(3, 1, 0x6361725f72656e74616c732e6a7067, '2023-08-03', '2023-08-13'),
(4, 9, 0x74756d626c725f70387962693342643563317661746c69696f355f3235302e6a7067, '2023-08-10', '2023-08-17'),
(5, 9, 0x62616c6c6f6f6e5f666c696768745f706c616e745f39313638315f3235363078313630302d383030783630302e6a7067, '2023-08-05', '2023-08-14'),
(6, 9, 0x61663831383338396436616463313562646366353838386434326262346233632e6a7067, '2023-07-31', '2023-08-10'),
(7, 9, 0x494d472d32303233303732382d5741303037382e6a7067, '2023-08-16', '2023-08-30'),
(8, 9, 0x494d472d32303233303732362d5741303038392e6a7067, '2023-08-01', '2023-08-12'),
(9, 9, 0x46425f494d475f313439363436323930303933342e6a7067, '2023-08-17', '2023-08-24'),
(12, 9, 0x494d472d32303233303732382d5741303037392e6a7067, '2023-07-31', '2023-08-01'),
(13, 9, 0x494d472d32303233303732382d5741303037382e6a7067, '2023-07-31', '2023-08-04'),
(14, 9, 0x61663831383338396436616463313562646366353838386434326262346233632e6a7067, '2023-07-31', '2023-07-31'),
(15, 9, 0x646f776e6c6f6164202833292e6a7067, '2023-07-31', '2023-08-03'),
(16, 9, 0x696d6167657320283130292e6a7067, '2023-08-04', '2023-08-10');

-- --------------------------------------------------------

--
-- Table structure for table `register_tb`
--

CREATE TABLE `register_tb` (
  `reg_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `place` varchar(100) NOT NULL,
  `lati` varchar(11) NOT NULL,
  `longi` varchar(11) NOT NULL,
  `location` varchar(200) NOT NULL,
  `log_id` int(11) NOT NULL,
  `profile_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `register_tb`
--

INSERT INTO `register_tb` (`reg_id`, `username`, `phone`, `place`, `lati`, `longi`, `location`, `log_id`, `profile_image`) VALUES
(1, 'Malik Raheem', 9845674411, 'Manjeri', '11.120100', '76.119698', 'Manjeri', 1, 'images (63).jpg'),
(2, 'pqr123', 8086878766, 'kozhikode', '11.258753', '75.780411', 'kozhikode', 2, 'images (63).jpg'),
(3, 'john123', 9087871006, 'Perinthalmanna', '10.976036', '76.225441', 'Perinthalmanna', 3, 'images (63).jpg'),
(4, 'mehra123', 8076543211, 'Malappuram', '11.031280', '76.110123', 'Malappuram', 4, 'images (63).jpg'),
(5, 'jo123', 8956210101, 'Ramapuram', '09.800515', '76.661484', 'Ramapuram', 5, 'images (63).jpg'),
(6, 'Mickel', 9078908777, '', '0', '0', '', 6, 'images (63).jpg'),
(7, 'Sanjay', 9087889970, '', '0', '0', '', 7, 'FB_IMG_1480947175572.jpg'),
(8, 'twizz', 9087675522, 'Amminikkad', '10.9698484', '76.2683681', 'Amminikkad,X799+M77,,', 8, 'images (63).jpg'),
(9, 'promo time nnz', 8987676560, 'Amminikkad', '10.9698484', '76.2683681', 'Amminikkad,X799+M77,,', 9, 'images (69).jpg'),
(10, 'mahi', 8909897878, '', '', '', '', 10, 'download (3).jpg'),
(11, 'Hasba', 8565232511, '', '', '', '', 11, '');

-- --------------------------------------------------------

--
-- Table structure for table `rentals_tb`
--

CREATE TABLE `rentals_tb` (
  `rent_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `des` varchar(300) NOT NULL,
  `rent` int(11) NOT NULL,
  `fuel` varchar(100) NOT NULL,
  `image` longblob NOT NULL,
  `pro_id` int(11) NOT NULL,
  `availability` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rentals_tb`
--

INSERT INTO `rentals_tb` (`rent_id`, `type`, `name`, `des`, `rent`, `fuel`, `image`, `pro_id`, `availability`) VALUES
(1, 'Bike', 'sdfsvlk', 'dfs slkfsdk fs sdkdflsf  slkfds d lfl', 1000, 'Petrol', 0x622e706e672e6a706567, 1, 1),
(2, 'Car', 'yccj j', 'hxydj uch h y j ych h t g ', 2001, 'Deisel', 0x696d6167657320283130292e6a7067, 2, 1),
(3, 'Luxury Car', 'cycuvu', 'h cy j ', 5000, 'Petrol', 0x494d472d32303233303730312d5741303032302e6a7067, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rental_booking_tb`
--

CREATE TABLE `rental_booking_tb` (
  `rent_book_id` int(11) NOT NULL,
  `rental_id` int(11) NOT NULL,
  `days` int(11) NOT NULL,
  `pick_up_date` date NOT NULL,
  `pick_up_time` varchar(50) NOT NULL,
  `pay` int(11) NOT NULL,
  `pay_type` varchar(100) NOT NULL,
  `pay_method` varchar(100) NOT NULL,
  `pay_status` varchar(100) NOT NULL DEFAULT 'pending',
  `advance_amt` int(11) NOT NULL,
  `veh_receive_status` varchar(100) NOT NULL DEFAULT 'pending',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'requested',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rental_booking_tb`
--

INSERT INTO `rental_booking_tb` (`rent_book_id`, `rental_id`, `days`, `pick_up_date`, `pick_up_time`, `pay`, `pay_type`, `pay_method`, `pay_status`, `advance_amt`, `veh_receive_status`, `date`, `status`, `user_id`) VALUES
(1, 2, 3, '2023-07-08', '9.00 AM', 6003, '', '', 'pending', 0, 'pending', '2023-07-13', 'completed', 6),
(2, 2, 2, '2023-05-06', '8.00AM', 4002, '', '', 'pending', 0, 'pending', '2023-07-13', 'requested', 7),
(3, 1, 2, '2023-07-12', '7.00 AM', 2000, 'COD', 'Cash', 'paid', 600, 'received', '2023-07-13', 'accepted', 7),
(4, 3, 2, '2023-06-03', '10.00 AM', 10000, '', '', 'pending', 0, 'pending', '2023-07-13', 'rejected', 6),
(5, 1, 3, '2023-05-02', '6.00AM', 3000, '', '', 'pending', 0, 'pending', '2023-07-22', 'requested', 6),
(6, 2, 5, '2023-06-04', '10.00 AM', 10005, '', '', 'pending', 0, 'pending', '2023-07-22', 'accepted', 6),
(7, 3, 3, '2023-04-06', '9.00AM', 15000, 'COD', 'Cash', 'paid', 0, 'pending', '2023-07-22', 'completed', 6),
(8, 3, 3, '2023-08-17', '7:00 AM', 15000, '', '', 'pending', 0, 'pending', '2023-07-28', 'requested', 7);

-- --------------------------------------------------------

--
-- Table structure for table `workshop_booking_tb`
--

CREATE TABLE `workshop_booking_tb` (
  `work_book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `work_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `booking_time` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'requested',
  `pay_type` varchar(50) NOT NULL,
  `pay_method` varchar(50) NOT NULL,
  `advance_amt` int(11) NOT NULL,
  `pay_status` varchar(50) NOT NULL DEFAULT 'pending',
  `date` date NOT NULL,
  `service_completion` varchar(50) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `workshop_booking_tb`
--

INSERT INTO `workshop_booking_tb` (`work_book_id`, `user_id`, `work_id`, `booking_date`, `booking_time`, `status`, `pay_type`, `pay_method`, `advance_amt`, `pay_status`, `date`, `service_completion`) VALUES
(1, 6, 5, '2023-08-09', '8.00 AM', 'requested', '', '', 0, 'pending', '2023-07-23', 'pending'),
(2, 7, 4, '2023-07-25', '4.00PM', 'requested', '', '', 0, 'pending', '2023-07-23', 'pending'),
(3, 7, 8, '2023-08-10', '10:00 AM', 'accepted', 'Online', 'Google Pay', 900, 'paid', '2023-07-28', 'finished');

-- --------------------------------------------------------

--
-- Table structure for table `workshop_tb`
--

CREATE TABLE `workshop_tb` (
  `work_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `serviceName` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `avgTime` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `workshop_tb`
--

INSERT INTO `workshop_tb` (`work_id`, `pro_id`, `serviceName`, `amount`, `avgTime`, `type`) VALUES
(2, 1, 'Basic Services', 5000, '2 hr', 'car'),
(3, 1, 'Mid Range Services', 10000, '3 hr', 'car'),
(4, 1, 'Major Services', 12000, '5 hr', 'car'),
(5, 1, 'Basic Services', 3000, '1.5 hr', 'car'),
(6, 1, 'Mid Range Services', 7000, '2hr', 'car'),
(7, 1, 'Basic Services', 2000, '2hr', 'bike'),
(8, 1, 'Mid Range Services', 3000, '1.5 hr', 'bike');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accessories_tb`
--
ALTER TABLE `accessories_tb`
  ADD PRIMARY KEY (`acc_id`);

--
-- Indexes for table `acc_booking_tb`
--
ALTER TABLE `acc_booking_tb`
  ADD PRIMARY KEY (`acc_book_id`);

--
-- Indexes for table `admin_tb`
--
ALTER TABLE `admin_tb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_tb`
--
ALTER TABLE `booking_tb`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `cabs_tb`
--
ALTER TABLE `cabs_tb`
  ADD PRIMARY KEY (`cab_id`);

--
-- Indexes for table `feedback_tb`
--
ALTER TABLE `feedback_tb`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `login_tb`
--
ALTER TABLE `login_tb`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `offer_tb`
--
ALTER TABLE `offer_tb`
  ADD PRIMARY KEY (`offer_id`);

--
-- Indexes for table `register_tb`
--
ALTER TABLE `register_tb`
  ADD PRIMARY KEY (`reg_id`);

--
-- Indexes for table `rentals_tb`
--
ALTER TABLE `rentals_tb`
  ADD PRIMARY KEY (`rent_id`);

--
-- Indexes for table `rental_booking_tb`
--
ALTER TABLE `rental_booking_tb`
  ADD PRIMARY KEY (`rent_book_id`);

--
-- Indexes for table `workshop_booking_tb`
--
ALTER TABLE `workshop_booking_tb`
  ADD PRIMARY KEY (`work_book_id`);

--
-- Indexes for table `workshop_tb`
--
ALTER TABLE `workshop_tb`
  ADD PRIMARY KEY (`work_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accessories_tb`
--
ALTER TABLE `accessories_tb`
  MODIFY `acc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `acc_booking_tb`
--
ALTER TABLE `acc_booking_tb`
  MODIFY `acc_book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admin_tb`
--
ALTER TABLE `admin_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking_tb`
--
ALTER TABLE `booking_tb`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cabs_tb`
--
ALTER TABLE `cabs_tb`
  MODIFY `cab_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `feedback_tb`
--
ALTER TABLE `feedback_tb`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `login_tb`
--
ALTER TABLE `login_tb`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `offer_tb`
--
ALTER TABLE `offer_tb`
  MODIFY `offer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `register_tb`
--
ALTER TABLE `register_tb`
  MODIFY `reg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rentals_tb`
--
ALTER TABLE `rentals_tb`
  MODIFY `rent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rental_booking_tb`
--
ALTER TABLE `rental_booking_tb`
  MODIFY `rent_book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `workshop_booking_tb`
--
ALTER TABLE `workshop_booking_tb`
  MODIFY `work_book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `workshop_tb`
--
ALTER TABLE `workshop_tb`
  MODIFY `work_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
