-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: authzDB
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `authzDB`
--

CREATE DATABASE IF NOT EXISTS `authzDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `authzDB`;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `enftypeid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_actions_enftypes1_idx` (`enftypeid`),
  CONSTRAINT `fk_actions_enftypes1` FOREIGN KEY (`enftypeid`) REFERENCES `enftypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `xname` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'access-subject','urn:oasis:names:tc:xacml:1.0:subject-category:access-subject'),(2,'action','urn:oasis:names:tc:xacml:3.0:attribute-category:action'),(3,'resource','urn:oasis:names:tc:xacml:3.0:attribute-category:resource'),(4,'environment','urn:oasis:names:tc:xacml:3.0:attribute-category:enviroment');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conddata`
--

DROP TABLE IF EXISTS `conddata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conddata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `defid` int DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conddata`
--

LOCK TABLES `conddata` WRITE;
/*!40000 ALTER TABLE `conddata` DISABLE KEYS */;
/*!40000 ALTER TABLE `conddata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conddef`
--

DROP TABLE IF EXISTS `conddef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conddef` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  `xname` varchar(90) DEFAULT NULL,
  `category` varchar(90) DEFAULT NULL,
  `xtype` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conddef`
--

LOCK TABLES `conddef` WRITE;
/*!40000 ALTER TABLE `conddef` DISABLE KEYS */;
/*!40000 ALTER TABLE `conddef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conftab`
--

DROP TABLE IF EXISTS `conftab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conftab` (
  `name` varchar(45) NOT NULL,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conftab`
--

LOCK TABLES `conftab` WRITE;
/*!40000 ALTER TABLE `conftab` DISABLE KEYS */;
/*!40000 ALTER TABLE `conftab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataprovs`
--

DROP TABLE IF EXISTS `dataprovs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataprovs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `order` int DEFAULT NULL,
  `restendpoint` varchar(90) DEFAULT NULL,
  `restmethodid` int DEFAULT NULL,
  `in_value` varchar(45) DEFAULT NULL,
  `mngdomid` int DEFAULT NULL,
  `out_value` varchar(45) DEFAULT NULL,
  `categoryid` int DEFAULT NULL,
  `xacmltypeid` int DEFAULT NULL,
  `xname` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dataprovs_mngdoms1_idx` (`mngdomid`),
  CONSTRAINT `fk_dataprovs_mngdoms1` FOREIGN KEY (`mngdomid`) REFERENCES `mngdoms` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataprovs`
--

LOCK TABLES `dataprovs` WRITE;
/*!40000 ALTER TABLE `dataprovs` DISABLE KEYS */;
INSERT INTO `dataprovs` VALUES (53,'gelocation_provider',0,'http://192.168.15.189:9000/authzserver/rest/fedprov/geolocation/<in_value>',1,'object-id',120,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `dataprovs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enforcers`
--

DROP TABLE IF EXISTS `enforcers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enforcers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `secdomid` int DEFAULT NULL,
  `enftypeid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_enforcers_secdoms1_idx` (`secdomid`),
  KEY `fk_enforcers_enftypes1_idx` (`enftypeid`),
  CONSTRAINT `fk_enforcers_enftypes1` FOREIGN KEY (`enftypeid`) REFERENCES `enftypes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_enforcers_secdoms1` FOREIGN KEY (`secdomid`) REFERENCES `secdoms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enforcers`
--

LOCK TABLES `enforcers` WRITE;
/*!40000 ALTER TABLE `enforcers` DISABLE KEYS */;
/*!40000 ALTER TABLE `enforcers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enftypes`
--

DROP TABLE IF EXISTS `enftypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enftypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enftypes`
--

LOCK TABLES `enftypes` WRITE;
/*!40000 ALTER TABLE `enftypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `enftypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fedprovdatas`
--

DROP TABLE IF EXISTS `fedprovdatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fedprovdatas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `refval` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fedprovdatas`
--

LOCK TABLES `fedprovdatas` WRITE;
/*!40000 ALTER TABLE `fedprovdatas` DISABLE KEYS */;
INSERT INTO `fedprovdatas` VALUES (94,'geolocation','userid');
/*!40000 ALTER TABLE `fedprovdatas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fedprovnames`
--

DROP TABLE IF EXISTS `fedprovnames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fedprovnames` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idfeddata` int DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fedprovnames_fedprovdatas1_idx` (`idfeddata`),
  CONSTRAINT `fk_fedprovnames_fedprovdatas1` FOREIGN KEY (`idfeddata`) REFERENCES `fedprovdatas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fedprovnames`
--

LOCK TABLES `fedprovnames` WRITE;
/*!40000 ALTER TABLE `fedprovnames` DISABLE KEYS */;
INSERT INTO `fedprovnames` VALUES (106,94,'demo_truck1'),(107,94,'demo_truck2');
/*!40000 ALTER TABLE `fedprovnames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fedprovvalues`
--

DROP TABLE IF EXISTS `fedprovvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fedprovvalues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idfedname` int DEFAULT NULL,
  `var` varchar(45) DEFAULT NULL,
  `val` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fedprovvalues_fedprovnames1_idx` (`idfedname`),
  CONSTRAINT `fk_fedprovvalues_fedprovnames1` FOREIGN KEY (`idfedname`) REFERENCES `fedprovnames` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fedprovvalues`
--

LOCK TABLES `fedprovvalues` WRITE;
/*!40000 ALTER TABLE `fedprovvalues` DISABLE KEYS */;
INSERT INTO `fedprovvalues` VALUES (137,106,'alignement','yes'),(138,107,'alignement','no');
/*!40000 ALTER TABLE `fedprovvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identifications`
--

DROP TABLE IF EXISTS `identifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `identypeid` int DEFAULT NULL,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_identifications_users1_idx` (`userid`),
  KEY `fk_identifications_identypes1_idx` (`identypeid`),
  CONSTRAINT `fk_identifications_identypes1` FOREIGN KEY (`identypeid`) REFERENCES `identypes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_identifications_users1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identifications`
--

LOCK TABLES `identifications` WRITE;
/*!40000 ALTER TABLE `identifications` DISABLE KEYS */;
INSERT INTO `identifications` VALUES (410,'demo_truck1',1,490),(411,'demo_truck2',1,491);
/*!40000 ALTER TABLE `identifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identprovs`
--

DROP TABLE IF EXISTS `identprovs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identprovs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `mngdomid` int DEFAULT NULL,
  `identypeid` int DEFAULT NULL,
  `restendpoint` varchar(90) DEFAULT NULL,
  `restmethodid` int DEFAULT NULL,
  `out_value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_identprovs_identypes1_idx` (`identypeid`),
  KEY `fk_identprovs_mngdoms1_idx` (`mngdomid`),
  CONSTRAINT `fk_identprovs_identypes1` FOREIGN KEY (`identypeid`) REFERENCES `identypes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_identprovs_mngdoms1` FOREIGN KEY (`mngdomid`) REFERENCES `mngdoms` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identprovs`
--

LOCK TABLES `identprovs` WRITE;
/*!40000 ALTER TABLE `identprovs` DISABLE KEYS */;
/*!40000 ALTER TABLE `identprovs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identypes`
--

DROP TABLE IF EXISTS `identypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `delete` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identypes`
--

LOCK TABLES `identypes` WRITE;
/*!40000 ALTER TABLE `identypes` DISABLE KEYS */;
INSERT INTO `identypes` VALUES (1,'oauth2',0),(2,'facialident',1),(3,'carplate',1),(5,'vehicletrigger',1);
/*!40000 ALTER TABLE `identypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mngdoms`
--

DROP TABLE IF EXISTS `mngdoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mngdoms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `secdomid` int DEFAULT NULL,
  `orgid` int DEFAULT NULL,
  `orgrolid` int DEFAULT NULL,
  `exportstat` varchar(45) DEFAULT NULL,
  `exporttime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mngdoms_secdoms1_idx` (`secdomid`),
  KEY `fk_mngdoms_organizations1_idx` (`orgid`),
  CONSTRAINT `fk_mngdoms_organizations1` FOREIGN KEY (`orgid`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mngdoms_secdoms1` FOREIGN KEY (`secdomid`) REFERENCES `secdoms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mngdoms`
--

LOCK TABLES `mngdoms` WRITE;
/*!40000 ALTER TABLE `mngdoms` DISABLE KEYS */;
INSERT INTO `mngdoms` VALUES (120,'assist_pilot1_transport_org',378,148,1,'Created','');
/*!40000 ALTER TABLE `mngdoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obldoms`
--

DROP TABLE IF EXISTS `obldoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obldoms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `oblid` int DEFAULT NULL,
  `mngdomid` int DEFAULT NULL,
  `effectid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_obldoms_mngdoms1_idx` (`mngdomid`),
  KEY `fk_obldoms_obligations1_idx` (`oblid`),
  CONSTRAINT `fk_obldoms_mngdoms1` FOREIGN KEY (`mngdomid`) REFERENCES `mngdoms` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_obldoms_obligations1` FOREIGN KEY (`oblid`) REFERENCES `obligations` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obldoms`
--

LOCK TABLES `obldoms` WRITE;
/*!40000 ALTER TABLE `obldoms` DISABLE KEYS */;
/*!40000 ALTER TABLE `obldoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obligations`
--

DROP TABLE IF EXISTS `obligations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obligations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `variable` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  `typeid` int DEFAULT NULL,
  `methodid` int DEFAULT NULL,
  `data` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_obligations_obltypes1_idx` (`typeid`),
  CONSTRAINT `fk_obligations_obltypes1` FOREIGN KEY (`typeid`) REFERENCES `obltypes` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obligations`
--

LOCK TABLES `obligations` WRITE;
/*!40000 ALTER TABLE `obligations` DISABLE KEYS */;
/*!40000 ALTER TABLE `obligations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oblrules`
--

DROP TABLE IF EXISTS `oblrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oblrules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `oblid` int DEFAULT NULL,
  `ruleid` int DEFAULT NULL,
  `effectid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_oblrules_polrules1_idx` (`ruleid`),
  KEY `fk_oblrules_obligations1_idx` (`oblid`),
  CONSTRAINT `fk_oblrules_obligations1` FOREIGN KEY (`oblid`) REFERENCES `obligations` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_oblrules_polrules1` FOREIGN KEY (`ruleid`) REFERENCES `polrules` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oblrules`
--

LOCK TABLES `oblrules` WRITE;
/*!40000 ALTER TABLE `oblrules` DISABLE KEYS */;
/*!40000 ALTER TABLE `oblrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obltypes`
--

DROP TABLE IF EXISTS `obltypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obltypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obltypes`
--

LOCK TABLES `obltypes` WRITE;
/*!40000 ALTER TABLE `obltypes` DISABLE KEYS */;
INSERT INTO `obltypes` VALUES (1,'Rest Api'),(2,'Kafka Broker');
/*!40000 ALTER TABLE `obltypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `delete` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (148,'transport_org',1);
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orgroles`
--

DROP TABLE IF EXISTS `orgroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orgroles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orgroles`
--

LOCK TABLES `orgroles` WRITE;
/*!40000 ALTER TABLE `orgroles` DISABLE KEYS */;
INSERT INTO `orgroles` VALUES (1,'owner'),(2,'assigned');
/*!40000 ALTER TABLE `orgroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outvalues`
--

DROP TABLE IF EXISTS `outvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outvalues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(45) DEFAULT NULL,
  `categoryid` int DEFAULT NULL,
  `xacmltypeid` int DEFAULT NULL,
  `outvaluescol` varchar(45) DEFAULT NULL,
  `xname` varchar(90) DEFAULT NULL,
  `dataprovid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_outvalues_dataprovs1_idx` (`dataprovid`),
  KEY `fk_outvalues_categories1_idx` (`categoryid`),
  KEY `fk_outvalues_xacmltypes1_idx` (`xacmltypeid`),
  CONSTRAINT `fk_outvalues_categories1` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_outvalues_dataprovs1` FOREIGN KEY (`dataprovid`) REFERENCES `dataprovs` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_outvalues_xacmltypes1` FOREIGN KEY (`xacmltypeid`) REFERENCES `xacmltypes` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outvalues`
--

LOCK TABLES `outvalues` WRITE;
/*!40000 ALTER TABLE `outvalues` DISABLE KEYS */;
INSERT INTO `outvalues` VALUES (39,'alignement',1,1,NULL,'urn:oasis:names:tc:xacml:1.0:subject:alignementstatus',53);
/*!40000 ALTER TABLE `outvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polconds`
--

DROP TABLE IF EXISTS `polconds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polconds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `polruleid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_polconds_polrules1_idx` (`polruleid`),
  CONSTRAINT `fk_polconds_polrules1` FOREIGN KEY (`polruleid`) REFERENCES `polrules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polconds`
--

LOCK TABLES `polconds` WRITE;
/*!40000 ALTER TABLE `polconds` DISABLE KEYS */;
INSERT INTO `polconds` VALUES (99,99),(102,99);
/*!40000 ALTER TABLE `polconds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polevaldatas`
--

DROP TABLE IF EXISTS `polevaldatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polevaldatas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int DEFAULT NULL,
  `value` varchar(90) DEFAULT NULL,
  `polevalid` int DEFAULT NULL,
  `categoryid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_polevaldatas_polevals1_idx` (`polevalid`),
  KEY `fk_polevaldatas_categories1_idx` (`categoryid`),
  CONSTRAINT `fk_polevaldatas_categories1` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_polevaldatas_polevals1` FOREIGN KEY (`polevalid`) REFERENCES `polevals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polevaldatas`
--

LOCK TABLES `polevaldatas` WRITE;
/*!40000 ALTER TABLE `polevaldatas` DISABLE KEYS */;
INSERT INTO `polevaldatas` VALUES (152,0,'urn:oasis:names:tc:xacml:1.0:action:action-id',101,2),(153,2,'start_unload_truck',101,2),(160,0,'urn:oasis:names:tc:xacml:1.0:subject:alignementstatus',106,1),(161,2,'yes',106,1);
/*!40000 ALTER TABLE `polevaldatas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polevals`
--

DROP TABLE IF EXISTS `polevals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polevals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `polcondid` int DEFAULT NULL,
  `xacmltypeid` int DEFAULT NULL,
  `xacmlfunctionid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_polevals_polconds1_idx` (`polcondid`),
  KEY `fk_polevals_xacmlfunctions1_idx` (`xacmlfunctionid`),
  KEY `fk_polevals_xacmltypes1_idx` (`xacmltypeid`),
  CONSTRAINT `fk_polevals_polconds1` FOREIGN KEY (`polcondid`) REFERENCES `polconds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_polevals_xacmlfunctions1` FOREIGN KEY (`xacmlfunctionid`) REFERENCES `xacmlfunctions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_polevals_xacmltypes1` FOREIGN KEY (`xacmltypeid`) REFERENCES `xacmltypes` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polevals`
--

LOCK TABLES `polevals` WRITE;
/*!40000 ALTER TABLE `polevals` DISABLE KEYS */;
INSERT INTO `polevals` VALUES (101,99,1,1),(106,102,1,1);
/*!40000 ALTER TABLE `polevals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polrules`
--

DROP TABLE IF EXISTS `polrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polrules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `effectid` int DEFAULT NULL,
  `mngdomid` int DEFAULT NULL,
  `combid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_polrules_mngdoms1_idx` (`mngdomid`),
  KEY `fk_polrules_xacmleffects1` (`effectid`),
  CONSTRAINT `fk_polrules_mngdoms1` FOREIGN KEY (`mngdomid`) REFERENCES `mngdoms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_polrules_xacmleffects1` FOREIGN KEY (`effectid`) REFERENCES `xacmleffects` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polrules`
--

LOCK TABLES `polrules` WRITE;
/*!40000 ALTER TABLE `polrules` DISABLE KEYS */;
INSERT INTO `polrules` VALUES (99,1,120,1);
/*!40000 ALTER TABLE `polrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `providers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `rest_endpoint` varchar(90) DEFAULT NULL,
  `rest_method` varchar(5) DEFAULT NULL,
  `in_value` varchar(45) DEFAULT NULL,
  `out_value` varchar(45) DEFAULT NULL,
  `xname` varchar(90) DEFAULT NULL,
  `idcategory` int DEFAULT NULL,
  `idxtype` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providers`
--

LOCK TABLES `providers` WRITE;
/*!40000 ALTER TABLE `providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rempol`
--

DROP TABLE IF EXISTS `rempol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rempol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `url` varchar(90) DEFAULT NULL,
  `domain` varchar(90) DEFAULT NULL,
  `user` varchar(90) DEFAULT NULL,
  `pass` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rempol`
--

LOCK TABLES `rempol` WRITE;
/*!40000 ALTER TABLE `rempol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rempol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `secdomid` int DEFAULT NULL,
  `identypeid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_resources_identypes1_idx` (`identypeid`),
  KEY `fk_resources_secdoms1_idx` (`secdomid`),
  CONSTRAINT `fk_resources_identypes1` FOREIGN KEY (`identypeid`) REFERENCES `identypes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_resources_secdoms1` FOREIGN KEY (`secdomid`) REFERENCES `secdoms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (185,'mobileapp',378,1);
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restmethods`
--

DROP TABLE IF EXISTS `restmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restmethods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restmethods`
--

LOCK TABLES `restmethods` WRITE;
/*!40000 ALTER TABLE `restmethods` DISABLE KEYS */;
INSERT INTO `restmethods` VALUES (1,'GET'),(2,'POST'),(3,'PUT');
/*!40000 ALTER TABLE `restmethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secdoms`
--

DROP TABLE IF EXISTS `secdoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secdoms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `delete` int DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secdoms`
--

LOCK TABLES `secdoms` WRITE;
/*!40000 ALTER TABLE `secdoms` DISABLE KEYS */;
INSERT INTO `secdoms` VALUES (378,'assist_pilot1',1);
/*!40000 ALTER TABLE `secdoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strrequests`
--

DROP TABLE IF EXISTS `strrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strrequests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timestamp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4843 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `strvalues`
--

DROP TABLE IF EXISTS `strvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strvalues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reqid` int DEFAULT NULL,
  `var` varchar(45) DEFAULT NULL,
  `val` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_strvalues_strrequests1_idx` (`reqid`),
  CONSTRAINT `fk_strvalues_strrequests1` FOREIGN KEY (`reqid`) REFERENCES `strrequests` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84680 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `orgid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_organizations1_idx` (`orgid`),
  CONSTRAINT `fk_users_organizations1` FOREIGN KEY (`orgid`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=492 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (490,'user1',148),(491,'user2',148);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vardatas`
--

DROP TABLE IF EXISTS `vardatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vardatas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `xname` varchar(90) DEFAULT NULL,
  `xacmltypeid` int DEFAULT NULL,
  `categoryid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vardatas_xacmltypes1_idx` (`xacmltypeid`),
  CONSTRAINT `fk_vardatas_xacmltypes1` FOREIGN KEY (`xacmltypeid`) REFERENCES `xacmltypes` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vardatas`
--

LOCK TABLES `vardatas` WRITE;
/*!40000 ALTER TABLE `vardatas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vardatas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `varvalues`
--

DROP TABLE IF EXISTS `varvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `varvalues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(45) DEFAULT NULL,
  `dataid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_varvalues_vardatas1_idx` (`dataid`),
  CONSTRAINT `fk_varvalues_vardatas1` FOREIGN KEY (`dataid`) REFERENCES `vardatas` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `varvalues`
--

LOCK TABLES `varvalues` WRITE;
/*!40000 ALTER TABLE `varvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `varvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xacmlcombs`
--

DROP TABLE IF EXISTS `xacmlcombs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xacmlcombs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `xname` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xacmlcombs`
--

LOCK TABLES `xacmlcombs` WRITE;
/*!40000 ALTER TABLE `xacmlcombs` DISABLE KEYS */;
INSERT INTO `xacmlcombs` VALUES (1,'and','urn:oasis:names:tc:xacml:1.0:function:and'),(2,'or','urn:oasis:names:tc:xacml:1.0:function:or');
/*!40000 ALTER TABLE `xacmlcombs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xacmleffects`
--

DROP TABLE IF EXISTS `xacmleffects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xacmleffects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xacmleffects`
--

LOCK TABLES `xacmleffects` WRITE;
/*!40000 ALTER TABLE `xacmleffects` DISABLE KEYS */;
INSERT INTO `xacmleffects` VALUES (1,'Permit'),(2,'Deny');
/*!40000 ALTER TABLE `xacmleffects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xacmlfunctions`
--

DROP TABLE IF EXISTS `xacmlfunctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xacmlfunctions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `xname` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xacmlfunctions`
--

LOCK TABLES `xacmlfunctions` WRITE;
/*!40000 ALTER TABLE `xacmlfunctions` DISABLE KEYS */;

-- string functions
INSERT INTO `xacmlfunctions` VALUES (1,'string-equal','urn:oasis:names:tc:xacml:1.0:function:string-equal'),(10,'string-greater-than','urn:oasis:names:tc:xacml:1.0:function:string-greater-than'),(11,'string-greater-than-or-equal','urn:oasis:names:tc:xacml:1.0:function:string-greater-than-or-equal'),(12,'string-less-than','urn:oasis:names:tc:xacml:1.0:function:string-less-than'),(13,'string-less-than-or-equal','urn:oasis:names:tc:xacml:1.0:function:string-less-than-or-equal');
-- boolean functions
INSERT INTO `xacmlfunctions` VALUES (2,'boolean-equal','urn:oasis:names:tc:xacml:1.0:function:boolean-equal');
-- integer functions
INSERT INTO `xacmlfunctions` VALUES (3,'integer-equal','urn:oasis:names:tc:xacml:1.0:function:integer-equal'),(30,'integer-greater-than','urn:oasis:names:tc:xacml:1.0:function:integer-greater-than'),(31,'integer-greater-than-or-equal','urn:oasis:names:tc:xacml:1.0:function:integer-greater-than-or-equal'),(32,'integer-less-than','urn:oasis:names:tc:xacml:1.0:function:integer-less-than'),(33,'integer-less-than-or-equal','urn:oasis:names:tc:xacml:1.0:function:integer-less-than-or-equal');
-- double functions
INSERT INTO `xacmlfunctions` VALUES (5,'double-equal','urn:oasis:names:tc:xacml:1.0:function:double-equal'),(50,'double-greater-than','urn:oasis:names:tc:xacml:1.0:function:double-greater-than'),(51,'double-greater-than-or-equal','urn:oasis:names:tc:xacml:1.0:function:double-greater-than-or-equal'),(52,'double-less-than','urn:oasis:names:tc:xacml:1.0:function:double-less-than'),(53,'double-less-than-or-equal','urn:oasis:names:tc:xacml:1.0:function:double-less-than-or-equal');
-- time functions
INSERT INTO `xacmlfunctions` VALUES (6,'time-equal','urn:oasis:names:tc:xacml:1.0:function:time-equal'),(60,'time-greater-than','urn:oasis:names:tc:xacml:1.0:function:time-greater-than'),(61,'time-greater-than-or-equal','urn:oasis:names:tc:xacml:1.0:function:time-greater-than-or-equal'),(62,'time-less-than','urn:oasis:names:tc:xacml:1.0:function:time-less-than'),(63,'time-less-than-or-equal','urn:oasis:names:tc:xacml:1.0:function:time-less-than-or-equal');
-- date functions
INSERT INTO `xacmlfunctions` VALUES (4,'date-equal','urn:oasis:names:tc:xacml:1.0:function:date-equal'),(40,'date-greater-than','urn:oasis:names:tc:xacml:1.0:function:date-greater-than'),(41,'date-greater-than-or-equal','urn:oasis:names:tc:xacml:1.0:function:date-greater-than-or-equal'),(42,'date-less-than','urn:oasis:names:tc:xacml:1.0:function:date-less-than'),(43,'date-less-than-or-equal','urn:oasis:names:tc:xacml:1.0:function:date-less-than-or-equal');
-- dateTime functions
INSERT INTO `xacmlfunctions` VALUES (7,'dateTime-equal','urn:oasis:names:tc:xacml:1.0:function:dateTime-equal'),(70,'dateTime-greater-than','urn:oasis:names:tc:xacml:1.0:function:dateTime-greater-than'),(71,'dateTime-greater-than-or-equal','urn:oasis:names:tc:xacml:1.0:function:dateTime-greater-than-or-equal'),(72,'dateTime-less-than','urn:oasis:names:tc:xacml:1.0:function:dateTime-less-than'),(73,'dateTime-less-than-or-equal','urn:oasis:names:tc:xacml:1.0:function:dateTime-less-than-or-equal');
-- anyURI functions
INSERT INTO `xacmlfunctions` VALUES (8,'anyURI-equal','urn:oasis:names:tc:xacml:1.0:function:anyURI-equal');
-- hexBinary functions
INSERT INTO `xacmlfunctions` VALUES (9,'hexBinary-equal','urn:oasis:names:tc:xacml:1.0:function:hexBinary-equal');
-- base64binary functions
INSERT INTO `xacmlfunctions` VALUES (100,'base64Binary-equal','urn:oasis:names:tc:xacml:1.0:function:base64Binary-equal');
/*!40000 ALTER TABLE `xacmlfunctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xacmltypes`
--

DROP TABLE IF EXISTS `xacmltypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xacmltypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `xname` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xacmltypes`
--

LOCK TABLES `xacmltypes` WRITE;
/*!40000 ALTER TABLE `xacmltypes` DISABLE KEYS */;
INSERT INTO `xacmltypes` VALUES (1,'string','http://www.w3.org/2001/XMLSchema#string'),(2,'boolean','http://www.w3.org/2001/XMLSchema#boolean'),(3,'integer','http://www.w3.org/2001/XMLSchema#integer'),(4,'double','http://www.w3.org/2001/XMLSchema#double'),(5,'time','http://www.w3.org/2001/XMLSchema#time'),(6,'date','http://www.w3.org/2001/XMLSchema#date'),(7,'dateTime','http://www.w3.org/2001/XMLSchema#dateTime'),(8,'anyURI','http://www.w3.org/2001/XMLSchema#anyURI'),(9,'hexBinary','http://www.w3.org/2001/XMLSchema#hexBinary'),(10,'base64Binary','http://www.w3.org/2001/XMLSchema#base64Binary');
/*!40000 ALTER TABLE `xacmltypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-14 11:07:12
