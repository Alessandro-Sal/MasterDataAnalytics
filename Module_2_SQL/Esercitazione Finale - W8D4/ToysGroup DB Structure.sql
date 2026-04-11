-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: toysgroup
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `ID_Category` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_Category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `ID_Customer` int NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(45) NOT NULL,
  `CustomerSurname` varchar(45) NOT NULL,
  `Age` int NOT NULL,
  `FiscalCode` varchar(16) NOT NULL,
  `E-mail` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `PostalCode` varchar(45) NOT NULL,
  `Nationality` varchar(2) NOT NULL,
  `ID_Gender` int NOT NULL,
  PRIMARY KEY (`ID_Customer`,`FiscalCode`),
  UNIQUE KEY `PostalCode_UNIQUE` (`PostalCode`),
  UNIQUE KEY `FiscalCode_UNIQUE` (`FiscalCode`),
  KEY `FK_GenderOrderPerson_idx` (`ID_Gender`),
  CONSTRAINT `FK_GenderCustomer` FOREIGN KEY (`ID_Gender`) REFERENCES `gender` (`ID_Gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `ID_Gender` int NOT NULL AUTO_INCREMENT,
  `GenderDescription` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Gender`),
  UNIQUE KEY `ID_Gender_UNIQUE` (`ID_Gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderchannel`
--

DROP TABLE IF EXISTS `orderchannel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderchannel` (
  `ID_Channel` int NOT NULL AUTO_INCREMENT,
  `ChannelDescription` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Channel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ID_Product` int NOT NULL,
  `ID_Category` int NOT NULL,
  `ProductName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_Product`),
  UNIQUE KEY `ID_Product_UNIQUE` (`ID_Product`),
  KEY `FK_Category_Product_idx` (`ID_Category`),
  CONSTRAINT `FK_Category_Product` FOREIGN KEY (`ID_Category`) REFERENCES `category` (`ID_Category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `ID_Region` int NOT NULL AUTO_INCREMENT,
  `RegionName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_Region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `ID_Sales` int NOT NULL AUTO_INCREMENT,
  `ID_Product` int NOT NULL,
  `ID_State` int NOT NULL,
  `DateOrder` datetime NOT NULL,
  `Quantity` int NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `ID_Customer` int NOT NULL,
  `ID_OrderChannel` int NOT NULL,
  PRIMARY KEY (`ID_Sales`),
  KEY `FK_Sales_Product_idx` (`ID_Product`),
  KEY `FK_Sales_State_idx` (`ID_State`),
  KEY `FK_Sales_UserInsertSales_idx` (`ID_Customer`),
  KEY `FK_Sales_OrderChannel_idx` (`ID_OrderChannel`),
  CONSTRAINT `FK_Sales_Customer` FOREIGN KEY (`ID_Customer`) REFERENCES `customer` (`ID_Customer`),
  CONSTRAINT `FK_Sales_OrderChannel` FOREIGN KEY (`ID_OrderChannel`) REFERENCES `orderchannel` (`ID_Channel`),
  CONSTRAINT `FK_Sales_Product` FOREIGN KEY (`ID_Product`) REFERENCES `product` (`ID_Product`),
  CONSTRAINT `FK_Sales_State` FOREIGN KEY (`ID_State`) REFERENCES `state` (`ID_State`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `ID_State` int NOT NULL,
  `StateName` varchar(45) DEFAULT NULL,
  `ID_Region` int NOT NULL,
  PRIMARY KEY (`ID_State`),
  UNIQUE KEY `ID_State_UNIQUE` (`ID_State`),
  KEY `FK_State_Region_idx` (`ID_Region`),
  CONSTRAINT `FK_State_Region` FOREIGN KEY (`ID_Region`) REFERENCES `region` (`ID_Region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-11 10:45:18
