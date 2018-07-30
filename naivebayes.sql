-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2018 at 02:32 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `naivebayes`
--

-- --------------------------------------------------------

--
-- Table structure for table `trainingset`
--

CREATE TABLE `trainingset` (
  `S_NO` int(11) NOT NULL,
  `document` text NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trainingset`
--

INSERT INTO `trainingset` (`S_NO`, `document`, `category`) VALUES
(21, 'Sport in Bangladesh is a popular form of entertainment as well as an essential part of Bangladeshi culture', 'Sports'),
(22, 'Sport can play a role in improving the lives of not only individuals but whole communities', 'Sports'),
(23, 'Financial risk protection and equity are major components of universal health coverage which is defined as ensuring access to health services for all citizens without any undue financial burden', 'Finance'),
(24, 'Secularism is established in Bangladesh and freedom of religion is guaranteed by constitution', 'Religion'),
(25, 'Bangladesh religious minorities have been facing attacks since the 2014 national election', 'Religion'),
(26, 'Sport in Bangladesh is a popular form of entertainment as well as an essential part of Bangladeshi culture', 'Sports'),
(27, 'Sport can play a role in improving the lives of not only individuals but whole communities', 'Sports'),
(28, 'Financial risk protection and equity are major components of universal health coverage which is defined as ensuring access to health services for all citizens without any undue financial burden', 'Finance'),
(29, 'Secularism is established in Bangladesh and freedom of religion is guaranteed by constitution', 'Religion'),
(30, 'Bangladesh religious minorities have been facing attacks since the 2014 national election', 'Religion'),
(31, 'The politics regarding the bargaining of the students for their sports games interest with the university authority is called student politics', 'Politics'),
(32, 'A key risk related to the violence in Bangladesh from a rating perspective is that at some stage safety issues could deter foreigners from doing business there', 'Politics'),
(33, 'Sport in Bangladesh is a popular form of entertainment as well as an essential part of Bangladeshi culture', 'Sports'),
(34, 'Sport can play a role in improving the lives of not only individuals but whole communities', 'Sports'),
(35, 'Financial risk protection and equity are major components of universal health coverage which is defined as ensuring access to health services for all citizens without any undue financial burden', 'Finance'),
(36, 'Secularism is established in Bangladesh and freedom of religion is guaranteed by constitution', 'Religion'),
(37, 'Bangladesh religious minorities have been facing attacks since the 2014 national election', 'Religion'),
(38, 'The politics regarding the bargaining of the students for their sports games interest with the university authority is called student politics', 'Politics'),
(39, 'A key risk related to the violence in Bangladesh from a rating perspective is that at some stage safety issues could deter foreigners from doing business there', 'Politics'),
(40, 'Sport in Bangladesh is a popular form of entertainment as well as an essential part of Bangladeshi culture', 'Sports'),
(41, 'Sport can play a role in improving the lives of not only individuals but whole communities', 'Sports'),
(42, 'Financial risk protection and equity are major components of universal health coverage which is defined as ensuring access to health services for all citizens without any undue financial burden', 'Finance'),
(43, 'Secularism is established in Bangladesh and freedom of religion is guaranteed by constitution', 'Religion'),
(44, 'Bangladesh religious minorities have been facing attacks since the 2014 national election', 'Religion'),
(45, 'The politics regarding the bargaining of the students for their sports games interest with the university authority is called student politics', 'Politics'),
(46, 'A key risk related to the violence in Bangladesh from a rating perspective is that at some stage safety issues could deter foreigners from doing business there', 'Politics'),
(47, 'Sport in Bangladesh is a popular form of entertainment as well as an essential part of Bangladeshi culture', 'Sports'),
(48, 'Sport can play a role in improving the lives of not only individuals but whole communities', 'Sports'),
(49, 'Financial risk protection and equity are major components of universal health coverage which is defined as ensuring access to health services for all citizens without any undue financial burden', 'Finance'),
(50, 'Secularism is established in Bangladesh and freedom of religion is guaranteed by constitution', 'Religion'),
(51, 'Bangladesh religious minorities have been facing attacks since the 2014 national election', 'Religion'),
(52, 'The politics regarding the bargaining of the students for their sports games interest with the university authority is called student politics', 'Politics'),
(53, 'A key risk related to the violence in Bangladesh from a rating perspective is that at some stage safety issues could deter foreigners from doing business there', 'Politics');

-- --------------------------------------------------------

--
-- Table structure for table `wordfrequency`
--

CREATE TABLE `wordfrequency` (
  `S_NO` int(11) NOT NULL,
  `word` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wordfrequency`
--

INSERT INTO `wordfrequency` (`S_NO`, `word`, `count`, `category`) VALUES
(33, 'sport', 10, 'Sports'),
(34, 'bangladesh', 17, 'Sports'),
(35, 'popular', 5, 'Sports'),
(36, 'form', 5, 'Sports'),
(37, 'entertainment', 5, 'Sports'),
(38, 'well', 5, 'Sports'),
(39, 'essential', 5, 'Sports'),
(40, 'part', 5, 'Sports'),
(41, 'bangladeshi', 5, 'Sports'),
(42, 'culture', 5, 'Sports'),
(43, 'play', 5, 'Sports'),
(44, 'role', 5, 'Sports'),
(45, 'improving', 5, 'Sports'),
(46, 'lives', 5, 'Sports'),
(47, 'only', 5, 'Sports'),
(48, 'individuals', 5, 'Sports'),
(49, 'whole', 5, 'Sports'),
(50, 'communities', 5, 'Sports'),
(51, 'financial', 10, 'Finance'),
(52, 'risk', 8, 'Finance'),
(53, 'protection', 5, 'Finance'),
(54, 'equity', 5, 'Finance'),
(55, 'major', 5, 'Finance'),
(56, 'components', 5, 'Finance'),
(57, 'universal', 5, 'Finance'),
(58, 'health', 10, 'Finance'),
(59, 'coverage', 5, 'Finance'),
(60, 'which', 5, 'Finance'),
(61, 'defined', 5, 'Finance'),
(62, 'ensuring', 5, 'Finance'),
(63, 'access', 5, 'Finance'),
(64, 'services', 5, 'Finance'),
(65, 'all', 5, 'Finance'),
(66, 'citizens', 5, 'Finance'),
(67, 'without', 5, 'Finance'),
(68, 'any', 5, 'Finance'),
(69, 'undue', 5, 'Finance'),
(70, 'burden', 5, 'Finance'),
(71, 'secularism', 5, 'Religion'),
(72, 'established', 5, 'Religion'),
(73, 'bangladesh', 17, 'Religion'),
(74, 'freedom', 5, 'Religion'),
(75, 'religion', 5, 'Religion'),
(76, 'guaranteed', 5, 'Religion'),
(77, 'constitution', 5, 'Religion'),
(78, 'religious', 5, 'Religion'),
(79, 'minorities', 5, 'Religion'),
(80, 'been', 5, 'Religion'),
(81, 'facing', 5, 'Religion'),
(82, 'attacks', 5, 'Religion'),
(83, 'since', 5, 'Religion'),
(84, '2014', 5, 'Religion'),
(85, 'national', 5, 'Religion'),
(86, 'election', 5, 'Religion'),
(87, 'politics', 8, 'Politics'),
(88, 'regarding', 4, 'Politics'),
(89, 'bargaining', 4, 'Politics'),
(90, 'students', 4, 'Politics'),
(91, 'sports', 4, 'Politics'),
(92, 'games', 4, 'Politics'),
(93, 'interest', 4, 'Politics'),
(94, 'with', 4, 'Politics'),
(95, 'university', 4, 'Politics'),
(96, 'authority', 4, 'Politics'),
(97, 'called', 4, 'Politics'),
(98, 'student', 4, 'Politics'),
(99, 'key', 4, 'Politics'),
(100, 'risk', 7, 'Politics'),
(101, 'related', 4, 'Politics'),
(102, 'violence', 4, 'Politics'),
(103, 'bangladesh', 13, 'Politics'),
(104, 'rating', 4, 'Politics'),
(105, 'perspective', 4, 'Politics'),
(106, 'some', 4, 'Politics'),
(107, 'stage', 4, 'Politics'),
(108, 'safety', 4, 'Politics'),
(109, 'issues', 4, 'Politics'),
(110, 'deter', 4, 'Politics'),
(111, 'foreigners', 4, 'Politics'),
(112, 'doing', 4, 'Politics'),
(113, 'business', 4, 'Politics');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `trainingset`
--
ALTER TABLE `trainingset`
  ADD PRIMARY KEY (`S_NO`);

--
-- Indexes for table `wordfrequency`
--
ALTER TABLE `wordfrequency`
  ADD PRIMARY KEY (`S_NO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `trainingset`
--
ALTER TABLE `trainingset`
  MODIFY `S_NO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `wordfrequency`
--
ALTER TABLE `wordfrequency`
  MODIFY `S_NO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
