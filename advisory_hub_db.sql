-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2024 at 02:15 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `advisory_hub_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `f_a_qs`
--

CREATE TABLE `f_a_qs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `f_a_qs`
--

INSERT INTO `f_a_qs` (`id`, `title`, `description`, `created_at`) VALUES
(1, 'Car', 'Alpha Testing is done within the organization, while Beta Testing is done in the user\'s environment. During Alpha Testing only functionality and usability are tested, while during Beta Testing usability, functionality, security, and reliability are tested to the same depth', '2024-06-22 10:51:20'),
(2, 'Bike', 'Eligibility Criteria. An excellent opportunity for over 800,000 students across the province to obtain their own transport. Must be over 18 years of age. Must ...', '2024-06-22 11:02:43'),
(3, 'Plane', 'Pilot Brodie Torrance saves passengers from a lightning strike by making a risky landing on a war-torn island -- only to find that surviving the landing was just the beginning. When dangerous rebels take most of the passengers hostage, the only person Torrance can count on for help is Louis Gaspare, an accused murderer who was being transported by the FBI.', '2024-06-22 11:03:04');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`, `image`, `category`, `created_at`) VALUES
(1, 'Today\'s car', '', 'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGNhcnxlbnwwfHwwfHx8MA%3D%3D', 'Case Studies', '2024-06-22 11:33:59'),
(2, 'Sports Car', '', 'https://t3.ftcdn.net/jpg/01/23/52/24/360_F_123522471_XZe5ebqil1DFJRgOUJ6taDP4DnmHjtL7.jpg', 'Case Studies', '2024-06-22 11:54:11'),
(3, 'Immigration Consulting Germany', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAvrD8_s-u5ohTkC_sZG0ofaLEwVsVTw2yGw&s', 'Case Studies', '2024-06-22 11:55:05'),
(4, 'Italy Immigration', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH4pT_qh0uj2EThyVJHGRBbrItMAtr1TJDyA&s', 'Case Studies', '2024-06-22 11:55:36'),
(5, 'Secrets of Visa', '', 'https://assets.weforum.org/organization/image/3aFMaJ3kyTD0580Nggta402aOQDX-KxPmM_GWtl2YNU.jpeg', 'Case Studies', '2024-06-22 11:56:18'),
(6, 'Future of AI', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRAjqOZkMFX0uGu6zFJHyeG65SJ8Sd8_8AAg&s', 'Insights', '2024-06-22 11:57:01'),
(7, 'Chat GPT Beta version', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAqQG2jAYDCZahQm7xrkB8TuWqHwXsfuo6fQ&s', 'Insights', '2024-06-22 11:57:42'),
(8, 'Nvidia Sales Increase', '', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScUKG07-43UYlwqFzzir3s9Nt_i-uzoveQMw&s', 'Insights', '2024-06-22 11:58:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roles` varchar(255) NOT NULL DEFAULT 'user',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `roles`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2a$10$SOkL78ugK8tZdZBdBn25rOpajQ2c3FwFilIxaQMp.k0Atw.91EIR2', 'user', '2024-06-22 09:44:53', '2024-06-22 09:44:53'),
(2, 'khan', '$2a$10$VO.6XtvPym/Q4mj0DeHHM.xagKfE1LbmV8QWgEZ6J9BoE.r9WdEeO', 'user', '2024-06-22 09:45:46', '2024-06-22 09:45:46'),
(3, 'ayesha', '$2a$10$XbIL6OqHyqpn207zyezODu.ST8x8B4wM4AK3F2FU4SvbkHWriM2dS', 'admin', '2024-06-22 09:46:30', '2024-06-22 09:46:30'),
(4, 'jason', '$2a$10$n/MwaqVKF3rcOSdsMgmD8eP0cN9uR1Vid7gw12pKsuNTZZkjnN9p.', 'admin', '2024-06-22 12:07:40', '2024-06-22 12:07:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `f_a_qs`
--
ALTER TABLE `f_a_qs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `f_a_qs`
--
ALTER TABLE `f_a_qs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
