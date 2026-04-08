CREATE DATABASE  IF NOT EXISTS `azienda` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `azienda`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: azienda
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
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Citta` varchar(45) NOT NULL,
  `Regione` varchar(45) NOT NULL,
  `AreaGeografica` varchar(45) NOT NULL,
  `CodiceRegione` int NOT NULL,
  PRIMARY KEY (`ID`,`CodiceRegione`),
  UNIQUE KEY `CodiceRegione_UNIQUE` (`CodiceRegione`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (4,'Lamezia Terme','Calabria','Sud',18),(5,'Roma','Lazio','Centro',12),(6,'Milano','Lombardia','Nord',3),(7,'Torino','Piemonte','Nord',1),(8,'Aosta','Valle d\'Aosta','Nord',2),(9,'Genova','Liguria','Nord',7),(10,'Venezia','Veneto','Nord',5),(11,'Trento','Trentino-Alto Adige','Nord',4),(12,'Trieste','Friuli-Venezia Giulia','Nord',6),(13,'Bologna','Emilia-Romagna','Nord',8),(14,'Firenze','Toscana','Centro',9),(15,'Ancona','Marche','Centro',11),(16,'Perugia','Umbria','Centro',10),(17,'Napoli','Campania','Sud',15),(18,'Bari','Puglia','Sud',16),(19,'Potenza','Basilicata','Sud',17),(20,'L\'Aquila','Abruzzo','Sud',13),(21,'Campobasso','Molise','Sud',14),(22,'Palermo','Sicilia','Sud',19),(23,'Cagliari','Sardegna','Sud',20);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-08 17:46:34
