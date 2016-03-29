-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2016 at 05:26 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: mystuff_1_0
--
CREATE DATABASE IF NOT EXISTS mystuff_1_0 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE mystuff_1_0;

-- --------------------------------------------------------

--
-- Table structure for table category
--

DROP TABLE IF EXISTS category;
CREATE TABLE category (
  `categoryID` int(11) NOT NULL,
  `categoryName` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table country
--

DROP TABLE IF EXISTS country;
CREATE TABLE country (
  `countryID` int(11) NOT NULL,
  `countryName` varchar(50) NOT NULL,
  `countryAbbreviation` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table images
--

DROP TABLE IF EXISTS images;
CREATE TABLE images (
  `imageID` int(11) NOT NULL,
  `imageNo` int(11) NOT NULL,
  `imageName` varchar(150) NOT NULL,
  `itemID_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table items
--

DROP TABLE IF EXISTS items;
CREATE TABLE items (
  `itemsID` int(11) NOT NULL,
  `itemName` varchar(60) NOT NULL,
  `itemDescription` varchar(250) NOT NULL,
  `itemModelNum` varchar(50) DEFAULT NULL,
  `itemSerialNum` varchar(60) DEFAULT NULL,
  `itemPrice` int(12) NOT NULL,
  `itemAcquireDate` date DEFAULT NULL,
  `itemExpireDate` date DEFAULT NULL,
  `itemMiscInfo` varchar(500) DEFAULT NULL,
  `userID_fk` int(11) NOT NULL,
  `categoryID_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table permissions
--

DROP TABLE IF EXISTS permissions;
CREATE TABLE permissions (
  `permissionsId` int(11) NOT NULL,
  `permissionsName` varchar(50) NOT NULL,
  `permissionsValue` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table receipts
--

DROP TABLE IF EXISTS receipts;
CREATE TABLE receipts (
  `receiptID` int(11) NOT NULL,
  `receiptPDF` varchar(150) NOT NULL,
  `itemID_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table users
--

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  `userID` int(11) NOT NULL,
  `userFirstName` varchar(50) NOT NULL,
  `userLastName` varchar(50) NOT NULL,
  `userEmailAddress` varchar(60) NOT NULL,
  `userPassword` varchar(256) NOT NULL,
  `userPhoneNumber` varchar(12) NOT NULL,
  `countryID_fk` int(11) NOT NULL,
  `permissionID_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table category
--
ALTER TABLE category
  ADD PRIMARY KEY (`categoryID`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table country
--
ALTER TABLE country
  ADD PRIMARY KEY (`countryID`),
  ADD KEY `countryID` (`countryID`);

--
-- Indexes for table images
--
ALTER TABLE images
  ADD PRIMARY KEY (`imageID`),
  ADD KEY `imageID` (`imageID`),
  ADD KEY `itemID_fk` (`itemID_fk`);

--
-- Indexes for table items
--
ALTER TABLE items
  ADD PRIMARY KEY (`itemsID`),
  ADD KEY `itemsID` (`itemsID`),
  ADD KEY `userID_fk` (`userID_fk`),
  ADD KEY `categoryID_fk` (`categoryID_fk`);

--
-- Indexes for table permissions
--
ALTER TABLE permissions
  ADD PRIMARY KEY (`permissionsId`),
  ADD KEY `permissionsId` (`permissionsId`);

--
-- Indexes for table receipts
--
ALTER TABLE receipts
  ADD PRIMARY KEY (`receiptID`),
  ADD KEY `receiptID` (`receiptID`),
  ADD KEY `itemID_fk` (`itemID_fk`);

--
-- Indexes for table users
--
ALTER TABLE users
  ADD PRIMARY KEY (`userID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `permissionID_fk` (`permissionID_fk`),
  ADD KEY `countryID_fk` (`countryID_fk`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table images
--
ALTER TABLE images
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`itemID_fk`) REFERENCES items (`itemsID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table items
--
ALTER TABLE items
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`userID_fk`) REFERENCES `users` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_ibfk_4` FOREIGN KEY (`categoryID_fk`) REFERENCES category (`categoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table receipts
--
ALTER TABLE receipts
  ADD CONSTRAINT `receipts_ibfk_1` FOREIGN KEY (`itemID_fk`) REFERENCES items (`itemsID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table users
--
ALTER TABLE users
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`countryID_fk`) REFERENCES country (`countryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`permissionID_fk`) REFERENCES permissions (`permissionsId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
