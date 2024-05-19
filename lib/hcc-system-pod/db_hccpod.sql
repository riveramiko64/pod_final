-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2024 at 06:25 PM
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
-- Database: `db_hccpod`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_adminlogin`
--

CREATE TABLE `tbl_adminlogin` (
  `adminid` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `reserve` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_incidentdata`
--

CREATE TABLE `tbl_incidentdata` (
  `incident_id` int(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `course_year_section` varchar(255) NOT NULL,
  `home_address` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `identity` varchar(255) NOT NULL,
  `incident_date` varchar(255) NOT NULL,
  `incident_time` varchar(255) NOT NULL,
  `incident_location` varchar(255) NOT NULL,
  `incident_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_incidentdata`
--

INSERT INTO `tbl_incidentdata` (`incident_id`, `fullname`, `course_year_section`, `home_address`, `phone_number`, `identity`, `incident_date`, `incident_time`, `incident_location`, `incident_description`) VALUES
(11, 'Reniel Deang', 'BSCS 3A', 'San Isidro Sta Ana Pampanga', '09555328922', 'student', '2024-05-17T00:00:00.000', '12:14 AM', 'Sa school', 'Nadapaba po ako');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_adminlogin`
--
ALTER TABLE `tbl_adminlogin`
  ADD PRIMARY KEY (`adminid`);

--
-- Indexes for table `tbl_incidentdata`
--
ALTER TABLE `tbl_incidentdata`
  ADD PRIMARY KEY (`incident_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_adminlogin`
--
ALTER TABLE `tbl_adminlogin`
  MODIFY `adminid` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_incidentdata`
--
ALTER TABLE `tbl_incidentdata`
  MODIFY `incident_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
