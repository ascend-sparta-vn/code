CREATE DATABASE  IF NOT EXISTS `laprapcuaso` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `laprapcuaso`;

-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: laprapcuaso
-- ------------------------------------------------------
-- Server version	5.7.11-enterprise-commercial-advanced-log

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
-- Table structure for table `tbo_cau_hinh_cua_phu_kien`
--

DROP TABLE IF EXISTS `tbo_cau_hinh_cua_phu_kien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbo_cau_hinh_cua_phu_kien` (
  `id_cau_hinh` int(11) NOT NULL AUTO_INCREMENT,
  `cua` int(11) NOT NULL,
  `phu_kien` int(11) NOT NULL,
  `bat_buoc` varchar(1) DEFAULT 'K',
  PRIMARY KEY (`id_cau_hinh`),
  KEY `fk_cua_idx` (`cua`),
  KEY `fk_phu_kien_idx` (`phu_kien`),
  CONSTRAINT `fk_cua` FOREIGN KEY (`cua`) REFERENCES `tbo_cua` (`id_cua`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_phu_kien` FOREIGN KEY (`phu_kien`) REFERENCES `tbo_phu_kien` (`id_phu_kien`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbo_cau_hinh_cua_phu_kien`
--

LOCK TABLES `tbo_cau_hinh_cua_phu_kien` WRITE;
/*!40000 ALTER TABLE `tbo_cau_hinh_cua_phu_kien` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbo_cau_hinh_cua_phu_kien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbo_cua`
--

DROP TABLE IF EXISTS `tbo_cua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbo_cua` (
  `id_cua` int(11) NOT NULL AUTO_INCREMENT,
  `ten_cua` varchar(100) DEFAULT NULL,
  `code_cua` varchar(45) DEFAULT NULL,
  `loai_cua` varchar(45) DEFAULT NULL,
  `so_canh` int(11) DEFAULT NULL,
  `he_cua` varchar(45) DEFAULT NULL,
  `kieu_cua` varchar(45) DEFAULT NULL,
  `he_mo` varchar(45) DEFAULT NULL,
  `he_profile` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cua`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbo_cua`
--

LOCK TABLES `tbo_cua` WRITE;
/*!40000 ALTER TABLE `tbo_cua` DISABLE KEYS */;
INSERT INTO `tbo_cua` VALUES (1,'S1',NULL,'Cửa đi',1,'Concept','Advance','Mở trong, mở ngoài','X6,X8'),(2,'D1',NULL,'Cửa đi',2,'Select','Basic','Mở trong, mở ngoài','X6,X8');
/*!40000 ALTER TABLE `tbo_cua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbo_phu_kien`
--

DROP TABLE IF EXISTS `tbo_phu_kien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbo_phu_kien` (
  `id_phu_kien` int(11) NOT NULL AUTO_INCREMENT,
  `code_phu_kien` varchar(45) DEFAULT NULL,
  `ten_phu_kien` varchar(100) DEFAULT NULL,
  `mieu_ta` varchar(200) DEFAULT NULL,
  `kich_thuoc_toi_thieu` int(11) DEFAULT '0',
  `kich_thuoc_toi_da` int(11) DEFAULT '0',
  `co_dinh` int(1) DEFAULT '0',
  `huong_phu_kien` varchar(1) DEFAULT NULL,
  `phu_kien_phu_thuoc` int(11) DEFAULT '0',
  `so_vau` int(11) NOT NULL DEFAULT '0',
  `category` varchar(100) DEFAULT NULL,
  `gia_order` float DEFAULT '0',
  `gia_ve_viet_nam` float DEFAULT '0',
  `gia_ban_si` float DEFAULT '0',
  `gia_ban_le` float DEFAULT '0',
  PRIMARY KEY (`id_phu_kien`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbo_phu_kien`
--

LOCK TABLES `tbo_phu_kien` WRITE;
/*!40000 ALTER TABLE `tbo_phu_kien` DISABLE KEYS */;
INSERT INTO `tbo_phu_kien` VALUES (1,'2847141','OS1.600','FFB 370 - 600',0,600,0,NULL,NULL,0,NULL,1.35,50625,NULL,NULL),(2,'4928979','OS2.800','FFB 600 - 800',0,800,0,NULL,NULL,0,NULL,1.74,65250,NULL,NULL),(3,'2848275','OS2.1025-1','FFB 775 - 1025',0,1025,0,NULL,NULL,0,NULL,2.06,77250,NULL,NULL),(4,'2848291','OS2.1250-1','FFB 1000 - 1250',0,1250,0,NULL,NULL,0,NULL,2.38,89250,NULL,NULL),(5,'2848304','OS2.1475-1','FFB 1225 - 1475',0,1475,0,NULL,NULL,0,NULL,2.82,105750,NULL,NULL),(6,'2858289','SK1.20-13.RS.WS ','Dùng cho OS1, thanh giằng trên ',0,NULL,0,'R',NULL,0,NULL,1.35,50625,NULL,NULL),(7,'2858406','SK1.20-13.LS.WS ','Dùng cho OS1, thanh giằng trên ',0,NULL,0,'L',NULL,0,NULL,1.35,50625,NULL,NULL),(8,'2858684','SK2.20-13.RS.WS ','Dùng cho OS2, thanh giằng trên ',0,NULL,0,'R',NULL,0,NULL,1.66,62250,NULL,NULL),(9,'2858730','SK2.20-13.LS.WS ','Dùng cho OS2, thanh giằng trên ',0,NULL,0,'L',NULL,0,NULL,1.66,62250,NULL,NULL),(10,'2841823','E1',NULL,0,NULL,1,NULL,NULL,0,NULL,0.93,34875,NULL,NULL),(11,'2842244','E3','Dùng cho OS1, chọn 1',0,NULL,0,NULL,NULL,0,NULL,0.99,37125,NULL,NULL),(12,'2842017','E2','Dùng cho OS2, chọn 1',0,NULL,0,NULL,NULL,0,NULL,0.93,34875,NULL,NULL),(13,'1934850','FWV 20-13 LS SL/WS','Bản lề dưới lắp thanh cánh ',0,NULL,0,'L',NULL,0,NULL,1.53,57375,NULL,NULL),(14,'1935035','FWV 20-13 RS SL/WS','Bản lề dưới lắp thanh cánh ',0,NULL,0,'R',NULL,0,NULL,1.53,57375,NULL,NULL),(15,'2301624','FLK FWV LS WS ','Bản lề dưới lắp thanh cánh ',0,NULL,0,'L',NULL,0,NULL,0.1,3750,NULL,NULL),(16,'2301616','FLK FWV RS WS','Bản lề dưới lắp thanh cánh ',0,NULL,0,'R',NULL,0,NULL,0.1,3750,NULL,NULL),(17,'1521617','FLS FWV WS','Bản lề dưới lắp thanh cánh ',0,NULL,0,NULL,NULL,0,NULL,0.03,1125,NULL,NULL),(18,'4990509','ELK ESV WS ',' Bản lề dưới lắp thanh khung',0,NULL,0,NULL,NULL,0,NULL,0.03,1125,NULL,NULL),(19,'1930470','ESV 6 - 3 -16 SL/WS',' Bản lề dưới lắp thanh khung',0,NULL,0,NULL,NULL,0,NULL,0.51,19125,NULL,NULL),(20,'2844506','SL.KS.3-6.WS','Bản lề khung trên ',0,NULL,0,NULL,NULL,0,NULL,0.94,35250,NULL,NULL),(21,'4933116','SBA.K.160 ','Vấu thường, số lượng phụ thuộc số Cam ',0,NULL,0,NULL,NULL,0,NULL,0.14,5250,NULL,NULL),(22,'SDC1','Standard double cylinder 30*30','Dùng cho cửa đi trượt',0,30,0,NULL,NULL,0,NULL,6.4,240000,NULL,NULL),(23,'SDC2','Standard double cylinder 40*40','Dùng cho cửa đi X6',0,40,0,NULL,NULL,0,NULL,6.99,262125,NULL,NULL),(24,'SDC3','Standard double cylinder 60*40',NULL,0,40,0,NULL,NULL,0,NULL,8.66,324750,NULL,NULL),(25,'SDC4','Standard double cylinder 50*50',NULL,0,50,0,NULL,NULL,0,NULL,9.15,343125,NULL,NULL),(26,'SDC5','Standard double cylinder 60*50','Dùng cho cửa đi X8',0,60,0,NULL,NULL,0,NULL,9.2,345000,NULL,NULL),(42,'4933474','GAKA.1325-1.D35 ',' FFH 1075 - 1325',1075,1325,0,NULL,0,1,'dadiem',13.19,494625,0,0),(43,'4929009','GAKA.2000-4.D35 ','FFH 1750 - 2000',1750,2000,0,NULL,0,4,'dadiem',14.47,542625,0,0),(44,'4929015','GAKA.2225-4.D35 ','FFH 1975 - 2225',1975,2225,0,NULL,0,4,'dadiem',14.79,554625,0,0),(45,'4929015','GAKA.2225-4.D35 ','FFH 2226 - 2475',2226,2475,0,NULL,0,4,'dadiem',0,0,0,0),(46,'2824919','MK.250-1','FFH 2226 - 2475',2226,2475,0,NULL,0,1,'dadiem',0.93,34875,0,0),(47,'4929015','GAKA.2225-4.D35 ','FFH 2476 - 2750',2476,2750,0,NULL,0,4,'dadiem',0,0,0,0),(48,'2824986','MK.500-1 ','FFH 2476 - 2750',2476,2750,0,NULL,0,1,'dadiem',1.18,44250,0,0),(49,'2822471','M 250 -1','FFB  333 - 535',333,535,0,NULL,0,1,'rong',0.66,24750,0,0),(50,'4933994','M 500 - 1','FFB 536 - 1035',536,1035,0,NULL,0,1,'rong',0.91,34125,0,0),(51,'4933994','M 500 - 1','FFB 1036 - 1285',1036,1285,0,NULL,0,1,'rong',0.91,34125,0,0),(52,'2824986','MK 500 -1','FFB 1036 - 1285',1036,1285,0,NULL,0,1,'rong',1.18,44250,0,0),(53,'4933994','M 500 - 1','FFH 1400 – 2300',1400,2300,0,NULL,0,1,'cao',0.91,34125,0,0),(54,'2824986','MK 500 -1','FFH 1400 – 2300',1400,2300,0,NULL,0,1,'cao',1.18,44250,0,0),(55,'4933994','M 500 - 1','FFH 2226 – 2475',2226,2475,0,NULL,0,1,'cao',0.91,34125,0,0),(56,'2824986','MK 500 -1','FFH 2226 – 2475',2226,2475,0,NULL,0,1,'cao',1.18,44250,0,0);
/*!40000 ALTER TABLE `tbo_phu_kien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbo_thanh_phan_phu_kien`
--

DROP TABLE IF EXISTS `tbo_thanh_phan_phu_kien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbo_thanh_phan_phu_kien` (
  `id_thanh_phan` int(11) NOT NULL AUTO_INCREMENT,
  `cua` int(11) NOT NULL,
  `phu_kien` int(11) DEFAULT NULL,
  `so_luong` int(11) DEFAULT '0',
  PRIMARY KEY (`id_thanh_phan`),
  KEY `fk_phukien_idx` (`phu_kien`),
  KEY `fk_cua_idx` (`cua`),
  CONSTRAINT `fk_cuaid` FOREIGN KEY (`cua`) REFERENCES `tbo_cua` (`id_cua`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_phukien` FOREIGN KEY (`phu_kien`) REFERENCES `tbo_phu_kien` (`id_phu_kien`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbo_thanh_phan_phu_kien`
--

LOCK TABLES `tbo_thanh_phan_phu_kien` WRITE;
/*!40000 ALTER TABLE `tbo_thanh_phan_phu_kien` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbo_thanh_phan_phu_kien` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-26  9:35:05

