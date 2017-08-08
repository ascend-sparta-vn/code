-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: web-trucking-dev
-- ------------------------------------------------------
-- Server version	5.6.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `account_detail_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_signin_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (1,'sonph','0af1dbf0a5bfcbf17a2ec0563a3289af',NULL,NULL,NULL,'2016-11-12 11:25:54','2016-11-12 11:34:22');
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Account_Detail`
--

DROP TABLE IF EXISTS `Account_Detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account_Detail` (
  `id` int(11) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `company_start_year` int(11) DEFAULT NULL,
  `company_employee_total` int(11) DEFAULT NULL,
  `company_iso` varchar(45) DEFAULT NULL,
  `company_role` varchar(45) DEFAULT NULL,
  `company_director_name` varchar(45) DEFAULT NULL,
  `company_tax_code` varchar(45) DEFAULT NULL,
  `company_phone_number` varchar(45) DEFAULT NULL,
  `company_bussiness_license` varchar(45) DEFAULT NULL,
  `account_bank_name` varchar(45) DEFAULT NULL,
  `account_bank_number` varchar(45) DEFAULT NULL,
  `bank_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account_Detail`
--

LOCK TABLES `Account_Detail` WRITE;
/*!40000 ALTER TABLE `Account_Detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `Account_Detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Goods_Type`
--

DROP TABLE IF EXISTS `Goods_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Goods_Type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Goods_Type`
--

LOCK TABLES `Goods_Type` WRITE;
/*!40000 ALTER TABLE `Goods_Type` DISABLE KEYS */;
/*!40000 ALTER TABLE `Goods_Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Owner_Truck`
--

DROP TABLE IF EXISTS `Owner_Truck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Owner_Truck` (
  `id` int(11) NOT NULL,
  `owner_name` varchar(45) DEFAULT NULL,
  `owner_address` varchar(45) DEFAULT NULL,
  `owner_status` varchar(45) DEFAULT NULL,
  `owner_phone_number` varchar(45) DEFAULT NULL,
  `owner_type` varchar(45) DEFAULT NULL,
  `owner_account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Owner_Truck`
--

LOCK TABLES `Owner_Truck` WRITE;
/*!40000 ALTER TABLE `Owner_Truck` DISABLE KEYS */;
/*!40000 ALTER TABLE `Owner_Truck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Province`
--

DROP TABLE IF EXISTS `Province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Province` (
  `id` int(11) NOT NULL,
  `province_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Province`
--

LOCK TABLES `Province` WRITE;
/*!40000 ALTER TABLE `Province` DISABLE KEYS */;
/*!40000 ALTER TABLE `Province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shipment`
--

DROP TABLE IF EXISTS `Shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Shipment` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `transaction_type_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `goods_type_id` int(11) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `to_address` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `finish_date` datetime DEFAULT NULL,
  `distance` double DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `agency` varchar(45) DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `expired_date` datetime DEFAULT NULL,
  `tracking_trip` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shipment`
--

LOCK TABLES `Shipment` WRITE;
/*!40000 ALTER TABLE `Shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transaction_Type`
--

DROP TABLE IF EXISTS `Transaction_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transaction_Type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaction_Type`
--

LOCK TABLES `Transaction_Type` WRITE;
/*!40000 ALTER TABLE `Transaction_Type` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transaction_Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Truck`
--

DROP TABLE IF EXISTS `Truck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Truck` (
  `id` int(11) NOT NULL,
  `truck_code` varchar(45) DEFAULT NULL,
  `truck_type` varchar(45) DEFAULT NULL,
  `owner_truck_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Truck`
--

LOCK TABLES `Truck` WRITE;
/*!40000 ALTER TABLE `Truck` DISABLE KEYS */;
/*!40000 ALTER TABLE `Truck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Truck_Info_Detail`
--

DROP TABLE IF EXISTS `Truck_Info_Detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Truck_Info_Detail` (
  `id` int(11) NOT NULL,
  `truck_id` int(11) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `to_address` varchar(255) DEFAULT NULL,
  `goods_type_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `post_date` datetime DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `expired_date` datetime DEFAULT NULL,
  `agency` varchar(45) DEFAULT NULL,
  `tracking_trip` varchar(1000) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Truck_Info_Detail`
--

LOCK TABLES `Truck_Info_Detail` WRITE;
/*!40000 ALTER TABLE `Truck_Info_Detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `Truck_Info_Detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Truck_Type`
--

DROP TABLE IF EXISTS `Truck_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Truck_Type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Truck_Type`
--

LOCK TABLES `Truck_Type` WRITE;
/*!40000 ALTER TABLE `Truck_Type` DISABLE KEYS */;
/*!40000 ALTER TABLE `Truck_Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Roles`
--

DROP TABLE IF EXISTS `User_Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Roles` (
  `id` int(11) NOT NULL,
  `role` varchar(45) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Roles`
--

LOCK TABLES `User_Roles` WRITE;
/*!40000 ALTER TABLE `User_Roles` DISABLE KEYS */;
INSERT INTO `User_Roles` VALUES (1,'ROLE_ADMIN',1);
/*!40000 ALTER TABLE `User_Roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-12 11:56:09
