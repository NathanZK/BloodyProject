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
  `admin_info_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `persona_info_ID_idx` (`admin_info_ID`),
  CONSTRAINT `admin_info_ID` FOREIGN KEY (`admin_info_ID`) REFERENCES `personal_info` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donation_history`
--

DROP TABLE IF EXISTS `donation_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation_history` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Date_donated` date NOT NULL,
  `Blood_Status` enum('Expired','Viable') NOT NULL,
  `Donation_Location` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation_history`
--

LOCK TABLES `donation_history` WRITE;
/*!40000 ALTER TABLE `donation_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `donation_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donor` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Gender` enum('Male','Female') NOT NULL,
  `Bday` date NOT NULL,
  `donor_info_ID` int NOT NULL,
  `donor_health_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `donor_infO_ID_idx` (`donor_info_ID`),
  KEY `donor_health_ID_idx` (`donor_health_ID`),
  CONSTRAINT `donor_health_ID` FOREIGN KEY (`donor_health_ID`) REFERENCES `donor_health` (`ID`),
  CONSTRAINT `donor_infO_ID` FOREIGN KEY (`donor_info_ID`) REFERENCES `personal_info` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
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
  `health_info_ID` int NOT NULL,
  `inventory_ID` int NOT NULL,
  `test_result_ID` int NOT NULL,
  `donation_history_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `health_info_ID_idx` (`health_info_ID`),
  KEY `inventory_ID_idx` (`inventory_ID`),
  KEY `test_result_ID_idx` (`test_result_ID`),
  KEY `donation_history_ID_idx` (`donation_history_ID`),
  CONSTRAINT `donation_history_ID` FOREIGN KEY (`donation_history_ID`) REFERENCES `donation_history` (`ID`),
  CONSTRAINT `health_info_ID` FOREIGN KEY (`health_info_ID`) REFERENCES `health_info` (`ID`),
  CONSTRAINT `inventory_ID` FOREIGN KEY (`inventory_ID`) REFERENCES `inventory` (`ID`),
  CONSTRAINT `test_result_ID` FOREIGN KEY (`test_result_ID`) REFERENCES `test_result` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor_health`
--

LOCK TABLES `donor_health` WRITE;
/*!40000 ALTER TABLE `donor_health` DISABLE KEYS */;
/*!40000 ALTER TABLE `donor_health` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_info`
--

DROP TABLE IF EXISTS `health_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_info` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Blood_type` enum('A','B','AB','O') NOT NULL,
  `RhesusFactor` enum('+','-') NOT NULL,
  `Risks` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_info`
--

LOCK TABLES `health_info` WRITE;
/*!40000 ALTER TABLE `health_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `health_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Amount` double NOT NULL,
  `BloodBagNo` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_info`
--

DROP TABLE IF EXISTS `personal_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_info` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `PhoneNo` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_info`
--

LOCK TABLES `personal_info` WRITE;
/*!40000 ALTER TABLE `personal_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_result`
--

DROP TABLE IF EXISTS `test_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_result` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Diseases` varchar(100) NOT NULL,
  `Heamoglobin` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_result`
--

LOCK TABLES `test_result` WRITE;
/*!40000 ALTER TABLE `test_result` DISABLE KEYS */;
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

-- Dump completed on 2022-01-14 11:05:33
