CREATE DATABASE  IF NOT EXISTS `blooddonation` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `blooddonation`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: blooddonation
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Gender` enum('Male','Female') NOT NULL,
  `Bday` date NOT NULL,
  `admin_info_ID` varchar(50) NOT NULL,
  `Photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `admin_ID_idx` (`admin_info_ID`),
  CONSTRAINT `admin_ID` FOREIGN KEY (`admin_info_ID`) REFERENCES `personal_info` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Nathan Zelalem','a@gmail.com','Male','1999-02-01','NatZel','/assets/AdminPhotos/admin.png'),(2,'Lillian Alehegn','l@gmail.com','Female','2000-01-31','LilAle','/assets/AdminPhotos/admin2.png'),(3,'Bisrat Ashagre','bisbis@gmail.com','Male','2000-01-15','BisAsh','/assets/AdminPhotos/admin3.png');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `donor_username` varchar(50) NOT NULL,
  `dateTime_of_appointment` datetime NOT NULL,
  `location` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `donor_username_idx` (`donor_username`),
  CONSTRAINT `donor_username` FOREIGN KEY (`donor_username`) REFERENCES `donor` (`donor_info_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'NahBeh','2022-01-25 03:30:00','Stadium Blood Bank');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation_history`
--

DROP TABLE IF EXISTS `donation_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation_history` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Blood_Status` enum('Expired','Viable') NOT NULL,
  `Donation_Location` varchar(100) NOT NULL,
  `Date_Donated` date NOT NULL,
  `Duration` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation_history`
--

LOCK TABLES `donation_history` WRITE;
/*!40000 ALTER TABLE `donation_history` DISABLE KEYS */;
INSERT INTO `donation_history` VALUES (1,'Viable','Stadium','2020-03-06','20 mins'),(2,'Viable','Bole','2022-01-05','30 mins'),(3,'Expired','Megenagna','2020-03-06','25 mins'),(4,'Expired','Kolfe','2020-03-06','25 mins');
/*!40000 ALTER TABLE `donation_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donor` (
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Gender` enum('Male','Female') NOT NULL,
  `Bday` date NOT NULL,
  `donor_info_ID` varchar(50) NOT NULL,
  PRIMARY KEY (`Email`),
  KEY `donor_info_ID_idx` (`donor_info_ID`),
  CONSTRAINT `donor_info_ID` FOREIGN KEY (`donor_info_ID`) REFERENCES `personal_info` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` VALUES ('Joshua','Tadesse','eshewwww@gmail.com','Male','2022-02-09','JosTad'),('Lealem','Kinfe','l@gmail.com','Male','2000-01-01','LeaKin'),('Nahom','Behailu','n@gmail.com','Male','2000-01-04','NahBeh'),('Natnael','Tedros','nati@gmail.com','Male','2000-03-10','NatTed');
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor_health`
--

DROP TABLE IF EXISTS `donor_health`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donor_health` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `health_info_ID` int DEFAULT NULL,
  `inventory_ID` int DEFAULT NULL,
  `test_result_ID` int DEFAULT NULL,
  `donation_history_ID` int DEFAULT NULL,
  `donor_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `health_info_ID_idx` (`health_info_ID`),
  KEY `donation_history_ID_idx` (`donation_history_ID`),
  KEY `test_result_ID_idx` (`test_result_ID`),
  KEY `inventory_ID_idx` (`inventory_ID`),
  KEY `donor_ID_idx` (`donor_ID`),
  CONSTRAINT `donation_history_ID` FOREIGN KEY (`donation_history_ID`) REFERENCES `donation_history` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `donor_ID` FOREIGN KEY (`donor_ID`) REFERENCES `donor` (`donor_info_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `health_info_ID` FOREIGN KEY (`health_info_ID`) REFERENCES `dynamic_health_info` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventory_ID` FOREIGN KEY (`inventory_ID`) REFERENCES `inventory` (`BloodBagNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `test_result_ID` FOREIGN KEY (`test_result_ID`) REFERENCES `test_result` (`Testtube_No`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor_health`
--

LOCK TABLES `donor_health` WRITE;
/*!40000 ALTER TABLE `donor_health` DISABLE KEYS */;
INSERT INTO `donor_health` VALUES (1,1,12345,124562,2,'LeaKin'),(2,4,11111,123432,1,'NahBeh'),(3,5,22222,696969,3,'NatTed'),(4,7,99999,934433,4,'NahBeh');
/*!40000 ALTER TABLE `donor_health` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamic_health_info`
--

DROP TABLE IF EXISTS `dynamic_health_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dynamic_health_info` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Weight` double NOT NULL,
  `Haemoglobin_Level` double NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_health_info`
--

LOCK TABLES `dynamic_health_info` WRITE;
/*!40000 ALTER TABLE `dynamic_health_info` DISABLE KEYS */;
INSERT INTO `dynamic_health_info` VALUES (1,65,120),(2,70,110),(3,75,112),(4,60,123),(5,55,133),(6,80,132),(7,82,134);
/*!40000 ALTER TABLE `dynamic_health_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `BloodBagNo` int NOT NULL,
  `Amount` double NOT NULL,
  PRIMARY KEY (`BloodBagNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (11111,450),(12345,350),(22222,350),(99999,350);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_info`
--

DROP TABLE IF EXISTS `personal_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_info` (
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `PhoneNo` int NOT NULL,
  `City` varchar(100) NOT NULL,
  `Subcity` varchar(45) NOT NULL,
  `Woreda` varchar(45) NOT NULL,
  `HouseNumber` varchar(45) NOT NULL,
  PRIMARY KEY (`Username`),
  UNIQUE KEY `Username_UNIQUE` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_info`
--

LOCK TABLES `personal_info` WRITE;
/*!40000 ALTER TABLE `personal_info` DISABLE KEYS */;
INSERT INTO `personal_info` VALUES ('BisAsh','4444',969696969,'A.A','Bole','03','122'),('JosTad','kkbv2',934341281,'Addis Ababa','Yert','9','564'),('LeaKin','3333',911232328,'Everywhere','Bole','09','234'),('LilAle','2222',911232327,'Here','Kolfe','02','123'),('NahBeh','1111',943555555,'Adama','Rep','09','123'),('NatTed','0069',934341281,'Addis Ababa','Kolfe Keranyo','09','123'),('NatZel','0000',911232323,'A.A','Bole','01','new');
/*!40000 ALTER TABLE `personal_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_health_info`
--

DROP TABLE IF EXISTS `static_health_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `static_health_info` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Blood_type` enum('A','B','AB','O') NOT NULL,
  `RhesusFactor` enum('+','-') NOT NULL,
  `donorUsername` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `donorUsername_UNIQUE` (`donorUsername`),
  KEY `donor_ID_idx` (`donorUsername`),
  CONSTRAINT `donorUsername` FOREIGN KEY (`donorUsername`) REFERENCES `donor` (`donor_info_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_health_info`
--

LOCK TABLES `static_health_info` WRITE;
/*!40000 ALTER TABLE `static_health_info` DISABLE KEYS */;
INSERT INTO `static_health_info` VALUES (1,'O','-','NahBeh'),(2,'AB','+','NatTed'),(3,'A','+','LeaKin');
/*!40000 ALTER TABLE `static_health_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_result`
--

DROP TABLE IF EXISTS `test_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_result` (
  `Testtube_No` int NOT NULL AUTO_INCREMENT,
  `HIV` enum('Positive','Negative') NOT NULL,
  `HepatitisB` enum('Positive','Negative') NOT NULL,
  `HepatitisC` enum('Positive','Negative') NOT NULL,
  `Chlamydia` enum('Positive','Negative') NOT NULL,
  `Syphilis` enum('Positive','Negative') NOT NULL,
  `Date_Tested` date NOT NULL,
  `Counseling` enum('Received','Not Received') DEFAULT NULL,
  `Approved_By` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Testtube_No`),
  UNIQUE KEY `Testtube_No_UNIQUE` (`Testtube_No`),
  KEY `Approved_By_idx` (`Approved_By`),
  CONSTRAINT `Approved_By` FOREIGN KEY (`Approved_By`) REFERENCES `admin` (`admin_info_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=934434 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_result`
--

LOCK TABLES `test_result` WRITE;
/*!40000 ALTER TABLE `test_result` DISABLE KEYS */;
INSERT INTO `test_result` VALUES (123432,'Negative','Negative','Negative','Negative','Negative','2020-03-06','Received','NatZel'),(124562,'Negative','Negative','Positive','Negative','Positive','2022-01-05','Received','LilAle'),(696969,'Negative','Negative','Negative','Negative','Positive','2020-03-06','Received','NatZel'),(934433,'Positive','Negative','Positive','Positive','Positive','2021-01-06','Not Received',NULL);
/*!40000 ALTER TABLE `test_result` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-14  4:54:33
