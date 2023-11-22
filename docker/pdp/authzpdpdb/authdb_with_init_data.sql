CREATE DATABASE  IF NOT EXISTS `authzDB` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `authzDB`;

-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: aa1qx80ybdi941a.c5kjox0fs1pt.eu-west-1.rds.amazonaws.com    Database: authzDB
-- ------------------------------------------------------
-- Server version	5.6.35-log

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
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `enftypeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_actions_enftypes1_idx` (`enftypeid`),
  CONSTRAINT `fk_actions_enftypes1` FOREIGN KEY (`enftypeid`) REFERENCES `enftypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `xname` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conddata`
--

DROP TABLE IF EXISTS `conddata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conddata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `defid` int(11) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conddef`
--

DROP TABLE IF EXISTS `conddef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conddef` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  `xname` varchar(90) DEFAULT NULL,
  `category` varchar(90) DEFAULT NULL,
  `xtype` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conftab`
--

DROP TABLE IF EXISTS `conftab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conftab` (
  `name` varchar(45) NOT NULL,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataprovs`
--

DROP TABLE IF EXISTS `dataprovs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataprovs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `restendpoint` varchar(90) DEFAULT NULL,
  `restmethodid` int(11) DEFAULT NULL,
  `in_value` varchar(45) DEFAULT NULL,
  `mngdomid` int(11) DEFAULT NULL,
  `out_value` varchar(45) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `xacmltypeid` int(11) DEFAULT NULL,
  `xname` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dataprovs_mngdoms1_idx` (`mngdomid`),
  CONSTRAINT `fk_dataprovs_mngdoms1` FOREIGN KEY (`mngdomid`) REFERENCES `mngdoms` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enforcers`
--

DROP TABLE IF EXISTS `enforcers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enforcers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `secdomid` int(11) DEFAULT NULL,
  `enftypeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_enforcers_secdoms1_idx` (`secdomid`),
  KEY `fk_enforcers_enftypes1_idx` (`enftypeid`),
  CONSTRAINT `fk_enforcers_enftypes1` FOREIGN KEY (`enftypeid`) REFERENCES `enftypes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_enforcers_secdoms1` FOREIGN KEY (`secdomid`) REFERENCES `secdoms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enftypes`
--

DROP TABLE IF EXISTS `enftypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enftypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fedprovdatas`
--

DROP TABLE IF EXISTS `fedprovdatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fedprovdatas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `refval` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fedprovnames`
--

DROP TABLE IF EXISTS `fedprovnames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fedprovnames` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idfeddata` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fedprovnames_fedprovdatas1_idx` (`idfeddata`),
  CONSTRAINT `fk_fedprovnames_fedprovdatas1` FOREIGN KEY (`idfeddata`) REFERENCES `fedprovdatas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fedprovvalues`
--

DROP TABLE IF EXISTS `fedprovvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fedprovvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idfedname` int(11) DEFAULT NULL,
  `var` varchar(45) DEFAULT NULL,
  `val` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fedprovvalues_fedprovnames1_idx` (`idfedname`),
  CONSTRAINT `fk_fedprovvalues_fedprovnames1` FOREIGN KEY (`idfedname`) REFERENCES `fedprovnames` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `identifications`
--

DROP TABLE IF EXISTS `identifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `identypeid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_identifications_users1_idx` (`userid`),
  KEY `fk_identifications_identypes1_idx` (`identypeid`),
  CONSTRAINT `fk_identifications_identypes1` FOREIGN KEY (`identypeid`) REFERENCES `identypes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_identifications_users1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=410 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `identprovs`
--

DROP TABLE IF EXISTS `identprovs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identprovs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `mngdomid` int(11) DEFAULT NULL,
  `identypeid` int(11) DEFAULT NULL,
  `restendpoint` varchar(90) DEFAULT NULL,
  `restmethodid` int(11) DEFAULT NULL,
  `out_value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_identprovs_identypes1_idx` (`identypeid`),
  KEY `fk_identprovs_mngdoms1_idx` (`mngdomid`),
  CONSTRAINT `fk_identprovs_identypes1` FOREIGN KEY (`identypeid`) REFERENCES `identypes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_identprovs_mngdoms1` FOREIGN KEY (`mngdomid`) REFERENCES `mngdoms` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `identypes`
