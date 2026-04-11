CREATE DATABASE  IF NOT EXISTS `toysgroup` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `toysgroup`;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Bikes'),(2,'Clothing'),(3,'Action Figures'),(4,'Board Games'),(5,'Educational'),(6,'Video Games');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

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
  `Email` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `PostalCode` varchar(45) NOT NULL,
  `Nationality` varchar(2) NOT NULL,
  `ID_Gender` int NOT NULL,
  PRIMARY KEY (`ID_Customer`,`FiscalCode`),
  UNIQUE KEY `PostalCode_UNIQUE` (`PostalCode`),
  UNIQUE KEY `FiscalCode_UNIQUE` (`FiscalCode`),
  KEY `FK_GenderOrderPerson_idx` (`ID_Gender`),
  CONSTRAINT `FK_GenderCustomer` FOREIGN KEY (`ID_Gender`) REFERENCES `gender` (`ID_Gender`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Mario','Rossi',35,'RSSMRA80A01H501A','mario.rossi@email.it','Via Roma 1','00100','IT',1),(2,'Julie','Blanc',28,'JLBNC95B44Z110Q','julie.blanc@email.fr','Rue de Paris 15','75001','FR',2),(3,'John','Smith',42,'SMTJHN80M01Z404X','john.smith@email.com','Broadway 100','10001','US',1),(4,'Lucia','Garcia',30,'LGCRA96C12Z120W','lucia.garcia@email.es','Calle Sol 2','28001','ES',2),(5,'Kenji','Sato',25,'KJSAT01A11Z200K','kenji.sato@email.jp','Tokyo St 5','100-0001','JP',1),(6,'Anna','Muller',50,'ANMLLR76D22Z110P','anna.muller@email.de','Berlin Weg 10','10115','DE',2),(7,'Alex','Taylor',33,'AXTYL90E05Z300B','alex.taylor@email.ca','Maple Ave 44','M5V 2H1','CA',3),(8,'Elena','Conti',22,'CNTLNE04F15H501V','elena.conti@email.it','Piazza Napoli 3','80100','IT',2);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'Male'),(2,'Female'),(3,'Non-Binary'),(4,'Prefer not to say');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `info_geography`
--

DROP TABLE IF EXISTS `info_geography`;
/*!50001 DROP VIEW IF EXISTS `info_geography`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_geography` AS SELECT 
 1 AS `State`,
 1 AS `Region`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `info_product`
--

DROP TABLE IF EXISTS `info_product`;
/*!50001 DROP VIEW IF EXISTS `info_product`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_product` AS SELECT 
 1 AS `Prodotto`,
 1 AS `Categoria`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderchannel`
--

LOCK TABLES `orderchannel` WRITE;
/*!40000 ALTER TABLE `orderchannel` DISABLE KEYS */;
INSERT INTO `orderchannel` VALUES (1,'Online Store'),(2,'Physical Retail'),(3,'Direct Catalog'),(4,'Mobile App');
/*!40000 ALTER TABLE `orderchannel` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (101,1,'Mountain Bike Pro'),(102,1,'City Cruiser Bike'),(103,2,'Bike Glove M'),(104,2,'Bike Glove L'),(105,3,'Robot Avenger X'),(106,3,'Space Ranger Buzz'),(107,4,'Monopoly Classic'),(108,4,'Chess Wooden Set'),(109,5,'Science Kit Basic'),(110,5,'Telescope Beginner'),(111,6,'Racing Game 2026'),(112,6,'Adventure RPG'),(115,1,'Carbon Fiber Road Bike'),(120,3,'Dragon Warrior Limited Edition');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'WestEurope'),(2,'SouthEurope'),(3,'NorthAmerica'),(4,'AsiaPacific');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,101,12,'2025-08-15 10:00:00',1,450.00,1,1),(2,103,10,'2025-08-15 10:00:00',2,50.00,2,1),(3,105,12,'2026-01-15 09:15:00',1,60.00,1,2),(4,102,15,'2026-01-20 18:20:00',1,350.00,3,1),(5,104,10,'2025-09-20 14:30:00',3,75.00,2,3),(6,107,11,'2026-02-05 14:00:00',1,30.00,6,2),(7,108,14,'2026-02-10 16:30:00',2,90.00,4,1),(8,110,17,'2026-02-14 10:00:00',1,120.00,5,4),(9,111,15,'2026-02-20 20:15:00',1,60.00,3,1),(10,106,12,'2026-03-01 09:45:00',4,100.00,8,2),(11,109,16,'2026-03-05 11:20:00',1,40.00,7,4),(12,101,15,'2026-03-10 13:10:00',1,450.00,3,1),(13,112,11,'2026-03-15 17:00:00',1,70.00,6,2),(14,105,14,'2026-03-20 12:30:00',2,120.00,4,4),(15,107,17,'2026-04-02 15:50:00',1,30.00,5,1),(16,103,16,'2026-04-05 09:30:00',1,25.00,7,3),(17,108,12,'2026-04-08 14:40:00',1,45.00,8,2),(18,110,10,'2026-04-10 10:15:00',1,120.00,2,4),(19,102,11,'2026-04-11 08:00:00',1,350.00,6,1);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (10,'France',1),(11,'Germany',1),(12,'Italy',2),(13,'Greece',2),(14,'Spain',2),(15,'USA',3),(16,'Canada',3),(17,'Japan',4),(18,'Australia',4);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `info_geography`
--

/*!50001 DROP VIEW IF EXISTS `info_geography`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_geography` AS select concat(`st`.`ID_State`,' - ',`st`.`StateName`) AS `State`,concat(`r`.`ID_Region`,' - ',`r`.`RegionName`) AS `Region` from (`state` `st` join `region` `r` on((`st`.`ID_Region` = `r`.`ID_Region`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `info_product`
--

/*!50001 DROP VIEW IF EXISTS `info_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_product` AS select concat(`p`.`ID_Product`,' - ',`p`.`ProductName`) AS `Prodotto`,concat(`c`.`ID_Category`,' - ',`c`.`CategoryName`) AS `Categoria` from (`product` `p` join `category` `c` on((`p`.`ID_Category` = `c`.`ID_Category`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-11 15:39:27
