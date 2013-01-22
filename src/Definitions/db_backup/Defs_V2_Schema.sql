-- phpMyAdmin SQL Dump
-- version 3.5.4
-- http://www.phpmyadmin.net
--
-- Host: 127.4.238.129:3306
-- Generation Time: Jan 17, 2013 at 01:26 AM
-- Server version: 5.1.66
-- PHP Version: 5.3.3

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS `subaru`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `subaru`
--

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--
DROP TABLE IF EXISTS `Address`;
CREATE TABLE IF NOT EXISTS `Address` (
  `AddressID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Address` char(6) NOT NULL,
  `Length` tinyint(3) unsigned NOT NULL,
  `OffsetBit` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`AddressID`),
  UNIQUE KEY `Address` (`Address`,`Length`,`OffsetBit`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ECU`
--
DROP TABLE IF EXISTS `ECU`;
CREATE TABLE IF NOT EXISTS `ECU` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ECUID` char(10) NOT NULL,
  `CALID` char(8) DEFAULT NULL,
  `InternalIDAddress` char(8) DEFAULT NULL,
  `InternalIDString` char(10) DEFAULT NULL,
  `Year` char(10) DEFAULT NULL,
  `Market` char(16) DEFAULT NULL,
  `Make` char(16) DEFAULT NULL,
  `Model` char(16) DEFAULT NULL,
  `Submodel` char(16) DEFAULT NULL,
  `Transmission` char(16) DEFAULT NULL,
  `MemModel` char(16) DEFAULT NULL,
  `FlashMethod` char(16) DEFAULT NULL,
  `FileSize` char(8) DEFAULT NULL,
  `ChecksumModule` char(16) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ECUID` (`ECUID`),
  KEY `CALID` (`CALID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `ECU` (`ID`, `ECUID`, `CALID`, `InternalIDAddress`, `InternalIDString`, `Year`, `Market`, `Make`, `Model`, `Submodel`, `Transmission`, `MemModel`, `FlashMethod`, `FileSize`, `ChecksumModule`) VALUES
(1, '2344500405', 'A4SE700E', '200', 'A4SE700E', '2001/02', 'EDM', 'Subaru', 'Forester', 'Turbo', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(2, '2354500405', 'A4SE700F', '200', 'A4SE700F', '2001/02', 'ADM', 'Subaru', 'Forester', 'Turbo', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(3, '2604446305', 'A4SH701G', '200', 'A4SH701G', '2002', 'JDM', 'Subaru', 'Legacy', 'BH', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(4, '2604446405', 'A4SHB00G', '200', 'A4SHB00G', '2002', 'JDM', 'Subaru', 'Legacy', 'BH', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(5, '2604446505', 'A4SHC00G', '200', 'A4SHC00G', '2002', 'JDM', 'Subaru', 'Legacy', 'B4', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(6, '2604446605', 'A4SHC01G', '200', 'A4SHC01G', '2002', 'JDM', 'Subaru', 'Legacy', 'B4', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(7, '2604686305', 'A4SH701H', '200', 'A4SH701H', '2002', 'JDM', 'Subaru', 'Legacy', 'B4', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(8, '2604686405', 'A4SHB00H', '200', 'A4SHB00H', '2002', 'JDM', 'Subaru', 'Legacy', 'B4', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(9, '2604686505', 'A4SHC00H', '200', 'A4SHC00H', '2002/03', 'JDM', 'Subaru', 'Legacy', '2.0TT', 'MT', '68HC16Y5', 'wrx02', '192kb', NULL),
(10, '2654786105', 'A4SH701K', '200', 'A4SH701K', '2002', 'ADM', 'Subaru', 'Liberty', 'B4', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(11, '2904485005', 'A4SDA00P', '200', 'A4SDA00P', '2001/02', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(12, '2904495005', 'A4SDA00Q', '200', 'A4SDA00Q', '2001/02', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(13, '2904497105', 'A4SDA01Q', '200', 'A4SDA01Q', '2001/02', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(14, '2944594105', 'A4RG060Q', '200', 'A4RG060Q', '2001/02', 'EDM', 'Subaru', 'Impreza', 'STi', 'MT', '68HC16Y5', 'wrx02', '192kb', NULL),
(15, '2944596105', 'A4RN1000', '200', 'A4RN1000', '2001/02', 'EDM', 'Subaru', 'Impreza', 'STi', 'MT', '68HC16Y5', 'wrx02', '192kb', NULL),
(16, '2954594105', 'A4RG060P', '200', 'A4RG060P', '2001/02', 'ADM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(17, '3112405106', 'A2ZJ201D', '2000', 'A2ZJ201D', '2004', 'USDM', 'Subaru', 'Forester', 'XT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(18, '3112485106', 'A2ZJ500I', '2000', 'A2ZJ500I', '2004', 'USDM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(19, '3112485406', 'A2ZJ512I', '2000', 'A2ZJ512I', '2004', 'USDM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(20, '3144504006', 'A2ZJ500F', '2000', 'A2ZJ500F', '2004', 'EDM', 'Subaru', 'Forester', 'XT', 'MT/AT', 'SH7055', 'sti04', '512kb', NULL),
(21, '3152504006', 'A2ZJ500H', '2000', 'A2ZJ500H', '2004', 'ADM', 'Subaru', 'Forester', 'XT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(22, '3152584006', 'A2ZJ500M', '2000', 'A2ZJ500M', '2004', 'ADM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(23, '3614446105', 'A4TC101K', '200', 'A4TC101K', '2003', 'USDM', 'Subaru', 'Impreza', 'WRX', 'AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(24, '3614446205', 'A4TC300K', '200', 'A4TC300K', '2003', 'USDM', 'Subaru', 'Impreza', 'WRX', 'AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(25, '3614486105', 'A4TC101L', '200', 'A4TC101L', '2003', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', '68HC16Y5', 'wrx02', '192kb', NULL),
(26, '3614486205', 'A4TC300L', '200', 'A4TC300L', '2003', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', '68HC16Y5', 'wrx02', '192kb', NULL),
(27, '3614486305', 'A4TC400L', '200', 'A4TC400L', '2003', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', '68HC16Y5', 'wrx02', '192kb', NULL),
(28, '3614486405', 'A4TC401L', '200', 'A4TC401L', '2003', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', '68HC16Y5', 'wrx02', '192kb', NULL),
(29, '3712405006', 'A2ZJ500K', '2000', 'A2ZJ500K', '2004', 'USDM', 'Subaru', 'Baja', 'Turbo', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(30, '3712485006', 'A2ZJ500L', '2000', 'A2ZJ500L', '2004', 'USDM', 'Subaru', 'Baja', 'Turbo', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(31, '4212047006', 'E2VG211D', '2000', 'E2VG211D', '2006', 'USDM', 'Subaru', 'Forester', '2.5', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(32, '4212047106', 'E2VG221D', '2000', 'E2VG221D', '2007', 'USDM', 'Subaru', 'Forester', '2.5', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(33, '4212505106', 'A8DH101D', '2000', 'A8DH101D', '2006', 'USDM', 'Subaru', 'Forester', 'XT', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(34, '4212585006', 'A8DH100I', '2000', 'A8DH100I', '2006', 'USDM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(35, '4212585106', 'A8DH101I', '2000', 'A8DH101I', '2006', 'USDM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(36, '4242504106', 'A8DH100P', '2000', 'A8DH100P', '2006', 'EDM', 'Subaru', 'Forester', 'XT', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(37, '4242584106', 'A8DH100F', '2000', 'A8DH100F', '2006', 'EDM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(38, '4252187006', 'E2VG212E', '2000', 'E2VG212E', '2006', 'ADM', 'Subaru', 'Forester', '2.5', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(39, '4252504106', 'A8DH100H', '2000', 'A8DH100H', '2006', 'ADM', 'Subaru', 'Forester', 'XT', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(40, '4252584106', 'A8DH100M', '2000', 'A8DH100M', '2006', 'ADM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(41, '4304594005', 'A4TJ121B', '200', 'A4TJ121B', '2005', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(42, '4312044006', 'E2VH101C', '2000', 'E2VH101C', '2006', 'USDM', 'Subaru', 'Impreza', '2.5i', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(43, '4312047106', 'E2VH111C', '2000', 'E2VH111C', '2006', 'USDM', 'Subaru', 'Impreza', '2.5i', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(44, '4312084006', 'E2VH102C', '2000', 'E2VH102C', '2006', 'USDM', 'Subaru', 'Impreza', '2.5i', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(45, '4312087106', 'E2VH112C', '2000', 'E2VH112C', '2006', 'USDM', 'Subaru', 'Impreza', '2.5i', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(46, '4312087206', 'E2VH202C', '2000', 'E2VH202C', '2006', 'USDM', 'Subaru', 'Impreza', '2.5i', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(47, '4312504006', 'A8DH200W', '2000', 'A8DH200W', '2006', 'USDM', 'Subaru', 'Impreza', 'WRX', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(48, '4312584006', 'A8DH200X', '2000', 'A8DH200X', '2006', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(49, '4312584106', 'A8DH201X', '2000', 'A8DH201X', '2006', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(50, '4312584206', 'A8DH202X', '2000', 'A8DH202X', '2006', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(51, '4312594006', 'A2ZJE11J', '2000', 'A2ZJE11J', '2006', 'USDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(52, '4342584006', 'A8DH200Y', '2000', 'A8DH200Y', '2006', 'EDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(53, '4342592006', 'A8DG300Z', 'cc176', 'A8DG300Z', '2006', 'EDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(54, '4342594006', 'A8DH200Z', '2000', 'A8DH200Z', '2006', 'EDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(55, '4352584006', 'A8DH200O', '2000', 'A8DH200O', '2006', 'ADM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(56, '4352594006', 'A8DH200V', '2000', 'A8DH200V', '2006', 'ADM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(57, '4512187106', 'E2VG222B', '2000', 'E2VG222B', '2006', 'USDM', 'Subaru', 'Outback', '2.5i', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(58, '4512503106', 'A2WF200C', '2000', 'A2WF200C', '2006', 'USDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(59, '4512513106', 'A2WF200R', '2000', 'A2WF200R', '2006', 'USDM', 'Subaru', 'Outback', 'XT', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(60, '4512783106', 'A2WF200N', '2000', 'A2WF200N', '2006', 'USDM', 'Subaru', 'Legacy', 'GT', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(61, '4512793106', 'A2WF200S', '2000', 'A2WF200S', '2006', 'USDM', 'Subaru', 'Outback', 'XT', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(62, '4812403006', 'A2WF100K', '2000', 'A2WF100K', '2006', 'USDM', 'Subaru', 'Baja', 'Turbo', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(63, '4812403106', 'A2WF101K', '2000', 'A2WF101K', '2006', 'USDM', 'Subaru', 'Baja', 'Turbo', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(64, '4812483006', 'A2WF100L', '2000', 'A2WF100L', '2006', 'USDM', 'Subaru', 'Baja', 'Turbo', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(65, '4812483106', 'A2WF101L', '2000', 'A2WF101L', '2006', 'USDM', 'Subaru', 'Baja', 'Turbo', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(66, '5104144007', 'E2TB101Q', '2000', 'E2TB101Q', '2008', 'JDM', 'Subaru', 'Exiga', '2.0i', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(67, '5104504007', 'A2TB100V', '2000', 'A2TB100V', '2008', 'JDM', 'Subaru', 'Impreza', 'SGT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(68, '5104584007', 'A2TB100U', '2000', 'A2TB100U', '2008', 'JDM', 'Subaru', 'Impreza', 'SGT', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(69, '5112144007', 'EZ1E102H', '2004', 'EZ1E102H', '2008', 'USDM', 'Subaru', 'Impreza', '2.5i', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(70, '5112184007', 'EZ1E102G', '2004', 'EZ1E102G', '2008', 'USDM', 'Subaru', 'Impreza', '2.5i', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(71, '5112187007', 'EZ1E401G', '2004', 'EZ1E401G', '2008/09', 'USDM', 'Subaru', 'Impreza', '2.5i', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(72, '5112504107', 'AZ1E401B', '2004', 'AZ1E401B', '2008', 'USDM', 'Subaru', 'Impreza', 'WRX', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(73, '5112584107', 'AZ1E401A', '2004', 'AZ1E401A', '2008', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(74, '5142584007', 'AZ1E400U', '2004', 'AZ1E400U', '2008', 'EDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(75, '5152584007', 'AZ1E400C', '2004', 'AZ1E400C', '2008', 'ADM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(76, '5204504007', 'A2TB100A', '2000', 'A2TB100A', '2008', 'JDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(77, '5204584007', 'A2TB100B', '2000', 'A2TB100B', '2007', 'JDM', 'Subaru', 'Legacy', 'GT', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(78, '5204784007', 'A2TB100K', '2000', 'A2TB100K', '2007', 'JDM', 'Subaru', 'Legacy', 'GT spec.B', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(79, '5212167107', 'EZ1D201D', '2004', 'EZ1D201D', '2008', 'USDM', 'Subaru', 'Legacy', '2.5i', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(80, '5212167307', 'EZ1D302D', '2004', 'EZ1D302D', '2009', 'USDM', 'Subaru', 'Legacy', '2.5i', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(81, '5212525107', 'A2TB001C', '2000', 'A2TB001C', '2008', 'USDM', 'Subaru', 'Legacy(Outback)', 'GT(XT)', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(82, '5212785007', 'A2TB000L', '2000', 'A2TB000L', '2008', 'USDM', 'Subaru', 'Legacy', 'GT spec.B', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(83, '5212785107', 'A2TB001L', '2000', 'A2TB001L', '2008', 'USDM', 'Subaru', 'Legacy', 'GT spec.B', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(84, '5222167307', 'EZ1D302B', '2004', 'EZ1D302B', '2009', 'USDM', 'Subaru', 'Legacy', '2.5i', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(85, '5312146007', 'E2TB011I', '2000', 'E2TB011I', '2008', 'USDM', 'Subaru', 'Forester', '2.5', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(86, '6202154007', 'E2SB001K', '2000', 'E2SB001K', '2008', 'JDM', 'Subaru', 'Legacy', '2.5i', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(87, '6202504007', 'A2SB000Y', '2000', 'A2SB000Y', '2008', 'JDM', 'Subaru', 'Outback', 'XT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(88, '6204504007', 'A2SB000A', '2000', 'A2SB000A', '2008', 'JDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(89, '6304504007', 'AZ1H101W', '2004', 'AZ1H101W', '2008', 'JDM', 'Subaru', 'Impreza', 'SGT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(90, '6304504107', 'AZ1H102W', '2004', 'AZ1H102W', '2008', 'JDM', 'Subaru', 'Exiga', '2.0GT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(91, '6612784007', 'AZ1G401V', '2004', 'AZ1G401V', '2009', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(92, '6642584007', 'AZ1G400U', '2004', 'AZ1G400U', '2009', 'EDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(93, '6652784007', 'AZ1G400W', '2004', 'AZ1G400W', '2009', 'ADM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(94, '6902744007', 'AZ1G502L', '2004', 'AZ1G502L', '2009', 'JDM', 'Subaru', 'Impreza', 'STI', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(95, '6904784007', 'AZ1G500F', '2004', 'AZ1G500F', '2009', 'JDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(96, '6912783007', 'AZ1G202I', '2004', 'AZ1G202I', '2008/09', 'USDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(97, '7212786007', 'AZ1G701I', '2004', 'AZ1G701I', '2010', 'USDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(98, '7212786107', 'AZ1G702I', '2004', 'AZ1G702I', '2010', 'USDM', 'Subaru', 'Impreza', 'STi SE', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(99, '1B04400405', 'A4SD501A', '200', 'A4SD501A', '2001/02', 'JDM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(100, '1B04400505', 'A4SD800A', '200', 'A4SD800A', '2001/02', 'JDM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(101, '1B04400605', 'A4SD900A', '200', 'A4SD900A', '2001/02', 'JDM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(102, '1B04490305', 'A4SD600B', '200', 'A4SD600B', '2001/02', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(103, '1B04490405', 'A4SD700B', '200', 'A4SD700B', '2001/02', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(104, '1B04490505', 'A4SD800B', '200', 'A4SD800B', '2001/02', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(105, '1B04490605', 'A4SD900B', '200', 'A4SD900B', '2001/02', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(106, '1B04490805', 'A4SDA01B', '200', 'A4SDA01B', '2001/02', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(107, '1B14400305', 'A4SG900C', '200', 'A4SG900C', '2002', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(108, '1B14400405', 'A4SGA00C', '200', 'A4SGA00C', '2002', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(109, '1B14400505', 'A4SGC00C', '200', 'A4SGC00C', '2002', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(110, '1B14400605', 'A4SGD10C', '200', 'A4SGD10C', '2002', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(111, '1B14400705', 'A4SGE00C', '200', 'A4SGE00C', '2002', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(112, '1B14400805', 'A4SGE01C', '200', 'A4SGE01C', '2002', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(113, '1B44580105', 'A4SE300D', '200', 'A4SE300D', '2001/02', 'EDM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(114, '1B44580405', 'A4SE700D', '200', 'A4SE700D', '2001/02', 'EDM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(115, '1B44580505', 'A4SE900D', '200', 'A4SE900D', '2001/02', 'EDM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(116, '1B54500405', 'A4SE700I', '200', 'A4SE700I', '2001/02', 'ADM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(117, '1B54500505', 'A4SE900I', '200', 'A4SE900I', '2001/02', 'ADM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(118, '23A4500405', 'A4SE700J', '200', 'A4SE700J', '2001/02', 'SADM', 'Subaru', 'Forester', 'Turbo', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(119, '29044A4105', 'A4RG050N', '200', 'A4RG050N', '2001/02', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(120, '29044A7105', 'A4RG051N', '200', 'A4RG051N', '2001/02', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(121, '29044B6005', 'A4RG050R', '200', 'A4RG050R', '2001/02', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(122, '29046B6005', 'A4RG052N', '200', 'A4RG052N', '2001/02', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(123, '2A04484005', 'A4RI200I', '200', 'A4RI200I', '2001/02', 'JDM', 'Subaru', 'Forester', 'Turbo', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(124, '2A04486005', 'A4RI300I', '200', 'A4RI300I', '2001/02', 'JDM', 'Subaru', 'Forester', 'Turbo', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(125, '2A44506005', 'A4RL100J', '200', 'A4RL100J', '2003', 'EDM', 'Subaru', 'Forester', 'Turbo', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(126, '2AA4506005', 'A4RL100K', '200', 'A4RL100K', '2003', 'SADM', 'Subaru', 'Forester', 'Turbo', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(127, '2D54544005', 'A4SHA10R', '200', 'A4SHA10R', '2003', 'ADM', 'Subaru', 'Liberty', 'B4', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(128, '2E04404005', 'A4TE000A', '200', 'A4TE000A', '2003', 'JDM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(129, '2E04494005', 'A4TE001B', '200', 'A4TE001B', '2003', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(130, '2E04496005', 'A4TE002B', '200', 'A4TE002B', '2003', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(131, '2E044A6005', 'A4TE002Q', '200', 'A4TE002Q', '2003', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(132, '2E12495106', 'A2ZJ500J', '2000', 'A2ZJ500J', '2004', 'USDM', 'Subaru', 'Impreza', 'STi', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(133, '2E12495206', 'A2ZJ700J', '2000', 'A2ZJ700J', '2004', 'USDM', 'Subaru', 'Impreza', 'STi', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(134, '2E12495306', 'A2ZJ710J', '2000', 'A2ZJ710J', '2004', 'USDM', 'Subaru', 'Impreza', 'STi', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(135, '2E14446006', 'A4TF300E', '200', 'A4TF300E', '2004', 'USDM', 'Subaru', 'Impreza', 'WRX', 'AT', '68HC16Y5', 'wrx04', '192kb', NULL),
(136, '2E14446106', 'A4TF400E', '200', 'A4TF400E', '2004', 'USDM', 'Subaru', 'Impreza', 'WRX', 'AT', '68HC16Y5', 'wrx04', '192kb', NULL),
(137, '2E14446206', 'A4TF510E', '200', 'A4TF510E', '2004', 'USDM', 'Subaru', 'Impreza', 'WRX', 'AT', '68HC16Y5', 'wrx04', '192kb', NULL),
(138, '2E14486006', 'A4TF300F', '200', 'A4TF300F', '2004', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', '68HC16Y5', 'wrx04', '192kb', NULL),
(139, '2E14486106', 'A4TF500F', '200', 'A4TF500F', '2004', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', '68HC16Y5', 'wrx04', '192kb', NULL),
(140, '2E14486206', 'A4TF510F', '200', 'A4TF510F', '2004', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', '68HC16Y5', 'wrx04', '192kb', NULL),
(141, '2E14486306', 'A4TF520F', '200', 'A4TF520F', '2004', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', '68HC16Y5', 'wrx04', '192kb', NULL),
(142, '2E44584105', 'A4TE001G', '200', 'A4TE001G', '2003', 'EDM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(143, '2E44586005', 'A4TE100G', '200', 'A4TE100G', '2003', 'EDM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(144, '2E44594005', 'A4RM000H', '200', 'A4RM000H', '2003', 'EDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(145, '2E44594105', 'A4RM100H', '200', 'A4RM100H', '2003', 'EDM', 'Subaru', 'Impreza', 'STi', 'MT', '68HC16Y5', 'wrx02', '192kb', NULL),
(146, '2E44596105', 'A4RN200H', '200', 'A4RN200H', '2003', 'EDM', 'Subaru', 'Impreza', 'STi', 'MT', '68HC16Y5', 'wrx02', '192kb', NULL),
(147, '2E54504105', 'A4TE001I', '200', 'A4TE001I', '2003', 'ADM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(148, '2E54594105', 'A4RM100G', '200', 'A4RM100G', '2003', 'ADM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(149, '2EA4584005', 'A4RM100F', '200', 'A4RM100F', '2005', 'SADM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(150, '2F04015206', 'E2ZD308E', '2000', 'E2ZD308E', '2004', 'JDM', 'Subaru', 'Legacy', '2.0', 'MT/AT', 'SH7055', 'sti04', '512kb', NULL),
(151, '2F04505106', 'A2ZJ601A', '2000', 'A2ZJ601A', '2004', 'JDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(152, '2F04505206', 'A2ZJ800A', '2000', 'A2ZJ800A', '2004', 'JDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(153, '2F04505406', 'A2ZJD00A', '2000', 'A2ZJD00A', '2004', 'JDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(154, '2F04505506', 'A2ZJD01A', '2000', 'A2ZJD01A', '2004', 'JDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(155, '2F04785006', 'A2ZJ600B', '2000', 'A2ZJ600B', '2004', 'JDM', 'Subaru', 'Legacy', 'GT', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(156, '2F04785206', 'A2ZJC00B', '2000', 'A2ZJC00B', '2004', 'JDM', 'Subaru', 'Legacy', 'GT', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(157, '2F04785306', 'A2ZJD00B', '2000', 'A2ZJD00B', '2004', 'JDM', 'Subaru', 'Legacy', 'GT', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(158, '2F04785506', 'A2ZJD02B', '2000', 'A2ZJD02B', '2004', 'JDM', 'Subaru', 'Legacy', 'GT', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(159, '2F0A367306', 'D2ZU200A', '2000', 'D2ZU200A', '2004', 'JDM', 'Subaru', 'Legacy', '3.0R', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(160, '2F12505106', 'A2WC500C', '2000', 'A2WC500C', '2005', 'USDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(161, '2F12505206', 'A2WC510C', '2000', 'A2WC510C', '2005', 'USDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(162, '2F12505306', 'A2WC511C', '2000', 'A2WC511C', '2005', 'USDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(163, '2F12505506', 'A2WC521C', '2000', 'A2WC521C', '2005', 'USDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(164, '2F12515106', 'A2WC500R', '2000', 'A2WC500R', '2005', 'USDM', 'Subaru', 'Outback', 'XT', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(165, '2F12515206', 'A2WC510R', '2000', 'A2WC510R', '2005', 'USDM', 'Subaru', 'Outback', 'XT', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(166, '2F12515306', 'A2WC511R', '2000', 'A2WC511R', '2005', 'USDM', 'Subaru', 'Outback', 'XT', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(167, '2F12515506', 'A2WC521R', '2000', 'A2WC521R', '2005', 'USDM', 'Subaru', 'Outback', 'XT', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(168, '2F12785106', 'A2WC500N', '2000', 'A2WC500N', '2005', 'USDM', 'Subaru', 'Legacy', 'GT', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(169, '2F12785206', 'A2WC510N', '2000', 'A2WC510N', '2005', 'USDM', 'Subaru', 'Legacy', 'GT', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(170, '2F12785306', 'A2WC511N', '2000', 'A2WC511N', '2005', 'USDM', 'Subaru', 'Legacy', 'GT', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(171, '2F12785506', 'A2WC521N', '2000', 'A2WC521N', '2005', 'USDM', 'Subaru', 'Legacy', 'GT', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(172, '2F12785606', 'A2WC522N', '2000', 'A2WC522N', '2005', 'USDM', 'Subaru', 'Legacy', 'GT', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(173, '2F12795206', 'A2WC510S', '2000', 'A2WC510S', '2005', 'USDM', 'Subaru', 'Outback', 'XT', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(174, '2F12795606', 'A2WC522S', '2000', 'A2WC522S', '2005', 'USDM', 'Subaru', 'Outback', 'XT', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(175, '2F421A6106', 'E2ZD508C', '2000', 'E2ZD508C', '2004', 'EDM', 'Subaru', 'Outback', '2.5i', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(176, '2F54505006', 'A2ZJ800G', '2000', 'A2ZJ800G', '2004', 'ADM', 'Subaru', 'Liberty', 'GT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(177, '2F54505106', 'A2ZJC00G', '2000', 'A2ZJC00G', '2004', 'ADM', 'Subaru', 'Liberty', 'GT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(178, '2F54505206', 'A2ZJD00G', '2000', 'A2ZJD00G', '2004', 'ADM', 'Subaru', 'Liberty', 'GT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(179, '2F54505406', 'A2ZJD02G', '2000', 'A2ZJD02G', '2004', 'ADM', 'Subaru', 'Liberty', 'GT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(180, '3A54504005', 'A4TH000N', '200', 'A4TH000N', '2004', 'ADM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(181, '3A54584005', 'A4TH000O', '200', 'A4TH000O', '2004', 'ADM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(182, '3B02593006', 'A2WA20++', '2000', 'A2WA20++', '2004', 'JDM', 'Subaru', 'Forester', 'STi', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(183, '3B02594006', 'A2WC000E', '2000', 'A2WC000E', '2004', 'JDM', 'Subaru', 'Forester', 'STi', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(184, '3B02594216', 'A2WC011E', '2000', 'A2WC011E', '2004-07', 'JDM', 'Subaru', 'Forester', 'STi', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(185, '3B02594316', 'A2WC012E', '2000', 'A2WC012E', '2004-07', 'JDM', 'Subaru', 'Forester', 'STi', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(186, '3B02594416', 'A2WC013E', '2000', 'A2WC013E', '2004-07', 'JDM', 'Subaru', 'Forester', 'STi', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(187, '3B04484105', 'A4RI401I', '200', 'A4RI401I', '2001/02', 'JDM', 'Subaru', 'Forester', 'Turbo', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(188, '3B12044206', 'E2ZJ121H', '2000', 'E2ZJ121H', '2005', 'USDM', 'Subaru', 'Forester', '2.5', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(189, '3B12504006', 'A2WC400D', '2000', 'A2WC400D', '2005', 'USDM', 'Subaru', 'Forester', 'XT', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(190, '3B12504106', 'A2WC410D', '2000', 'A2WC410D', '2005', 'USDM', 'Subaru', 'Forester', 'XT', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(191, '3B12504306', 'A2WC412D', '2000', 'A2WC412D', '2005', 'USDM', 'Subaru', 'Forester', 'XT', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(192, '3B12584006', 'A2WC400I', '2000', 'A2WC400I', '2005', 'USDM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(193, '3B12584106', 'A2WC410I', '2000', 'A2WC410I', '2005', 'USDM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(194, '3B12584206', 'A2WC411I', '2000', 'A2WC411I', '2005', 'USDM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(195, '3B12584306', 'A2WC412I', '2000', 'A2WC412I', '2005', 'USDM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(196, '3B42584006', 'A2WC401F', '2000', 'A2WC401F', '2004', 'EDM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(197, '3B42584116', 'A2WC420F', '2000', 'A2WC420F', '2004', 'EDM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(198, '3B44503006', 'A2ZJA00P', '2000', 'A2ZJA00P', '2005', 'EDM', 'Subaru', 'Forester', 'XT', 'MT/AT', 'SH7055', 'sti04', '512kb', NULL),
(199, '3B44503116', 'A2ZJA10P', '2000', 'A2ZJA10P', '2005', 'EDM', 'Subaru', 'Forester', 'XT', 'MT/AT', 'SH7055', 'sti04', '512kb', NULL),
(200, '3B52503006', 'A2WC400H', '2000', 'A2WC400H', '2005', 'ADM', 'Subaru', 'Forester', 'XT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(201, '3B52583006', 'A2WC400M', '2000', 'A2WC400M', '2005', 'ADM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(202, '3B52583116', 'A2WC420M', '2000', 'A2WC420M', '2005', 'ADM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(203, '3BA4503006', 'A2ZJA00Q', '2000', 'A2ZJA00Q', '2005', 'SADM', 'Subaru', 'Forester', 'XT', 'MT/AT', 'SH7055', 'sti04', '512kb', NULL),
(204, '3C02057416', 'E2WD500D', '2000', 'E2WD500D', '2005', 'JDM', 'Subaru', 'Outback', '2.5i', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(205, '3C04504006', 'A2WD000A', '2000', 'A2WD000A', '2004', 'JDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(206, '3C04504106', 'A2WD001A', '2000', 'A2WD001A', '2004', 'JDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(207, '3C04504216', 'A2WD010A', '2000', 'A2WD010A', '2004', 'JDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(208, '3C04504316', 'A2WD012A', '2000', 'A2WD012A', '2004', 'JDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(209, '3C04784106', 'A2WD001B', '2000', 'A2WD001B', '2004', 'JDM', 'Subaru', 'Legacy', 'GT', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(210, '3C04784216', 'A2WD010B', '2000', 'A2WD010B', '2004', 'JDM', 'Subaru', 'Legacy', 'GT', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(211, '3C04784316', 'A2WD012B', '2000', 'A2WD012B', '2004', 'JDM', 'Subaru', 'Legacy', 'GT', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(212, '3C0A383106', 'D2WD200A', '2000', 'D2WD200A', '2004', 'JDM', 'Subaru', 'Legacy', '3.0R', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(213, '3C4A354006', 'D2ZZ001E', '2000', 'D2ZZ001E', '2005', 'EDM', 'Subaru', 'Legacy', '3.0R', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(214, '3C54504106', 'A2WD001G', '2000', 'A2WD001G', '2004', 'ADM', 'Subaru', 'Liberty', 'GT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(215, '3C54504216', 'A2WD010G', '2000', 'A2WD010G', '2004', 'ADM', 'Subaru', 'Liberty', 'GT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(216, '3C54504316', 'A2WD012G', '2000', 'A2WD012G', '2004', 'ADM', 'Subaru', 'Liberty', 'GT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(217, '3C54784206', 'A2WD002T', '2000', 'A2WD002T', '2005', 'ADM', 'Subaru', 'Liberty', 'GT', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(218, '3C54784216', 'A2WD010T', '2000', 'A2WD010T', '2005', 'ADM', 'Subaru', 'Liberty', 'GT', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(219, '3C54784316', 'A2WD012T', '2000', 'A2WD012T', '2005', 'ADM', 'Subaru', 'Liberty', 'GT', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(220, '3C5A384106', 'D2WD603H', '2000', 'D2WD603H', '2005', 'ADM', 'Subaru', 'Liberty', '3.0R', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(221, '3C5A387116', 'D2WD610H', '2000', 'D2WD610H', '2004', 'ADM', 'Subaru', 'Liberty', '3.0R', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(222, '3D04403005', 'A4TE200A', '200', 'A4TE200A', '2004', 'JDM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(223, '3D044A4005', 'A4TJ111C', '200', 'A4TJ111C', '2005', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(224, '3D04594005', 'A4TJ111B', '200', 'A4TJ111B', '2005', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(225, '3D045B4005', 'A4TJ120S', '200', 'A4TJ120S', '2005', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(226, '3D04EA4605', 'A4TJ1X00', '200', 'A4TJ1X00', '20xx', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(227, '3D12594006', 'A2ZJB10J', '2000', 'A2ZJB10J', '2005', 'USDM', 'Subaru', 'Impreza', 'STi', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(228, '3D12594106', 'A2ZJB11J', '2000', 'A2ZJB11J', '2005', 'USDM', 'Subaru', 'Impreza', 'STi', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(229, '3D44583005', 'A4TE300D', '200', 'A4TE300D', '2005', 'EDM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(230, '3D44593005', 'A4RN300G', '200', 'A4RN300G', '2005', 'EDM', 'Subaru', 'Impreza', 'STi', 'MT', '68HC16Y5', 'wrx02', '192kb', NULL),
(231, '3D54583005', 'A4TH100H', '200', 'A4TH100H', '2005', 'ADM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(232, '3D54593005', 'A4RN300I', '200', 'A4RN300I', '2004', 'ADM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(233, '3D545B6005', 'A4TH100L', '200', 'A4TH100L', '2005', 'ADM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(234, '3DA4583005', 'A4RM200K', '200', 'A4RM200K', '2005', 'SADM', 'Subaru', 'Impreza', 'WRX', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(235, '3E12044006', 'E2ZJ101G', '2000', 'E2ZJ101G', '2005', 'USDM', 'Subaru', 'Impreza', '2.5RS', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(236, '3E12044106', 'E2ZJ111G', '2000', 'E2ZJ111G', '2005', 'USDM', 'Subaru', 'Impreza', '2.5RS', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(237, '3E12044206', 'E2ZJ121G', '2000', 'E2ZJ121G', '2005', 'USDM', 'Subaru', 'Impreza', '2.5RS', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(238, '3E12084006', 'E2ZJ103G', '2000', 'E2ZJ103G', '2005', 'USDM', 'Subaru', 'Impreza', '2.5RS', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(239, '3E12084106', 'E2ZJ113G', '2000', 'E2ZJ113G', '2005', 'USDM', 'Subaru', 'Impreza', '2.5RS', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(240, '3E12084206', 'E2ZJ123G', '2000', 'E2ZJ123G', '2005', 'USDM', 'Subaru', 'Impreza', '2.5RS', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(241, '3E12084306', 'E2ZJ133G', '2000', 'E2ZJ133G', '2005', 'USDM', 'Subaru', 'Impreza', '2.5RS', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(242, '3E14444006', 'A4TF800E', '200', 'A4TF800E', '2005', 'USDM', 'Subaru', 'Impreza', 'WRX', 'AT', '68HC16Y5', 'wrx04', '192kb', NULL),
(243, '3E14483006', 'A4TF7000', '200', 'A4TF7000', '2005', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', '68HC16Y5', 'wrx04', '192kb', NULL),
(244, '3E14484006', 'A4TF800F', '200', 'A4TF800F', '2005', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', '68HC16Y5', 'wrx04', '192kb', NULL),
(245, '3E14486006', 'A4TF810F', '200', 'A4TF810F', '2005', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', '68HC16Y5', 'wrx04', '192kb', NULL),
(246, '3F12404006', 'A2WC400K', '2000', 'A2WC400K', '2005', 'USDM', 'Subaru', 'Baja', 'Turbo', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(247, '3F12404106', 'A2WC500K', '2000', 'A2WC500K', '2005', 'USDM', 'Subaru', 'Baja', 'Turbo', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(248, '3F12484106', 'A2WC500L', '2000', 'A2WC500L', '2005', 'USDM', 'Subaru', 'Baja', 'Turbo', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(249, '3F12484206', 'A2WC501L', '2000', 'A2WC501L', '2005', 'USDM', 'Subaru', 'Baja', 'Turbo', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(250, '401A344206', 'D0XJ002B', '2000', 'D0XJ002B', '2006', 'USDM', 'Subaru', 'Tribeca', 'B9', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(251, '425258B006', 'A8DH10XM', 'cd7b2', 'A8DH10XM', '2006', 'ADM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(252, '43045A4005', 'A4TJ121C', '200', 'A4TJ121C', '2005', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(253, '43045B4005', 'A4TJ121S', '200', 'A4TJ121S', '2005', 'JDM', 'Subaru', 'Impreza', 'STi', 'MT/AT', '68HC16Y5', 'wrx02', '192kb', NULL),
(254, '431208A006', 'E2VH100C', '2000', 'E2VH100C', '2006', 'USDM', 'Subaru', 'Impreza', '2.5i', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(255, '434259A006', 'A8DH2Z1Z', 'cbdb6', 'A8DH2Z1Z', '2006', 'EDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(256, '43A2584006', 'A8DH200U', '2000', 'A8DH200U', '2006', 'SADM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(257, '454A344006', 'D0XJ001R', '2000', 'D0XJ001R', '2006', 'EDM', 'Subaru', 'Legacy', '3.0R', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(258, '455A344006', 'D0XJ001T', '2000', 'D0XJ001T', '2006', 'ADM', 'Subaru', 'Liberty', '3.0R', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(259, '455A384006', 'D0XJ001M', '2000', 'D0XJ001M', '2006', 'ADM', 'Subaru', 'Liberty', '3.0R', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(260, '4B04505107', 'A2UH000A', '2000', 'A2UH000A', '2006', 'JDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(261, '4B04505207', 'A2UI000A', '2000', 'A2UI000A', '2007', 'JDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(262, '4B04535107', 'A2PG420A', '2000', 'A2PG420A', '2007', 'JDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(263, '4B04585007', 'A2UG000B', '2000', 'A2UG000B', '2006', 'JDM', 'Subaru', 'Legacy', 'GT', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(264, '4B04785207', 'A2UI000K', '2000', 'A2UI000K', '2007', 'JDM', 'Subaru', 'Legacy', 'GT spec.B', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(265, '4B0A368007', 'D2UK001Q', '2000', 'D2UK001Q', '2007', 'JDM', 'Subaru', 'Legacy', '3.0R', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(266, '4B12525007', 'A2UG000C', '2000', 'A2UG000C', '2007', 'USDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(267, '4B12525207', 'A2UI001C', '2000', 'A2UI001C', '2007', 'USDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(268, '4B125A5007', 'A2UG000N', '2000', 'A2UG000N', '2007', 'USDM', 'Subaru', 'Legacy', 'GT', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(269, '4B12785007', 'A2UG000L', '2000', 'A2UG000L', '2007', 'USDM', 'Subaru', 'Legacy', 'GT spec.B', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(270, '4B12785207', 'A2UI001L', '2000', 'A2UI001L', '2007', 'USDM', 'Subaru', 'Legacy', 'GT spec.B', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(271, '4B52504107', 'A2UG001G', '2000', 'A2UG001G', '2008', 'ADM', 'Subaru', 'Liberty', 'GT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(272, '4B5250A007', 'A2UI000Y', '2000', 'A2UI000Y', '2008', 'ADM', 'Subaru', 'Liberty', 'GT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(273, '4B52584207', 'A2UG002T', '2000', 'A2UG002T', '2007', 'ADM', 'Subaru', 'Liberty', 'GT', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(274, '4B5258A007', 'A2UI000Z', '2000', 'A2UI000Z', '2008', 'ADM', 'Subaru', 'Liberty', 'GT', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(275, '4B5A384007', 'D2UH001M', '2000', 'D2UH001M', '2007', 'ADM', 'Subaru', 'Liberty', '3.0R', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(276, '4C1A344007', 'D2UG101B', '2000', 'D2UG101B', '2007', 'USDM', 'Subaru', 'Tribeca', 'B9', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(277, '4D12044006', 'E2UE101L', '2000', 'E2UE101L', '2007', 'USDM', 'Subaru', 'Impreza', '2.5i', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(278, '4D12084006', 'E2UE102L', '2000', 'E2UE102L', '2007', 'USDM', 'Subaru', 'Impreza', '2.5i', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(279, '4D12084106', 'E2UE202L', '2000', 'E2UE202L', '2006', 'USDM', 'Subaru', 'Impreza', '2.5i', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(280, '4D12504006', 'A8DK100W', '2000', 'A8DK100W', '2007', 'USDM', 'Subaru', 'Impreza', 'WRX', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(281, '4D12584006', 'A8DK100X', '2000', 'A8DK100X', '2007', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(282, '4D12584106', 'A8DK101X', '2000', 'A8DK101X', '2007', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(283, '4D12784006', 'A2UG000J', '2000', 'A2UG000J', '2007', 'USDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(284, '4D12784206', 'A2UJ000J', '2000', 'A2UJ000J', '2007', 'USDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(285, '4D42584006', 'A8DK100Y', '2000', 'A8DK100Y', '2007', 'EDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(286, '4D42594006', 'A8DK100Z', '2000', 'A8DK100Z', '2007', 'EDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(287, '4D425A6006', 'A8DK100K', '2000', 'A8DK100K', '2007', 'EDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(288, '4D52584006', 'A8DK100O', '2000', 'A8DK100O', '2007', 'ADM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(289, '4D52594006', 'A8DK100V', '2000', 'A8DK100V', '2007', 'ADM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(290, '4D525A6006', 'A8DK100L', '2000', 'A8DK100L', '2007', 'ADM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(291, '4DA2584006', 'A8DK100U', '2000', 'A8DK100U', '2007', 'SADM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(292, '4E12504107', 'A8DK100D', '2000', 'A8DK100D', '2007', 'USDM', 'Subaru', 'Forester', 'XT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(293, '4E12584107', 'A8DK100I', '2000', 'A8DK100I', '2007/08', 'USDM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(294, '4E42504007', 'A8DK100P', '2000', 'A8DK100P', '2007', 'EDM', 'Subaru', 'Forester', 'XT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(295, '4E42584007', 'A8DK100F', '2000', 'A8DK100F', '2007', 'EDM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(296, '4E52144007', 'E2UE101J', '2000', 'E2UE101J', '2006/07', 'ADM', 'Subaru', 'Forester', '2.5', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(297, '4E52184007', 'E2UE102J', '2000', 'E2UE102J', '2006/07', 'ADM', 'Subaru', 'Forester', '2.5', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(298, '4E52504007', 'A8DK100H', '2000', 'A8DK100H', '2007', 'ADM', 'Subaru', 'Forester', 'XT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(299, '4E52584007', 'A8DK100M', '2000', 'A8DK100M', '2007', 'ADM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(300, '4EA2504007', 'A8DK100E', '2000', 'A8DK100E', '2007', 'SADM', 'Subaru', 'Forester', 'XT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(301, '4F54507016', 'A2WD010Y', '2000', 'A2WD010Y', '2006', 'ADM', 'Subaru', 'Liberty', 'GT', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(302, '4F54787016', 'A2WD010Z', '2000', 'A2WD010Z', '2006', 'ADM', 'Subaru', 'Liberty', 'GT', 'MT', 'SH7055', 'sti04', '512kb', NULL),
(303, '51A2584007', 'AZ1E400E', '2004', 'AZ1E400E', '2008', 'SADM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(304, '520450C007', 'A2TB100Y', '2000', 'A2TB100Y', '2007', 'JDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(305, '52121A7007', 'EZ1D105C', '2004', 'EZ1D105C', '2008', 'USDM', 'Subaru', 'Legacy', '2.5i', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(306, '52121A7307', 'EZ1D302C', '2004', 'EZ1D302C', '2009', 'USDM', 'Subaru', 'Legacy', '2.5i', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(307, '52125A5007', 'A2TB000N', '2000', 'A2TB000N', '2008', 'USDM', 'Subaru', 'Legacy', 'GT', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(308, '52125A5107', 'A2TB001N', '2000', 'A2TB001N', '2008/09', 'USDM', 'Subaru', 'Legacy(Outback)', 'GT(XT)', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(309, '524A344007', 'D2TB201R', '2000', 'D2TB201R', '2008', 'EDM', 'Subaru', 'Legacy', '3.0R', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(310, '52521A4007', 'E2TB102M', '2000', 'E2TB102M', '2008', 'ADM', 'Subaru', 'Liberty', '2.5i', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(311, '574B343107', 'DZ1G001F', '2004', 'DZ1G001F', '2009', 'EDM', 'Subaru', 'Tribeca', 'B9', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(312, '5A04784107', 'AZ1G300F', '2004', 'AZ1G300F', '2008', 'JDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(313, '5A04784207', 'AZ1G301F', '2004', 'AZ1G301F', '2008', 'JDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(314, '5A12784107', 'AZ1G201I', '2004', 'AZ1G201I', '2008/09', 'USDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(315, '5A42784107', 'AZ1G201G', '2004', 'AZ1G201G', '2008', 'EDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(316, '5A42784207', 'AZ1G202G', '2004', 'AZ1G202G', '2008', 'EDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(317, '5A4278A107', 'Z1G20000', '2004', 'Z1G20000', '2008/09', 'EDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(318, '5AA2784007', 'AZ1G200J', '2004', 'AZ1G200J', '2008', 'SADM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(319, '5B525A4107', 'AE5F301D', '2004', 'AE5F301D', '2010', 'ADM', 'Subaru', 'Liberty', 'GT', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(320, '5C04505207', 'AZ1G105L', '2004', 'AZ1G105L', '2009', 'JDM', 'Subaru', 'Forester', 'XT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(321, '5C12187007', 'EZ1G109K', '2004', 'EZ1G109K', '2009', 'USDM', 'Subaru', 'Forester', '2.5', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(322, '5C12504007', 'AZ1G101R', '2004', 'AZ1G101R', '2009', 'USDM', 'Subaru', 'Forester', 'XT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(323, '5C42504007', 'AZ1G101N', '2004', 'AZ1G101N', '2009/10', 'EDM', 'Subaru', 'Forester', 'XT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(324, '5C42584007', 'AZ1G101M', '2004', 'AZ1G101M', '2009/10', 'EDM', 'Subaru', 'Forester', 'XT', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(325, '5C52184007', 'EZ1G107M', '2004', 'EZ1G107M', '2009', 'ADM', 'Subaru', 'Forester', '2.5', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(326, '621A356007', 'D2TC001P', '2000', 'D2TC001P', '2009', 'USDM', 'Subaru', 'Legacy', '3.0R', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(327, '66A2784007', 'AZ1G400X', '2004', 'AZ1G400X', '2009', 'SADM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(328, '671B344007', 'DZ1E402B', '2004', 'DZ1E402B', '2009', 'USDM', 'Subaru', 'Tribeca', '3.6L', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(329, '2F120A4606', 'E2ZJ173B', '2000', 'E2ZJ173B', '2005', 'USDM', 'Subaru', 'Legacy', '2.5i', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(330, '2F12044106', 'E2ZJ101B', '2000', 'E2ZJ101B', '2005', 'USDM', 'Subaru', 'Legacy', '2.5i', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(331, '2F12044506', 'E2ZJ141B', '2000', 'E2ZJ141B', '2005', 'USDM', 'Subaru', 'Legacy', '2.5i', 'AT/MT', 'SH7058', 'sti05', '1024kb', NULL),
(332, '7442594007', 'AZ1J500G', '2004', 'AZ1J500G', '2011', 'EDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(333, '4512147106', 'E2VG221B', '2000', 'E2VG221B', '2006', 'USDM', 'Subaru', 'Legacy', '2.5i', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(334, '4B12187007', 'E2UE102B', '2000', 'E2UE102B', '2007', 'USDM', 'Subaru', 'Outback', '2.5i', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(335, '5B42564107', 'AE5F301C', '2004', 'AE5F301C', '2010', 'EDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(336, '6E12786007', 'AZ1G701V', '2004', 'AZ1G701V', '2010', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(337, '52221A7207', 'EZ1D301A', '2004', 'EZ1D301A', '2008', 'USDM', 'Subaru', 'Legacy', '2.5 PZEV', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(338, '4512184106', 'E2VG204B', '2000', 'E2VG204B', '2006', 'USDM', 'Subaru', 'Legacy', '2.5i', 'MT/AT', 'SH7058', 'sti05', '1024kb', NULL),
(339, '7412597007', 'AE5I910V', '2004', 'AE5I910V', '2011', 'USDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(340, '3F12484006', 'A2WC400L', '2000', 'A2WC400L', '2005', 'USDM', 'Subaru', 'Baja', 'Turbo', 'MT', 'SH7058', 'sti05', '1024kb', NULL),
(341, '7432744007', 'AZ1J500J', '2004', 'AZ1J500J', '2011', 'JDM', 'Subaru', 'Impreza', 'STI', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(342, '6642784007', 'AZ1G400Y', '2004', 'AZ1G400Y', '2009', 'SADM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(343, '5112147007', 'EZ1E401H', '2004', 'EZ1E401H', '2008/09', 'USDM', 'Subaru', 'Impreza', '2.5i', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(344, '7402744007', 'AZ1G800F', '2004', 'AZ1G800F', '2011', 'JDM', 'Subaru', 'Impreza', 'STI', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(345, '6144D87207', 'JP3F501A', '400C', 'JP3F501A', '2009/10', 'EDM', 'Subaru', 'Forester', '2.0T Diesel', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(346, '6644D87107', 'JZ2F302A', '400C', 'JZ2F302A', '2009', 'EDM', 'Subaru', 'Impreza', '2.0T Diesel', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(347, '6644D87207', 'JZ2F401A', '400C', 'JZ2F401A', '2009/10', 'EDM', 'Subaru', 'Impreza', '2.0T Diesel', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(348, '7452584007', 'AZ1G900C', '2004', 'AZ1G900C', '2011', 'ADM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(349, '74A2584007', 'AZ1G800D', '2004', 'AZ1G800D', '2011', 'SADM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(350, '4B04785007', 'A2UG000k', '2000', 'A2UG000k', '2006', 'JDM', 'Subaru', 'Legacy', 'GT spec.B', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(351, '7142504007', 'AZ1G900P', '2004', 'AZ1G900P', '2011', 'EDM', 'Subaru', 'Forester', 'XT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(352, '7412597207', 'AE5IB00V', '2004', 'AE5IB00V', '2011', 'USDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(353, '7412587107', 'AE5IA10L', '2004', 'AE5IA10L', '2011', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(354, '7144345007', 'EP5D004L', '2004', 'EP5D004L', '2011', 'EDM', 'Subaru', 'Forester', '2.0X', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(355, '6644D87407', 'JZ2F422A', '400C', 'JZ2F422A', '2010', 'EDM', 'Subaru', 'Impreza', '2.0T Diesel', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(356, '6144D87407', 'JP3F522A', '400C', 'JP3F522A', '2011', 'EDM', 'Subaru', 'Forester', '2.0T Diesel', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(357, '74A2594007', 'AZ1G800L', '2004', 'AZ1G800L', '2011', 'SADM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(358, '371240A006', 'A2WC50ZU', 'ca7c2', 'A2WC50ZU', '2004', 'USDM', 'Subaru', 'Baja', 'XT', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(359, '8112595007', 'AE5K500V', '2004', 'AE5K500V', '2012', 'USDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(360, '8112585007', 'AE5K500L', '2004', 'AE5K500L', '2012', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(361, '4D12088006', 'E2UG002L', '2000', 'E2UG002L', '2007', 'USDM', 'Subaru', 'Impreza', '2.5i', 'MT', 'SH7058', 'sti05', '1024kb', NULL);
INSERT INTO `ECU` (`ID`, `ECUID`, `CALID`, `InternalIDAddress`, `InternalIDString`, `Year`, `Market`, `Make`, `Model`, `Submodel`, `Transmission`, `MemModel`, `FlashMethod`, `FileSize`, `ChecksumModule`) VALUES
(362, '8112597007', 'AE5K611V', '2004', 'AE5K611V', '2012', 'USDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(363, '761B347007', 'DE5F810K', '2004', 'DE5F810K', '2011', 'USDM', 'Subaru', 'Tribeca', '3.6L', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(364, '6144D87107', 'JP3F402A', '400C', 'JP3F402A', '2009/10', 'EDM', 'Subaru', 'Forester', '2.0T Diesel', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(365, '6144D87307', 'JP3F511A', '400C', 'JP3F511A', '2009/10', 'EDM', 'Subaru', 'Forester', '2.0T Diesel', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(366, '6644D87307', 'JZ2F411A', '400C', 'JZ2F411A', '2009-11', 'EDM', 'Subaru', 'Impreza', '2.0 Diesel', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(367, '9111D87407', '913F522A', '400C', '913F522A', '2011', 'EDM', 'Subaru', 'Forester', '2.0T Diesel', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(368, '9911D87407', '991F422A', '400C', '991F422A', '2010', 'EDM', 'Subaru', 'Impreza', '2.0T Diesel', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(369, '75121A7307', 'EE5IB20W', '2004', 'EE5IB20W', '2011', 'USDM', 'Subaru', 'Outback', '2.5i', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(370, '73343E4007', 'EP5F300t', '2004', 'EP5F300t', '2012', 'USDM', 'Subaru', 'XV', '2.5i', 'CVT', 'SH7058', 'subarucan', '1024kb', NULL),
(371, '8112587007', 'AE5K611L', '2004', 'AE5K611L', '2012', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(372, '7532164007', 'EE5I500A', '2004', 'EE5I500A', '2011', 'EDM', 'Subaru', 'Outback', '2.5i', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(373, '5B125A6007', 'AE5F301E', '2004', 'AE5F301E', '2010', 'USDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(374, '7C02164007', 'EE5K000K', '2004', 'EE5K000K', '2011', 'JDM', 'Subaru', 'Outback', '2.5i', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(375, '7542564007', 'AE5I500G', '2004', 'AE5I500G', '2011', 'JDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(376, '7404784007', 'AZ1G800T', '2004', 'AZ1G800T', '2011', 'JDM', 'Subaru', 'Impreza', 'WRX spec.C', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(377, '7C22167107', 'EE5K412T', '2004', 'EE5K412T', '2012', 'USDM', 'Subaru', 'Legacy', '2.5i', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(378, '8112587107', 'AE5K700L', '2004', 'AE5K700L', '2012', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(379, '8A12584007', 'AE5L500L', '2004', 'AE5L500L', '2013', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(380, '5B025A4007', 'AE5F300B', '2004', 'AE5F300B', '2009', 'JDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(381, '4B5A347007', 'D2UJ001T', '2000', 'D2UJ001T', '2008', 'ADM', 'Subaru', 'Liberty', '3.0R', 'AT', 'SH7058', 'sti04', '1024kb', NULL),
(382, '7104385007', 'EP5D003Q', '2004', 'EP5D003Q', '2011', 'JDM', 'Subaru', 'Forester', '2.0 XS', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(383, '7132514007', 'AZ1J500V', '2004', 'AZ1J500V', '2011', 'ADM', 'Subaru', 'Forester', 'S-Edition', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(384, '7152345007', 'EP5D202N', '2004', 'EP5D202N', '2012', 'ADM', 'Subaru', 'Forester', '2.5 FB', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(385, '2F5A356006', 'D2ZS002D', '2000', 'D2ZS002D', '2004', 'ADM', 'Subaru', 'Outback', '3.0R', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(386, '7B04507007', 'AZ1J500X', '2004', 'AZ1J500X', '2010', 'JDM', 'Subaru', 'Impreza', 'Exiga', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(387, '8112597107', 'AE5K700V', '2004', 'AE5K700V', '2012', 'USDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(388, '7412587207', 'AE5IB00L', '2004', 'AE5IB00L', '2011', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(389, '8A12784007', 'AE5L500V', '2004', 'AE5L500V', '2013', 'USDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(390, '3C5A347116', 'D2ZY110H', '2000', 'D2ZY110H', '2005', 'ADM', 'Subaru', 'Liberty', '3.0R', 'AT', 'SH7055', 'sti04', '512kb', NULL),
(391, '7012147007', 'EE5I910H', '2004', 'EE5I910H', '2011', 'USDM', 'Subaru', 'Impreza', '2.5i', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(392, '8A04794007', 'AZ1K000T', '2004', 'AZ1K000T', '2012', 'JDM', 'Subaru', 'Impreza', 'STI spec.C', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(393, '5222167407', 'EZ1D303B', '2004', 'EZ1D303B', '2009', 'ADM', 'Subaru', 'Forester', '2.5', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(394, '7522168007', 'EE5I920T', '2004', 'EE5I920T', '2010', 'USDM', 'Subaru', 'Legacy', 'Elite', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(395, '2F1A357206', 'D2ZX110B', '2000', 'D2ZX110B', '2005', 'USDM', 'Subaru', 'Outback', '3.0R', 'AT', 'SH7058', 'sti05', '1024kb', NULL),
(396, '6C52144007', 'EZ1G108N', '2004', 'EZ1G108N', '2009', 'EDM', 'Subaru', 'Forester', '2.5i', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(397, '8424385107', 'EP5I200F', '2004', 'EP5I200F', '2013', 'ADM', 'Subaru', 'Impreza', '2.0i', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(398, '7502564007', 'AE5I001A', '2004', 'AE5I001A', '2011', 'JDM', 'Subaru', 'Legacy', 'GT', 'AT', 'SH7058', 'subarucan', '1024kb', NULL),
(399, '8112597207', 'AE5K800V', '2004', 'AE5K800V', '2012', 'USDM', 'Subaru', 'Impreza', 'STI', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(400, '8112587207', 'AE5K800L', '2004', 'AE5K800L', '2012', 'USDM', 'Subaru', 'Impreza', 'WRX', 'MT', 'SH7058', 'subarucan', '1024kb', NULL),
(401, '7134345007', 'EP5D202X', '2004', 'EP5D202X', '2011', 'EDM', 'Subaru', 'Forester', '2.0X', 'AT', 'SH7058', 'subarucan', '1024kb', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Parameter`
--
DROP TABLE IF EXISTS `Parameter`;
CREATE TABLE IF NOT EXISTS `Parameter` (
  `ParameterID` int(10) unsigned NOT NULL,
  `TypeID` tinyint(3) unsigned NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text,
  `ByteIndex` tinyint(3) unsigned DEFAULT NULL,
  `OffsetBit` tinyint(3) unsigned DEFAULT NULL,
  `Target` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ParameterID`,`TypeID`),
  KEY `TypeID` (`TypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ParameterReference`
--
DROP TABLE IF EXISTS `ParameterReference`;
CREATE TABLE IF NOT EXISTS `ParameterReference` (
  `ParameterID` int(10) unsigned NOT NULL,
  `ParameterTypeID` tinyint(3) unsigned NOT NULL,
  `DependantID` int(10) unsigned NOT NULL,
  `DependantTypeID` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ParameterID`,`ParameterTypeID`,`DependantID`,`DependantTypeID`),
  KEY `ParameterTypeID` (`ParameterTypeID`),
  KEY `DependantID` (`DependantID`),
  KEY `DependantTypeID` (`DependantTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ParameterType`
--
DROP TABLE IF EXISTS `ParameterType`;
CREATE TABLE IF NOT EXISTS `ParameterType` (
  `TypeID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(255) NOT NULL,
  `Prefix` varchar(255) NOT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `ParameterType` (`TypeID`, `Type`, `Prefix`) VALUES
(1, 'Parameter', 'P'),
(2, 'Switch', 'S'),
(3, 'ECU Parameter', 'E');

-- --------------------------------------------------------

--
-- Table structure for table `Parameter_Address`
--
DROP TABLE IF EXISTS `Parameter_Address`;
CREATE TABLE IF NOT EXISTS `Parameter_Address` (
  `ParameterAddressID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ParameterID` int(10) unsigned NOT NULL,
  `TypeID` tinyint(3) unsigned NOT NULL,
  `ECUID` char(10) DEFAULT NULL,
  `AddressID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ParameterAddressID`),
  UNIQUE KEY `ParameterID` (`ParameterID`,`TypeID`,`ECUID`),
  KEY `TypeID` (`TypeID`),
  KEY `ECUID` (`ECUID`),
  KEY `AddressID` (`AddressID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Parameter_Scale`
--
DROP TABLE IF EXISTS `Parameter_Scale`;
CREATE TABLE IF NOT EXISTS `Parameter_Scale` (
  `ParameterID` int(10) unsigned NOT NULL,
  `TypeID` tinyint(3) unsigned NOT NULL,
  `ScaleID` int(10) unsigned NOT NULL,
  `MinValue` decimal(17,8) DEFAULT NULL,
  `MaxValue` decimal(17,8) DEFAULT NULL,
  `Increment` decimal(17,8) DEFAULT NULL,
  PRIMARY KEY (`ParameterID`,`TypeID`,`ScaleID`),
  KEY `TypeID` (`TypeID`),
  KEY `ScaleID` (`ScaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Scale`
--
DROP TABLE IF EXISTS `Scale`;
CREATE TABLE IF NOT EXISTS `Scale` (
  `ScaleID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Units` varchar(255) NOT NULL,
  `ExpressionID` int(10) unsigned NOT NULL,
  `StorageType` enum('uint8','uint16','float','bloblist') DEFAULT NULL,
  PRIMARY KEY (`ScaleID`),
  KEY `ExpressionID` (`ExpressionID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ScaleExpression`
--
DROP TABLE IF EXISTS `ScaleExpression`;
CREATE TABLE IF NOT EXISTS `ScaleExpression` (
  `ExpressionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Expression` varchar(255) NOT NULL,
  `Format` varchar(255) DEFAULT NULL COMMENT 'Format IN same notation used IN printf: %.0f = 0, %.1f = 0.0, etc.',
  PRIMARY KEY (`ExpressionID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Table`
--
DROP TABLE IF EXISTS `Table`;
CREATE TABLE IF NOT EXISTS `Table` (
  `TableID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TypeID` tinyint(3) unsigned NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `Description` text,
  `UserLevel` tinyint(3) unsigned DEFAULT NULL,
  `ParameterID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`TableID`),
  KEY `TypeID` (`TypeID`),
  KEY `ParameterID` (`ParameterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `TableData`
--
DROP TABLE IF EXISTS `TableData`;
CREATE TABLE IF NOT EXISTS `TableData` (
  `DataHash` char(32) NOT NULL DEFAULT '' COMMENT 'MD5 HASH of Static TABLE DATA',
  `Order` tinyint(3) unsigned DEFAULT '0',
  `Value` varchar(255) NOT NULL,
  PRIMARY KEY (`DataHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `TableReference`
--
DROP TABLE IF EXISTS `TableReference`;
CREATE TABLE IF NOT EXISTS `TableReference` (
  `TableID` int(10) unsigned NOT NULL,
  `ChildTableID` int(10) unsigned NOT NULL,
  `ChildTableAxis` enum('X','Y') NOT NULL,
  `DataHash` char(32) DEFAULT NULL COMMENT 'MD5 Hash of Static Table Data',
  PRIMARY KEY (`TableID`,`ChildTableID`),
  KEY `ChildTableID` (`ChildTableID`),
  KEY `DataHash` (`DataHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `TableType`
--
DROP TABLE IF EXISTS `TableType`;
CREATE TABLE IF NOT EXISTS `TableType` (
  `TypeID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `Type` varchar(255) NOT NULL,
  PRIMARY KEY (`TypeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `TableType` (`TypeID`, `Type`) VALUES
(1, 'Static'),
(2, '1D'),
(3, '2D'),
(4, '3D');

-- --------------------------------------------------------

--
-- Table structure for table `Table_Address`
--
DROP TABLE IF EXISTS `Table_Address`;
CREATE TABLE IF NOT EXISTS `Table_Address` (
  `TableAddressID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TableID` int(10) unsigned NOT NULL,
  `CALID` char(10) DEFAULT NULL,
  `AddressID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`TableAddressID`),
  UNIQUE KEY `TableID` (`TableID`,`CALID`),
  KEY `CALID` (`CALID`),
  KEY `AddressID` (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Table_Scale`
--
DROP TABLE IF EXISTS `Table_Scale`;
CREATE TABLE IF NOT EXISTS `Table_Scale` (
  `TableID` int(10) unsigned NOT NULL,
  `ScaleID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`TableID`,`ScaleID`),
  KEY `ScaleID` (`ScaleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Parameter`
--
ALTER TABLE `Parameter`
  ADD CONSTRAINT `Parameter_ibfk_1` FOREIGN KEY (`TypeID`) REFERENCES `ParameterType` (`TypeID`);

--
-- Constraints for table `ParameterReference`
--
ALTER TABLE `ParameterReference`
  ADD CONSTRAINT `ParameterReference_ibfk_1` FOREIGN KEY (`ParameterID`) REFERENCES `Parameter` (`ParameterID`),
  ADD CONSTRAINT `ParameterReference_ibfk_2` FOREIGN KEY (`ParameterTypeID`) REFERENCES `ParameterType` (`TypeID`),
  ADD CONSTRAINT `ParameterReference_ibfk_3` FOREIGN KEY (`DependantID`) REFERENCES `Parameter` (`ParameterID`),
  ADD CONSTRAINT `ParameterReference_ibfk_4` FOREIGN KEY (`DependantTypeID`) REFERENCES `ParameterType` (`TypeID`);

--
-- Constraints for table `Parameter_Address`
--
ALTER TABLE `Parameter_Address`
  ADD CONSTRAINT `Parameter_Address_ibfk_1` FOREIGN KEY (`ParameterID`) REFERENCES `Parameter` (`ParameterID`),
  ADD CONSTRAINT `Parameter_Address_ibfk_2` FOREIGN KEY (`TypeID`) REFERENCES `ParameterType` (`TypeID`),
  ADD CONSTRAINT `Parameter_Address_ibfk_3` FOREIGN KEY (`ECUID`) REFERENCES `ECU` (`ECUID`),
  ADD CONSTRAINT `Parameter_Address_ibfk_4` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`);

--
-- Constraints for table `Parameter_Scale`
--
ALTER TABLE `Parameter_Scale`
  ADD CONSTRAINT `Parameter_Scale_ibfk_1` FOREIGN KEY (`ParameterID`) REFERENCES `Parameter` (`ParameterID`),
  ADD CONSTRAINT `Parameter_Scale_ibfk_2` FOREIGN KEY (`TypeID`) REFERENCES `ParameterType` (`TypeID`),
  ADD CONSTRAINT `Parameter_Scale_ibfk_3` FOREIGN KEY (`ScaleID`) REFERENCES `Scale` (`ScaleID`);

--
-- Constraints for table `Scale`
--
ALTER TABLE `Scale`
  ADD CONSTRAINT `Scale_ibfk_1` FOREIGN KEY (`ExpressionID`) REFERENCES `ScaleExpression` (`ExpressionID`);

--
-- Constraints for table `Table`
--
ALTER TABLE `Table`
  ADD CONSTRAINT `Table_ibfk_1` FOREIGN KEY (`TypeID`) REFERENCES `TableType` (`TypeID`),
  ADD CONSTRAINT `Table_ibfk_2` FOREIGN KEY (`ParameterID`) REFERENCES `Parameter` (`ParameterID`);

--
-- Constraints for table `TableReference`
--
ALTER TABLE `TableReference`
  ADD CONSTRAINT `TableReference_ibfk_1` FOREIGN KEY (`TableID`) REFERENCES `Table` (`TableID`),
  ADD CONSTRAINT `TableReference_ibfk_2` FOREIGN KEY (`ChildTableID`) REFERENCES `Table` (`TableID`),
  ADD CONSTRAINT `TableReference_ibfk_3` FOREIGN KEY (`DataHash`) REFERENCES `TableData` (`DataHash`);

--
-- Constraints for table `Table_Address`
--
ALTER TABLE `Table_Address`
  ADD CONSTRAINT `Table_Address_ibfk_1` FOREIGN KEY (`TableID`) REFERENCES `Table` (`TableID`),
  ADD CONSTRAINT `Table_Address_ibfk_2` FOREIGN KEY (`CALID`) REFERENCES `ECU` (`CALID`),
  ADD CONSTRAINT `Table_Address_ibfk_3` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`);

--
-- Constraints for table `Table_Scale`
--
ALTER TABLE `Table_Scale`
  ADD CONSTRAINT `Table_Scale_ibfk_1` FOREIGN KEY (`TableID`) REFERENCES `Table` (`TableID`),
  ADD CONSTRAINT `Table_Scale_ibfk_2` FOREIGN KEY (`ScaleID`) REFERENCES `Scale` (`ScaleID`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
