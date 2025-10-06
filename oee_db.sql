-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 06, 2025 at 05:26 PM
-- Server version: 8.0.30
-- PHP Version: 8.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oee_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `oee_downtime_log`
--

CREATE TABLE `oee_downtime_log` (
  `id` int NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `description` text,
  `duration` int DEFAULT NULL,
  `impact` varchar(30) DEFAULT NULL,
  `remark` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `oee_downtime_log`
--

INSERT INTO `oee_downtime_log` (`id`, `category`, `description`, `duration`, `impact`, `remark`, `created_at`) VALUES
(1, 'Mechanical', 'Nozzle tersumbat saat proses pengecatan', 300, 'Medium', 'Downtime minor saat pengecatan tangki', '2025-10-06 09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `oee_loss_log`
--

CREATE TABLE `oee_loss_log` (
  `id` int NOT NULL,
  `loss_category` varchar(50) DEFAULT NULL,
  `loss_type` varchar(50) DEFAULT NULL,
  `loss_duration` int DEFAULT NULL,
  `remark` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `oee_loss_log`
--

INSERT INTO `oee_loss_log` (`id`, `loss_category`, `loss_type`, `loss_duration`, `remark`, `created_at`) VALUES
(1, 'Unplanned Stop', 'Minor Stoppage', 290, 'Downtime kecil akibat penyumbatan nozzle cat', '2025-10-06 09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `oee_machine_wo`
--

CREATE TABLE `oee_machine_wo` (
  `id` int NOT NULL,
  `machine_group` varchar(50) DEFAULT NULL,
  `machine_no` varchar(50) DEFAULT NULL,
  `machine_name` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `shift` varchar(10) DEFAULT NULL,
  `operator_name` varchar(100) DEFAULT NULL,
  `operator_id` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `loading_time` varchar(20) DEFAULT NULL,
  `stop_time` varchar(20) DEFAULT NULL,
  `wo_no` varchar(50) DEFAULT NULL,
  `item_no` varchar(50) DEFAULT NULL,
  `product_desc` varchar(255) DEFAULT NULL,
  `order_qty` int DEFAULT NULL,
  `actual_qty` int DEFAULT NULL,
  `cycle_time` decimal(10,2) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `active_cavity` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `order_status` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `oee_machine_wo`
--

INSERT INTO `oee_machine_wo` (`id`, `machine_group`, `machine_no`, `machine_name`, `department`, `shift`, `operator_name`, `operator_id`, `status`, `loading_time`, `stop_time`, `wo_no`, `item_no`, `product_desc`, `order_qty`, `actual_qty`, `cycle_time`, `due_date`, `active_cavity`, `start_date`, `end_date`, `order_status`, `created_at`) VALUES
(1, 'Painting Steel 2B', 'PSUV-01', 'Painting Steel Ultra Violet', 'Production', '1', 'Andi', 'OP-AHM01', 'Running', '2025-10-06 08:00:00', '2025-10-06 16:00:00', 'WO-AHM-001', 'TANK-SPRT01', 'Tangki Motor Tipe Sport', 1000, 850, 26.00, '2025-10-10', 1, '2025-10-06', '2025-10-06', 'In Progress', '2025-10-06 08:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `oee_production_log`
--

CREATE TABLE `oee_production_log` (
  `id` int NOT NULL,
  `total_output` int NOT NULL,
  `good_units` int NOT NULL,
  `defective_units` int DEFAULT '0',
  `defect_type` varchar(50) DEFAULT NULL,
  `startup_rejects` int DEFAULT '0',
  `shift` varchar(20) DEFAULT NULL,
  `total_reject` int DEFAULT '0',
  `yield_percent` decimal(5,2) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `oee_production_log`
--

INSERT INTO `oee_production_log` (`id`, `total_output`, `good_units`, `defective_units`, `defect_type`, `startup_rejects`, `shift`, `total_reject`, `yield_percent`, `created_at`) VALUES
(1, 963, 931, 32, 'Cat Tidak Rata', 0, '1', 32, 96.68, '2025-10-06 08:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `oee_summary`
--

CREATE TABLE `oee_summary` (
  `id` int NOT NULL,
  `availability` decimal(5,2) DEFAULT NULL,
  `performance` decimal(5,2) DEFAULT NULL,
  `quality` decimal(5,2) DEFAULT NULL,
  `oee` decimal(5,2) DEFAULT NULL,
  `shift` varchar(20) DEFAULT NULL,
  `machine_no` varchar(20) DEFAULT NULL,
  `wo_no` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oee_supporting_log`
--

CREATE TABLE `oee_supporting_log` (
  `id` int NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `technician_name` varchar(100) DEFAULT NULL,
  `failure_type` enum('Mechanical','Electrical','Others') DEFAULT NULL,
  `issue_description` text,
  `action_taken` text,
  `remark` text,
  `temperature` decimal(5,2) DEFAULT NULL,
  `humidity` decimal(5,2) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `oee_supporting_log`
--

INSERT INTO `oee_supporting_log` (`id`, `start_time`, `end_time`, `technician_name`, `failure_type`, `issue_description`, `action_taken`, `remark`, `temperature`, `humidity`, `created_at`) VALUES
(1, '2025-10-06 09:00:00', '2025-10-06 09:05:00', 'Budi', 'Mechanical', 'Nozzle cat tersumbat', 'Membersihkan dan mengganti filter nozzle', 'Normal kembali setelah tindakan perawatan', 29.50, 68.00, '2025-10-06 09:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `oee_time_log`
--

CREATE TABLE `oee_time_log` (
  `id` int NOT NULL,
  `shift` varchar(10) DEFAULT NULL,
  `shift_start` time NOT NULL,
  `shift_end` time NOT NULL,
  `break_time` int DEFAULT '0',
  `planned_stop` int DEFAULT '0',
  `downtime` int DEFAULT '0',
  `planned_time` int DEFAULT '0',
  `operation_time` int DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `oee_time_log`
--

INSERT INTO `oee_time_log` (`id`, `shift`, `shift_start`, `shift_end`, `break_time`, `planned_stop`, `downtime`, `planned_time`, `operation_time`, `created_at`) VALUES
(1, '1', '08:00:00', '16:00:00', 1800, 0, 290, 28800, 28500, '2025-10-06 08:00:00'),
(2, '10', '10:56:00', '10:53:00', 20, 10, 20, 1407, 1387, '2025-10-06 10:52:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oee_downtime_log`
--
ALTER TABLE `oee_downtime_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oee_loss_log`
--
ALTER TABLE `oee_loss_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oee_machine_wo`
--
ALTER TABLE `oee_machine_wo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oee_production_log`
--
ALTER TABLE `oee_production_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oee_summary`
--
ALTER TABLE `oee_summary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oee_supporting_log`
--
ALTER TABLE `oee_supporting_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oee_time_log`
--
ALTER TABLE `oee_time_log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oee_downtime_log`
--
ALTER TABLE `oee_downtime_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oee_loss_log`
--
ALTER TABLE `oee_loss_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oee_machine_wo`
--
ALTER TABLE `oee_machine_wo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oee_production_log`
--
ALTER TABLE `oee_production_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oee_summary`
--
ALTER TABLE `oee_summary`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oee_supporting_log`
--
ALTER TABLE `oee_supporting_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oee_time_log`
--
ALTER TABLE `oee_time_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
