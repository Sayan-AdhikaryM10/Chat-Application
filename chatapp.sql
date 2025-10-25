-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2025 at 01:02 PM
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
-- Database: `chatapp2`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(255) NOT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `fname`, `lname`, `email`, `message`) VALUES
(1, 'Sayan', 'Adhikary', 'sayanadhikary831@gmail.com', 'nice'),
(2, 'Biswajit', 'Adhikary', 'Biswajit@gmail.com', 'nice app'),
(3, 'Sayan', 'Adhikary', 'sayanadhikary831@gmail.com', 'hi');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(11) NOT NULL,
  `incoming_msg_id` int(255) NOT NULL,
  `outgoing_msg_id` int(255) NOT NULL,
  `msg` varchar(1000) NOT NULL,
  `SendImg` varchar(255) DEFAULT NULL,
  `SendVideo` varchar(255) DEFAULT NULL,
  `Senddocument` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`msg_id`, `incoming_msg_id`, `outgoing_msg_id`, `msg`, `SendImg`, `SendVideo`, `Senddocument`) VALUES
(1, 682979113, 645725736, '', '1742483997_Screenshot (1).png', NULL, NULL),
(2, 682979113, 645725736, '', NULL, NULL, '1742484013_Modual1.pdf'),
(3, 645725736, 682979113, '', '1742484769_cd1c61ed-87f8-47a4-8048-6459d69e328d.jpg', NULL, NULL),
(4, 682979113, 645725736, '', NULL, '1742485019_Ezio Auditore was Absolute Badass!!   #ezio #ezioauditore #assassinscreed #assassin #assassinscreed3 #ac #gaming.mp4', NULL),
(5, 682979113, 645725736, '', NULL, '1742485065_Screen Recording 2024-08-21 114418.mp4', NULL),
(6, 1761145625, 1761145838, 'hi', NULL, NULL, NULL),
(7, 1761145625, 1761145838, '', NULL, '1761174515_Ezio Auditore was Absolute Badass!!   #ezio #ezioauditore #assassinscreed #assassin #assassinscreed3 #ac #gaming.mp4', NULL),
(8, 1761145625, 1761145838, '', '1761176178_Screenshot 2025-10-23 045941.png', NULL, NULL),
(9, 1761145625, 1761145838, '', '1761176188_amazon-clone-output.png', NULL, NULL),
(10, 1761145838, 1761145625, '', NULL, '1761179117_Screen Recording 2024-08-21 114021.mp4', NULL),
(11, 1761145838, 1761145625, 'hi', NULL, NULL, NULL),
(12, 1761145838, 1761145625, 'hi', NULL, NULL, NULL),
(13, 1761145838, 1761145625, '', '1761179268_Screenshot 2025-10-23 052323.png', NULL, NULL),
(14, 1761145838, 1761145625, '', NULL, NULL, '1761179290_Arnab_resume.pdf'),
(15, 1761145838, 1761145625, 'hi', NULL, NULL, NULL),
(16, 1761145838, 1761145625, 'hi', NULL, NULL, NULL),
(17, 1761145838, 1761145625, 'hi', NULL, NULL, NULL),
(18, 1761145838, 1761145625, 'hi', NULL, NULL, NULL),
(19, 1761145838, 1761145625, 'hi', NULL, NULL, NULL),
(20, 1761145838, 1761145625, 'hi', NULL, NULL, NULL),
(21, 1761145838, 1761145625, 'hi', NULL, NULL, NULL),
(22, 1761145838, 1761145625, 'hi', NULL, NULL, NULL),
(23, 1761145838, 1761145625, 'hi', NULL, NULL, NULL),
(24, 1761145838, 1761145625, 'hi', NULL, NULL, NULL),
(25, 805801499, 1761145625, 'hi', NULL, NULL, NULL),
(26, 805801499, 1761145625, 'hi', NULL, NULL, NULL),
(27, 1761145625, 805801499, 'hi', NULL, NULL, NULL),
(28, 1761145625, 805801499, 'hi', NULL, NULL, NULL),
(29, 805801499, 1761145625, 'hi', NULL, NULL, NULL),
(30, 1761145838, 1761145625, 'hi', NULL, NULL, NULL),
(31, 1761145838, 1761145625, '', '1761376377_Screenshot 2025-10-23 232621.png', NULL, NULL),
(32, 1761145838, 1761145625, 'hi', NULL, NULL, NULL),
(33, 1761145838, 1761145625, '', NULL, NULL, '1761376630_Arnab_resume.pdf'),
(34, 1761145838, 1761145625, '', NULL, '1761376640_Ezio Auditore was Absolute Badass!!   #ezio #ezioauditore #assassinscreed #assassin #assassinscreed3 #ac #gaming.mp4', NULL),
(35, 1761145838, 1761145625, '', '1761376650_Screenshot 2025-10-23 052011.png', NULL, NULL),
(36, 751549886, 284770198, 'hi', NULL, NULL, NULL),
(37, 284770198, 751549886, '', '1761388358_cd1c61ed-87f8-47a4-8048-6459d69e328d.jpg', NULL, NULL),
(38, 751549886, 284770198, '', '1761389209_cd1c61ed-87f8-47a4-8048-6459d69e328d.jpg', NULL, NULL),
(39, 751549886, 284770198, 'hi', NULL, NULL, NULL),
(40, 284770198, 751549886, 'hello', NULL, NULL, NULL),
(41, 751549886, 284770198, 'hi', NULL, NULL, NULL),
(42, 284770198, 751549886, 'how', NULL, NULL, NULL),
(43, 751549886, 284770198, '', NULL, NULL, '1761389705_5.1.pdf'),
(44, 751549886, 284770198, '', NULL, '1761389716_Ezio Auditore was Absolute Badass!!   #ezio #ezioauditore #assassinscreed #assassin #assassinscreed3 #ac #gaming.mp4', NULL),
(45, 751549886, 284770198, '', '1761389726_download.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `message_requests`
--

CREATE TABLE `message_requests` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message_requests`
--

INSERT INTO `message_requests` (`id`, `sender_id`, `receiver_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 682979113, 645725736, 'accepted', '2025-03-20 15:19:05', '2025-03-20 15:19:14'),
(2, 1250632241, 682979113, 'accepted', '2025-03-20 15:38:55', '2025-03-20 15:40:13'),
(3, 1250632241, 645725736, 'pending', '2025-03-20 15:38:56', '2025-03-20 15:38:56'),
(4, 1761145625, 1761145838, 'accepted', '2025-10-22 23:05:38', '2025-10-22 23:07:22'),
(5, 1761145625, 1250632241, 'pending', '2025-10-22 23:05:39', '2025-10-22 23:05:39'),
(6, 1761145625, 682979113, 'pending', '2025-10-22 23:05:41', '2025-10-22 23:05:41'),
(7, 1761145625, 645725736, 'pending', '2025-10-22 23:05:45', '2025-10-22 23:05:45'),
(8, 1761145838, 1250632241, 'pending', '2025-10-23 00:16:34', '2025-10-23 00:16:34'),
(9, 1761145838, 682979113, 'pending', '2025-10-23 00:16:37', '2025-10-23 00:16:37'),
(10, 1761145838, 645725736, 'pending', '2025-10-23 00:16:38', '2025-10-23 00:16:38'),
(11, 805801499, 1761145838, 'pending', '2025-10-23 17:46:34', '2025-10-23 17:46:34'),
(13, 805801499, 1761145625, 'accepted', '2025-10-23 17:46:36', '2025-10-23 17:52:32'),
(15, 805801499, 1250632241, 'pending', '2025-10-23 17:46:38', '2025-10-23 17:46:38'),
(16, 805801499, 682979113, 'pending', '2025-10-23 17:46:40', '2025-10-23 17:46:40'),
(18, 805801499, 645725736, 'pending', '2025-10-23 18:02:10', '2025-10-23 18:02:10'),
(19, 430097950, 805801499, 'pending', '2025-10-25 07:37:22', '2025-10-25 07:37:22'),
(20, 430097950, 1761145838, 'pending', '2025-10-25 07:37:24', '2025-10-25 07:37:24'),
(21, 430097950, 1761145625, 'pending', '2025-10-25 07:37:24', '2025-10-25 07:37:24'),
(22, 430097950, 1250632241, 'pending', '2025-10-25 07:37:26', '2025-10-25 07:37:26'),
(23, 430097950, 682979113, 'pending', '2025-10-25 07:37:34', '2025-10-25 07:37:34'),
(24, 430097950, 645725736, 'pending', '2025-10-25 07:37:34', '2025-10-25 07:37:34'),
(25, 284770198, 430097950, 'pending', '2025-10-25 10:24:08', '2025-10-25 10:24:08'),
(26, 284770198, 805801499, 'pending', '2025-10-25 10:24:09', '2025-10-25 10:24:09'),
(27, 284770198, 1761145625, 'pending', '2025-10-25 10:24:11', '2025-10-25 10:24:11'),
(28, 284770198, 1761145838, 'pending', '2025-10-25 10:24:12', '2025-10-25 10:24:12'),
(29, 284770198, 1250632241, 'pending', '2025-10-25 10:24:15', '2025-10-25 10:24:15'),
(30, 284770198, 682979113, 'pending', '2025-10-25 10:24:19', '2025-10-25 10:24:19'),
(31, 284770198, 645725736, 'pending', '2025-10-25 10:24:20', '2025-10-25 10:24:20'),
(32, 751549886, 284770198, 'accepted', '2025-10-25 10:27:36', '2025-10-25 10:27:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `unique_id` int(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `unique_id`, `fname`, `lname`, `email`, `password`, `img`, `status`) VALUES
(1, 645725736, 'Sayan', 'Adhikary', 'sayan@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '1742483908Screenshot 2025-03-18 134018.png', 'Offline now'),
(2, 682979113, 'leon', 'joy', 'joy@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '1742483943f76e1869-67ef-46d1-b3d6-96324103d2ee.jpg', 'Active now'),
(3, 1250632241, 'ram', 'shaw', 'shaw@gmail.com', 'd2b15c75c0c389b49c2efbea79cdc946', '1742485131Screenshot 2025-03-18 133838.png', 'Active now'),
(4, 1761145625, 'admin', 'admin', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '17611455229272.png', 'Offline now'),
(5, 1761145838, 'gray', 'joy', 'gray@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '17611455463452.jpg', 'Active now'),
(6, 805801499, 'admin2', 'admin2', 'admin2@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '1761241585Screenshot 2025-10-23 055537.png', 'Active now'),
(7, 430097950, 'admin3', 'admin3', 'admin3@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '1761377839amazon-clone-output.png', 'Active now'),
(8, 284770198, 'admin4', 'admin4', 'admin4@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '1761387837download.jpg', 'Offline now'),
(9, 751549886, 'admin5', 'admin5', 'admin5@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '1761388053download (1).jpg', 'Active now');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `message_requests`
--
ALTER TABLE `message_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sender_id` (`sender_id`,`receiver_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `message_requests`
--
ALTER TABLE `message_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