--

DROP TABLE IF EXISTS `identypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `delete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mngdoms`
--

DROP TABLE IF EXISTS `mngdoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mngdoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `secdomid` int(11) DEFAULT NULL,
  `orgid` int(11) DEFAULT NULL,
  `orgrolid` int(11) DEFAULT NULL,
  `exportstat` varchar(45) DEFAULT NULL,
  `exporttime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mngdoms_secdoms1_idx` (`secdomid`),
  KEY `fk_mngdoms_organizations1_idx` (`orgid`),
  CONSTRAINT `fk_mngdoms_organizations1` FOREIGN KEY (`orgid`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mngdoms_secdoms1` FOREIGN KEY (`secdomid`) REFERENCES `secdoms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `obldoms`
--

DROP TABLE IF EXISTS `obldoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obldoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oblid` int(11) DEFAULT NULL,
  `mngdomid` int(11) DEFAULT NULL,
  `effectid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_obldoms_mngdoms1_idx` (`mngdomid`),
  KEY `fk_obldoms_obligations1_idx` (`oblid`),
  CONSTRAINT `fk_obldoms_mngdoms1` FOREIGN KEY (`mngdomid`) REFERENCES `mngdoms` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_obldoms_obligations1` FOREIGN KEY (`oblid`) REFERENCES `obligations` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `obligations`
--

DROP TABLE IF EXISTS `obligations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obligations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `variable` varchar(45) DEFAULT NULL,
  `value` varchar(45) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `methodid` int(11) DEFAULT NULL,
  `data` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_obligations_obltypes1_idx` (`typeid`),
  CONSTRAINT `fk_obligations_obltypes1` FOREIGN KEY (`typeid`) REFERENCES `obltypes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oblrules`
--

DROP TABLE IF EXISTS `oblrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oblrules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oblid` int(11) DEFAULT NULL,
  `ruleid` int(11) DEFAULT NULL,
  `effectid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_oblrules_polrules1_idx` (`ruleid`),
  KEY `fk_oblrules_obligations1_idx` (`oblid`),
  CONSTRAINT `fk_oblrules_obligations1` FOREIGN KEY (`oblid`) REFERENCES `obligations` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_oblrules_polrules1` FOREIGN KEY (`ruleid`) REFERENCES `polrules` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `obltypes`
--

DROP TABLE IF EXISTS `obltypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obltypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `delete` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orgroles`
--

DROP TABLE IF EXISTS `orgroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orgroles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `outvalues`
--

DROP TABLE IF EXISTS `outvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `outvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(45) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `xacmltypeid` int(11) DEFAULT NULL,
  `outvaluescol` varchar(45) DEFAULT NULL,
  `xname` varchar(90) DEFAULT NULL,
  `dataprovid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_outvalues_dataprovs1_idx` (`dataprovid`),
  KEY `fk_outvalues_categories1_idx` (`categoryid`),
  KEY `fk_outvalues_xacmltypes1_idx` (`xacmltypeid`),
  CONSTRAINT `fk_outvalues_categories1` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_outvalues_dataprovs1` FOREIGN KEY (`dataprovid`) REFERENCES `dataprovs` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_outvalues_xacmltypes1` FOREIGN KEY (`xacmltypeid`) REFERENCES `xacmltypes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `polconds`
--

DROP TABLE IF EXISTS `polconds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polconds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `polruleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_polconds_polrules1_idx` (`polruleid`),
  CONSTRAINT `fk_polconds_polrules1` FOREIGN KEY (`polruleid`) REFERENCES `polrules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `polevaldatas`
--

DROP TABLE IF EXISTS `polevaldatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polevaldatas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `value` varchar(90) DEFAULT NULL,
  `polevalid` int(11) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_polevaldatas_polevals1_idx` (`polevalid`),
  KEY `fk_polevaldatas_categories1_idx` (`categoryid`),
  CONSTRAINT `fk_polevaldatas_categories1` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_polevaldatas_polevals1` FOREIGN KEY (`polevalid`) REFERENCES `polevals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `polevals`
--

DROP TABLE IF EXISTS `polevals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polevals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `polcondid` int(11) DEFAULT NULL,
  `xacmltypeid` int(11) DEFAULT NULL,
  `xacmlfunctionid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_polevals_polconds1_idx` (`polcondid`),
  KEY `fk_polevals_xacmlfunctions1_idx` (`xacmlfunctionid`),
  KEY `fk_polevals_xacmltypes1_idx` (`xacmltypeid`),
  CONSTRAINT `fk_polevals_polconds1` FOREIGN KEY (`polcondid`) REFERENCES `polconds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_polevals_xacmlfunctions1` FOREIGN KEY (`xacmlfunctionid`) REFERENCES `xacmlfunctions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_polevals_xacmltypes1` FOREIGN KEY (`xacmltypeid`) REFERENCES `xacmltypes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `polrules`
--

DROP TABLE IF EXISTS `polrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polrules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `effectid` int(11) DEFAULT NULL,
  `mngdomid` int(11) DEFAULT NULL,
  `combid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_polrules_mngdoms1_idx` (`mngdomid`),
  KEY `fk_polrules_xacmleffects1` (`effectid`),
  CONSTRAINT `fk_polrules_mngdoms1` FOREIGN KEY (`mngdomid`) REFERENCES `mngdoms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_polrules_xacmleffects1` FOREIGN KEY (`effectid`) REFERENCES `xacmleffects` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `providers`
--

DROP TABLE IF EXISTS `providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `rest_endpoint` varchar(90) DEFAULT NULL,
  `rest_method` varchar(5) DEFAULT NULL,
  `in_value` varchar(45) DEFAULT NULL,
  `out_value` varchar(45) DEFAULT NULL,
  `xname` varchar(90) DEFAULT NULL,
  `idcategory` int(11) DEFAULT NULL,
  `idxtype` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `secdomid` int(11) DEFAULT NULL,
  `identypeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_resources_identypes1_idx` (`identypeid`),
  KEY `fk_resources_secdoms1_idx` (`secdomid`),
  CONSTRAINT `fk_resources_identypes1` FOREIGN KEY (`identypeid`) REFERENCES `identypes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_resources_secdoms1` FOREIGN KEY (`secdomid`) REFERENCES `secdoms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `restmethods`
--

DROP TABLE IF EXISTS `restmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restmethods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `secdoms`
--

DROP TABLE IF EXISTS `secdoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secdoms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `delete` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `rempol`
--

DROP TABLE IF EXISTS `rempol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rempol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `url` varchar(90) DEFAULT NULL,
  `domain` varchar(90) DEFAULT NULL,
  `user` varchar(90) DEFAULT NULL,
  `pass` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `strrequests`
--

DROP TABLE IF EXISTS `strrequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strrequests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4829 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `strvalues`
--

DROP TABLE IF EXISTS `strvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `strvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reqid` int(11) DEFAULT NULL,
  `var` varchar(45) DEFAULT NULL,
  `val` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_strvalues_strrequests1_idx` (`reqid`),
  CONSTRAINT `fk_strvalues_strrequests1` FOREIGN KEY (`reqid`) REFERENCES `strrequests` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84505 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `orgid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_organizations1_idx` (`orgid`),
  CONSTRAINT `fk_users_organizations1` FOREIGN KEY (`orgid`) REFERENCES `organizations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=490 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vardatas`
--

DROP TABLE IF EXISTS `vardatas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vardatas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `xname` varchar(90) DEFAULT NULL,
  `xacmltypeid` int(11) DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vardatas_xacmltypes1_idx` (`xacmltypeid`),
  CONSTRAINT `fk_vardatas_xacmltypes1` FOREIGN KEY (`xacmltypeid`) REFERENCES `xacmltypes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `varvalues`
--

DROP TABLE IF EXISTS `varvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `varvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(45) DEFAULT NULL,
  `dataid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_varvalues_vardatas1_idx` (`dataid`),
  CONSTRAINT `fk_varvalues_vardatas1` FOREIGN KEY (`dataid`) REFERENCES `vardatas` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xacmlcombs`
--

DROP TABLE IF EXISTS `xacmlcombs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xacmlcombs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `xname` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xacmleffects`
--

DROP TABLE IF EXISTS `xacmleffects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xacmleffects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xacmlfunctions`
--

DROP TABLE IF EXISTS `xacmlfunctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xacmlfunctions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `xname` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xacmltypes`
--

DROP TABLE IF EXISTS `xacmltypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xacmltypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `xname` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-19  8:44:50

CREATE DATABASE  IF NOT EXISTS `authzDB` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `authzDB`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 192.168.15.64    Database: authzDB
-- ------------------------------------------------------
-- Server version	5.5.44-0+deb7u1

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
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `xname`) VALUES (1,'access-subject','urn:oasis:names:tc:xacml:1.0:subject-category:access-subject'),(2,'action','urn:oasis:names:tc:xacml:3.0:attribute-category:action'),(3,'resource','urn:oasis:names:tc:xacml:3.0:attribute-category:resource'),(4,'environment','urn:oasis:names:tc:xacml:3.0:attribute-category:enviroment');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `identypes`
--

LOCK TABLES `identypes` WRITE;
/*!40000 ALTER TABLE `identypes` DISABLE KEYS */;
INSERT INTO `identypes` (`id`, `name`, `delete`) VALUES (1,'oauth2',0),(2,'facialident',1),(3,'carplate',1),(5,'vehicletrigger',1);
/*!40000 ALTER TABLE `identypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `obltypes`
--

LOCK TABLES `obltypes` WRITE;
/*!40000 ALTER TABLE `obltypes` DISABLE KEYS */;
INSERT INTO `obltypes` (`id`, `name`) VALUES (1,'Rest Api'),(2,'Kafka Broker');
/*!40000 ALTER TABLE `obltypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `orgroles`
--

LOCK TABLES `orgroles` WRITE;
/*!40000 ALTER TABLE `orgroles` DISABLE KEYS */;
INSERT INTO `orgroles` (`id`, `name`) VALUES (1,'owner'),(2,'assigned');
/*!40000 ALTER TABLE `orgroles` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `restmethods`
--

LOCK TABLES `restmethods` WRITE;
/*!40000 ALTER TABLE `restmethods` DISABLE KEYS */;
INSERT INTO `restmethods` (`id`, `name`) VALUES (1,'GET'),(2,'POST'),(3,'PUT');
/*!40000 ALTER TABLE `restmethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `xacmlcombs`
--

LOCK TABLES `xacmlcombs` WRITE;
/*!40000 ALTER TABLE `xacmlcombs` DISABLE KEYS */;
INSERT INTO `xacmlcombs` (`id`, `name`, `xname`) VALUES (1,'and','urn:oasis:names:tc:xacml:1.0:function:and'),(2,'or','urn:oasis:names:tc:xacml:1.0:function:or');
/*!40000 ALTER TABLE `xacmlcombs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `xacmleffects`
--

LOCK TABLES `xacmleffects` WRITE;
/*!40000 ALTER TABLE `xacmleffects` DISABLE KEYS */;
INSERT INTO `xacmleffects` (`id`, `name`) VALUES (1,'Permit'),(2,'Deny');
/*!40000 ALTER TABLE `xacmleffects` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `xacmltypes`
--

LOCK TABLES `xacmltypes` WRITE;
/*!40000 ALTER TABLE `xacmltypes` DISABLE KEYS */;
INSERT INTO `xacmltypes` (`id`, `name`, `xname`) VALUES (1,'string','http://www.w3.org/2001/XMLSchema#string'),
(2,'boolean','http://www.w3.org/2001/XMLSchema#boolean'),
(3,'integer','http://www.w3.org/2001/XMLSchema#integer'),
(4,'double','http://www.w3.org/2001/XMLSchema#double'),
(5,'time','http://www.w3.org/2001/XMLSchema#time'),
(6,'date','http://www.w3.org/2001/XMLSchema#date'),
(7,'datetime','http://www.w3.org/2001/XMLSchema#dateTime'),
(8,'anyURI','http://www.w3.org/2001/XMLSchema#anyURI'),
(9,'hexBinary','http://www.w3.org/2001/XMLSchema#hexBinary'),
(10,'base64binary','http://www.w3.org/2001/XMLSchema#base64Binary');
/*!40000 ALTER TABLE `xacmltypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'authzDB'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-18 11:47:22
