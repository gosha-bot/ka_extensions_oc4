-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ka_ext_oc4103
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Current Database: `ka_ext_oc4103`
--

/*!40000 DROP DATABASE IF EXISTS `ka_ext_oc4103`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ka_ext_oc4103` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `ka_ext_oc4103`;

--
-- Table structure for table `oc_address`
--

DROP TABLE IF EXISTS `oc_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `company` varchar(60) DEFAULT NULL,
  `address_1` varchar(128) DEFAULT NULL,
  `address_2` varchar(128) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `country_id` int(11) DEFAULT 0,
  `zone_id` int(11) DEFAULT 0,
  `custom_field` text DEFAULT NULL,
  `default` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_address`
--

LOCK TABLES `oc_address` WRITE;
/*!40000 ALTER TABLE `oc_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_address_format`
--

DROP TABLE IF EXISTS `oc_address_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_address_format` (
  `address_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `address_format` text DEFAULT NULL,
  PRIMARY KEY (`address_format_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_address_format`
--

LOCK TABLES `oc_address_format` WRITE;
/*!40000 ALTER TABLE `oc_address_format` DISABLE KEYS */;
INSERT INTO `oc_address_format` VALUES (1,'Address Format','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}');
/*!40000 ALTER TABLE `oc_address_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_antispam`
--

DROP TABLE IF EXISTS `oc_antispam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_antispam` (
  `antispam_id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`antispam_id`),
  KEY `keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_antispam`
--

LOCK TABLES `oc_antispam` WRITE;
/*!40000 ALTER TABLE `oc_antispam` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_antispam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_api`
--

DROP TABLE IF EXISTS `oc_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `key` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_api`
--

LOCK TABLES `oc_api` WRITE;
/*!40000 ALTER TABLE `oc_api` DISABLE KEYS */;
INSERT INTO `oc_api` VALUES (1,'Default','1063279c6a4a4ca67352f21d918b7ee0bd8c4151049ed2e5af23e2a8e0750b98dca1773d4753a0d40e8b713bea2aed03e06ba25699dab9a5299048a637715335ef3e7d31c0817594bbe8a7807df0095d514bb90c8a20771de2e9bddba485d888890265ec6a85c8e720f0730295381c5cfb04bf7d2974fc3e7d7941b8c38ab891',1,'2025-04-21 00:29:02','2025-04-21 00:29:02');
/*!40000 ALTER TABLE `oc_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_api_history`
--

DROP TABLE IF EXISTS `oc_api_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_api_history` (
  `api_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) DEFAULT NULL,
  `call` varchar(32) DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`api_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_api_history`
--

LOCK TABLES `oc_api_history` WRITE;
/*!40000 ALTER TABLE `oc_api_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_api_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_api_ip`
--

DROP TABLE IF EXISTS `oc_api_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_api_ip`
--

LOCK TABLES `oc_api_ip` WRITE;
/*!40000 ALTER TABLE `oc_api_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_api_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_article`
--

DROP TABLE IF EXISTS `oc_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT 0,
  `author` varchar(64) DEFAULT NULL,
  `rating` int(11) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_article`
--

LOCK TABLES `oc_article` WRITE;
/*!40000 ALTER TABLE `oc_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_article_comment`
--

DROP TABLE IF EXISTS `oc_article_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_article_comment` (
  `article_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `customer_id` int(11) DEFAULT 0,
  `author` varchar(64) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `rating` int(11) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`article_comment_id`),
  KEY `article_id` (`article_id`),
  KEY `customer_id` (`customer_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_article_comment`
--

LOCK TABLES `oc_article_comment` WRITE;
/*!40000 ALTER TABLE `oc_article_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_article_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_article_description`
--

DROP TABLE IF EXISTS `oc_article_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_article_description` (
  `article_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `tag` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`article_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_article_description`
--

LOCK TABLES `oc_article_description` WRITE;
/*!40000 ALTER TABLE `oc_article_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_article_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_article_rating`
--

DROP TABLE IF EXISTS `oc_article_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_article_rating` (
  `article_rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_comment_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT 0,
  `customer_id` int(11) DEFAULT 0,
  `rating` tinyint(1) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`article_rating_id`),
  KEY `article_comment_id` (`article_comment_id`),
  KEY `article_id` (`article_id`),
  KEY `store_id` (`store_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_article_rating`
--

LOCK TABLES `oc_article_rating` WRITE;
/*!40000 ALTER TABLE `oc_article_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_article_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_article_to_layout`
--

DROP TABLE IF EXISTS `oc_article_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_article_to_layout` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `layout_id` int(11) DEFAULT 0,
  PRIMARY KEY (`article_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_article_to_layout`
--

LOCK TABLES `oc_article_to_layout` WRITE;
/*!40000 ALTER TABLE `oc_article_to_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_article_to_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_article_to_store`
--

DROP TABLE IF EXISTS `oc_article_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_article_to_store` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`article_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_article_to_store`
--

LOCK TABLES `oc_article_to_store` WRITE;
/*!40000 ALTER TABLE `oc_article_to_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_article_to_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_attribute`
--

DROP TABLE IF EXISTS `oc_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) DEFAULT 0,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_attribute`
--

LOCK TABLES `oc_attribute` WRITE;
/*!40000 ALTER TABLE `oc_attribute` DISABLE KEYS */;
INSERT INTO `oc_attribute` VALUES (1,6,1);
INSERT INTO `oc_attribute` VALUES (2,6,5);
INSERT INTO `oc_attribute` VALUES (3,6,3);
INSERT INTO `oc_attribute` VALUES (4,3,1);
INSERT INTO `oc_attribute` VALUES (5,3,2);
INSERT INTO `oc_attribute` VALUES (6,3,3);
INSERT INTO `oc_attribute` VALUES (7,3,4);
INSERT INTO `oc_attribute` VALUES (8,3,5);
INSERT INTO `oc_attribute` VALUES (9,3,6);
INSERT INTO `oc_attribute` VALUES (10,3,7);
INSERT INTO `oc_attribute` VALUES (11,3,8);
/*!40000 ALTER TABLE `oc_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_attribute_description`
--

DROP TABLE IF EXISTS `oc_attribute_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_attribute_description`
--

LOCK TABLES `oc_attribute_description` WRITE;
/*!40000 ALTER TABLE `oc_attribute_description` DISABLE KEYS */;
INSERT INTO `oc_attribute_description` VALUES (1,1,'Description');
INSERT INTO `oc_attribute_description` VALUES (2,1,'No. of Cores');
INSERT INTO `oc_attribute_description` VALUES (3,1,'Clockspeed');
INSERT INTO `oc_attribute_description` VALUES (4,1,'test 1');
INSERT INTO `oc_attribute_description` VALUES (5,1,'test 2');
INSERT INTO `oc_attribute_description` VALUES (6,1,'test 3');
INSERT INTO `oc_attribute_description` VALUES (7,1,'test 4');
INSERT INTO `oc_attribute_description` VALUES (8,1,'test 5');
INSERT INTO `oc_attribute_description` VALUES (9,1,'test 6');
INSERT INTO `oc_attribute_description` VALUES (10,1,'test 7');
INSERT INTO `oc_attribute_description` VALUES (11,1,'test 8');
/*!40000 ALTER TABLE `oc_attribute_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_attribute_group`
--

DROP TABLE IF EXISTS `oc_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_attribute_group`
--

LOCK TABLES `oc_attribute_group` WRITE;
/*!40000 ALTER TABLE `oc_attribute_group` DISABLE KEYS */;
INSERT INTO `oc_attribute_group` VALUES (3,2);
INSERT INTO `oc_attribute_group` VALUES (4,1);
INSERT INTO `oc_attribute_group` VALUES (5,3);
INSERT INTO `oc_attribute_group` VALUES (6,4);
/*!40000 ALTER TABLE `oc_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_attribute_group_description`
--

DROP TABLE IF EXISTS `oc_attribute_group_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_attribute_group_description`
--

LOCK TABLES `oc_attribute_group_description` WRITE;
/*!40000 ALTER TABLE `oc_attribute_group_description` DISABLE KEYS */;
INSERT INTO `oc_attribute_group_description` VALUES (3,1,'Memory');
INSERT INTO `oc_attribute_group_description` VALUES (4,1,'Technical');
INSERT INTO `oc_attribute_group_description` VALUES (5,1,'Motherboard');
INSERT INTO `oc_attribute_group_description` VALUES (6,1,'Processor');
/*!40000 ALTER TABLE `oc_attribute_group_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_banner`
--

DROP TABLE IF EXISTS `oc_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_banner`
--

LOCK TABLES `oc_banner` WRITE;
/*!40000 ALTER TABLE `oc_banner` DISABLE KEYS */;
INSERT INTO `oc_banner` VALUES (6,'HP Products',1);
INSERT INTO `oc_banner` VALUES (7,'Home Page Slideshow',1);
INSERT INTO `oc_banner` VALUES (8,'Manufacturers',1);
/*!40000 ALTER TABLE `oc_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_banner_image`
--

DROP TABLE IF EXISTS `oc_banner_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_banner_image`
--

LOCK TABLES `oc_banner_image` WRITE;
/*!40000 ALTER TABLE `oc_banner_image` DISABLE KEYS */;
INSERT INTO `oc_banner_image` VALUES (79,7,1,'iPhone 6','index.php?route=product/product&amp;path=57&amp;product_id=49','catalog/demo/banners/iPhone6.jpg',0);
INSERT INTO `oc_banner_image` VALUES (80,7,1,'MacBookAir','','catalog/demo/banners/MacBookAir.jpg',0);
INSERT INTO `oc_banner_image` VALUES (87,6,1,'HP Banner','index.php?route=product/manufacturer.info&amp;manufacturer_id=7','catalog/demo/compaq_presario.jpg',0);
INSERT INTO `oc_banner_image` VALUES (88,8,1,'Harley Davidson','','catalog/demo/manufacturer/harley.png',0);
INSERT INTO `oc_banner_image` VALUES (89,8,1,'Dell','','catalog/demo/manufacturer/dell.png',0);
INSERT INTO `oc_banner_image` VALUES (90,8,1,'Disney','','catalog/demo/manufacturer/disney.png',0);
INSERT INTO `oc_banner_image` VALUES (91,8,1,'Coca Cola','','catalog/demo/manufacturer/cocacola.png',0);
INSERT INTO `oc_banner_image` VALUES (92,8,1,'Burger King','','catalog/demo/manufacturer/burgerking.png',0);
INSERT INTO `oc_banner_image` VALUES (93,8,1,'Canon','','catalog/demo/manufacturer/canon.png',0);
INSERT INTO `oc_banner_image` VALUES (94,8,1,'NFL','','catalog/demo/manufacturer/nfl.png',0);
INSERT INTO `oc_banner_image` VALUES (95,8,1,'RedBull','','catalog/demo/manufacturer/redbull.png',0);
INSERT INTO `oc_banner_image` VALUES (96,8,1,'Sony','','catalog/demo/manufacturer/sony.png',0);
INSERT INTO `oc_banner_image` VALUES (97,8,1,'Starbucks','','catalog/demo/manufacturer/starbucks.png',0);
INSERT INTO `oc_banner_image` VALUES (98,8,1,'Nintendo','','catalog/demo/manufacturer/nintendo.png',0);
/*!40000 ALTER TABLE `oc_banner_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cart`
--

DROP TABLE IF EXISTS `oc_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT 0,
  `customer_id` int(11) DEFAULT 0,
  `session_id` varchar(32) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `subscription_plan_id` int(11) DEFAULT 0,
  `option` text DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  `override` text DEFAULT NULL,
  `price` decimal(15,4) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`customer_id`,`session_id`,`product_id`,`subscription_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cart`
--

LOCK TABLES `oc_cart` WRITE;
/*!40000 ALTER TABLE `oc_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_category`
--

DROP TABLE IF EXISTS `oc_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `sort_order` int(3) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category`
--

LOCK TABLES `oc_category` WRITE;
/*!40000 ALTER TABLE `oc_category` DISABLE KEYS */;
INSERT INTO `oc_category` VALUES (17,'',0,4,1);
INSERT INTO `oc_category` VALUES (18,'catalog/demo/hp_2.jpg',0,2,1);
INSERT INTO `oc_category` VALUES (20,'catalog/demo/compaq_presario.jpg',0,1,1);
INSERT INTO `oc_category` VALUES (24,'',0,5,1);
INSERT INTO `oc_category` VALUES (25,'',0,3,1);
INSERT INTO `oc_category` VALUES (26,'',20,1,1);
INSERT INTO `oc_category` VALUES (27,'',20,2,1);
INSERT INTO `oc_category` VALUES (28,'',25,1,1);
INSERT INTO `oc_category` VALUES (29,'',25,1,1);
INSERT INTO `oc_category` VALUES (30,'',25,1,1);
INSERT INTO `oc_category` VALUES (31,'',25,1,1);
INSERT INTO `oc_category` VALUES (32,'',25,1,1);
INSERT INTO `oc_category` VALUES (33,'',0,6,1);
INSERT INTO `oc_category` VALUES (34,'catalog/demo/ipod_touch_4.jpg',0,7,1);
INSERT INTO `oc_category` VALUES (35,'',28,0,1);
INSERT INTO `oc_category` VALUES (36,'',28,0,1);
INSERT INTO `oc_category` VALUES (37,'',34,0,1);
INSERT INTO `oc_category` VALUES (38,'',34,0,1);
INSERT INTO `oc_category` VALUES (39,'',34,0,1);
INSERT INTO `oc_category` VALUES (40,'',34,0,1);
INSERT INTO `oc_category` VALUES (41,'',34,0,1);
INSERT INTO `oc_category` VALUES (42,'',34,0,1);
INSERT INTO `oc_category` VALUES (43,'',34,0,1);
INSERT INTO `oc_category` VALUES (44,'',34,0,1);
INSERT INTO `oc_category` VALUES (45,'',18,0,1);
INSERT INTO `oc_category` VALUES (46,'',18,0,1);
INSERT INTO `oc_category` VALUES (47,'',34,0,1);
INSERT INTO `oc_category` VALUES (48,'',34,0,1);
INSERT INTO `oc_category` VALUES (49,'',34,0,1);
INSERT INTO `oc_category` VALUES (50,'',34,0,1);
INSERT INTO `oc_category` VALUES (51,'',34,0,1);
INSERT INTO `oc_category` VALUES (52,'',34,0,1);
INSERT INTO `oc_category` VALUES (53,'',34,0,1);
INSERT INTO `oc_category` VALUES (54,'',34,0,1);
INSERT INTO `oc_category` VALUES (55,'',34,0,1);
INSERT INTO `oc_category` VALUES (56,'',34,0,1);
INSERT INTO `oc_category` VALUES (57,'',0,3,1);
INSERT INTO `oc_category` VALUES (58,'',52,0,1);
/*!40000 ALTER TABLE `oc_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_category_description`
--

DROP TABLE IF EXISTS `oc_category_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category_description`
--

LOCK TABLES `oc_category_description` WRITE;
/*!40000 ALTER TABLE `oc_category_description` DISABLE KEYS */;
INSERT INTO `oc_category_description` VALUES (17,1,'Software','','Software','','');
INSERT INTO `oc_category_description` VALUES (18,1,'Laptops &amp; Notebooks','&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n','Laptops &amp; Notebooks','','');
INSERT INTO `oc_category_description` VALUES (20,1,'Desktops','&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n','Desktops','Example of category description','');
INSERT INTO `oc_category_description` VALUES (24,1,'Phones &amp; PDAs','','Phones &amp; PDAs','','');
INSERT INTO `oc_category_description` VALUES (25,1,'Components','','Components','','');
INSERT INTO `oc_category_description` VALUES (26,1,'PC','','PC','','');
INSERT INTO `oc_category_description` VALUES (27,1,'Mac','','Mac','','');
INSERT INTO `oc_category_description` VALUES (28,1,'Monitors','','Monitors','','');
INSERT INTO `oc_category_description` VALUES (29,1,'Mice and Trackballs','','Mice and Trackballs','','');
INSERT INTO `oc_category_description` VALUES (30,1,'Printers','','Printers','','');
INSERT INTO `oc_category_description` VALUES (31,1,'Scanners','','Scanners','','');
INSERT INTO `oc_category_description` VALUES (32,1,'Web Cameras','','Web Cameras','','');
INSERT INTO `oc_category_description` VALUES (33,1,'Cameras','','Cameras','','');
INSERT INTO `oc_category_description` VALUES (34,1,'MP3 Players','&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n','MP3 Players','','');
INSERT INTO `oc_category_description` VALUES (35,1,'test 1','','test 1','','');
INSERT INTO `oc_category_description` VALUES (36,1,'test 2','','test 2','','');
INSERT INTO `oc_category_description` VALUES (37,1,'test 5','','test 5','','');
INSERT INTO `oc_category_description` VALUES (38,1,'test 4','','test 4','','');
INSERT INTO `oc_category_description` VALUES (39,1,'test 6','','test 6','','');
INSERT INTO `oc_category_description` VALUES (40,1,'test 7','','test 7','','');
INSERT INTO `oc_category_description` VALUES (41,1,'test 8','','test 8','','');
INSERT INTO `oc_category_description` VALUES (42,1,'test 9','','test 9','','');
INSERT INTO `oc_category_description` VALUES (43,1,'test 11','','test 11','','');
INSERT INTO `oc_category_description` VALUES (44,1,'test 12','','test 12','','');
INSERT INTO `oc_category_description` VALUES (45,1,'Windows','','Windows','','');
INSERT INTO `oc_category_description` VALUES (46,1,'Macs','','Macs','','');
INSERT INTO `oc_category_description` VALUES (47,1,'test 15','','test 15','','');
INSERT INTO `oc_category_description` VALUES (48,1,'test 16','','test 16','','');
INSERT INTO `oc_category_description` VALUES (49,1,'test 17','','test 17','','');
INSERT INTO `oc_category_description` VALUES (50,1,'test 18','','test 18','','');
INSERT INTO `oc_category_description` VALUES (51,1,'test 19','','test 19','','');
INSERT INTO `oc_category_description` VALUES (52,1,'test 20','','test 20','','');
INSERT INTO `oc_category_description` VALUES (53,1,'test 21','','test 21','','');
INSERT INTO `oc_category_description` VALUES (54,1,'test 22','','test 22','','');
INSERT INTO `oc_category_description` VALUES (55,1,'test 23','','test 23','','');
INSERT INTO `oc_category_description` VALUES (56,1,'test 24','','test 24','','');
INSERT INTO `oc_category_description` VALUES (57,1,'Tablets','','Tablets','','');
INSERT INTO `oc_category_description` VALUES (58,1,'test 25','','test 25','','');
/*!40000 ALTER TABLE `oc_category_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_category_filter`
--

DROP TABLE IF EXISTS `oc_category_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category_filter`
--

LOCK TABLES `oc_category_filter` WRITE;
/*!40000 ALTER TABLE `oc_category_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_category_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_category_path`
--

DROP TABLE IF EXISTS `oc_category_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category_path`
--

LOCK TABLES `oc_category_path` WRITE;
/*!40000 ALTER TABLE `oc_category_path` DISABLE KEYS */;
INSERT INTO `oc_category_path` VALUES (17,17,0);
INSERT INTO `oc_category_path` VALUES (18,18,0);
INSERT INTO `oc_category_path` VALUES (20,20,0);
INSERT INTO `oc_category_path` VALUES (24,24,0);
INSERT INTO `oc_category_path` VALUES (25,25,0);
INSERT INTO `oc_category_path` VALUES (26,20,0);
INSERT INTO `oc_category_path` VALUES (26,26,1);
INSERT INTO `oc_category_path` VALUES (27,20,0);
INSERT INTO `oc_category_path` VALUES (27,27,1);
INSERT INTO `oc_category_path` VALUES (28,25,0);
INSERT INTO `oc_category_path` VALUES (28,28,1);
INSERT INTO `oc_category_path` VALUES (29,25,0);
INSERT INTO `oc_category_path` VALUES (29,29,1);
INSERT INTO `oc_category_path` VALUES (30,25,0);
INSERT INTO `oc_category_path` VALUES (30,30,1);
INSERT INTO `oc_category_path` VALUES (31,25,0);
INSERT INTO `oc_category_path` VALUES (31,31,1);
INSERT INTO `oc_category_path` VALUES (32,25,0);
INSERT INTO `oc_category_path` VALUES (32,32,1);
INSERT INTO `oc_category_path` VALUES (33,33,0);
INSERT INTO `oc_category_path` VALUES (34,34,0);
INSERT INTO `oc_category_path` VALUES (35,25,0);
INSERT INTO `oc_category_path` VALUES (35,28,1);
INSERT INTO `oc_category_path` VALUES (35,35,2);
INSERT INTO `oc_category_path` VALUES (36,25,0);
INSERT INTO `oc_category_path` VALUES (36,28,1);
INSERT INTO `oc_category_path` VALUES (36,36,2);
INSERT INTO `oc_category_path` VALUES (37,34,0);
INSERT INTO `oc_category_path` VALUES (37,37,1);
INSERT INTO `oc_category_path` VALUES (38,34,0);
INSERT INTO `oc_category_path` VALUES (38,38,1);
INSERT INTO `oc_category_path` VALUES (39,34,0);
INSERT INTO `oc_category_path` VALUES (39,39,1);
INSERT INTO `oc_category_path` VALUES (40,34,0);
INSERT INTO `oc_category_path` VALUES (40,40,1);
INSERT INTO `oc_category_path` VALUES (41,34,0);
INSERT INTO `oc_category_path` VALUES (41,41,1);
INSERT INTO `oc_category_path` VALUES (42,34,0);
INSERT INTO `oc_category_path` VALUES (42,42,1);
INSERT INTO `oc_category_path` VALUES (43,34,0);
INSERT INTO `oc_category_path` VALUES (43,43,1);
INSERT INTO `oc_category_path` VALUES (44,34,0);
INSERT INTO `oc_category_path` VALUES (44,44,1);
INSERT INTO `oc_category_path` VALUES (45,18,0);
INSERT INTO `oc_category_path` VALUES (45,45,1);
INSERT INTO `oc_category_path` VALUES (46,18,0);
INSERT INTO `oc_category_path` VALUES (46,46,1);
INSERT INTO `oc_category_path` VALUES (47,34,0);
INSERT INTO `oc_category_path` VALUES (47,47,1);
INSERT INTO `oc_category_path` VALUES (48,34,0);
INSERT INTO `oc_category_path` VALUES (48,48,1);
INSERT INTO `oc_category_path` VALUES (49,34,0);
INSERT INTO `oc_category_path` VALUES (49,49,1);
INSERT INTO `oc_category_path` VALUES (50,34,0);
INSERT INTO `oc_category_path` VALUES (50,50,1);
INSERT INTO `oc_category_path` VALUES (51,34,0);
INSERT INTO `oc_category_path` VALUES (51,51,1);
INSERT INTO `oc_category_path` VALUES (52,34,0);
INSERT INTO `oc_category_path` VALUES (52,52,1);
INSERT INTO `oc_category_path` VALUES (53,34,0);
INSERT INTO `oc_category_path` VALUES (53,53,1);
INSERT INTO `oc_category_path` VALUES (54,34,0);
INSERT INTO `oc_category_path` VALUES (54,54,1);
INSERT INTO `oc_category_path` VALUES (55,34,0);
INSERT INTO `oc_category_path` VALUES (55,55,1);
INSERT INTO `oc_category_path` VALUES (56,34,0);
INSERT INTO `oc_category_path` VALUES (56,56,1);
INSERT INTO `oc_category_path` VALUES (57,57,0);
INSERT INTO `oc_category_path` VALUES (58,34,0);
INSERT INTO `oc_category_path` VALUES (58,52,1);
INSERT INTO `oc_category_path` VALUES (58,58,2);
/*!40000 ALTER TABLE `oc_category_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_category_to_layout`
--

DROP TABLE IF EXISTS `oc_category_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `layout_id` int(11) DEFAULT 0,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category_to_layout`
--

LOCK TABLES `oc_category_to_layout` WRITE;
/*!40000 ALTER TABLE `oc_category_to_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_category_to_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_category_to_store`
--

DROP TABLE IF EXISTS `oc_category_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category_to_store`
--

LOCK TABLES `oc_category_to_store` WRITE;
/*!40000 ALTER TABLE `oc_category_to_store` DISABLE KEYS */;
INSERT INTO `oc_category_to_store` VALUES (17,0);
INSERT INTO `oc_category_to_store` VALUES (18,0);
INSERT INTO `oc_category_to_store` VALUES (20,0);
INSERT INTO `oc_category_to_store` VALUES (24,0);
INSERT INTO `oc_category_to_store` VALUES (25,0);
INSERT INTO `oc_category_to_store` VALUES (26,0);
INSERT INTO `oc_category_to_store` VALUES (27,0);
INSERT INTO `oc_category_to_store` VALUES (28,0);
INSERT INTO `oc_category_to_store` VALUES (29,0);
INSERT INTO `oc_category_to_store` VALUES (30,0);
INSERT INTO `oc_category_to_store` VALUES (31,0);
INSERT INTO `oc_category_to_store` VALUES (32,0);
INSERT INTO `oc_category_to_store` VALUES (33,0);
INSERT INTO `oc_category_to_store` VALUES (34,0);
INSERT INTO `oc_category_to_store` VALUES (35,0);
INSERT INTO `oc_category_to_store` VALUES (36,0);
INSERT INTO `oc_category_to_store` VALUES (37,0);
INSERT INTO `oc_category_to_store` VALUES (38,0);
INSERT INTO `oc_category_to_store` VALUES (39,0);
INSERT INTO `oc_category_to_store` VALUES (40,0);
INSERT INTO `oc_category_to_store` VALUES (41,0);
INSERT INTO `oc_category_to_store` VALUES (42,0);
INSERT INTO `oc_category_to_store` VALUES (43,0);
INSERT INTO `oc_category_to_store` VALUES (44,0);
INSERT INTO `oc_category_to_store` VALUES (45,0);
INSERT INTO `oc_category_to_store` VALUES (46,0);
INSERT INTO `oc_category_to_store` VALUES (47,0);
INSERT INTO `oc_category_to_store` VALUES (48,0);
INSERT INTO `oc_category_to_store` VALUES (49,0);
INSERT INTO `oc_category_to_store` VALUES (50,0);
INSERT INTO `oc_category_to_store` VALUES (51,0);
INSERT INTO `oc_category_to_store` VALUES (52,0);
INSERT INTO `oc_category_to_store` VALUES (53,0);
INSERT INTO `oc_category_to_store` VALUES (54,0);
INSERT INTO `oc_category_to_store` VALUES (55,0);
INSERT INTO `oc_category_to_store` VALUES (56,0);
INSERT INTO `oc_category_to_store` VALUES (57,0);
INSERT INTO `oc_category_to_store` VALUES (58,0);
/*!40000 ALTER TABLE `oc_category_to_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_country`
--

DROP TABLE IF EXISTS `oc_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `iso_code_2` varchar(2) DEFAULT NULL,
  `iso_code_3` varchar(3) DEFAULT NULL,
  `address_format_id` int(11) DEFAULT 0,
  `postcode_required` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_country`
--

LOCK TABLES `oc_country` WRITE;
/*!40000 ALTER TABLE `oc_country` DISABLE KEYS */;
INSERT INTO `oc_country` VALUES (1,'AF','AFG',1,0,1);
INSERT INTO `oc_country` VALUES (2,'AL','ALB',1,0,1);
INSERT INTO `oc_country` VALUES (3,'DZ','DZA',1,0,1);
INSERT INTO `oc_country` VALUES (4,'AS','ASM',1,0,1);
INSERT INTO `oc_country` VALUES (5,'AD','AND',1,0,1);
INSERT INTO `oc_country` VALUES (6,'AO','AGO',1,0,1);
INSERT INTO `oc_country` VALUES (7,'AI','AIA',1,0,1);
INSERT INTO `oc_country` VALUES (8,'AQ','ATA',1,0,1);
INSERT INTO `oc_country` VALUES (9,'AG','ATG',1,0,1);
INSERT INTO `oc_country` VALUES (10,'AR','ARG',1,0,1);
INSERT INTO `oc_country` VALUES (11,'AM','ARM',1,0,1);
INSERT INTO `oc_country` VALUES (12,'AW','ABW',1,0,1);
INSERT INTO `oc_country` VALUES (13,'AU','AUS',1,0,1);
INSERT INTO `oc_country` VALUES (14,'AT','AUT',1,0,1);
INSERT INTO `oc_country` VALUES (15,'AZ','AZE',1,0,1);
INSERT INTO `oc_country` VALUES (16,'BS','BHS',1,0,1);
INSERT INTO `oc_country` VALUES (17,'BH','BHR',1,0,1);
INSERT INTO `oc_country` VALUES (18,'BD','BGD',1,0,1);
INSERT INTO `oc_country` VALUES (19,'BB','BRB',1,0,1);
INSERT INTO `oc_country` VALUES (20,'BY','BLR',1,0,1);
INSERT INTO `oc_country` VALUES (21,'BE','BEL',1,0,1);
INSERT INTO `oc_country` VALUES (22,'BZ','BLZ',1,0,1);
INSERT INTO `oc_country` VALUES (23,'BJ','BEN',1,0,1);
INSERT INTO `oc_country` VALUES (24,'BM','BMU',1,0,1);
INSERT INTO `oc_country` VALUES (25,'BT','BTN',1,0,1);
INSERT INTO `oc_country` VALUES (26,'BO','BOL',1,0,1);
INSERT INTO `oc_country` VALUES (27,'BA','BIH',1,0,1);
INSERT INTO `oc_country` VALUES (28,'BW','BWA',1,0,1);
INSERT INTO `oc_country` VALUES (29,'BV','BVT',1,0,1);
INSERT INTO `oc_country` VALUES (30,'BR','BRA',1,0,1);
INSERT INTO `oc_country` VALUES (31,'IO','IOT',1,0,1);
INSERT INTO `oc_country` VALUES (32,'BN','BRN',1,0,1);
INSERT INTO `oc_country` VALUES (33,'BG','BGR',1,0,1);
INSERT INTO `oc_country` VALUES (34,'BF','BFA',1,0,1);
INSERT INTO `oc_country` VALUES (35,'BI','BDI',1,0,1);
INSERT INTO `oc_country` VALUES (36,'KH','KHM',1,0,1);
INSERT INTO `oc_country` VALUES (37,'CM','CMR',1,0,1);
INSERT INTO `oc_country` VALUES (38,'CA','CAN',1,0,1);
INSERT INTO `oc_country` VALUES (39,'CV','CPV',1,0,1);
INSERT INTO `oc_country` VALUES (40,'KY','CYM',1,0,1);
INSERT INTO `oc_country` VALUES (41,'CF','CAF',1,0,1);
INSERT INTO `oc_country` VALUES (42,'TD','TCD',1,0,1);
INSERT INTO `oc_country` VALUES (43,'CL','CHL',1,0,1);
INSERT INTO `oc_country` VALUES (44,'CN','CHN',1,0,1);
INSERT INTO `oc_country` VALUES (45,'CX','CXR',1,0,1);
INSERT INTO `oc_country` VALUES (46,'CC','CCK',1,0,1);
INSERT INTO `oc_country` VALUES (47,'CO','COL',1,0,1);
INSERT INTO `oc_country` VALUES (48,'KM','COM',1,0,1);
INSERT INTO `oc_country` VALUES (49,'CG','COG',1,0,1);
INSERT INTO `oc_country` VALUES (50,'CK','COK',1,0,1);
INSERT INTO `oc_country` VALUES (51,'CR','CRI',1,0,1);
INSERT INTO `oc_country` VALUES (52,'CI','CIV',1,0,1);
INSERT INTO `oc_country` VALUES (53,'HR','HRV',1,0,1);
INSERT INTO `oc_country` VALUES (54,'CU','CUB',1,0,1);
INSERT INTO `oc_country` VALUES (55,'CY','CYP',1,0,1);
INSERT INTO `oc_country` VALUES (56,'CZ','CZE',1,0,1);
INSERT INTO `oc_country` VALUES (57,'DK','DNK',1,0,1);
INSERT INTO `oc_country` VALUES (58,'DJ','DJI',1,0,1);
INSERT INTO `oc_country` VALUES (59,'DM','DMA',1,0,1);
INSERT INTO `oc_country` VALUES (60,'DO','DOM',1,0,1);
INSERT INTO `oc_country` VALUES (61,'TL','TLS',1,0,1);
INSERT INTO `oc_country` VALUES (62,'EC','ECU',1,0,1);
INSERT INTO `oc_country` VALUES (63,'EG','EGY',1,0,1);
INSERT INTO `oc_country` VALUES (64,'SV','SLV',1,0,1);
INSERT INTO `oc_country` VALUES (65,'GQ','GNQ',1,0,1);
INSERT INTO `oc_country` VALUES (66,'ER','ERI',1,0,1);
INSERT INTO `oc_country` VALUES (67,'EE','EST',1,0,1);
INSERT INTO `oc_country` VALUES (68,'ET','ETH',1,0,1);
INSERT INTO `oc_country` VALUES (69,'FK','FLK',1,0,1);
INSERT INTO `oc_country` VALUES (70,'FO','FRO',1,0,1);
INSERT INTO `oc_country` VALUES (71,'FJ','FJI',1,0,1);
INSERT INTO `oc_country` VALUES (72,'FI','FIN',1,0,1);
INSERT INTO `oc_country` VALUES (74,'FR','FRA',1,1,1);
INSERT INTO `oc_country` VALUES (75,'GF','GUF',1,0,1);
INSERT INTO `oc_country` VALUES (76,'PF','PYF',1,0,1);
INSERT INTO `oc_country` VALUES (77,'TF','ATF',1,0,1);
INSERT INTO `oc_country` VALUES (78,'GA','GAB',1,0,1);
INSERT INTO `oc_country` VALUES (79,'GM','GMB',1,0,1);
INSERT INTO `oc_country` VALUES (80,'GE','GEO',1,0,1);
INSERT INTO `oc_country` VALUES (81,'DE','DEU',1,1,1);
INSERT INTO `oc_country` VALUES (82,'GH','GHA',1,0,1);
INSERT INTO `oc_country` VALUES (83,'GI','GIB',1,0,1);
INSERT INTO `oc_country` VALUES (84,'GR','GRC',1,0,1);
INSERT INTO `oc_country` VALUES (85,'GL','GRL',1,0,1);
INSERT INTO `oc_country` VALUES (86,'GD','GRD',1,0,1);
INSERT INTO `oc_country` VALUES (87,'GP','GLP',1,0,1);
INSERT INTO `oc_country` VALUES (88,'GU','GUM',1,0,1);
INSERT INTO `oc_country` VALUES (89,'GT','GTM',1,0,1);
INSERT INTO `oc_country` VALUES (90,'GN','GIN',1,0,1);
INSERT INTO `oc_country` VALUES (91,'GW','GNB',1,0,1);
INSERT INTO `oc_country` VALUES (92,'GY','GUY',1,0,1);
INSERT INTO `oc_country` VALUES (93,'HT','HTI',1,0,1);
INSERT INTO `oc_country` VALUES (94,'HM','HMD',1,0,1);
INSERT INTO `oc_country` VALUES (95,'HN','HND',1,0,1);
INSERT INTO `oc_country` VALUES (96,'HK','HKG',1,0,1);
INSERT INTO `oc_country` VALUES (97,'HU','HUN',1,0,1);
INSERT INTO `oc_country` VALUES (98,'IS','ISL',1,0,1);
INSERT INTO `oc_country` VALUES (99,'IN','IND',1,0,1);
INSERT INTO `oc_country` VALUES (100,'ID','IDN',1,0,1);
INSERT INTO `oc_country` VALUES (101,'IR','IRN',1,0,1);
INSERT INTO `oc_country` VALUES (102,'IQ','IRQ',1,0,1);
INSERT INTO `oc_country` VALUES (103,'IE','IRL',1,0,1);
INSERT INTO `oc_country` VALUES (104,'IL','ISR',1,0,1);
INSERT INTO `oc_country` VALUES (105,'IT','ITA',1,0,1);
INSERT INTO `oc_country` VALUES (106,'JM','JAM',1,0,1);
INSERT INTO `oc_country` VALUES (107,'JP','JPN',1,0,1);
INSERT INTO `oc_country` VALUES (108,'JO','JOR',1,0,1);
INSERT INTO `oc_country` VALUES (109,'KZ','KAZ',1,0,1);
INSERT INTO `oc_country` VALUES (110,'KE','KEN',1,0,1);
INSERT INTO `oc_country` VALUES (111,'KI','KIR',1,0,1);
INSERT INTO `oc_country` VALUES (112,'KP','PRK',1,0,1);
INSERT INTO `oc_country` VALUES (113,'KR','KOR',1,0,1);
INSERT INTO `oc_country` VALUES (114,'KW','KWT',1,0,1);
INSERT INTO `oc_country` VALUES (115,'KG','KGZ',1,0,1);
INSERT INTO `oc_country` VALUES (116,'LA','LAO',1,0,1);
INSERT INTO `oc_country` VALUES (117,'LV','LVA',1,0,1);
INSERT INTO `oc_country` VALUES (118,'LB','LBN',1,0,1);
INSERT INTO `oc_country` VALUES (119,'LS','LSO',1,0,1);
INSERT INTO `oc_country` VALUES (120,'LR','LBR',1,0,1);
INSERT INTO `oc_country` VALUES (121,'LY','LBY',1,0,1);
INSERT INTO `oc_country` VALUES (122,'LI','LIE',1,0,1);
INSERT INTO `oc_country` VALUES (123,'LT','LTU',1,0,1);
INSERT INTO `oc_country` VALUES (124,'LU','LUX',1,0,1);
INSERT INTO `oc_country` VALUES (125,'MO','MAC',1,0,1);
INSERT INTO `oc_country` VALUES (126,'MK','MKD',1,0,1);
INSERT INTO `oc_country` VALUES (127,'MG','MDG',1,0,1);
INSERT INTO `oc_country` VALUES (128,'MW','MWI',1,0,1);
INSERT INTO `oc_country` VALUES (129,'MY','MYS',1,0,1);
INSERT INTO `oc_country` VALUES (130,'MV','MDV',1,0,1);
INSERT INTO `oc_country` VALUES (131,'ML','MLI',1,0,1);
INSERT INTO `oc_country` VALUES (132,'MT','MLT',1,0,1);
INSERT INTO `oc_country` VALUES (133,'MH','MHL',1,0,1);
INSERT INTO `oc_country` VALUES (134,'MQ','MTQ',1,0,1);
INSERT INTO `oc_country` VALUES (135,'MR','MRT',1,0,1);
INSERT INTO `oc_country` VALUES (136,'MU','MUS',1,0,1);
INSERT INTO `oc_country` VALUES (137,'YT','MYT',1,0,1);
INSERT INTO `oc_country` VALUES (138,'MX','MEX',1,0,1);
INSERT INTO `oc_country` VALUES (139,'FM','FSM',1,0,1);
INSERT INTO `oc_country` VALUES (140,'MD','MDA',1,0,1);
INSERT INTO `oc_country` VALUES (141,'MC','MCO',1,0,1);
INSERT INTO `oc_country` VALUES (142,'MN','MNG',1,0,1);
INSERT INTO `oc_country` VALUES (143,'MS','MSR',1,0,1);
INSERT INTO `oc_country` VALUES (144,'MA','MAR',1,0,1);
INSERT INTO `oc_country` VALUES (145,'MZ','MOZ',1,0,1);
INSERT INTO `oc_country` VALUES (146,'MM','MMR',1,0,1);
INSERT INTO `oc_country` VALUES (147,'NA','NAM',1,0,1);
INSERT INTO `oc_country` VALUES (148,'NR','NRU',1,0,1);
INSERT INTO `oc_country` VALUES (149,'NP','NPL',1,0,1);
INSERT INTO `oc_country` VALUES (150,'NL','NLD',1,0,1);
INSERT INTO `oc_country` VALUES (151,'AN','ANT',1,0,1);
INSERT INTO `oc_country` VALUES (152,'NC','NCL',1,0,1);
INSERT INTO `oc_country` VALUES (153,'NZ','NZL',1,0,1);
INSERT INTO `oc_country` VALUES (154,'NI','NIC',1,0,1);
INSERT INTO `oc_country` VALUES (155,'NE','NER',1,0,1);
INSERT INTO `oc_country` VALUES (156,'NG','NGA',1,0,1);
INSERT INTO `oc_country` VALUES (157,'NU','NIU',1,0,1);
INSERT INTO `oc_country` VALUES (158,'NF','NFK',1,0,1);
INSERT INTO `oc_country` VALUES (159,'MP','MNP',1,0,1);
INSERT INTO `oc_country` VALUES (160,'NO','NOR',1,0,1);
INSERT INTO `oc_country` VALUES (161,'OM','OMN',1,0,1);
INSERT INTO `oc_country` VALUES (162,'PK','PAK',1,0,1);
INSERT INTO `oc_country` VALUES (163,'PW','PLW',1,0,1);
INSERT INTO `oc_country` VALUES (164,'PA','PAN',1,0,1);
INSERT INTO `oc_country` VALUES (165,'PG','PNG',1,0,1);
INSERT INTO `oc_country` VALUES (166,'PY','PRY',1,0,1);
INSERT INTO `oc_country` VALUES (167,'PE','PER',1,0,1);
INSERT INTO `oc_country` VALUES (168,'PH','PHL',1,0,1);
INSERT INTO `oc_country` VALUES (169,'PN','PCN',1,0,1);
INSERT INTO `oc_country` VALUES (170,'PL','POL',1,0,1);
INSERT INTO `oc_country` VALUES (171,'PT','PRT',1,0,1);
INSERT INTO `oc_country` VALUES (172,'PR','PRI',1,0,1);
INSERT INTO `oc_country` VALUES (173,'QA','QAT',1,0,1);
INSERT INTO `oc_country` VALUES (174,'RE','REU',1,0,1);
INSERT INTO `oc_country` VALUES (175,'RO','ROM',1,0,1);
INSERT INTO `oc_country` VALUES (176,'RU','RUS',1,0,1);
INSERT INTO `oc_country` VALUES (177,'RW','RWA',1,0,1);
INSERT INTO `oc_country` VALUES (178,'KN','KNA',1,0,1);
INSERT INTO `oc_country` VALUES (179,'LC','LCA',1,0,1);
INSERT INTO `oc_country` VALUES (180,'VC','VCT',1,0,1);
INSERT INTO `oc_country` VALUES (181,'WS','WSM',1,0,1);
INSERT INTO `oc_country` VALUES (182,'SM','SMR',1,0,1);
INSERT INTO `oc_country` VALUES (183,'ST','STP',1,0,1);
INSERT INTO `oc_country` VALUES (184,'SA','SAU',1,0,1);
INSERT INTO `oc_country` VALUES (185,'SN','SEN',1,0,1);
INSERT INTO `oc_country` VALUES (186,'SC','SYC',1,0,1);
INSERT INTO `oc_country` VALUES (187,'SL','SLE',1,0,1);
INSERT INTO `oc_country` VALUES (188,'SG','SGP',1,0,1);
INSERT INTO `oc_country` VALUES (189,'SK','SVK',1,0,1);
INSERT INTO `oc_country` VALUES (190,'SI','SVN',1,0,1);
INSERT INTO `oc_country` VALUES (191,'SB','SLB',1,0,1);
INSERT INTO `oc_country` VALUES (192,'SO','SOM',1,0,1);
INSERT INTO `oc_country` VALUES (193,'ZA','ZAF',1,0,1);
INSERT INTO `oc_country` VALUES (194,'GS','SGS',1,0,1);
INSERT INTO `oc_country` VALUES (195,'ES','ESP',1,0,1);
INSERT INTO `oc_country` VALUES (196,'LK','LKA',1,0,1);
INSERT INTO `oc_country` VALUES (197,'SH','SHN',1,0,1);
INSERT INTO `oc_country` VALUES (198,'PM','SPM',1,0,1);
INSERT INTO `oc_country` VALUES (199,'SD','SDN',1,0,1);
INSERT INTO `oc_country` VALUES (200,'SR','SUR',1,0,1);
INSERT INTO `oc_country` VALUES (201,'SJ','SJM',1,0,1);
INSERT INTO `oc_country` VALUES (202,'SZ','SWZ',1,0,1);
INSERT INTO `oc_country` VALUES (203,'SE','SWE',1,1,1);
INSERT INTO `oc_country` VALUES (204,'CH','CHE',1,0,1);
INSERT INTO `oc_country` VALUES (205,'SY','SYR',1,0,1);
INSERT INTO `oc_country` VALUES (206,'TW','TWN',1,0,1);
INSERT INTO `oc_country` VALUES (207,'TJ','TJK',1,0,1);
INSERT INTO `oc_country` VALUES (208,'TZ','TZA',1,0,1);
INSERT INTO `oc_country` VALUES (209,'TH','THA',1,0,1);
INSERT INTO `oc_country` VALUES (210,'TG','TGO',1,0,1);
INSERT INTO `oc_country` VALUES (211,'TK','TKL',1,0,1);
INSERT INTO `oc_country` VALUES (212,'TO','TON',1,0,1);
INSERT INTO `oc_country` VALUES (213,'TT','TTO',1,0,1);
INSERT INTO `oc_country` VALUES (214,'TN','TUN',1,0,1);
INSERT INTO `oc_country` VALUES (215,'TR','TUR',1,0,1);
INSERT INTO `oc_country` VALUES (216,'TM','TKM',1,0,1);
INSERT INTO `oc_country` VALUES (217,'TC','TCA',1,0,1);
INSERT INTO `oc_country` VALUES (218,'TV','TUV',1,0,1);
INSERT INTO `oc_country` VALUES (219,'UG','UGA',1,0,1);
INSERT INTO `oc_country` VALUES (220,'UA','UKR',1,0,1);
INSERT INTO `oc_country` VALUES (221,'AE','ARE',1,0,1);
INSERT INTO `oc_country` VALUES (222,'GB','GBR',1,1,1);
INSERT INTO `oc_country` VALUES (223,'US','USA',1,0,1);
INSERT INTO `oc_country` VALUES (224,'UM','UMI',1,0,1);
INSERT INTO `oc_country` VALUES (225,'UY','URY',1,0,1);
INSERT INTO `oc_country` VALUES (226,'UZ','UZB',1,0,1);
INSERT INTO `oc_country` VALUES (227,'VU','VUT',1,0,1);
INSERT INTO `oc_country` VALUES (228,'VA','VAT',1,0,1);
INSERT INTO `oc_country` VALUES (229,'VE','VEN',1,0,1);
INSERT INTO `oc_country` VALUES (230,'VN','VNM',1,0,1);
INSERT INTO `oc_country` VALUES (231,'VG','VGB',1,0,1);
INSERT INTO `oc_country` VALUES (232,'VI','VIR',1,0,1);
INSERT INTO `oc_country` VALUES (233,'WF','WLF',1,0,1);
INSERT INTO `oc_country` VALUES (234,'EH','ESH',1,0,1);
INSERT INTO `oc_country` VALUES (235,'YE','YEM',1,0,1);
INSERT INTO `oc_country` VALUES (237,'CD','COD',1,0,1);
INSERT INTO `oc_country` VALUES (238,'ZM','ZMB',1,0,1);
INSERT INTO `oc_country` VALUES (239,'ZW','ZWE',1,0,1);
INSERT INTO `oc_country` VALUES (242,'ME','MNE',1,0,1);
INSERT INTO `oc_country` VALUES (243,'RS','SRB',1,0,1);
INSERT INTO `oc_country` VALUES (244,'AX','ALA',1,0,1);
INSERT INTO `oc_country` VALUES (245,'BQ','BES',1,0,1);
INSERT INTO `oc_country` VALUES (246,'CW','CUW',1,0,1);
INSERT INTO `oc_country` VALUES (247,'PS','PSE',1,0,1);
INSERT INTO `oc_country` VALUES (248,'SS','SSD',1,0,1);
INSERT INTO `oc_country` VALUES (249,'BL','BLM',1,0,1);
INSERT INTO `oc_country` VALUES (250,'MF','MAF',1,0,1);
INSERT INTO `oc_country` VALUES (251,'IC','ICA',1,0,1);
INSERT INTO `oc_country` VALUES (252,'AC','ASC',1,0,1);
INSERT INTO `oc_country` VALUES (253,'XK','UNK',1,0,1);
INSERT INTO `oc_country` VALUES (254,'IM','IMN',1,0,1);
INSERT INTO `oc_country` VALUES (255,'TA','SHN',1,0,1);
INSERT INTO `oc_country` VALUES (256,'GG','GGY',1,0,1);
INSERT INTO `oc_country` VALUES (257,'JE','JEY',1,0,1);
/*!40000 ALTER TABLE `oc_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_country_description`
--

DROP TABLE IF EXISTS `oc_country_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_country_description` (
  `country_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`country_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_country_description`
--

LOCK TABLES `oc_country_description` WRITE;
/*!40000 ALTER TABLE `oc_country_description` DISABLE KEYS */;
INSERT INTO `oc_country_description` VALUES (244,1,'Aaland Islands');
INSERT INTO `oc_country_description` VALUES (1,1,'Afghanistan');
INSERT INTO `oc_country_description` VALUES (2,1,'Albania');
INSERT INTO `oc_country_description` VALUES (3,1,'Algeria');
INSERT INTO `oc_country_description` VALUES (4,1,'American Samoa');
INSERT INTO `oc_country_description` VALUES (5,1,'Andorra');
INSERT INTO `oc_country_description` VALUES (6,1,'Angola');
INSERT INTO `oc_country_description` VALUES (7,1,'Anguilla');
INSERT INTO `oc_country_description` VALUES (8,1,'Antarctica');
INSERT INTO `oc_country_description` VALUES (9,1,'Antigua and Barbuda');
INSERT INTO `oc_country_description` VALUES (10,1,'Argentina');
INSERT INTO `oc_country_description` VALUES (11,1,'Armenia');
INSERT INTO `oc_country_description` VALUES (12,1,'Aruba');
INSERT INTO `oc_country_description` VALUES (252,1,'Ascension Island (British)');
INSERT INTO `oc_country_description` VALUES (13,1,'Australia');
INSERT INTO `oc_country_description` VALUES (14,1,'Austria');
INSERT INTO `oc_country_description` VALUES (15,1,'Azerbaijan');
INSERT INTO `oc_country_description` VALUES (17,1,'Bahrain');
INSERT INTO `oc_country_description` VALUES (18,1,'Bangladesh');
INSERT INTO `oc_country_description` VALUES (19,1,'Barbados');
INSERT INTO `oc_country_description` VALUES (20,1,'Belarus');
INSERT INTO `oc_country_description` VALUES (21,1,'Belgium');
INSERT INTO `oc_country_description` VALUES (22,1,'Belize');
INSERT INTO `oc_country_description` VALUES (23,1,'Benin');
INSERT INTO `oc_country_description` VALUES (24,1,'Bermuda');
INSERT INTO `oc_country_description` VALUES (25,1,'Bhutan');
INSERT INTO `oc_country_description` VALUES (26,1,'Bolivia');
INSERT INTO `oc_country_description` VALUES (245,1,'Bonaire, Sint Eustatius and Saba');
INSERT INTO `oc_country_description` VALUES (27,1,'Bosnia and Herzegovina');
INSERT INTO `oc_country_description` VALUES (28,1,'Botswana');
INSERT INTO `oc_country_description` VALUES (29,1,'Bouvet Island');
INSERT INTO `oc_country_description` VALUES (30,1,'Brazil');
INSERT INTO `oc_country_description` VALUES (31,1,'British Indian Ocean Territory');
INSERT INTO `oc_country_description` VALUES (32,1,'Brunei');
INSERT INTO `oc_country_description` VALUES (33,1,'Bulgaria');
INSERT INTO `oc_country_description` VALUES (34,1,'Burkina Faso');
INSERT INTO `oc_country_description` VALUES (35,1,'Burundi');
INSERT INTO `oc_country_description` VALUES (36,1,'Cambodia');
INSERT INTO `oc_country_description` VALUES (37,1,'Cameroon');
INSERT INTO `oc_country_description` VALUES (38,1,'Canada');
INSERT INTO `oc_country_description` VALUES (251,1,'Canary Islands');
INSERT INTO `oc_country_description` VALUES (39,1,'Cape Verde');
INSERT INTO `oc_country_description` VALUES (40,1,'Cayman Islands');
INSERT INTO `oc_country_description` VALUES (41,1,'Central African Republic');
INSERT INTO `oc_country_description` VALUES (42,1,'Chad');
INSERT INTO `oc_country_description` VALUES (43,1,'Chile');
INSERT INTO `oc_country_description` VALUES (44,1,'China');
INSERT INTO `oc_country_description` VALUES (45,1,'Christmas Island');
INSERT INTO `oc_country_description` VALUES (46,1,'Cocos (Keeling) Islands');
INSERT INTO `oc_country_description` VALUES (47,1,'Colombia');
INSERT INTO `oc_country_description` VALUES (48,1,'Comoros');
INSERT INTO `oc_country_description` VALUES (49,1,'Congo');
INSERT INTO `oc_country_description` VALUES (50,1,'Cook Islands');
INSERT INTO `oc_country_description` VALUES (51,1,'Costa Rica');
INSERT INTO `oc_country_description` VALUES (52,1,'Cote D\'Ivoire');
INSERT INTO `oc_country_description` VALUES (53,1,'Croatia');
INSERT INTO `oc_country_description` VALUES (54,1,'Cuba');
INSERT INTO `oc_country_description` VALUES (246,1,'Curacao');
INSERT INTO `oc_country_description` VALUES (55,1,'Cyprus');
INSERT INTO `oc_country_description` VALUES (56,1,'Czech Republic');
INSERT INTO `oc_country_description` VALUES (237,1,'Democratic Republic of the Congo');
INSERT INTO `oc_country_description` VALUES (57,1,'Denmark');
INSERT INTO `oc_country_description` VALUES (58,1,'Djibouti');
INSERT INTO `oc_country_description` VALUES (59,1,'Dominica');
INSERT INTO `oc_country_description` VALUES (60,1,'Dominican Republic');
INSERT INTO `oc_country_description` VALUES (62,1,'Ecuador');
INSERT INTO `oc_country_description` VALUES (63,1,'Egypt');
INSERT INTO `oc_country_description` VALUES (64,1,'El Salvador');
INSERT INTO `oc_country_description` VALUES (65,1,'Equatorial Guinea');
INSERT INTO `oc_country_description` VALUES (66,1,'Eritrea');
INSERT INTO `oc_country_description` VALUES (67,1,'Estonia');
INSERT INTO `oc_country_description` VALUES (202,1,'Eswatini');
INSERT INTO `oc_country_description` VALUES (68,1,'Ethiopia');
INSERT INTO `oc_country_description` VALUES (69,1,'Falkland Islands (Malvinas)');
INSERT INTO `oc_country_description` VALUES (70,1,'Faroe Islands');
INSERT INTO `oc_country_description` VALUES (71,1,'Fiji');
INSERT INTO `oc_country_description` VALUES (72,1,'Finland');
INSERT INTO `oc_country_description` VALUES (74,1,'France, Metropolitan');
INSERT INTO `oc_country_description` VALUES (75,1,'French Guiana');
INSERT INTO `oc_country_description` VALUES (76,1,'French Polynesia');
INSERT INTO `oc_country_description` VALUES (77,1,'French Southern Territories');
INSERT INTO `oc_country_description` VALUES (78,1,'Gabon');
INSERT INTO `oc_country_description` VALUES (80,1,'Georgia');
INSERT INTO `oc_country_description` VALUES (81,1,'Germany');
INSERT INTO `oc_country_description` VALUES (82,1,'Ghana');
INSERT INTO `oc_country_description` VALUES (83,1,'Gibraltar');
INSERT INTO `oc_country_description` VALUES (84,1,'Greece');
INSERT INTO `oc_country_description` VALUES (85,1,'Greenland');
INSERT INTO `oc_country_description` VALUES (86,1,'Grenada');
INSERT INTO `oc_country_description` VALUES (87,1,'Guadeloupe');
INSERT INTO `oc_country_description` VALUES (88,1,'Guam');
INSERT INTO `oc_country_description` VALUES (89,1,'Guatemala');
INSERT INTO `oc_country_description` VALUES (256,1,'Guernsey');
INSERT INTO `oc_country_description` VALUES (90,1,'Guinea');
INSERT INTO `oc_country_description` VALUES (91,1,'Guinea-Bissau');
INSERT INTO `oc_country_description` VALUES (92,1,'Guyana');
INSERT INTO `oc_country_description` VALUES (93,1,'Haiti');
INSERT INTO `oc_country_description` VALUES (94,1,'Heard and Mc Donald Islands');
INSERT INTO `oc_country_description` VALUES (95,1,'Honduras');
INSERT INTO `oc_country_description` VALUES (96,1,'Hong Kong');
INSERT INTO `oc_country_description` VALUES (97,1,'Hungary');
INSERT INTO `oc_country_description` VALUES (98,1,'Iceland');
INSERT INTO `oc_country_description` VALUES (99,1,'India');
INSERT INTO `oc_country_description` VALUES (100,1,'Indonesia');
INSERT INTO `oc_country_description` VALUES (101,1,'Iran (Islamic Republic of)');
INSERT INTO `oc_country_description` VALUES (102,1,'Iraq');
INSERT INTO `oc_country_description` VALUES (103,1,'Ireland');
INSERT INTO `oc_country_description` VALUES (254,1,'Isle of Man');
INSERT INTO `oc_country_description` VALUES (104,1,'Israel');
INSERT INTO `oc_country_description` VALUES (105,1,'Italy');
INSERT INTO `oc_country_description` VALUES (106,1,'Jamaica');
INSERT INTO `oc_country_description` VALUES (107,1,'Japan');
INSERT INTO `oc_country_description` VALUES (257,1,'Jersey');
INSERT INTO `oc_country_description` VALUES (108,1,'Jordan');
INSERT INTO `oc_country_description` VALUES (109,1,'Kazakhstan');
INSERT INTO `oc_country_description` VALUES (110,1,'Kenya');
INSERT INTO `oc_country_description` VALUES (111,1,'Kiribati');
INSERT INTO `oc_country_description` VALUES (253,1,'Kosovo, Republic of');
INSERT INTO `oc_country_description` VALUES (114,1,'Kuwait');
INSERT INTO `oc_country_description` VALUES (115,1,'Kyrgyzstan');
INSERT INTO `oc_country_description` VALUES (116,1,'Lao People\'s Democratic Republic (the)');
INSERT INTO `oc_country_description` VALUES (117,1,'Latvia');
INSERT INTO `oc_country_description` VALUES (118,1,'Lebanon');
INSERT INTO `oc_country_description` VALUES (119,1,'Lesotho');
INSERT INTO `oc_country_description` VALUES (120,1,'Liberia');
INSERT INTO `oc_country_description` VALUES (121,1,'Libya');
INSERT INTO `oc_country_description` VALUES (122,1,'Liechtenstein');
INSERT INTO `oc_country_description` VALUES (123,1,'Lithuania');
INSERT INTO `oc_country_description` VALUES (124,1,'Luxembourg');
INSERT INTO `oc_country_description` VALUES (125,1,'Macau');
INSERT INTO `oc_country_description` VALUES (127,1,'Madagascar');
INSERT INTO `oc_country_description` VALUES (128,1,'Malawi');
INSERT INTO `oc_country_description` VALUES (129,1,'Malaysia');
INSERT INTO `oc_country_description` VALUES (130,1,'Maldives');
INSERT INTO `oc_country_description` VALUES (131,1,'Mali');
INSERT INTO `oc_country_description` VALUES (132,1,'Malta');
INSERT INTO `oc_country_description` VALUES (133,1,'Marshall Islands');
INSERT INTO `oc_country_description` VALUES (134,1,'Martinique');
INSERT INTO `oc_country_description` VALUES (135,1,'Mauritania');
INSERT INTO `oc_country_description` VALUES (136,1,'Mauritius');
INSERT INTO `oc_country_description` VALUES (137,1,'Mayotte');
INSERT INTO `oc_country_description` VALUES (138,1,'Mexico');
INSERT INTO `oc_country_description` VALUES (139,1,'Micronesia, Federated States of');
INSERT INTO `oc_country_description` VALUES (140,1,'Moldova, Republic of');
INSERT INTO `oc_country_description` VALUES (141,1,'Monaco');
INSERT INTO `oc_country_description` VALUES (142,1,'Mongolia');
INSERT INTO `oc_country_description` VALUES (242,1,'Montenegro');
INSERT INTO `oc_country_description` VALUES (143,1,'Montserrat');
INSERT INTO `oc_country_description` VALUES (144,1,'Morocco');
INSERT INTO `oc_country_description` VALUES (145,1,'Mozambique');
INSERT INTO `oc_country_description` VALUES (146,1,'Myanmar');
INSERT INTO `oc_country_description` VALUES (147,1,'Namibia');
INSERT INTO `oc_country_description` VALUES (148,1,'Nauru');
INSERT INTO `oc_country_description` VALUES (149,1,'Nepal');
INSERT INTO `oc_country_description` VALUES (150,1,'Netherlands');
INSERT INTO `oc_country_description` VALUES (151,1,'Netherlands Antilles');
INSERT INTO `oc_country_description` VALUES (152,1,'New Caledonia');
INSERT INTO `oc_country_description` VALUES (153,1,'New Zealand');
INSERT INTO `oc_country_description` VALUES (154,1,'Nicaragua');
INSERT INTO `oc_country_description` VALUES (155,1,'Niger');
INSERT INTO `oc_country_description` VALUES (156,1,'Nigeria');
INSERT INTO `oc_country_description` VALUES (157,1,'Niue');
INSERT INTO `oc_country_description` VALUES (158,1,'Norfolk Island');
INSERT INTO `oc_country_description` VALUES (112,1,'North Korea');
INSERT INTO `oc_country_description` VALUES (126,1,'North Macedonia');
INSERT INTO `oc_country_description` VALUES (159,1,'Northern Mariana Islands');
INSERT INTO `oc_country_description` VALUES (160,1,'Norway');
INSERT INTO `oc_country_description` VALUES (247,1,'Occupied Palestinian Territory');
INSERT INTO `oc_country_description` VALUES (161,1,'Oman');
INSERT INTO `oc_country_description` VALUES (162,1,'Pakistan');
INSERT INTO `oc_country_description` VALUES (163,1,'Palau');
INSERT INTO `oc_country_description` VALUES (164,1,'Panama');
INSERT INTO `oc_country_description` VALUES (165,1,'Papua New Guinea');
INSERT INTO `oc_country_description` VALUES (166,1,'Paraguay');
INSERT INTO `oc_country_description` VALUES (167,1,'Peru');
INSERT INTO `oc_country_description` VALUES (168,1,'Philippines');
INSERT INTO `oc_country_description` VALUES (169,1,'Pitcairn');
INSERT INTO `oc_country_description` VALUES (170,1,'Poland');
INSERT INTO `oc_country_description` VALUES (171,1,'Portugal');
INSERT INTO `oc_country_description` VALUES (172,1,'Puerto Rico');
INSERT INTO `oc_country_description` VALUES (173,1,'Qatar');
INSERT INTO `oc_country_description` VALUES (215,1,'Republic of Türkiye');
INSERT INTO `oc_country_description` VALUES (174,1,'Reunion');
INSERT INTO `oc_country_description` VALUES (175,1,'Romania');
INSERT INTO `oc_country_description` VALUES (176,1,'Russian Federation (the)');
INSERT INTO `oc_country_description` VALUES (177,1,'Rwanda');
INSERT INTO `oc_country_description` VALUES (178,1,'Saint Kitts and Nevis');
INSERT INTO `oc_country_description` VALUES (179,1,'Saint Lucia');
INSERT INTO `oc_country_description` VALUES (180,1,'Saint Vincent and the Grenadines');
INSERT INTO `oc_country_description` VALUES (181,1,'Samoa');
INSERT INTO `oc_country_description` VALUES (182,1,'San Marino');
INSERT INTO `oc_country_description` VALUES (183,1,'Sao Tome and Principe');
INSERT INTO `oc_country_description` VALUES (184,1,'Saudi Arabia');
INSERT INTO `oc_country_description` VALUES (185,1,'Senegal');
INSERT INTO `oc_country_description` VALUES (243,1,'Serbia');
INSERT INTO `oc_country_description` VALUES (186,1,'Seychelles');
INSERT INTO `oc_country_description` VALUES (187,1,'Sierra Leone');
INSERT INTO `oc_country_description` VALUES (188,1,'Singapore');
INSERT INTO `oc_country_description` VALUES (189,1,'Slovak Republic');
INSERT INTO `oc_country_description` VALUES (190,1,'Slovenia');
INSERT INTO `oc_country_description` VALUES (191,1,'Solomon Islands');
INSERT INTO `oc_country_description` VALUES (192,1,'Somalia');
INSERT INTO `oc_country_description` VALUES (193,1,'South Africa');
INSERT INTO `oc_country_description` VALUES (194,1,'South Georgia &amp; South Sandwich Islands');
INSERT INTO `oc_country_description` VALUES (113,1,'South Korea');
INSERT INTO `oc_country_description` VALUES (248,1,'South Sudan');
INSERT INTO `oc_country_description` VALUES (195,1,'Spain');
INSERT INTO `oc_country_description` VALUES (196,1,'Sri Lanka');
INSERT INTO `oc_country_description` VALUES (249,1,'St. Barthelemy');
INSERT INTO `oc_country_description` VALUES (197,1,'St. Helena');
INSERT INTO `oc_country_description` VALUES (250,1,'St. Martin (French part)');
INSERT INTO `oc_country_description` VALUES (198,1,'St. Pierre and Miquelon');
INSERT INTO `oc_country_description` VALUES (199,1,'Sudan');
INSERT INTO `oc_country_description` VALUES (200,1,'Suriname');
INSERT INTO `oc_country_description` VALUES (201,1,'Svalbard and Jan Mayen Islands');
INSERT INTO `oc_country_description` VALUES (203,1,'Sweden');
INSERT INTO `oc_country_description` VALUES (204,1,'Switzerland');
INSERT INTO `oc_country_description` VALUES (205,1,'Syrian Arab Republic');
INSERT INTO `oc_country_description` VALUES (206,1,'Taiwan');
INSERT INTO `oc_country_description` VALUES (207,1,'Tajikistan');
INSERT INTO `oc_country_description` VALUES (208,1,'Tanzania, United Republic of');
INSERT INTO `oc_country_description` VALUES (209,1,'Thailand');
INSERT INTO `oc_country_description` VALUES (16,1,'The Bahamas');
INSERT INTO `oc_country_description` VALUES (79,1,'The Gambia');
INSERT INTO `oc_country_description` VALUES (61,1,'Timor-Leste');
INSERT INTO `oc_country_description` VALUES (210,1,'Togo');
INSERT INTO `oc_country_description` VALUES (211,1,'Tokelau');
INSERT INTO `oc_country_description` VALUES (212,1,'Tonga');
INSERT INTO `oc_country_description` VALUES (213,1,'Trinidad and Tobago');
INSERT INTO `oc_country_description` VALUES (255,1,'Tristan da Cunha');
INSERT INTO `oc_country_description` VALUES (214,1,'Tunisia');
INSERT INTO `oc_country_description` VALUES (216,1,'Turkmenistan');
INSERT INTO `oc_country_description` VALUES (217,1,'Turks and Caicos Islands');
INSERT INTO `oc_country_description` VALUES (218,1,'Tuvalu');
INSERT INTO `oc_country_description` VALUES (219,1,'Uganda');
INSERT INTO `oc_country_description` VALUES (220,1,'Ukraine');
INSERT INTO `oc_country_description` VALUES (221,1,'United Arab Emirates');
INSERT INTO `oc_country_description` VALUES (222,1,'United Kingdom');
INSERT INTO `oc_country_description` VALUES (223,1,'United States');
INSERT INTO `oc_country_description` VALUES (224,1,'United States Minor Outlying Islands');
INSERT INTO `oc_country_description` VALUES (225,1,'Uruguay');
INSERT INTO `oc_country_description` VALUES (226,1,'Uzbekistan');
INSERT INTO `oc_country_description` VALUES (227,1,'Vanuatu');
INSERT INTO `oc_country_description` VALUES (228,1,'Vatican City State (Holy See)');
INSERT INTO `oc_country_description` VALUES (229,1,'Venezuela');
INSERT INTO `oc_country_description` VALUES (230,1,'Viet Nam');
INSERT INTO `oc_country_description` VALUES (231,1,'Virgin Islands (British)');
INSERT INTO `oc_country_description` VALUES (232,1,'Virgin Islands (U.S.)');
INSERT INTO `oc_country_description` VALUES (233,1,'Wallis and Futuna Islands');
INSERT INTO `oc_country_description` VALUES (234,1,'Western Sahara');
INSERT INTO `oc_country_description` VALUES (235,1,'Yemen');
INSERT INTO `oc_country_description` VALUES (238,1,'Zambia');
INSERT INTO `oc_country_description` VALUES (239,1,'Zimbabwe');
/*!40000 ALTER TABLE `oc_country_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_coupon`
--

DROP TABLE IF EXISTS `oc_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  `discount` decimal(15,4) DEFAULT NULL,
  `logged` tinyint(1) DEFAULT 0,
  `shipping` tinyint(1) DEFAULT 0,
  `total` decimal(15,4) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `uses_total` int(11) DEFAULT 0,
  `uses_customer` int(11) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_coupon`
--

LOCK TABLES `oc_coupon` WRITE;
/*!40000 ALTER TABLE `oc_coupon` DISABLE KEYS */;
INSERT INTO `oc_coupon` VALUES (1,'-10% Discount','2222','P',10.0000,0,0,0.0000,'2014-01-01','2020-01-01',10,10,0,'2009-01-27 13:55:03');
INSERT INTO `oc_coupon` VALUES (2,'Free Shipping','3333','P',0.0000,0,1,100.0000,'2014-01-01','2014-02-01',10,10,0,'2009-03-14 21:13:53');
INSERT INTO `oc_coupon` VALUES (3,'-10.00 Discount','1111','F',10.0000,0,0,10.0000,'2014-01-01','2020-01-01',100000,10000,0,'2009-03-14 21:15:18');
/*!40000 ALTER TABLE `oc_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_coupon_category`
--

DROP TABLE IF EXISTS `oc_coupon_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_coupon_category`
--

LOCK TABLES `oc_coupon_category` WRITE;
/*!40000 ALTER TABLE `oc_coupon_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_coupon_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_coupon_history`
--

DROP TABLE IF EXISTS `oc_coupon_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT 0,
  `customer_id` int(11) DEFAULT 0,
  `amount` decimal(15,4) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_coupon_history`
--

LOCK TABLES `oc_coupon_history` WRITE;
/*!40000 ALTER TABLE `oc_coupon_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_coupon_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_coupon_product`
--

DROP TABLE IF EXISTS `oc_coupon_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_coupon_product`
--

LOCK TABLES `oc_coupon_product` WRITE;
/*!40000 ALTER TABLE `oc_coupon_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_coupon_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cron`
--

DROP TABLE IF EXISTS `oc_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cron` (
  `cron_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `cycle` varchar(12) DEFAULT NULL,
  `action` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`cron_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cron`
--

LOCK TABLES `oc_cron` WRITE;
/*!40000 ALTER TABLE `oc_cron` DISABLE KEYS */;
INSERT INTO `oc_cron` VALUES (1,'currency','Updates currency conversion values.','day','cron/currency',1,'2014-09-25 14:40:00','2014-09-25 14:40:00');
INSERT INTO `oc_cron` VALUES (2,'gdpr','Deletes and send emails to customers who have requested their GPDR data to be deleted.','day','cron/gdpr',1,'2014-09-25 14:40:00','2014-09-25 14:40:00');
INSERT INTO `oc_cron` VALUES (3,'subscription','Processes subscriptions by creating new orders, charging customers and sending mails to customers telling them that their subscription has been processed.','day','cron/subscription',0,'2014-09-25 14:40:00','2014-09-25 14:40:00');
/*!40000 ALTER TABLE `oc_cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_currency`
--

DROP TABLE IF EXISTS `oc_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `code` varchar(3) DEFAULT NULL,
  `symbol_left` varchar(12) DEFAULT NULL,
  `symbol_right` varchar(12) DEFAULT NULL,
  `decimal_place` int(1) DEFAULT 2,
  `value` double(15,8) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_currency`
--

LOCK TABLES `oc_currency` WRITE;
/*!40000 ALTER TABLE `oc_currency` DISABLE KEYS */;
INSERT INTO `oc_currency` VALUES (1,'Pound Sterling','GBP','£','',2,0.75592430,1,'2025-04-22 06:19:57');
INSERT INTO `oc_currency` VALUES (2,'US Dollar','USD','$','',2,1.00000000,1,'2025-04-22 06:19:57');
INSERT INTO `oc_currency` VALUES (3,'Euro','EUR','','€',2,0.88028169,1,'2025-04-22 06:19:57');
INSERT INTO `oc_currency` VALUES (4,'Hong Kong Dollar','HKD','HK$','',2,7.76364437,0,'2025-04-22 06:19:57');
INSERT INTO `oc_currency` VALUES (5,'Indian Rupee','INR','₹','',2,85.40360915,0,'2025-04-22 06:19:57');
INSERT INTO `oc_currency` VALUES (6,'Russian Ruble','RUB','','₽',2,56.40360000,0,'2018-02-16 12:00:00');
INSERT INTO `oc_currency` VALUES (7,'Chinese Yuan Renminbi','CNY','¥','',2,7.29753521,0,'2025-04-22 06:19:57');
INSERT INTO `oc_currency` VALUES (8,'Australian Dollar','AUD','$','',2,1.57086268,0,'2025-04-22 06:19:57');
/*!40000 ALTER TABLE `oc_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_custom_field`
--

DROP TABLE IF EXISTS `oc_custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `validation` varchar(255) DEFAULT NULL,
  `location` varchar(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_custom_field`
--

LOCK TABLES `oc_custom_field` WRITE;
/*!40000 ALTER TABLE `oc_custom_field` DISABLE KEYS */;
INSERT INTO `oc_custom_field` VALUES (1,'select','','','account',0,1);
INSERT INTO `oc_custom_field` VALUES (2,'radio','','','account',0,2);
INSERT INTO `oc_custom_field` VALUES (3,'checkbox','','','account',0,3);
INSERT INTO `oc_custom_field` VALUES (4,'text','','','account',0,4);
INSERT INTO `oc_custom_field` VALUES (5,'textarea','','','account',0,5);
INSERT INTO `oc_custom_field` VALUES (6,'file','','','account',0,6);
INSERT INTO `oc_custom_field` VALUES (7,'date','','','account',0,7);
INSERT INTO `oc_custom_field` VALUES (8,'time','','','account',0,8);
INSERT INTO `oc_custom_field` VALUES (9,'datetime','','','account',0,9);
INSERT INTO `oc_custom_field` VALUES (11,'checkbox','','','address',0,3);
INSERT INTO `oc_custom_field` VALUES (12,'time','','','address',0,8);
INSERT INTO `oc_custom_field` VALUES (13,'date','','','address',0,7);
INSERT INTO `oc_custom_field` VALUES (14,'datetime','','','address',0,9);
INSERT INTO `oc_custom_field` VALUES (15,'file','','','address',0,6);
INSERT INTO `oc_custom_field` VALUES (16,'radio','','','address',0,2);
INSERT INTO `oc_custom_field` VALUES (17,'select','','','address',0,1);
INSERT INTO `oc_custom_field` VALUES (18,'text','','','address',0,4);
INSERT INTO `oc_custom_field` VALUES (19,'textarea','','','address',0,5);
INSERT INTO `oc_custom_field` VALUES (20,'checkbox','','','affiliate',0,3);
INSERT INTO `oc_custom_field` VALUES (21,'date','','','affiliate',0,8);
INSERT INTO `oc_custom_field` VALUES (22,'datetime','','','affiliate',0,9);
INSERT INTO `oc_custom_field` VALUES (23,'file','','','affiliate',0,6);
INSERT INTO `oc_custom_field` VALUES (24,'radio','','','affiliate',0,2);
INSERT INTO `oc_custom_field` VALUES (25,'select','','','affiliate',0,1);
INSERT INTO `oc_custom_field` VALUES (26,'text','','','affiliate',0,4);
INSERT INTO `oc_custom_field` VALUES (27,'textarea','','','affiliate',0,5);
INSERT INTO `oc_custom_field` VALUES (28,'time','','','affiliate',0,8);
/*!40000 ALTER TABLE `oc_custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_custom_field_customer_group`
--

DROP TABLE IF EXISTS `oc_custom_field_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_custom_field_customer_group`
--

LOCK TABLES `oc_custom_field_customer_group` WRITE;
/*!40000 ALTER TABLE `oc_custom_field_customer_group` DISABLE KEYS */;
INSERT INTO `oc_custom_field_customer_group` VALUES (1,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (2,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (3,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (4,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (5,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (6,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (7,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (8,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (9,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (11,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (12,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (13,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (14,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (15,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (16,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (17,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (18,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (19,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (20,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (21,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (22,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (23,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (24,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (25,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (26,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (27,1,1);
INSERT INTO `oc_custom_field_customer_group` VALUES (28,1,1);
/*!40000 ALTER TABLE `oc_custom_field_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_custom_field_description`
--

DROP TABLE IF EXISTS `oc_custom_field_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_custom_field_description`
--

LOCK TABLES `oc_custom_field_description` WRITE;
/*!40000 ALTER TABLE `oc_custom_field_description` DISABLE KEYS */;
INSERT INTO `oc_custom_field_description` VALUES (1,1,'Select');
INSERT INTO `oc_custom_field_description` VALUES (2,1,'Radio');
INSERT INTO `oc_custom_field_description` VALUES (3,1,'Checkbox');
INSERT INTO `oc_custom_field_description` VALUES (4,1,'Text');
INSERT INTO `oc_custom_field_description` VALUES (5,1,'Textarea');
INSERT INTO `oc_custom_field_description` VALUES (6,1,'File');
INSERT INTO `oc_custom_field_description` VALUES (7,1,'Date');
INSERT INTO `oc_custom_field_description` VALUES (8,1,'Time');
INSERT INTO `oc_custom_field_description` VALUES (9,1,'Date &amp; Time');
INSERT INTO `oc_custom_field_description` VALUES (11,1,'Checkbox');
INSERT INTO `oc_custom_field_description` VALUES (12,1,'Time');
INSERT INTO `oc_custom_field_description` VALUES (13,1,'Date');
INSERT INTO `oc_custom_field_description` VALUES (14,1,'Date &amp; Time');
INSERT INTO `oc_custom_field_description` VALUES (15,1,'File');
INSERT INTO `oc_custom_field_description` VALUES (16,1,'Radio');
INSERT INTO `oc_custom_field_description` VALUES (17,1,'Select');
INSERT INTO `oc_custom_field_description` VALUES (18,1,'Text');
INSERT INTO `oc_custom_field_description` VALUES (19,1,'Textarea');
INSERT INTO `oc_custom_field_description` VALUES (20,1,'Checkbox');
INSERT INTO `oc_custom_field_description` VALUES (21,1,'Date');
INSERT INTO `oc_custom_field_description` VALUES (22,1,'Date &amp; Time');
INSERT INTO `oc_custom_field_description` VALUES (23,1,'File');
INSERT INTO `oc_custom_field_description` VALUES (24,1,'Radio');
INSERT INTO `oc_custom_field_description` VALUES (25,1,'Select');
INSERT INTO `oc_custom_field_description` VALUES (26,1,'Text');
INSERT INTO `oc_custom_field_description` VALUES (27,1,'Textarea');
INSERT INTO `oc_custom_field_description` VALUES (28,1,'Time');
/*!40000 ALTER TABLE `oc_custom_field_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_custom_field_value`
--

DROP TABLE IF EXISTS `oc_custom_field_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_custom_field_value`
--

LOCK TABLES `oc_custom_field_value` WRITE;
/*!40000 ALTER TABLE `oc_custom_field_value` DISABLE KEYS */;
INSERT INTO `oc_custom_field_value` VALUES (1,1,1);
INSERT INTO `oc_custom_field_value` VALUES (2,1,2);
INSERT INTO `oc_custom_field_value` VALUES (3,1,3);
INSERT INTO `oc_custom_field_value` VALUES (4,2,1);
INSERT INTO `oc_custom_field_value` VALUES (5,2,2);
INSERT INTO `oc_custom_field_value` VALUES (6,2,3);
INSERT INTO `oc_custom_field_value` VALUES (7,3,1);
INSERT INTO `oc_custom_field_value` VALUES (8,3,2);
INSERT INTO `oc_custom_field_value` VALUES (9,3,3);
INSERT INTO `oc_custom_field_value` VALUES (20,11,1);
INSERT INTO `oc_custom_field_value` VALUES (21,11,2);
INSERT INTO `oc_custom_field_value` VALUES (22,11,3);
INSERT INTO `oc_custom_field_value` VALUES (32,16,1);
INSERT INTO `oc_custom_field_value` VALUES (33,16,2);
INSERT INTO `oc_custom_field_value` VALUES (34,16,3);
INSERT INTO `oc_custom_field_value` VALUES (35,17,1);
INSERT INTO `oc_custom_field_value` VALUES (36,17,2);
INSERT INTO `oc_custom_field_value` VALUES (37,17,3);
INSERT INTO `oc_custom_field_value` VALUES (38,20,1);
INSERT INTO `oc_custom_field_value` VALUES (39,20,2);
INSERT INTO `oc_custom_field_value` VALUES (40,20,3);
INSERT INTO `oc_custom_field_value` VALUES (41,24,1);
INSERT INTO `oc_custom_field_value` VALUES (42,24,2);
INSERT INTO `oc_custom_field_value` VALUES (43,24,3);
INSERT INTO `oc_custom_field_value` VALUES (44,25,0);
INSERT INTO `oc_custom_field_value` VALUES (45,25,0);
INSERT INTO `oc_custom_field_value` VALUES (46,25,0);
/*!40000 ALTER TABLE `oc_custom_field_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_custom_field_value_description`
--

DROP TABLE IF EXISTS `oc_custom_field_value_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_custom_field_value_description`
--

LOCK TABLES `oc_custom_field_value_description` WRITE;
/*!40000 ALTER TABLE `oc_custom_field_value_description` DISABLE KEYS */;
INSERT INTO `oc_custom_field_value_description` VALUES (1,1,1,'Test 1');
INSERT INTO `oc_custom_field_value_description` VALUES (2,1,1,'test 2');
INSERT INTO `oc_custom_field_value_description` VALUES (3,1,1,'Test 3');
INSERT INTO `oc_custom_field_value_description` VALUES (4,1,2,'Test 1');
INSERT INTO `oc_custom_field_value_description` VALUES (5,1,2,'Test 2');
INSERT INTO `oc_custom_field_value_description` VALUES (6,1,2,'Test 3');
INSERT INTO `oc_custom_field_value_description` VALUES (7,1,3,'Test 1');
INSERT INTO `oc_custom_field_value_description` VALUES (8,1,3,'Test 2');
INSERT INTO `oc_custom_field_value_description` VALUES (9,1,3,'Test 3');
INSERT INTO `oc_custom_field_value_description` VALUES (20,1,11,'Test 1');
INSERT INTO `oc_custom_field_value_description` VALUES (21,1,11,'Test 2');
INSERT INTO `oc_custom_field_value_description` VALUES (22,1,11,'Test 3');
INSERT INTO `oc_custom_field_value_description` VALUES (32,1,16,'Test 1');
INSERT INTO `oc_custom_field_value_description` VALUES (33,1,16,'Test 2');
INSERT INTO `oc_custom_field_value_description` VALUES (34,1,16,'Test 3');
INSERT INTO `oc_custom_field_value_description` VALUES (35,1,17,'Test 1');
INSERT INTO `oc_custom_field_value_description` VALUES (36,1,17,'Test 2');
INSERT INTO `oc_custom_field_value_description` VALUES (37,1,17,'Test 3');
INSERT INTO `oc_custom_field_value_description` VALUES (38,1,20,'Test 1');
INSERT INTO `oc_custom_field_value_description` VALUES (39,1,20,'Test 2');
INSERT INTO `oc_custom_field_value_description` VALUES (40,1,20,'Test 3');
INSERT INTO `oc_custom_field_value_description` VALUES (41,1,24,'Test 1');
INSERT INTO `oc_custom_field_value_description` VALUES (42,1,24,'Test 2');
INSERT INTO `oc_custom_field_value_description` VALUES (43,1,24,'Test 3');
INSERT INTO `oc_custom_field_value_description` VALUES (44,1,25,'Test 1');
INSERT INTO `oc_custom_field_value_description` VALUES (45,1,25,'Test 2');
INSERT INTO `oc_custom_field_value_description` VALUES (46,1,25,'Test 3');
/*!40000 ALTER TABLE `oc_custom_field_value_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer`
--

DROP TABLE IF EXISTS `oc_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) DEFAULT 0,
  `store_id` int(11) DEFAULT 0,
  `language_id` int(11) DEFAULT 0,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `email` varchar(96) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `custom_field` text DEFAULT NULL,
  `newsletter` tinyint(1) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `safe` tinyint(1) DEFAULT 0,
  `commenter` tinyint(1) DEFAULT 0,
  `token` text DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer`
--

LOCK TABLES `oc_customer` WRITE;
/*!40000 ALTER TABLE `oc_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_activity`
--

DROP TABLE IF EXISTS `oc_customer_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `key` varchar(64) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_activity`
--

LOCK TABLES `oc_customer_activity` WRITE;
/*!40000 ALTER TABLE `oc_customer_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_customer_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_affiliate`
--

DROP TABLE IF EXISTS `oc_customer_affiliate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_affiliate` (
  `customer_id` int(11) NOT NULL,
  `company` varchar(60) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `tracking` varchar(64) DEFAULT NULL,
  `balance` decimal(15,4) DEFAULT NULL,
  `commission` decimal(4,2) DEFAULT 0.00,
  `tax` varchar(64) DEFAULT NULL,
  `payment_method` varchar(6) DEFAULT NULL,
  `cheque` varchar(100) DEFAULT NULL,
  `paypal` varchar(64) DEFAULT NULL,
  `bank_name` varchar(64) DEFAULT NULL,
  `bank_branch_number` varchar(64) DEFAULT NULL,
  `bank_swift_code` varchar(64) DEFAULT NULL,
  `bank_account_name` varchar(64) DEFAULT NULL,
  `bank_account_number` varchar(64) DEFAULT NULL,
  `custom_field` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_affiliate`
--

LOCK TABLES `oc_customer_affiliate` WRITE;
/*!40000 ALTER TABLE `oc_customer_affiliate` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_customer_affiliate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_affiliate_report`
--

DROP TABLE IF EXISTS `oc_customer_affiliate_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_affiliate_report` (
  `customer_affiliate_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_affiliate_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_affiliate_report`
--

LOCK TABLES `oc_customer_affiliate_report` WRITE;
/*!40000 ALTER TABLE `oc_customer_affiliate_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_customer_affiliate_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_approval`
--

DROP TABLE IF EXISTS `oc_customer_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_approval` (
  `customer_approval_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `type` varchar(9) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_approval_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_approval`
--

LOCK TABLES `oc_customer_approval` WRITE;
/*!40000 ALTER TABLE `oc_customer_approval` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_customer_approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_authorize`
--

DROP TABLE IF EXISTS `oc_customer_authorize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_authorize` (
  `customer_authorize_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `token` varchar(96) DEFAULT NULL,
  `total` int(1) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_expire` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_authorize_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_authorize`
--

LOCK TABLES `oc_customer_authorize` WRITE;
/*!40000 ALTER TABLE `oc_customer_authorize` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_customer_authorize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_group`
--

DROP TABLE IF EXISTS `oc_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) DEFAULT 0,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_group`
--

LOCK TABLES `oc_customer_group` WRITE;
/*!40000 ALTER TABLE `oc_customer_group` DISABLE KEYS */;
INSERT INTO `oc_customer_group` VALUES (1,0,1);
INSERT INTO `oc_customer_group` VALUES (2,0,2);
INSERT INTO `oc_customer_group` VALUES (3,1,3);
/*!40000 ALTER TABLE `oc_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_group_description`
--

DROP TABLE IF EXISTS `oc_customer_group_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_group_description`
--

LOCK TABLES `oc_customer_group_description` WRITE;
/*!40000 ALTER TABLE `oc_customer_group_description` DISABLE KEYS */;
INSERT INTO `oc_customer_group_description` VALUES (1,1,'Default','Default customer group');
INSERT INTO `oc_customer_group_description` VALUES (2,1,'Retail','Retail customers');
INSERT INTO `oc_customer_group_description` VALUES (3,1,'Wholesale','Wholesale customers');
/*!40000 ALTER TABLE `oc_customer_group_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_history`
--

DROP TABLE IF EXISTS `oc_customer_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_history`
--

LOCK TABLES `oc_customer_history` WRITE;
/*!40000 ALTER TABLE `oc_customer_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_customer_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_ip`
--

DROP TABLE IF EXISTS `oc_customer_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_ip`
--

LOCK TABLES `oc_customer_ip` WRITE;
/*!40000 ALTER TABLE `oc_customer_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_customer_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_login`
--

DROP TABLE IF EXISTS `oc_customer_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `total` int(4) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_login`
--

LOCK TABLES `oc_customer_login` WRITE;
/*!40000 ALTER TABLE `oc_customer_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_customer_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_online`
--

DROP TABLE IF EXISTS `oc_customer_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) DEFAULT 0,
  `url` text DEFAULT NULL,
  `referer` text DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_online`
--

LOCK TABLES `oc_customer_online` WRITE;
/*!40000 ALTER TABLE `oc_customer_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_customer_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_reward`
--

DROP TABLE IF EXISTS `oc_customer_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT 0,
  `order_id` int(11) DEFAULT 0,
  `description` text DEFAULT NULL,
  `points` int(8) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_reward`
--

LOCK TABLES `oc_customer_reward` WRITE;
/*!40000 ALTER TABLE `oc_customer_reward` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_customer_reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_search`
--

DROP TABLE IF EXISTS `oc_customer_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_search` (
  `customer_search_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT 0,
  `language_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT 0,
  `keyword` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sub_category` tinyint(1) DEFAULT NULL,
  `description` tinyint(1) DEFAULT NULL,
  `products` int(11) DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_search_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_search`
--

LOCK TABLES `oc_customer_search` WRITE;
/*!40000 ALTER TABLE `oc_customer_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_customer_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_token`
--

DROP TABLE IF EXISTS `oc_customer_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_token` (
  `customer_token_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `code` text DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_token`
--

LOCK TABLES `oc_customer_token` WRITE;
/*!40000 ALTER TABLE `oc_customer_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_customer_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_transaction`
--

DROP TABLE IF EXISTS `oc_customer_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT 0,
  `description` text DEFAULT NULL,
  `amount` decimal(15,4) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_transaction`
--

LOCK TABLES `oc_customer_transaction` WRITE;
/*!40000 ALTER TABLE `oc_customer_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_customer_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_wishlist`
--

DROP TABLE IF EXISTS `oc_customer_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`store_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_wishlist`
--

LOCK TABLES `oc_customer_wishlist` WRITE;
/*!40000 ALTER TABLE `oc_customer_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_customer_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_download`
--

DROP TABLE IF EXISTS `oc_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(160) DEFAULT NULL,
  `mask` varchar(128) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_download`
--

LOCK TABLES `oc_download` WRITE;
/*!40000 ALTER TABLE `oc_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_download_description`
--

DROP TABLE IF EXISTS `oc_download_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_download_description`
--

LOCK TABLES `oc_download_description` WRITE;
/*!40000 ALTER TABLE `oc_download_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_download_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_download_report`
--

DROP TABLE IF EXISTS `oc_download_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_download_report` (
  `download_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `download_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`download_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_download_report`
--

LOCK TABLES `oc_download_report` WRITE;
/*!40000 ALTER TABLE `oc_download_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_download_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_event`
--

DROP TABLE IF EXISTS `oc_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `trigger` text DEFAULT NULL,
  `action` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `sort_order` int(3) DEFAULT 1,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_event`
--

LOCK TABLES `oc_event` WRITE;
/*!40000 ALTER TABLE `oc_event` DISABLE KEYS */;
INSERT INTO `oc_event` VALUES (1,'activity_customer_add','Adds new customer entry in the activity log.','catalog/model/account/customer.addCustomer/after','event/activity.addCustomer',1,1);
INSERT INTO `oc_event` VALUES (2,'activity_customer_edit','Adds edit customer entry in the activity log.','catalog/model/account/customer.editCustomer/after','event/activity.editCustomer',1,1);
INSERT INTO `oc_event` VALUES (3,'activity_customer_password','Adds edit password entry in the activity log.','catalog/model/account/customer.editPassword/after','event/activity.editPassword',1,1);
INSERT INTO `oc_event` VALUES (4,'activity_customer_forgotten','Adds forgotten password entry in the activity log.','catalog/model/account/customer.addToken/after','event/activity.forgotten',1,1);
INSERT INTO `oc_event` VALUES (5,'activity_customer_login','Adds edit customer entry in the activity log.','catalog/model/account/customer.deleteLoginAttempts/after','event/activity.login',1,1);
INSERT INTO `oc_event` VALUES (6,'activity_customer_transaction','Adds edit customer entry in the activity log.','catalog/model/account/customer.addTransaction/after','event/activity.addTransaction',1,1);
INSERT INTO `oc_event` VALUES (7,'activity_address_add','Adds new address entry in the activity log.','catalog/model/account/address.addAddress/after','event/activity.addAddress',1,1);
INSERT INTO `oc_event` VALUES (8,'activity_address_edit','Adds edit address entry in the activity log.','catalog/model/account/address.editAddress/after','event/activity.editAddress',1,1);
INSERT INTO `oc_event` VALUES (9,'activity_address_delete','Adds delete address entry in the activity log.','catalog/model/account/address.deleteAddress/after','event/activity.deleteAddress',1,1);
INSERT INTO `oc_event` VALUES (10,'activity_affiliate_add','Adds new affiliate entry in the activity log.','catalog/model/account/affiliate.addAffiliate/after','event/activity.addAffiliate',1,1);
INSERT INTO `oc_event` VALUES (11,'activity_affiliate_edit','Adds edit affiliate entry in the activity log.','catalog/model/account/affiliate.editAffiliate/after','event/activity.editAffiliate',1,1);
INSERT INTO `oc_event` VALUES (12,'activity_order_add','Adds new order entry in the activity log.','catalog/model/checkout/order.addHistory/before','event/activity.addHistory',1,1);
INSERT INTO `oc_event` VALUES (13,'activity_return_add','Adds new return entry in the activity log.','catalog/model/account/returns.addReturn/after','event/activity.addReturn',1,1);
INSERT INTO `oc_event` VALUES (14,'mail_customer_add','Sends mail to newly registered customers.','catalog/model/account/customer.addCustomer/after','mail/register',1,1);
INSERT INTO `oc_event` VALUES (15,'mail_customer_alert','Sends alert mail to store owner when a new customer registers.','catalog/model/account/customer.addCustomer/after','mail/register.alert',1,1);
INSERT INTO `oc_event` VALUES (16,'mail_customer_transaction','Sends mail to the customer when their transaction balance is updated.','catalog/model/account/customer.addTransaction/after','mail/transaction',1,1);
INSERT INTO `oc_event` VALUES (17,'mail_customer_forgotten','Sends mail to customers who have forgotten their password.','catalog/model/account/customer.addToken/after','mail/forgotten',1,1);
INSERT INTO `oc_event` VALUES (18,'mail_customer_authorize','Sends mail login code to customers email to authorize login from a new device.','catalog/controller/account/authorize.send/after','mail/authorize',1,1);
INSERT INTO `oc_event` VALUES (19,'mail_customer_authorize_reset','Sends reset link to user who`s account is locked out after 3 wrong authorize code login attempts.','catalog/model/account/customer.addToken/after','mail/authorize.reset',1,1);
INSERT INTO `oc_event` VALUES (20,'mail_affiliate_add','Sends mail to newly registered affiliates.','catalog/model/account/affiliate.addAffiliate/after','mail/affiliate',1,1);
INSERT INTO `oc_event` VALUES (21,'mail_affiliate_alert','Sends mail to new customers.','catalog/model/account/affiliate.addAffiliate/after','mail/affiliate.alert',1,1);
INSERT INTO `oc_event` VALUES (22,'mail_order','Sends mail to customer when they make an order.','catalog/model/checkout/order.addHistory/before','mail/order',1,1);
INSERT INTO `oc_event` VALUES (23,'mail_order_alert','Sends alert mail to new store owner when a new order is made.','catalog/model/checkout/order.addHistory/before','mail/order.alert',1,1);
INSERT INTO `oc_event` VALUES (24,'mail_gdpr','Sends mail to customers who have requested their data exported or deleted.','catalog/model/account/gdpr.addGdpr/after','mail/gdpr',1,1);
INSERT INTO `oc_event` VALUES (25,'mail_gdpr_delete','Sends mail to customers to let them know their GDPR data has been deleted.','catalog/model/account/gdpr.editStatus/after','mail/gdpr.remove',1,1);
INSERT INTO `oc_event` VALUES (26,'mail_review','Sends mail to store owner that a new review has been submitted.','catalog/model/catalog/review.addReview/after','mail/review',1,1);
INSERT INTO `oc_event` VALUES (27,'mail_subscription','Sends mail to store owner that a new subscription has been created.','catalog/model/checkout/subscription.addSubscription/after','mail/subscription',1,1);
INSERT INTO `oc_event` VALUES (28,'statistics_review_add','Updates review statistics when a new review is added.','catalog/model/catalog/review.addReview/after','event/statistics.addReview',1,1);
INSERT INTO `oc_event` VALUES (29,'statistics_return_add','Updates return statistics when a new return is added.','catalog/model/account/returns.addReturn/after','event/statistics.addReturn',1,1);
INSERT INTO `oc_event` VALUES (30,'statistics_return_delete','Updates return statistics when a return is deleted.','admin/model/sale/returns.deleteReturn/after','event/statistics.deleteReturn',1,1);
INSERT INTO `oc_event` VALUES (31,'statistics_order_history','Updates order status statistics when a order has been updated.','catalog/model/checkout/order.addHistory/before','event/statistics.addHistory',1,1);
INSERT INTO `oc_event` VALUES (32,'admin_currency_add','Updates currencies when a new currency is added.','admin/model/localisation/currency.addCurrency/after','event/currency',1,1);
INSERT INTO `oc_event` VALUES (33,'admin_currency_edit','Updates currencies when a currency is edited.','admin/model/localisation/currency.editCurrency/after','event/currency',1,1);
INSERT INTO `oc_event` VALUES (34,'admin_currency_setting','Updates currencies when settings are saved.','admin/model/setting/setting.editSetting/after','event/currency',1,1);
INSERT INTO `oc_event` VALUES (35,'admin_mail_gdpr','Sends approval or denial mail to customer who requested GDPR data export or deletion.','admin/model/customer/gdpr.editStatus/after','mail/gdpr',1,1);
INSERT INTO `oc_event` VALUES (36,'admin_mail_affiliate_approve','Sends mail to the affiliate when their account is approved.','admin/model/customer/customer_approval.approveAffiliate/after','mail/affiliate.approve',1,1);
INSERT INTO `oc_event` VALUES (37,'admin_mail_affiliate_deny','Sends mail to the affiliate when their account is denied.','admin/model/customer/customer_approval.denyAffiliate/after','mail/affiliate.deny',1,1);
INSERT INTO `oc_event` VALUES (38,'admin_mail_customer_approve','Sends mail to the customer when their account is approved.','admin/model/customer/customer_approval.approveCustomer/after','mail/customer.approve',1,1);
INSERT INTO `oc_event` VALUES (39,'admin_mail_customer_deny','Sends mail to the customer when their account is denied.','admin/model/customer/customer_approval.denyCustomer/after','mail/customer.deny',1,1);
INSERT INTO `oc_event` VALUES (40,'admin_mail_customer_transaction','Sends mail to the customer when their transaction balance is updated.','admin/model/customer/customer.addTransaction/after','mail/transaction',1,1);
INSERT INTO `oc_event` VALUES (41,'admin_mail_reward','Sends mail to the customer when their reward balance is updated.','admin/model/customer/customer.addReward/after','mail/reward',1,1);
INSERT INTO `oc_event` VALUES (42,'admin_mail_return','Sends mail to customer when their return status is changed.','admin/model/sale/returns.addHistory/after','mail/returns',1,1);
INSERT INTO `oc_event` VALUES (43,'admin_mail_user_forgotten','Sends mail to users who have forgotten their password.','admin/model/user/user.addToken/after','mail/forgotten',1,1);
INSERT INTO `oc_event` VALUES (44,'admin_mail_user_authorize','Sends mail login code to users email to authorize login from a new device.','admin/controller/common/authorize.send/after','mail/authorize',1,1);
INSERT INTO `oc_event` VALUES (45,'admin_mail_user_authorize_reset','Sends reset link to user who`s account is locked out after 3 wrong authorize code login attempts.','admin/model/user/user.addToken/after','mail/authorize.reset',1,1);
/*!40000 ALTER TABLE `oc_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_extension`
--

DROP TABLE IF EXISTS `oc_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension` varchar(255) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `code` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_extension`
--

LOCK TABLES `oc_extension` WRITE;
/*!40000 ALTER TABLE `oc_extension` DISABLE KEYS */;
INSERT INTO `oc_extension` VALUES (1,'opencart','currency','ecb');
INSERT INTO `oc_extension` VALUES (2,'opencart','module','featured');
INSERT INTO `oc_extension` VALUES (3,'opencart','module','banner');
INSERT INTO `oc_extension` VALUES (4,'opencart','payment','cod');
INSERT INTO `oc_extension` VALUES (5,'opencart','payment','free_checkout');
INSERT INTO `oc_extension` VALUES (6,'opencart','module','category');
INSERT INTO `oc_extension` VALUES (7,'opencart','module','account');
INSERT INTO `oc_extension` VALUES (8,'opencart','module','topic');
INSERT INTO `oc_extension` VALUES (9,'opencart','shipping','flat');
INSERT INTO `oc_extension` VALUES (10,'opencart','theme','basic');
INSERT INTO `oc_extension` VALUES (11,'opencart','total','credit');
INSERT INTO `oc_extension` VALUES (12,'opencart','total','shipping');
INSERT INTO `oc_extension` VALUES (13,'opencart','total','sub_total');
INSERT INTO `oc_extension` VALUES (14,'opencart','total','tax');
INSERT INTO `oc_extension` VALUES (15,'opencart','total','total');
INSERT INTO `oc_extension` VALUES (16,'opencart','total','handling');
INSERT INTO `oc_extension` VALUES (17,'opencart','total','low_order_fee');
INSERT INTO `oc_extension` VALUES (18,'opencart','total','coupon');
INSERT INTO `oc_extension` VALUES (19,'opencart','total','reward');
INSERT INTO `oc_extension` VALUES (20,'opencart','dashboard','activity');
INSERT INTO `oc_extension` VALUES (21,'opencart','dashboard','sale');
INSERT INTO `oc_extension` VALUES (22,'opencart','dashboard','recent');
INSERT INTO `oc_extension` VALUES (23,'opencart','dashboard','order');
INSERT INTO `oc_extension` VALUES (24,'opencart','dashboard','online');
INSERT INTO `oc_extension` VALUES (25,'opencart','dashboard','map');
INSERT INTO `oc_extension` VALUES (26,'opencart','dashboard','customer');
INSERT INTO `oc_extension` VALUES (27,'opencart','dashboard','chart');
INSERT INTO `oc_extension` VALUES (28,'opencart','report','sale_coupon');
INSERT INTO `oc_extension` VALUES (29,'opencart','report','customer_search');
INSERT INTO `oc_extension` VALUES (30,'opencart','report','customer_transaction');
INSERT INTO `oc_extension` VALUES (31,'opencart','report','product_purchased');
INSERT INTO `oc_extension` VALUES (32,'opencart','report','product_viewed');
INSERT INTO `oc_extension` VALUES (33,'opencart','report','sale_return');
INSERT INTO `oc_extension` VALUES (34,'opencart','report','sale_order');
INSERT INTO `oc_extension` VALUES (35,'opencart','report','sale_shipping');
INSERT INTO `oc_extension` VALUES (36,'opencart','report','sale_tax');
INSERT INTO `oc_extension` VALUES (37,'opencart','report','customer_activity');
INSERT INTO `oc_extension` VALUES (38,'opencart','report','customer_order');
INSERT INTO `oc_extension` VALUES (39,'opencart','report','customer_reward');
INSERT INTO `oc_extension` VALUES (40,'opencart','report','marketing');
INSERT INTO `oc_extension` VALUES (41,'opencart','report','subscription');
INSERT INTO `oc_extension` VALUES (42,'opencart','report','customer');
/*!40000 ALTER TABLE `oc_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_extension_install`
--

DROP TABLE IF EXISTS `oc_extension_install`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_extension_install` (
  `extension_install_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) DEFAULT 0,
  `extension_download_id` int(11) DEFAULT 0,
  `name` varchar(128) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`extension_install_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_extension_install`
--

LOCK TABLES `oc_extension_install` WRITE;
/*!40000 ALTER TABLE `oc_extension_install` DISABLE KEYS */;
INSERT INTO `oc_extension_install` VALUES (1,0,0,'OpenCart Default Extensions','This extension contains all the default extensions for modules, currencies, payment methods, shipping methods, anti-fraud, themes, order totals and reports.','opencart','1.0','OpenCart Ltd','http://www.opencart.com',1,'2020-08-29 15:35:39');
INSERT INTO `oc_extension_install` VALUES (2,0,0,'OpenCart Language Example','This extension is only here for so developers can see how to create a language extension for OpenCart.','oc_language_example','1.0','OpenCart Ltd','https://www.opencart.com',1,'2025-04-21 00:42:10');
INSERT INTO `oc_extension_install` VALUES (3,0,0,'OpenCart OCMOD Example','','oc_ocmod_example','1.0','OpenCart Ltd','https://www.opencart.com',1,'2025-04-21 00:42:10');
INSERT INTO `oc_extension_install` VALUES (4,0,0,'OpenCart Payment Example','This extension is only here for so developers can see how to create a payment extension for OpenCart.','oc_payment_example','1.0','OpenCart Ltd','https://www.opencart.com',0,'2025-04-21 00:42:10');
INSERT INTO `oc_extension_install` VALUES (5,0,0,'OpenCart Theme Example','This extension is only here for so developers can see how to create a theme extension for OpenCart.','oc_theme_example','1.0','OpenCart Ltd','https://www.opencart.com',0,'2025-04-21 00:42:10');
INSERT INTO `oc_extension_install` VALUES (6,0,0,'Ka Extensions','','ka_extensions','5.1.0.0','Karapuz Team','https://www.ka-station.com/ka-extensions-for-opencart-4',0,'2025-04-22 06:10:43');
/*!40000 ALTER TABLE `oc_extension_install` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_extension_path`
--

DROP TABLE IF EXISTS `oc_extension_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_extension_path` (
  `extension_path_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_install_id` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`extension_path_id`),
  KEY `path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=432 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_extension_path`
--

LOCK TABLES `oc_extension_path` WRITE;
/*!40000 ALTER TABLE `oc_extension_path` DISABLE KEYS */;
INSERT INTO `oc_extension_path` VALUES (1,1,'opencart');
INSERT INTO `oc_extension_path` VALUES (2,1,'opencart/admin');
INSERT INTO `oc_extension_path` VALUES (3,1,'opencart/admin/controller');
INSERT INTO `oc_extension_path` VALUES (4,1,'opencart/admin/controller/analytics');
INSERT INTO `oc_extension_path` VALUES (5,1,'opencart/admin/controller/analytics/index.html');
INSERT INTO `oc_extension_path` VALUES (6,1,'opencart/admin/controller/captcha');
INSERT INTO `oc_extension_path` VALUES (7,1,'opencart/admin/controller/captcha/basic.php');
INSERT INTO `oc_extension_path` VALUES (8,1,'opencart/admin/controller/currency');
INSERT INTO `oc_extension_path` VALUES (9,1,'opencart/admin/controller/currency/ecb.php');
INSERT INTO `oc_extension_path` VALUES (10,1,'opencart/admin/controller/currency/fixer.php');
INSERT INTO `oc_extension_path` VALUES (11,1,'opencart/admin/controller/dashboard');
INSERT INTO `oc_extension_path` VALUES (12,1,'opencart/admin/controller/dashboard/activity.php');
INSERT INTO `oc_extension_path` VALUES (13,1,'opencart/admin/controller/dashboard/chart.php');
INSERT INTO `oc_extension_path` VALUES (14,1,'opencart/admin/controller/dashboard/customer.php');
INSERT INTO `oc_extension_path` VALUES (15,1,'opencart/admin/controller/dashboard/map.php');
INSERT INTO `oc_extension_path` VALUES (16,1,'opencart/admin/controller/dashboard/online.php');
INSERT INTO `oc_extension_path` VALUES (17,1,'opencart/admin/controller/dashboard/order.php');
INSERT INTO `oc_extension_path` VALUES (18,1,'opencart/admin/controller/dashboard/recent.php');
INSERT INTO `oc_extension_path` VALUES (19,1,'opencart/admin/controller/dashboard/sale.php');
INSERT INTO `oc_extension_path` VALUES (20,1,'opencart/admin/controller/feed');
INSERT INTO `oc_extension_path` VALUES (21,1,'opencart/admin/controller/feed/index.html');
INSERT INTO `oc_extension_path` VALUES (22,1,'opencart/admin/controller/fraud');
INSERT INTO `oc_extension_path` VALUES (23,1,'opencart/admin/controller/fraud/ip.php');
INSERT INTO `oc_extension_path` VALUES (24,1,'opencart/admin/controller/module');
INSERT INTO `oc_extension_path` VALUES (25,1,'opencart/admin/controller/module/account.php');
INSERT INTO `oc_extension_path` VALUES (26,1,'opencart/admin/controller/module/banner.php');
INSERT INTO `oc_extension_path` VALUES (27,1,'opencart/admin/controller/module/bestseller.php');
INSERT INTO `oc_extension_path` VALUES (28,1,'opencart/admin/controller/module/category.php');
INSERT INTO `oc_extension_path` VALUES (29,1,'opencart/admin/controller/module/featured.php');
INSERT INTO `oc_extension_path` VALUES (30,1,'opencart/admin/controller/module/filter.php');
INSERT INTO `oc_extension_path` VALUES (31,1,'opencart/admin/controller/module/html.php');
INSERT INTO `oc_extension_path` VALUES (32,1,'opencart/admin/controller/module/information.php');
INSERT INTO `oc_extension_path` VALUES (33,1,'opencart/admin/controller/module/latest.php');
INSERT INTO `oc_extension_path` VALUES (34,1,'opencart/admin/controller/module/special.php');
INSERT INTO `oc_extension_path` VALUES (35,1,'opencart/admin/controller/module/store.php');
INSERT INTO `oc_extension_path` VALUES (36,1,'opencart/admin/controller/payment');
INSERT INTO `oc_extension_path` VALUES (37,1,'opencart/admin/controller/payment/bank_transfer.php');
INSERT INTO `oc_extension_path` VALUES (38,1,'opencart/admin/controller/payment/cheque.php');
INSERT INTO `oc_extension_path` VALUES (39,1,'opencart/admin/controller/payment/cod.php');
INSERT INTO `oc_extension_path` VALUES (40,1,'opencart/admin/controller/payment/free_checkout.php');
INSERT INTO `oc_extension_path` VALUES (41,1,'opencart/admin/controller/report');
INSERT INTO `oc_extension_path` VALUES (42,1,'opencart/admin/controller/report/customer.php');
INSERT INTO `oc_extension_path` VALUES (43,1,'opencart/admin/controller/report/customer_activity.php');
INSERT INTO `oc_extension_path` VALUES (44,1,'opencart/admin/controller/report/customer_order.php');
INSERT INTO `oc_extension_path` VALUES (45,1,'opencart/admin/controller/report/customer_reward.php');
INSERT INTO `oc_extension_path` VALUES (46,1,'opencart/admin/controller/report/customer_search.php');
INSERT INTO `oc_extension_path` VALUES (47,1,'opencart/admin/controller/report/subscription.php');
INSERT INTO `oc_extension_path` VALUES (48,1,'opencart/admin/controller/report/customer_transaction.php');
INSERT INTO `oc_extension_path` VALUES (49,1,'opencart/admin/controller/report/marketing.php');
INSERT INTO `oc_extension_path` VALUES (50,1,'opencart/admin/controller/report/product_purchased.php');
INSERT INTO `oc_extension_path` VALUES (51,1,'opencart/admin/controller/report/product_viewed.php');
INSERT INTO `oc_extension_path` VALUES (52,1,'opencart/admin/controller/report/sale_coupon.php');
INSERT INTO `oc_extension_path` VALUES (53,1,'opencart/admin/controller/report/sale_order.php');
INSERT INTO `oc_extension_path` VALUES (54,1,'opencart/admin/controller/report/sale_return.php');
INSERT INTO `oc_extension_path` VALUES (55,1,'opencart/admin/controller/report/sale_shipping.php');
INSERT INTO `oc_extension_path` VALUES (56,1,'opencart/admin/controller/report/sale_tax.php');
INSERT INTO `oc_extension_path` VALUES (57,1,'opencart/admin/controller/shipping');
INSERT INTO `oc_extension_path` VALUES (58,1,'opencart/admin/controller/shipping/flat.php');
INSERT INTO `oc_extension_path` VALUES (59,1,'opencart/admin/controller/shipping/free.php');
INSERT INTO `oc_extension_path` VALUES (60,1,'opencart/admin/controller/shipping/item.php');
INSERT INTO `oc_extension_path` VALUES (61,1,'opencart/admin/controller/shipping/pickup.php');
INSERT INTO `oc_extension_path` VALUES (62,1,'opencart/admin/controller/shipping/weight.php');
INSERT INTO `oc_extension_path` VALUES (63,1,'opencart/admin/controller/theme');
INSERT INTO `oc_extension_path` VALUES (64,1,'opencart/admin/controller/theme/basic.php');
INSERT INTO `oc_extension_path` VALUES (65,1,'opencart/admin/controller/total');
INSERT INTO `oc_extension_path` VALUES (66,1,'opencart/admin/controller/total/coupon.php');
INSERT INTO `oc_extension_path` VALUES (67,1,'opencart/admin/controller/total/credit.php');
INSERT INTO `oc_extension_path` VALUES (68,1,'opencart/admin/controller/total/handling.php');
INSERT INTO `oc_extension_path` VALUES (69,1,'opencart/admin/controller/total/low_order_fee.php');
INSERT INTO `oc_extension_path` VALUES (70,1,'opencart/admin/controller/total/reward.php');
INSERT INTO `oc_extension_path` VALUES (71,1,'opencart/admin/controller/total/shipping.php');
INSERT INTO `oc_extension_path` VALUES (72,1,'opencart/admin/controller/total/sub_total.php');
INSERT INTO `oc_extension_path` VALUES (73,1,'opencart/admin/controller/total/tax.php');
INSERT INTO `oc_extension_path` VALUES (74,1,'opencart/admin/controller/total/total.php');
INSERT INTO `oc_extension_path` VALUES (75,1,'opencart/admin/language');
INSERT INTO `oc_extension_path` VALUES (76,1,'opencart/admin/language/en-gb');
INSERT INTO `oc_extension_path` VALUES (77,1,'opencart/admin/language/en-gb/captcha');
INSERT INTO `oc_extension_path` VALUES (78,1,'opencart/admin/language/en-gb/captcha/basic.php');
INSERT INTO `oc_extension_path` VALUES (79,1,'opencart/admin/language/en-gb/currency');
INSERT INTO `oc_extension_path` VALUES (80,1,'opencart/admin/language/en-gb/currency/ecb.php');
INSERT INTO `oc_extension_path` VALUES (81,1,'opencart/admin/language/en-gb/currency/fixer.php');
INSERT INTO `oc_extension_path` VALUES (82,1,'opencart/admin/language/en-gb/dashboard');
INSERT INTO `oc_extension_path` VALUES (83,1,'opencart/admin/language/en-gb/dashboard/activity.php');
INSERT INTO `oc_extension_path` VALUES (84,1,'opencart/admin/language/en-gb/dashboard/chart.php');
INSERT INTO `oc_extension_path` VALUES (85,1,'opencart/admin/language/en-gb/dashboard/customer.php');
INSERT INTO `oc_extension_path` VALUES (86,1,'opencart/admin/language/en-gb/dashboard/map.php');
INSERT INTO `oc_extension_path` VALUES (87,1,'opencart/admin/language/en-gb/dashboard/online.php');
INSERT INTO `oc_extension_path` VALUES (88,1,'opencart/admin/language/en-gb/dashboard/order.php');
INSERT INTO `oc_extension_path` VALUES (89,1,'opencart/admin/language/en-gb/dashboard/recent.php');
INSERT INTO `oc_extension_path` VALUES (90,1,'opencart/admin/language/en-gb/dashboard/sale.php');
INSERT INTO `oc_extension_path` VALUES (91,1,'opencart/admin/language/en-gb/fraud');
INSERT INTO `oc_extension_path` VALUES (92,1,'opencart/admin/language/en-gb/fraud/ip.php');
INSERT INTO `oc_extension_path` VALUES (93,1,'opencart/admin/language/en-gb/module');
INSERT INTO `oc_extension_path` VALUES (94,1,'opencart/admin/language/en-gb/module/account.php');
INSERT INTO `oc_extension_path` VALUES (95,1,'opencart/admin/language/en-gb/module/banner.php');
INSERT INTO `oc_extension_path` VALUES (96,1,'opencart/admin/language/en-gb/module/bestseller.php');
INSERT INTO `oc_extension_path` VALUES (97,1,'opencart/admin/language/en-gb/module/category.php');
INSERT INTO `oc_extension_path` VALUES (98,1,'opencart/admin/language/en-gb/module/featured.php');
INSERT INTO `oc_extension_path` VALUES (99,1,'opencart/admin/language/en-gb/module/filter.php');
INSERT INTO `oc_extension_path` VALUES (100,1,'opencart/admin/language/en-gb/module/html.php');
INSERT INTO `oc_extension_path` VALUES (101,1,'opencart/admin/language/en-gb/module/information.php');
INSERT INTO `oc_extension_path` VALUES (102,1,'opencart/admin/language/en-gb/module/latest.php');
INSERT INTO `oc_extension_path` VALUES (103,1,'opencart/admin/language/en-gb/module/special.php');
INSERT INTO `oc_extension_path` VALUES (104,1,'opencart/admin/language/en-gb/module/store.php');
INSERT INTO `oc_extension_path` VALUES (105,1,'opencart/admin/language/en-gb/payment');
INSERT INTO `oc_extension_path` VALUES (106,1,'opencart/admin/language/en-gb/payment/bank_transfer.php');
INSERT INTO `oc_extension_path` VALUES (107,1,'opencart/admin/language/en-gb/payment/cheque.php');
INSERT INTO `oc_extension_path` VALUES (108,1,'opencart/admin/language/en-gb/payment/cod.php');
INSERT INTO `oc_extension_path` VALUES (109,1,'opencart/admin/language/en-gb/payment/free_checkout.php');
INSERT INTO `oc_extension_path` VALUES (110,1,'opencart/admin/language/en-gb/report');
INSERT INTO `oc_extension_path` VALUES (111,1,'opencart/admin/language/en-gb/report/customer.php');
INSERT INTO `oc_extension_path` VALUES (112,1,'opencart/admin/language/en-gb/report/customer_activity.php');
INSERT INTO `oc_extension_path` VALUES (113,1,'opencart/admin/language/en-gb/report/customer_order.php');
INSERT INTO `oc_extension_path` VALUES (114,1,'opencart/admin/language/en-gb/report/customer_reward.php');
INSERT INTO `oc_extension_path` VALUES (115,1,'opencart/admin/language/en-gb/report/customer_search.php');
INSERT INTO `oc_extension_path` VALUES (116,1,'opencart/admin/language/en-gb/report/subscription.php');
INSERT INTO `oc_extension_path` VALUES (117,1,'opencart/admin/language/en-gb/report/customer_transaction.php');
INSERT INTO `oc_extension_path` VALUES (118,1,'opencart/admin/language/en-gb/report/marketing.php');
INSERT INTO `oc_extension_path` VALUES (119,1,'opencart/admin/language/en-gb/report/product_purchased.php');
INSERT INTO `oc_extension_path` VALUES (120,1,'opencart/admin/language/en-gb/report/product_viewed.php');
INSERT INTO `oc_extension_path` VALUES (121,1,'opencart/admin/language/en-gb/report/sale_coupon.php');
INSERT INTO `oc_extension_path` VALUES (122,1,'opencart/admin/language/en-gb/report/sale_order.php');
INSERT INTO `oc_extension_path` VALUES (123,1,'opencart/admin/language/en-gb/report/sale_return.php');
INSERT INTO `oc_extension_path` VALUES (124,1,'opencart/admin/language/en-gb/report/sale_shipping.php');
INSERT INTO `oc_extension_path` VALUES (125,1,'opencart/admin/language/en-gb/report/sale_tax.php');
INSERT INTO `oc_extension_path` VALUES (126,1,'opencart/admin/language/en-gb/shipping');
INSERT INTO `oc_extension_path` VALUES (127,1,'opencart/admin/language/en-gb/shipping/flat.php');
INSERT INTO `oc_extension_path` VALUES (128,1,'opencart/admin/language/en-gb/shipping/free.php');
INSERT INTO `oc_extension_path` VALUES (129,1,'opencart/admin/language/en-gb/shipping/item.php');
INSERT INTO `oc_extension_path` VALUES (130,1,'opencart/admin/language/en-gb/shipping/pickup.php');
INSERT INTO `oc_extension_path` VALUES (131,1,'opencart/admin/language/en-gb/shipping/weight.php');
INSERT INTO `oc_extension_path` VALUES (132,1,'opencart/admin/language/en-gb/theme');
INSERT INTO `oc_extension_path` VALUES (133,1,'opencart/admin/language/en-gb/theme/basic.php');
INSERT INTO `oc_extension_path` VALUES (134,1,'opencart/admin/language/en-gb/total');
INSERT INTO `oc_extension_path` VALUES (135,1,'opencart/admin/language/en-gb/total/coupon.php');
INSERT INTO `oc_extension_path` VALUES (136,1,'opencart/admin/language/en-gb/total/credit.php');
INSERT INTO `oc_extension_path` VALUES (137,1,'opencart/admin/language/en-gb/total/handling.php');
INSERT INTO `oc_extension_path` VALUES (138,1,'opencart/admin/language/en-gb/total/low_order_fee.php');
INSERT INTO `oc_extension_path` VALUES (139,1,'opencart/admin/language/en-gb/total/reward.php');
INSERT INTO `oc_extension_path` VALUES (140,1,'opencart/admin/language/en-gb/total/shipping.php');
INSERT INTO `oc_extension_path` VALUES (141,1,'opencart/admin/language/en-gb/total/sub_total.php');
INSERT INTO `oc_extension_path` VALUES (142,1,'opencart/admin/language/en-gb/total/tax.php');
INSERT INTO `oc_extension_path` VALUES (143,1,'opencart/admin/language/en-gb/total/total.php');
INSERT INTO `oc_extension_path` VALUES (144,1,'opencart/admin/model');
INSERT INTO `oc_extension_path` VALUES (145,1,'opencart/admin/model/dashboard');
INSERT INTO `oc_extension_path` VALUES (146,1,'opencart/admin/model/dashboard/map.php');
INSERT INTO `oc_extension_path` VALUES (147,1,'opencart/admin/model/fraud');
INSERT INTO `oc_extension_path` VALUES (148,1,'opencart/admin/model/fraud/ip.php');
INSERT INTO `oc_extension_path` VALUES (149,1,'opencart/admin/model/module');
INSERT INTO `oc_extension_path` VALUES (150,1,'opencart/admin/model/module/bestseller.php');
INSERT INTO `oc_extension_path` VALUES (151,1,'opencart/admin/model/report');
INSERT INTO `oc_extension_path` VALUES (152,1,'opencart/admin/model/report/activity.php');
INSERT INTO `oc_extension_path` VALUES (153,1,'opencart/admin/model/report/coupon.php');
INSERT INTO `oc_extension_path` VALUES (154,1,'opencart/admin/model/report/customer.php');
INSERT INTO `oc_extension_path` VALUES (155,1,'opencart/admin/model/report/subscription.php');
INSERT INTO `oc_extension_path` VALUES (156,1,'opencart/admin/model/report/customer_transaction.php');
INSERT INTO `oc_extension_path` VALUES (157,1,'opencart/admin/model/report/marketing.php');
INSERT INTO `oc_extension_path` VALUES (158,1,'opencart/admin/model/report/product_purchased.php');
INSERT INTO `oc_extension_path` VALUES (159,1,'opencart/admin/model/report/product_viewed.php');
INSERT INTO `oc_extension_path` VALUES (160,1,'opencart/admin/model/report/returns.php');
INSERT INTO `oc_extension_path` VALUES (161,1,'opencart/admin/model/report/sale.php');
INSERT INTO `oc_extension_path` VALUES (162,1,'opencart/admin/view');
INSERT INTO `oc_extension_path` VALUES (163,1,'opencart/admin/view/image');
INSERT INTO `oc_extension_path` VALUES (164,1,'opencart/admin/view/image/basic.png');
INSERT INTO `oc_extension_path` VALUES (165,1,'opencart/admin/view/template');
INSERT INTO `oc_extension_path` VALUES (166,1,'opencart/admin/view/template/captcha');
INSERT INTO `oc_extension_path` VALUES (167,1,'opencart/admin/view/template/captcha/basic.twig');
INSERT INTO `oc_extension_path` VALUES (168,1,'opencart/admin/view/template/currency');
INSERT INTO `oc_extension_path` VALUES (169,1,'opencart/admin/view/template/currency/ecb.twig');
INSERT INTO `oc_extension_path` VALUES (170,1,'opencart/admin/view/template/currency/fixer.twig');
INSERT INTO `oc_extension_path` VALUES (171,1,'opencart/admin/view/template/dashboard');
INSERT INTO `oc_extension_path` VALUES (172,1,'opencart/admin/view/template/dashboard/activity_form.twig');
INSERT INTO `oc_extension_path` VALUES (173,1,'opencart/admin/view/template/dashboard/activity_info.twig');
INSERT INTO `oc_extension_path` VALUES (174,1,'opencart/admin/view/template/dashboard/chart_form.twig');
INSERT INTO `oc_extension_path` VALUES (175,1,'opencart/admin/view/template/dashboard/chart_info.twig');
INSERT INTO `oc_extension_path` VALUES (176,1,'opencart/admin/view/template/dashboard/customer_form.twig');
INSERT INTO `oc_extension_path` VALUES (177,1,'opencart/admin/view/template/dashboard/customer_info.twig');
INSERT INTO `oc_extension_path` VALUES (178,1,'opencart/admin/view/template/dashboard/map_form.twig');
INSERT INTO `oc_extension_path` VALUES (179,1,'opencart/admin/view/template/dashboard/map_info.twig');
INSERT INTO `oc_extension_path` VALUES (180,1,'opencart/admin/view/template/dashboard/online_form.twig');
INSERT INTO `oc_extension_path` VALUES (181,1,'opencart/admin/view/template/dashboard/online_info.twig');
INSERT INTO `oc_extension_path` VALUES (182,1,'opencart/admin/view/template/dashboard/order_form.twig');
INSERT INTO `oc_extension_path` VALUES (183,1,'opencart/admin/view/template/dashboard/order_info.twig');
INSERT INTO `oc_extension_path` VALUES (184,1,'opencart/admin/view/template/dashboard/recent_form.twig');
INSERT INTO `oc_extension_path` VALUES (185,1,'opencart/admin/view/template/dashboard/recent_info.twig');
INSERT INTO `oc_extension_path` VALUES (186,1,'opencart/admin/view/template/dashboard/sale_form.twig');
INSERT INTO `oc_extension_path` VALUES (187,1,'opencart/admin/view/template/dashboard/sale_info.twig');
INSERT INTO `oc_extension_path` VALUES (188,1,'opencart/admin/view/template/fraud');
INSERT INTO `oc_extension_path` VALUES (189,1,'opencart/admin/view/template/fraud/ip.twig');
INSERT INTO `oc_extension_path` VALUES (190,1,'opencart/admin/view/template/fraud/ip_ip.twig');
INSERT INTO `oc_extension_path` VALUES (191,1,'opencart/admin/view/template/module');
INSERT INTO `oc_extension_path` VALUES (192,1,'opencart/admin/view/template/module/account.twig');
INSERT INTO `oc_extension_path` VALUES (193,1,'opencart/admin/view/template/module/banner.twig');
INSERT INTO `oc_extension_path` VALUES (194,1,'opencart/admin/view/template/module/bestseller.twig');
INSERT INTO `oc_extension_path` VALUES (195,1,'opencart/admin/view/template/module/bestseller_report.twig');
INSERT INTO `oc_extension_path` VALUES (196,1,'opencart/admin/view/template/module/category.twig');
INSERT INTO `oc_extension_path` VALUES (197,1,'opencart/admin/view/template/module/featured.twig');
INSERT INTO `oc_extension_path` VALUES (198,1,'opencart/admin/view/template/module/filter.twig');
INSERT INTO `oc_extension_path` VALUES (199,1,'opencart/admin/view/template/module/html.twig');
INSERT INTO `oc_extension_path` VALUES (200,1,'opencart/admin/view/template/module/information.twig');
INSERT INTO `oc_extension_path` VALUES (201,1,'opencart/admin/view/template/module/latest.twig');
INSERT INTO `oc_extension_path` VALUES (202,1,'opencart/admin/view/template/module/special.twig');
INSERT INTO `oc_extension_path` VALUES (203,1,'opencart/admin/view/template/module/store.twig');
INSERT INTO `oc_extension_path` VALUES (204,1,'opencart/admin/view/template/payment');
INSERT INTO `oc_extension_path` VALUES (205,1,'opencart/admin/view/template/payment/bank_transfer.twig');
INSERT INTO `oc_extension_path` VALUES (206,1,'opencart/admin/view/template/payment/cheque.twig');
INSERT INTO `oc_extension_path` VALUES (207,1,'opencart/admin/view/template/payment/cod.twig');
INSERT INTO `oc_extension_path` VALUES (208,1,'opencart/admin/view/template/payment/free_checkout.twig');
INSERT INTO `oc_extension_path` VALUES (209,1,'opencart/admin/view/template/payment/order.twig');
INSERT INTO `oc_extension_path` VALUES (210,1,'opencart/admin/view/template/report');
INSERT INTO `oc_extension_path` VALUES (211,1,'opencart/admin/view/template/report/affiliate.twig');
INSERT INTO `oc_extension_path` VALUES (212,1,'opencart/admin/view/template/report/affiliate_form.twig');
INSERT INTO `oc_extension_path` VALUES (213,1,'opencart/admin/view/template/report/customer.twig');
INSERT INTO `oc_extension_path` VALUES (214,1,'opencart/admin/view/template/report/customer_activity.twig');
INSERT INTO `oc_extension_path` VALUES (215,1,'opencart/admin/view/template/report/customer_activity_form.twig');
INSERT INTO `oc_extension_path` VALUES (216,1,'opencart/admin/view/template/report/customer_activity_list.twig');
INSERT INTO `oc_extension_path` VALUES (217,1,'opencart/admin/view/template/report/customer_form.twig');
INSERT INTO `oc_extension_path` VALUES (218,1,'opencart/admin/view/template/report/customer_list.twig');
INSERT INTO `oc_extension_path` VALUES (219,1,'opencart/admin/view/template/report/customer_order.twig');
INSERT INTO `oc_extension_path` VALUES (220,1,'opencart/admin/view/template/report/customer_order_form.twig');
INSERT INTO `oc_extension_path` VALUES (221,1,'opencart/admin/view/template/report/customer_order_list.twig');
INSERT INTO `oc_extension_path` VALUES (222,1,'opencart/admin/view/template/report/customer_reward.twig');
INSERT INTO `oc_extension_path` VALUES (223,1,'opencart/admin/view/template/report/customer_reward_form.twig');
INSERT INTO `oc_extension_path` VALUES (224,1,'opencart/admin/view/template/report/customer_reward_list.twig');
INSERT INTO `oc_extension_path` VALUES (225,1,'opencart/admin/view/template/report/customer_search.twig');
INSERT INTO `oc_extension_path` VALUES (226,1,'opencart/admin/view/template/report/customer_search_form.twig');
INSERT INTO `oc_extension_path` VALUES (227,1,'opencart/admin/view/template/report/customer_search_list.twig');
INSERT INTO `oc_extension_path` VALUES (228,1,'opencart/admin/view/template/report/subscription.twig');
INSERT INTO `oc_extension_path` VALUES (229,1,'opencart/admin/view/template/report/subscription_form.twig');
INSERT INTO `oc_extension_path` VALUES (230,1,'opencart/admin/view/template/report/subscription_list.twig');
INSERT INTO `oc_extension_path` VALUES (231,1,'opencart/admin/view/template/report/customer_transaction.twig');
INSERT INTO `oc_extension_path` VALUES (232,1,'opencart/admin/view/template/report/customer_transaction_form.twig');
INSERT INTO `oc_extension_path` VALUES (233,1,'opencart/admin/view/template/report/customer_transaction_list.twig');
INSERT INTO `oc_extension_path` VALUES (234,1,'opencart/admin/view/template/report/marketing.twig');
INSERT INTO `oc_extension_path` VALUES (235,1,'opencart/admin/view/template/report/marketing_form.twig');
INSERT INTO `oc_extension_path` VALUES (236,1,'opencart/admin/view/template/report/marketing_list.twig');
INSERT INTO `oc_extension_path` VALUES (237,1,'opencart/admin/view/template/report/product_purchased.twig');
INSERT INTO `oc_extension_path` VALUES (238,1,'opencart/admin/view/template/report/product_purchased_form.twig');
INSERT INTO `oc_extension_path` VALUES (239,1,'opencart/admin/view/template/report/product_purchased_list.twig');
INSERT INTO `oc_extension_path` VALUES (240,1,'opencart/admin/view/template/report/product_viewed.twig');
INSERT INTO `oc_extension_path` VALUES (241,1,'opencart/admin/view/template/report/product_viewed_form.twig');
INSERT INTO `oc_extension_path` VALUES (242,1,'opencart/admin/view/template/report/product_viewed_list.twig');
INSERT INTO `oc_extension_path` VALUES (243,1,'opencart/admin/view/template/report/sale_coupon.twig');
INSERT INTO `oc_extension_path` VALUES (244,1,'opencart/admin/view/template/report/sale_coupon_form.twig');
INSERT INTO `oc_extension_path` VALUES (245,1,'opencart/admin/view/template/report/sale_coupon_list.twig');
INSERT INTO `oc_extension_path` VALUES (246,1,'opencart/admin/view/template/report/sale_order.twig');
INSERT INTO `oc_extension_path` VALUES (247,1,'opencart/admin/view/template/report/sale_order_form.twig');
INSERT INTO `oc_extension_path` VALUES (248,1,'opencart/admin/view/template/report/sale_order_list.twig');
INSERT INTO `oc_extension_path` VALUES (249,1,'opencart/admin/view/template/report/sale_return.twig');
INSERT INTO `oc_extension_path` VALUES (250,1,'opencart/admin/view/template/report/sale_return_form.twig');
INSERT INTO `oc_extension_path` VALUES (251,1,'opencart/admin/view/template/report/sale_return_list.twig');
INSERT INTO `oc_extension_path` VALUES (252,1,'opencart/admin/view/template/report/sale_shipping.twig');
INSERT INTO `oc_extension_path` VALUES (253,1,'opencart/admin/view/template/report/sale_shipping_form.twig');
INSERT INTO `oc_extension_path` VALUES (254,1,'opencart/admin/view/template/report/sale_shipping_list.twig');
INSERT INTO `oc_extension_path` VALUES (255,1,'opencart/admin/view/template/report/sale_tax.twig');
INSERT INTO `oc_extension_path` VALUES (256,1,'opencart/admin/view/template/report/sale_tax_form.twig');
INSERT INTO `oc_extension_path` VALUES (257,1,'opencart/admin/view/template/report/sale_tax_list.twig');
INSERT INTO `oc_extension_path` VALUES (258,1,'opencart/admin/view/template/shipping');
INSERT INTO `oc_extension_path` VALUES (259,1,'opencart/admin/view/template/shipping/flat.twig');
INSERT INTO `oc_extension_path` VALUES (260,1,'opencart/admin/view/template/shipping/free.twig');
INSERT INTO `oc_extension_path` VALUES (261,1,'opencart/admin/view/template/shipping/item.twig');
INSERT INTO `oc_extension_path` VALUES (262,1,'opencart/admin/view/template/shipping/pickup.twig');
INSERT INTO `oc_extension_path` VALUES (263,1,'opencart/admin/view/template/shipping/weight.twig');
INSERT INTO `oc_extension_path` VALUES (264,1,'opencart/admin/view/template/theme');
INSERT INTO `oc_extension_path` VALUES (265,1,'opencart/admin/view/template/theme/basic.twig');
INSERT INTO `oc_extension_path` VALUES (266,1,'opencart/admin/view/template/total');
INSERT INTO `oc_extension_path` VALUES (267,1,'opencart/admin/view/template/total/coupon.twig');
INSERT INTO `oc_extension_path` VALUES (268,1,'opencart/admin/view/template/total/credit.twig');
INSERT INTO `oc_extension_path` VALUES (269,1,'opencart/admin/view/template/total/handling.twig');
INSERT INTO `oc_extension_path` VALUES (270,1,'opencart/admin/view/template/total/low_order_fee.twig');
INSERT INTO `oc_extension_path` VALUES (271,1,'opencart/admin/view/template/total/reward.twig');
INSERT INTO `oc_extension_path` VALUES (272,1,'opencart/admin/view/template/total/shipping.twig');
INSERT INTO `oc_extension_path` VALUES (273,1,'opencart/admin/view/template/total/sub_total.twig');
INSERT INTO `oc_extension_path` VALUES (274,1,'opencart/admin/view/template/total/tax.twig');
INSERT INTO `oc_extension_path` VALUES (275,1,'opencart/admin/view/template/total/total.twig');
INSERT INTO `oc_extension_path` VALUES (276,1,'opencart/catalog');
INSERT INTO `oc_extension_path` VALUES (277,1,'opencart/catalog/controller');
INSERT INTO `oc_extension_path` VALUES (278,1,'opencart/catalog/controller/captcha');
INSERT INTO `oc_extension_path` VALUES (279,1,'opencart/catalog/controller/captcha/basic.php');
INSERT INTO `oc_extension_path` VALUES (280,1,'opencart/catalog/controller/currency');
INSERT INTO `oc_extension_path` VALUES (281,1,'opencart/catalog/controller/currency/ecb.php');
INSERT INTO `oc_extension_path` VALUES (282,1,'opencart/catalog/controller/currency/fixer.php');
INSERT INTO `oc_extension_path` VALUES (283,1,'opencart/catalog/controller/module');
INSERT INTO `oc_extension_path` VALUES (284,1,'opencart/catalog/controller/module/account.php');
INSERT INTO `oc_extension_path` VALUES (285,1,'opencart/catalog/controller/module/banner.php');
INSERT INTO `oc_extension_path` VALUES (286,1,'opencart/catalog/controller/module/bestseller.php');
INSERT INTO `oc_extension_path` VALUES (287,1,'opencart/catalog/controller/module/category.php');
INSERT INTO `oc_extension_path` VALUES (288,1,'opencart/catalog/controller/module/featured.php');
INSERT INTO `oc_extension_path` VALUES (289,1,'opencart/catalog/controller/module/filter.php');
INSERT INTO `oc_extension_path` VALUES (290,1,'opencart/catalog/controller/module/html.php');
INSERT INTO `oc_extension_path` VALUES (291,1,'opencart/catalog/controller/module/information.php');
INSERT INTO `oc_extension_path` VALUES (292,1,'opencart/catalog/controller/module/latest.php');
INSERT INTO `oc_extension_path` VALUES (293,1,'opencart/catalog/controller/module/special.php');
INSERT INTO `oc_extension_path` VALUES (294,1,'opencart/catalog/controller/module/store.php');
INSERT INTO `oc_extension_path` VALUES (295,1,'opencart/catalog/controller/payment');
INSERT INTO `oc_extension_path` VALUES (296,1,'opencart/catalog/controller/payment/bank_transfer.php');
INSERT INTO `oc_extension_path` VALUES (297,1,'opencart/catalog/controller/payment/cheque.php');
INSERT INTO `oc_extension_path` VALUES (298,1,'opencart/catalog/controller/payment/cod.php');
INSERT INTO `oc_extension_path` VALUES (299,1,'opencart/catalog/controller/payment/free_checkout.php');
INSERT INTO `oc_extension_path` VALUES (300,1,'opencart/catalog/controller/total');
INSERT INTO `oc_extension_path` VALUES (301,1,'opencart/catalog/controller/total/coupon.php');
INSERT INTO `oc_extension_path` VALUES (302,1,'opencart/catalog/controller/total/reward.php');
INSERT INTO `oc_extension_path` VALUES (303,1,'opencart/catalog/controller/total/shipping.php');
INSERT INTO `oc_extension_path` VALUES (304,1,'opencart/catalog/language');
INSERT INTO `oc_extension_path` VALUES (305,1,'opencart/catalog/language/de-de');
INSERT INTO `oc_extension_path` VALUES (306,1,'opencart/catalog/language/de-de/module');
INSERT INTO `oc_extension_path` VALUES (307,1,'opencart/catalog/language/de-de/module/featured.php');
INSERT INTO `oc_extension_path` VALUES (308,1,'opencart/catalog/language/de-de/payment');
INSERT INTO `oc_extension_path` VALUES (309,1,'opencart/catalog/language/de-de/payment/cod.php');
INSERT INTO `oc_extension_path` VALUES (310,1,'opencart/catalog/language/en-gb');
INSERT INTO `oc_extension_path` VALUES (311,1,'opencart/catalog/language/en-gb/captcha');
INSERT INTO `oc_extension_path` VALUES (312,1,'opencart/catalog/language/en-gb/captcha/basic.php');
INSERT INTO `oc_extension_path` VALUES (313,1,'opencart/catalog/language/en-gb/module');
INSERT INTO `oc_extension_path` VALUES (314,1,'opencart/catalog/language/en-gb/module/account.php');
INSERT INTO `oc_extension_path` VALUES (315,1,'opencart/catalog/language/en-gb/module/bestseller.php');
INSERT INTO `oc_extension_path` VALUES (316,1,'opencart/catalog/language/en-gb/module/category.php');
INSERT INTO `oc_extension_path` VALUES (317,1,'opencart/catalog/language/en-gb/module/featured.php');
INSERT INTO `oc_extension_path` VALUES (318,1,'opencart/catalog/language/en-gb/module/filter.php');
INSERT INTO `oc_extension_path` VALUES (319,1,'opencart/catalog/language/en-gb/module/information.php');
INSERT INTO `oc_extension_path` VALUES (320,1,'opencart/catalog/language/en-gb/module/latest.php');
INSERT INTO `oc_extension_path` VALUES (321,1,'opencart/catalog/language/en-gb/module/special.php');
INSERT INTO `oc_extension_path` VALUES (322,1,'opencart/catalog/language/en-gb/module/store.php');
INSERT INTO `oc_extension_path` VALUES (323,1,'opencart/catalog/language/en-gb/payment');
INSERT INTO `oc_extension_path` VALUES (324,1,'opencart/catalog/language/en-gb/payment/bank_transfer.php');
INSERT INTO `oc_extension_path` VALUES (325,1,'opencart/catalog/language/en-gb/payment/cheque.php');
INSERT INTO `oc_extension_path` VALUES (326,1,'opencart/catalog/language/en-gb/payment/cod.php');
INSERT INTO `oc_extension_path` VALUES (327,1,'opencart/catalog/language/en-gb/payment/free_checkout.php');
INSERT INTO `oc_extension_path` VALUES (328,1,'opencart/catalog/language/en-gb/shipping');
INSERT INTO `oc_extension_path` VALUES (329,1,'opencart/catalog/language/en-gb/shipping/flat.php');
INSERT INTO `oc_extension_path` VALUES (330,1,'opencart/catalog/language/en-gb/shipping/free.php');
INSERT INTO `oc_extension_path` VALUES (331,1,'opencart/catalog/language/en-gb/shipping/item.php');
INSERT INTO `oc_extension_path` VALUES (332,1,'opencart/catalog/language/en-gb/shipping/pickup.php');
INSERT INTO `oc_extension_path` VALUES (333,1,'opencart/catalog/language/en-gb/shipping/weight.php');
INSERT INTO `oc_extension_path` VALUES (334,1,'opencart/catalog/language/en-gb/total');
INSERT INTO `oc_extension_path` VALUES (335,1,'opencart/catalog/language/en-gb/total/coupon.php');
INSERT INTO `oc_extension_path` VALUES (336,1,'opencart/catalog/language/en-gb/total/credit.php');
INSERT INTO `oc_extension_path` VALUES (337,1,'opencart/catalog/language/en-gb/total/handling.php');
INSERT INTO `oc_extension_path` VALUES (338,1,'opencart/catalog/language/en-gb/total/low_order_fee.php');
INSERT INTO `oc_extension_path` VALUES (339,1,'opencart/catalog/language/en-gb/total/reward.php');
INSERT INTO `oc_extension_path` VALUES (340,1,'opencart/catalog/language/en-gb/total/shipping.php');
INSERT INTO `oc_extension_path` VALUES (341,1,'opencart/catalog/language/en-gb/total/sub_total.php');
INSERT INTO `oc_extension_path` VALUES (342,1,'opencart/catalog/language/en-gb/total/total.php');
INSERT INTO `oc_extension_path` VALUES (343,1,'opencart/catalog/model');
INSERT INTO `oc_extension_path` VALUES (344,1,'opencart/catalog/model/fraud');
INSERT INTO `oc_extension_path` VALUES (345,1,'opencart/catalog/model/fraud/ip.php');
INSERT INTO `oc_extension_path` VALUES (346,1,'opencart/catalog/model/module');
INSERT INTO `oc_extension_path` VALUES (347,1,'opencart/catalog/model/module/bestseller.php');
INSERT INTO `oc_extension_path` VALUES (348,1,'opencart/catalog/model/module/latest.php');
INSERT INTO `oc_extension_path` VALUES (349,1,'opencart/catalog/model/payment');
INSERT INTO `oc_extension_path` VALUES (350,1,'opencart/catalog/model/payment/bank_transfer.php');
INSERT INTO `oc_extension_path` VALUES (351,1,'opencart/catalog/model/payment/cheque.php');
INSERT INTO `oc_extension_path` VALUES (352,1,'opencart/catalog/model/payment/cod.php');
INSERT INTO `oc_extension_path` VALUES (353,1,'opencart/catalog/model/payment/free_checkout.php');
INSERT INTO `oc_extension_path` VALUES (354,1,'opencart/catalog/model/shipping');
INSERT INTO `oc_extension_path` VALUES (355,1,'opencart/catalog/model/shipping/flat.php');
INSERT INTO `oc_extension_path` VALUES (356,1,'opencart/catalog/model/shipping/free.php');
INSERT INTO `oc_extension_path` VALUES (357,1,'opencart/catalog/model/shipping/item.php');
INSERT INTO `oc_extension_path` VALUES (358,1,'opencart/catalog/model/shipping/pickup.php');
INSERT INTO `oc_extension_path` VALUES (359,1,'opencart/catalog/model/shipping/weight.php');
INSERT INTO `oc_extension_path` VALUES (360,1,'opencart/catalog/model/total');
INSERT INTO `oc_extension_path` VALUES (361,1,'opencart/catalog/model/total/coupon.php');
INSERT INTO `oc_extension_path` VALUES (362,1,'opencart/catalog/model/total/credit.php');
INSERT INTO `oc_extension_path` VALUES (363,1,'opencart/catalog/model/total/handling.php');
INSERT INTO `oc_extension_path` VALUES (364,1,'opencart/catalog/model/total/low_order_fee.php');
INSERT INTO `oc_extension_path` VALUES (365,1,'opencart/catalog/model/total/reward.php');
INSERT INTO `oc_extension_path` VALUES (366,1,'opencart/catalog/model/total/shipping.php');
INSERT INTO `oc_extension_path` VALUES (367,1,'opencart/catalog/model/total/sub_total.php');
INSERT INTO `oc_extension_path` VALUES (368,1,'opencart/catalog/model/total/tax.php');
INSERT INTO `oc_extension_path` VALUES (369,1,'opencart/catalog/model/total/total.php');
INSERT INTO `oc_extension_path` VALUES (370,1,'opencart/catalog/view');
INSERT INTO `oc_extension_path` VALUES (371,1,'opencart/catalog/view/template');
INSERT INTO `oc_extension_path` VALUES (372,1,'opencart/catalog/view/template/captcha');
INSERT INTO `oc_extension_path` VALUES (373,1,'opencart/catalog/view/template/captcha/basic.twig');
INSERT INTO `oc_extension_path` VALUES (374,1,'opencart/catalog/view/template/module');
INSERT INTO `oc_extension_path` VALUES (375,1,'opencart/catalog/view/template/module/account.twig');
INSERT INTO `oc_extension_path` VALUES (376,1,'opencart/catalog/view/template/module/banner.twig');
INSERT INTO `oc_extension_path` VALUES (377,1,'opencart/catalog/view/template/module/bestseller.twig');
INSERT INTO `oc_extension_path` VALUES (378,1,'opencart/catalog/view/template/module/category.twig');
INSERT INTO `oc_extension_path` VALUES (379,1,'opencart/catalog/view/template/module/featured.twig');
INSERT INTO `oc_extension_path` VALUES (380,1,'opencart/catalog/view/template/module/filter.twig');
INSERT INTO `oc_extension_path` VALUES (381,1,'opencart/catalog/view/template/module/html.twig');
INSERT INTO `oc_extension_path` VALUES (382,1,'opencart/catalog/view/template/module/information.twig');
INSERT INTO `oc_extension_path` VALUES (383,1,'opencart/catalog/view/template/module/latest.twig');
INSERT INTO `oc_extension_path` VALUES (384,1,'opencart/catalog/view/template/module/special.twig');
INSERT INTO `oc_extension_path` VALUES (385,1,'opencart/catalog/view/template/module/store.twig');
INSERT INTO `oc_extension_path` VALUES (386,1,'opencart/catalog/view/template/payment');
INSERT INTO `oc_extension_path` VALUES (387,1,'opencart/catalog/view/template/payment/bank_transfer.twig');
INSERT INTO `oc_extension_path` VALUES (388,1,'opencart/catalog/view/template/payment/cheque.twig');
INSERT INTO `oc_extension_path` VALUES (389,1,'opencart/catalog/view/template/payment/cod.twig');
INSERT INTO `oc_extension_path` VALUES (390,1,'opencart/catalog/view/template/payment/free_checkout.twig');
INSERT INTO `oc_extension_path` VALUES (391,1,'opencart/catalog/view/template/total');
INSERT INTO `oc_extension_path` VALUES (392,1,'opencart/catalog/view/template/total/coupon.twig');
INSERT INTO `oc_extension_path` VALUES (393,1,'opencart/catalog/view/template/total/reward.twig');
INSERT INTO `oc_extension_path` VALUES (394,1,'opencart/catalog/view/template/total/shipping.twig');
INSERT INTO `oc_extension_path` VALUES (395,1,'opencart/install.json');
INSERT INTO `oc_extension_path` VALUES (396,3,'oc_ocmod_example');
INSERT INTO `oc_extension_path` VALUES (397,3,'oc_ocmod_example/install.json');
INSERT INTO `oc_extension_path` VALUES (398,2,'oc_language_example');
INSERT INTO `oc_extension_path` VALUES (399,2,'oc_language_example/admin');
INSERT INTO `oc_extension_path` VALUES (400,2,'oc_language_example/admin/controller');
INSERT INTO `oc_extension_path` VALUES (401,2,'oc_language_example/admin/controller/language');
INSERT INTO `oc_extension_path` VALUES (402,2,'oc_language_example/admin/controller/language/german.php');
INSERT INTO `oc_extension_path` VALUES (403,2,'oc_language_example/admin/language');
INSERT INTO `oc_extension_path` VALUES (404,2,'oc_language_example/admin/language/de-de');
INSERT INTO `oc_extension_path` VALUES (405,2,'oc_language_example/admin/language/de-de/de-de.png');
INSERT INTO `oc_extension_path` VALUES (406,2,'oc_language_example/admin/language/de-de/default.php');
INSERT INTO `oc_extension_path` VALUES (407,2,'oc_language_example/admin/language/de-de/index.html');
INSERT INTO `oc_extension_path` VALUES (408,2,'oc_language_example/admin/language/de-de/language');
INSERT INTO `oc_extension_path` VALUES (409,2,'oc_language_example/admin/language/de-de/language/common');
INSERT INTO `oc_extension_path` VALUES (410,2,'oc_language_example/admin/language/de-de/language/common/header.php');
INSERT INTO `oc_extension_path` VALUES (411,2,'oc_language_example/admin/language/de-de/language/german.php');
INSERT INTO `oc_extension_path` VALUES (412,2,'oc_language_example/admin/language/en-gb');
INSERT INTO `oc_extension_path` VALUES (413,2,'oc_language_example/admin/language/en-gb/language');
INSERT INTO `oc_extension_path` VALUES (414,2,'oc_language_example/admin/language/en-gb/language/german.php');
INSERT INTO `oc_extension_path` VALUES (415,2,'oc_language_example/admin/view');
INSERT INTO `oc_extension_path` VALUES (416,2,'oc_language_example/admin/view/template');
INSERT INTO `oc_extension_path` VALUES (417,2,'oc_language_example/admin/view/template/language');
INSERT INTO `oc_extension_path` VALUES (418,2,'oc_language_example/admin/view/template/language/german.twig');
INSERT INTO `oc_extension_path` VALUES (419,2,'oc_language_example/catalog');
INSERT INTO `oc_extension_path` VALUES (420,2,'oc_language_example/catalog/language');
INSERT INTO `oc_extension_path` VALUES (421,2,'oc_language_example/catalog/language/de-de');
INSERT INTO `oc_extension_path` VALUES (422,2,'oc_language_example/catalog/language/de-de/common');
INSERT INTO `oc_extension_path` VALUES (423,2,'oc_language_example/catalog/language/de-de/common/header.php');
INSERT INTO `oc_extension_path` VALUES (424,2,'oc_language_example/catalog/language/de-de/de-de.png');
INSERT INTO `oc_extension_path` VALUES (425,2,'oc_language_example/catalog/language/de-de/default.php');
INSERT INTO `oc_extension_path` VALUES (426,2,'oc_language_example/catalog/language/de-de/extension');
INSERT INTO `oc_extension_path` VALUES (427,2,'oc_language_example/catalog/language/de-de/extension/opencart');
INSERT INTO `oc_extension_path` VALUES (428,2,'oc_language_example/catalog/language/de-de/extension/opencart/module');
INSERT INTO `oc_extension_path` VALUES (429,2,'oc_language_example/catalog/language/de-de/extension/opencart/module/featured.php');
INSERT INTO `oc_extension_path` VALUES (430,2,'oc_language_example/catalog/language/de-de/index.html');
INSERT INTO `oc_extension_path` VALUES (431,2,'oc_language_example/install.json');
/*!40000 ALTER TABLE `oc_extension_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filter`
--

DROP TABLE IF EXISTS `oc_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filter`
--

LOCK TABLES `oc_filter` WRITE;
/*!40000 ALTER TABLE `oc_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filter_description`
--

DROP TABLE IF EXISTS `oc_filter_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filter_description`
--

LOCK TABLES `oc_filter_description` WRITE;
/*!40000 ALTER TABLE `oc_filter_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_filter_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filter_group`
--

DROP TABLE IF EXISTS `oc_filter_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filter_group`
--

LOCK TABLES `oc_filter_group` WRITE;
/*!40000 ALTER TABLE `oc_filter_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_filter_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filter_group_description`
--

DROP TABLE IF EXISTS `oc_filter_group_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filter_group_description`
--

LOCK TABLES `oc_filter_group_description` WRITE;
/*!40000 ALTER TABLE `oc_filter_group_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_filter_group_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_gdpr`
--

DROP TABLE IF EXISTS `oc_gdpr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_gdpr` (
  `gdpr_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT 0,
  `language_id` int(11) DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  `email` varchar(96) DEFAULT NULL,
  `action` varchar(6) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`gdpr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_gdpr`
--

LOCK TABLES `oc_gdpr` WRITE;
/*!40000 ALTER TABLE `oc_gdpr` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_gdpr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_geo_zone`
--

DROP TABLE IF EXISTS `oc_geo_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_geo_zone`
--

LOCK TABLES `oc_geo_zone` WRITE;
/*!40000 ALTER TABLE `oc_geo_zone` DISABLE KEYS */;
INSERT INTO `oc_geo_zone` VALUES (3,'UK VAT Zone','UK VAT');
INSERT INTO `oc_geo_zone` VALUES (4,'UK Shipping','UK Shipping Zones');
/*!40000 ALTER TABLE `oc_geo_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_identifier`
--

DROP TABLE IF EXISTS `oc_identifier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_identifier` (
  `identifier_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `code` varchar(48) DEFAULT NULL,
  `validation` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`identifier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_identifier`
--

LOCK TABLES `oc_identifier` WRITE;
/*!40000 ALTER TABLE `oc_identifier` DISABLE KEYS */;
INSERT INTO `oc_identifier` VALUES (1,'Stock Keeping Unit','SKU',NULL,1);
INSERT INTO `oc_identifier` VALUES (2,'Universal Product Code','UPC',NULL,1);
INSERT INTO `oc_identifier` VALUES (3,'European Article Number','EAN',NULL,1);
INSERT INTO `oc_identifier` VALUES (4,'Japanese Article Number','JAN',NULL,1);
INSERT INTO `oc_identifier` VALUES (5,'International Standard Book Number','ISBN',NULL,1);
INSERT INTO `oc_identifier` VALUES (6,'Manufacturer Part Number','MPN',NULL,1);
/*!40000 ALTER TABLE `oc_identifier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_information`
--

DROP TABLE IF EXISTS `oc_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) DEFAULT 0,
  `status` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`information_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_information`
--

LOCK TABLES `oc_information` WRITE;
/*!40000 ALTER TABLE `oc_information` DISABLE KEYS */;
INSERT INTO `oc_information` VALUES (1,3,1);
INSERT INTO `oc_information` VALUES (2,1,1);
INSERT INTO `oc_information` VALUES (3,4,1);
INSERT INTO `oc_information` VALUES (4,2,1);
/*!40000 ALTER TABLE `oc_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_information_description`
--

DROP TABLE IF EXISTS `oc_information_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_information_description`
--

LOCK TABLES `oc_information_description` WRITE;
/*!40000 ALTER TABLE `oc_information_description` DISABLE KEYS */;
INSERT INTO `oc_information_description` VALUES (1,1,'About Us','&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n','About Us','','');
INSERT INTO `oc_information_description` VALUES (2,1,'Terms &amp; Conditions','&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n','Terms &amp; Conditions','','');
INSERT INTO `oc_information_description` VALUES (3,1,'Privacy Policy','&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n','Privacy Policy','','');
INSERT INTO `oc_information_description` VALUES (4,1,'Delivery Information','&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n','Delivery Information','','');
/*!40000 ALTER TABLE `oc_information_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_information_to_layout`
--

DROP TABLE IF EXISTS `oc_information_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `layout_id` int(11) DEFAULT 0,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_information_to_layout`
--

LOCK TABLES `oc_information_to_layout` WRITE;
/*!40000 ALTER TABLE `oc_information_to_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_information_to_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_information_to_store`
--

DROP TABLE IF EXISTS `oc_information_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_information_to_store`
--

LOCK TABLES `oc_information_to_store` WRITE;
/*!40000 ALTER TABLE `oc_information_to_store` DISABLE KEYS */;
INSERT INTO `oc_information_to_store` VALUES (1,0);
INSERT INTO `oc_information_to_store` VALUES (2,0);
INSERT INTO `oc_information_to_store` VALUES (3,0);
INSERT INTO `oc_information_to_store` VALUES (4,0);
/*!40000 ALTER TABLE `oc_information_to_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_language`
--

DROP TABLE IF EXISTS `oc_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_language`
--

LOCK TABLES `oc_language` WRITE;
/*!40000 ALTER TABLE `oc_language` DISABLE KEYS */;
INSERT INTO `oc_language` VALUES (1,'English','en-gb','en-gb,en',NULL,1,1);
/*!40000 ALTER TABLE `oc_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_layout`
--

DROP TABLE IF EXISTS `oc_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_layout`
--

LOCK TABLES `oc_layout` WRITE;
/*!40000 ALTER TABLE `oc_layout` DISABLE KEYS */;
INSERT INTO `oc_layout` VALUES (1,'Home');
INSERT INTO `oc_layout` VALUES (2,'Product');
INSERT INTO `oc_layout` VALUES (3,'Category');
INSERT INTO `oc_layout` VALUES (4,'Default');
INSERT INTO `oc_layout` VALUES (5,'Manufacturer');
INSERT INTO `oc_layout` VALUES (6,'Account');
INSERT INTO `oc_layout` VALUES (7,'Checkout');
INSERT INTO `oc_layout` VALUES (8,'Contact');
INSERT INTO `oc_layout` VALUES (9,'Sitemap');
INSERT INTO `oc_layout` VALUES (10,'Affiliate');
INSERT INTO `oc_layout` VALUES (11,'Information');
INSERT INTO `oc_layout` VALUES (12,'Compare');
INSERT INTO `oc_layout` VALUES (13,'Search');
INSERT INTO `oc_layout` VALUES (14,'Blog');
/*!40000 ALTER TABLE `oc_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_layout_module`
--

DROP TABLE IF EXISTS `oc_layout_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) DEFAULT 0,
  `code` varchar(64) DEFAULT NULL,
  `position` varchar(14) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_layout_module`
--

LOCK TABLES `oc_layout_module` WRITE;
/*!40000 ALTER TABLE `oc_layout_module` DISABLE KEYS */;
INSERT INTO `oc_layout_module` VALUES (1,10,'opencart.account','column_right',1);
INSERT INTO `oc_layout_module` VALUES (2,6,'opencart.account','column_right',1);
INSERT INTO `oc_layout_module` VALUES (3,1,'opencart.featured.2','content_top',2);
INSERT INTO `oc_layout_module` VALUES (4,3,'opencart.banner.1','column_left',2);
INSERT INTO `oc_layout_module` VALUES (5,1,'opencart.banner.3','content_top',1);
INSERT INTO `oc_layout_module` VALUES (6,1,'opencart.banner.4','content_bottom',1);
INSERT INTO `oc_layout_module` VALUES (7,3,'opencart.category','column_left',1);
INSERT INTO `oc_layout_module` VALUES (8,14,'opencart.topic','column_left',1);
/*!40000 ALTER TABLE `oc_layout_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_layout_route`
--

DROP TABLE IF EXISTS `oc_layout_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT 0,
  `route` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_layout_route`
--

LOCK TABLES `oc_layout_route` WRITE;
/*!40000 ALTER TABLE `oc_layout_route` DISABLE KEYS */;
INSERT INTO `oc_layout_route` VALUES (1,6,0,'account/%');
INSERT INTO `oc_layout_route` VALUES (2,6,0,'information/gdpr');
INSERT INTO `oc_layout_route` VALUES (3,10,0,'affiliate/%');
INSERT INTO `oc_layout_route` VALUES (4,3,0,'product/category');
INSERT INTO `oc_layout_route` VALUES (5,1,0,'common/home');
INSERT INTO `oc_layout_route` VALUES (6,2,0,'product/product');
INSERT INTO `oc_layout_route` VALUES (7,11,0,'information/information');
INSERT INTO `oc_layout_route` VALUES (8,7,0,'checkout/%');
INSERT INTO `oc_layout_route` VALUES (9,8,0,'information/contact');
INSERT INTO `oc_layout_route` VALUES (10,9,0,'information/sitemap');
INSERT INTO `oc_layout_route` VALUES (11,4,0,'');
INSERT INTO `oc_layout_route` VALUES (12,5,0,'product/manufacturer');
INSERT INTO `oc_layout_route` VALUES (13,12,0,'product/compare');
INSERT INTO `oc_layout_route` VALUES (14,13,0,'product/search');
INSERT INTO `oc_layout_route` VALUES (15,14,0,'cms/blog');
INSERT INTO `oc_layout_route` VALUES (16,14,0,'cms/blog.info');
/*!40000 ALTER TABLE `oc_layout_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_length_class`
--

DROP TABLE IF EXISTS `oc_length_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) DEFAULT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_length_class`
--

LOCK TABLES `oc_length_class` WRITE;
/*!40000 ALTER TABLE `oc_length_class` DISABLE KEYS */;
INSERT INTO `oc_length_class` VALUES (1,1.00000000);
INSERT INTO `oc_length_class` VALUES (2,10.00000000);
INSERT INTO `oc_length_class` VALUES (3,0.39370000);
/*!40000 ALTER TABLE `oc_length_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_length_class_description`
--

DROP TABLE IF EXISTS `oc_length_class_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) DEFAULT NULL,
  `unit` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_length_class_description`
--

LOCK TABLES `oc_length_class_description` WRITE;
/*!40000 ALTER TABLE `oc_length_class_description` DISABLE KEYS */;
INSERT INTO `oc_length_class_description` VALUES (1,1,'Centimeter','cm');
INSERT INTO `oc_length_class_description` VALUES (2,1,'Millimeter','mm');
INSERT INTO `oc_length_class_description` VALUES (3,1,'Inch','in');
/*!40000 ALTER TABLE `oc_length_class_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_location`
--

DROP TABLE IF EXISTS `oc_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `geocode` varchar(32) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_location`
--

LOCK TABLES `oc_location` WRITE;
/*!40000 ALTER TABLE `oc_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_manufacturer`
--

DROP TABLE IF EXISTS `oc_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_manufacturer`
--

LOCK TABLES `oc_manufacturer` WRITE;
/*!40000 ALTER TABLE `oc_manufacturer` DISABLE KEYS */;
INSERT INTO `oc_manufacturer` VALUES (5,'HTC','catalog/demo/htc_logo.jpg',0);
INSERT INTO `oc_manufacturer` VALUES (6,'Palm','catalog/demo/palm_logo.jpg',0);
INSERT INTO `oc_manufacturer` VALUES (7,'Hewlett-Packard','catalog/demo/hp_logo.jpg',0);
INSERT INTO `oc_manufacturer` VALUES (8,'Apple','catalog/demo/apple_logo.jpg',0);
INSERT INTO `oc_manufacturer` VALUES (9,'Canon','catalog/demo/canon_logo.jpg',0);
INSERT INTO `oc_manufacturer` VALUES (10,'Sony','catalog/demo/sony_logo.jpg',0);
/*!40000 ALTER TABLE `oc_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_manufacturer_to_layout`
--

DROP TABLE IF EXISTS `oc_manufacturer_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_manufacturer_to_layout` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `layout_id` int(11) DEFAULT 0,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_manufacturer_to_layout`
--

LOCK TABLES `oc_manufacturer_to_layout` WRITE;
/*!40000 ALTER TABLE `oc_manufacturer_to_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_manufacturer_to_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_manufacturer_to_store`
--

DROP TABLE IF EXISTS `oc_manufacturer_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_manufacturer_to_store`
--

LOCK TABLES `oc_manufacturer_to_store` WRITE;
/*!40000 ALTER TABLE `oc_manufacturer_to_store` DISABLE KEYS */;
INSERT INTO `oc_manufacturer_to_store` VALUES (5,0);
INSERT INTO `oc_manufacturer_to_store` VALUES (6,0);
INSERT INTO `oc_manufacturer_to_store` VALUES (7,0);
INSERT INTO `oc_manufacturer_to_store` VALUES (8,0);
INSERT INTO `oc_manufacturer_to_store` VALUES (9,0);
INSERT INTO `oc_manufacturer_to_store` VALUES (10,0);
/*!40000 ALTER TABLE `oc_manufacturer_to_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_marketing`
--

DROP TABLE IF EXISTS `oc_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `clicks` int(5) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_marketing`
--

LOCK TABLES `oc_marketing` WRITE;
/*!40000 ALTER TABLE `oc_marketing` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_marketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_marketing_report`
--

DROP TABLE IF EXISTS `oc_marketing_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_marketing_report` (
  `marketing_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `marketing_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`marketing_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_marketing_report`
--

LOCK TABLES `oc_marketing_report` WRITE;
/*!40000 ALTER TABLE `oc_marketing_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_marketing_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_modification`
--

DROP TABLE IF EXISTS `oc_modification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_install_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `version` varchar(32) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `xml` mediumtext DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_modification`
--

LOCK TABLES `oc_modification` WRITE;
/*!40000 ALTER TABLE `oc_modification` DISABLE KEYS */;
INSERT INTO `oc_modification` VALUES (1,3,'Modification Test','Modification testing script. Do not use on a production site. This file is only for testing and should only be modified by developers.','test','OpenCart Ltd','1.0','http://www.opencart.com','<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n<modification>\r\n    <name>Modification Test</name>\r\n    <description>Modification testing script. Do not use on a production site. This file is only for testing and should only be modified by developers.</description>\r\n    <code>default</code>\r\n    <version>1.0</version>\r\n    <author>OpenCart Ltd</author>\r\n    <link>http://www.opencart.com</link>\r\n    <!-- Controller Test -->\r\n    <file path=\"admin/controller/catalog/attribute.php\">\r\n        <operation>\r\n            <search>\r\n                <![CDATA[Opencart\\Admin\\Controller\\Catalog;]]>\r\n            </search>\r\n            <add position=\"replace\">\r\n                <![CDATA[Opencart\\Admin\\Controller\\Extension\\Ocmod\\Catalog;]]>\r\n            </add>\r\n        </operation>\r\n        <operation>\r\n            <search regex=\"false\">\r\n                <![CDATA[$this->load->language(\'catalog/attribute\');]]>\r\n            </search>\r\n            <add position=\"before\">\r\n                <![CDATA[echo \'BEFORE WORKS</br>\';]]>\r\n            </add>\r\n        </operation>\r\n        <operation>\r\n            <search regex=\"false\">\r\n                <![CDATA[$this->load->language(\'catalog/attribute\');]]>\r\n            </search>\r\n            <add position=\"after\">\r\n                <![CDATA[echo \'AFTER WORKS</br>\';]]>\r\n            </add>\r\n        </operation>\r\n        <operation>\r\n            <search regex=\"false\">\r\n                <![CDATA[controller_catalog_attribute]]>\r\n            </search>\r\n            <add position=\"replace\">\r\n                <![CDATA[controller_extension_ocmod_catalog_attribute]]>\r\n            </add>\r\n        </operation>\r\n        <operation>\r\n            <search regex=\"false\">\r\n                <![CDATA[$this->load->language(\'catalog/attribute\');]]>\r\n            </search>\r\n            <add position=\"replace\">\r\n                <![CDATA[$this->load->language(\'catalog/attribute\');\r\n                echo \'REPLACE WORKS</br>\';\r\n                ]]>\r\n            </add>\r\n        </operation>\r\n    </file>\r\n    <!-- Model Test -->\r\n    <file path=\"admin/model/catalog/attribute.php\">\r\n        <operation>\r\n            <search>\r\n                <![CDATA[Opencart\\Admin\\Model\\Catalog;]]>\r\n            </search>\r\n            <add position=\"replace\">\r\n                <![CDATA[Opencart\\Admin\\Model\\Extension\\Ocmod\\Catalog;]]>\r\n            </add>\r\n        </operation>\r\n        <operation>\r\n            <search regex=\"false\">\r\n                <![CDATA[public function addAttribute(array $data): int {]]>\r\n            </search>\r\n            <add position=\"before\">\r\n                <![CDATA[echo \'MODEL BEFORE WORKS</br>\';]]>\r\n            </add>\r\n        </operation>\r\n        <operation>\r\n            <search regex=\"false\">\r\n                <![CDATA[public function addAttribute(array $data): int {]]>\r\n            </search>\r\n            <add position=\"after\">\r\n                <![CDATA[echo \'AFTER WORKS</br>\';]]>\r\n            </add>\r\n        </operation>\r\n    </file>\r\n    <!-- View Test -->\r\n    <file path=\"admin/view/template/catalog/attribute.twig\">\r\n        <operation>\r\n            <search regex=\"false\">\r\n                <![CDATA[<div class=\"float-end\">]]>\r\n            </search>\r\n            <add position=\"before\">\r\n                <![CDATA[        // BEFORE WORKS]]>\r\n            </add>\r\n        </operation>\r\n        <operation>\r\n            <search regex=\"false\">\r\n                <![CDATA[<div class=\"float-end\">]]>\r\n            </search>\r\n            <add position=\"after\">\r\n                <![CDATA[        // AFTER WORKS]]>\r\n            </add>\r\n        </operation>\r\n    </file>\r\n\r\n    <!-- Library Test -->\r\n    <file path=\"system/library/template/template.php\">\r\n        <operation>\r\n            <search regex=\"false\">\r\n                <![CDATA[include]]>\r\n            </search>\r\n            <add position=\"after\">\r\n                <![CDATA[        // AFTER WORKS]]>\r\n            </add>\r\n        </operation>\r\n    </file>\r\n\r\n    <!-- Extension Admin Test -->\r\n    <file path=\"extension/opencart/admin/controller/report/customer_order.php\">\r\n        <operation>\r\n            <search>\r\n                <![CDATA[Opencart\\Admin\\Controller\\Extension\\Opencart\\Report;]]>\r\n            </search>\r\n            <add position=\"replace\">\r\n                <![CDATA[Opencart\\Admin\\Controller\\Extension\\Ocmod\\Extension\\Opencart\\Report;]]>\r\n            </add>\r\n        </operation>\r\n        <operation>\r\n            <search regex=\"false\">\r\n                <![CDATA[$this->load->language(\'extension/opencart/report/customer_order\');]]>\r\n            </search>\r\n            <add position=\"after\">\r\n                <![CDATA[echo \'WORKS!\';]]>\r\n            </add>\r\n        </operation>\r\n    </file>\r\n\r\n    <file path=\"extension/opencart/admin/view/template/report/customer_order_form.twig\">\r\n        <operation>\r\n            <search>\r\n                <![CDATA[<h1>]]>\r\n            </search>\r\n            <add position=\"after\">\r\n                <![CDATA[hi]]>\r\n            </add>\r\n        </operation>\r\n    </file>\r\n</modification>\r\n',0,'2025-04-22 05:54:16');
/*!40000 ALTER TABLE `oc_modification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_module`
--

DROP TABLE IF EXISTS `oc_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `setting` text DEFAULT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_module`
--

LOCK TABLES `oc_module` WRITE;
/*!40000 ALTER TABLE `oc_module` DISABLE KEYS */;
INSERT INTO `oc_module` VALUES (1,'Category Banner','opencart.banner','{\"name\":\"Category Banner\",\"banner_id\":\"6\",\"effect\":\"fade\",\"items\":\"1\",\"controls\":\"0\",\"indicators\":\"0\",\"interval\":\"5000\",\"width\":\"200\",\"height\":\"180\",\"status\":\"1\"}');
INSERT INTO `oc_module` VALUES (2,'Featured','opencart.featured','{\"name\":\"Featured\",\"product_name\":\"\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"axis\":\"horizontal\",\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}');
INSERT INTO `oc_module` VALUES (3,'Homepage Slideshow','opencart.banner','{\"name\":\"Homepage Slideshow\",\"banner_id\":\"7\",\"effect\":\"slide\",\"items\":\"1\",\"controls\":\"1\",\"indicators\":\"1\",\"interval\":\"5000\",\"width\":\"1140\",\"height\":\"380\",\"status\":\"1\"}');
INSERT INTO `oc_module` VALUES (4,'Homepage Manufacturers','opencart.banner','{\"name\":\"Homepage Manufacturers\",\"banner_id\":\"8\",\"effect\":\"slide\",\"items\":\"5\",\"controls\":\"1\",\"indicators\":\"1\",\"interval\":\"5000\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}');
/*!40000 ALTER TABLE `oc_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notification`
--

DROP TABLE IF EXISTS `oc_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `status` tinyint(11) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notification`
--

LOCK TABLES `oc_notification` WRITE;
/*!40000 ALTER TABLE `oc_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_option`
--

DROP TABLE IF EXISTS `oc_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `validation` varchar(255) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_option`
--

LOCK TABLES `oc_option` WRITE;
/*!40000 ALTER TABLE `oc_option` DISABLE KEYS */;
INSERT INTO `oc_option` VALUES (1,'radio',NULL,1);
INSERT INTO `oc_option` VALUES (2,'checkbox',NULL,2);
INSERT INTO `oc_option` VALUES (4,'text',NULL,3);
INSERT INTO `oc_option` VALUES (5,'select',NULL,4);
INSERT INTO `oc_option` VALUES (6,'textarea',NULL,5);
INSERT INTO `oc_option` VALUES (7,'file',NULL,6);
INSERT INTO `oc_option` VALUES (8,'date',NULL,7);
INSERT INTO `oc_option` VALUES (9,'time',NULL,8);
INSERT INTO `oc_option` VALUES (10,'datetime',NULL,9);
INSERT INTO `oc_option` VALUES (11,'select',NULL,10);
INSERT INTO `oc_option` VALUES (12,'date',NULL,11);
/*!40000 ALTER TABLE `oc_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_option_description`
--

DROP TABLE IF EXISTS `oc_option_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_option_description`
--

LOCK TABLES `oc_option_description` WRITE;
/*!40000 ALTER TABLE `oc_option_description` DISABLE KEYS */;
INSERT INTO `oc_option_description` VALUES (1,1,'Radio');
INSERT INTO `oc_option_description` VALUES (2,1,'Checkbox');
INSERT INTO `oc_option_description` VALUES (4,1,'Text');
INSERT INTO `oc_option_description` VALUES (5,1,'Select');
INSERT INTO `oc_option_description` VALUES (6,1,'Textarea');
INSERT INTO `oc_option_description` VALUES (7,1,'File');
INSERT INTO `oc_option_description` VALUES (8,1,'Date');
INSERT INTO `oc_option_description` VALUES (9,1,'Time');
INSERT INTO `oc_option_description` VALUES (10,1,'Date &amp; Time');
INSERT INTO `oc_option_description` VALUES (11,1,'Size');
INSERT INTO `oc_option_description` VALUES (12,1,'Delivery Date');
/*!40000 ALTER TABLE `oc_option_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_option_value`
--

DROP TABLE IF EXISTS `oc_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`option_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_option_value`
--

LOCK TABLES `oc_option_value` WRITE;
/*!40000 ALTER TABLE `oc_option_value` DISABLE KEYS */;
INSERT INTO `oc_option_value` VALUES (23,2,'',1);
INSERT INTO `oc_option_value` VALUES (24,2,'',2);
INSERT INTO `oc_option_value` VALUES (31,1,'',2);
INSERT INTO `oc_option_value` VALUES (32,1,'',1);
INSERT INTO `oc_option_value` VALUES (39,5,'',1);
INSERT INTO `oc_option_value` VALUES (40,5,'',2);
INSERT INTO `oc_option_value` VALUES (41,5,'',3);
INSERT INTO `oc_option_value` VALUES (42,5,'',4);
INSERT INTO `oc_option_value` VALUES (43,1,'',3);
INSERT INTO `oc_option_value` VALUES (44,2,'',3);
INSERT INTO `oc_option_value` VALUES (45,2,'',4);
INSERT INTO `oc_option_value` VALUES (46,11,'',1);
INSERT INTO `oc_option_value` VALUES (47,11,'',2);
INSERT INTO `oc_option_value` VALUES (48,11,'',3);
/*!40000 ALTER TABLE `oc_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_option_value_description`
--

DROP TABLE IF EXISTS `oc_option_value_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_option_value_description`
--

LOCK TABLES `oc_option_value_description` WRITE;
/*!40000 ALTER TABLE `oc_option_value_description` DISABLE KEYS */;
INSERT INTO `oc_option_value_description` VALUES (23,1,2,'Checkbox 1');
INSERT INTO `oc_option_value_description` VALUES (24,1,2,'Checkbox 2');
INSERT INTO `oc_option_value_description` VALUES (31,1,1,'Medium');
INSERT INTO `oc_option_value_description` VALUES (32,1,1,'Small');
INSERT INTO `oc_option_value_description` VALUES (39,1,5,'Red');
INSERT INTO `oc_option_value_description` VALUES (40,1,5,'Blue');
INSERT INTO `oc_option_value_description` VALUES (41,1,5,'Green');
INSERT INTO `oc_option_value_description` VALUES (42,1,5,'Yellow');
INSERT INTO `oc_option_value_description` VALUES (43,1,1,'Large');
INSERT INTO `oc_option_value_description` VALUES (44,1,2,'Checkbox 3');
INSERT INTO `oc_option_value_description` VALUES (45,1,2,'Checkbox 4');
INSERT INTO `oc_option_value_description` VALUES (46,1,11,'Small');
INSERT INTO `oc_option_value_description` VALUES (47,1,11,'Medium');
INSERT INTO `oc_option_value_description` VALUES (48,1,11,'Large');
/*!40000 ALTER TABLE `oc_option_value_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_order`
--

DROP TABLE IF EXISTS `oc_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) DEFAULT 0,
  `invoice_no` int(11) DEFAULT 0,
  `invoice_prefix` varchar(26) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `store_id` int(11) DEFAULT 0,
  `store_name` varchar(64) DEFAULT NULL,
  `store_url` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT 0,
  `customer_group_id` int(11) DEFAULT 0,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `email` varchar(96) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `custom_field` text DEFAULT NULL,
  `payment_address_id` int(11) DEFAULT 0,
  `payment_firstname` varchar(32) DEFAULT NULL,
  `payment_lastname` varchar(32) DEFAULT NULL,
  `payment_company` varchar(60) DEFAULT NULL,
  `payment_address_1` varchar(128) DEFAULT NULL,
  `payment_address_2` varchar(128) DEFAULT NULL,
  `payment_city` varchar(128) DEFAULT NULL,
  `payment_postcode` varchar(10) DEFAULT NULL,
  `payment_country` varchar(128) DEFAULT NULL,
  `payment_country_id` int(11) DEFAULT 0,
  `payment_zone` varchar(128) DEFAULT NULL,
  `payment_zone_id` int(11) DEFAULT 0,
  `payment_address_format` text DEFAULT NULL,
  `payment_custom_field` text DEFAULT NULL,
  `payment_method` text DEFAULT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  `shipping_firstname` varchar(32) DEFAULT NULL,
  `shipping_lastname` varchar(32) DEFAULT NULL,
  `shipping_company` varchar(60) DEFAULT NULL,
  `shipping_address_1` varchar(128) DEFAULT NULL,
  `shipping_address_2` varchar(128) DEFAULT NULL,
  `shipping_city` varchar(128) DEFAULT NULL,
  `shipping_postcode` varchar(10) DEFAULT NULL,
  `shipping_country` varchar(128) DEFAULT NULL,
  `shipping_country_id` int(11) DEFAULT 0,
  `shipping_zone` varchar(128) DEFAULT NULL,
  `shipping_zone_id` int(11) DEFAULT 0,
  `shipping_address_format` text DEFAULT NULL,
  `shipping_custom_field` text DEFAULT NULL,
  `shipping_method` text DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `total` decimal(15,4) DEFAULT 0.0000,
  `order_status_id` int(11) DEFAULT 0,
  `affiliate_id` int(11) DEFAULT 0,
  `commission` decimal(15,4) DEFAULT NULL,
  `marketing_id` int(11) DEFAULT 0,
  `tracking` varchar(64) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `language_code` varchar(5) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `currency_value` decimal(15,8) DEFAULT 1.00000000,
  `ip` varchar(40) DEFAULT NULL,
  `forwarded_ip` varchar(40) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `accept_language` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order`
--

LOCK TABLES `oc_order` WRITE;
/*!40000 ALTER TABLE `oc_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_order_history`
--

DROP TABLE IF EXISTS `oc_order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `order_status_id` int(11) DEFAULT 0,
  `notify` tinyint(1) DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_history`
--

LOCK TABLES `oc_order_history` WRITE;
/*!40000 ALTER TABLE `oc_order_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_order_option`
--

DROP TABLE IF EXISTS `oc_order_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `order_product_id` int(11) DEFAULT NULL,
  `product_option_id` int(11) DEFAULT NULL,
  `product_option_value_id` int(11) DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_option`
--

LOCK TABLES `oc_order_option` WRITE;
/*!40000 ALTER TABLE `oc_order_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_order_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_order_product`
--

DROP TABLE IF EXISTS `oc_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `master_id` int(11) DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `model` varchar(64) DEFAULT NULL,
  `quantity` int(4) DEFAULT 1,
  `price` decimal(15,4) DEFAULT 0.0000,
  `total` decimal(15,4) DEFAULT 0.0000,
  `tax` decimal(15,4) DEFAULT 0.0000,
  `reward` int(8) DEFAULT 0,
  PRIMARY KEY (`order_product_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_product`
--

LOCK TABLES `oc_order_product` WRITE;
/*!40000 ALTER TABLE `oc_order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_order_status`
--

DROP TABLE IF EXISTS `oc_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_status`
--

LOCK TABLES `oc_order_status` WRITE;
/*!40000 ALTER TABLE `oc_order_status` DISABLE KEYS */;
INSERT INTO `oc_order_status` VALUES (1,1,'Pending');
INSERT INTO `oc_order_status` VALUES (2,1,'Processing');
INSERT INTO `oc_order_status` VALUES (3,1,'Shipped');
INSERT INTO `oc_order_status` VALUES (5,1,'Complete');
INSERT INTO `oc_order_status` VALUES (7,1,'Canceled');
INSERT INTO `oc_order_status` VALUES (8,1,'Denied');
INSERT INTO `oc_order_status` VALUES (9,1,'Canceled Reversal');
INSERT INTO `oc_order_status` VALUES (10,1,'Failed');
INSERT INTO `oc_order_status` VALUES (11,1,'Refunded');
INSERT INTO `oc_order_status` VALUES (12,1,'Reversed');
INSERT INTO `oc_order_status` VALUES (13,1,'Chargeback');
INSERT INTO `oc_order_status` VALUES (14,1,'Expired');
INSERT INTO `oc_order_status` VALUES (15,1,'Processed');
INSERT INTO `oc_order_status` VALUES (16,1,'Voided');
/*!40000 ALTER TABLE `oc_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_order_subscription`
--

DROP TABLE IF EXISTS `oc_order_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order_subscription` (
  `order_subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(4) DEFAULT 1,
  `subscription_plan_id` int(11) DEFAULT NULL,
  `trial_price` decimal(10,4) DEFAULT NULL,
  `trial_tax` decimal(15,4) DEFAULT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') DEFAULT NULL,
  `trial_cycle` smallint(6) DEFAULT NULL,
  `trial_duration` smallint(6) DEFAULT NULL,
  `trial_status` tinyint(1) DEFAULT 0,
  `price` decimal(10,4) DEFAULT NULL,
  `tax` decimal(15,4) DEFAULT NULL,
  `frequency` enum('day','week','semi_month','month','year') DEFAULT NULL,
  `cycle` smallint(6) DEFAULT 1,
  `duration` smallint(6) DEFAULT 0,
  PRIMARY KEY (`order_subscription_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_subscription`
--

LOCK TABLES `oc_order_subscription` WRITE;
/*!40000 ALTER TABLE `oc_order_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_order_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_order_total`
--

DROP TABLE IF EXISTS `oc_order_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `value` decimal(15,4) DEFAULT 0.0000,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_total`
--

LOCK TABLES `oc_order_total` WRITE;
/*!40000 ALTER TABLE `oc_order_total` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_order_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product`
--

DROP TABLE IF EXISTS `oc_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `master_id` int(11) DEFAULT 0,
  `model` varchar(64) DEFAULT NULL,
  `sku` varchar(64) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `ean` varchar(14) DEFAULT NULL,
  `jan` varchar(13) DEFAULT NULL,
  `isbn` varchar(17) DEFAULT NULL,
  `mpn` varchar(64) DEFAULT NULL,
  `location` varchar(128) DEFAULT NULL,
  `variant` text DEFAULT '',
  `override` text DEFAULT '',
  `quantity` int(4) DEFAULT 0,
  `stock_status_id` int(11) DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT 0,
  `shipping` tinyint(1) DEFAULT 1,
  `price` decimal(15,4) DEFAULT 0.0000,
  `points` int(8) DEFAULT 0,
  `tax_class_id` int(11) DEFAULT 0,
  `date_available` date DEFAULT NULL,
  `weight` decimal(15,8) DEFAULT 0.00000000,
  `weight_class_id` int(11) DEFAULT 0,
  `length` decimal(15,8) DEFAULT 0.00000000,
  `width` decimal(15,8) DEFAULT 0.00000000,
  `height` decimal(15,8) DEFAULT 0.00000000,
  `length_class_id` int(11) DEFAULT 0,
  `subtract` tinyint(1) DEFAULT 1,
  `minimum` int(11) DEFAULT 1,
  `rating` int(1) DEFAULT 0,
  `sort_order` int(11) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product`
--

LOCK TABLES `oc_product` WRITE;
/*!40000 ALTER TABLE `oc_product` DISABLE KEYS */;
INSERT INTO `oc_product` VALUES (28,0,'Product 1','','','','','','','','','',939,7,'catalog/demo/htc_touch_hd_1.jpg',5,1,100.0000,200,9,'2009-02-03',146.40000000,2,0.00000000,0.00000000,0.00000000,1,1,1,0,0,1,'2009-02-03 16:06:50','2011-09-30 01:05:39');
INSERT INTO `oc_product` VALUES (29,0,'Product 2','','','','','','','','','',999,6,'catalog/demo/palm_treo_pro_1.jpg',6,1,279.9900,0,9,'2009-02-03',133.00000000,2,0.00000000,0.00000000,0.00000000,3,1,1,0,0,1,'2009-02-03 16:42:17','2011-09-30 01:06:08');
INSERT INTO `oc_product` VALUES (30,0,'Product 3','','','','','','','','','',7,6,'catalog/demo/canon_eos_5d_1.jpg',9,1,100.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,0,1,'2009-02-03 16:59:00','2011-09-30 01:05:23');
INSERT INTO `oc_product` VALUES (31,0,'Product 4','','','','','','','','','',1000,6,'catalog/demo/nikon_d300_1.jpg',0,1,80.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,3,1,1,0,0,1,'2009-02-03 17:00:10','2011-09-30 01:06:00');
INSERT INTO `oc_product` VALUES (32,0,'Product 5','','','','','','','','','',999,6,'catalog/demo/ipod_touch_1.jpg',8,1,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,0,1,'2009-02-03 17:07:26','2011-09-30 01:07:22');
INSERT INTO `oc_product` VALUES (33,0,'Product 6','','','','','','','','','',1000,6,'catalog/demo/samsung_syncmaster_941bw.jpg',0,1,200.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,0,1,'2009-02-03 17:08:31','2011-09-30 01:06:29');
INSERT INTO `oc_product` VALUES (34,0,'Product 7','','','','','','','','','',1000,6,'catalog/demo/ipod_shuffle_1.jpg',8,1,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,0,1,'2009-02-03 18:07:54','2011-09-30 01:07:17');
INSERT INTO `oc_product` VALUES (35,0,'Product 8','','','','','','','','','',1000,5,'',0,0,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,0,1,'2009-02-03 18:08:31','2011-09-30 01:06:17');
INSERT INTO `oc_product` VALUES (36,0,'Product 9','','','','','','','','','',994,6,'catalog/demo/ipod_nano_1.jpg',8,0,100.0000,100,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,0,1,'2009-02-03 18:09:19','2011-09-30 01:07:12');
INSERT INTO `oc_product` VALUES (40,0,'product 11','','','','','','','','','',970,5,'catalog/demo/iphone_1.jpg',8,1,101.0000,0,9,'2009-02-03',10.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,0,1,'2009-02-03 21:07:12','2011-09-30 01:06:53');
INSERT INTO `oc_product` VALUES (41,0,'Product 14','','','','','','','','','',977,5,'catalog/demo/imac_1.jpg',8,1,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,0,1,'2009-02-03 21:07:26','2011-09-30 01:06:44');
INSERT INTO `oc_product` VALUES (42,0,'Product 15','','','','','','','','','',990,5,'catalog/demo/apple_cinema_30.jpg',8,1,100.0000,400,9,'2009-02-04',12.50000000,1,1.00000000,2.00000000,3.00000000,1,1,2,0,0,1,'2009-02-03 21:07:37','2011-09-30 00:46:19');
INSERT INTO `oc_product` VALUES (43,0,'Product 16','','','','','','','','','',929,5,'catalog/demo/macbook_1.jpg',8,0,500.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,0,1,'2009-02-03 21:07:49','2011-09-30 01:05:46');
INSERT INTO `oc_product` VALUES (44,0,'Product 17','','','','','','','','','',1000,5,'catalog/demo/macbook_air_1.jpg',8,1,1000.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,0,1,'2009-02-03 21:08:00','2011-09-30 01:05:53');
INSERT INTO `oc_product` VALUES (45,0,'Product 18','','','','','','','','','',998,5,'catalog/demo/macbook_pro_1.jpg',8,1,2000.0000,0,100,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,0,1,'2009-02-03 21:08:17','2011-09-15 22:22:01');
INSERT INTO `oc_product` VALUES (46,0,'Product 19','','','','','','','','','',1000,5,'catalog/demo/sony_vaio_1.jpg',10,1,1000.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,0,1,'2009-02-03 21:08:29','2011-09-30 01:06:39');
INSERT INTO `oc_product` VALUES (47,0,'Product 21','','','','','','','','','',1000,5,'catalog/demo/hp_1.jpg',7,1,100.0000,400,9,'2009-02-03',1.00000000,1,0.00000000,0.00000000,0.00000000,1,0,1,0,0,1,'2009-02-03 21:08:40','2011-09-30 01:05:28');
INSERT INTO `oc_product` VALUES (48,0,'product 20','test 1','','','','','','test 2','','',995,5,'catalog/demo/ipod_classic_1.jpg',8,1,100.0000,0,9,'2009-02-08',1.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,0,1,'2009-02-08 17:21:51','2011-09-30 01:07:06');
INSERT INTO `oc_product` VALUES (49,0,'SAM1','','','','','','','','','',0,8,'catalog/demo/samsung_tab_1.jpg',0,1,199.9900,0,9,'2011-04-25',0.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,1,1,'2011-04-26 08:57:34','2011-09-30 01:06:23');
/*!40000 ALTER TABLE `oc_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_attribute`
--

DROP TABLE IF EXISTS `oc_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text DEFAULT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_attribute`
--

LOCK TABLES `oc_product_attribute` WRITE;
/*!40000 ALTER TABLE `oc_product_attribute` DISABLE KEYS */;
INSERT INTO `oc_product_attribute` VALUES (42,3,1,'100mhz');
INSERT INTO `oc_product_attribute` VALUES (43,2,1,'1');
INSERT INTO `oc_product_attribute` VALUES (43,4,1,'8gb');
INSERT INTO `oc_product_attribute` VALUES (47,2,1,'4');
INSERT INTO `oc_product_attribute` VALUES (47,4,1,'16GB');
/*!40000 ALTER TABLE `oc_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_code`
--

DROP TABLE IF EXISTS `oc_product_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_code` (
  `product_code_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `code` varchar(48) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_code_id`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_code`
--

LOCK TABLES `oc_product_code` WRITE;
/*!40000 ALTER TABLE `oc_product_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_product_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_description`
--

DROP TABLE IF EXISTS `oc_product_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `tag` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_description`
--

LOCK TABLES `oc_product_description` WRITE;
/*!40000 ALTER TABLE `oc_product_description` DISABLE KEYS */;
INSERT INTO `oc_product_description` VALUES (28,1,'HTC Touch HD','&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n','','	 HTC Touch HD','','');
INSERT INTO `oc_product_description` VALUES (29,1,'Palm Treo Pro','&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n','','Palm Treo Pro','','');
INSERT INTO `oc_product_description` VALUES (30,1,'Canon EOS 5D','&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n','','Canon EOS 5D','','');
INSERT INTO `oc_product_description` VALUES (31,1,'Nikon D300','&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;','','Nikon D300','','');
INSERT INTO `oc_product_description` VALUES (32,1,'iPod Touch','&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n','','	 iPod Touch','','');
INSERT INTO `oc_product_description` VALUES (33,1,'Samsung SyncMaster 941BW','&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n','','Samsung SyncMaster 941BW','','');
INSERT INTO `oc_product_description` VALUES (34,1,'iPod Shuffle','&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n','','iPod Shuffle','','');
INSERT INTO `oc_product_description` VALUES (35,1,'Product 8','&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n','','Product 8','','');
INSERT INTO `oc_product_description` VALUES (36,1,'iPod Nano','&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n','','iPod Nano','','');
INSERT INTO `oc_product_description` VALUES (40,1,'iPhone','&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n','','iPhone','','');
INSERT INTO `oc_product_description` VALUES (41,1,'iMac','&lt;div&gt;\r\n	Just when you thought iMac had everything, now there&acute;s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife &acute;08, and it&acute;s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n','','iMac','','');
INSERT INTO `oc_product_description` VALUES (42,1,'Apple Cinema 30&quot;','&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n','','Apple Cinema 30','','');
INSERT INTO `oc_product_description` VALUES (43,1,'MacBook','&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n','','MacBook','','');
INSERT INTO `oc_product_description` VALUES (44,1,'MacBook Air','&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n','','MacBook Air','','');
INSERT INTO `oc_product_description` VALUES (45,1,'MacBook Pro','&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;','','MacBook Pro','','');
INSERT INTO `oc_product_description` VALUES (46,1,'Sony VAIO','&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n','','Sony VAIO','','');
INSERT INTO `oc_product_description` VALUES (47,1,'HP LP3065','&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n','','HP LP3065','','');
INSERT INTO `oc_product_description` VALUES (48,1,'iPod Classic','&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;','','iPod Classic','','');
INSERT INTO `oc_product_description` VALUES (49,1,'Samsung Galaxy Tab 10.1','&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n','','Samsung Galaxy Tab 10.1','','');
/*!40000 ALTER TABLE `oc_product_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_discount`
--

DROP TABLE IF EXISTS `oc_product_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `quantity` int(4) DEFAULT 0,
  `priority` int(5) DEFAULT 1,
  `price` decimal(15,4) DEFAULT 0.0000,
  `type` char(1) DEFAULT 'P',
  `special` tinyint(1) DEFAULT 0,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_discount`
--

LOCK TABLES `oc_product_discount` WRITE;
/*!40000 ALTER TABLE `oc_product_discount` DISABLE KEYS */;
INSERT INTO `oc_product_discount` VALUES (438,42,1,10,1,88.0000,'P',0,'0000-00-00','0000-00-00');
INSERT INTO `oc_product_discount` VALUES (439,42,1,20,1,77.0000,'P',0,'0000-00-00','0000-00-00');
INSERT INTO `oc_product_discount` VALUES (440,42,1,30,1,66.0000,'P',0,'0000-00-00','0000-00-00');
/*!40000 ALTER TABLE `oc_product_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_filter`
--

DROP TABLE IF EXISTS `oc_product_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_filter`
--

LOCK TABLES `oc_product_filter` WRITE;
/*!40000 ALTER TABLE `oc_product_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_product_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_image`
--

DROP TABLE IF EXISTS `oc_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2352 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_image`
--

LOCK TABLES `oc_product_image` WRITE;
/*!40000 ALTER TABLE `oc_product_image` DISABLE KEYS */;
INSERT INTO `oc_product_image` VALUES (1968,43,'catalog/demo/macbook_3.jpg',0);
INSERT INTO `oc_product_image` VALUES (1969,43,'catalog/demo/macbook_2.jpg',0);
INSERT INTO `oc_product_image` VALUES (1970,43,'catalog/demo/macbook_4.jpg',0);
INSERT INTO `oc_product_image` VALUES (1971,43,'catalog/demo/macbook_5.jpg',0);
INSERT INTO `oc_product_image` VALUES (1972,44,'catalog/demo/macbook_air_3.jpg',0);
INSERT INTO `oc_product_image` VALUES (1973,44,'catalog/demo/macbook_air_2.jpg',0);
INSERT INTO `oc_product_image` VALUES (1974,44,'catalog/demo/macbook_air_4.jpg',0);
INSERT INTO `oc_product_image` VALUES (1975,45,'catalog/demo/macbook_pro_4.jpg',0);
INSERT INTO `oc_product_image` VALUES (1976,45,'catalog/demo/macbook_pro_3.jpg',0);
INSERT INTO `oc_product_image` VALUES (1977,45,'catalog/demo/macbook_pro_2.jpg',0);
INSERT INTO `oc_product_image` VALUES (1978,40,'catalog/demo/iphone_4.jpg',0);
INSERT INTO `oc_product_image` VALUES (1979,40,'catalog/demo/iphone_3.jpg',0);
INSERT INTO `oc_product_image` VALUES (1980,40,'catalog/demo/iphone_5.jpg',0);
INSERT INTO `oc_product_image` VALUES (1981,40,'catalog/demo/iphone_2.jpg',0);
INSERT INTO `oc_product_image` VALUES (1982,40,'catalog/demo/iphone_6.jpg',0);
INSERT INTO `oc_product_image` VALUES (1983,31,'catalog/demo/nikon_d300_5.jpg',0);
INSERT INTO `oc_product_image` VALUES (1984,31,'catalog/demo/nikon_d300_4.jpg',0);
INSERT INTO `oc_product_image` VALUES (1985,31,'catalog/demo/nikon_d300_2.jpg',0);
INSERT INTO `oc_product_image` VALUES (1986,31,'catalog/demo/nikon_d300_3.jpg',0);
INSERT INTO `oc_product_image` VALUES (1987,29,'catalog/demo/palm_treo_pro_2.jpg',0);
INSERT INTO `oc_product_image` VALUES (1988,29,'catalog/demo/palm_treo_pro_3.jpg',0);
INSERT INTO `oc_product_image` VALUES (1989,48,'catalog/demo/ipod_classic_2.jpg',0);
INSERT INTO `oc_product_image` VALUES (1990,48,'catalog/demo/ipod_classic_3.jpg',0);
INSERT INTO `oc_product_image` VALUES (1991,48,'catalog/demo/ipod_classic_4.jpg',0);
INSERT INTO `oc_product_image` VALUES (1992,46,'catalog/demo/sony_vaio_3.jpg',0);
INSERT INTO `oc_product_image` VALUES (1993,46,'catalog/demo/sony_vaio_2.jpg',0);
INSERT INTO `oc_product_image` VALUES (1994,46,'catalog/demo/sony_vaio_4.jpg',0);
INSERT INTO `oc_product_image` VALUES (1995,46,'catalog/demo/sony_vaio_5.jpg',0);
INSERT INTO `oc_product_image` VALUES (1998,36,'catalog/demo/ipod_nano_3.jpg',0);
INSERT INTO `oc_product_image` VALUES (1999,36,'catalog/demo/ipod_nano_2.jpg',0);
INSERT INTO `oc_product_image` VALUES (2000,36,'catalog/demo/ipod_nano_4.jpg',0);
INSERT INTO `oc_product_image` VALUES (2001,36,'catalog/demo/ipod_nano_5.jpg',0);
INSERT INTO `oc_product_image` VALUES (2002,34,'catalog/demo/ipod_shuffle_3.jpg',0);
INSERT INTO `oc_product_image` VALUES (2003,34,'catalog/demo/ipod_shuffle_2.jpg',0);
INSERT INTO `oc_product_image` VALUES (2004,34,'catalog/demo/ipod_shuffle_4.jpg',0);
INSERT INTO `oc_product_image` VALUES (2005,34,'catalog/demo/ipod_shuffle_5.jpg',0);
INSERT INTO `oc_product_image` VALUES (2006,32,'catalog/demo/ipod_touch_4.jpg',0);
INSERT INTO `oc_product_image` VALUES (2007,32,'catalog/demo/ipod_touch_3.jpg',0);
INSERT INTO `oc_product_image` VALUES (2008,32,'catalog/demo/ipod_touch_2.jpg',0);
INSERT INTO `oc_product_image` VALUES (2009,32,'catalog/demo/ipod_touch_5.jpg',0);
INSERT INTO `oc_product_image` VALUES (2010,32,'catalog/demo/ipod_touch_6.jpg',0);
INSERT INTO `oc_product_image` VALUES (2011,32,'catalog/demo/ipod_touch_7.jpg',0);
INSERT INTO `oc_product_image` VALUES (2034,28,'catalog/demo/htc_touch_hd_3.jpg',0);
INSERT INTO `oc_product_image` VALUES (2035,28,'catalog/demo/htc_touch_hd_2.jpg',0);
INSERT INTO `oc_product_image` VALUES (2313,42,'catalog/demo/canon_eos_5d_2.jpg',0);
INSERT INTO `oc_product_image` VALUES (2314,42,'catalog/demo/canon_eos_5d_1.jpg',0);
INSERT INTO `oc_product_image` VALUES (2315,42,'catalog/demo/compaq_presario.jpg',0);
INSERT INTO `oc_product_image` VALUES (2316,42,'catalog/demo/hp_1.jpg',0);
INSERT INTO `oc_product_image` VALUES (2317,42,'catalog/demo/canon_logo.jpg',0);
INSERT INTO `oc_product_image` VALUES (2320,47,'catalog/demo/hp_2.jpg',0);
INSERT INTO `oc_product_image` VALUES (2321,47,'catalog/demo/hp_3.jpg',0);
INSERT INTO `oc_product_image` VALUES (2322,49,'catalog/demo/samsung_tab_2.jpg',0);
INSERT INTO `oc_product_image` VALUES (2323,49,'catalog/demo/samsung_tab_3.jpg',0);
INSERT INTO `oc_product_image` VALUES (2324,49,'catalog/demo/samsung_tab_4.jpg',0);
INSERT INTO `oc_product_image` VALUES (2325,49,'catalog/demo/samsung_tab_5.jpg',0);
INSERT INTO `oc_product_image` VALUES (2326,49,'catalog/demo/samsung_tab_6.jpg',0);
INSERT INTO `oc_product_image` VALUES (2327,49,'catalog/demo/samsung_tab_7.jpg',0);
INSERT INTO `oc_product_image` VALUES (2344,30,'catalog/demo/canon_eos_5d_3.jpg',0);
INSERT INTO `oc_product_image` VALUES (2345,30,'catalog/demo/canon_eos_5d_2.jpg',0);
INSERT INTO `oc_product_image` VALUES (2350,41,'catalog/demo/imac_2.jpg',0);
INSERT INTO `oc_product_image` VALUES (2351,41,'catalog/demo/imac_3.jpg',0);
/*!40000 ALTER TABLE `oc_product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_option`
--

DROP TABLE IF EXISTS `oc_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `required` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`product_option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_option`
--

LOCK TABLES `oc_product_option` WRITE;
/*!40000 ALTER TABLE `oc_product_option` DISABLE KEYS */;
INSERT INTO `oc_product_option` VALUES (208,42,4,'test',1);
INSERT INTO `oc_product_option` VALUES (209,42,6,'',1);
INSERT INTO `oc_product_option` VALUES (217,42,5,'',1);
INSERT INTO `oc_product_option` VALUES (218,42,1,'',1);
INSERT INTO `oc_product_option` VALUES (219,42,8,'2011-02-20',1);
INSERT INTO `oc_product_option` VALUES (220,42,10,'2011-02-20 22:25',1);
INSERT INTO `oc_product_option` VALUES (221,42,9,'22:25',1);
INSERT INTO `oc_product_option` VALUES (222,42,7,'',1);
INSERT INTO `oc_product_option` VALUES (223,42,2,'',1);
INSERT INTO `oc_product_option` VALUES (224,35,11,'',1);
INSERT INTO `oc_product_option` VALUES (225,47,12,'2011-04-22',1);
INSERT INTO `oc_product_option` VALUES (226,30,5,'',1);
/*!40000 ALTER TABLE `oc_product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_option_value`
--

DROP TABLE IF EXISTS `oc_product_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `option_value_id` int(11) DEFAULT 0,
  `quantity` int(3) DEFAULT 0,
  `subtract` tinyint(1) DEFAULT 0,
  `price` decimal(15,4) DEFAULT NULL,
  `price_prefix` varchar(1) DEFAULT NULL,
  `points` int(8) DEFAULT 0,
  `points_prefix` varchar(1) DEFAULT NULL,
  `weight` decimal(15,8) DEFAULT NULL,
  `weight_prefix` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_option_value`
--

LOCK TABLES `oc_product_option_value` WRITE;
/*!40000 ALTER TABLE `oc_product_option_value` DISABLE KEYS */;
INSERT INTO `oc_product_option_value` VALUES (1,217,42,5,41,100,0,1.0000,'+',0,'+',1.00000000,'+');
INSERT INTO `oc_product_option_value` VALUES (2,217,42,5,42,200,1,2.0000,'+',0,'+',2.00000000,'+');
INSERT INTO `oc_product_option_value` VALUES (3,217,42,5,40,300,0,3.0000,'+',0,'+',3.00000000,'+');
INSERT INTO `oc_product_option_value` VALUES (4,217,42,5,39,92,1,4.0000,'+',0,'+',4.00000000,'+');
INSERT INTO `oc_product_option_value` VALUES (5,218,42,1,32,96,1,10.0000,'+',1,'+',10.00000000,'+');
INSERT INTO `oc_product_option_value` VALUES (6,218,42,1,31,146,1,20.0000,'+',2,'-',20.00000000,'+');
INSERT INTO `oc_product_option_value` VALUES (7,218,42,1,43,300,1,30.0000,'+',3,'+',30.00000000,'+');
INSERT INTO `oc_product_option_value` VALUES (8,223,42,2,23,48,1,10.0000,'+',0,'+',10.00000000,'+');
INSERT INTO `oc_product_option_value` VALUES (9,223,42,2,24,194,1,20.0000,'+',0,'+',20.00000000,'+');
INSERT INTO `oc_product_option_value` VALUES (10,223,42,2,44,2696,1,30.0000,'+',0,'+',30.00000000,'+');
INSERT INTO `oc_product_option_value` VALUES (11,223,42,2,45,3998,1,40.0000,'+',0,'+',40.00000000,'+');
INSERT INTO `oc_product_option_value` VALUES (12,224,35,11,46,0,1,5.0000,'+',0,'+',0.00000000,'+');
INSERT INTO `oc_product_option_value` VALUES (13,224,35,11,47,10,1,10.0000,'+',0,'+',0.00000000,'+');
INSERT INTO `oc_product_option_value` VALUES (14,224,35,11,48,15,1,15.0000,'+',0,'+',0.00000000,'+');
INSERT INTO `oc_product_option_value` VALUES (15,226,30,5,39,2,1,0.0000,'+',0,'+',0.00000000,'+');
INSERT INTO `oc_product_option_value` VALUES (16,226,30,5,40,5,1,0.0000,'+',0,'+',0.00000000,'+');
/*!40000 ALTER TABLE `oc_product_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_related`
--

DROP TABLE IF EXISTS `oc_product_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_related`
--

LOCK TABLES `oc_product_related` WRITE;
/*!40000 ALTER TABLE `oc_product_related` DISABLE KEYS */;
INSERT INTO `oc_product_related` VALUES (40,42);
INSERT INTO `oc_product_related` VALUES (41,42);
INSERT INTO `oc_product_related` VALUES (42,40);
INSERT INTO `oc_product_related` VALUES (42,41);
/*!40000 ALTER TABLE `oc_product_related` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_report`
--

DROP TABLE IF EXISTS `oc_product_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_report` (
  `product_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`product_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_report`
--

LOCK TABLES `oc_product_report` WRITE;
/*!40000 ALTER TABLE `oc_product_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_product_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_reward`
--

DROP TABLE IF EXISTS `oc_product_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT 0,
  `customer_group_id` int(11) DEFAULT 0,
  `points` int(8) DEFAULT 0,
  PRIMARY KEY (`product_reward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=546 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_reward`
--

LOCK TABLES `oc_product_reward` WRITE;
/*!40000 ALTER TABLE `oc_product_reward` DISABLE KEYS */;
INSERT INTO `oc_product_reward` VALUES (329,43,1,600);
INSERT INTO `oc_product_reward` VALUES (331,44,1,700);
INSERT INTO `oc_product_reward` VALUES (333,45,1,800);
INSERT INTO `oc_product_reward` VALUES (335,40,1,0);
INSERT INTO `oc_product_reward` VALUES (337,31,1,0);
INSERT INTO `oc_product_reward` VALUES (339,29,1,0);
INSERT INTO `oc_product_reward` VALUES (343,48,1,0);
INSERT INTO `oc_product_reward` VALUES (345,33,1,0);
INSERT INTO `oc_product_reward` VALUES (347,46,1,0);
INSERT INTO `oc_product_reward` VALUES (351,36,1,0);
INSERT INTO `oc_product_reward` VALUES (353,34,1,0);
INSERT INTO `oc_product_reward` VALUES (355,32,1,0);
INSERT INTO `oc_product_reward` VALUES (379,28,1,400);
INSERT INTO `oc_product_reward` VALUES (425,35,1,0);
INSERT INTO `oc_product_reward` VALUES (515,42,1,100);
INSERT INTO `oc_product_reward` VALUES (519,47,1,300);
INSERT INTO `oc_product_reward` VALUES (521,49,1,1000);
INSERT INTO `oc_product_reward` VALUES (539,30,1,200);
INSERT INTO `oc_product_reward` VALUES (545,41,1,0);
/*!40000 ALTER TABLE `oc_product_reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_subscription`
--

DROP TABLE IF EXISTS `oc_product_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_subscription` (
  `product_id` int(11) NOT NULL,
  `subscription_plan_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `trial_price` decimal(10,4) DEFAULT NULL,
  `price` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`subscription_plan_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_subscription`
--

LOCK TABLES `oc_product_subscription` WRITE;
/*!40000 ALTER TABLE `oc_product_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_product_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_to_category`
--

DROP TABLE IF EXISTS `oc_product_to_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_to_category`
--

LOCK TABLES `oc_product_to_category` WRITE;
/*!40000 ALTER TABLE `oc_product_to_category` DISABLE KEYS */;
INSERT INTO `oc_product_to_category` VALUES (28,20);
INSERT INTO `oc_product_to_category` VALUES (28,24);
INSERT INTO `oc_product_to_category` VALUES (29,20);
INSERT INTO `oc_product_to_category` VALUES (29,24);
INSERT INTO `oc_product_to_category` VALUES (30,20);
INSERT INTO `oc_product_to_category` VALUES (30,33);
INSERT INTO `oc_product_to_category` VALUES (31,33);
INSERT INTO `oc_product_to_category` VALUES (32,34);
INSERT INTO `oc_product_to_category` VALUES (33,20);
INSERT INTO `oc_product_to_category` VALUES (33,28);
INSERT INTO `oc_product_to_category` VALUES (34,34);
INSERT INTO `oc_product_to_category` VALUES (35,20);
INSERT INTO `oc_product_to_category` VALUES (36,34);
INSERT INTO `oc_product_to_category` VALUES (40,20);
INSERT INTO `oc_product_to_category` VALUES (40,24);
INSERT INTO `oc_product_to_category` VALUES (41,27);
INSERT INTO `oc_product_to_category` VALUES (42,20);
INSERT INTO `oc_product_to_category` VALUES (42,28);
INSERT INTO `oc_product_to_category` VALUES (43,18);
INSERT INTO `oc_product_to_category` VALUES (43,20);
INSERT INTO `oc_product_to_category` VALUES (44,18);
INSERT INTO `oc_product_to_category` VALUES (44,20);
INSERT INTO `oc_product_to_category` VALUES (45,18);
INSERT INTO `oc_product_to_category` VALUES (46,18);
INSERT INTO `oc_product_to_category` VALUES (46,20);
INSERT INTO `oc_product_to_category` VALUES (47,18);
INSERT INTO `oc_product_to_category` VALUES (47,20);
INSERT INTO `oc_product_to_category` VALUES (48,20);
INSERT INTO `oc_product_to_category` VALUES (48,34);
INSERT INTO `oc_product_to_category` VALUES (49,57);
/*!40000 ALTER TABLE `oc_product_to_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_to_download`
--

DROP TABLE IF EXISTS `oc_product_to_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_to_download`
--

LOCK TABLES `oc_product_to_download` WRITE;
/*!40000 ALTER TABLE `oc_product_to_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_product_to_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_to_layout`
--

DROP TABLE IF EXISTS `oc_product_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `layout_id` int(11) DEFAULT 0,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_to_layout`
--

LOCK TABLES `oc_product_to_layout` WRITE;
/*!40000 ALTER TABLE `oc_product_to_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_product_to_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_to_store`
--

DROP TABLE IF EXISTS `oc_product_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_to_store`
--

LOCK TABLES `oc_product_to_store` WRITE;
/*!40000 ALTER TABLE `oc_product_to_store` DISABLE KEYS */;
INSERT INTO `oc_product_to_store` VALUES (28,0);
INSERT INTO `oc_product_to_store` VALUES (29,0);
INSERT INTO `oc_product_to_store` VALUES (30,0);
INSERT INTO `oc_product_to_store` VALUES (31,0);
INSERT INTO `oc_product_to_store` VALUES (32,0);
INSERT INTO `oc_product_to_store` VALUES (33,0);
INSERT INTO `oc_product_to_store` VALUES (34,0);
INSERT INTO `oc_product_to_store` VALUES (35,0);
INSERT INTO `oc_product_to_store` VALUES (36,0);
INSERT INTO `oc_product_to_store` VALUES (40,0);
INSERT INTO `oc_product_to_store` VALUES (41,0);
INSERT INTO `oc_product_to_store` VALUES (42,0);
INSERT INTO `oc_product_to_store` VALUES (43,0);
INSERT INTO `oc_product_to_store` VALUES (44,0);
INSERT INTO `oc_product_to_store` VALUES (45,0);
INSERT INTO `oc_product_to_store` VALUES (46,0);
INSERT INTO `oc_product_to_store` VALUES (47,0);
INSERT INTO `oc_product_to_store` VALUES (48,0);
INSERT INTO `oc_product_to_store` VALUES (49,0);
/*!40000 ALTER TABLE `oc_product_to_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_viewed`
--

DROP TABLE IF EXISTS `oc_product_viewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_viewed` (
  `product_id` int(11) NOT NULL,
  `viewed` int(11) DEFAULT 0,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_viewed`
--

LOCK TABLES `oc_product_viewed` WRITE;
/*!40000 ALTER TABLE `oc_product_viewed` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_product_viewed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_return`
--

DROP TABLE IF EXISTS `oc_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT 0,
  `customer_id` int(11) DEFAULT 0,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `email` varchar(96) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `product_id` int(11) DEFAULT 0,
  `product` varchar(255) DEFAULT NULL,
  `model` varchar(64) DEFAULT NULL,
  `quantity` int(4) DEFAULT 0,
  `opened` tinyint(1) DEFAULT 0,
  `return_reason_id` int(11) DEFAULT 0,
  `return_action_id` int(11) DEFAULT 0,
  `return_status_id` int(11) DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_ordered` date DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_return`
--

LOCK TABLES `oc_return` WRITE;
/*!40000 ALTER TABLE `oc_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_return_action`
--

DROP TABLE IF EXISTS `oc_return_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_return_action`
--

LOCK TABLES `oc_return_action` WRITE;
/*!40000 ALTER TABLE `oc_return_action` DISABLE KEYS */;
INSERT INTO `oc_return_action` VALUES (1,1,'Waiting for return');
INSERT INTO `oc_return_action` VALUES (2,1,'Credit Issued');
INSERT INTO `oc_return_action` VALUES (3,1,'Replacement Sent');
INSERT INTO `oc_return_action` VALUES (4,1,'Refunded');
/*!40000 ALTER TABLE `oc_return_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_return_history`
--

DROP TABLE IF EXISTS `oc_return_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) DEFAULT NULL,
  `return_status_id` int(11) DEFAULT 0,
  `notify` tinyint(1) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_return_history`
--

LOCK TABLES `oc_return_history` WRITE;
/*!40000 ALTER TABLE `oc_return_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_return_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_return_reason`
--

DROP TABLE IF EXISTS `oc_return_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_return_reason`
--

LOCK TABLES `oc_return_reason` WRITE;
/*!40000 ALTER TABLE `oc_return_reason` DISABLE KEYS */;
INSERT INTO `oc_return_reason` VALUES (1,1,'Dead On Arrival');
INSERT INTO `oc_return_reason` VALUES (2,1,'Received Wrong Item');
INSERT INTO `oc_return_reason` VALUES (3,1,'Order Error');
INSERT INTO `oc_return_reason` VALUES (4,1,'Faulty, please supply details');
INSERT INTO `oc_return_reason` VALUES (5,1,'Other, please supply details');
/*!40000 ALTER TABLE `oc_return_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_return_status`
--

DROP TABLE IF EXISTS `oc_return_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_return_status`
--

LOCK TABLES `oc_return_status` WRITE;
/*!40000 ALTER TABLE `oc_return_status` DISABLE KEYS */;
INSERT INTO `oc_return_status` VALUES (1,1,'Pending');
INSERT INTO `oc_return_status` VALUES (2,1,'Awaiting Products');
INSERT INTO `oc_return_status` VALUES (3,1,'Complete');
/*!40000 ALTER TABLE `oc_return_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_review`
--

DROP TABLE IF EXISTS `oc_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT 0,
  `customer_id` int(11) DEFAULT 0,
  `author` varchar(64) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `rating` int(1) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_review`
--

LOCK TABLES `oc_review` WRITE;
/*!40000 ALTER TABLE `oc_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_seo_url`
--

DROP TABLE IF EXISTS `oc_seo_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_seo_url` (
  `seo_url_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT 0,
  `language_id` int(11) DEFAULT NULL,
  `key` varchar(64) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `keyword` varchar(768) DEFAULT NULL,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`seo_url_id`),
  KEY `store` (`store_id`),
  KEY `language` (`language_id`),
  KEY `keyword` (`keyword`),
  KEY `query` (`key`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_seo_url`
--

LOCK TABLES `oc_seo_url` WRITE;
/*!40000 ALTER TABLE `oc_seo_url` DISABLE KEYS */;
INSERT INTO `oc_seo_url` VALUES (1,0,1,'product_id','47','hp-lp3065',1);
INSERT INTO `oc_seo_url` VALUES (2,0,1,'product_id','48','ipod-classic',1);
INSERT INTO `oc_seo_url` VALUES (3,0,1,'product_id','28','htc-touch-hd',1);
INSERT INTO `oc_seo_url` VALUES (4,0,1,'product_id','43','macbook',1);
INSERT INTO `oc_seo_url` VALUES (5,0,1,'product_id','44','macbook-air',1);
INSERT INTO `oc_seo_url` VALUES (6,0,1,'product_id','45','macbook-pro',1);
INSERT INTO `oc_seo_url` VALUES (7,0,1,'product_id','30','canon-eos-5d',1);
INSERT INTO `oc_seo_url` VALUES (8,0,1,'product_id','31','nikon-d300',1);
INSERT INTO `oc_seo_url` VALUES (9,0,1,'product_id','29','palm-treo-pro',1);
INSERT INTO `oc_seo_url` VALUES (10,0,1,'product_id','35','product-8',1);
INSERT INTO `oc_seo_url` VALUES (11,0,1,'product_id','49','samsung-galaxy-tab-10-1',1);
INSERT INTO `oc_seo_url` VALUES (12,0,1,'product_id','33','samsung-syncmaster-941bw',1);
INSERT INTO `oc_seo_url` VALUES (13,0,1,'product_id','46','sony-vaio',1);
INSERT INTO `oc_seo_url` VALUES (14,0,1,'product_id','41','imac',1);
INSERT INTO `oc_seo_url` VALUES (15,0,1,'product_id','40','iphone',1);
INSERT INTO `oc_seo_url` VALUES (16,0,1,'product_id','36','ipod-nano',1);
INSERT INTO `oc_seo_url` VALUES (17,0,1,'product_id','34','ipod-shuffle',1);
INSERT INTO `oc_seo_url` VALUES (18,0,1,'product_id','32','ipod-touch',1);
INSERT INTO `oc_seo_url` VALUES (19,0,1,'product_id','50','apple-4',1);
INSERT INTO `oc_seo_url` VALUES (20,0,1,'product_id','42','apple-cinema',1);
INSERT INTO `oc_seo_url` VALUES (21,0,1,'manufacturer_id','5','htc',0);
INSERT INTO `oc_seo_url` VALUES (22,0,1,'manufacturer_id','7','hewlett-packard',0);
INSERT INTO `oc_seo_url` VALUES (23,0,1,'manufacturer_id','6','palm',0);
INSERT INTO `oc_seo_url` VALUES (24,0,1,'manufacturer_id','10','sony',0);
INSERT INTO `oc_seo_url` VALUES (25,0,1,'manufacturer_id','9','canon',0);
INSERT INTO `oc_seo_url` VALUES (26,0,1,'manufacturer_id','8','apple',0);
INSERT INTO `oc_seo_url` VALUES (27,0,1,'path','30','printer',0);
INSERT INTO `oc_seo_url` VALUES (28,0,1,'path','20_27','desktops/mac',0);
INSERT INTO `oc_seo_url` VALUES (29,0,1,'path','20_26','desktops/pc',0);
INSERT INTO `oc_seo_url` VALUES (30,0,1,'path','25','component',0);
INSERT INTO `oc_seo_url` VALUES (31,0,1,'path','25_29','component/mouse',0);
INSERT INTO `oc_seo_url` VALUES (32,0,1,'path','33','cameras',0);
INSERT INTO `oc_seo_url` VALUES (33,0,1,'path','25_28','component/monitor',0);
INSERT INTO `oc_seo_url` VALUES (34,0,1,'path','25_28_35','component/monitor/test-1',0);
INSERT INTO `oc_seo_url` VALUES (35,0,1,'path','25_28_36','component/monitor/test-2',0);
INSERT INTO `oc_seo_url` VALUES (36,0,1,'path','25_30','component/printers',0);
INSERT INTO `oc_seo_url` VALUES (37,0,1,'path','25_31','component/scanner',0);
INSERT INTO `oc_seo_url` VALUES (38,0,1,'path','25_32','component/web-camera',0);
INSERT INTO `oc_seo_url` VALUES (39,0,1,'path','20','desktops',0);
INSERT INTO `oc_seo_url` VALUES (40,0,1,'path','18','laptop-notebook',0);
INSERT INTO `oc_seo_url` VALUES (41,0,1,'path','18_46','laptop-notebook/macs',0);
INSERT INTO `oc_seo_url` VALUES (42,0,1,'path','18_45','laptop-notebook/windows',0);
INSERT INTO `oc_seo_url` VALUES (43,0,1,'path','34','mp3-players',0);
INSERT INTO `oc_seo_url` VALUES (44,0,1,'path','34_43','mp3-players/test-11',0);
INSERT INTO `oc_seo_url` VALUES (45,0,1,'path','34_44','mp3-players/test-12',0);
INSERT INTO `oc_seo_url` VALUES (46,0,1,'path','34_47','mp3-players/test-15',0);
INSERT INTO `oc_seo_url` VALUES (47,0,1,'path','34_48','mp3-players/test-16',0);
INSERT INTO `oc_seo_url` VALUES (48,0,1,'path','34_49','mp3-players/test-17',0);
INSERT INTO `oc_seo_url` VALUES (49,0,1,'path','34_50','mp3-players/test-18',0);
INSERT INTO `oc_seo_url` VALUES (50,0,1,'path','34_51','mp3-players/test-19',0);
INSERT INTO `oc_seo_url` VALUES (51,0,1,'path','34_52','mp3-players/test-20',0);
INSERT INTO `oc_seo_url` VALUES (52,0,1,'path','34_52_58','mp3-players/test-20/test-25',0);
INSERT INTO `oc_seo_url` VALUES (53,0,1,'path','34_53','mp3-players/test-21',0);
INSERT INTO `oc_seo_url` VALUES (54,0,1,'path','34_54','mp3-players/test-22',0);
INSERT INTO `oc_seo_url` VALUES (55,0,1,'path','34_55','mp3-players/test-23',0);
INSERT INTO `oc_seo_url` VALUES (56,0,1,'path','34_56','mp3-players/test-24',0);
INSERT INTO `oc_seo_url` VALUES (57,0,1,'path','34_38','mp3-players/test-4',0);
INSERT INTO `oc_seo_url` VALUES (58,0,1,'path','34_37','mp3-players/test-5',0);
INSERT INTO `oc_seo_url` VALUES (59,0,1,'path','34_39','mp3-players/test-6',0);
INSERT INTO `oc_seo_url` VALUES (60,0,1,'path','34_40','mp3-players/test-7',0);
INSERT INTO `oc_seo_url` VALUES (61,0,1,'path','34_41','mp3-players/test-8',0);
INSERT INTO `oc_seo_url` VALUES (62,0,1,'path','34_42','mp3-players/test-9',0);
INSERT INTO `oc_seo_url` VALUES (63,0,1,'path','24','smartphone',0);
INSERT INTO `oc_seo_url` VALUES (64,0,1,'path','17','software',0);
INSERT INTO `oc_seo_url` VALUES (65,0,1,'path','57','tablet',0);
INSERT INTO `oc_seo_url` VALUES (66,0,1,'information_id','1','about-us',0);
INSERT INTO `oc_seo_url` VALUES (67,0,1,'information_id','2','terms',0);
INSERT INTO `oc_seo_url` VALUES (68,0,1,'information_id','4','delivery',0);
INSERT INTO `oc_seo_url` VALUES (69,0,1,'information_id','3','privacy',0);
INSERT INTO `oc_seo_url` VALUES (70,0,1,'language','en-gb','en-gb',-2);
INSERT INTO `oc_seo_url` VALUES (71,0,1,'route','information/information.info','info',0);
INSERT INTO `oc_seo_url` VALUES (72,0,1,'route','information/information','information',-1);
INSERT INTO `oc_seo_url` VALUES (73,0,1,'route','product/product','product',-1);
INSERT INTO `oc_seo_url` VALUES (74,0,1,'route','product/category','catalog',-1);
INSERT INTO `oc_seo_url` VALUES (75,0,1,'route','product/manufacturer','brands',-1);
/*!40000 ALTER TABLE `oc_seo_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_session`
--

DROP TABLE IF EXISTS `oc_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_session` (
  `session_id` varchar(32) NOT NULL,
  `data` text DEFAULT NULL,
  `expire` datetime DEFAULT NULL,
  PRIMARY KEY (`session_id`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_session`
--

LOCK TABLES `oc_session` WRITE;
/*!40000 ALTER TABLE `oc_session` DISABLE KEYS */;
INSERT INTO `oc_session` VALUES ('93e463d60ae09e93fc1169f575','{\"user_id\":\"1\",\"user_token\":\"24e8fbd55b9ad1f21edf0e5716c47a24\",\"extension_download\":{\"38127\":[{\"extension_download_id\":\"1286275\",\"name\":\"Year_Make_Model_Module_4.x.x\",\"filename\":\"tmdymm.ocmod.zip\",\"compatibility\":\"4.x.x.x, 4.0.0.0, 4.0.1.0, 4.0.1.1, 4.0.2.0, 4.0.2.1, 4.0.2.2, 4.0.2.3, 4.1.0.0, 4.1.0.1, 4.1.0.2, 4.1.0.3\",\"date_added\":\"2022-10-04 11:44:28\",\"status\":false}]},\"ka_top_messages\":null}','2025-04-23 08:02:31');
/*!40000 ALTER TABLE `oc_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_setting`
--

DROP TABLE IF EXISTS `oc_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT 0,
  `code` varchar(128) DEFAULT NULL,
  `key` varchar(128) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `serialized` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_setting`
--

LOCK TABLES `oc_setting` WRITE;
/*!40000 ALTER TABLE `oc_setting` DISABLE KEYS */;
INSERT INTO `oc_setting` VALUES (1,0,'config','config_shared','0',0);
INSERT INTO `oc_setting` VALUES (2,0,'config','config_fraud_detection','0',0);
INSERT INTO `oc_setting` VALUES (3,0,'config','config_description','{\"1\":{\"meta_title\":\"Your Store\",\"meta_description\":\"\",\"meta_keyword\":\"\"}}',1);
INSERT INTO `oc_setting` VALUES (4,0,'config','config_session_expire','86400',0);
INSERT INTO `oc_setting` VALUES (5,0,'config','config_session_samesite','Strict',0);
INSERT INTO `oc_setting` VALUES (6,0,'config','config_theme','basic',0);
INSERT INTO `oc_setting` VALUES (7,0,'config','config_layout_id','4',0);
INSERT INTO `oc_setting` VALUES (8,0,'config','config_country_id','222',0);
INSERT INTO `oc_setting` VALUES (9,0,'config','config_zone_id','3563',0);
INSERT INTO `oc_setting` VALUES (10,0,'config','config_timezone','UTC',0);
INSERT INTO `oc_setting` VALUES (11,0,'config','config_language_catalog','en-gb',0);
INSERT INTO `oc_setting` VALUES (12,0,'config','config_language_admin','en-gb',0);
INSERT INTO `oc_setting` VALUES (13,0,'config','config_currency','USD',0);
INSERT INTO `oc_setting` VALUES (14,0,'config','config_currency_auto','1',0);
INSERT INTO `oc_setting` VALUES (15,0,'config','config_currency_engine','ecb',0);
INSERT INTO `oc_setting` VALUES (16,0,'config','config_length_class_id','1',0);
INSERT INTO `oc_setting` VALUES (17,0,'config','config_weight_class_id','1',0);
INSERT INTO `oc_setting` VALUES (18,0,'config','config_product_description_length','100',0);
INSERT INTO `oc_setting` VALUES (19,0,'config','config_article_description_length','600',0);
INSERT INTO `oc_setting` VALUES (20,0,'config','config_pagination','10',0);
INSERT INTO `oc_setting` VALUES (21,0,'config','config_pagination_admin','10',0);
INSERT INTO `oc_setting` VALUES (22,0,'config','config_autocomplete_limit','5',0);
INSERT INTO `oc_setting` VALUES (23,0,'config','config_product_count','1',0);
INSERT INTO `oc_setting` VALUES (24,0,'config','config_review_status','1',0);
INSERT INTO `oc_setting` VALUES (25,0,'config','config_review_guest','1',0);
INSERT INTO `oc_setting` VALUES (26,0,'config','config_cookie_id','0',0);
INSERT INTO `oc_setting` VALUES (27,0,'config','config_gdpr_id','0',0);
INSERT INTO `oc_setting` VALUES (28,0,'config','config_gdpr_limit','180',0);
INSERT INTO `oc_setting` VALUES (29,0,'config','config_tax','1',0);
INSERT INTO `oc_setting` VALUES (30,0,'config','config_tax_default','shipping',0);
INSERT INTO `oc_setting` VALUES (31,0,'config','config_tax_customer','shipping',0);
INSERT INTO `oc_setting` VALUES (32,0,'config','config_customer_online','0',0);
INSERT INTO `oc_setting` VALUES (33,0,'config','config_customer_online_expire','1',0);
INSERT INTO `oc_setting` VALUES (34,0,'config','config_customer_activity','0',0);
INSERT INTO `oc_setting` VALUES (35,0,'config','config_customer_search','0',0);
INSERT INTO `oc_setting` VALUES (36,0,'config','config_customer_group_id','1',0);
INSERT INTO `oc_setting` VALUES (37,0,'config','config_customer_group_display','[\"1\"]',1);
INSERT INTO `oc_setting` VALUES (38,0,'config','config_customer_price','0',0);
INSERT INTO `oc_setting` VALUES (39,0,'config','config_address_format_id','1',0);
INSERT INTO `oc_setting` VALUES (40,0,'config','config_account_id','3',0);
INSERT INTO `oc_setting` VALUES (41,0,'config','config_invoice_prefix','INV-2025-00',0);
INSERT INTO `oc_setting` VALUES (43,0,'config','config_cart_weight','1',0);
INSERT INTO `oc_setting` VALUES (44,0,'config','config_checkout_guest','1',0);
INSERT INTO `oc_setting` VALUES (45,0,'config','config_checkout_id','0',0);
INSERT INTO `oc_setting` VALUES (46,0,'config','config_order_status_id','1',0);
INSERT INTO `oc_setting` VALUES (47,0,'config','config_processing_status','[\"5\",\"1\",\"2\",\"12\",\"3\"]',1);
INSERT INTO `oc_setting` VALUES (48,0,'config','config_complete_status','[\"5\",\"3\"]',1);
INSERT INTO `oc_setting` VALUES (49,0,'config','config_void_status_id','16',0);
INSERT INTO `oc_setting` VALUES (50,0,'config','config_fraud_status_id','8',0);
INSERT INTO `oc_setting` VALUES (51,0,'config','config_subscription_status_id','1',0);
INSERT INTO `oc_setting` VALUES (52,0,'config','config_subscription_active_status_id','2',0);
INSERT INTO `oc_setting` VALUES (53,0,'config','config_subscription_expired_status_id','3',0);
INSERT INTO `oc_setting` VALUES (54,0,'config','config_subscription_suspended_status_id','4',0);
INSERT INTO `oc_setting` VALUES (55,0,'config','config_subscription_canceled_status_id','5',0);
INSERT INTO `oc_setting` VALUES (56,0,'config','config_subscription_failed_status_id','6',0);
INSERT INTO `oc_setting` VALUES (57,0,'config','config_subscription_denied_status_id','7',0);
INSERT INTO `oc_setting` VALUES (58,0,'config','config_stock_display','0',0);
INSERT INTO `oc_setting` VALUES (59,0,'config','config_stock_warning','0',0);
INSERT INTO `oc_setting` VALUES (60,0,'config','config_stock_checkout','0',0);
INSERT INTO `oc_setting` VALUES (61,0,'config','config_stock_status_id','7',0);
INSERT INTO `oc_setting` VALUES (62,0,'config','config_affiliate_status','1',0);
INSERT INTO `oc_setting` VALUES (63,0,'config','config_affiliate_approval','0',0);
INSERT INTO `oc_setting` VALUES (64,0,'config','config_affiliate_auto','0',0);
INSERT INTO `oc_setting` VALUES (65,0,'config','config_affiliate_commission','5',0);
INSERT INTO `oc_setting` VALUES (66,0,'config','config_affiliate_id','4',0);
INSERT INTO `oc_setting` VALUES (67,0,'config','config_return_id','0',0);
INSERT INTO `oc_setting` VALUES (68,0,'config','config_return_status_id','2',0);
INSERT INTO `oc_setting` VALUES (69,0,'config','config_logo','catalog/opencart-logo.png',0);
INSERT INTO `oc_setting` VALUES (70,0,'config','config_icon','catalog/opencart.ico',0);
INSERT INTO `oc_setting` VALUES (71,0,'config','config_image_default_width','300',0);
INSERT INTO `oc_setting` VALUES (72,0,'config','config_image_default_height','300',0);
INSERT INTO `oc_setting` VALUES (73,0,'config','config_image_thumb_width','500',0);
INSERT INTO `oc_setting` VALUES (74,0,'config','config_image_thumb_height','500',0);
INSERT INTO `oc_setting` VALUES (75,0,'config','config_image_popup_width','800',0);
INSERT INTO `oc_setting` VALUES (76,0,'config','config_image_popup_height','800',0);
INSERT INTO `oc_setting` VALUES (77,0,'config','config_image_category_width','300',0);
INSERT INTO `oc_setting` VALUES (78,0,'config','config_image_category_height','300',0);
INSERT INTO `oc_setting` VALUES (79,0,'config','config_image_article_width','1140',0);
INSERT INTO `oc_setting` VALUES (80,0,'config','config_image_article_height','380',0);
INSERT INTO `oc_setting` VALUES (81,0,'config','config_image_topic_width','1140',0);
INSERT INTO `oc_setting` VALUES (82,0,'config','config_image_topic_height','380',0);
INSERT INTO `oc_setting` VALUES (83,0,'config','config_image_product_width','250',0);
INSERT INTO `oc_setting` VALUES (84,0,'config','config_image_product_height','250',0);
INSERT INTO `oc_setting` VALUES (85,0,'config','config_image_additional_width','74',0);
INSERT INTO `oc_setting` VALUES (86,0,'config','config_image_additional_height','74',0);
INSERT INTO `oc_setting` VALUES (87,0,'config','config_image_related_width','250',0);
INSERT INTO `oc_setting` VALUES (88,0,'config','config_image_related_height','250',0);
INSERT INTO `oc_setting` VALUES (89,0,'config','config_image_compare_width','90',0);
INSERT INTO `oc_setting` VALUES (90,0,'config','config_image_compare_height','90',0);
INSERT INTO `oc_setting` VALUES (91,0,'config','config_image_wishlist_width','47',0);
INSERT INTO `oc_setting` VALUES (92,0,'config','config_image_wishlist_height','47',0);
INSERT INTO `oc_setting` VALUES (93,0,'config','config_image_cart_height','47',0);
INSERT INTO `oc_setting` VALUES (94,0,'config','config_image_cart_width','47',0);
INSERT INTO `oc_setting` VALUES (95,0,'config','config_image_location_height','268',0);
INSERT INTO `oc_setting` VALUES (96,0,'config','config_image_location_width','268',0);
INSERT INTO `oc_setting` VALUES (97,0,'config','config_open','',0);
INSERT INTO `oc_setting` VALUES (98,0,'config','config_image','',0);
INSERT INTO `oc_setting` VALUES (99,0,'config','config_fax','',0);
INSERT INTO `oc_setting` VALUES (100,0,'config','config_telephone','123456789',0);
INSERT INTO `oc_setting` VALUES (101,0,'config','config_email','admin@test.com',0);
INSERT INTO `oc_setting` VALUES (102,0,'config','config_geocode','',0);
INSERT INTO `oc_setting` VALUES (103,0,'config','config_owner','Your Name',0);
INSERT INTO `oc_setting` VALUES (104,0,'config','config_address','Address 1',0);
INSERT INTO `oc_setting` VALUES (105,0,'config','config_name','Your Store',0);
INSERT INTO `oc_setting` VALUES (106,0,'config','config_seo_url','0',0);
INSERT INTO `oc_setting` VALUES (107,0,'config','config_file_max_size','20',0);
INSERT INTO `oc_setting` VALUES (108,0,'config','config_file_ext_allowed','zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\nwebp\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nmp4\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc',0);
INSERT INTO `oc_setting` VALUES (109,0,'config','config_file_mime_allowed','text/plain\r\nimage/png\r\nimage/webp\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-zip\r\napplication/x-zip-compressed\r\napplication/rar\r\napplication/x-rar\r\napplication/x-rar-compressed\r\napplication/octet-stream\r\naudio/mpeg\r\nvideo/mp4\r\nvideo/quicktime\r\napplication/pdf',0);
INSERT INTO `oc_setting` VALUES (110,0,'config','config_maintenance','0',0);
INSERT INTO `oc_setting` VALUES (111,0,'config','config_encryption','',0);
INSERT INTO `oc_setting` VALUES (112,0,'config','config_compression','0',0);
INSERT INTO `oc_setting` VALUES (113,0,'config','config_error_display','1',0);
INSERT INTO `oc_setting` VALUES (114,0,'config','config_error_log','1',0);
INSERT INTO `oc_setting` VALUES (115,0,'config','config_error_filename','error.log',0);
INSERT INTO `oc_setting` VALUES (116,0,'config','config_mail_engine','',0);
INSERT INTO `oc_setting` VALUES (117,0,'config','config_mail_parameter','',0);
INSERT INTO `oc_setting` VALUES (118,0,'config','config_mail_smtp_hostname','',0);
INSERT INTO `oc_setting` VALUES (119,0,'config','config_mail_smtp_username','',0);
INSERT INTO `oc_setting` VALUES (120,0,'config','config_mail_smtp_password','',0);
INSERT INTO `oc_setting` VALUES (121,0,'config','config_mail_smtp_port','25',0);
INSERT INTO `oc_setting` VALUES (122,0,'config','config_mail_smtp_timeout','5',0);
INSERT INTO `oc_setting` VALUES (123,0,'config','config_mail_alert_email','',0);
INSERT INTO `oc_setting` VALUES (124,0,'config','config_mail_alert','[\"order\"]',1);
INSERT INTO `oc_setting` VALUES (125,0,'config','config_captcha','basic',0);
INSERT INTO `oc_setting` VALUES (126,0,'config','config_captcha_page','[\"review\",\"return\",\"contact\"]',1);
INSERT INTO `oc_setting` VALUES (127,0,'config','config_2fa_expire','90',0);
INSERT INTO `oc_setting` VALUES (128,0,'config','config_login_attempts','5',0);
INSERT INTO `oc_setting` VALUES (129,0,'config','config_password_length','6',0);
INSERT INTO `oc_setting` VALUES (130,0,'currency_ecb','currency_ecb_status','1',0);
INSERT INTO `oc_setting` VALUES (131,0,'dashboard_activity','dashboard_activity_status','1',0);
INSERT INTO `oc_setting` VALUES (132,0,'dashboard_activity','dashboard_activity_sort_order','7',0);
INSERT INTO `oc_setting` VALUES (133,0,'dashboard_sale','dashboard_sale_status','1',0);
INSERT INTO `oc_setting` VALUES (134,0,'dashboard_sale','dashboard_sale_width','3',0);
INSERT INTO `oc_setting` VALUES (135,0,'dashboard_chart','dashboard_chart_status','1',0);
INSERT INTO `oc_setting` VALUES (136,0,'dashboard_chart','dashboard_chart_width','6',0);
INSERT INTO `oc_setting` VALUES (137,0,'dashboard_customer','dashboard_customer_status','1',0);
INSERT INTO `oc_setting` VALUES (138,0,'dashboard_customer','dashboard_customer_width','3',0);
INSERT INTO `oc_setting` VALUES (139,0,'dashboard_map','dashboard_map_status','1',0);
INSERT INTO `oc_setting` VALUES (140,0,'dashboard_map','dashboard_map_width','6',0);
INSERT INTO `oc_setting` VALUES (141,0,'dashboard_online','dashboard_online_status','1',0);
INSERT INTO `oc_setting` VALUES (142,0,'dashboard_online','dashboard_online_width','3',0);
INSERT INTO `oc_setting` VALUES (143,0,'dashboard_order','dashboard_order_sort_order','1',0);
INSERT INTO `oc_setting` VALUES (144,0,'dashboard_order','dashboard_order_status','1',0);
INSERT INTO `oc_setting` VALUES (145,0,'dashboard_order','dashboard_order_width','3',0);
INSERT INTO `oc_setting` VALUES (146,0,'dashboard_sale','dashboard_sale_sort_order','2',0);
INSERT INTO `oc_setting` VALUES (147,0,'dashboard_customer','dashboard_customer_sort_order','3',0);
INSERT INTO `oc_setting` VALUES (148,0,'dashboard_online','dashboard_online_sort_order','4',0);
INSERT INTO `oc_setting` VALUES (149,0,'dashboard_map','dashboard_map_sort_order','5',0);
INSERT INTO `oc_setting` VALUES (150,0,'dashboard_chart','dashboard_chart_sort_order','6',0);
INSERT INTO `oc_setting` VALUES (151,0,'dashboard_recent','dashboard_recent_status','1',0);
INSERT INTO `oc_setting` VALUES (152,0,'dashboard_recent','dashboard_recent_sort_order','8',0);
INSERT INTO `oc_setting` VALUES (153,0,'dashboard_activity','dashboard_activity_width','4',0);
INSERT INTO `oc_setting` VALUES (154,0,'dashboard_recent','dashboard_recent_width','8',0);
INSERT INTO `oc_setting` VALUES (155,0,'developer','developer_sass','1',0);
INSERT INTO `oc_setting` VALUES (156,0,'module_category','module_category_status','1',0);
INSERT INTO `oc_setting` VALUES (157,0,'module_account','module_account_status','1',0);
INSERT INTO `oc_setting` VALUES (158,0,'module_topic','module_topic_status','1',0);
INSERT INTO `oc_setting` VALUES (159,0,'payment_free_checkout','payment_free_checkout_status','1',0);
INSERT INTO `oc_setting` VALUES (160,0,'payment_free_checkout','payment_free_checkout_order_status_id','1',0);
INSERT INTO `oc_setting` VALUES (161,0,'payment_free_checkout','payment_free_checkout_sort_order','1',0);
INSERT INTO `oc_setting` VALUES (162,0,'payment_cod','payment_cod_sort_order','5',0);
INSERT INTO `oc_setting` VALUES (163,0,'payment_cod','payment_cod_total','0.01',0);
INSERT INTO `oc_setting` VALUES (164,0,'payment_cod','payment_cod_order_status_id','1',0);
INSERT INTO `oc_setting` VALUES (165,0,'payment_cod','payment_cod_geo_zone_id','0',0);
INSERT INTO `oc_setting` VALUES (166,0,'payment_cod','payment_cod_status','1',0);
INSERT INTO `oc_setting` VALUES (167,0,'report_customer_activity','report_customer_activity_status','1',0);
INSERT INTO `oc_setting` VALUES (168,0,'report_customer_activity','report_customer_activity_sort_order','1',0);
INSERT INTO `oc_setting` VALUES (169,0,'report_customer_order','report_customer_order_status','1',0);
INSERT INTO `oc_setting` VALUES (170,0,'report_customer_order','report_customer_order_sort_order','2',0);
INSERT INTO `oc_setting` VALUES (171,0,'report_customer_reward','report_customer_reward_status','1',0);
INSERT INTO `oc_setting` VALUES (172,0,'report_customer_reward','report_customer_reward_sort_order','3',0);
INSERT INTO `oc_setting` VALUES (173,0,'report_customer_search','report_customer_search_status','1',0);
INSERT INTO `oc_setting` VALUES (174,0,'report_customer_search','report_customer_search_sort_order','4',0);
INSERT INTO `oc_setting` VALUES (175,0,'report_customer_transaction','report_customer_transaction_status','1',0);
INSERT INTO `oc_setting` VALUES (176,0,'report_customer_transaction','report_customer_transaction_sort_order','5',0);
INSERT INTO `oc_setting` VALUES (177,0,'report_customer','report_customer_status','1',0);
INSERT INTO `oc_setting` VALUES (178,0,'report_customer','report_customer_sort_order','6',0);
INSERT INTO `oc_setting` VALUES (179,0,'report_sale_tax','report_sale_tax_status','1',0);
INSERT INTO `oc_setting` VALUES (180,0,'report_sale_tax','report_sale_tax_sort_order','8',0);
INSERT INTO `oc_setting` VALUES (181,0,'report_sale_shipping','report_sale_shipping_status','1',0);
INSERT INTO `oc_setting` VALUES (182,0,'report_sale_shipping','report_sale_shipping_sort_order','9',0);
INSERT INTO `oc_setting` VALUES (183,0,'report_sale_return','report_sale_return_status','1',0);
INSERT INTO `oc_setting` VALUES (184,0,'report_sale_return','report_sale_return_sort_order','10',0);
INSERT INTO `oc_setting` VALUES (185,0,'report_sale_order','report_sale_order_status','1',0);
INSERT INTO `oc_setting` VALUES (186,0,'report_sale_order','report_sale_order_sort_order','11',0);
INSERT INTO `oc_setting` VALUES (187,0,'report_sale_coupon','report_sale_coupon_status','1',0);
INSERT INTO `oc_setting` VALUES (188,0,'report_sale_coupon','report_sale_coupon_sort_order','12',0);
INSERT INTO `oc_setting` VALUES (189,0,'report_product_viewed','report_product_viewed_status','1',0);
INSERT INTO `oc_setting` VALUES (190,0,'report_product_viewed','report_product_viewed_sort_order','13',0);
INSERT INTO `oc_setting` VALUES (191,0,'report_product_purchased','report_product_purchased_status','1',0);
INSERT INTO `oc_setting` VALUES (192,0,'report_product_purchased','report_product_purchased_sort_order','14',0);
INSERT INTO `oc_setting` VALUES (193,0,'report_marketing','report_marketing_status','1',0);
INSERT INTO `oc_setting` VALUES (194,0,'report_marketing','report_marketing_sort_order','15',0);
INSERT INTO `oc_setting` VALUES (195,0,'report_subscription','report_subscription_status','1',0);
INSERT INTO `oc_setting` VALUES (196,0,'report_subscription','report_subscription_sort_order','16',0);
INSERT INTO `oc_setting` VALUES (197,0,'shipping_flat','shipping_flat_sort_order','1',0);
INSERT INTO `oc_setting` VALUES (198,0,'shipping_flat','shipping_flat_status','1',0);
INSERT INTO `oc_setting` VALUES (199,0,'shipping_flat','shipping_flat_geo_zone_id','0',0);
INSERT INTO `oc_setting` VALUES (200,0,'shipping_flat','shipping_flat_tax_class_id','9',0);
INSERT INTO `oc_setting` VALUES (201,0,'shipping_flat','shipping_flat_cost','5.00',0);
INSERT INTO `oc_setting` VALUES (202,0,'theme_basic','theme_basic_status','1',0);
INSERT INTO `oc_setting` VALUES (203,0,'total_shipping','total_shipping_sort_order','3',0);
INSERT INTO `oc_setting` VALUES (204,0,'total_sub_total','total_sub_total_sort_order','1',0);
INSERT INTO `oc_setting` VALUES (205,0,'total_sub_total','total_sub_total_status','1',0);
INSERT INTO `oc_setting` VALUES (206,0,'total_tax','total_tax_sort_order','5',0);
INSERT INTO `oc_setting` VALUES (207,0,'total_tax','total_tax_status','1',0);
INSERT INTO `oc_setting` VALUES (208,0,'total_total','total_total_sort_order','9',0);
INSERT INTO `oc_setting` VALUES (209,0,'total_total','total_total_status','1',0);
INSERT INTO `oc_setting` VALUES (210,0,'total_credit','total_credit_sort_order','7',0);
INSERT INTO `oc_setting` VALUES (211,0,'total_credit','total_credit_status','1',0);
INSERT INTO `oc_setting` VALUES (212,0,'total_reward','total_reward_sort_order','2',0);
INSERT INTO `oc_setting` VALUES (213,0,'total_reward','total_reward_status','1',0);
INSERT INTO `oc_setting` VALUES (214,0,'total_shipping','total_shipping_status','1',0);
INSERT INTO `oc_setting` VALUES (215,0,'total_shipping','total_shipping_estimator','1',0);
INSERT INTO `oc_setting` VALUES (216,0,'total_coupon','total_coupon_sort_order','4',0);
INSERT INTO `oc_setting` VALUES (217,0,'total_coupon','total_coupon_status','1',0);
INSERT INTO `oc_setting` VALUES (218,0,'config','config_api_id','1',0);
INSERT INTO `oc_setting` VALUES (408,0,'kareg','kareg','1',0);
INSERT INTO `oc_setting` VALUES (409,0,'kareg','karegka_uniexport','{\"license_key\":\"\",\"masked_key\":\"\",\"expiry_date\":\"\",\"is_free\":1,\"url\":\"http:\\/\\/localhost\\/ka_ext\\/oc4103\\/\",\"is_registered\":1}',1);
INSERT INTO `oc_setting` VALUES (410,0,'kareg','karegka_extensions','{\"license_key\":\"\",\"masked_key\":\"\",\"expiry_date\":\"\",\"is_free\":1,\"url\":\"http:\\/\\/localhost\\/ka_ext\\/oc4103\\/\",\"is_registered\":1}',1);
INSERT INTO `oc_setting` VALUES (411,0,'kareg','karegka_multivendor','{\"license_key\":\"\",\"masked_key\":\"\",\"expiry_date\":\"\",\"is_free\":1,\"url\":\"http:\\/\\/localhost\\/ka_ext\\/oc4103\\/\",\"is_registered\":1}',1);
INSERT INTO `oc_setting` VALUES (412,0,'kareg','karegka_seo','{\"license_key\":\"\",\"masked_key\":\"\",\"expiry_date\":\"\",\"is_free\":1,\"url\":\"http:\\/\\/localhost\\/ka_ext\\/oc4103\\/\",\"is_registered\":1}',1);
INSERT INTO `oc_setting` VALUES (413,0,'kareg','karegka_scheduler_lite','{\"license_key\":\"\",\"masked_key\":\"\",\"expiry_date\":\"\",\"is_free\":1,\"url\":\"http:\\/\\/localhost\\/ka_ext\\/oc4103\\/\",\"is_registered\":1}',1);
INSERT INTO `oc_setting` VALUES (414,0,'kareg','karegka_theme_milena','{\"license_key\":\"\",\"masked_key\":\"\",\"expiry_date\":\"\",\"is_free\":1,\"url\":\"http:\\/\\/localhost\\/ka_ext\\/oc4103\\/\",\"is_registered\":1}',1);
/*!40000 ALTER TABLE `oc_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_startup`
--

DROP TABLE IF EXISTS `oc_startup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_startup` (
  `startup_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `action` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`startup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_startup`
--

LOCK TABLES `oc_startup` WRITE;
/*!40000 ALTER TABLE `oc_startup` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_startup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_statistics`
--

DROP TABLE IF EXISTS `oc_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_statistics` (
  `statistics_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) DEFAULT NULL,
  `value` decimal(15,4) DEFAULT NULL,
  PRIMARY KEY (`statistics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_statistics`
--

LOCK TABLES `oc_statistics` WRITE;
/*!40000 ALTER TABLE `oc_statistics` DISABLE KEYS */;
INSERT INTO `oc_statistics` VALUES (1,'order_sale',0.0000);
INSERT INTO `oc_statistics` VALUES (2,'order_processing',0.0000);
INSERT INTO `oc_statistics` VALUES (3,'order_complete',0.0000);
INSERT INTO `oc_statistics` VALUES (4,'order_other',0.0000);
INSERT INTO `oc_statistics` VALUES (5,'returns',0.0000);
INSERT INTO `oc_statistics` VALUES (6,'product',0.0000);
INSERT INTO `oc_statistics` VALUES (7,'review',0.0000);
/*!40000 ALTER TABLE `oc_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_stock_status`
--

DROP TABLE IF EXISTS `oc_stock_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_stock_status`
--

LOCK TABLES `oc_stock_status` WRITE;
/*!40000 ALTER TABLE `oc_stock_status` DISABLE KEYS */;
INSERT INTO `oc_stock_status` VALUES (5,1,'Out Of Stock');
INSERT INTO `oc_stock_status` VALUES (6,1,'2-3 Days');
INSERT INTO `oc_stock_status` VALUES (7,1,'In Stock');
INSERT INTO `oc_stock_status` VALUES (8,1,'Pre-Order');
/*!40000 ALTER TABLE `oc_stock_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_store`
--

DROP TABLE IF EXISTS `oc_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_store`
--

LOCK TABLES `oc_store` WRITE;
/*!40000 ALTER TABLE `oc_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_subscription`
--

DROP TABLE IF EXISTS `oc_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_subscription` (
  `subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT 0,
  `store_id` int(11) DEFAULT 0,
  `customer_id` int(11) DEFAULT NULL,
  `payment_address_id` int(11) DEFAULT 0,
  `payment_method` text DEFAULT NULL,
  `shipping_address_id` int(11) DEFAULT 0,
  `shipping_method` text DEFAULT NULL,
  `subscription_plan_id` int(11) DEFAULT 0,
  `trial_price` decimal(10,4) DEFAULT NULL,
  `trial_tax` decimal(10,4) DEFAULT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') DEFAULT NULL,
  `trial_cycle` smallint(6) DEFAULT 0,
  `trial_duration` smallint(6) DEFAULT 0,
  `trial_remaining` smallint(6) DEFAULT 0,
  `trial_status` tinyint(1) DEFAULT 0,
  `price` decimal(10,4) DEFAULT NULL,
  `tax` decimal(10,4) DEFAULT NULL,
  `frequency` enum('day','week','semi_month','month','year') DEFAULT NULL,
  `cycle` smallint(6) DEFAULT 0,
  `duration` smallint(6) DEFAULT 0,
  `remaining` smallint(6) DEFAULT 0,
  `date_next` datetime DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `subscription_status_id` int(11) DEFAULT 0,
  `language` varchar(5) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription`
--

LOCK TABLES `oc_subscription` WRITE;
/*!40000 ALTER TABLE `oc_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_subscription_history`
--

DROP TABLE IF EXISTS `oc_subscription_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_subscription_history` (
  `subscription_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) DEFAULT NULL,
  `subscription_status_id` int(11) DEFAULT 0,
  `notify` tinyint(1) DEFAULT 0,
  `comment` text DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`subscription_history_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_history`
--

LOCK TABLES `oc_subscription_history` WRITE;
/*!40000 ALTER TABLE `oc_subscription_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_subscription_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_subscription_log`
--

DROP TABLE IF EXISTS `oc_subscription_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_subscription_log` (
  `subscription_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) DEFAULT NULL,
  `code` varchar(128) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`subscription_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_log`
--

LOCK TABLES `oc_subscription_log` WRITE;
/*!40000 ALTER TABLE `oc_subscription_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_subscription_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_subscription_option`
--

DROP TABLE IF EXISTS `oc_subscription_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_subscription_option` (
  `subscription_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) DEFAULT NULL,
  `subscription_product_id` int(11) DEFAULT NULL,
  `product_option_id` int(11) DEFAULT NULL,
  `product_option_value_id` int(11) DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`subscription_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_option`
--

LOCK TABLES `oc_subscription_option` WRITE;
/*!40000 ALTER TABLE `oc_subscription_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_subscription_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_subscription_plan`
--

DROP TABLE IF EXISTS `oc_subscription_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_subscription_plan` (
  `subscription_plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `trial_frequency` enum('day','week','semi_month','month','year') DEFAULT NULL,
  `trial_duration` int(10) DEFAULT 0,
  `trial_cycle` int(10) DEFAULT 0,
  `trial_status` tinyint(4) DEFAULT 0,
  `frequency` enum('day','week','semi_month','month','year') DEFAULT NULL,
  `duration` int(10) DEFAULT 0,
  `cycle` int(10) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  `sort_order` int(3) DEFAULT 0,
  PRIMARY KEY (`subscription_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_plan`
--

LOCK TABLES `oc_subscription_plan` WRITE;
/*!40000 ALTER TABLE `oc_subscription_plan` DISABLE KEYS */;
INSERT INTO `oc_subscription_plan` VALUES (1,NULL,0,0,0,'day',0,1,1,0);
INSERT INTO `oc_subscription_plan` VALUES (2,NULL,0,0,0,'month',10,1,1,0);
INSERT INTO `oc_subscription_plan` VALUES (3,NULL,0,0,0,'day',0,1,1,0);
/*!40000 ALTER TABLE `oc_subscription_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_subscription_plan_description`
--

DROP TABLE IF EXISTS `oc_subscription_plan_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_subscription_plan_description` (
  `subscription_plan_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`subscription_plan_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_plan_description`
--

LOCK TABLES `oc_subscription_plan_description` WRITE;
/*!40000 ALTER TABLE `oc_subscription_plan_description` DISABLE KEYS */;
INSERT INTO `oc_subscription_plan_description` VALUES (1,1,'Daily');
INSERT INTO `oc_subscription_plan_description` VALUES (2,1,'Weekly');
INSERT INTO `oc_subscription_plan_description` VALUES (3,1,'Monthly');
/*!40000 ALTER TABLE `oc_subscription_plan_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_subscription_product`
--

DROP TABLE IF EXISTS `oc_subscription_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_subscription_product` (
  `subscription_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT 0,
  `order_product_id` int(11) DEFAULT 0,
  `product_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `quantity` int(4) DEFAULT 0,
  `trial_price` decimal(10,4) DEFAULT NULL,
  `trial_tax` decimal(15,4) DEFAULT 0.0000,
  `price` decimal(10,4) DEFAULT NULL,
  `tax` decimal(15,4) DEFAULT 0.0000,
  PRIMARY KEY (`subscription_product_id`),
  KEY `subscription_id` (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_product`
--

LOCK TABLES `oc_subscription_product` WRITE;
/*!40000 ALTER TABLE `oc_subscription_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_subscription_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_subscription_status`
--

DROP TABLE IF EXISTS `oc_subscription_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_subscription_status` (
  `subscription_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`subscription_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_status`
--

LOCK TABLES `oc_subscription_status` WRITE;
/*!40000 ALTER TABLE `oc_subscription_status` DISABLE KEYS */;
INSERT INTO `oc_subscription_status` VALUES (1,1,'Pending');
INSERT INTO `oc_subscription_status` VALUES (2,1,'Active');
INSERT INTO `oc_subscription_status` VALUES (3,1,'Expired');
INSERT INTO `oc_subscription_status` VALUES (4,1,'Suspended');
INSERT INTO `oc_subscription_status` VALUES (5,1,'Cancelled');
INSERT INTO `oc_subscription_status` VALUES (6,1,'Failed');
INSERT INTO `oc_subscription_status` VALUES (7,1,'Denied');
/*!40000 ALTER TABLE `oc_subscription_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_tax_class`
--

DROP TABLE IF EXISTS `oc_tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_tax_class`
--

LOCK TABLES `oc_tax_class` WRITE;
/*!40000 ALTER TABLE `oc_tax_class` DISABLE KEYS */;
INSERT INTO `oc_tax_class` VALUES (9,'Taxable Goods','Taxed goods');
INSERT INTO `oc_tax_class` VALUES (10,'Downloadable Products','Downloadable');
/*!40000 ALTER TABLE `oc_tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_tax_rate`
--

DROP TABLE IF EXISTS `oc_tax_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) DEFAULT 0,
  `name` varchar(32) DEFAULT NULL,
  `rate` decimal(15,4) DEFAULT 0.0000,
  `type` char(1) DEFAULT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_tax_rate`
--

LOCK TABLES `oc_tax_rate` WRITE;
/*!40000 ALTER TABLE `oc_tax_rate` DISABLE KEYS */;
INSERT INTO `oc_tax_rate` VALUES (86,3,'VAT (20%)',20.0000,'P');
INSERT INTO `oc_tax_rate` VALUES (87,3,'Eco Tax (-2.00)',2.0000,'F');
/*!40000 ALTER TABLE `oc_tax_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

DROP TABLE IF EXISTS `oc_tax_rate_to_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_tax_rate_to_customer_group`
--

LOCK TABLES `oc_tax_rate_to_customer_group` WRITE;
/*!40000 ALTER TABLE `oc_tax_rate_to_customer_group` DISABLE KEYS */;
INSERT INTO `oc_tax_rate_to_customer_group` VALUES (86,1);
INSERT INTO `oc_tax_rate_to_customer_group` VALUES (87,1);
/*!40000 ALTER TABLE `oc_tax_rate_to_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_tax_rule`
--

DROP TABLE IF EXISTS `oc_tax_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `based` varchar(10) DEFAULT NULL,
  `priority` int(5) DEFAULT 1,
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_tax_rule`
--

LOCK TABLES `oc_tax_rule` WRITE;
/*!40000 ALTER TABLE `oc_tax_rule` DISABLE KEYS */;
INSERT INTO `oc_tax_rule` VALUES (120,10,87,'store',0);
INSERT INTO `oc_tax_rule` VALUES (121,10,86,'payment',1);
INSERT INTO `oc_tax_rule` VALUES (127,9,87,'shipping',2);
INSERT INTO `oc_tax_rule` VALUES (128,9,86,'shipping',1);
/*!40000 ALTER TABLE `oc_tax_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_theme`
--

DROP TABLE IF EXISTS `oc_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_theme` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT 0,
  `route` varchar(64) DEFAULT NULL,
  `code` mediumtext DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_theme`
--

LOCK TABLES `oc_theme` WRITE;
/*!40000 ALTER TABLE `oc_theme` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_topic`
--

DROP TABLE IF EXISTS `oc_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) DEFAULT 0,
  `status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_topic`
--

LOCK TABLES `oc_topic` WRITE;
/*!40000 ALTER TABLE `oc_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_topic_description`
--

DROP TABLE IF EXISTS `oc_topic_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_topic_description` (
  `topic_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`topic_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_topic_description`
--

LOCK TABLES `oc_topic_description` WRITE;
/*!40000 ALTER TABLE `oc_topic_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_topic_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_topic_to_layout`
--

DROP TABLE IF EXISTS `oc_topic_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_topic_to_layout` (
  `topic_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `layout_id` int(11) DEFAULT 0,
  PRIMARY KEY (`topic_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_topic_to_layout`
--

LOCK TABLES `oc_topic_to_layout` WRITE;
/*!40000 ALTER TABLE `oc_topic_to_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_topic_to_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_topic_to_store`
--

DROP TABLE IF EXISTS `oc_topic_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_topic_to_store` (
  `topic_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`topic_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_topic_to_store`
--

LOCK TABLES `oc_topic_to_store` WRITE;
/*!40000 ALTER TABLE `oc_topic_to_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_topic_to_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_translation`
--

DROP TABLE IF EXISTS `oc_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_translation` (
  `translation_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT 0,
  `language_id` int(11) DEFAULT NULL,
  `route` varchar(64) DEFAULT NULL,
  `key` varchar(64) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`translation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_translation`
--

LOCK TABLES `oc_translation` WRITE;
/*!40000 ALTER TABLE `oc_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_upload`
--

DROP TABLE IF EXISTS `oc_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_upload`
--

LOCK TABLES `oc_upload` WRITE;
/*!40000 ALTER TABLE `oc_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user`
--

DROP TABLE IF EXISTS `oc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) DEFAULT 0,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `email` varchar(96) DEFAULT NULL,
  `image` varchar(255) DEFAULT '',
  `ip` varchar(40) DEFAULT '',
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user`
--

LOCK TABLES `oc_user` WRITE;
/*!40000 ALTER TABLE `oc_user` DISABLE KEYS */;
INSERT INTO `oc_user` VALUES (1,1,'admin','$2y$10$wcdxS3E0xNlHiIeL6yL.zuPaHeK/jszV0fXvx6CDcYnklbXv.FueW','John','Doe','admin@test.com','','::1',1,'2025-04-21 00:29:02');
/*!40000 ALTER TABLE `oc_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_authorize`
--

DROP TABLE IF EXISTS `oc_user_authorize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_authorize` (
  `user_authorize_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(96) DEFAULT NULL,
  `total` int(1) DEFAULT 0,
  `ip` varchar(40) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `date_added` datetime DEFAULT NULL,
  `date_expire` datetime DEFAULT NULL,
  PRIMARY KEY (`user_authorize_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_authorize`
--

LOCK TABLES `oc_user_authorize` WRITE;
/*!40000 ALTER TABLE `oc_user_authorize` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_user_authorize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_group`
--

DROP TABLE IF EXISTS `oc_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `permission` text DEFAULT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_group`
--

LOCK TABLES `oc_user_group` WRITE;
/*!40000 ALTER TABLE `oc_user_group` DISABLE KEYS */;
INSERT INTO `oc_user_group` VALUES (1,'Administrator','{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/filter_group\",\"catalog\\/identifier\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/review\",\"catalog\\/subscription_plan\",\"cms\\/antispam\",\"cms\\/article\",\"cms\\/comment\",\"cms\\/topic\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/security\",\"customer\\/address\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"customer\\/gdpr\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"error\\/exception\",\"event\\/modification\",\"extension\\/analytics\",\"extension\\/captcha\",\"extension\\/currency\",\"extension\\/dashboard\",\"extension\\/feed\",\"extension\\/fraud\",\"extension\\/language\",\"extension\\/marketplace\",\"extension\\/module\",\"extension\\/other\",\"extension\\/payment\",\"extension\\/report\",\"extension\\/shipping\",\"extension\\/theme\",\"extension\\/total\",\"localisation\\/address_format\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/subscription_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/authorize\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/gdpr\",\"mail\\/returns\",\"mail\\/reward\",\"mail\\/subscription\",\"mail\\/transaction\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/cron\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/promotion\",\"marketplace\\/startup\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/returns\",\"sale\\/subscription\",\"setting\\/setting\",\"setting\\/store\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/notification\",\"tool\\/upgrade\",\"tool\\/upload\",\"user\\/api\",\"user\\/profile\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/ka_extensions\\/extension\\/extensions\",\"extension\\/opencart\\/api\\/coupon\",\"extension\\/opencart\\/api\\/reward\",\"extension\\/opencart\\/captcha\\/basic\",\"extension\\/opencart\\/currency\\/ecb\",\"extension\\/opencart\\/currency\\/fixer\",\"extension\\/opencart\\/dashboard\\/activity\",\"extension\\/opencart\\/dashboard\\/chart\",\"extension\\/opencart\\/dashboard\\/customer\",\"extension\\/opencart\\/dashboard\\/map\",\"extension\\/opencart\\/dashboard\\/online\",\"extension\\/opencart\\/dashboard\\/order\",\"extension\\/opencart\\/dashboard\\/recent\",\"extension\\/opencart\\/dashboard\\/sale\",\"extension\\/opencart\\/fraud\\/ddos\",\"extension\\/opencart\\/fraud\\/ip\",\"extension\\/opencart\\/module\\/account\",\"extension\\/opencart\\/module\\/banner\",\"extension\\/opencart\\/module\\/bestseller\",\"extension\\/opencart\\/module\\/blog\",\"extension\\/opencart\\/module\\/category\",\"extension\\/opencart\\/module\\/featured\",\"extension\\/opencart\\/module\\/filter\",\"extension\\/opencart\\/module\\/html\",\"extension\\/opencart\\/module\\/information\",\"extension\\/opencart\\/module\\/latest\",\"extension\\/opencart\\/module\\/special\",\"extension\\/opencart\\/module\\/store\",\"extension\\/opencart\\/module\\/topic\",\"extension\\/opencart\\/payment\\/bank_transfer\",\"extension\\/opencart\\/payment\\/cheque\",\"extension\\/opencart\\/payment\\/cod\",\"extension\\/opencart\\/payment\\/free_checkout\",\"extension\\/opencart\\/report\\/customer\",\"extension\\/opencart\\/report\\/customer_activity\",\"extension\\/opencart\\/report\\/customer_order\",\"extension\\/opencart\\/report\\/customer_reward\",\"extension\\/opencart\\/report\\/customer_search\",\"extension\\/opencart\\/report\\/customer_transaction\",\"extension\\/opencart\\/report\\/marketing\",\"extension\\/opencart\\/report\\/product_purchased\",\"extension\\/opencart\\/report\\/product_viewed\",\"extension\\/opencart\\/report\\/sale_coupon\",\"extension\\/opencart\\/report\\/sale_order\",\"extension\\/opencart\\/report\\/sale_return\",\"extension\\/opencart\\/report\\/sale_shipping\",\"extension\\/opencart\\/report\\/sale_tax\",\"extension\\/opencart\\/report\\/subscription\",\"extension\\/opencart\\/shipping\\/flat\",\"extension\\/opencart\\/shipping\\/free\",\"extension\\/opencart\\/shipping\\/item\",\"extension\\/opencart\\/shipping\\/pickup\",\"extension\\/opencart\\/shipping\\/weight\",\"extension\\/opencart\\/theme\\/basic\",\"extension\\/opencart\\/total\\/coupon\",\"extension\\/opencart\\/total\\/credit\",\"extension\\/opencart\\/total\\/handling\",\"extension\\/opencart\\/total\\/low_order_fee\",\"extension\\/opencart\\/total\\/reward\",\"extension\\/opencart\\/total\\/shipping\",\"extension\\/opencart\\/total\\/sub_total\",\"extension\\/opencart\\/total\\/tax\",\"extension\\/opencart\\/total\\/total\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/filter_group\",\"catalog\\/identifier\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/review\",\"catalog\\/subscription_plan\",\"cms\\/antispam\",\"cms\\/article\",\"cms\\/comment\",\"cms\\/topic\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/security\",\"customer\\/address\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"customer\\/gdpr\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"error\\/exception\",\"event\\/modification\",\"extension\\/analytics\",\"extension\\/captcha\",\"extension\\/currency\",\"extension\\/dashboard\",\"extension\\/feed\",\"extension\\/fraud\",\"extension\\/language\",\"extension\\/marketplace\",\"extension\\/module\",\"extension\\/other\",\"extension\\/payment\",\"extension\\/report\",\"extension\\/shipping\",\"extension\\/theme\",\"extension\\/total\",\"localisation\\/address_format\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/subscription_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/authorize\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/gdpr\",\"mail\\/returns\",\"mail\\/reward\",\"mail\\/subscription\",\"mail\\/transaction\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/cron\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/modification\",\"marketplace\\/promotion\",\"marketplace\\/startup\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/returns\",\"sale\\/subscription\",\"setting\\/setting\",\"setting\\/store\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/notification\",\"tool\\/upgrade\",\"tool\\/upload\",\"user\\/api\",\"user\\/profile\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/ka_extensions\\/extension\\/extensions\",\"extension\\/opencart\\/api\\/coupon\",\"extension\\/opencart\\/api\\/reward\",\"extension\\/opencart\\/captcha\\/basic\",\"extension\\/opencart\\/currency\\/ecb\",\"extension\\/opencart\\/currency\\/fixer\",\"extension\\/opencart\\/dashboard\\/activity\",\"extension\\/opencart\\/dashboard\\/chart\",\"extension\\/opencart\\/dashboard\\/customer\",\"extension\\/opencart\\/dashboard\\/map\",\"extension\\/opencart\\/dashboard\\/online\",\"extension\\/opencart\\/dashboard\\/order\",\"extension\\/opencart\\/dashboard\\/recent\",\"extension\\/opencart\\/dashboard\\/sale\",\"extension\\/opencart\\/fraud\\/ddos\",\"extension\\/opencart\\/fraud\\/ip\",\"extension\\/opencart\\/module\\/account\",\"extension\\/opencart\\/module\\/banner\",\"extension\\/opencart\\/module\\/bestseller\",\"extension\\/opencart\\/module\\/blog\",\"extension\\/opencart\\/module\\/category\",\"extension\\/opencart\\/module\\/featured\",\"extension\\/opencart\\/module\\/filter\",\"extension\\/opencart\\/module\\/html\",\"extension\\/opencart\\/module\\/information\",\"extension\\/opencart\\/module\\/latest\",\"extension\\/opencart\\/module\\/special\",\"extension\\/opencart\\/module\\/store\",\"extension\\/opencart\\/module\\/topic\",\"extension\\/opencart\\/payment\\/bank_transfer\",\"extension\\/opencart\\/payment\\/cheque\",\"extension\\/opencart\\/payment\\/cod\",\"extension\\/opencart\\/payment\\/free_checkout\",\"extension\\/opencart\\/report\\/customer\",\"extension\\/opencart\\/report\\/customer_activity\",\"extension\\/opencart\\/report\\/customer_order\",\"extension\\/opencart\\/report\\/customer_reward\",\"extension\\/opencart\\/report\\/customer_search\",\"extension\\/opencart\\/report\\/customer_transaction\",\"extension\\/opencart\\/report\\/marketing\",\"extension\\/opencart\\/report\\/product_purchased\",\"extension\\/opencart\\/report\\/product_viewed\",\"extension\\/opencart\\/report\\/sale_coupon\",\"extension\\/opencart\\/report\\/sale_order\",\"extension\\/opencart\\/report\\/sale_return\",\"extension\\/opencart\\/report\\/sale_shipping\",\"extension\\/opencart\\/report\\/sale_tax\",\"extension\\/opencart\\/report\\/subscription\",\"extension\\/opencart\\/shipping\\/flat\",\"extension\\/opencart\\/shipping\\/free\",\"extension\\/opencart\\/shipping\\/item\",\"extension\\/opencart\\/shipping\\/pickup\",\"extension\\/opencart\\/shipping\\/weight\",\"extension\\/opencart\\/theme\\/basic\",\"extension\\/opencart\\/total\\/coupon\",\"extension\\/opencart\\/total\\/credit\",\"extension\\/opencart\\/total\\/handling\",\"extension\\/opencart\\/total\\/low_order_fee\",\"extension\\/opencart\\/total\\/reward\",\"extension\\/opencart\\/total\\/shipping\",\"extension\\/opencart\\/total\\/sub_total\",\"extension\\/opencart\\/total\\/tax\",\"extension\\/opencart\\/total\\/total\"]}');
INSERT INTO `oc_user_group` VALUES (2,'Demonstration','');
INSERT INTO `oc_user_group` VALUES (3,'Marketing','');
INSERT INTO `oc_user_group` VALUES (4,'Product Data Entry','');
INSERT INTO `oc_user_group` VALUES (5,'Order Processing','');
INSERT INTO `oc_user_group` VALUES (6,'Accounting','');
INSERT INTO `oc_user_group` VALUES (7,'Customer Service','');
INSERT INTO `oc_user_group` VALUES (8,'Analysis','');
INSERT INTO `oc_user_group` VALUES (9,'Content WritIng','');
/*!40000 ALTER TABLE `oc_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_login`
--

DROP TABLE IF EXISTS `oc_user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_login` (
  `user_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`user_login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_login`
--

LOCK TABLES `oc_user_login` WRITE;
/*!40000 ALTER TABLE `oc_user_login` DISABLE KEYS */;
INSERT INTO `oc_user_login` VALUES (1,1,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36','2025-04-21 00:31:37');
INSERT INTO `oc_user_login` VALUES (2,1,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36','2025-04-21 00:33:30');
INSERT INTO `oc_user_login` VALUES (3,1,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36','2025-04-22 05:53:20');
/*!40000 ALTER TABLE `oc_user_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_token`
--

DROP TABLE IF EXISTS `oc_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_token` (
  `user_token_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `code` text DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`user_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_token`
--

LOCK TABLES `oc_user_token` WRITE;
/*!40000 ALTER TABLE `oc_user_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_weight_class`
--

DROP TABLE IF EXISTS `oc_weight_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) DEFAULT 0.00000000,
  PRIMARY KEY (`weight_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_weight_class`
--

LOCK TABLES `oc_weight_class` WRITE;
/*!40000 ALTER TABLE `oc_weight_class` DISABLE KEYS */;
INSERT INTO `oc_weight_class` VALUES (1,1.00000000);
INSERT INTO `oc_weight_class` VALUES (2,1000.00000000);
INSERT INTO `oc_weight_class` VALUES (3,2.20460000);
INSERT INTO `oc_weight_class` VALUES (4,35.27400000);
/*!40000 ALTER TABLE `oc_weight_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_weight_class_description`
--

DROP TABLE IF EXISTS `oc_weight_class_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) DEFAULT NULL,
  `unit` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_weight_class_description`
--

LOCK TABLES `oc_weight_class_description` WRITE;
/*!40000 ALTER TABLE `oc_weight_class_description` DISABLE KEYS */;
INSERT INTO `oc_weight_class_description` VALUES (1,1,'Kilogram','kg');
INSERT INTO `oc_weight_class_description` VALUES (2,1,'Gram','g');
INSERT INTO `oc_weight_class_description` VALUES (3,1,'Pound ','lb');
INSERT INTO `oc_weight_class_description` VALUES (4,1,'Ounce','oz');
/*!40000 ALTER TABLE `oc_weight_class_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_zone`
--

DROP TABLE IF EXISTS `oc_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4474 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_zone`
--

LOCK TABLES `oc_zone` WRITE;
/*!40000 ALTER TABLE `oc_zone` DISABLE KEYS */;
INSERT INTO `oc_zone` VALUES (1,1,'BDS',1);
INSERT INTO `oc_zone` VALUES (2,1,'BDG',1);
INSERT INTO `oc_zone` VALUES (3,1,'BGL',1);
INSERT INTO `oc_zone` VALUES (4,1,'BAL',1);
INSERT INTO `oc_zone` VALUES (5,1,'BAM',1);
INSERT INTO `oc_zone` VALUES (6,1,'FRA',1);
INSERT INTO `oc_zone` VALUES (7,1,'FYB',1);
INSERT INTO `oc_zone` VALUES (8,1,'GHA',1);
INSERT INTO `oc_zone` VALUES (9,1,'GHO',1);
INSERT INTO `oc_zone` VALUES (10,1,'HEL',1);
INSERT INTO `oc_zone` VALUES (11,1,'HER',1);
INSERT INTO `oc_zone` VALUES (12,1,'JOW',1);
INSERT INTO `oc_zone` VALUES (13,1,'KAB',1);
INSERT INTO `oc_zone` VALUES (14,1,'KAN',1);
INSERT INTO `oc_zone` VALUES (15,1,'KAP',1);
INSERT INTO `oc_zone` VALUES (16,1,'KHO',1);
INSERT INTO `oc_zone` VALUES (17,1,'KNR',1);
INSERT INTO `oc_zone` VALUES (18,1,'KDZ',1);
INSERT INTO `oc_zone` VALUES (19,1,'LAG',1);
INSERT INTO `oc_zone` VALUES (20,1,'LOW',1);
INSERT INTO `oc_zone` VALUES (21,1,'NAN',1);
INSERT INTO `oc_zone` VALUES (22,1,'NIM',1);
INSERT INTO `oc_zone` VALUES (23,1,'NUR',1);
INSERT INTO `oc_zone` VALUES (24,1,'ORU',1);
INSERT INTO `oc_zone` VALUES (25,1,'PIA',1);
INSERT INTO `oc_zone` VALUES (26,1,'PKA',1);
INSERT INTO `oc_zone` VALUES (27,1,'PAR',1);
INSERT INTO `oc_zone` VALUES (28,1,'SAM',1);
INSERT INTO `oc_zone` VALUES (29,1,'SAR',1);
INSERT INTO `oc_zone` VALUES (30,1,'TAK',1);
INSERT INTO `oc_zone` VALUES (31,1,'WAR',1);
INSERT INTO `oc_zone` VALUES (32,1,'ZAB',1);
INSERT INTO `oc_zone` VALUES (33,2,'BR',1);
INSERT INTO `oc_zone` VALUES (34,2,'BU',1);
INSERT INTO `oc_zone` VALUES (35,2,'DL',1);
INSERT INTO `oc_zone` VALUES (36,2,'DV',1);
INSERT INTO `oc_zone` VALUES (37,2,'DI',1);
INSERT INTO `oc_zone` VALUES (38,2,'DR',1);
INSERT INTO `oc_zone` VALUES (39,2,'EL',1);
INSERT INTO `oc_zone` VALUES (40,2,'ER',1);
INSERT INTO `oc_zone` VALUES (41,2,'FR',1);
INSERT INTO `oc_zone` VALUES (42,2,'GJ',1);
INSERT INTO `oc_zone` VALUES (43,2,'GR',1);
INSERT INTO `oc_zone` VALUES (44,2,'HA',1);
INSERT INTO `oc_zone` VALUES (45,2,'KA',1);
INSERT INTO `oc_zone` VALUES (46,2,'KB',1);
INSERT INTO `oc_zone` VALUES (47,2,'KC',1);
INSERT INTO `oc_zone` VALUES (48,2,'KO',1);
INSERT INTO `oc_zone` VALUES (49,2,'KR',1);
INSERT INTO `oc_zone` VALUES (50,2,'KU',1);
INSERT INTO `oc_zone` VALUES (51,2,'LB',1);
INSERT INTO `oc_zone` VALUES (52,2,'LE',1);
INSERT INTO `oc_zone` VALUES (53,2,'LU',1);
INSERT INTO `oc_zone` VALUES (54,2,'MM',1);
INSERT INTO `oc_zone` VALUES (55,2,'MK',1);
INSERT INTO `oc_zone` VALUES (56,2,'MT',1);
INSERT INTO `oc_zone` VALUES (57,2,'MR',1);
INSERT INTO `oc_zone` VALUES (58,2,'PQ',1);
INSERT INTO `oc_zone` VALUES (59,2,'PR',1);
INSERT INTO `oc_zone` VALUES (60,2,'PG',1);
INSERT INTO `oc_zone` VALUES (61,2,'PU',1);
INSERT INTO `oc_zone` VALUES (62,2,'SH',1);
INSERT INTO `oc_zone` VALUES (63,2,'SK',1);
INSERT INTO `oc_zone` VALUES (64,2,'SR',1);
INSERT INTO `oc_zone` VALUES (65,2,'TE',1);
INSERT INTO `oc_zone` VALUES (66,2,'TP',1);
INSERT INTO `oc_zone` VALUES (67,2,'TR',1);
INSERT INTO `oc_zone` VALUES (68,2,'VL',1);
INSERT INTO `oc_zone` VALUES (69,3,'01',1);
INSERT INTO `oc_zone` VALUES (70,3,'44',1);
INSERT INTO `oc_zone` VALUES (71,3,'46',1);
INSERT INTO `oc_zone` VALUES (72,3,'16',1);
INSERT INTO `oc_zone` VALUES (73,3,'23',1);
INSERT INTO `oc_zone` VALUES (74,3,'05',1);
INSERT INTO `oc_zone` VALUES (75,3,'08',1);
INSERT INTO `oc_zone` VALUES (76,3,'06',1);
INSERT INTO `oc_zone` VALUES (77,3,'07',1);
INSERT INTO `oc_zone` VALUES (78,3,'09',1);
INSERT INTO `oc_zone` VALUES (79,3,'34',1);
INSERT INTO `oc_zone` VALUES (80,3,'10',1);
INSERT INTO `oc_zone` VALUES (81,3,'35',1);
INSERT INTO `oc_zone` VALUES (82,3,'02',1);
INSERT INTO `oc_zone` VALUES (83,3,'26',1);
INSERT INTO `oc_zone` VALUES (84,3,'17',1);
INSERT INTO `oc_zone` VALUES (85,3,'32',1);
INSERT INTO `oc_zone` VALUES (86,3,'39',1);
INSERT INTO `oc_zone` VALUES (87,3,'36',1);
INSERT INTO `oc_zone` VALUES (88,3,'47',1);
INSERT INTO `oc_zone` VALUES (89,3,'24',1);
INSERT INTO `oc_zone` VALUES (90,3,'33',1);
INSERT INTO `oc_zone` VALUES (91,3,'18',1);
INSERT INTO `oc_zone` VALUES (92,3,'40',1);
INSERT INTO `oc_zone` VALUES (93,3,'03',1);
INSERT INTO `oc_zone` VALUES (94,3,'29',1);
INSERT INTO `oc_zone` VALUES (95,3,'26',1);
INSERT INTO `oc_zone` VALUES (96,3,'43',1);
INSERT INTO `oc_zone` VALUES (97,3,'27',1);
INSERT INTO `oc_zone` VALUES (98,3,'28',1);
INSERT INTO `oc_zone` VALUES (99,3,'45',1);
INSERT INTO `oc_zone` VALUES (100,3,'31',1);
INSERT INTO `oc_zone` VALUES (101,3,'30',1);
INSERT INTO `oc_zone` VALUES (102,3,'04',1);
INSERT INTO `oc_zone` VALUES (103,3,'48',1);
INSERT INTO `oc_zone` VALUES (104,3,'20',1);
INSERT INTO `oc_zone` VALUES (105,3,'19',1);
INSERT INTO `oc_zone` VALUES (106,3,'22',1);
INSERT INTO `oc_zone` VALUES (107,3,'21',1);
INSERT INTO `oc_zone` VALUES (108,3,'41',1);
INSERT INTO `oc_zone` VALUES (109,3,'11',1);
INSERT INTO `oc_zone` VALUES (110,3,'12',1);
INSERT INTO `oc_zone` VALUES (111,3,'14',1);
INSERT INTO `oc_zone` VALUES (112,3,'37',1);
INSERT INTO `oc_zone` VALUES (113,3,'42',1);
INSERT INTO `oc_zone` VALUES (114,3,'38',1);
INSERT INTO `oc_zone` VALUES (115,3,'15',1);
INSERT INTO `oc_zone` VALUES (116,3,'13',1);
INSERT INTO `oc_zone` VALUES (117,4,'E',1);
INSERT INTO `oc_zone` VALUES (118,4,'M',1);
INSERT INTO `oc_zone` VALUES (119,4,'R',1);
INSERT INTO `oc_zone` VALUES (120,4,'S',1);
INSERT INTO `oc_zone` VALUES (121,4,'W',1);
INSERT INTO `oc_zone` VALUES (122,5,'ALV',1);
INSERT INTO `oc_zone` VALUES (123,5,'CAN',1);
INSERT INTO `oc_zone` VALUES (124,5,'ENC',1);
INSERT INTO `oc_zone` VALUES (125,5,'ESE',1);
INSERT INTO `oc_zone` VALUES (126,5,'LMA',1);
INSERT INTO `oc_zone` VALUES (127,5,'ORD',1);
INSERT INTO `oc_zone` VALUES (128,5,'SJL',1);
INSERT INTO `oc_zone` VALUES (129,6,'BGO',1);
INSERT INTO `oc_zone` VALUES (130,6,'BGU',1);
INSERT INTO `oc_zone` VALUES (131,6,'BIE',1);
INSERT INTO `oc_zone` VALUES (132,6,'CAB',1);
INSERT INTO `oc_zone` VALUES (133,6,'CCU',1);
INSERT INTO `oc_zone` VALUES (134,6,'CNO',1);
INSERT INTO `oc_zone` VALUES (135,6,'CUS',1);
INSERT INTO `oc_zone` VALUES (136,6,'CNN',1);
INSERT INTO `oc_zone` VALUES (137,6,'HUA',1);
INSERT INTO `oc_zone` VALUES (138,6,'HUI',1);
INSERT INTO `oc_zone` VALUES (139,6,'LUA',1);
INSERT INTO `oc_zone` VALUES (140,6,'LNO',1);
INSERT INTO `oc_zone` VALUES (141,6,'LSU',1);
INSERT INTO `oc_zone` VALUES (142,6,'MAL',1);
INSERT INTO `oc_zone` VALUES (143,6,'MOX',1);
INSERT INTO `oc_zone` VALUES (144,6,'NAM',1);
INSERT INTO `oc_zone` VALUES (145,6,'UIG',1);
INSERT INTO `oc_zone` VALUES (146,6,'ZAI',1);
INSERT INTO `oc_zone` VALUES (147,9,'ASG',1);
INSERT INTO `oc_zone` VALUES (148,9,'ASJ',1);
INSERT INTO `oc_zone` VALUES (149,9,'ASM',1);
INSERT INTO `oc_zone` VALUES (150,9,'ASL',1);
INSERT INTO `oc_zone` VALUES (151,9,'ASR',1);
INSERT INTO `oc_zone` VALUES (152,9,'ASH',1);
INSERT INTO `oc_zone` VALUES (153,9,'BAR',1);
INSERT INTO `oc_zone` VALUES (154,9,'RED',1);
INSERT INTO `oc_zone` VALUES (155,10,'AN',1);
INSERT INTO `oc_zone` VALUES (156,10,'B',1);
INSERT INTO `oc_zone` VALUES (157,10,'K',1);
INSERT INTO `oc_zone` VALUES (158,10,'H',1);
INSERT INTO `oc_zone` VALUES (159,10,'U',1);
INSERT INTO `oc_zone` VALUES (160,10,'X',1);
INSERT INTO `oc_zone` VALUES (161,10,'W',1);
INSERT INTO `oc_zone` VALUES (162,10,'C',1);
INSERT INTO `oc_zone` VALUES (163,10,'E',1);
INSERT INTO `oc_zone` VALUES (164,10,'P',1);
INSERT INTO `oc_zone` VALUES (165,10,'Y',1);
INSERT INTO `oc_zone` VALUES (166,10,'L',1);
INSERT INTO `oc_zone` VALUES (167,10,'F',1);
INSERT INTO `oc_zone` VALUES (168,10,'M',1);
INSERT INTO `oc_zone` VALUES (169,10,'N',1);
INSERT INTO `oc_zone` VALUES (170,10,'Q',1);
INSERT INTO `oc_zone` VALUES (171,10,'R',1);
INSERT INTO `oc_zone` VALUES (172,10,'A',1);
INSERT INTO `oc_zone` VALUES (173,10,'J',1);
INSERT INTO `oc_zone` VALUES (174,10,'D',1);
INSERT INTO `oc_zone` VALUES (175,10,'Z',1);
INSERT INTO `oc_zone` VALUES (176,10,'S',1);
INSERT INTO `oc_zone` VALUES (177,10,'G',1);
INSERT INTO `oc_zone` VALUES (178,10,'V',1);
INSERT INTO `oc_zone` VALUES (179,10,'T',1);
INSERT INTO `oc_zone` VALUES (180,11,'AGT',1);
INSERT INTO `oc_zone` VALUES (181,11,'ARR',1);
INSERT INTO `oc_zone` VALUES (182,11,'ARM',1);
INSERT INTO `oc_zone` VALUES (183,11,'GEG',1);
INSERT INTO `oc_zone` VALUES (184,11,'KOT',1);
INSERT INTO `oc_zone` VALUES (185,11,'LOR',1);
INSERT INTO `oc_zone` VALUES (186,11,'SHI',1);
INSERT INTO `oc_zone` VALUES (187,11,'SYU',1);
INSERT INTO `oc_zone` VALUES (188,11,'TAV',1);
INSERT INTO `oc_zone` VALUES (189,11,'VAY',1);
INSERT INTO `oc_zone` VALUES (190,11,'YER',1);
INSERT INTO `oc_zone` VALUES (191,13,'ACT',1);
INSERT INTO `oc_zone` VALUES (192,13,'NSW',1);
INSERT INTO `oc_zone` VALUES (193,13,'NT',1);
INSERT INTO `oc_zone` VALUES (194,13,'QLD',1);
INSERT INTO `oc_zone` VALUES (195,13,'SA',1);
INSERT INTO `oc_zone` VALUES (196,13,'TAS',1);
INSERT INTO `oc_zone` VALUES (197,13,'VIC',1);
INSERT INTO `oc_zone` VALUES (198,13,'WA',1);
INSERT INTO `oc_zone` VALUES (199,14,'1',1);
INSERT INTO `oc_zone` VALUES (200,14,'2',1);
INSERT INTO `oc_zone` VALUES (201,14,'3',1);
INSERT INTO `oc_zone` VALUES (202,14,'4',1);
INSERT INTO `oc_zone` VALUES (203,14,'5',1);
INSERT INTO `oc_zone` VALUES (204,14,'6',1);
INSERT INTO `oc_zone` VALUES (205,14,'7',1);
INSERT INTO `oc_zone` VALUES (206,14,'8',1);
INSERT INTO `oc_zone` VALUES (207,14,'9',1);
INSERT INTO `oc_zone` VALUES (208,15,'AB',1);
INSERT INTO `oc_zone` VALUES (209,15,'ABS',1);
INSERT INTO `oc_zone` VALUES (210,15,'AGC',1);
INSERT INTO `oc_zone` VALUES (211,15,'AGM',1);
INSERT INTO `oc_zone` VALUES (212,15,'AGS',1);
INSERT INTO `oc_zone` VALUES (213,15,'AGA',1);
INSERT INTO `oc_zone` VALUES (214,15,'AGU',1);
INSERT INTO `oc_zone` VALUES (215,15,'AST',1);
INSERT INTO `oc_zone` VALUES (216,15,'BA',1);
INSERT INTO `oc_zone` VALUES (217,15,'BAB',1);
INSERT INTO `oc_zone` VALUES (218,15,'BAL',1);
INSERT INTO `oc_zone` VALUES (219,15,'BAR',1);
INSERT INTO `oc_zone` VALUES (220,15,'BEY',1);
INSERT INTO `oc_zone` VALUES (221,15,'BIL',1);
INSERT INTO `oc_zone` VALUES (222,15,'CAB',1);
INSERT INTO `oc_zone` VALUES (223,15,'CAL',1);
INSERT INTO `oc_zone` VALUES (224,15,'CUL',1);
INSERT INTO `oc_zone` VALUES (225,15,'DAS',1);
INSERT INTO `oc_zone` VALUES (226,15,'DAV',1);
INSERT INTO `oc_zone` VALUES (227,15,'FUZ',1);
INSERT INTO `oc_zone` VALUES (228,15,'GA',1);
INSERT INTO `oc_zone` VALUES (229,15,'GAD',1);
INSERT INTO `oc_zone` VALUES (230,15,'GOR',1);
INSERT INTO `oc_zone` VALUES (231,15,'GOY',1);
INSERT INTO `oc_zone` VALUES (232,15,'HAC',1);
INSERT INTO `oc_zone` VALUES (233,15,'IMI',1);
INSERT INTO `oc_zone` VALUES (234,15,'ISM',1);
INSERT INTO `oc_zone` VALUES (235,15,'KAL',1);
INSERT INTO `oc_zone` VALUES (236,15,'KUR',1);
INSERT INTO `oc_zone` VALUES (237,15,'LA',1);
INSERT INTO `oc_zone` VALUES (238,15,'LAC',1);
INSERT INTO `oc_zone` VALUES (239,15,'LAN',1);
INSERT INTO `oc_zone` VALUES (240,15,'LER',1);
INSERT INTO `oc_zone` VALUES (241,15,'MAS',1);
INSERT INTO `oc_zone` VALUES (242,15,'MI',1);
INSERT INTO `oc_zone` VALUES (243,15,'NA',1);
INSERT INTO `oc_zone` VALUES (244,15,'NEF',1);
INSERT INTO `oc_zone` VALUES (245,15,'OGU',1);
INSERT INTO `oc_zone` VALUES (246,15,'ORD',1);
INSERT INTO `oc_zone` VALUES (247,15,'QAB',1);
INSERT INTO `oc_zone` VALUES (248,15,'QAX',1);
INSERT INTO `oc_zone` VALUES (249,15,'QAZ',1);
INSERT INTO `oc_zone` VALUES (250,15,'QOB',1);
INSERT INTO `oc_zone` VALUES (251,15,'QBA',1);
INSERT INTO `oc_zone` VALUES (252,15,'QBI',1);
INSERT INTO `oc_zone` VALUES (253,15,'QUS',1);
INSERT INTO `oc_zone` VALUES (254,15,'SA',1);
INSERT INTO `oc_zone` VALUES (255,15,'SAT',1);
INSERT INTO `oc_zone` VALUES (256,15,'SAB',1);
INSERT INTO `oc_zone` VALUES (257,15,'SAD',1);
INSERT INTO `oc_zone` VALUES (258,15,'SAH',1);
INSERT INTO `oc_zone` VALUES (259,15,'SAK',1);
INSERT INTO `oc_zone` VALUES (260,15,'SAL',1);
INSERT INTO `oc_zone` VALUES (261,15,'SM',1);
INSERT INTO `oc_zone` VALUES (262,15,'SMI',1);
INSERT INTO `oc_zone` VALUES (263,15,'SKR',1);
INSERT INTO `oc_zone` VALUES (264,15,'SMX',1);
INSERT INTO `oc_zone` VALUES (265,15,'SAR',1);
INSERT INTO `oc_zone` VALUES (266,15,'SIY',1);
INSERT INTO `oc_zone` VALUES (267,15,'SS',1);
INSERT INTO `oc_zone` VALUES (268,15,'SUS',1);
INSERT INTO `oc_zone` VALUES (269,15,'TAR',1);
INSERT INTO `oc_zone` VALUES (270,15,'TOV',1);
INSERT INTO `oc_zone` VALUES (271,15,'UCA',1);
INSERT INTO `oc_zone` VALUES (272,15,'XA',1);
INSERT INTO `oc_zone` VALUES (273,15,'XAC',1);
INSERT INTO `oc_zone` VALUES (274,15,'XAN',1);
INSERT INTO `oc_zone` VALUES (275,15,'XIZ',1);
INSERT INTO `oc_zone` VALUES (276,15,'XCI',1);
INSERT INTO `oc_zone` VALUES (277,15,'XVD',1);
INSERT INTO `oc_zone` VALUES (278,15,'YAR',1);
INSERT INTO `oc_zone` VALUES (279,15,'YEV',1);
INSERT INTO `oc_zone` VALUES (280,15,'ZAN',1);
INSERT INTO `oc_zone` VALUES (281,15,'ZAQ',1);
INSERT INTO `oc_zone` VALUES (282,15,'ZAR',1);
INSERT INTO `oc_zone` VALUES (283,15,'NX',1);
INSERT INTO `oc_zone` VALUES (284,16,'ACK',1);
INSERT INTO `oc_zone` VALUES (285,16,'BER',1);
INSERT INTO `oc_zone` VALUES (286,16,'BIM',1);
INSERT INTO `oc_zone` VALUES (287,16,'BLK',1);
INSERT INTO `oc_zone` VALUES (288,16,'CAT',1);
INSERT INTO `oc_zone` VALUES (289,16,'CAB',1);
INSERT INTO `oc_zone` VALUES (290,16,'CAN',1);
INSERT INTO `oc_zone` VALUES (291,16,'CEL',1);
INSERT INTO `oc_zone` VALUES (292,16,'FRE',1);
INSERT INTO `oc_zone` VALUES (293,16,'CRO',1);
INSERT INTO `oc_zone` VALUES (294,16,'EGB',1);
INSERT INTO `oc_zone` VALUES (295,16,'EXU',1);
INSERT INTO `oc_zone` VALUES (296,16,'GRD',1);
INSERT INTO `oc_zone` VALUES (297,16,'HAR',1);
INSERT INTO `oc_zone` VALUES (298,16,'HOP',1);
INSERT INTO `oc_zone` VALUES (299,16,'INA',1);
INSERT INTO `oc_zone` VALUES (300,16,'LNG',1);
INSERT INTO `oc_zone` VALUES (301,16,'MAN',1);
INSERT INTO `oc_zone` VALUES (302,16,'MAY',1);
INSERT INTO `oc_zone` VALUES (303,16,'MOO',1);
INSERT INTO `oc_zone` VALUES (304,16,'NAB',1);
INSERT INTO `oc_zone` VALUES (305,16,'NAN',1);
INSERT INTO `oc_zone` VALUES (306,16,'NEL',1);
INSERT INTO `oc_zone` VALUES (307,16,'RAG',1);
INSERT INTO `oc_zone` VALUES (308,16,'RUM',1);
INSERT INTO `oc_zone` VALUES (309,16,'SAL',1);
INSERT INTO `oc_zone` VALUES (310,16,'SAB',1);
INSERT INTO `oc_zone` VALUES (311,16,'SAN',1);
INSERT INTO `oc_zone` VALUES (312,16,'SEL',1);
INSERT INTO `oc_zone` VALUES (313,16,'SWE',1);
INSERT INTO `oc_zone` VALUES (314,16,'WGB',1);
INSERT INTO `oc_zone` VALUES (315,17,'CAP',1);
INSERT INTO `oc_zone` VALUES (316,17,'CEN',1);
INSERT INTO `oc_zone` VALUES (317,17,'MUH',1);
INSERT INTO `oc_zone` VALUES (318,17,'NOR',1);
INSERT INTO `oc_zone` VALUES (319,17,'SOU',1);
INSERT INTO `oc_zone` VALUES (320,18,'BAR',1);
INSERT INTO `oc_zone` VALUES (321,18,'CHI',1);
INSERT INTO `oc_zone` VALUES (322,18,'DHA',1);
INSERT INTO `oc_zone` VALUES (323,18,'KHU',1);
INSERT INTO `oc_zone` VALUES (324,18,'RAJ',1);
INSERT INTO `oc_zone` VALUES (325,18,'SYL',1);
INSERT INTO `oc_zone` VALUES (326,19,'CC',1);
INSERT INTO `oc_zone` VALUES (327,19,'AND',1);
INSERT INTO `oc_zone` VALUES (328,19,'GEO',1);
INSERT INTO `oc_zone` VALUES (329,19,'JAM',1);
INSERT INTO `oc_zone` VALUES (330,19,'JOH',1);
INSERT INTO `oc_zone` VALUES (331,19,'JOS',1);
INSERT INTO `oc_zone` VALUES (332,19,'LUC',1);
INSERT INTO `oc_zone` VALUES (333,19,'MIC',1);
INSERT INTO `oc_zone` VALUES (334,19,'PET',1);
INSERT INTO `oc_zone` VALUES (335,19,'PHI',1);
INSERT INTO `oc_zone` VALUES (336,19,'THO',1);
INSERT INTO `oc_zone` VALUES (337,20,'BR',1);
INSERT INTO `oc_zone` VALUES (338,20,'HO',1);
INSERT INTO `oc_zone` VALUES (339,20,'HM',1);
INSERT INTO `oc_zone` VALUES (340,20,'HR',1);
INSERT INTO `oc_zone` VALUES (341,20,'MA',1);
INSERT INTO `oc_zone` VALUES (342,20,'MI',1);
INSERT INTO `oc_zone` VALUES (343,20,'VI',1);
INSERT INTO `oc_zone` VALUES (344,21,'VAN',1);
INSERT INTO `oc_zone` VALUES (345,21,'WBR',1);
INSERT INTO `oc_zone` VALUES (346,21,'WHT',1);
INSERT INTO `oc_zone` VALUES (347,21,'WLG',1);
INSERT INTO `oc_zone` VALUES (348,21,'VLI',1);
INSERT INTO `oc_zone` VALUES (349,21,'WLX',1);
INSERT INTO `oc_zone` VALUES (350,21,'WNA',1);
INSERT INTO `oc_zone` VALUES (351,21,'VOV',1);
INSERT INTO `oc_zone` VALUES (352,21,'VBR',1);
INSERT INTO `oc_zone` VALUES (353,21,'VWV',1);
INSERT INTO `oc_zone` VALUES (354,22,'BZ',1);
INSERT INTO `oc_zone` VALUES (355,22,'CY',1);
INSERT INTO `oc_zone` VALUES (356,22,'CR',1);
INSERT INTO `oc_zone` VALUES (357,22,'OW',1);
INSERT INTO `oc_zone` VALUES (358,22,'SC',1);
INSERT INTO `oc_zone` VALUES (359,22,'TO',1);
INSERT INTO `oc_zone` VALUES (360,23,'AL',1);
INSERT INTO `oc_zone` VALUES (361,23,'AK',1);
INSERT INTO `oc_zone` VALUES (362,23,'AQ',1);
INSERT INTO `oc_zone` VALUES (363,23,'BO',1);
INSERT INTO `oc_zone` VALUES (364,23,'CO',1);
INSERT INTO `oc_zone` VALUES (365,23,'DO',1);
INSERT INTO `oc_zone` VALUES (366,23,'KO',1);
INSERT INTO `oc_zone` VALUES (367,23,'LI',1);
INSERT INTO `oc_zone` VALUES (368,23,'MO',1);
INSERT INTO `oc_zone` VALUES (369,23,'OU',1);
INSERT INTO `oc_zone` VALUES (370,23,'PL',1);
INSERT INTO `oc_zone` VALUES (371,23,'ZO',1);
INSERT INTO `oc_zone` VALUES (372,24,'DS',1);
INSERT INTO `oc_zone` VALUES (373,24,'HC',1);
INSERT INTO `oc_zone` VALUES (374,24,'HA',1);
INSERT INTO `oc_zone` VALUES (375,24,'PG',1);
INSERT INTO `oc_zone` VALUES (376,24,'PB',1);
INSERT INTO `oc_zone` VALUES (377,24,'GC',1);
INSERT INTO `oc_zone` VALUES (378,24,'SG',1);
INSERT INTO `oc_zone` VALUES (379,24,'SA',1);
INSERT INTO `oc_zone` VALUES (380,24,'SM',1);
INSERT INTO `oc_zone` VALUES (381,24,'SH',1);
INSERT INTO `oc_zone` VALUES (382,24,'WA',1);
INSERT INTO `oc_zone` VALUES (383,25,'BUM',1);
INSERT INTO `oc_zone` VALUES (384,25,'CHU',1);
INSERT INTO `oc_zone` VALUES (385,25,'DAG',1);
INSERT INTO `oc_zone` VALUES (386,25,'GAS',1);
INSERT INTO `oc_zone` VALUES (387,25,'HAA',1);
INSERT INTO `oc_zone` VALUES (388,25,'LHU',1);
INSERT INTO `oc_zone` VALUES (389,25,'MON',1);
INSERT INTO `oc_zone` VALUES (390,25,'PAR',1);
INSERT INTO `oc_zone` VALUES (391,25,'PEM',1);
INSERT INTO `oc_zone` VALUES (392,25,'PUN',1);
INSERT INTO `oc_zone` VALUES (393,25,'SJO',1);
INSERT INTO `oc_zone` VALUES (394,25,'SAT',1);
INSERT INTO `oc_zone` VALUES (395,25,'SAR',1);
INSERT INTO `oc_zone` VALUES (396,25,'THI',1);
INSERT INTO `oc_zone` VALUES (397,25,'TRG',1);
INSERT INTO `oc_zone` VALUES (398,25,'TRY',1);
INSERT INTO `oc_zone` VALUES (399,25,'TRO',1);
INSERT INTO `oc_zone` VALUES (400,25,'TSI',1);
INSERT INTO `oc_zone` VALUES (401,25,'WPH',1);
INSERT INTO `oc_zone` VALUES (402,25,'ZHE',1);
INSERT INTO `oc_zone` VALUES (403,26,'BEN',1);
INSERT INTO `oc_zone` VALUES (404,26,'CHU',1);
INSERT INTO `oc_zone` VALUES (405,26,'COC',1);
INSERT INTO `oc_zone` VALUES (406,26,'LPZ',1);
INSERT INTO `oc_zone` VALUES (407,26,'ORU',1);
INSERT INTO `oc_zone` VALUES (408,26,'PAN',1);
INSERT INTO `oc_zone` VALUES (409,26,'POT',1);
INSERT INTO `oc_zone` VALUES (410,26,'SCZ',1);
INSERT INTO `oc_zone` VALUES (411,26,'TAR',1);
INSERT INTO `oc_zone` VALUES (412,27,'BRO',1);
INSERT INTO `oc_zone` VALUES (413,27,'FUS',1);
INSERT INTO `oc_zone` VALUES (414,27,'FPO',1);
INSERT INTO `oc_zone` VALUES (415,27,'FTU',1);
INSERT INTO `oc_zone` VALUES (416,27,'FZE',1);
INSERT INTO `oc_zone` VALUES (417,27,'FBP',1);
INSERT INTO `oc_zone` VALUES (418,27,'FSB',1);
INSERT INTO `oc_zone` VALUES (419,27,'FHN',1);
INSERT INTO `oc_zone` VALUES (420,27,'FZH',1);
INSERT INTO `oc_zone` VALUES (421,27,'FSA',1);
INSERT INTO `oc_zone` VALUES (422,27,'FZA',1);
INSERT INTO `oc_zone` VALUES (423,27,'SBL',1);
INSERT INTO `oc_zone` VALUES (424,27,'SDO',1);
INSERT INTO `oc_zone` VALUES (425,27,'SBI',1);
INSERT INTO `oc_zone` VALUES (426,27,'SVL',1);
INSERT INTO `oc_zone` VALUES (427,27,'SSR',1);
INSERT INTO `oc_zone` VALUES (428,27,'SFO',1);
INSERT INTO `oc_zone` VALUES (429,27,'STR',1);
INSERT INTO `oc_zone` VALUES (430,28,'CE',1);
INSERT INTO `oc_zone` VALUES (431,28,'GH',1);
INSERT INTO `oc_zone` VALUES (432,28,'KD',1);
INSERT INTO `oc_zone` VALUES (433,28,'KT',1);
INSERT INTO `oc_zone` VALUES (434,28,'KW',1);
INSERT INTO `oc_zone` VALUES (435,28,'NG',1);
INSERT INTO `oc_zone` VALUES (436,28,'NE',1);
INSERT INTO `oc_zone` VALUES (437,28,'NW',1);
INSERT INTO `oc_zone` VALUES (438,28,'SE',1);
INSERT INTO `oc_zone` VALUES (439,28,'SO',1);
INSERT INTO `oc_zone` VALUES (440,30,'AC',1);
INSERT INTO `oc_zone` VALUES (441,30,'AL',1);
INSERT INTO `oc_zone` VALUES (442,30,'AP',1);
INSERT INTO `oc_zone` VALUES (443,30,'AM',1);
INSERT INTO `oc_zone` VALUES (444,30,'BA',1);
INSERT INTO `oc_zone` VALUES (445,30,'CE',1);
INSERT INTO `oc_zone` VALUES (446,30,'DF',1);
INSERT INTO `oc_zone` VALUES (447,30,'ES',1);
INSERT INTO `oc_zone` VALUES (448,30,'GO',1);
INSERT INTO `oc_zone` VALUES (449,30,'MA',1);
INSERT INTO `oc_zone` VALUES (450,30,'MT',1);
INSERT INTO `oc_zone` VALUES (451,30,'MS',1);
INSERT INTO `oc_zone` VALUES (452,30,'MG',1);
INSERT INTO `oc_zone` VALUES (453,30,'PA',1);
INSERT INTO `oc_zone` VALUES (454,30,'PB',1);
INSERT INTO `oc_zone` VALUES (455,30,'PR',1);
INSERT INTO `oc_zone` VALUES (456,30,'PE',1);
INSERT INTO `oc_zone` VALUES (457,30,'PI',1);
INSERT INTO `oc_zone` VALUES (458,30,'RJ',1);
INSERT INTO `oc_zone` VALUES (459,30,'RN',1);
INSERT INTO `oc_zone` VALUES (460,30,'RS',1);
INSERT INTO `oc_zone` VALUES (461,30,'RO',1);
INSERT INTO `oc_zone` VALUES (462,30,'RR',1);
INSERT INTO `oc_zone` VALUES (463,30,'SC',1);
INSERT INTO `oc_zone` VALUES (464,30,'SP',1);
INSERT INTO `oc_zone` VALUES (465,30,'SE',1);
INSERT INTO `oc_zone` VALUES (466,30,'TO',1);
INSERT INTO `oc_zone` VALUES (467,31,'PB',1);
INSERT INTO `oc_zone` VALUES (468,31,'SI',1);
INSERT INTO `oc_zone` VALUES (469,31,'NI',1);
INSERT INTO `oc_zone` VALUES (470,31,'TB',1);
INSERT INTO `oc_zone` VALUES (471,31,'EA',1);
INSERT INTO `oc_zone` VALUES (472,31,'DI',1);
INSERT INTO `oc_zone` VALUES (473,31,'EG',1);
INSERT INTO `oc_zone` VALUES (474,31,'DG',1);
INSERT INTO `oc_zone` VALUES (475,32,'BEL',1);
INSERT INTO `oc_zone` VALUES (476,32,'BRM',1);
INSERT INTO `oc_zone` VALUES (477,32,'TEM',1);
INSERT INTO `oc_zone` VALUES (478,32,'TUT',1);
INSERT INTO `oc_zone` VALUES (479,33,'',1);
INSERT INTO `oc_zone` VALUES (480,33,'',1);
INSERT INTO `oc_zone` VALUES (481,33,'',1);
INSERT INTO `oc_zone` VALUES (482,33,'',1);
INSERT INTO `oc_zone` VALUES (483,33,'',1);
INSERT INTO `oc_zone` VALUES (484,33,'',1);
INSERT INTO `oc_zone` VALUES (485,33,'',1);
INSERT INTO `oc_zone` VALUES (486,33,'',1);
INSERT INTO `oc_zone` VALUES (487,33,'',1);
INSERT INTO `oc_zone` VALUES (488,33,'',1);
INSERT INTO `oc_zone` VALUES (489,33,'',1);
INSERT INTO `oc_zone` VALUES (490,33,'',1);
INSERT INTO `oc_zone` VALUES (491,33,'',1);
INSERT INTO `oc_zone` VALUES (492,33,'',1);
INSERT INTO `oc_zone` VALUES (493,33,'',1);
INSERT INTO `oc_zone` VALUES (494,33,'',1);
INSERT INTO `oc_zone` VALUES (495,33,'',1);
INSERT INTO `oc_zone` VALUES (496,33,'',1);
INSERT INTO `oc_zone` VALUES (497,33,'',1);
INSERT INTO `oc_zone` VALUES (498,33,'',1);
INSERT INTO `oc_zone` VALUES (499,33,'',1);
INSERT INTO `oc_zone` VALUES (500,33,'',1);
INSERT INTO `oc_zone` VALUES (501,33,'',1);
INSERT INTO `oc_zone` VALUES (502,33,'',1);
INSERT INTO `oc_zone` VALUES (503,33,'',1);
INSERT INTO `oc_zone` VALUES (504,33,'',1);
INSERT INTO `oc_zone` VALUES (505,33,'',1);
INSERT INTO `oc_zone` VALUES (506,34,'BAL',1);
INSERT INTO `oc_zone` VALUES (507,34,'BAM',1);
INSERT INTO `oc_zone` VALUES (508,34,'BAN',1);
INSERT INTO `oc_zone` VALUES (509,34,'BAZ',1);
INSERT INTO `oc_zone` VALUES (510,34,'BOR',1);
INSERT INTO `oc_zone` VALUES (511,34,'BLG',1);
INSERT INTO `oc_zone` VALUES (512,34,'BOK',1);
INSERT INTO `oc_zone` VALUES (513,34,'COM',1);
INSERT INTO `oc_zone` VALUES (514,34,'GAN',1);
INSERT INTO `oc_zone` VALUES (515,34,'GNA',1);
INSERT INTO `oc_zone` VALUES (516,34,'GOU',1);
INSERT INTO `oc_zone` VALUES (517,34,'HOU',1);
INSERT INTO `oc_zone` VALUES (518,34,'IOA',1);
INSERT INTO `oc_zone` VALUES (519,34,'KAD',1);
INSERT INTO `oc_zone` VALUES (520,34,'KEN',1);
INSERT INTO `oc_zone` VALUES (521,34,'KOD',1);
INSERT INTO `oc_zone` VALUES (522,34,'KOP',1);
INSERT INTO `oc_zone` VALUES (523,34,'KOS',1);
INSERT INTO `oc_zone` VALUES (524,34,'KOL',1);
INSERT INTO `oc_zone` VALUES (525,34,'KOT',1);
INSERT INTO `oc_zone` VALUES (526,34,'KOW',1);
INSERT INTO `oc_zone` VALUES (527,34,'LER',1);
INSERT INTO `oc_zone` VALUES (528,34,'LOR',1);
INSERT INTO `oc_zone` VALUES (529,34,'MOU',1);
INSERT INTO `oc_zone` VALUES (530,34,'NAH',1);
INSERT INTO `oc_zone` VALUES (531,34,'NAM',1);
INSERT INTO `oc_zone` VALUES (532,34,'NAY',1);
INSERT INTO `oc_zone` VALUES (533,34,'NOU',1);
INSERT INTO `oc_zone` VALUES (534,34,'OUB',1);
INSERT INTO `oc_zone` VALUES (535,34,'OUD',1);
INSERT INTO `oc_zone` VALUES (536,34,'PAS',1);
INSERT INTO `oc_zone` VALUES (537,34,'PON',1);
INSERT INTO `oc_zone` VALUES (538,34,'SAG',1);
INSERT INTO `oc_zone` VALUES (539,34,'SAM',1);
INSERT INTO `oc_zone` VALUES (540,34,'SEN',1);
INSERT INTO `oc_zone` VALUES (541,34,'SIS',1);
INSERT INTO `oc_zone` VALUES (542,34,'SOM',1);
INSERT INTO `oc_zone` VALUES (543,34,'SOR',1);
INSERT INTO `oc_zone` VALUES (544,34,'TAP',1);
INSERT INTO `oc_zone` VALUES (545,34,'TUY',1);
INSERT INTO `oc_zone` VALUES (546,34,'YAG',1);
INSERT INTO `oc_zone` VALUES (547,34,'YAT',1);
INSERT INTO `oc_zone` VALUES (548,34,'ZIR',1);
INSERT INTO `oc_zone` VALUES (549,34,'ZOD',1);
INSERT INTO `oc_zone` VALUES (550,34,'ZOW',1);
INSERT INTO `oc_zone` VALUES (551,35,'BB',1);
INSERT INTO `oc_zone` VALUES (552,35,'BJ',1);
INSERT INTO `oc_zone` VALUES (553,35,'BR',1);
INSERT INTO `oc_zone` VALUES (554,35,'CA',1);
INSERT INTO `oc_zone` VALUES (555,35,'CI',1);
INSERT INTO `oc_zone` VALUES (556,35,'GI',1);
INSERT INTO `oc_zone` VALUES (557,35,'KR',1);
INSERT INTO `oc_zone` VALUES (558,35,'KY',1);
INSERT INTO `oc_zone` VALUES (559,35,'KI',1);
INSERT INTO `oc_zone` VALUES (560,35,'MA',1);
INSERT INTO `oc_zone` VALUES (561,35,'MU',1);
INSERT INTO `oc_zone` VALUES (562,35,'MY',1);
INSERT INTO `oc_zone` VALUES (563,35,'MW',1);
INSERT INTO `oc_zone` VALUES (564,35,'NG',1);
INSERT INTO `oc_zone` VALUES (565,35,'RT',1);
INSERT INTO `oc_zone` VALUES (566,35,'RY',1);
INSERT INTO `oc_zone` VALUES (567,36,'PP',1);
INSERT INTO `oc_zone` VALUES (568,36,'PS',1);
INSERT INTO `oc_zone` VALUES (569,36,'PA',1);
INSERT INTO `oc_zone` VALUES (570,36,'KB',1);
INSERT INTO `oc_zone` VALUES (571,36,'BM',1);
INSERT INTO `oc_zone` VALUES (572,36,'BA',1);
INSERT INTO `oc_zone` VALUES (573,36,'KM',1);
INSERT INTO `oc_zone` VALUES (574,36,'KN',1);
INSERT INTO `oc_zone` VALUES (575,36,'KU',1);
INSERT INTO `oc_zone` VALUES (576,36,'KO',1);
INSERT INTO `oc_zone` VALUES (577,36,'KT',1);
INSERT INTO `oc_zone` VALUES (578,36,'KP',1);
INSERT INTO `oc_zone` VALUES (579,36,'KL',1);
INSERT INTO `oc_zone` VALUES (580,36,'KK',1);
INSERT INTO `oc_zone` VALUES (581,36,'KR',1);
INSERT INTO `oc_zone` VALUES (582,36,'MK',1);
INSERT INTO `oc_zone` VALUES (583,36,'OM',1);
INSERT INTO `oc_zone` VALUES (584,36,'PU',1);
INSERT INTO `oc_zone` VALUES (585,36,'PR',1);
INSERT INTO `oc_zone` VALUES (586,36,'PG',1);
INSERT INTO `oc_zone` VALUES (587,36,'RK',1);
INSERT INTO `oc_zone` VALUES (588,36,'SI',1);
INSERT INTO `oc_zone` VALUES (589,36,'ST',1);
INSERT INTO `oc_zone` VALUES (590,36,'SR',1);
INSERT INTO `oc_zone` VALUES (591,36,'TK',1);
INSERT INTO `oc_zone` VALUES (592,37,'ADA',1);
INSERT INTO `oc_zone` VALUES (593,37,'CEN',1);
INSERT INTO `oc_zone` VALUES (594,37,'EST',1);
INSERT INTO `oc_zone` VALUES (595,37,'EXN',1);
INSERT INTO `oc_zone` VALUES (596,37,'LIT',1);
INSERT INTO `oc_zone` VALUES (597,37,'NOR',1);
INSERT INTO `oc_zone` VALUES (598,37,'NOT',1);
INSERT INTO `oc_zone` VALUES (599,37,'OUE',1);
INSERT INTO `oc_zone` VALUES (600,37,'SUD',1);
INSERT INTO `oc_zone` VALUES (601,37,'SOU',1);
INSERT INTO `oc_zone` VALUES (602,38,'AB',1);
INSERT INTO `oc_zone` VALUES (603,38,'BC',1);
INSERT INTO `oc_zone` VALUES (604,38,'MB',1);
INSERT INTO `oc_zone` VALUES (605,38,'NB',1);
INSERT INTO `oc_zone` VALUES (606,38,'NL',1);
INSERT INTO `oc_zone` VALUES (607,38,'NT',1);
INSERT INTO `oc_zone` VALUES (608,38,'NS',1);
INSERT INTO `oc_zone` VALUES (609,38,'NU',1);
INSERT INTO `oc_zone` VALUES (610,38,'ON',1);
INSERT INTO `oc_zone` VALUES (611,38,'PE',1);
INSERT INTO `oc_zone` VALUES (612,38,'QC',1);
INSERT INTO `oc_zone` VALUES (613,38,'SK',1);
INSERT INTO `oc_zone` VALUES (614,38,'YT',1);
INSERT INTO `oc_zone` VALUES (615,39,'BV',1);
INSERT INTO `oc_zone` VALUES (616,39,'BR',1);
INSERT INTO `oc_zone` VALUES (617,39,'CS',1);
INSERT INTO `oc_zone` VALUES (618,39,'MA',1);
INSERT INTO `oc_zone` VALUES (619,39,'MO',1);
INSERT INTO `oc_zone` VALUES (620,39,'PA',1);
INSERT INTO `oc_zone` VALUES (621,39,'PN',1);
INSERT INTO `oc_zone` VALUES (622,39,'PR',1);
INSERT INTO `oc_zone` VALUES (623,39,'RG',1);
INSERT INTO `oc_zone` VALUES (624,39,'SL',1);
INSERT INTO `oc_zone` VALUES (625,39,'CA',1);
INSERT INTO `oc_zone` VALUES (626,39,'CR',1);
INSERT INTO `oc_zone` VALUES (627,39,'SD',1);
INSERT INTO `oc_zone` VALUES (628,39,'SF',1);
INSERT INTO `oc_zone` VALUES (629,39,'SN',1);
INSERT INTO `oc_zone` VALUES (630,39,'SV',1);
INSERT INTO `oc_zone` VALUES (631,39,'TA',1);
INSERT INTO `oc_zone` VALUES (632,40,'CR',1);
INSERT INTO `oc_zone` VALUES (633,40,'EA',1);
INSERT INTO `oc_zone` VALUES (634,40,'ML',1);
INSERT INTO `oc_zone` VALUES (635,40,'ST',1);
INSERT INTO `oc_zone` VALUES (636,40,'SP',1);
INSERT INTO `oc_zone` VALUES (637,40,'SK',1);
INSERT INTO `oc_zone` VALUES (638,40,'WD',1);
INSERT INTO `oc_zone` VALUES (639,40,'WN',1);
INSERT INTO `oc_zone` VALUES (640,41,'BBA',1);
INSERT INTO `oc_zone` VALUES (641,41,'BKO',1);
INSERT INTO `oc_zone` VALUES (642,41,'HKO',1);
INSERT INTO `oc_zone` VALUES (643,41,'HMB',1);
INSERT INTO `oc_zone` VALUES (644,41,'KEM',1);
INSERT INTO `oc_zone` VALUES (645,41,'LOB',1);
INSERT INTO `oc_zone` VALUES (646,41,'MKD',1);
INSERT INTO `oc_zone` VALUES (647,41,'MBO',1);
INSERT INTO `oc_zone` VALUES (648,41,'NMM',1);
INSERT INTO `oc_zone` VALUES (649,41,'OMP',1);
INSERT INTO `oc_zone` VALUES (650,41,'OUK',1);
INSERT INTO `oc_zone` VALUES (651,41,'OUH',1);
INSERT INTO `oc_zone` VALUES (652,41,'OPE',1);
INSERT INTO `oc_zone` VALUES (653,41,'VAK',1);
INSERT INTO `oc_zone` VALUES (654,41,'NGR',1);
INSERT INTO `oc_zone` VALUES (655,41,'SMB',1);
INSERT INTO `oc_zone` VALUES (656,41,'BAN',1);
INSERT INTO `oc_zone` VALUES (657,42,'BA',1);
INSERT INTO `oc_zone` VALUES (658,42,'BI',1);
INSERT INTO `oc_zone` VALUES (659,42,'BE',1);
INSERT INTO `oc_zone` VALUES (660,42,'CB',1);
INSERT INTO `oc_zone` VALUES (661,42,'GU',1);
INSERT INTO `oc_zone` VALUES (662,42,'KA',1);
INSERT INTO `oc_zone` VALUES (663,42,'LA',1);
INSERT INTO `oc_zone` VALUES (664,42,'LC',1);
INSERT INTO `oc_zone` VALUES (665,42,'LR',1);
INSERT INTO `oc_zone` VALUES (666,42,'MK',1);
INSERT INTO `oc_zone` VALUES (667,42,'MC',1);
INSERT INTO `oc_zone` VALUES (668,42,'OU',1);
INSERT INTO `oc_zone` VALUES (669,42,'SA',1);
INSERT INTO `oc_zone` VALUES (670,42,'TA',1);
INSERT INTO `oc_zone` VALUES (671,43,'AI',1);
INSERT INTO `oc_zone` VALUES (672,43,'AN',1);
INSERT INTO `oc_zone` VALUES (673,43,'AR',1);
INSERT INTO `oc_zone` VALUES (674,43,'AT',1);
INSERT INTO `oc_zone` VALUES (675,43,'BI',1);
INSERT INTO `oc_zone` VALUES (676,43,'CO',1);
INSERT INTO `oc_zone` VALUES (677,43,'LI',1);
INSERT INTO `oc_zone` VALUES (678,43,'LL',1);
INSERT INTO `oc_zone` VALUES (679,43,'MA',1);
INSERT INTO `oc_zone` VALUES (680,43,'ML',1);
INSERT INTO `oc_zone` VALUES (681,43,'RM',1);
INSERT INTO `oc_zone` VALUES (682,43,'TA',1);
INSERT INTO `oc_zone` VALUES (683,43,'VS',1);
INSERT INTO `oc_zone` VALUES (684,44,'AN',1);
INSERT INTO `oc_zone` VALUES (685,44,'BE',1);
INSERT INTO `oc_zone` VALUES (686,44,'CH',1);
INSERT INTO `oc_zone` VALUES (687,44,'FU',1);
INSERT INTO `oc_zone` VALUES (688,44,'GA',1);
INSERT INTO `oc_zone` VALUES (689,44,'GU',1);
INSERT INTO `oc_zone` VALUES (690,44,'GX',1);
INSERT INTO `oc_zone` VALUES (691,44,'GZ',1);
INSERT INTO `oc_zone` VALUES (692,44,'HA',1);
INSERT INTO `oc_zone` VALUES (693,44,'HB',1);
INSERT INTO `oc_zone` VALUES (694,44,'HL',1);
INSERT INTO `oc_zone` VALUES (695,44,'HE',1);
INSERT INTO `oc_zone` VALUES (696,44,'HK',1);
INSERT INTO `oc_zone` VALUES (697,44,'HU',1);
INSERT INTO `oc_zone` VALUES (698,44,'HN',1);
INSERT INTO `oc_zone` VALUES (699,44,'IM',1);
INSERT INTO `oc_zone` VALUES (700,44,'JI',1);
INSERT INTO `oc_zone` VALUES (701,44,'JX',1);
INSERT INTO `oc_zone` VALUES (702,44,'JL',1);
INSERT INTO `oc_zone` VALUES (703,44,'LI',1);
INSERT INTO `oc_zone` VALUES (704,44,'MA',1);
INSERT INTO `oc_zone` VALUES (705,44,'NI',1);
INSERT INTO `oc_zone` VALUES (706,44,'SH',1);
INSERT INTO `oc_zone` VALUES (707,44,'SA',1);
INSERT INTO `oc_zone` VALUES (708,44,'SG',1);
INSERT INTO `oc_zone` VALUES (709,44,'SX',1);
INSERT INTO `oc_zone` VALUES (710,44,'SI',1);
INSERT INTO `oc_zone` VALUES (711,44,'TI',1);
INSERT INTO `oc_zone` VALUES (712,44,'XI',1);
INSERT INTO `oc_zone` VALUES (713,44,'YU',1);
INSERT INTO `oc_zone` VALUES (714,44,'ZH',1);
INSERT INTO `oc_zone` VALUES (715,46,'D',1);
INSERT INTO `oc_zone` VALUES (716,46,'H',1);
INSERT INTO `oc_zone` VALUES (717,46,'O',1);
INSERT INTO `oc_zone` VALUES (718,46,'S',1);
INSERT INTO `oc_zone` VALUES (719,46,'W',1);
INSERT INTO `oc_zone` VALUES (720,47,'AMA',1);
INSERT INTO `oc_zone` VALUES (721,47,'ANT',1);
INSERT INTO `oc_zone` VALUES (722,47,'ARA',1);
INSERT INTO `oc_zone` VALUES (723,47,'ATL',1);
INSERT INTO `oc_zone` VALUES (724,47,'DC',1);
INSERT INTO `oc_zone` VALUES (725,47,'BOL',1);
INSERT INTO `oc_zone` VALUES (726,47,'BOY',1);
INSERT INTO `oc_zone` VALUES (727,47,'CAL',1);
INSERT INTO `oc_zone` VALUES (728,47,'CAQ',1);
INSERT INTO `oc_zone` VALUES (729,47,'CAS',1);
INSERT INTO `oc_zone` VALUES (730,47,'CAU',1);
INSERT INTO `oc_zone` VALUES (731,47,'CES',1);
INSERT INTO `oc_zone` VALUES (732,47,'CHO',1);
INSERT INTO `oc_zone` VALUES (733,47,'COR',1);
INSERT INTO `oc_zone` VALUES (734,47,'CUN',1);
INSERT INTO `oc_zone` VALUES (735,47,'GNA',1);
INSERT INTO `oc_zone` VALUES (736,47,'GJR',1);
INSERT INTO `oc_zone` VALUES (737,47,'GUV',1);
INSERT INTO `oc_zone` VALUES (738,47,'HUI',1);
INSERT INTO `oc_zone` VALUES (739,47,'MAG',1);
INSERT INTO `oc_zone` VALUES (740,47,'MET',1);
INSERT INTO `oc_zone` VALUES (741,47,'NAR',1);
INSERT INTO `oc_zone` VALUES (742,47,'NSA',1);
INSERT INTO `oc_zone` VALUES (743,47,'PUT',1);
INSERT INTO `oc_zone` VALUES (744,47,'QUI',1);
INSERT INTO `oc_zone` VALUES (745,47,'RIS',1);
INSERT INTO `oc_zone` VALUES (746,47,'SAP',1);
INSERT INTO `oc_zone` VALUES (747,47,'SAN',1);
INSERT INTO `oc_zone` VALUES (748,47,'SUC',1);
INSERT INTO `oc_zone` VALUES (749,47,'TOL',1);
INSERT INTO `oc_zone` VALUES (750,47,'VAC',1);
INSERT INTO `oc_zone` VALUES (751,47,'VAU',1);
INSERT INTO `oc_zone` VALUES (752,47,'VID',1);
INSERT INTO `oc_zone` VALUES (753,48,'G',1);
INSERT INTO `oc_zone` VALUES (754,48,'A',1);
INSERT INTO `oc_zone` VALUES (755,48,'M',1);
INSERT INTO `oc_zone` VALUES (756,49,'BO',1);
INSERT INTO `oc_zone` VALUES (757,49,'BR',1);
INSERT INTO `oc_zone` VALUES (758,49,'CU',1);
INSERT INTO `oc_zone` VALUES (759,49,'CO',1);
INSERT INTO `oc_zone` VALUES (760,49,'KO',1);
INSERT INTO `oc_zone` VALUES (761,49,'LE',1);
INSERT INTO `oc_zone` VALUES (762,49,'LI',1);
INSERT INTO `oc_zone` VALUES (763,49,'NI',1);
INSERT INTO `oc_zone` VALUES (764,49,'PL',1);
INSERT INTO `oc_zone` VALUES (765,49,'PO',1);
INSERT INTO `oc_zone` VALUES (766,49,'SA',1);
INSERT INTO `oc_zone` VALUES (767,50,'PU',1);
INSERT INTO `oc_zone` VALUES (768,50,'RK',1);
INSERT INTO `oc_zone` VALUES (769,50,'MK',1);
INSERT INTO `oc_zone` VALUES (770,50,'PE',1);
INSERT INTO `oc_zone` VALUES (771,50,'NI',1);
INSERT INTO `oc_zone` VALUES (772,50,'SU',1);
INSERT INTO `oc_zone` VALUES (773,50,'PA',1);
INSERT INTO `oc_zone` VALUES (774,50,'AI',1);
INSERT INTO `oc_zone` VALUES (775,50,'MA',1);
INSERT INTO `oc_zone` VALUES (776,50,'TA',1);
INSERT INTO `oc_zone` VALUES (777,50,'MT',1);
INSERT INTO `oc_zone` VALUES (778,50,'AT',1);
INSERT INTO `oc_zone` VALUES (779,50,'MU',1);
INSERT INTO `oc_zone` VALUES (780,50,'RR',1);
INSERT INTO `oc_zone` VALUES (781,50,'MG',1);
INSERT INTO `oc_zone` VALUES (782,51,'AL',1);
INSERT INTO `oc_zone` VALUES (783,51,'CA',1);
INSERT INTO `oc_zone` VALUES (784,51,'GU',1);
INSERT INTO `oc_zone` VALUES (785,51,'HE',1);
INSERT INTO `oc_zone` VALUES (786,51,'LI',1);
INSERT INTO `oc_zone` VALUES (787,51,'PU',1);
INSERT INTO `oc_zone` VALUES (788,51,'SJ',1);
INSERT INTO `oc_zone` VALUES (789,52,'ABE',1);
INSERT INTO `oc_zone` VALUES (790,52,'ABI',1);
INSERT INTO `oc_zone` VALUES (791,52,'ABO',1);
INSERT INTO `oc_zone` VALUES (792,52,'ADI',1);
INSERT INTO `oc_zone` VALUES (793,52,'ADZ',1);
INSERT INTO `oc_zone` VALUES (794,52,'AGB',1);
INSERT INTO `oc_zone` VALUES (795,52,'AGN',1);
INSERT INTO `oc_zone` VALUES (796,52,'ALE',1);
INSERT INTO `oc_zone` VALUES (797,52,'BOC',1);
INSERT INTO `oc_zone` VALUES (798,52,'BAN',1);
INSERT INTO `oc_zone` VALUES (799,52,'BEO',1);
INSERT INTO `oc_zone` VALUES (800,52,'BIA',1);
INSERT INTO `oc_zone` VALUES (801,52,'BDK',1);
INSERT INTO `oc_zone` VALUES (802,52,'BGN',1);
INSERT INTO `oc_zone` VALUES (803,52,'BFL',1);
INSERT INTO `oc_zone` VALUES (804,52,'BKE',1);
INSERT INTO `oc_zone` VALUES (805,52,'BNA',1);
INSERT INTO `oc_zone` VALUES (806,52,'BDL',1);
INSERT INTO `oc_zone` VALUES (807,52,'DKL',1);
INSERT INTO `oc_zone` VALUES (808,52,'DBU',1);
INSERT INTO `oc_zone` VALUES (809,52,'DAL',1);
INSERT INTO `oc_zone` VALUES (810,52,'DAN',1);
INSERT INTO `oc_zone` VALUES (811,52,'DAO',1);
INSERT INTO `oc_zone` VALUES (812,52,'DIM',1);
INSERT INTO `oc_zone` VALUES (813,52,'DIV',1);
INSERT INTO `oc_zone` VALUES (814,52,'DUE',1);
INSERT INTO `oc_zone` VALUES (815,52,'FER',1);
INSERT INTO `oc_zone` VALUES (816,52,'GAG',1);
INSERT INTO `oc_zone` VALUES (817,52,'GBA',1);
INSERT INTO `oc_zone` VALUES (818,52,'GLA',1);
INSERT INTO `oc_zone` VALUES (819,52,'GUI',1);
INSERT INTO `oc_zone` VALUES (820,52,'ISS',1);
INSERT INTO `oc_zone` VALUES (821,52,'JAC',1);
INSERT INTO `oc_zone` VALUES (822,52,'KAT',1);
INSERT INTO `oc_zone` VALUES (823,52,'KOR',1);
INSERT INTO `oc_zone` VALUES (824,52,'LAK',1);
INSERT INTO `oc_zone` VALUES (825,52,'MAN',1);
INSERT INTO `oc_zone` VALUES (826,52,'MKN',1);
INSERT INTO `oc_zone` VALUES (827,52,'MBA',1);
INSERT INTO `oc_zone` VALUES (828,52,'ODI',1);
INSERT INTO `oc_zone` VALUES (829,52,'OUM',1);
INSERT INTO `oc_zone` VALUES (830,52,'SAK',1);
INSERT INTO `oc_zone` VALUES (831,52,'SPE',1);
INSERT INTO `oc_zone` VALUES (832,52,'SAS',1);
INSERT INTO `oc_zone` VALUES (833,52,'SEG',1);
INSERT INTO `oc_zone` VALUES (834,52,'SIN',1);
INSERT INTO `oc_zone` VALUES (835,52,'SOU',1);
INSERT INTO `oc_zone` VALUES (836,52,'TAB',1);
INSERT INTO `oc_zone` VALUES (837,52,'TAN',1);
INSERT INTO `oc_zone` VALUES (838,52,'TIE',1);
INSERT INTO `oc_zone` VALUES (839,52,'TIN',1);
INSERT INTO `oc_zone` VALUES (840,52,'TIA',1);
INSERT INTO `oc_zone` VALUES (841,52,'TBA',1);
INSERT INTO `oc_zone` VALUES (842,52,'TLP',1);
INSERT INTO `oc_zone` VALUES (843,52,'TMD',1);
INSERT INTO `oc_zone` VALUES (844,52,'VAV',1);
INSERT INTO `oc_zone` VALUES (845,52,'YAM',1);
INSERT INTO `oc_zone` VALUES (846,52,'ZUE',1);
INSERT INTO `oc_zone` VALUES (847,53,'BB',1);
INSERT INTO `oc_zone` VALUES (848,53,'GZ',1);
INSERT INTO `oc_zone` VALUES (849,53,'DN',1);
INSERT INTO `oc_zone` VALUES (850,53,'IS',1);
INSERT INTO `oc_zone` VALUES (851,53,'KA',1);
INSERT INTO `oc_zone` VALUES (852,53,'KK',1);
INSERT INTO `oc_zone` VALUES (853,53,'KZ',1);
INSERT INTO `oc_zone` VALUES (854,53,'LS',1);
INSERT INTO `oc_zone` VALUES (855,53,'ME',1);
INSERT INTO `oc_zone` VALUES (856,53,'OB',1);
INSERT INTO `oc_zone` VALUES (857,53,'PS',1);
INSERT INTO `oc_zone` VALUES (858,53,'PG',1);
INSERT INTO `oc_zone` VALUES (859,53,'SK',1);
INSERT INTO `oc_zone` VALUES (860,53,'SM',1);
INSERT INTO `oc_zone` VALUES (861,53,'BP',1);
INSERT INTO `oc_zone` VALUES (862,53,'SD',1);
INSERT INTO `oc_zone` VALUES (863,53,'VA',1);
INSERT INTO `oc_zone` VALUES (864,53,'VP',1);
INSERT INTO `oc_zone` VALUES (865,53,'VS',1);
INSERT INTO `oc_zone` VALUES (866,53,'ZA',1);
INSERT INTO `oc_zone` VALUES (867,53,'ZG',1);
INSERT INTO `oc_zone` VALUES (868,54,'CA',1);
INSERT INTO `oc_zone` VALUES (869,54,'CD',1);
INSERT INTO `oc_zone` VALUES (870,54,'CI',1);
INSERT INTO `oc_zone` VALUES (871,54,'CH',1);
INSERT INTO `oc_zone` VALUES (872,54,'GR',1);
INSERT INTO `oc_zone` VALUES (873,54,'GU',1);
INSERT INTO `oc_zone` VALUES (874,54,'HO',1);
INSERT INTO `oc_zone` VALUES (875,54,'IJ',1);
INSERT INTO `oc_zone` VALUES (876,54,'LH',1);
INSERT INTO `oc_zone` VALUES (877,54,'LT',1);
INSERT INTO `oc_zone` VALUES (878,54,'MA',1);
INSERT INTO `oc_zone` VALUES (879,54,'PR',1);
INSERT INTO `oc_zone` VALUES (880,54,'SS',1);
INSERT INTO `oc_zone` VALUES (881,54,'SC',1);
INSERT INTO `oc_zone` VALUES (882,54,'VC',1);
INSERT INTO `oc_zone` VALUES (883,55,'F',1);
INSERT INTO `oc_zone` VALUES (884,55,'K',1);
INSERT INTO `oc_zone` VALUES (885,55,'A',1);
INSERT INTO `oc_zone` VALUES (886,55,'I',1);
INSERT INTO `oc_zone` VALUES (887,55,'N',1);
INSERT INTO `oc_zone` VALUES (888,55,'P',1);
INSERT INTO `oc_zone` VALUES (889,56,'U',1);
INSERT INTO `oc_zone` VALUES (890,56,'C',1);
INSERT INTO `oc_zone` VALUES (891,56,'B',1);
INSERT INTO `oc_zone` VALUES (892,56,'K',1);
INSERT INTO `oc_zone` VALUES (893,56,'H',1);
INSERT INTO `oc_zone` VALUES (894,56,'L',1);
INSERT INTO `oc_zone` VALUES (895,56,'T',1);
INSERT INTO `oc_zone` VALUES (896,56,'M',1);
INSERT INTO `oc_zone` VALUES (897,56,'E',1);
INSERT INTO `oc_zone` VALUES (898,56,'P',1);
INSERT INTO `oc_zone` VALUES (899,56,'A',1);
INSERT INTO `oc_zone` VALUES (900,56,'S',1);
INSERT INTO `oc_zone` VALUES (901,56,'J',1);
INSERT INTO `oc_zone` VALUES (902,56,'Z',1);
INSERT INTO `oc_zone` VALUES (903,57,'81',1);
INSERT INTO `oc_zone` VALUES (904,57,'82',1);
INSERT INTO `oc_zone` VALUES (905,57,'83',1);
INSERT INTO `oc_zone` VALUES (906,57,'FO',1);
INSERT INTO `oc_zone` VALUES (907,57,'84',1);
INSERT INTO `oc_zone` VALUES (908,57,'85',1);
INSERT INTO `oc_zone` VALUES (919,58,'S',1);
INSERT INTO `oc_zone` VALUES (920,58,'K',1);
INSERT INTO `oc_zone` VALUES (921,58,'J',1);
INSERT INTO `oc_zone` VALUES (922,58,'O',1);
INSERT INTO `oc_zone` VALUES (923,58,'T',1);
INSERT INTO `oc_zone` VALUES (924,59,'AND',1);
INSERT INTO `oc_zone` VALUES (925,59,'DAV',1);
INSERT INTO `oc_zone` VALUES (926,59,'GEO',1);
INSERT INTO `oc_zone` VALUES (927,59,'JOH',1);
INSERT INTO `oc_zone` VALUES (928,59,'JOS',1);
INSERT INTO `oc_zone` VALUES (929,59,'LUK',1);
INSERT INTO `oc_zone` VALUES (930,59,'MAR',1);
INSERT INTO `oc_zone` VALUES (931,59,'PAT',1);
INSERT INTO `oc_zone` VALUES (932,59,'PAU',1);
INSERT INTO `oc_zone` VALUES (933,59,'PET',1);
INSERT INTO `oc_zone` VALUES (934,60,'DN',1);
INSERT INTO `oc_zone` VALUES (935,60,'AZ',1);
INSERT INTO `oc_zone` VALUES (936,60,'BC',1);
INSERT INTO `oc_zone` VALUES (937,60,'BH',1);
INSERT INTO `oc_zone` VALUES (938,60,'DJ',1);
INSERT INTO `oc_zone` VALUES (939,60,'DU',1);
INSERT INTO `oc_zone` VALUES (940,60,'EL',1);
INSERT INTO `oc_zone` VALUES (941,60,'SY',1);
INSERT INTO `oc_zone` VALUES (942,60,'ET',1);
INSERT INTO `oc_zone` VALUES (943,60,'HM',1);
INSERT INTO `oc_zone` VALUES (944,60,'IN',1);
INSERT INTO `oc_zone` VALUES (945,60,'AL',1);
INSERT INTO `oc_zone` VALUES (946,60,'RO',1);
INSERT INTO `oc_zone` VALUES (947,60,'VE',1);
INSERT INTO `oc_zone` VALUES (948,60,'MT',1);
INSERT INTO `oc_zone` VALUES (949,60,'MN',1);
INSERT INTO `oc_zone` VALUES (950,60,'MC',1);
INSERT INTO `oc_zone` VALUES (951,60,'MP',1);
INSERT INTO `oc_zone` VALUES (952,60,'PD',1);
INSERT INTO `oc_zone` VALUES (953,60,'PR',1);
INSERT INTO `oc_zone` VALUES (954,60,'PP',1);
INSERT INTO `oc_zone` VALUES (955,60,'SL',1);
INSERT INTO `oc_zone` VALUES (956,60,'SM',1);
INSERT INTO `oc_zone` VALUES (957,60,'SH',1);
INSERT INTO `oc_zone` VALUES (958,60,'SC',1);
INSERT INTO `oc_zone` VALUES (959,60,'JO',1);
INSERT INTO `oc_zone` VALUES (960,60,'SJ',1);
INSERT INTO `oc_zone` VALUES (961,60,'PM',1);
INSERT INTO `oc_zone` VALUES (962,60,'SA',1);
INSERT INTO `oc_zone` VALUES (963,60,'ST',1);
INSERT INTO `oc_zone` VALUES (964,60,'SD',1);
INSERT INTO `oc_zone` VALUES (965,60,'VA',1);
INSERT INTO `oc_zone` VALUES (966,61,'AL',1);
INSERT INTO `oc_zone` VALUES (967,61,'AN',1);
INSERT INTO `oc_zone` VALUES (968,61,'BA',1);
INSERT INTO `oc_zone` VALUES (969,61,'BO',1);
INSERT INTO `oc_zone` VALUES (970,61,'CO',1);
INSERT INTO `oc_zone` VALUES (971,61,'DI',1);
INSERT INTO `oc_zone` VALUES (972,61,'ER',1);
INSERT INTO `oc_zone` VALUES (973,61,'LA',1);
INSERT INTO `oc_zone` VALUES (974,61,'LI',1);
INSERT INTO `oc_zone` VALUES (975,61,'MT',1);
INSERT INTO `oc_zone` VALUES (976,61,'MF',1);
INSERT INTO `oc_zone` VALUES (977,61,'OE',1);
INSERT INTO `oc_zone` VALUES (978,61,'VI',1);
INSERT INTO `oc_zone` VALUES (979,62,'AZU',1);
INSERT INTO `oc_zone` VALUES (980,62,'BOL',1);
INSERT INTO `oc_zone` VALUES (981,62,'CAN',1);
INSERT INTO `oc_zone` VALUES (982,62,'CAR',1);
INSERT INTO `oc_zone` VALUES (983,62,'CHI',1);
INSERT INTO `oc_zone` VALUES (984,62,'COT',1);
INSERT INTO `oc_zone` VALUES (985,62,'EOR',1);
INSERT INTO `oc_zone` VALUES (986,62,'ESM',1);
INSERT INTO `oc_zone` VALUES (987,62,'GPS',1);
INSERT INTO `oc_zone` VALUES (988,62,'GUA',1);
INSERT INTO `oc_zone` VALUES (989,62,'IMB',1);
INSERT INTO `oc_zone` VALUES (990,62,'LOJ',1);
INSERT INTO `oc_zone` VALUES (991,62,'LRO',1);
INSERT INTO `oc_zone` VALUES (992,62,'MAN',1);
INSERT INTO `oc_zone` VALUES (993,62,'MSA',1);
INSERT INTO `oc_zone` VALUES (994,62,'NAP',1);
INSERT INTO `oc_zone` VALUES (995,62,'ORE',1);
INSERT INTO `oc_zone` VALUES (996,62,'PAS',1);
INSERT INTO `oc_zone` VALUES (997,62,'PIC',1);
INSERT INTO `oc_zone` VALUES (998,62,'SUC',1);
INSERT INTO `oc_zone` VALUES (999,62,'TUN',1);
INSERT INTO `oc_zone` VALUES (1000,62,'ZCH',1);
INSERT INTO `oc_zone` VALUES (1001,63,'DHY',1);
INSERT INTO `oc_zone` VALUES (1002,63,'BAM',1);
INSERT INTO `oc_zone` VALUES (1003,63,'BHY',1);
INSERT INTO `oc_zone` VALUES (1004,63,'FYM',1);
INSERT INTO `oc_zone` VALUES (1005,63,'GBY',1);
INSERT INTO `oc_zone` VALUES (1006,63,'IDR',1);
INSERT INTO `oc_zone` VALUES (1007,63,'IML',1);
INSERT INTO `oc_zone` VALUES (1008,63,'JZH',1);
INSERT INTO `oc_zone` VALUES (1009,63,'MFY',1);
INSERT INTO `oc_zone` VALUES (1010,63,'MNY',1);
INSERT INTO `oc_zone` VALUES (1011,63,'QHR',1);
INSERT INTO `oc_zone` VALUES (1012,63,'QLY',1);
INSERT INTO `oc_zone` VALUES (1013,63,'WJD',1);
INSERT INTO `oc_zone` VALUES (1014,63,'SHQ',1);
INSERT INTO `oc_zone` VALUES (1015,63,'SWY',1);
INSERT INTO `oc_zone` VALUES (1016,63,'ASW',1);
INSERT INTO `oc_zone` VALUES (1017,63,'ASY',1);
INSERT INTO `oc_zone` VALUES (1018,63,'BSW',1);
INSERT INTO `oc_zone` VALUES (1019,63,'BSD',1);
INSERT INTO `oc_zone` VALUES (1020,63,'DMY',1);
INSERT INTO `oc_zone` VALUES (1021,63,'JNS',1);
INSERT INTO `oc_zone` VALUES (1022,63,'KSH',1);
INSERT INTO `oc_zone` VALUES (1023,63,'MAT',1);
INSERT INTO `oc_zone` VALUES (1024,63,'QIN',1);
INSERT INTO `oc_zone` VALUES (1025,63,'SHS',1);
INSERT INTO `oc_zone` VALUES (1026,63,'SUH',1);
INSERT INTO `oc_zone` VALUES (1027,64,'AH',1);
INSERT INTO `oc_zone` VALUES (1028,64,'CA',1);
INSERT INTO `oc_zone` VALUES (1029,64,'CH',1);
INSERT INTO `oc_zone` VALUES (1030,64,'CU',1);
INSERT INTO `oc_zone` VALUES (1031,64,'LB',1);
INSERT INTO `oc_zone` VALUES (1032,64,'PZ',1);
INSERT INTO `oc_zone` VALUES (1033,64,'UN',1);
INSERT INTO `oc_zone` VALUES (1034,64,'MO',1);
INSERT INTO `oc_zone` VALUES (1035,64,'SM',1);
INSERT INTO `oc_zone` VALUES (1036,64,'SS',1);
INSERT INTO `oc_zone` VALUES (1037,64,'SV',1);
INSERT INTO `oc_zone` VALUES (1038,64,'SA',1);
INSERT INTO `oc_zone` VALUES (1039,64,'SO',1);
INSERT INTO `oc_zone` VALUES (1040,64,'US',1);
INSERT INTO `oc_zone` VALUES (1041,65,'AN',1);
INSERT INTO `oc_zone` VALUES (1042,65,'BN',1);
INSERT INTO `oc_zone` VALUES (1043,65,'BS',1);
INSERT INTO `oc_zone` VALUES (1044,65,'CS',1);
INSERT INTO `oc_zone` VALUES (1045,65,'KN',1);
INSERT INTO `oc_zone` VALUES (1046,65,'LI',1);
INSERT INTO `oc_zone` VALUES (1047,65,'WN',1);
INSERT INTO `oc_zone` VALUES (1048,66,'MA',1);
INSERT INTO `oc_zone` VALUES (1049,66,'KE',1);
INSERT INTO `oc_zone` VALUES (1050,66,'DK',1);
INSERT INTO `oc_zone` VALUES (1051,66,'SK',1);
INSERT INTO `oc_zone` VALUES (1052,66,'DE',1);
INSERT INTO `oc_zone` VALUES (1053,66,'BR',1);
INSERT INTO `oc_zone` VALUES (1054,67,'HA',1);
INSERT INTO `oc_zone` VALUES (1055,67,'HI',1);
INSERT INTO `oc_zone` VALUES (1056,67,'IV',1);
INSERT INTO `oc_zone` VALUES (1057,67,'JA',1);
INSERT INTO `oc_zone` VALUES (1058,67,'JO',1);
INSERT INTO `oc_zone` VALUES (1059,67,'LV',1);
INSERT INTO `oc_zone` VALUES (1060,67,'LA',1);
INSERT INTO `oc_zone` VALUES (1061,67,'PA',1);
INSERT INTO `oc_zone` VALUES (1062,67,'PO',1);
INSERT INTO `oc_zone` VALUES (1063,67,'RA',1);
INSERT INTO `oc_zone` VALUES (1064,67,'SA',1);
INSERT INTO `oc_zone` VALUES (1065,67,'TA',1);
INSERT INTO `oc_zone` VALUES (1066,67,'VA',1);
INSERT INTO `oc_zone` VALUES (1067,67,'VI',1);
INSERT INTO `oc_zone` VALUES (1068,67,'VO',1);
INSERT INTO `oc_zone` VALUES (1069,68,'AF',1);
INSERT INTO `oc_zone` VALUES (1070,68,'AH',1);
INSERT INTO `oc_zone` VALUES (1071,68,'BG',1);
INSERT INTO `oc_zone` VALUES (1072,68,'GB',1);
INSERT INTO `oc_zone` VALUES (1073,68,'HR',1);
INSERT INTO `oc_zone` VALUES (1074,68,'OR',1);
INSERT INTO `oc_zone` VALUES (1075,68,'SM',1);
INSERT INTO `oc_zone` VALUES (1076,68,'SN',1);
INSERT INTO `oc_zone` VALUES (1077,68,'TG',1);
INSERT INTO `oc_zone` VALUES (1078,68,'AA',1);
INSERT INTO `oc_zone` VALUES (1079,68,'DD',1);
INSERT INTO `oc_zone` VALUES (1080,71,'C',1);
INSERT INTO `oc_zone` VALUES (1081,71,'N',1);
INSERT INTO `oc_zone` VALUES (1082,71,'E',1);
INSERT INTO `oc_zone` VALUES (1083,71,'W',1);
INSERT INTO `oc_zone` VALUES (1084,71,'R',1);
INSERT INTO `oc_zone` VALUES (1085,72,'AL',1);
INSERT INTO `oc_zone` VALUES (1086,72,'ES',1);
INSERT INTO `oc_zone` VALUES (1087,72,'IS',1);
INSERT INTO `oc_zone` VALUES (1088,72,'LS',1);
INSERT INTO `oc_zone` VALUES (1089,72,'LA',1);
INSERT INTO `oc_zone` VALUES (1090,72,'OU',1);
INSERT INTO `oc_zone` VALUES (1114,74,'01',1);
INSERT INTO `oc_zone` VALUES (1115,74,'02',1);
INSERT INTO `oc_zone` VALUES (1116,74,'03',1);
INSERT INTO `oc_zone` VALUES (1117,74,'04',1);
INSERT INTO `oc_zone` VALUES (1118,74,'05',1);
INSERT INTO `oc_zone` VALUES (1119,74,'06',1);
INSERT INTO `oc_zone` VALUES (1120,74,'07',1);
INSERT INTO `oc_zone` VALUES (1121,74,'08',1);
INSERT INTO `oc_zone` VALUES (1122,74,'09',1);
INSERT INTO `oc_zone` VALUES (1123,74,'10',1);
INSERT INTO `oc_zone` VALUES (1124,74,'11',1);
INSERT INTO `oc_zone` VALUES (1125,74,'12',1);
INSERT INTO `oc_zone` VALUES (1126,74,'13',1);
INSERT INTO `oc_zone` VALUES (1127,74,'14',1);
INSERT INTO `oc_zone` VALUES (1128,74,'15',1);
INSERT INTO `oc_zone` VALUES (1129,74,'16',1);
INSERT INTO `oc_zone` VALUES (1130,74,'17',1);
INSERT INTO `oc_zone` VALUES (1131,74,'18',1);
INSERT INTO `oc_zone` VALUES (1132,74,'19',1);
INSERT INTO `oc_zone` VALUES (1133,74,'2A',1);
INSERT INTO `oc_zone` VALUES (1134,74,'2B',1);
INSERT INTO `oc_zone` VALUES (1135,74,'21',1);
INSERT INTO `oc_zone` VALUES (1136,74,'22',1);
INSERT INTO `oc_zone` VALUES (1137,74,'23',1);
INSERT INTO `oc_zone` VALUES (1138,74,'24',1);
INSERT INTO `oc_zone` VALUES (1139,74,'25',1);
INSERT INTO `oc_zone` VALUES (1140,74,'26',1);
INSERT INTO `oc_zone` VALUES (1141,74,'27',1);
INSERT INTO `oc_zone` VALUES (1142,74,'28',1);
INSERT INTO `oc_zone` VALUES (1143,74,'29',1);
INSERT INTO `oc_zone` VALUES (1144,74,'30',1);
INSERT INTO `oc_zone` VALUES (1145,74,'31',1);
INSERT INTO `oc_zone` VALUES (1146,74,'32',1);
INSERT INTO `oc_zone` VALUES (1147,74,'33',1);
INSERT INTO `oc_zone` VALUES (1148,74,'34',1);
INSERT INTO `oc_zone` VALUES (1149,74,'35',1);
INSERT INTO `oc_zone` VALUES (1150,74,'36',1);
INSERT INTO `oc_zone` VALUES (1151,74,'37',1);
INSERT INTO `oc_zone` VALUES (1152,74,'38',1);
INSERT INTO `oc_zone` VALUES (1153,74,'39',1);
INSERT INTO `oc_zone` VALUES (1154,74,'40',1);
INSERT INTO `oc_zone` VALUES (1155,74,'41',1);
INSERT INTO `oc_zone` VALUES (1156,74,'42',1);
INSERT INTO `oc_zone` VALUES (1157,74,'43',1);
INSERT INTO `oc_zone` VALUES (1158,74,'44',1);
INSERT INTO `oc_zone` VALUES (1159,74,'45',1);
INSERT INTO `oc_zone` VALUES (1160,74,'46',1);
INSERT INTO `oc_zone` VALUES (1161,74,'47',1);
INSERT INTO `oc_zone` VALUES (1162,74,'48',1);
INSERT INTO `oc_zone` VALUES (1163,74,'49',1);
INSERT INTO `oc_zone` VALUES (1164,74,'50',1);
INSERT INTO `oc_zone` VALUES (1165,74,'51',1);
INSERT INTO `oc_zone` VALUES (1166,74,'52',1);
INSERT INTO `oc_zone` VALUES (1167,74,'53',1);
INSERT INTO `oc_zone` VALUES (1168,74,'54',1);
INSERT INTO `oc_zone` VALUES (1169,74,'55',1);
INSERT INTO `oc_zone` VALUES (1170,74,'56',1);
INSERT INTO `oc_zone` VALUES (1171,74,'57',1);
INSERT INTO `oc_zone` VALUES (1172,74,'58',1);
INSERT INTO `oc_zone` VALUES (1173,74,'59',1);
INSERT INTO `oc_zone` VALUES (1174,74,'60',1);
INSERT INTO `oc_zone` VALUES (1175,74,'61',1);
INSERT INTO `oc_zone` VALUES (1176,74,'62',1);
INSERT INTO `oc_zone` VALUES (1177,74,'63',1);
INSERT INTO `oc_zone` VALUES (1178,74,'64',1);
INSERT INTO `oc_zone` VALUES (1179,74,'65',1);
INSERT INTO `oc_zone` VALUES (1180,74,'66',1);
INSERT INTO `oc_zone` VALUES (1181,74,'67',1);
INSERT INTO `oc_zone` VALUES (1182,74,'68',1);
INSERT INTO `oc_zone` VALUES (1183,74,'69',1);
INSERT INTO `oc_zone` VALUES (1184,74,'70',1);
INSERT INTO `oc_zone` VALUES (1185,74,'71',1);
INSERT INTO `oc_zone` VALUES (1186,74,'72',1);
INSERT INTO `oc_zone` VALUES (1187,74,'73',1);
INSERT INTO `oc_zone` VALUES (1188,74,'74',1);
INSERT INTO `oc_zone` VALUES (1189,74,'75',1);
INSERT INTO `oc_zone` VALUES (1190,74,'76',1);
INSERT INTO `oc_zone` VALUES (1191,74,'77',1);
INSERT INTO `oc_zone` VALUES (1192,74,'78',1);
INSERT INTO `oc_zone` VALUES (1193,74,'79',1);
INSERT INTO `oc_zone` VALUES (1194,74,'80',1);
INSERT INTO `oc_zone` VALUES (1195,74,'81',1);
INSERT INTO `oc_zone` VALUES (1196,74,'82',1);
INSERT INTO `oc_zone` VALUES (1197,74,'83',1);
INSERT INTO `oc_zone` VALUES (1198,74,'84',1);
INSERT INTO `oc_zone` VALUES (1199,74,'85',1);
INSERT INTO `oc_zone` VALUES (1200,74,'86',1);
INSERT INTO `oc_zone` VALUES (1201,74,'87',1);
INSERT INTO `oc_zone` VALUES (1202,74,'88',1);
INSERT INTO `oc_zone` VALUES (1203,74,'89',1);
INSERT INTO `oc_zone` VALUES (1204,74,'90',1);
INSERT INTO `oc_zone` VALUES (1205,74,'91',1);
INSERT INTO `oc_zone` VALUES (1206,74,'92',1);
INSERT INTO `oc_zone` VALUES (1207,74,'93',1);
INSERT INTO `oc_zone` VALUES (1208,74,'94',1);
INSERT INTO `oc_zone` VALUES (1209,74,'95',1);
INSERT INTO `oc_zone` VALUES (1210,76,'M',1);
INSERT INTO `oc_zone` VALUES (1211,76,'T',1);
INSERT INTO `oc_zone` VALUES (1212,76,'I',1);
INSERT INTO `oc_zone` VALUES (1213,76,'V',1);
INSERT INTO `oc_zone` VALUES (1214,76,'S',1);
INSERT INTO `oc_zone` VALUES (1215,77,'C',1);
INSERT INTO `oc_zone` VALUES (1216,77,'K',1);
INSERT INTO `oc_zone` VALUES (1217,77,'A',1);
INSERT INTO `oc_zone` VALUES (1218,77,'P',1);
INSERT INTO `oc_zone` VALUES (1219,77,'D',1);
INSERT INTO `oc_zone` VALUES (1220,78,'ES',1);
INSERT INTO `oc_zone` VALUES (1221,78,'HO',1);
INSERT INTO `oc_zone` VALUES (1222,78,'MO',1);
INSERT INTO `oc_zone` VALUES (1223,78,'NG',1);
INSERT INTO `oc_zone` VALUES (1224,78,'NY',1);
INSERT INTO `oc_zone` VALUES (1225,78,'OI',1);
INSERT INTO `oc_zone` VALUES (1226,78,'OL',1);
INSERT INTO `oc_zone` VALUES (1227,78,'OM',1);
INSERT INTO `oc_zone` VALUES (1228,78,'WN',1);
INSERT INTO `oc_zone` VALUES (1229,79,'BJ',1);
INSERT INTO `oc_zone` VALUES (1230,79,'BS',1);
INSERT INTO `oc_zone` VALUES (1231,79,'BR',1);
INSERT INTO `oc_zone` VALUES (1232,79,'JA',1);
INSERT INTO `oc_zone` VALUES (1233,79,'KA',1);
INSERT INTO `oc_zone` VALUES (1234,79,'KE',1);
INSERT INTO `oc_zone` VALUES (1235,79,'KU',1);
INSERT INTO `oc_zone` VALUES (1236,79,'MA',1);
INSERT INTO `oc_zone` VALUES (1237,79,'LR',1);
INSERT INTO `oc_zone` VALUES (1238,79,'CR',1);
INSERT INTO `oc_zone` VALUES (1239,79,'NB',1);
INSERT INTO `oc_zone` VALUES (1240,79,'UR',1);
INSERT INTO `oc_zone` VALUES (1241,79,'WE',1);
INSERT INTO `oc_zone` VALUES (1242,80,'AB',1);
INSERT INTO `oc_zone` VALUES (1243,80,'AJ',1);
INSERT INTO `oc_zone` VALUES (1244,80,'TB',1);
INSERT INTO `oc_zone` VALUES (1245,80,'GU',1);
INSERT INTO `oc_zone` VALUES (1246,80,'IM',1);
INSERT INTO `oc_zone` VALUES (1247,80,'KA',1);
INSERT INTO `oc_zone` VALUES (1248,80,'KK',1);
INSERT INTO `oc_zone` VALUES (1249,80,'MM',1);
INSERT INTO `oc_zone` VALUES (1250,80,'RL',1);
INSERT INTO `oc_zone` VALUES (1251,80,'SZ',1);
INSERT INTO `oc_zone` VALUES (1252,80,'SJ',1);
INSERT INTO `oc_zone` VALUES (1253,80,'SK',1);
INSERT INTO `oc_zone` VALUES (1254,81,'BW',1);
INSERT INTO `oc_zone` VALUES (1255,81,'BY',1);
INSERT INTO `oc_zone` VALUES (1256,81,'BE',1);
INSERT INTO `oc_zone` VALUES (1257,81,'BB',1);
INSERT INTO `oc_zone` VALUES (1258,81,'HB',1);
INSERT INTO `oc_zone` VALUES (1259,81,'HH',1);
INSERT INTO `oc_zone` VALUES (1260,81,'HE',1);
INSERT INTO `oc_zone` VALUES (1261,81,'MV',1);
INSERT INTO `oc_zone` VALUES (1262,81,'NI',1);
INSERT INTO `oc_zone` VALUES (1263,81,'NW',1);
INSERT INTO `oc_zone` VALUES (1264,81,'RP',1);
INSERT INTO `oc_zone` VALUES (1265,81,'SL',1);
INSERT INTO `oc_zone` VALUES (1266,81,'SN',1);
INSERT INTO `oc_zone` VALUES (1267,81,'ST',1);
INSERT INTO `oc_zone` VALUES (1268,81,'SH',1);
INSERT INTO `oc_zone` VALUES (1269,81,'TH',1);
INSERT INTO `oc_zone` VALUES (1270,82,'AS',1);
INSERT INTO `oc_zone` VALUES (1271,82,'BA',1);
INSERT INTO `oc_zone` VALUES (1272,82,'CE',1);
INSERT INTO `oc_zone` VALUES (1273,82,'EA',1);
INSERT INTO `oc_zone` VALUES (1274,82,'GA',1);
INSERT INTO `oc_zone` VALUES (1275,82,'NO',1);
INSERT INTO `oc_zone` VALUES (1276,82,'UE',1);
INSERT INTO `oc_zone` VALUES (1277,82,'UW',1);
INSERT INTO `oc_zone` VALUES (1278,82,'VO',1);
INSERT INTO `oc_zone` VALUES (1279,82,'WE',1);
INSERT INTO `oc_zone` VALUES (1280,84,'AT',1);
INSERT INTO `oc_zone` VALUES (1281,84,'CN',1);
INSERT INTO `oc_zone` VALUES (1282,84,'CM',1);
INSERT INTO `oc_zone` VALUES (1283,84,'CR',1);
INSERT INTO `oc_zone` VALUES (1284,84,'EM',1);
INSERT INTO `oc_zone` VALUES (1285,84,'EP',1);
INSERT INTO `oc_zone` VALUES (1286,84,'II',1);
INSERT INTO `oc_zone` VALUES (1287,84,'NA',1);
INSERT INTO `oc_zone` VALUES (1288,84,'PP',1);
INSERT INTO `oc_zone` VALUES (1289,84,'SA',1);
INSERT INTO `oc_zone` VALUES (1290,84,'TH',1);
INSERT INTO `oc_zone` VALUES (1291,84,'WG',1);
INSERT INTO `oc_zone` VALUES (1292,84,'WM',1);
INSERT INTO `oc_zone` VALUES (1293,85,'A',1);
INSERT INTO `oc_zone` VALUES (1294,85,'T',1);
INSERT INTO `oc_zone` VALUES (1295,85,'K',1);
INSERT INTO `oc_zone` VALUES (1296,86,'A',1);
INSERT INTO `oc_zone` VALUES (1297,86,'D',1);
INSERT INTO `oc_zone` VALUES (1298,86,'G',1);
INSERT INTO `oc_zone` VALUES (1299,86,'J',1);
INSERT INTO `oc_zone` VALUES (1300,86,'M',1);
INSERT INTO `oc_zone` VALUES (1301,86,'P',1);
INSERT INTO `oc_zone` VALUES (1302,86,'C',1);
INSERT INTO `oc_zone` VALUES (1303,86,'Q',1);
INSERT INTO `oc_zone` VALUES (1304,89,'AV',1);
INSERT INTO `oc_zone` VALUES (1305,89,'BV',1);
INSERT INTO `oc_zone` VALUES (1306,89,'CM',1);
INSERT INTO `oc_zone` VALUES (1307,89,'CQ',1);
INSERT INTO `oc_zone` VALUES (1308,89,'PE',1);
INSERT INTO `oc_zone` VALUES (1309,89,'PR',1);
INSERT INTO `oc_zone` VALUES (1310,89,'QC',1);
INSERT INTO `oc_zone` VALUES (1311,89,'ES',1);
INSERT INTO `oc_zone` VALUES (1312,89,'GU',1);
INSERT INTO `oc_zone` VALUES (1313,89,'HU',1);
INSERT INTO `oc_zone` VALUES (1314,89,'IZ',1);
INSERT INTO `oc_zone` VALUES (1315,89,'JA',1);
INSERT INTO `oc_zone` VALUES (1316,89,'JU',1);
INSERT INTO `oc_zone` VALUES (1317,89,'QZ',1);
INSERT INTO `oc_zone` VALUES (1318,89,'RE',1);
INSERT INTO `oc_zone` VALUES (1319,89,'ST',1);
INSERT INTO `oc_zone` VALUES (1320,89,'SM',1);
INSERT INTO `oc_zone` VALUES (1321,89,'SR',1);
INSERT INTO `oc_zone` VALUES (1322,89,'SO',1);
INSERT INTO `oc_zone` VALUES (1323,89,'SU',1);
INSERT INTO `oc_zone` VALUES (1324,89,'TO',1);
INSERT INTO `oc_zone` VALUES (1325,89,'ZA',1);
INSERT INTO `oc_zone` VALUES (1326,90,'CNK',1);
INSERT INTO `oc_zone` VALUES (1327,90,'BYL',1);
INSERT INTO `oc_zone` VALUES (1328,90,'BFA',1);
INSERT INTO `oc_zone` VALUES (1329,90,'BOK',1);
INSERT INTO `oc_zone` VALUES (1330,90,'COY',1);
INSERT INTO `oc_zone` VALUES (1331,90,'DBL',1);
INSERT INTO `oc_zone` VALUES (1332,90,'DLB',1);
INSERT INTO `oc_zone` VALUES (1333,90,'DGR',1);
INSERT INTO `oc_zone` VALUES (1334,90,'DBR',1);
INSERT INTO `oc_zone` VALUES (1335,90,'FRN',1);
INSERT INTO `oc_zone` VALUES (1336,90,'FRC',1);
INSERT INTO `oc_zone` VALUES (1337,90,'FRI',1);
INSERT INTO `oc_zone` VALUES (1338,90,'GAO',1);
INSERT INTO `oc_zone` VALUES (1339,90,'GCD',1);
INSERT INTO `oc_zone` VALUES (1340,90,'KNK',1);
INSERT INTO `oc_zone` VALUES (1341,90,'KRN',1);
INSERT INTO `oc_zone` VALUES (1342,90,'KND',1);
INSERT INTO `oc_zone` VALUES (1343,90,'KSD',1);
INSERT INTO `oc_zone` VALUES (1344,90,'KBA',1);
INSERT INTO `oc_zone` VALUES (1345,90,'KDA',1);
INSERT INTO `oc_zone` VALUES (1346,90,'KRA',1);
INSERT INTO `oc_zone` VALUES (1347,90,'LAB',1);
INSERT INTO `oc_zone` VALUES (1348,90,'LLM',1);
INSERT INTO `oc_zone` VALUES (1349,90,'LOL',1);
INSERT INTO `oc_zone` VALUES (1350,90,'MCT',1);
INSERT INTO `oc_zone` VALUES (1351,90,'MAL',1);
INSERT INTO `oc_zone` VALUES (1352,90,'MAM',1);
INSERT INTO `oc_zone` VALUES (1353,90,'MAN',1);
INSERT INTO `oc_zone` VALUES (1354,90,'NZR',1);
INSERT INTO `oc_zone` VALUES (1355,90,'PIT',1);
INSERT INTO `oc_zone` VALUES (1356,90,'SIG',1);
INSERT INTO `oc_zone` VALUES (1357,90,'TLM',1);
INSERT INTO `oc_zone` VALUES (1358,90,'TOG',1);
INSERT INTO `oc_zone` VALUES (1359,90,'YOM',1);
INSERT INTO `oc_zone` VALUES (1360,91,'BF',1);
INSERT INTO `oc_zone` VALUES (1361,91,'BB',1);
INSERT INTO `oc_zone` VALUES (1362,91,'BS',1);
INSERT INTO `oc_zone` VALUES (1363,91,'BL',1);
INSERT INTO `oc_zone` VALUES (1364,91,'CA',1);
INSERT INTO `oc_zone` VALUES (1365,91,'GA',1);
INSERT INTO `oc_zone` VALUES (1366,91,'OI',1);
INSERT INTO `oc_zone` VALUES (1367,91,'QU',1);
INSERT INTO `oc_zone` VALUES (1368,91,'TO',1);
INSERT INTO `oc_zone` VALUES (1369,92,'BW',1);
INSERT INTO `oc_zone` VALUES (1370,92,'CM',1);
INSERT INTO `oc_zone` VALUES (1371,92,'DM',1);
INSERT INTO `oc_zone` VALUES (1372,92,'EC',1);
INSERT INTO `oc_zone` VALUES (1373,92,'EW',1);
INSERT INTO `oc_zone` VALUES (1374,92,'MB',1);
INSERT INTO `oc_zone` VALUES (1375,92,'PM',1);
INSERT INTO `oc_zone` VALUES (1376,92,'PI',1);
INSERT INTO `oc_zone` VALUES (1377,92,'UD',1);
INSERT INTO `oc_zone` VALUES (1378,92,'UT',1);
INSERT INTO `oc_zone` VALUES (1379,93,'AR',1);
INSERT INTO `oc_zone` VALUES (1380,93,'CE',1);
INSERT INTO `oc_zone` VALUES (1381,93,'GA',1);
INSERT INTO `oc_zone` VALUES (1382,93,'ND',1);
INSERT INTO `oc_zone` VALUES (1383,93,'NE',1);
INSERT INTO `oc_zone` VALUES (1384,93,'NO',1);
INSERT INTO `oc_zone` VALUES (1385,93,'OU',1);
INSERT INTO `oc_zone` VALUES (1386,93,'SD',1);
INSERT INTO `oc_zone` VALUES (1387,93,'SE',1);
INSERT INTO `oc_zone` VALUES (1388,94,'F',1);
INSERT INTO `oc_zone` VALUES (1389,94,'M',1);
INSERT INTO `oc_zone` VALUES (1390,94,'S',1);
INSERT INTO `oc_zone` VALUES (1391,94,'H',1);
INSERT INTO `oc_zone` VALUES (1392,95,'AT',1);
INSERT INTO `oc_zone` VALUES (1393,95,'CH',1);
INSERT INTO `oc_zone` VALUES (1394,95,'CL',1);
INSERT INTO `oc_zone` VALUES (1395,95,'CM',1);
INSERT INTO `oc_zone` VALUES (1396,95,'CP',1);
INSERT INTO `oc_zone` VALUES (1397,95,'CR',1);
INSERT INTO `oc_zone` VALUES (1398,95,'PA',1);
INSERT INTO `oc_zone` VALUES (1399,95,'FM',1);
INSERT INTO `oc_zone` VALUES (1400,95,'GD',1);
INSERT INTO `oc_zone` VALUES (1401,95,'IN',1);
INSERT INTO `oc_zone` VALUES (1402,95,'IB',1);
INSERT INTO `oc_zone` VALUES (1403,95,'PZ',1);
INSERT INTO `oc_zone` VALUES (1404,95,'LE',1);
INSERT INTO `oc_zone` VALUES (1405,95,'OC',1);
INSERT INTO `oc_zone` VALUES (1406,95,'OL',1);
INSERT INTO `oc_zone` VALUES (1407,95,'SB',1);
INSERT INTO `oc_zone` VALUES (1408,95,'VA',1);
INSERT INTO `oc_zone` VALUES (1409,95,'YO',1);
INSERT INTO `oc_zone` VALUES (1410,96,'HCW',1);
INSERT INTO `oc_zone` VALUES (1411,96,'HEA',1);
INSERT INTO `oc_zone` VALUES (1412,96,'HSO',1);
INSERT INTO `oc_zone` VALUES (1413,96,'HWC',1);
INSERT INTO `oc_zone` VALUES (1414,96,'KKC',1);
INSERT INTO `oc_zone` VALUES (1415,96,'KKT',1);
INSERT INTO `oc_zone` VALUES (1416,96,'KSS',1);
INSERT INTO `oc_zone` VALUES (1417,96,'KWT',1);
INSERT INTO `oc_zone` VALUES (1418,96,'KYT',1);
INSERT INTO `oc_zone` VALUES (1419,96,'NIS',1);
INSERT INTO `oc_zone` VALUES (1420,96,'NKT',1);
INSERT INTO `oc_zone` VALUES (1421,96,'NNO',1);
INSERT INTO `oc_zone` VALUES (1422,96,'NSK',1);
INSERT INTO `oc_zone` VALUES (1423,96,'NST',1);
INSERT INTO `oc_zone` VALUES (1424,96,'NTP',1);
INSERT INTO `oc_zone` VALUES (1425,96,'NTW',1);
INSERT INTO `oc_zone` VALUES (1426,96,'NTM',1);
INSERT INTO `oc_zone` VALUES (1427,96,'NYL',1);
INSERT INTO `oc_zone` VALUES (1467,98,'AL',1);
INSERT INTO `oc_zone` VALUES (1468,98,'HF',1);
INSERT INTO `oc_zone` VALUES (1469,98,'NE',1);
INSERT INTO `oc_zone` VALUES (1470,98,'NV',1);
INSERT INTO `oc_zone` VALUES (1471,98,'SL',1);
INSERT INTO `oc_zone` VALUES (1472,98,'SN',1);
INSERT INTO `oc_zone` VALUES (1473,98,'VF',1);
INSERT INTO `oc_zone` VALUES (1474,98,'VL',1);
INSERT INTO `oc_zone` VALUES (1475,99,'AN',1);
INSERT INTO `oc_zone` VALUES (1476,99,'AP',1);
INSERT INTO `oc_zone` VALUES (1477,99,'AR',1);
INSERT INTO `oc_zone` VALUES (1478,99,'AS',1);
INSERT INTO `oc_zone` VALUES (1479,99,'BR',1);
INSERT INTO `oc_zone` VALUES (1480,99,'CH',1);
INSERT INTO `oc_zone` VALUES (1481,99,'DH',1);
INSERT INTO `oc_zone` VALUES (1483,99,'DL',1);
INSERT INTO `oc_zone` VALUES (1484,99,'GA',1);
INSERT INTO `oc_zone` VALUES (1485,99,'GJ',1);
INSERT INTO `oc_zone` VALUES (1486,99,'HR',1);
INSERT INTO `oc_zone` VALUES (1487,99,'HP',1);
INSERT INTO `oc_zone` VALUES (1488,99,'JK',1);
INSERT INTO `oc_zone` VALUES (1489,99,'KA',1);
INSERT INTO `oc_zone` VALUES (1490,99,'KL',1);
INSERT INTO `oc_zone` VALUES (1491,99,'LD',1);
INSERT INTO `oc_zone` VALUES (1492,99,'MP',1);
INSERT INTO `oc_zone` VALUES (1493,99,'MH',1);
INSERT INTO `oc_zone` VALUES (1494,99,'MN',1);
INSERT INTO `oc_zone` VALUES (1495,99,'ML',1);
INSERT INTO `oc_zone` VALUES (1496,99,'MZ',1);
INSERT INTO `oc_zone` VALUES (1497,99,'NL',1);
INSERT INTO `oc_zone` VALUES (1498,99,'OR',1);
INSERT INTO `oc_zone` VALUES (1499,99,'PY',1);
INSERT INTO `oc_zone` VALUES (1500,99,'PB',1);
INSERT INTO `oc_zone` VALUES (1501,99,'RJ',1);
INSERT INTO `oc_zone` VALUES (1502,99,'SK',1);
INSERT INTO `oc_zone` VALUES (1503,99,'TN',1);
INSERT INTO `oc_zone` VALUES (1504,99,'TR',1);
INSERT INTO `oc_zone` VALUES (1505,99,'UP',1);
INSERT INTO `oc_zone` VALUES (1506,99,'WB',1);
INSERT INTO `oc_zone` VALUES (1507,100,'AC',1);
INSERT INTO `oc_zone` VALUES (1508,100,'BA',1);
INSERT INTO `oc_zone` VALUES (1509,100,'BT',1);
INSERT INTO `oc_zone` VALUES (1510,100,'BE',1);
INSERT INTO `oc_zone` VALUES (1511,100,'BD',1);
INSERT INTO `oc_zone` VALUES (1512,100,'GO',1);
INSERT INTO `oc_zone` VALUES (1513,100,'JK',1);
INSERT INTO `oc_zone` VALUES (1514,100,'JA',1);
INSERT INTO `oc_zone` VALUES (1515,100,'JB',1);
INSERT INTO `oc_zone` VALUES (1516,100,'JT',1);
INSERT INTO `oc_zone` VALUES (1517,100,'JI',1);
INSERT INTO `oc_zone` VALUES (1518,100,'KB',1);
INSERT INTO `oc_zone` VALUES (1519,100,'KS',1);
INSERT INTO `oc_zone` VALUES (1520,100,'KT',1);
INSERT INTO `oc_zone` VALUES (1521,100,'KI',1);
INSERT INTO `oc_zone` VALUES (1522,100,'BB',1);
INSERT INTO `oc_zone` VALUES (1523,100,'LA',1);
INSERT INTO `oc_zone` VALUES (1524,100,'MA',1);
INSERT INTO `oc_zone` VALUES (1525,100,'MU',1);
INSERT INTO `oc_zone` VALUES (1526,100,'NB',1);
INSERT INTO `oc_zone` VALUES (1527,100,'NT',1);
INSERT INTO `oc_zone` VALUES (1528,100,'PA',1);
INSERT INTO `oc_zone` VALUES (1529,100,'RI',1);
INSERT INTO `oc_zone` VALUES (1530,100,'SN',1);
INSERT INTO `oc_zone` VALUES (1531,100,'ST',1);
INSERT INTO `oc_zone` VALUES (1532,100,'SG',1);
INSERT INTO `oc_zone` VALUES (1533,100,'SA',1);
INSERT INTO `oc_zone` VALUES (1534,100,'SB',1);
INSERT INTO `oc_zone` VALUES (1535,100,'SS',1);
INSERT INTO `oc_zone` VALUES (1536,100,'SU',1);
INSERT INTO `oc_zone` VALUES (1537,100,'YO',1);
INSERT INTO `oc_zone` VALUES (1538,101,'TEH',1);
INSERT INTO `oc_zone` VALUES (1539,101,'QOM',1);
INSERT INTO `oc_zone` VALUES (1540,101,'MKZ',1);
INSERT INTO `oc_zone` VALUES (1541,101,'QAZ',1);
INSERT INTO `oc_zone` VALUES (1542,101,'GIL',1);
INSERT INTO `oc_zone` VALUES (1543,101,'ARD',1);
INSERT INTO `oc_zone` VALUES (1544,101,'ZAN',1);
INSERT INTO `oc_zone` VALUES (1545,101,'EAZ',1);
INSERT INTO `oc_zone` VALUES (1546,101,'WEZ',1);
INSERT INTO `oc_zone` VALUES (1547,101,'KRD',1);
INSERT INTO `oc_zone` VALUES (1548,101,'HMD',1);
INSERT INTO `oc_zone` VALUES (1549,101,'KRM',1);
INSERT INTO `oc_zone` VALUES (1550,101,'ILM',1);
INSERT INTO `oc_zone` VALUES (1551,101,'LRS',1);
INSERT INTO `oc_zone` VALUES (1552,101,'KZT',1);
INSERT INTO `oc_zone` VALUES (1553,101,'CMB',1);
INSERT INTO `oc_zone` VALUES (1554,101,'KBA',1);
INSERT INTO `oc_zone` VALUES (1555,101,'BSH',1);
INSERT INTO `oc_zone` VALUES (1556,101,'FAR',1);
INSERT INTO `oc_zone` VALUES (1557,101,'HRM',1);
INSERT INTO `oc_zone` VALUES (1558,101,'SBL',1);
INSERT INTO `oc_zone` VALUES (1559,101,'KRB',1);
INSERT INTO `oc_zone` VALUES (1560,101,'YZD',1);
INSERT INTO `oc_zone` VALUES (1561,101,'EFH',1);
INSERT INTO `oc_zone` VALUES (1562,101,'SMN',1);
INSERT INTO `oc_zone` VALUES (1563,101,'MZD',1);
INSERT INTO `oc_zone` VALUES (1564,101,'GLS',1);
INSERT INTO `oc_zone` VALUES (1565,101,'NKH',1);
INSERT INTO `oc_zone` VALUES (1566,101,'RKH',1);
INSERT INTO `oc_zone` VALUES (1567,101,'SKH',1);
INSERT INTO `oc_zone` VALUES (1568,102,'BD',1);
INSERT INTO `oc_zone` VALUES (1569,102,'SD',1);
INSERT INTO `oc_zone` VALUES (1570,102,'DY',1);
INSERT INTO `oc_zone` VALUES (1571,102,'WS',1);
INSERT INTO `oc_zone` VALUES (1572,102,'MY',1);
INSERT INTO `oc_zone` VALUES (1573,102,'BA',1);
INSERT INTO `oc_zone` VALUES (1574,102,'DQ',1);
INSERT INTO `oc_zone` VALUES (1575,102,'MU',1);
INSERT INTO `oc_zone` VALUES (1576,102,'QA',1);
INSERT INTO `oc_zone` VALUES (1577,102,'BB',1);
INSERT INTO `oc_zone` VALUES (1578,102,'KB',1);
INSERT INTO `oc_zone` VALUES (1579,102,'NJ',1);
INSERT INTO `oc_zone` VALUES (1580,102,'AB',1);
INSERT INTO `oc_zone` VALUES (1581,102,'NN',1);
INSERT INTO `oc_zone` VALUES (1582,102,'DH',1);
INSERT INTO `oc_zone` VALUES (1583,102,'AL',1);
INSERT INTO `oc_zone` VALUES (1584,102,'KI',1);
INSERT INTO `oc_zone` VALUES (1585,102,'SL',1);
INSERT INTO `oc_zone` VALUES (1586,103,'CA',1);
INSERT INTO `oc_zone` VALUES (1587,103,'CV',1);
INSERT INTO `oc_zone` VALUES (1588,103,'CL',1);
INSERT INTO `oc_zone` VALUES (1589,103,'CO',1);
INSERT INTO `oc_zone` VALUES (1590,103,'DO',1);
INSERT INTO `oc_zone` VALUES (1591,103,'DU',1);
INSERT INTO `oc_zone` VALUES (1592,103,'GA',1);
INSERT INTO `oc_zone` VALUES (1593,103,'KE',1);
INSERT INTO `oc_zone` VALUES (1594,103,'KI',1);
INSERT INTO `oc_zone` VALUES (1595,103,'KL',1);
INSERT INTO `oc_zone` VALUES (1596,103,'LA',1);
INSERT INTO `oc_zone` VALUES (1597,103,'LE',1);
INSERT INTO `oc_zone` VALUES (1598,103,'LI',1);
INSERT INTO `oc_zone` VALUES (1599,103,'LO',1);
INSERT INTO `oc_zone` VALUES (1600,103,'LU',1);
INSERT INTO `oc_zone` VALUES (1601,103,'MA',1);
INSERT INTO `oc_zone` VALUES (1602,103,'ME',1);
INSERT INTO `oc_zone` VALUES (1603,103,'MO',1);
INSERT INTO `oc_zone` VALUES (1604,103,'OF',1);
INSERT INTO `oc_zone` VALUES (1605,103,'RO',1);
INSERT INTO `oc_zone` VALUES (1606,103,'SL',1);
INSERT INTO `oc_zone` VALUES (1607,103,'TI',1);
INSERT INTO `oc_zone` VALUES (1608,103,'WA',1);
INSERT INTO `oc_zone` VALUES (1609,103,'WE',1);
INSERT INTO `oc_zone` VALUES (1610,103,'WX',1);
INSERT INTO `oc_zone` VALUES (1611,103,'WI',1);
INSERT INTO `oc_zone` VALUES (1612,104,'BS',1);
INSERT INTO `oc_zone` VALUES (1613,104,'BH',1);
INSERT INTO `oc_zone` VALUES (1614,104,'EA',1);
INSERT INTO `oc_zone` VALUES (1615,104,'GA',1);
INSERT INTO `oc_zone` VALUES (1616,104,'HA',1);
INSERT INTO `oc_zone` VALUES (1617,104,'JM',1);
INSERT INTO `oc_zone` VALUES (1618,104,'JE',1);
INSERT INTO `oc_zone` VALUES (1619,104,'NE',1);
INSERT INTO `oc_zone` VALUES (1620,104,'SE',1);
INSERT INTO `oc_zone` VALUES (1621,104,'SH',1);
INSERT INTO `oc_zone` VALUES (1622,104,'TA',1);
INSERT INTO `oc_zone` VALUES (1643,106,'CLA',1);
INSERT INTO `oc_zone` VALUES (1644,106,'HAN',1);
INSERT INTO `oc_zone` VALUES (1645,106,'KIN',1);
INSERT INTO `oc_zone` VALUES (1646,106,'MAN',1);
INSERT INTO `oc_zone` VALUES (1647,106,'POR',1);
INSERT INTO `oc_zone` VALUES (1648,106,'AND',1);
INSERT INTO `oc_zone` VALUES (1649,106,'ANN',1);
INSERT INTO `oc_zone` VALUES (1650,106,'CAT',1);
INSERT INTO `oc_zone` VALUES (1651,106,'ELI',1);
INSERT INTO `oc_zone` VALUES (1652,106,'JAM',1);
INSERT INTO `oc_zone` VALUES (1653,106,'MAR',1);
INSERT INTO `oc_zone` VALUES (1654,106,'THO',1);
INSERT INTO `oc_zone` VALUES (1655,106,'TRL',1);
INSERT INTO `oc_zone` VALUES (1656,106,'WML',1);
INSERT INTO `oc_zone` VALUES (1657,107,'AI',1);
INSERT INTO `oc_zone` VALUES (1658,107,'AK',1);
INSERT INTO `oc_zone` VALUES (1659,107,'AO',1);
INSERT INTO `oc_zone` VALUES (1660,107,'CH',1);
INSERT INTO `oc_zone` VALUES (1661,107,'EH',1);
INSERT INTO `oc_zone` VALUES (1662,107,'FK',1);
INSERT INTO `oc_zone` VALUES (1663,107,'FU',1);
INSERT INTO `oc_zone` VALUES (1664,107,'FS',1);
INSERT INTO `oc_zone` VALUES (1665,107,'GI',1);
INSERT INTO `oc_zone` VALUES (1666,107,'GU',1);
INSERT INTO `oc_zone` VALUES (1667,107,'HI',1);
INSERT INTO `oc_zone` VALUES (1668,107,'HO',1);
INSERT INTO `oc_zone` VALUES (1669,107,'HY',1);
INSERT INTO `oc_zone` VALUES (1670,107,'IB',1);
INSERT INTO `oc_zone` VALUES (1671,107,'IS',1);
INSERT INTO `oc_zone` VALUES (1672,107,'IW',1);
INSERT INTO `oc_zone` VALUES (1673,107,'KA',1);
INSERT INTO `oc_zone` VALUES (1674,107,'KG',1);
INSERT INTO `oc_zone` VALUES (1675,107,'KN',1);
INSERT INTO `oc_zone` VALUES (1676,107,'KO',1);
INSERT INTO `oc_zone` VALUES (1677,107,'KU',1);
INSERT INTO `oc_zone` VALUES (1678,107,'KY',1);
INSERT INTO `oc_zone` VALUES (1679,107,'MI',1);
INSERT INTO `oc_zone` VALUES (1680,107,'MY',1);
INSERT INTO `oc_zone` VALUES (1681,107,'MZ',1);
INSERT INTO `oc_zone` VALUES (1682,107,'NA',1);
INSERT INTO `oc_zone` VALUES (1683,107,'NG',1);
INSERT INTO `oc_zone` VALUES (1684,107,'NR',1);
INSERT INTO `oc_zone` VALUES (1685,107,'NI',1);
INSERT INTO `oc_zone` VALUES (1686,107,'OI',1);
INSERT INTO `oc_zone` VALUES (1687,107,'OK',1);
INSERT INTO `oc_zone` VALUES (1688,107,'ON',1);
INSERT INTO `oc_zone` VALUES (1689,107,'OS',1);
INSERT INTO `oc_zone` VALUES (1690,107,'SA',1);
INSERT INTO `oc_zone` VALUES (1691,107,'SI',1);
INSERT INTO `oc_zone` VALUES (1692,107,'SH',1);
INSERT INTO `oc_zone` VALUES (1693,107,'SM',1);
INSERT INTO `oc_zone` VALUES (1694,107,'SZ',1);
INSERT INTO `oc_zone` VALUES (1695,107,'TO',1);
INSERT INTO `oc_zone` VALUES (1696,107,'TS',1);
INSERT INTO `oc_zone` VALUES (1697,107,'TK',1);
INSERT INTO `oc_zone` VALUES (1698,107,'TT',1);
INSERT INTO `oc_zone` VALUES (1699,107,'TY',1);
INSERT INTO `oc_zone` VALUES (1700,107,'WA',1);
INSERT INTO `oc_zone` VALUES (1701,107,'YA',1);
INSERT INTO `oc_zone` VALUES (1702,107,'YM',1);
INSERT INTO `oc_zone` VALUES (1703,107,'YN',1);
INSERT INTO `oc_zone` VALUES (1704,108,'AM',1);
INSERT INTO `oc_zone` VALUES (1705,108,'AJ',1);
INSERT INTO `oc_zone` VALUES (1706,108,'AA',1);
INSERT INTO `oc_zone` VALUES (1707,108,'AB',1);
INSERT INTO `oc_zone` VALUES (1708,108,'AK',1);
INSERT INTO `oc_zone` VALUES (1709,108,'AL',1);
INSERT INTO `oc_zone` VALUES (1710,108,'AT',1);
INSERT INTO `oc_zone` VALUES (1711,108,'AZ',1);
INSERT INTO `oc_zone` VALUES (1712,108,'IR',1);
INSERT INTO `oc_zone` VALUES (1713,108,'JA',1);
INSERT INTO `oc_zone` VALUES (1714,108,'MA',1);
INSERT INTO `oc_zone` VALUES (1715,108,'MD',1);
INSERT INTO `oc_zone` VALUES (1716,109,'AL',1);
INSERT INTO `oc_zone` VALUES (1717,109,'AC',1);
INSERT INTO `oc_zone` VALUES (1718,109,'AM',1);
INSERT INTO `oc_zone` VALUES (1719,109,'AQ',1);
INSERT INTO `oc_zone` VALUES (1720,109,'AS',1);
INSERT INTO `oc_zone` VALUES (1721,109,'AT',1);
INSERT INTO `oc_zone` VALUES (1722,109,'BA',1);
INSERT INTO `oc_zone` VALUES (1723,109,'BY',1);
INSERT INTO `oc_zone` VALUES (1724,109,'MA',1);
INSERT INTO `oc_zone` VALUES (1725,109,'ON',1);
INSERT INTO `oc_zone` VALUES (1726,109,'PA',1);
INSERT INTO `oc_zone` VALUES (1727,109,'QA',1);
INSERT INTO `oc_zone` VALUES (1728,109,'QO',1);
INSERT INTO `oc_zone` VALUES (1729,109,'QY',1);
INSERT INTO `oc_zone` VALUES (1730,109,'SH',1);
INSERT INTO `oc_zone` VALUES (1731,109,'SO',1);
INSERT INTO `oc_zone` VALUES (1732,109,'ZH',1);
INSERT INTO `oc_zone` VALUES (1733,110,'CE',1);
INSERT INTO `oc_zone` VALUES (1734,110,'CO',1);
INSERT INTO `oc_zone` VALUES (1735,110,'EA',1);
INSERT INTO `oc_zone` VALUES (1736,110,'NA',1);
INSERT INTO `oc_zone` VALUES (1737,110,'NE',1);
INSERT INTO `oc_zone` VALUES (1738,110,'NY',1);
INSERT INTO `oc_zone` VALUES (1739,110,'RV',1);
INSERT INTO `oc_zone` VALUES (1740,110,'WE',1);
INSERT INTO `oc_zone` VALUES (1741,111,'AG',1);
INSERT INTO `oc_zone` VALUES (1742,111,'AM',1);
INSERT INTO `oc_zone` VALUES (1743,111,'AK',1);
INSERT INTO `oc_zone` VALUES (1744,111,'AO',1);
INSERT INTO `oc_zone` VALUES (1745,111,'BA',1);
INSERT INTO `oc_zone` VALUES (1746,111,'BE',1);
INSERT INTO `oc_zone` VALUES (1747,111,'bT',1);
INSERT INTO `oc_zone` VALUES (1748,111,'KA',1);
INSERT INTO `oc_zone` VALUES (1749,111,'KR',1);
INSERT INTO `oc_zone` VALUES (1750,111,'KU',1);
INSERT INTO `oc_zone` VALUES (1751,111,'MI',1);
INSERT INTO `oc_zone` VALUES (1752,111,'MN',1);
INSERT INTO `oc_zone` VALUES (1753,111,'ME',1);
INSERT INTO `oc_zone` VALUES (1754,111,'NI',1);
INSERT INTO `oc_zone` VALUES (1755,111,'NO',1);
INSERT INTO `oc_zone` VALUES (1756,111,'ON',1);
INSERT INTO `oc_zone` VALUES (1757,111,'TT',1);
INSERT INTO `oc_zone` VALUES (1758,111,'TR',1);
INSERT INTO `oc_zone` VALUES (1759,111,'TM',1);
INSERT INTO `oc_zone` VALUES (1760,111,'TW',1);
INSERT INTO `oc_zone` VALUES (1761,111,'TE',1);
INSERT INTO `oc_zone` VALUES (1762,112,'CHA',1);
INSERT INTO `oc_zone` VALUES (1763,112,'HAB',1);
INSERT INTO `oc_zone` VALUES (1764,112,'HAN',1);
INSERT INTO `oc_zone` VALUES (1765,112,'HWB',1);
INSERT INTO `oc_zone` VALUES (1766,112,'HWN',1);
INSERT INTO `oc_zone` VALUES (1767,112,'KAN',1);
INSERT INTO `oc_zone` VALUES (1768,112,'PYB',1);
INSERT INTO `oc_zone` VALUES (1769,112,'PYN',1);
INSERT INTO `oc_zone` VALUES (1770,112,'YAN',1);
INSERT INTO `oc_zone` VALUES (1771,112,'NAJ',1);
INSERT INTO `oc_zone` VALUES (1772,112,'PYO',1);
INSERT INTO `oc_zone` VALUES (1788,114,'AL',1);
INSERT INTO `oc_zone` VALUES (1789,114,'AA',1);
INSERT INTO `oc_zone` VALUES (1790,114,'AF',1);
INSERT INTO `oc_zone` VALUES (1791,114,'AJ',1);
INSERT INTO `oc_zone` VALUES (1792,114,'HA',1);
INSERT INTO `oc_zone` VALUES (1793,115,'GB',1);
INSERT INTO `oc_zone` VALUES (1794,115,'B',1);
INSERT INTO `oc_zone` VALUES (1795,115,'C',1);
INSERT INTO `oc_zone` VALUES (1796,115,'J',1);
INSERT INTO `oc_zone` VALUES (1797,115,'N',1);
INSERT INTO `oc_zone` VALUES (1798,115,'O',1);
INSERT INTO `oc_zone` VALUES (1799,115,'T',1);
INSERT INTO `oc_zone` VALUES (1800,115,'Y',1);
INSERT INTO `oc_zone` VALUES (1801,116,'VT',1);
INSERT INTO `oc_zone` VALUES (1802,116,'AT',1);
INSERT INTO `oc_zone` VALUES (1803,116,'BK',1);
INSERT INTO `oc_zone` VALUES (1804,116,'BL',1);
INSERT INTO `oc_zone` VALUES (1805,116,'CH',1);
INSERT INTO `oc_zone` VALUES (1806,116,'HO',1);
INSERT INTO `oc_zone` VALUES (1807,116,'KH',1);
INSERT INTO `oc_zone` VALUES (1808,116,'LM',1);
INSERT INTO `oc_zone` VALUES (1809,116,'LP',1);
INSERT INTO `oc_zone` VALUES (1810,116,'OU',1);
INSERT INTO `oc_zone` VALUES (1811,116,'PH',1);
INSERT INTO `oc_zone` VALUES (1812,116,'SL',1);
INSERT INTO `oc_zone` VALUES (1813,116,'SV',1);
INSERT INTO `oc_zone` VALUES (1814,116,'VI',1);
INSERT INTO `oc_zone` VALUES (1815,116,'XA',1);
INSERT INTO `oc_zone` VALUES (1816,116,'XE',1);
INSERT INTO `oc_zone` VALUES (1817,116,'XI',1);
INSERT INTO `oc_zone` VALUES (1818,116,'XN',1);
INSERT INTO `oc_zone` VALUES (1852,119,'BE',1);
INSERT INTO `oc_zone` VALUES (1853,119,'BB',1);
INSERT INTO `oc_zone` VALUES (1854,119,'LE',1);
INSERT INTO `oc_zone` VALUES (1855,119,'MF',1);
INSERT INTO `oc_zone` VALUES (1856,119,'MS',1);
INSERT INTO `oc_zone` VALUES (1857,119,'MH',1);
INSERT INTO `oc_zone` VALUES (1858,119,'MK',1);
INSERT INTO `oc_zone` VALUES (1859,119,'QN',1);
INSERT INTO `oc_zone` VALUES (1860,119,'QT',1);
INSERT INTO `oc_zone` VALUES (1861,119,'TT',1);
INSERT INTO `oc_zone` VALUES (1862,120,'BI',1);
INSERT INTO `oc_zone` VALUES (1863,120,'BG',1);
INSERT INTO `oc_zone` VALUES (1864,120,'GB',1);
INSERT INTO `oc_zone` VALUES (1865,120,'CM',1);
INSERT INTO `oc_zone` VALUES (1866,120,'GG',1);
INSERT INTO `oc_zone` VALUES (1867,120,'GK',1);
INSERT INTO `oc_zone` VALUES (1868,120,'LO',1);
INSERT INTO `oc_zone` VALUES (1869,120,'MG',1);
INSERT INTO `oc_zone` VALUES (1870,120,'ML',1);
INSERT INTO `oc_zone` VALUES (1871,120,'MS',1);
INSERT INTO `oc_zone` VALUES (1872,120,'NB',1);
INSERT INTO `oc_zone` VALUES (1873,120,'RC',1);
INSERT INTO `oc_zone` VALUES (1874,120,'SN',1);
INSERT INTO `oc_zone` VALUES (1875,121,'AJ',1);
INSERT INTO `oc_zone` VALUES (1876,121,'AZ',1);
INSERT INTO `oc_zone` VALUES (1877,121,'FA',1);
INSERT INTO `oc_zone` VALUES (1878,121,'JA',1);
INSERT INTO `oc_zone` VALUES (1879,121,'JU',1);
INSERT INTO `oc_zone` VALUES (1880,121,'KH',1);
INSERT INTO `oc_zone` VALUES (1881,121,'KU',1);
INSERT INTO `oc_zone` VALUES (1882,121,'NK',1);
INSERT INTO `oc_zone` VALUES (1883,121,'AS',1);
INSERT INTO `oc_zone` VALUES (1884,121,'AW',1);
INSERT INTO `oc_zone` VALUES (1885,121,'ZA',1);
INSERT INTO `oc_zone` VALUES (1886,121,'BA',1);
INSERT INTO `oc_zone` VALUES (1887,121,'DA',1);
INSERT INTO `oc_zone` VALUES (1888,121,'GD',1);
INSERT INTO `oc_zone` VALUES (1889,121,'GY',1);
INSERT INTO `oc_zone` VALUES (1890,121,'MI',1);
INSERT INTO `oc_zone` VALUES (1891,121,'MZ',1);
INSERT INTO `oc_zone` VALUES (1892,121,'SB',1);
INSERT INTO `oc_zone` VALUES (1893,121,'SW',1);
INSERT INTO `oc_zone` VALUES (1894,121,'SU',1);
INSERT INTO `oc_zone` VALUES (1895,121,'TL',1);
INSERT INTO `oc_zone` VALUES (1896,121,'TH',1);
INSERT INTO `oc_zone` VALUES (1897,121,'TU',1);
INSERT INTO `oc_zone` VALUES (1898,121,'YA',1);
INSERT INTO `oc_zone` VALUES (1899,121,'ZL',1);
INSERT INTO `oc_zone` VALUES (1900,122,'V',1);
INSERT INTO `oc_zone` VALUES (1901,122,'A',1);
INSERT INTO `oc_zone` VALUES (1902,122,'B',1);
INSERT INTO `oc_zone` VALUES (1903,122,'N',1);
INSERT INTO `oc_zone` VALUES (1904,122,'E',1);
INSERT INTO `oc_zone` VALUES (1905,122,'M',1);
INSERT INTO `oc_zone` VALUES (1906,122,'T',1);
INSERT INTO `oc_zone` VALUES (1907,122,'R',1);
INSERT INTO `oc_zone` VALUES (1908,122,'G',1);
INSERT INTO `oc_zone` VALUES (1909,122,'L',1);
INSERT INTO `oc_zone` VALUES (1910,122,'P',1);
INSERT INTO `oc_zone` VALUES (1911,123,'AL',1);
INSERT INTO `oc_zone` VALUES (1912,123,'KA',1);
INSERT INTO `oc_zone` VALUES (1913,123,'KL',1);
INSERT INTO `oc_zone` VALUES (1914,123,'MA',1);
INSERT INTO `oc_zone` VALUES (1915,123,'PA',1);
INSERT INTO `oc_zone` VALUES (1916,123,'SI',1);
INSERT INTO `oc_zone` VALUES (1917,123,'TA',1);
INSERT INTO `oc_zone` VALUES (1918,123,'TE',1);
INSERT INTO `oc_zone` VALUES (1919,123,'UT',1);
INSERT INTO `oc_zone` VALUES (1920,123,'VI',1);
INSERT INTO `oc_zone` VALUES (1921,124,'DD',1);
INSERT INTO `oc_zone` VALUES (1922,124,'DC',1);
INSERT INTO `oc_zone` VALUES (1923,124,'DR',1);
INSERT INTO `oc_zone` VALUES (1924,124,'DV',1);
INSERT INTO `oc_zone` VALUES (1925,124,'DW',1);
INSERT INTO `oc_zone` VALUES (1926,124,'GG',1);
INSERT INTO `oc_zone` VALUES (1927,124,'GE',1);
INSERT INTO `oc_zone` VALUES (1928,124,'GR',1);
INSERT INTO `oc_zone` VALUES (1929,124,'LL',1);
INSERT INTO `oc_zone` VALUES (1930,124,'LC',1);
INSERT INTO `oc_zone` VALUES (1931,124,'LE',1);
INSERT INTO `oc_zone` VALUES (1932,124,'LM',1);
INSERT INTO `oc_zone` VALUES (1933,125,'OLF',1);
INSERT INTO `oc_zone` VALUES (1934,125,'ANT',1);
INSERT INTO `oc_zone` VALUES (1935,125,'LAZ',1);
INSERT INTO `oc_zone` VALUES (1936,125,'CAT',1);
INSERT INTO `oc_zone` VALUES (1937,125,'LAW',1);
INSERT INTO `oc_zone` VALUES (1938,127,'AN',1);
INSERT INTO `oc_zone` VALUES (1939,127,'AS',1);
INSERT INTO `oc_zone` VALUES (1940,127,'FN',1);
INSERT INTO `oc_zone` VALUES (1941,127,'MJ',1);
INSERT INTO `oc_zone` VALUES (1942,127,'TM',1);
INSERT INTO `oc_zone` VALUES (1943,127,'TL',1);
INSERT INTO `oc_zone` VALUES (1944,128,'BLK',1);
INSERT INTO `oc_zone` VALUES (1945,128,'BLT',1);
INSERT INTO `oc_zone` VALUES (1946,128,'CKW',1);
INSERT INTO `oc_zone` VALUES (1947,128,'CRD',1);
INSERT INTO `oc_zone` VALUES (1948,128,'CTP',1);
INSERT INTO `oc_zone` VALUES (1949,128,'DDZ',1);
INSERT INTO `oc_zone` VALUES (1950,128,'DWA',1);
INSERT INTO `oc_zone` VALUES (1951,128,'KRG',1);
INSERT INTO `oc_zone` VALUES (1952,128,'KSG',1);
INSERT INTO `oc_zone` VALUES (1953,128,'LKM',1);
INSERT INTO `oc_zone` VALUES (1954,128,'LLG',1);
INSERT INTO `oc_zone` VALUES (1955,128,'MCG',1);
INSERT INTO `oc_zone` VALUES (1956,128,'MGC',1);
INSERT INTO `oc_zone` VALUES (1957,128,'MCH',1);
INSERT INTO `oc_zone` VALUES (1958,128,'MLJ',1);
INSERT INTO `oc_zone` VALUES (1959,128,'MWZ',1);
INSERT INTO `oc_zone` VALUES (1960,128,'MZM',1);
INSERT INTO `oc_zone` VALUES (1961,128,'NTU',1);
INSERT INTO `oc_zone` VALUES (1962,128,'NKB',1);
INSERT INTO `oc_zone` VALUES (1963,128,'NKH',1);
INSERT INTO `oc_zone` VALUES (1964,128,'NSJ',1);
INSERT INTO `oc_zone` VALUES (1965,128,'NTI',1);
INSERT INTO `oc_zone` VALUES (1966,128,'PHL',1);
INSERT INTO `oc_zone` VALUES (1967,128,'RMP',1);
INSERT INTO `oc_zone` VALUES (1968,128,'SLM',1);
INSERT INTO `oc_zone` VALUES (1969,128,'THY',1);
INSERT INTO `oc_zone` VALUES (1970,128,'ZBA',1);
INSERT INTO `oc_zone` VALUES (1971,129,'MY-01',1);
INSERT INTO `oc_zone` VALUES (1972,129,'MY-02',1);
INSERT INTO `oc_zone` VALUES (1973,129,'MY-03',1);
INSERT INTO `oc_zone` VALUES (1974,129,'MY-15',1);
INSERT INTO `oc_zone` VALUES (1975,129,'MY-04',1);
INSERT INTO `oc_zone` VALUES (1976,129,'MY-05',1);
INSERT INTO `oc_zone` VALUES (1977,129,'MY-06',1);
INSERT INTO `oc_zone` VALUES (1978,129,'MY-08',1);
INSERT INTO `oc_zone` VALUES (1979,129,'MY-09',1);
INSERT INTO `oc_zone` VALUES (1980,129,'MY-07',1);
INSERT INTO `oc_zone` VALUES (1981,129,'MY-12',1);
INSERT INTO `oc_zone` VALUES (1982,129,'MY-13',1);
INSERT INTO `oc_zone` VALUES (1983,129,'MY-10',1);
INSERT INTO `oc_zone` VALUES (1984,129,'MY-11',1);
INSERT INTO `oc_zone` VALUES (1985,129,'MY-14',1);
INSERT INTO `oc_zone` VALUES (1986,130,'THU',1);
INSERT INTO `oc_zone` VALUES (1987,130,'THD',1);
INSERT INTO `oc_zone` VALUES (1988,130,'MLU',1);
INSERT INTO `oc_zone` VALUES (1989,130,'MLD',1);
INSERT INTO `oc_zone` VALUES (1990,130,'MAU',1);
INSERT INTO `oc_zone` VALUES (1991,130,'MAD',1);
INSERT INTO `oc_zone` VALUES (1992,130,'FAA',1);
INSERT INTO `oc_zone` VALUES (1993,130,'MAA',1);
INSERT INTO `oc_zone` VALUES (1994,130,'AAU',1);
INSERT INTO `oc_zone` VALUES (1995,130,'AAD',1);
INSERT INTO `oc_zone` VALUES (1996,130,'FEA',1);
INSERT INTO `oc_zone` VALUES (1997,130,'MUA',1);
INSERT INTO `oc_zone` VALUES (1998,130,'NAU',1);
INSERT INTO `oc_zone` VALUES (1999,130,'NAD',1);
INSERT INTO `oc_zone` VALUES (2000,130,'KLH',1);
INSERT INTO `oc_zone` VALUES (2001,130,'HDH',1);
INSERT INTO `oc_zone` VALUES (2002,130,'HAU',1);
INSERT INTO `oc_zone` VALUES (2003,130,'HAD',1);
INSERT INTO `oc_zone` VALUES (2004,130,'FMU',1);
INSERT INTO `oc_zone` VALUES (2005,130,'ADD',1);
INSERT INTO `oc_zone` VALUES (2006,131,'GA',1);
INSERT INTO `oc_zone` VALUES (2007,131,'KY',1);
INSERT INTO `oc_zone` VALUES (2008,131,'KD',1);
INSERT INTO `oc_zone` VALUES (2009,131,'KL',1);
INSERT INTO `oc_zone` VALUES (2010,131,'MP',1);
INSERT INTO `oc_zone` VALUES (2011,131,'SG',1);
INSERT INTO `oc_zone` VALUES (2012,131,'SK',1);
INSERT INTO `oc_zone` VALUES (2013,131,'TB',1);
INSERT INTO `oc_zone` VALUES (2014,131,'CD',1);
INSERT INTO `oc_zone` VALUES (2015,132,'ATT',1);
INSERT INTO `oc_zone` VALUES (2016,132,'BAL',1);
INSERT INTO `oc_zone` VALUES (2017,132,'BGU',1);
INSERT INTO `oc_zone` VALUES (2018,132,'BKK',1);
INSERT INTO `oc_zone` VALUES (2019,132,'BRZ',1);
INSERT INTO `oc_zone` VALUES (2020,132,'BOR',1);
INSERT INTO `oc_zone` VALUES (2021,132,'DIN',1);
INSERT INTO `oc_zone` VALUES (2022,132,'FGU',1);
INSERT INTO `oc_zone` VALUES (2023,132,'FLO',1);
INSERT INTO `oc_zone` VALUES (2024,132,'GDJ',1);
INSERT INTO `oc_zone` VALUES (2025,132,'GZR',1);
INSERT INTO `oc_zone` VALUES (2026,132,'GRG',1);
INSERT INTO `oc_zone` VALUES (2027,132,'GXQ',1);
INSERT INTO `oc_zone` VALUES (2028,132,'HMR',1);
INSERT INTO `oc_zone` VALUES (2029,132,'IKL',1);
INSERT INTO `oc_zone` VALUES (2030,132,'ISL',1);
INSERT INTO `oc_zone` VALUES (2031,132,'KLK',1);
INSERT INTO `oc_zone` VALUES (2032,132,'KRK',1);
INSERT INTO `oc_zone` VALUES (2033,132,'LIJ',1);
INSERT INTO `oc_zone` VALUES (2034,132,'LUQ',1);
INSERT INTO `oc_zone` VALUES (2035,132,'MRS',1);
INSERT INTO `oc_zone` VALUES (2036,132,'MKL',1);
INSERT INTO `oc_zone` VALUES (2037,132,'MXL',1);
INSERT INTO `oc_zone` VALUES (2038,132,'MDN',1);
INSERT INTO `oc_zone` VALUES (2039,132,'MEL',1);
INSERT INTO `oc_zone` VALUES (2040,132,'MGR',1);
INSERT INTO `oc_zone` VALUES (2041,132,'MST',1);
INSERT INTO `oc_zone` VALUES (2042,132,'MQA',1);
INSERT INTO `oc_zone` VALUES (2043,132,'MSI',1);
INSERT INTO `oc_zone` VALUES (2044,132,'MTF',1);
INSERT INTO `oc_zone` VALUES (2045,132,'NAX',1);
INSERT INTO `oc_zone` VALUES (2046,132,'PAO',1);
INSERT INTO `oc_zone` VALUES (2047,132,'PEM',1);
INSERT INTO `oc_zone` VALUES (2048,132,'PIE',1);
INSERT INTO `oc_zone` VALUES (2049,132,'QOR',1);
INSERT INTO `oc_zone` VALUES (2050,132,'QRE',1);
INSERT INTO `oc_zone` VALUES (2051,132,'RAB',1);
INSERT INTO `oc_zone` VALUES (2052,132,'SAF',1);
INSERT INTO `oc_zone` VALUES (2053,132,'SGI',1);
INSERT INTO `oc_zone` VALUES (2054,132,'SLU',1);
INSERT INTO `oc_zone` VALUES (2055,132,'SPB',1);
INSERT INTO `oc_zone` VALUES (2056,132,'SGW',1);
INSERT INTO `oc_zone` VALUES (2057,132,'SVE',1);
INSERT INTO `oc_zone` VALUES (2058,132,'SIG',1);
INSERT INTO `oc_zone` VALUES (2059,132,'SLM',1);
INSERT INTO `oc_zone` VALUES (2060,132,'SWQ',1);
INSERT INTO `oc_zone` VALUES (2061,132,'TXB',1);
INSERT INTO `oc_zone` VALUES (2062,132,'TRX',1);
INSERT INTO `oc_zone` VALUES (2063,132,'VLT',1);
INSERT INTO `oc_zone` VALUES (2064,132,'XGJ',1);
INSERT INTO `oc_zone` VALUES (2065,132,'ZBR',1);
INSERT INTO `oc_zone` VALUES (2066,132,'ZBG',1);
INSERT INTO `oc_zone` VALUES (2067,132,'ZJT',1);
INSERT INTO `oc_zone` VALUES (2068,132,'ZRQ',1);
INSERT INTO `oc_zone` VALUES (2069,132,'FNT',1);
INSERT INTO `oc_zone` VALUES (2070,132,'GHJ',1);
INSERT INTO `oc_zone` VALUES (2071,132,'GHR',1);
INSERT INTO `oc_zone` VALUES (2072,132,'GHS',1);
INSERT INTO `oc_zone` VALUES (2073,132,'KRC',1);
INSERT INTO `oc_zone` VALUES (2074,132,'MUN',1);
INSERT INTO `oc_zone` VALUES (2075,132,'NAD',1);
INSERT INTO `oc_zone` VALUES (2076,132,'QAL',1);
INSERT INTO `oc_zone` VALUES (2077,132,'VIC',1);
INSERT INTO `oc_zone` VALUES (2078,132,'SLA',1);
INSERT INTO `oc_zone` VALUES (2079,132,'SNT',1);
INSERT INTO `oc_zone` VALUES (2080,132,'ZAG',1);
INSERT INTO `oc_zone` VALUES (2081,132,'XEW',1);
INSERT INTO `oc_zone` VALUES (2082,132,'ZEB',1);
INSERT INTO `oc_zone` VALUES (2083,133,'ALG',1);
INSERT INTO `oc_zone` VALUES (2084,133,'ALL',1);
INSERT INTO `oc_zone` VALUES (2085,133,'ALK',1);
INSERT INTO `oc_zone` VALUES (2086,133,'ARN',1);
INSERT INTO `oc_zone` VALUES (2087,133,'AUR',1);
INSERT INTO `oc_zone` VALUES (2088,133,'BKR',1);
INSERT INTO `oc_zone` VALUES (2089,133,'BKN',1);
INSERT INTO `oc_zone` VALUES (2090,133,'BKK',1);
INSERT INTO `oc_zone` VALUES (2091,133,'EBN',1);
INSERT INTO `oc_zone` VALUES (2092,133,'ENT',1);
INSERT INTO `oc_zone` VALUES (2093,133,'EKB',1);
INSERT INTO `oc_zone` VALUES (2094,133,'JBT',1);
INSERT INTO `oc_zone` VALUES (2095,133,'JLT',1);
INSERT INTO `oc_zone` VALUES (2096,133,'JEM',1);
INSERT INTO `oc_zone` VALUES (2097,133,'KIL',1);
INSERT INTO `oc_zone` VALUES (2098,133,'KWJ',1);
INSERT INTO `oc_zone` VALUES (2099,133,'LAE',1);
INSERT INTO `oc_zone` VALUES (2100,133,'LIB',1);
INSERT INTO `oc_zone` VALUES (2101,133,'LKP',1);
INSERT INTO `oc_zone` VALUES (2102,133,'MJR',1);
INSERT INTO `oc_zone` VALUES (2103,133,'MLP',1);
INSERT INTO `oc_zone` VALUES (2104,133,'MJT',1);
INSERT INTO `oc_zone` VALUES (2105,133,'MIL',1);
INSERT INTO `oc_zone` VALUES (2106,133,'NMK',1);
INSERT INTO `oc_zone` VALUES (2107,133,'NAM',1);
INSERT INTO `oc_zone` VALUES (2108,133,'RGL',1);
INSERT INTO `oc_zone` VALUES (2109,133,'RGK',1);
INSERT INTO `oc_zone` VALUES (2110,133,'TOK',1);
INSERT INTO `oc_zone` VALUES (2111,133,'UJA',1);
INSERT INTO `oc_zone` VALUES (2112,133,'UJL',1);
INSERT INTO `oc_zone` VALUES (2113,133,'UTK',1);
INSERT INTO `oc_zone` VALUES (2114,133,'WTH',1);
INSERT INTO `oc_zone` VALUES (2115,133,'WTJ',1);
INSERT INTO `oc_zone` VALUES (2116,135,'AD',1);
INSERT INTO `oc_zone` VALUES (2117,135,'AS',1);
INSERT INTO `oc_zone` VALUES (2118,135,'BR',1);
INSERT INTO `oc_zone` VALUES (2119,135,'DN',1);
INSERT INTO `oc_zone` VALUES (2120,135,'GO',1);
INSERT INTO `oc_zone` VALUES (2121,135,'GM',1);
INSERT INTO `oc_zone` VALUES (2122,135,'HC',1);
INSERT INTO `oc_zone` VALUES (2123,135,'HG',1);
INSERT INTO `oc_zone` VALUES (2124,135,'IN',1);
INSERT INTO `oc_zone` VALUES (2125,135,'TA',1);
INSERT INTO `oc_zone` VALUES (2126,135,'TZ',1);
INSERT INTO `oc_zone` VALUES (2127,135,'TR',1);
INSERT INTO `oc_zone` VALUES (2128,135,'NO',1);
INSERT INTO `oc_zone` VALUES (2129,136,'BR',1);
INSERT INTO `oc_zone` VALUES (2130,136,'CU',1);
INSERT INTO `oc_zone` VALUES (2131,136,'PU',1);
INSERT INTO `oc_zone` VALUES (2132,136,'QB',1);
INSERT INTO `oc_zone` VALUES (2133,136,'VP',1);
INSERT INTO `oc_zone` VALUES (2134,136,'AG',1);
INSERT INTO `oc_zone` VALUES (2135,136,'CC',1);
INSERT INTO `oc_zone` VALUES (2136,136,'RO',1);
INSERT INTO `oc_zone` VALUES (2137,136,'BL',1);
INSERT INTO `oc_zone` VALUES (2138,136,'FL',1);
INSERT INTO `oc_zone` VALUES (2139,136,'GP',1);
INSERT INTO `oc_zone` VALUES (2140,136,'MO',1);
INSERT INTO `oc_zone` VALUES (2141,136,'PA',1);
INSERT INTO `oc_zone` VALUES (2142,136,'PW',1);
INSERT INTO `oc_zone` VALUES (2143,136,'PL',1);
INSERT INTO `oc_zone` VALUES (2144,136,'RR',1);
INSERT INTO `oc_zone` VALUES (2145,136,'SA',1);
INSERT INTO `oc_zone` VALUES (2146,138,'BCN',1);
INSERT INTO `oc_zone` VALUES (2147,138,'BCS',1);
INSERT INTO `oc_zone` VALUES (2148,138,'CAM',1);
INSERT INTO `oc_zone` VALUES (2149,138,'CHP',1);
INSERT INTO `oc_zone` VALUES (2150,138,'CHH',1);
INSERT INTO `oc_zone` VALUES (2151,138,'COA',1);
INSERT INTO `oc_zone` VALUES (2152,138,'COL',1);
INSERT INTO `oc_zone` VALUES (2153,138,'CMX',1);
INSERT INTO `oc_zone` VALUES (2154,138,'DUR',1);
INSERT INTO `oc_zone` VALUES (2155,138,'GUA',1);
INSERT INTO `oc_zone` VALUES (2156,138,'GRO',1);
INSERT INTO `oc_zone` VALUES (2157,138,'HID',1);
INSERT INTO `oc_zone` VALUES (2158,138,'JAL',1);
INSERT INTO `oc_zone` VALUES (2159,138,'MEX',1);
INSERT INTO `oc_zone` VALUES (2160,138,'MIC',1);
INSERT INTO `oc_zone` VALUES (2161,138,'MOR',1);
INSERT INTO `oc_zone` VALUES (2162,138,'NAY',1);
INSERT INTO `oc_zone` VALUES (2163,138,'NLE',1);
INSERT INTO `oc_zone` VALUES (2164,138,'OAX',1);
INSERT INTO `oc_zone` VALUES (2165,138,'PUE',1);
INSERT INTO `oc_zone` VALUES (2166,138,'QUE',1);
INSERT INTO `oc_zone` VALUES (2167,138,'ROO',1);
INSERT INTO `oc_zone` VALUES (2168,138,'SLP',1);
INSERT INTO `oc_zone` VALUES (2169,138,'SIN',1);
INSERT INTO `oc_zone` VALUES (2170,138,'SON',1);
INSERT INTO `oc_zone` VALUES (2171,138,'TAB',1);
INSERT INTO `oc_zone` VALUES (2172,138,'TAM',1);
INSERT INTO `oc_zone` VALUES (2173,138,'TLA',1);
INSERT INTO `oc_zone` VALUES (2174,138,'VER',1);
INSERT INTO `oc_zone` VALUES (2175,138,'YUC',1);
INSERT INTO `oc_zone` VALUES (2176,138,'ZAC',1);
INSERT INTO `oc_zone` VALUES (2177,139,'C',1);
INSERT INTO `oc_zone` VALUES (2178,139,'K',1);
INSERT INTO `oc_zone` VALUES (2179,139,'P',1);
INSERT INTO `oc_zone` VALUES (2180,139,'Y',1);
INSERT INTO `oc_zone` VALUES (2181,140,'GA',1);
INSERT INTO `oc_zone` VALUES (2182,140,'CU',1);
INSERT INTO `oc_zone` VALUES (2183,140,'BA',1);
INSERT INTO `oc_zone` VALUES (2184,140,'CA',1);
INSERT INTO `oc_zone` VALUES (2185,140,'ED',1);
INSERT INTO `oc_zone` VALUES (2186,140,'LA',1);
INSERT INTO `oc_zone` VALUES (2187,140,'OR',1);
INSERT INTO `oc_zone` VALUES (2188,140,'SO',1);
INSERT INTO `oc_zone` VALUES (2189,140,'TI',1);
INSERT INTO `oc_zone` VALUES (2190,140,'UN',1);
INSERT INTO `oc_zone` VALUES (2191,140,'SN',1);
INSERT INTO `oc_zone` VALUES (2192,141,'FV',1);
INSERT INTO `oc_zone` VALUES (2193,141,'LC',1);
INSERT INTO `oc_zone` VALUES (2194,141,'MV',1);
INSERT INTO `oc_zone` VALUES (2195,141,'MC',1);
INSERT INTO `oc_zone` VALUES (2196,142,'1',1);
INSERT INTO `oc_zone` VALUES (2197,142,'035',1);
INSERT INTO `oc_zone` VALUES (2198,142,'037',1);
INSERT INTO `oc_zone` VALUES (2199,142,'039',1);
INSERT INTO `oc_zone` VALUES (2200,142,'041',1);
INSERT INTO `oc_zone` VALUES (2201,142,'043',1);
INSERT INTO `oc_zone` VALUES (2202,142,'046',1);
INSERT INTO `oc_zone` VALUES (2203,142,'047',1);
INSERT INTO `oc_zone` VALUES (2204,142,'049',1);
INSERT INTO `oc_zone` VALUES (2205,142,'051',1);
INSERT INTO `oc_zone` VALUES (2206,142,'053',1);
INSERT INTO `oc_zone` VALUES (2207,142,'055',1);
INSERT INTO `oc_zone` VALUES (2208,142,'057',1);
INSERT INTO `oc_zone` VALUES (2209,142,'059',1);
INSERT INTO `oc_zone` VALUES (2210,142,'061',1);
INSERT INTO `oc_zone` VALUES (2211,142,'063',1);
INSERT INTO `oc_zone` VALUES (2212,142,'064',1);
INSERT INTO `oc_zone` VALUES (2213,142,'065',1);
INSERT INTO `oc_zone` VALUES (2214,142,'067',1);
INSERT INTO `oc_zone` VALUES (2215,142,'069',1);
INSERT INTO `oc_zone` VALUES (2216,142,'071',1);
INSERT INTO `oc_zone` VALUES (2217,142,'073',1);
INSERT INTO `oc_zone` VALUES (2218,143,'A',1);
INSERT INTO `oc_zone` VALUES (2219,143,'G',1);
INSERT INTO `oc_zone` VALUES (2220,143,'P',1);
INSERT INTO `oc_zone` VALUES (2221,144,'AGD',1);
INSERT INTO `oc_zone` VALUES (2222,144,'HOC',1);
INSERT INTO `oc_zone` VALUES (2223,144,'AZI',1);
INSERT INTO `oc_zone` VALUES (2224,144,'BME',1);
INSERT INTO `oc_zone` VALUES (2225,144,'BSL',1);
INSERT INTO `oc_zone` VALUES (2226,144,'BLM',1);
INSERT INTO `oc_zone` VALUES (2227,144,'CBL',1);
INSERT INTO `oc_zone` VALUES (2228,144,'CHA',1);
INSERT INTO `oc_zone` VALUES (2229,144,'EJA',1);
INSERT INTO `oc_zone` VALUES (2230,144,'EKS',1);
INSERT INTO `oc_zone` VALUES (2231,144,'ERA',1);
INSERT INTO `oc_zone` VALUES (2232,144,'ESS',1);
INSERT INTO `oc_zone` VALUES (2233,144,'FES',1);
INSERT INTO `oc_zone` VALUES (2234,144,'FIG',1);
INSERT INTO `oc_zone` VALUES (2235,144,'GLM',1);
INSERT INTO `oc_zone` VALUES (2236,144,'IFR',1);
INSERT INTO `oc_zone` VALUES (2237,144,'KEN',1);
INSERT INTO `oc_zone` VALUES (2238,144,'KHM',1);
INSERT INTO `oc_zone` VALUES (2239,144,'KHN',1);
INSERT INTO `oc_zone` VALUES (2240,144,'KHO',1);
INSERT INTO `oc_zone` VALUES (2241,144,'LYN',1);
INSERT INTO `oc_zone` VALUES (2242,144,'LAR',1);
INSERT INTO `oc_zone` VALUES (2243,144,'MRK',1);
INSERT INTO `oc_zone` VALUES (2244,144,'MKN',1);
INSERT INTO `oc_zone` VALUES (2245,144,'NAD',1);
INSERT INTO `oc_zone` VALUES (2246,144,'ORZ',1);
INSERT INTO `oc_zone` VALUES (2247,144,'OUJ',1);
INSERT INTO `oc_zone` VALUES (2248,144,'RSA',1);
INSERT INTO `oc_zone` VALUES (2249,144,'SAF',1);
INSERT INTO `oc_zone` VALUES (2250,144,'SET',1);
INSERT INTO `oc_zone` VALUES (2251,144,'SKA',1);
INSERT INTO `oc_zone` VALUES (2252,144,'TGR',1);
INSERT INTO `oc_zone` VALUES (2253,144,'TAN',1);
INSERT INTO `oc_zone` VALUES (2254,144,'TAO',1);
INSERT INTO `oc_zone` VALUES (2255,144,'TRD',1);
INSERT INTO `oc_zone` VALUES (2256,144,'TAT',1);
INSERT INTO `oc_zone` VALUES (2257,144,'TAZ',1);
INSERT INTO `oc_zone` VALUES (2258,144,'TET',1);
INSERT INTO `oc_zone` VALUES (2259,144,'TIZ',1);
INSERT INTO `oc_zone` VALUES (2260,144,'ADK',1);
INSERT INTO `oc_zone` VALUES (2261,144,'BJD',1);
INSERT INTO `oc_zone` VALUES (2262,144,'ESM',1);
INSERT INTO `oc_zone` VALUES (2263,145,'CD',1);
INSERT INTO `oc_zone` VALUES (2264,145,'GZ',1);
INSERT INTO `oc_zone` VALUES (2265,145,'IN',1);
INSERT INTO `oc_zone` VALUES (2266,145,'MN',1);
INSERT INTO `oc_zone` VALUES (2267,145,'MC',1);
INSERT INTO `oc_zone` VALUES (2268,145,'MP',1);
INSERT INTO `oc_zone` VALUES (2269,145,'NA',1);
INSERT INTO `oc_zone` VALUES (2270,145,'NI',1);
INSERT INTO `oc_zone` VALUES (2271,145,'SO',1);
INSERT INTO `oc_zone` VALUES (2272,145,'TE',1);
INSERT INTO `oc_zone` VALUES (2273,145,'ZA',1);
INSERT INTO `oc_zone` VALUES (2274,146,'AY',1);
INSERT INTO `oc_zone` VALUES (2275,146,'BG',1);
INSERT INTO `oc_zone` VALUES (2276,146,'MG',1);
INSERT INTO `oc_zone` VALUES (2277,146,'MD',1);
INSERT INTO `oc_zone` VALUES (2278,146,'SG',1);
INSERT INTO `oc_zone` VALUES (2279,146,'TN',1);
INSERT INTO `oc_zone` VALUES (2280,146,'YG',1);
INSERT INTO `oc_zone` VALUES (2281,146,'CH',1);
INSERT INTO `oc_zone` VALUES (2282,146,'KC',1);
INSERT INTO `oc_zone` VALUES (2283,146,'KH',1);
INSERT INTO `oc_zone` VALUES (2284,146,'KN',1);
INSERT INTO `oc_zone` VALUES (2285,146,'MN',1);
INSERT INTO `oc_zone` VALUES (2286,146,'RK',1);
INSERT INTO `oc_zone` VALUES (2287,146,'SH',1);
INSERT INTO `oc_zone` VALUES (2288,147,'CA',1);
INSERT INTO `oc_zone` VALUES (2289,147,'ER',1);
INSERT INTO `oc_zone` VALUES (2290,147,'HA',1);
INSERT INTO `oc_zone` VALUES (2291,147,'KR',1);
INSERT INTO `oc_zone` VALUES (2292,147,'KV',1);
INSERT INTO `oc_zone` VALUES (2293,147,'KH',1);
INSERT INTO `oc_zone` VALUES (2294,147,'KU',1);
INSERT INTO `oc_zone` VALUES (2295,147,'OW',1);
INSERT INTO `oc_zone` VALUES (2296,147,'OK',1);
INSERT INTO `oc_zone` VALUES (2297,147,'OT',1);
INSERT INTO `oc_zone` VALUES (2298,147,'ON',1);
INSERT INTO `oc_zone` VALUES (2299,147,'OO',1);
INSERT INTO `oc_zone` VALUES (2300,147,'OJ',1);
INSERT INTO `oc_zone` VALUES (2301,148,'AO',1);
INSERT INTO `oc_zone` VALUES (2302,148,'AA',1);
INSERT INTO `oc_zone` VALUES (2303,148,'AT',1);
INSERT INTO `oc_zone` VALUES (2304,148,'AI',1);
INSERT INTO `oc_zone` VALUES (2305,148,'BA',1);
INSERT INTO `oc_zone` VALUES (2306,148,'BO',1);
INSERT INTO `oc_zone` VALUES (2307,148,'BU',1);
INSERT INTO `oc_zone` VALUES (2308,148,'DE',1);
INSERT INTO `oc_zone` VALUES (2309,148,'EW',1);
INSERT INTO `oc_zone` VALUES (2310,148,'IJ',1);
INSERT INTO `oc_zone` VALUES (2311,148,'ME',1);
INSERT INTO `oc_zone` VALUES (2312,148,'NI',1);
INSERT INTO `oc_zone` VALUES (2313,148,'UA',1);
INSERT INTO `oc_zone` VALUES (2314,148,'YA',1);
INSERT INTO `oc_zone` VALUES (2315,149,'BA',1);
INSERT INTO `oc_zone` VALUES (2316,149,'BH',1);
INSERT INTO `oc_zone` VALUES (2317,149,'DH',1);
INSERT INTO `oc_zone` VALUES (2318,149,'GA',1);
INSERT INTO `oc_zone` VALUES (2319,149,'JA',1);
INSERT INTO `oc_zone` VALUES (2320,149,'KA',1);
INSERT INTO `oc_zone` VALUES (2321,149,'KO',1);
INSERT INTO `oc_zone` VALUES (2322,149,'LU',1);
INSERT INTO `oc_zone` VALUES (2323,149,'MA',1);
INSERT INTO `oc_zone` VALUES (2324,149,'ME',1);
INSERT INTO `oc_zone` VALUES (2325,149,'NA',1);
INSERT INTO `oc_zone` VALUES (2326,149,'RA',1);
INSERT INTO `oc_zone` VALUES (2327,149,'SA',1);
INSERT INTO `oc_zone` VALUES (2328,149,'SE',1);
INSERT INTO `oc_zone` VALUES (2329,150,'DR',1);
INSERT INTO `oc_zone` VALUES (2330,150,'FL',1);
INSERT INTO `oc_zone` VALUES (2331,150,'FR',1);
INSERT INTO `oc_zone` VALUES (2332,150,'GE',1);
INSERT INTO `oc_zone` VALUES (2333,150,'GR',1);
INSERT INTO `oc_zone` VALUES (2334,150,'LI',1);
INSERT INTO `oc_zone` VALUES (2335,150,'NB',1);
INSERT INTO `oc_zone` VALUES (2336,150,'NH',1);
INSERT INTO `oc_zone` VALUES (2337,150,'OV',1);
INSERT INTO `oc_zone` VALUES (2338,150,'UT',1);
INSERT INTO `oc_zone` VALUES (2339,150,'ZE',1);
INSERT INTO `oc_zone` VALUES (2340,150,'ZH',1);
INSERT INTO `oc_zone` VALUES (2341,152,'L',1);
INSERT INTO `oc_zone` VALUES (2342,152,'N',1);
INSERT INTO `oc_zone` VALUES (2343,152,'S',1);
INSERT INTO `oc_zone` VALUES (2344,153,'AUK',1);
INSERT INTO `oc_zone` VALUES (2345,153,'BOP',1);
INSERT INTO `oc_zone` VALUES (2346,153,'CAN',1);
INSERT INTO `oc_zone` VALUES (2347,153,'COR',1);
INSERT INTO `oc_zone` VALUES (2348,153,'GIS',1);
INSERT INTO `oc_zone` VALUES (2349,153,'FIO',1);
INSERT INTO `oc_zone` VALUES (2350,153,'HKB',1);
INSERT INTO `oc_zone` VALUES (2351,153,'MBH',1);
INSERT INTO `oc_zone` VALUES (2352,153,'MWT',1);
INSERT INTO `oc_zone` VALUES (2353,153,'MCM',1);
INSERT INTO `oc_zone` VALUES (2354,153,'NSN',1);
INSERT INTO `oc_zone` VALUES (2355,153,'NTL',1);
INSERT INTO `oc_zone` VALUES (2356,153,'OTA',1);
INSERT INTO `oc_zone` VALUES (2357,153,'STL',1);
INSERT INTO `oc_zone` VALUES (2358,153,'TKI',1);
INSERT INTO `oc_zone` VALUES (2359,153,'WGN',1);
INSERT INTO `oc_zone` VALUES (2360,153,'WKO',1);
INSERT INTO `oc_zone` VALUES (2361,153,'WAI',1);
INSERT INTO `oc_zone` VALUES (2362,153,'WTC',1);
INSERT INTO `oc_zone` VALUES (2363,154,'AN',1);
INSERT INTO `oc_zone` VALUES (2364,154,'AS',1);
INSERT INTO `oc_zone` VALUES (2365,154,'BO',1);
INSERT INTO `oc_zone` VALUES (2366,154,'CA',1);
INSERT INTO `oc_zone` VALUES (2367,154,'CI',1);
INSERT INTO `oc_zone` VALUES (2368,154,'CO',1);
INSERT INTO `oc_zone` VALUES (2369,154,'ES',1);
INSERT INTO `oc_zone` VALUES (2370,154,'GR',1);
INSERT INTO `oc_zone` VALUES (2371,154,'JI',1);
INSERT INTO `oc_zone` VALUES (2372,154,'LE',1);
INSERT INTO `oc_zone` VALUES (2373,154,'MD',1);
INSERT INTO `oc_zone` VALUES (2374,154,'MN',1);
INSERT INTO `oc_zone` VALUES (2375,154,'MS',1);
INSERT INTO `oc_zone` VALUES (2376,154,'MT',1);
INSERT INTO `oc_zone` VALUES (2377,154,'NS',1);
INSERT INTO `oc_zone` VALUES (2378,154,'RS',1);
INSERT INTO `oc_zone` VALUES (2379,154,'RI',1);
INSERT INTO `oc_zone` VALUES (2380,155,'AG',1);
INSERT INTO `oc_zone` VALUES (2381,155,'DF',1);
INSERT INTO `oc_zone` VALUES (2382,155,'DS',1);
INSERT INTO `oc_zone` VALUES (2383,155,'MA',1);
INSERT INTO `oc_zone` VALUES (2384,155,'NM',1);
INSERT INTO `oc_zone` VALUES (2385,155,'TH',1);
INSERT INTO `oc_zone` VALUES (2386,155,'TL',1);
INSERT INTO `oc_zone` VALUES (2387,155,'ZD',1);
INSERT INTO `oc_zone` VALUES (2388,156,'AB',1);
INSERT INTO `oc_zone` VALUES (2389,156,'CT',1);
INSERT INTO `oc_zone` VALUES (2390,156,'AD',1);
INSERT INTO `oc_zone` VALUES (2391,156,'AK',1);
INSERT INTO `oc_zone` VALUES (2392,156,'AN',1);
INSERT INTO `oc_zone` VALUES (2393,156,'BC',1);
INSERT INTO `oc_zone` VALUES (2394,156,'BY',1);
INSERT INTO `oc_zone` VALUES (2395,156,'BN',1);
INSERT INTO `oc_zone` VALUES (2396,156,'BO',1);
INSERT INTO `oc_zone` VALUES (2397,156,'CR',1);
INSERT INTO `oc_zone` VALUES (2398,156,'DE',1);
INSERT INTO `oc_zone` VALUES (2399,156,'EB',1);
INSERT INTO `oc_zone` VALUES (2400,156,'ED',1);
INSERT INTO `oc_zone` VALUES (2401,156,'EK',1);
INSERT INTO `oc_zone` VALUES (2402,156,'EN',1);
INSERT INTO `oc_zone` VALUES (2403,156,'GO',1);
INSERT INTO `oc_zone` VALUES (2404,156,'IM',1);
INSERT INTO `oc_zone` VALUES (2405,156,'JI',1);
INSERT INTO `oc_zone` VALUES (2406,156,'KD',1);
INSERT INTO `oc_zone` VALUES (2407,156,'KN',1);
INSERT INTO `oc_zone` VALUES (2408,156,'KT',1);
INSERT INTO `oc_zone` VALUES (2409,156,'KE',1);
INSERT INTO `oc_zone` VALUES (2410,156,'KO',1);
INSERT INTO `oc_zone` VALUES (2411,156,'KW',1);
INSERT INTO `oc_zone` VALUES (2412,156,'LA',1);
INSERT INTO `oc_zone` VALUES (2413,156,'NA',1);
INSERT INTO `oc_zone` VALUES (2414,156,'NI',1);
INSERT INTO `oc_zone` VALUES (2415,156,'OG',1);
INSERT INTO `oc_zone` VALUES (2416,156,'ONG',1);
INSERT INTO `oc_zone` VALUES (2417,156,'OS',1);
INSERT INTO `oc_zone` VALUES (2418,156,'OY',1);
INSERT INTO `oc_zone` VALUES (2419,156,'PL',1);
INSERT INTO `oc_zone` VALUES (2420,156,'RI',1);
INSERT INTO `oc_zone` VALUES (2421,156,'SO',1);
INSERT INTO `oc_zone` VALUES (2422,156,'TA',1);
INSERT INTO `oc_zone` VALUES (2423,156,'YO',1);
INSERT INTO `oc_zone` VALUES (2424,156,'ZA',1);
INSERT INTO `oc_zone` VALUES (2425,159,'N',1);
INSERT INTO `oc_zone` VALUES (2426,159,'R',1);
INSERT INTO `oc_zone` VALUES (2427,159,'S',1);
INSERT INTO `oc_zone` VALUES (2428,159,'T',1);
INSERT INTO `oc_zone` VALUES (2429,160,'AK',1);
INSERT INTO `oc_zone` VALUES (2430,160,'AA',1);
INSERT INTO `oc_zone` VALUES (2431,160,'BU',1);
INSERT INTO `oc_zone` VALUES (2432,160,'FM',1);
INSERT INTO `oc_zone` VALUES (2433,160,'HM',1);
INSERT INTO `oc_zone` VALUES (2434,160,'HL',1);
INSERT INTO `oc_zone` VALUES (2435,160,'MR',1);
INSERT INTO `oc_zone` VALUES (2436,160,'NT',1);
INSERT INTO `oc_zone` VALUES (2437,160,'NL',1);
INSERT INTO `oc_zone` VALUES (2438,160,'OF',1);
INSERT INTO `oc_zone` VALUES (2439,160,'OP',1);
INSERT INTO `oc_zone` VALUES (2440,160,'OL',1);
INSERT INTO `oc_zone` VALUES (2441,160,'RL',1);
INSERT INTO `oc_zone` VALUES (2442,160,'ST',1);
INSERT INTO `oc_zone` VALUES (2443,160,'SJ',1);
INSERT INTO `oc_zone` VALUES (2444,160,'SV',1);
INSERT INTO `oc_zone` VALUES (2445,160,'TM',1);
INSERT INTO `oc_zone` VALUES (2446,160,'TR',1);
INSERT INTO `oc_zone` VALUES (2447,160,'VA',1);
INSERT INTO `oc_zone` VALUES (2448,160,'VF',1);
INSERT INTO `oc_zone` VALUES (2449,161,'DA',1);
INSERT INTO `oc_zone` VALUES (2450,161,'BA',1);
INSERT INTO `oc_zone` VALUES (2451,161,'WU',1);
INSERT INTO `oc_zone` VALUES (2452,161,'SH',1);
INSERT INTO `oc_zone` VALUES (2453,161,'ZA',1);
INSERT INTO `oc_zone` VALUES (2454,161,'MA',1);
INSERT INTO `oc_zone` VALUES (2455,161,'MU',1);
INSERT INTO `oc_zone` VALUES (2456,161,'ZU',1);
INSERT INTO `oc_zone` VALUES (2457,162,'B',1);
INSERT INTO `oc_zone` VALUES (2458,162,'T',1);
INSERT INTO `oc_zone` VALUES (2459,162,'I',1);
INSERT INTO `oc_zone` VALUES (2460,162,'N',1);
INSERT INTO `oc_zone` VALUES (2461,162,'P',1);
INSERT INTO `oc_zone` VALUES (2462,162,'S',1);
INSERT INTO `oc_zone` VALUES (2463,163,'AM',1);
INSERT INTO `oc_zone` VALUES (2464,163,'AR',1);
INSERT INTO `oc_zone` VALUES (2465,163,'AN',1);
INSERT INTO `oc_zone` VALUES (2466,163,'HA',1);
INSERT INTO `oc_zone` VALUES (2467,163,'KA',1);
INSERT INTO `oc_zone` VALUES (2468,163,'KO',1);
INSERT INTO `oc_zone` VALUES (2469,163,'ME',1);
INSERT INTO `oc_zone` VALUES (2470,163,'NA',1);
INSERT INTO `oc_zone` VALUES (2471,163,'NG',1);
INSERT INTO `oc_zone` VALUES (2472,163,'ND',1);
INSERT INTO `oc_zone` VALUES (2473,163,'NT',1);
INSERT INTO `oc_zone` VALUES (2474,163,'NC',1);
INSERT INTO `oc_zone` VALUES (2475,163,'NR',1);
INSERT INTO `oc_zone` VALUES (2476,163,'NW',1);
INSERT INTO `oc_zone` VALUES (2477,163,'PE',1);
INSERT INTO `oc_zone` VALUES (2478,163,'SO',1);
INSERT INTO `oc_zone` VALUES (2479,164,'BT',1);
INSERT INTO `oc_zone` VALUES (2480,164,'CH',1);
INSERT INTO `oc_zone` VALUES (2481,164,'CC',1);
INSERT INTO `oc_zone` VALUES (2482,164,'CL',1);
INSERT INTO `oc_zone` VALUES (2483,164,'DA',1);
INSERT INTO `oc_zone` VALUES (2484,164,'HE',1);
INSERT INTO `oc_zone` VALUES (2485,164,'LS',1);
INSERT INTO `oc_zone` VALUES (2486,164,'PA',1);
INSERT INTO `oc_zone` VALUES (2487,164,'SB',1);
INSERT INTO `oc_zone` VALUES (2488,164,'VG',1);
INSERT INTO `oc_zone` VALUES (2489,165,'BV',1);
INSERT INTO `oc_zone` VALUES (2490,165,'CE',1);
INSERT INTO `oc_zone` VALUES (2491,165,'CH',1);
INSERT INTO `oc_zone` VALUES (2492,165,'EH',1);
INSERT INTO `oc_zone` VALUES (2493,165,'EB',1);
INSERT INTO `oc_zone` VALUES (2494,165,'ES',1);
INSERT INTO `oc_zone` VALUES (2495,165,'EN',1);
INSERT INTO `oc_zone` VALUES (2496,165,'GU',1);
INSERT INTO `oc_zone` VALUES (2497,165,'MD',1);
INSERT INTO `oc_zone` VALUES (2498,165,'MN',1);
INSERT INTO `oc_zone` VALUES (2499,165,'MB',1);
INSERT INTO `oc_zone` VALUES (2500,165,'MR',1);
INSERT INTO `oc_zone` VALUES (2501,165,'NC',1);
INSERT INTO `oc_zone` VALUES (2502,165,'NI',1);
INSERT INTO `oc_zone` VALUES (2503,165,'NO',1);
INSERT INTO `oc_zone` VALUES (2504,165,'SA',1);
INSERT INTO `oc_zone` VALUES (2505,165,'SH',1);
INSERT INTO `oc_zone` VALUES (2506,165,'WE',1);
INSERT INTO `oc_zone` VALUES (2507,165,'WH',1);
INSERT INTO `oc_zone` VALUES (2508,165,'WB',1);
INSERT INTO `oc_zone` VALUES (2509,166,'AG',1);
INSERT INTO `oc_zone` VALUES (2510,166,'AN',1);
INSERT INTO `oc_zone` VALUES (2511,166,'AM',1);
INSERT INTO `oc_zone` VALUES (2512,166,'AS',1);
INSERT INTO `oc_zone` VALUES (2513,166,'BO',1);
INSERT INTO `oc_zone` VALUES (2514,166,'CG',1);
INSERT INTO `oc_zone` VALUES (2515,166,'CZ',1);
INSERT INTO `oc_zone` VALUES (2516,166,'CN',1);
INSERT INTO `oc_zone` VALUES (2517,166,'CE',1);
INSERT INTO `oc_zone` VALUES (2518,166,'CC',1);
INSERT INTO `oc_zone` VALUES (2519,166,'CD',1);
INSERT INTO `oc_zone` VALUES (2520,166,'GU',1);
INSERT INTO `oc_zone` VALUES (2521,166,'IT',1);
INSERT INTO `oc_zone` VALUES (2522,166,'MI',1);
INSERT INTO `oc_zone` VALUES (2523,166,'NE',1);
INSERT INTO `oc_zone` VALUES (2524,166,'PA',1);
INSERT INTO `oc_zone` VALUES (2525,166,'PH',1);
INSERT INTO `oc_zone` VALUES (2526,166,'SP',1);
INSERT INTO `oc_zone` VALUES (2527,167,'AM',1);
INSERT INTO `oc_zone` VALUES (2528,167,'AN',1);
INSERT INTO `oc_zone` VALUES (2529,167,'AP',1);
INSERT INTO `oc_zone` VALUES (2530,167,'AR',1);
INSERT INTO `oc_zone` VALUES (2531,167,'AY',1);
INSERT INTO `oc_zone` VALUES (2532,167,'CJ',1);
INSERT INTO `oc_zone` VALUES (2533,167,'CL',1);
INSERT INTO `oc_zone` VALUES (2534,167,'CU',1);
INSERT INTO `oc_zone` VALUES (2535,167,'HV',1);
INSERT INTO `oc_zone` VALUES (2536,167,'HO',1);
INSERT INTO `oc_zone` VALUES (2537,167,'IC',1);
INSERT INTO `oc_zone` VALUES (2538,167,'JU',1);
INSERT INTO `oc_zone` VALUES (2539,167,'LD',1);
INSERT INTO `oc_zone` VALUES (2540,167,'LY',1);
INSERT INTO `oc_zone` VALUES (2541,167,'LI',1);
INSERT INTO `oc_zone` VALUES (2542,167,'LO',1);
INSERT INTO `oc_zone` VALUES (2543,167,'MD',1);
INSERT INTO `oc_zone` VALUES (2544,167,'MO',1);
INSERT INTO `oc_zone` VALUES (2545,167,'PA',1);
INSERT INTO `oc_zone` VALUES (2546,167,'PI',1);
INSERT INTO `oc_zone` VALUES (2547,167,'PU',1);
INSERT INTO `oc_zone` VALUES (2548,167,'SM',1);
INSERT INTO `oc_zone` VALUES (2549,167,'TA',1);
INSERT INTO `oc_zone` VALUES (2550,167,'TU',1);
INSERT INTO `oc_zone` VALUES (2551,167,'UC',1);
INSERT INTO `oc_zone` VALUES (2552,168,'ABR',1);
INSERT INTO `oc_zone` VALUES (2553,168,'ANO',1);
INSERT INTO `oc_zone` VALUES (2554,168,'ASU',1);
INSERT INTO `oc_zone` VALUES (2555,168,'AKL',1);
INSERT INTO `oc_zone` VALUES (2556,168,'ALB',1);
INSERT INTO `oc_zone` VALUES (2557,168,'ANT',1);
INSERT INTO `oc_zone` VALUES (2558,168,'APY',1);
INSERT INTO `oc_zone` VALUES (2559,168,'AUR',1);
INSERT INTO `oc_zone` VALUES (2560,168,'BAS',1);
INSERT INTO `oc_zone` VALUES (2561,168,'BTA',1);
INSERT INTO `oc_zone` VALUES (2562,168,'BTE',1);
INSERT INTO `oc_zone` VALUES (2563,168,'BTG',1);
INSERT INTO `oc_zone` VALUES (2564,168,'BLR',1);
INSERT INTO `oc_zone` VALUES (2565,168,'BEN',1);
INSERT INTO `oc_zone` VALUES (2566,168,'BOL',1);
INSERT INTO `oc_zone` VALUES (2567,168,'BUK',1);
INSERT INTO `oc_zone` VALUES (2568,168,'BUL',1);
INSERT INTO `oc_zone` VALUES (2569,168,'CAG',1);
INSERT INTO `oc_zone` VALUES (2570,168,'CNO',1);
INSERT INTO `oc_zone` VALUES (2571,168,'CSU',1);
INSERT INTO `oc_zone` VALUES (2572,168,'CAM',1);
INSERT INTO `oc_zone` VALUES (2573,168,'CAP',1);
INSERT INTO `oc_zone` VALUES (2574,168,'CAT',1);
INSERT INTO `oc_zone` VALUES (2575,168,'CAV',1);
INSERT INTO `oc_zone` VALUES (2576,168,'CEB',1);
INSERT INTO `oc_zone` VALUES (2577,168,'CMP',1);
INSERT INTO `oc_zone` VALUES (2578,168,'DNO',1);
INSERT INTO `oc_zone` VALUES (2579,168,'DSU',1);
INSERT INTO `oc_zone` VALUES (2580,168,'DOR',1);
INSERT INTO `oc_zone` VALUES (2581,168,'ESA',1);
INSERT INTO `oc_zone` VALUES (2582,168,'GUI',1);
INSERT INTO `oc_zone` VALUES (2583,168,'IFU',1);
INSERT INTO `oc_zone` VALUES (2584,168,'INO',1);
INSERT INTO `oc_zone` VALUES (2585,168,'ISU',1);
INSERT INTO `oc_zone` VALUES (2586,168,'ILO',1);
INSERT INTO `oc_zone` VALUES (2587,168,'ISA',1);
INSERT INTO `oc_zone` VALUES (2588,168,'KAL',1);
INSERT INTO `oc_zone` VALUES (2589,168,'LAG',1);
INSERT INTO `oc_zone` VALUES (2590,168,'LNO',1);
INSERT INTO `oc_zone` VALUES (2591,168,'LSU',1);
INSERT INTO `oc_zone` VALUES (2592,168,'UNI',1);
INSERT INTO `oc_zone` VALUES (2593,168,'LEY',1);
INSERT INTO `oc_zone` VALUES (2594,168,'MAG',1);
INSERT INTO `oc_zone` VALUES (2595,168,'MRN',1);
INSERT INTO `oc_zone` VALUES (2596,168,'MSB',1);
INSERT INTO `oc_zone` VALUES (2597,168,'MIC',1);
INSERT INTO `oc_zone` VALUES (2598,168,'MIR',1);
INSERT INTO `oc_zone` VALUES (2599,168,'MSC',1);
INSERT INTO `oc_zone` VALUES (2600,168,'MOR',1);
INSERT INTO `oc_zone` VALUES (2601,168,'MOP',1);
INSERT INTO `oc_zone` VALUES (2602,168,'NOC',1);
INSERT INTO `oc_zone` VALUES (2603,168,'NOR',1);
INSERT INTO `oc_zone` VALUES (2604,168,'NCT',1);
INSERT INTO `oc_zone` VALUES (2605,168,'NSM',1);
INSERT INTO `oc_zone` VALUES (2606,168,'NEC',1);
INSERT INTO `oc_zone` VALUES (2607,168,'NVZ',1);
INSERT INTO `oc_zone` VALUES (2608,168,'PLW',1);
INSERT INTO `oc_zone` VALUES (2609,168,'PMP',1);
INSERT INTO `oc_zone` VALUES (2610,168,'PNG',1);
INSERT INTO `oc_zone` VALUES (2611,168,'QZN',1);
INSERT INTO `oc_zone` VALUES (2612,168,'QRN',1);
INSERT INTO `oc_zone` VALUES (2613,168,'RIZ',1);
INSERT INTO `oc_zone` VALUES (2614,168,'ROM',1);
INSERT INTO `oc_zone` VALUES (2615,168,'SMR',1);
INSERT INTO `oc_zone` VALUES (2616,168,'SRG',1);
INSERT INTO `oc_zone` VALUES (2617,168,'SQJ',1);
INSERT INTO `oc_zone` VALUES (2618,168,'SRS',1);
INSERT INTO `oc_zone` VALUES (2619,168,'SCO',1);
INSERT INTO `oc_zone` VALUES (2620,168,'SLE',1);
INSERT INTO `oc_zone` VALUES (2621,168,'SKU',1);
INSERT INTO `oc_zone` VALUES (2622,168,'SLU',1);
INSERT INTO `oc_zone` VALUES (2623,168,'SNO',1);
INSERT INTO `oc_zone` VALUES (2624,168,'SSU',1);
INSERT INTO `oc_zone` VALUES (2625,168,'TAR',1);
INSERT INTO `oc_zone` VALUES (2626,168,'TAW',1);
INSERT INTO `oc_zone` VALUES (2627,168,'ZBL',1);
INSERT INTO `oc_zone` VALUES (2628,168,'ZNO',1);
INSERT INTO `oc_zone` VALUES (2629,168,'ZSU',1);
INSERT INTO `oc_zone` VALUES (2630,168,'ZSI',1);
INSERT INTO `oc_zone` VALUES (2631,170,'DO',1);
INSERT INTO `oc_zone` VALUES (2632,170,'KP',1);
INSERT INTO `oc_zone` VALUES (2633,170,'LO',1);
INSERT INTO `oc_zone` VALUES (2634,170,'LL',1);
INSERT INTO `oc_zone` VALUES (2635,170,'LU',1);
INSERT INTO `oc_zone` VALUES (2636,170,'ML',1);
INSERT INTO `oc_zone` VALUES (2637,170,'MZ',1);
INSERT INTO `oc_zone` VALUES (2638,170,'OP',1);
INSERT INTO `oc_zone` VALUES (2639,170,'PP',1);
INSERT INTO `oc_zone` VALUES (2640,170,'PL',1);
INSERT INTO `oc_zone` VALUES (2641,170,'PM',1);
INSERT INTO `oc_zone` VALUES (2642,170,'SL',1);
INSERT INTO `oc_zone` VALUES (2643,170,'SW',1);
INSERT INTO `oc_zone` VALUES (2644,170,'WM',1);
INSERT INTO `oc_zone` VALUES (2645,170,'WP',1);
INSERT INTO `oc_zone` VALUES (2646,170,'ZA',1);
INSERT INTO `oc_zone` VALUES (2647,198,'P',1);
INSERT INTO `oc_zone` VALUES (2648,198,'M',1);
INSERT INTO `oc_zone` VALUES (2649,171,'20',1);
INSERT INTO `oc_zone` VALUES (2650,171,'01',1);
INSERT INTO `oc_zone` VALUES (2651,171,'02',1);
INSERT INTO `oc_zone` VALUES (2652,171,'03',1);
INSERT INTO `oc_zone` VALUES (2653,171,'04',1);
INSERT INTO `oc_zone` VALUES (2654,171,'05',1);
INSERT INTO `oc_zone` VALUES (2655,171,'06',1);
INSERT INTO `oc_zone` VALUES (2656,171,'07',1);
INSERT INTO `oc_zone` VALUES (2657,171,'08',1);
INSERT INTO `oc_zone` VALUES (2658,171,'09',1);
INSERT INTO `oc_zone` VALUES (2659,171,'10',1);
INSERT INTO `oc_zone` VALUES (2660,171,'11',1);
INSERT INTO `oc_zone` VALUES (2661,171,'30',1);
INSERT INTO `oc_zone` VALUES (2662,171,'12',1);
INSERT INTO `oc_zone` VALUES (2663,171,'13',1);
INSERT INTO `oc_zone` VALUES (2664,171,'14',1);
INSERT INTO `oc_zone` VALUES (2665,171,'15',1);
INSERT INTO `oc_zone` VALUES (2666,171,'16',1);
INSERT INTO `oc_zone` VALUES (2667,171,'17',1);
INSERT INTO `oc_zone` VALUES (2668,171,'VI',1);
INSERT INTO `oc_zone` VALUES (2669,173,'DW',1);
INSERT INTO `oc_zone` VALUES (2670,173,'GW',1);
INSERT INTO `oc_zone` VALUES (2671,173,'JM',1);
INSERT INTO `oc_zone` VALUES (2672,173,'KR',1);
INSERT INTO `oc_zone` VALUES (2673,173,'WK',1);
INSERT INTO `oc_zone` VALUES (2674,173,'RN',1);
INSERT INTO `oc_zone` VALUES (2675,173,'JB',1);
INSERT INTO `oc_zone` VALUES (2676,173,'MS',1);
INSERT INTO `oc_zone` VALUES (2677,173,'UD',1);
INSERT INTO `oc_zone` VALUES (2678,173,'UL',1);
INSERT INTO `oc_zone` VALUES (2679,175,'AB',1);
INSERT INTO `oc_zone` VALUES (2680,175,'AR',1);
INSERT INTO `oc_zone` VALUES (2681,175,'AG',1);
INSERT INTO `oc_zone` VALUES (2682,175,'BC',1);
INSERT INTO `oc_zone` VALUES (2683,175,'BH',1);
INSERT INTO `oc_zone` VALUES (2684,175,'BN',1);
INSERT INTO `oc_zone` VALUES (2685,175,'BT',1);
INSERT INTO `oc_zone` VALUES (2686,175,'BV',1);
INSERT INTO `oc_zone` VALUES (2687,175,'BR',1);
INSERT INTO `oc_zone` VALUES (2688,175,'B',1);
INSERT INTO `oc_zone` VALUES (2689,175,'BZ',1);
INSERT INTO `oc_zone` VALUES (2690,175,'CS',1);
INSERT INTO `oc_zone` VALUES (2691,175,'CL',1);
INSERT INTO `oc_zone` VALUES (2692,175,'CJ',1);
INSERT INTO `oc_zone` VALUES (2693,175,'CT',1);
INSERT INTO `oc_zone` VALUES (2694,175,'CV',1);
INSERT INTO `oc_zone` VALUES (2695,175,'DB',1);
INSERT INTO `oc_zone` VALUES (2696,175,'DJ',1);
INSERT INTO `oc_zone` VALUES (2697,175,'GL',1);
INSERT INTO `oc_zone` VALUES (2698,175,'GR',1);
INSERT INTO `oc_zone` VALUES (2699,175,'GJ',1);
INSERT INTO `oc_zone` VALUES (2700,175,'HR',1);
INSERT INTO `oc_zone` VALUES (2701,175,'HD',1);
INSERT INTO `oc_zone` VALUES (2702,175,'IL',1);
INSERT INTO `oc_zone` VALUES (2703,175,'IS',1);
INSERT INTO `oc_zone` VALUES (2704,175,'IF',1);
INSERT INTO `oc_zone` VALUES (2705,175,'MM',1);
INSERT INTO `oc_zone` VALUES (2706,175,'MH',1);
INSERT INTO `oc_zone` VALUES (2707,175,'MS',1);
INSERT INTO `oc_zone` VALUES (2708,175,'NT',1);
INSERT INTO `oc_zone` VALUES (2709,175,'OT',1);
INSERT INTO `oc_zone` VALUES (2710,175,'PH',1);
INSERT INTO `oc_zone` VALUES (2711,175,'SM',1);
INSERT INTO `oc_zone` VALUES (2712,175,'SJ',1);
INSERT INTO `oc_zone` VALUES (2713,175,'SB',1);
INSERT INTO `oc_zone` VALUES (2714,175,'SV',1);
INSERT INTO `oc_zone` VALUES (2715,175,'TR',1);
INSERT INTO `oc_zone` VALUES (2716,175,'TM',1);
INSERT INTO `oc_zone` VALUES (2717,175,'TL',1);
INSERT INTO `oc_zone` VALUES (2718,175,'VS',1);
INSERT INTO `oc_zone` VALUES (2719,175,'VL',1);
INSERT INTO `oc_zone` VALUES (2720,175,'VN',1);
INSERT INTO `oc_zone` VALUES (2809,177,'BU',1);
INSERT INTO `oc_zone` VALUES (2810,177,'BY',1);
INSERT INTO `oc_zone` VALUES (2811,177,'CY',1);
INSERT INTO `oc_zone` VALUES (2812,177,'GK',1);
INSERT INTO `oc_zone` VALUES (2813,177,'GS',1);
INSERT INTO `oc_zone` VALUES (2814,177,'GT',1);
INSERT INTO `oc_zone` VALUES (2815,177,'KG',1);
INSERT INTO `oc_zone` VALUES (2816,177,'KY',1);
INSERT INTO `oc_zone` VALUES (2817,177,'KR',1);
INSERT INTO `oc_zone` VALUES (2818,177,'KV',1);
INSERT INTO `oc_zone` VALUES (2819,177,'RU',1);
INSERT INTO `oc_zone` VALUES (2820,177,'UM',1);
INSERT INTO `oc_zone` VALUES (2821,178,'CCN',1);
INSERT INTO `oc_zone` VALUES (2822,178,'SAS',1);
INSERT INTO `oc_zone` VALUES (2823,178,'SGB',1);
INSERT INTO `oc_zone` VALUES (2824,178,'SGG',1);
INSERT INTO `oc_zone` VALUES (2825,178,'SJW',1);
INSERT INTO `oc_zone` VALUES (2826,178,'SJC',1);
INSERT INTO `oc_zone` VALUES (2827,178,'SJF',1);
INSERT INTO `oc_zone` VALUES (2828,178,'SMC',1);
INSERT INTO `oc_zone` VALUES (2829,178,'CAP',1);
INSERT INTO `oc_zone` VALUES (2830,178,'CHA',1);
INSERT INTO `oc_zone` VALUES (2831,178,'SPB',1);
INSERT INTO `oc_zone` VALUES (2832,178,'STL',1);
INSERT INTO `oc_zone` VALUES (2833,178,'STM',1);
INSERT INTO `oc_zone` VALUES (2834,178,'TPP',1);
INSERT INTO `oc_zone` VALUES (2835,179,'AR',1);
INSERT INTO `oc_zone` VALUES (2836,179,'CA',1);
INSERT INTO `oc_zone` VALUES (2837,179,'CH',1);
INSERT INTO `oc_zone` VALUES (2838,179,'DA',1);
INSERT INTO `oc_zone` VALUES (2839,179,'DE',1);
INSERT INTO `oc_zone` VALUES (2840,179,'GI',1);
INSERT INTO `oc_zone` VALUES (2841,179,'LA',1);
INSERT INTO `oc_zone` VALUES (2842,179,'MI',1);
INSERT INTO `oc_zone` VALUES (2843,179,'PR',1);
INSERT INTO `oc_zone` VALUES (2844,179,'SO',1);
INSERT INTO `oc_zone` VALUES (2845,179,'VF',1);
INSERT INTO `oc_zone` VALUES (2846,180,'C',1);
INSERT INTO `oc_zone` VALUES (2847,180,'R',1);
INSERT INTO `oc_zone` VALUES (2848,180,'A',1);
INSERT INTO `oc_zone` VALUES (2849,180,'D',1);
INSERT INTO `oc_zone` VALUES (2850,180,'G',1);
INSERT INTO `oc_zone` VALUES (2851,180,'P',1);
INSERT INTO `oc_zone` VALUES (2852,181,'AN',1);
INSERT INTO `oc_zone` VALUES (2853,181,'AI',1);
INSERT INTO `oc_zone` VALUES (2854,181,'AT',1);
INSERT INTO `oc_zone` VALUES (2855,181,'FA',1);
INSERT INTO `oc_zone` VALUES (2856,181,'GE',1);
INSERT INTO `oc_zone` VALUES (2857,181,'GF',1);
INSERT INTO `oc_zone` VALUES (2858,181,'PA',1);
INSERT INTO `oc_zone` VALUES (2859,181,'SA',1);
INSERT INTO `oc_zone` VALUES (2860,181,'TU',1);
INSERT INTO `oc_zone` VALUES (2861,181,'VF',1);
INSERT INTO `oc_zone` VALUES (2862,181,'VS',1);
INSERT INTO `oc_zone` VALUES (2863,182,'AC',1);
INSERT INTO `oc_zone` VALUES (2864,182,'BM',1);
INSERT INTO `oc_zone` VALUES (2865,182,'CH',1);
INSERT INTO `oc_zone` VALUES (2866,182,'DO',1);
INSERT INTO `oc_zone` VALUES (2867,182,'FA',1);
INSERT INTO `oc_zone` VALUES (2868,182,'FI',1);
INSERT INTO `oc_zone` VALUES (2869,182,'MO',1);
INSERT INTO `oc_zone` VALUES (2870,182,'SM',1);
INSERT INTO `oc_zone` VALUES (2871,182,'SE',1);
INSERT INTO `oc_zone` VALUES (2872,183,'S',1);
INSERT INTO `oc_zone` VALUES (2873,183,'P',1);
INSERT INTO `oc_zone` VALUES (2874,184,'BH',1);
INSERT INTO `oc_zone` VALUES (2875,184,'HS',1);
INSERT INTO `oc_zone` VALUES (2876,184,'JF',1);
INSERT INTO `oc_zone` VALUES (2877,184,'MD',1);
INSERT INTO `oc_zone` VALUES (2878,184,'QS',1);
INSERT INTO `oc_zone` VALUES (2879,184,'RD',1);
INSERT INTO `oc_zone` VALUES (2880,184,'AQ',1);
INSERT INTO `oc_zone` VALUES (2881,184,'AS',1);
INSERT INTO `oc_zone` VALUES (2882,184,'HL',1);
INSERT INTO `oc_zone` VALUES (2883,184,'JZ',1);
INSERT INTO `oc_zone` VALUES (2884,184,'ML',1);
INSERT INTO `oc_zone` VALUES (2885,184,'NR',1);
INSERT INTO `oc_zone` VALUES (2886,184,'TB',1);
INSERT INTO `oc_zone` VALUES (2887,185,'DA',1);
INSERT INTO `oc_zone` VALUES (2888,185,'DI',1);
INSERT INTO `oc_zone` VALUES (2889,185,'FA',1);
INSERT INTO `oc_zone` VALUES (2890,185,'KA',1);
INSERT INTO `oc_zone` VALUES (2891,185,'KO',1);
INSERT INTO `oc_zone` VALUES (2892,185,'LO',1);
INSERT INTO `oc_zone` VALUES (2893,185,'MA',1);
INSERT INTO `oc_zone` VALUES (2894,185,'SL',1);
INSERT INTO `oc_zone` VALUES (2895,185,'TA',1);
INSERT INTO `oc_zone` VALUES (2896,185,'TH',1);
INSERT INTO `oc_zone` VALUES (2897,185,'ZI',1);
INSERT INTO `oc_zone` VALUES (2898,186,'AP',1);
INSERT INTO `oc_zone` VALUES (2899,186,'AB',1);
INSERT INTO `oc_zone` VALUES (2900,186,'AE',1);
INSERT INTO `oc_zone` VALUES (2901,186,'AL',1);
INSERT INTO `oc_zone` VALUES (2902,186,'AR',1);
INSERT INTO `oc_zone` VALUES (2903,186,'BL',1);
INSERT INTO `oc_zone` VALUES (2904,186,'BS',1);
INSERT INTO `oc_zone` VALUES (2905,186,'BV',1);
INSERT INTO `oc_zone` VALUES (2906,186,'BA',1);
INSERT INTO `oc_zone` VALUES (2907,186,'BO',1);
INSERT INTO `oc_zone` VALUES (2908,186,'CA',1);
INSERT INTO `oc_zone` VALUES (2909,186,'GL',1);
INSERT INTO `oc_zone` VALUES (2910,186,'GM',1);
INSERT INTO `oc_zone` VALUES (2911,186,'GP',1);
INSERT INTO `oc_zone` VALUES (2912,186,'DG',1);
INSERT INTO `oc_zone` VALUES (2913,186,'RA',1);
INSERT INTO `oc_zone` VALUES (2914,186,'MB',1);
INSERT INTO `oc_zone` VALUES (2915,186,'MF',1);
INSERT INTO `oc_zone` VALUES (2916,186,'PL',1);
INSERT INTO `oc_zone` VALUES (2917,186,'PR',1);
INSERT INTO `oc_zone` VALUES (2918,186,'PG',1);
INSERT INTO `oc_zone` VALUES (2919,186,'SL',1);
INSERT INTO `oc_zone` VALUES (2920,186,'TA',1);
INSERT INTO `oc_zone` VALUES (2921,187,'E',1);
INSERT INTO `oc_zone` VALUES (2922,187,'N',1);
INSERT INTO `oc_zone` VALUES (2923,187,'S',1);
INSERT INTO `oc_zone` VALUES (2924,187,'W',1);
INSERT INTO `oc_zone` VALUES (2925,189,'BC',1);
INSERT INTO `oc_zone` VALUES (2926,189,'BL',1);
INSERT INTO `oc_zone` VALUES (2927,189,'KI',1);
INSERT INTO `oc_zone` VALUES (2928,189,'NI',1);
INSERT INTO `oc_zone` VALUES (2929,189,'PV',1);
INSERT INTO `oc_zone` VALUES (2930,189,'TC',1);
INSERT INTO `oc_zone` VALUES (2931,189,'TA',1);
INSERT INTO `oc_zone` VALUES (2932,189,'ZI',1);
INSERT INTO `oc_zone` VALUES (2933,191,'CE',1);
INSERT INTO `oc_zone` VALUES (2934,191,'CH',1);
INSERT INTO `oc_zone` VALUES (2935,191,'GC',1);
INSERT INTO `oc_zone` VALUES (2936,191,'HO',1);
INSERT INTO `oc_zone` VALUES (2937,191,'IS',1);
INSERT INTO `oc_zone` VALUES (2938,191,'MK',1);
INSERT INTO `oc_zone` VALUES (2939,191,'ML',1);
INSERT INTO `oc_zone` VALUES (2940,191,'RB',1);
INSERT INTO `oc_zone` VALUES (2941,191,'TM',1);
INSERT INTO `oc_zone` VALUES (2942,191,'WE',1);
INSERT INTO `oc_zone` VALUES (2943,192,'AW',1);
INSERT INTO `oc_zone` VALUES (2944,192,'BK',1);
INSERT INTO `oc_zone` VALUES (2945,192,'BN',1);
INSERT INTO `oc_zone` VALUES (2946,192,'BR',1);
INSERT INTO `oc_zone` VALUES (2947,192,'BY',1);
INSERT INTO `oc_zone` VALUES (2948,192,'GA',1);
INSERT INTO `oc_zone` VALUES (2949,192,'GE',1);
INSERT INTO `oc_zone` VALUES (2950,192,'HI',1);
INSERT INTO `oc_zone` VALUES (2951,192,'JD',1);
INSERT INTO `oc_zone` VALUES (2952,192,'JH',1);
INSERT INTO `oc_zone` VALUES (2953,192,'MU',1);
INSERT INTO `oc_zone` VALUES (2954,192,'NU',1);
INSERT INTO `oc_zone` VALUES (2955,192,'SA',1);
INSERT INTO `oc_zone` VALUES (2956,192,'SD',1);
INSERT INTO `oc_zone` VALUES (2957,192,'SH',1);
INSERT INTO `oc_zone` VALUES (2958,192,'SL',1);
INSERT INTO `oc_zone` VALUES (2959,192,'TO',1);
INSERT INTO `oc_zone` VALUES (2960,192,'WG',1);
INSERT INTO `oc_zone` VALUES (2961,193,'EC',1);
INSERT INTO `oc_zone` VALUES (2962,193,'FS',1);
INSERT INTO `oc_zone` VALUES (2963,193,'GP',1);
INSERT INTO `oc_zone` VALUES (2964,193,'KZN',1);
INSERT INTO `oc_zone` VALUES (2965,193,'LP',1);
INSERT INTO `oc_zone` VALUES (2966,193,'MP',1);
INSERT INTO `oc_zone` VALUES (2967,193,'NW',1);
INSERT INTO `oc_zone` VALUES (2968,193,'NC',1);
INSERT INTO `oc_zone` VALUES (2969,193,'WC',1);
INSERT INTO `oc_zone` VALUES (2970,195,'C',1);
INSERT INTO `oc_zone` VALUES (2971,195,'VI',1);
INSERT INTO `oc_zone` VALUES (2972,195,'AB',1);
INSERT INTO `oc_zone` VALUES (2973,195,'A',1);
INSERT INTO `oc_zone` VALUES (2974,195,'AL',1);
INSERT INTO `oc_zone` VALUES (2975,195,'O',1);
INSERT INTO `oc_zone` VALUES (2976,195,'AV',1);
INSERT INTO `oc_zone` VALUES (2977,195,'BA',1);
INSERT INTO `oc_zone` VALUES (2978,195,'IB',1);
INSERT INTO `oc_zone` VALUES (2979,195,'B',1);
INSERT INTO `oc_zone` VALUES (2980,195,'BU',1);
INSERT INTO `oc_zone` VALUES (2981,195,'CC',1);
INSERT INTO `oc_zone` VALUES (2982,195,'CA',1);
INSERT INTO `oc_zone` VALUES (2983,195,'S',1);
INSERT INTO `oc_zone` VALUES (2984,195,'CS',1);
INSERT INTO `oc_zone` VALUES (2985,195,'CE',1);
INSERT INTO `oc_zone` VALUES (2986,195,'CR',1);
INSERT INTO `oc_zone` VALUES (2987,195,'CO',1);
INSERT INTO `oc_zone` VALUES (2988,195,'CU',1);
INSERT INTO `oc_zone` VALUES (2989,195,'GI',1);
INSERT INTO `oc_zone` VALUES (2990,195,'GR',1);
INSERT INTO `oc_zone` VALUES (2991,195,'GU',1);
INSERT INTO `oc_zone` VALUES (2992,195,'SS',1);
INSERT INTO `oc_zone` VALUES (2993,195,'H',1);
INSERT INTO `oc_zone` VALUES (2994,195,'HU',1);
INSERT INTO `oc_zone` VALUES (2995,195,'J',1);
INSERT INTO `oc_zone` VALUES (2996,195,'LO',1);
INSERT INTO `oc_zone` VALUES (2997,195,'GC',1);
INSERT INTO `oc_zone` VALUES (2998,195,'CL',1);
INSERT INTO `oc_zone` VALUES (2999,195,'L',1);
INSERT INTO `oc_zone` VALUES (3000,195,'LU',1);
INSERT INTO `oc_zone` VALUES (3001,195,'M',1);
INSERT INTO `oc_zone` VALUES (3002,195,'MA',1);
INSERT INTO `oc_zone` VALUES (3003,195,'ML',1);
INSERT INTO `oc_zone` VALUES (3004,195,'MU',1);
INSERT INTO `oc_zone` VALUES (3005,195,'NA',1);
INSERT INTO `oc_zone` VALUES (3006,195,'OR',1);
INSERT INTO `oc_zone` VALUES (3007,195,'P',1);
INSERT INTO `oc_zone` VALUES (3008,195,'PO',1);
INSERT INTO `oc_zone` VALUES (3009,195,'SA',1);
INSERT INTO `oc_zone` VALUES (3010,195,'TF',1);
INSERT INTO `oc_zone` VALUES (3011,195,'SG',1);
INSERT INTO `oc_zone` VALUES (3012,195,'SE',1);
INSERT INTO `oc_zone` VALUES (3013,195,'SO',1);
INSERT INTO `oc_zone` VALUES (3014,195,'T',1);
INSERT INTO `oc_zone` VALUES (3015,195,'TE',1);
INSERT INTO `oc_zone` VALUES (3016,195,'TO',1);
INSERT INTO `oc_zone` VALUES (3017,195,'V',1);
INSERT INTO `oc_zone` VALUES (3018,195,'VA',1);
INSERT INTO `oc_zone` VALUES (3019,195,'BI',1);
INSERT INTO `oc_zone` VALUES (3020,195,'ZA',1);
INSERT INTO `oc_zone` VALUES (3021,195,'Z',1);
INSERT INTO `oc_zone` VALUES (3022,196,'CE',1);
INSERT INTO `oc_zone` VALUES (3023,196,'EA',1);
INSERT INTO `oc_zone` VALUES (3024,196,'NC',1);
INSERT INTO `oc_zone` VALUES (3025,196,'NO',1);
INSERT INTO `oc_zone` VALUES (3026,196,'NW',1);
INSERT INTO `oc_zone` VALUES (3027,196,'SA',1);
INSERT INTO `oc_zone` VALUES (3028,196,'SO',1);
INSERT INTO `oc_zone` VALUES (3029,196,'UV',1);
INSERT INTO `oc_zone` VALUES (3030,196,'WE',1);
INSERT INTO `oc_zone` VALUES (3032,197,'S',1);
INSERT INTO `oc_zone` VALUES (3034,199,'ANL',1);
INSERT INTO `oc_zone` VALUES (3035,199,'BAM',1);
INSERT INTO `oc_zone` VALUES (3036,199,'BRT',1);
INSERT INTO `oc_zone` VALUES (3037,199,'JZR',1);
INSERT INTO `oc_zone` VALUES (3038,199,'KRT',1);
INSERT INTO `oc_zone` VALUES (3039,199,'QDR',1);
INSERT INTO `oc_zone` VALUES (3040,199,'WDH',1);
INSERT INTO `oc_zone` VALUES (3041,199,'ANB',1);
INSERT INTO `oc_zone` VALUES (3042,199,'ANZ',1);
INSERT INTO `oc_zone` VALUES (3043,199,'ASH',1);
INSERT INTO `oc_zone` VALUES (3044,199,'BJA',1);
INSERT INTO `oc_zone` VALUES (3045,199,'GIS',1);
INSERT INTO `oc_zone` VALUES (3046,199,'GBG',1);
INSERT INTO `oc_zone` VALUES (3047,199,'GDA',1);
INSERT INTO `oc_zone` VALUES (3048,199,'GKU',1);
INSERT INTO `oc_zone` VALUES (3049,199,'JDA',1);
INSERT INTO `oc_zone` VALUES (3050,199,'JKU',1);
INSERT INTO `oc_zone` VALUES (3051,199,'JQL',1);
INSERT INTO `oc_zone` VALUES (3052,199,'KSL',1);
INSERT INTO `oc_zone` VALUES (3053,199,'NNL',1);
INSERT INTO `oc_zone` VALUES (3054,199,'SBG',1);
INSERT INTO `oc_zone` VALUES (3055,199,'SDA',1);
INSERT INTO `oc_zone` VALUES (3056,199,'SKU',1);
INSERT INTO `oc_zone` VALUES (3057,199,'SIS',1);
INSERT INTO `oc_zone` VALUES (3058,199,'SNR',1);
INSERT INTO `oc_zone` VALUES (3059,199,'WRB',1);
INSERT INTO `oc_zone` VALUES (3060,200,'BR',1);
INSERT INTO `oc_zone` VALUES (3061,200,'CM',1);
INSERT INTO `oc_zone` VALUES (3062,200,'CR',1);
INSERT INTO `oc_zone` VALUES (3063,200,'MA',1);
INSERT INTO `oc_zone` VALUES (3064,200,'NI',1);
INSERT INTO `oc_zone` VALUES (3065,200,'PA',1);
INSERT INTO `oc_zone` VALUES (3066,200,'PM',1);
INSERT INTO `oc_zone` VALUES (3067,200,'SA',1);
INSERT INTO `oc_zone` VALUES (3068,200,'SI',1);
INSERT INTO `oc_zone` VALUES (3069,200,'WA',1);
INSERT INTO `oc_zone` VALUES (3070,202,'H',1);
INSERT INTO `oc_zone` VALUES (3071,202,'L',1);
INSERT INTO `oc_zone` VALUES (3072,202,'M',1);
INSERT INTO `oc_zone` VALUES (3073,202,'S',1);
INSERT INTO `oc_zone` VALUES (3074,203,'K',1);
INSERT INTO `oc_zone` VALUES (3075,203,'W',1);
INSERT INTO `oc_zone` VALUES (3076,203,'X',1);
INSERT INTO `oc_zone` VALUES (3077,203,'I',1);
INSERT INTO `oc_zone` VALUES (3078,203,'N',1);
INSERT INTO `oc_zone` VALUES (3079,203,'Z',1);
INSERT INTO `oc_zone` VALUES (3080,203,'F',1);
INSERT INTO `oc_zone` VALUES (3081,203,'H',1);
INSERT INTO `oc_zone` VALUES (3082,203,'G',1);
INSERT INTO `oc_zone` VALUES (3083,203,'BD',1);
INSERT INTO `oc_zone` VALUES (3084,203,'T',1);
INSERT INTO `oc_zone` VALUES (3085,203,'E',1);
INSERT INTO `oc_zone` VALUES (3086,203,'M',1);
INSERT INTO `oc_zone` VALUES (3087,203,'D',1);
INSERT INTO `oc_zone` VALUES (3088,203,'AB',1);
INSERT INTO `oc_zone` VALUES (3089,203,'C',1);
INSERT INTO `oc_zone` VALUES (3090,203,'S',1);
INSERT INTO `oc_zone` VALUES (3091,203,'AC',1);
INSERT INTO `oc_zone` VALUES (3092,203,'Y',1);
INSERT INTO `oc_zone` VALUES (3093,203,'U',1);
INSERT INTO `oc_zone` VALUES (3094,203,'O',1);
INSERT INTO `oc_zone` VALUES (3095,204,'AG',1);
INSERT INTO `oc_zone` VALUES (3096,204,'AR',1);
INSERT INTO `oc_zone` VALUES (3097,204,'AI',1);
INSERT INTO `oc_zone` VALUES (3098,204,'BS',1);
INSERT INTO `oc_zone` VALUES (3099,204,'BL',1);
INSERT INTO `oc_zone` VALUES (3100,204,'BE',1);
INSERT INTO `oc_zone` VALUES (3101,204,'FR',1);
INSERT INTO `oc_zone` VALUES (3102,204,'GE',1);
INSERT INTO `oc_zone` VALUES (3103,204,'GL',1);
INSERT INTO `oc_zone` VALUES (3104,204,'GR',1);
INSERT INTO `oc_zone` VALUES (3105,204,'JU',1);
INSERT INTO `oc_zone` VALUES (3106,204,'LU',1);
INSERT INTO `oc_zone` VALUES (3107,204,'NE',1);
INSERT INTO `oc_zone` VALUES (3108,204,'NW',1);
INSERT INTO `oc_zone` VALUES (3109,204,'OW',1);
INSERT INTO `oc_zone` VALUES (3110,204,'SG',1);
INSERT INTO `oc_zone` VALUES (3111,204,'SH',1);
INSERT INTO `oc_zone` VALUES (3112,204,'SZ',1);
INSERT INTO `oc_zone` VALUES (3113,204,'SO',1);
INSERT INTO `oc_zone` VALUES (3114,204,'TG',1);
INSERT INTO `oc_zone` VALUES (3115,204,'TI',1);
INSERT INTO `oc_zone` VALUES (3116,204,'UR',1);
INSERT INTO `oc_zone` VALUES (3117,204,'VS',1);
INSERT INTO `oc_zone` VALUES (3118,204,'VD',1);
INSERT INTO `oc_zone` VALUES (3119,204,'ZG',1);
INSERT INTO `oc_zone` VALUES (3120,204,'ZH',1);
INSERT INTO `oc_zone` VALUES (3121,205,'HA',1);
INSERT INTO `oc_zone` VALUES (3122,205,'LA',1);
INSERT INTO `oc_zone` VALUES (3123,205,'QU',1);
INSERT INTO `oc_zone` VALUES (3124,205,'RQ',1);
INSERT INTO `oc_zone` VALUES (3125,205,'SU',1);
INSERT INTO `oc_zone` VALUES (3126,205,'DA',1);
INSERT INTO `oc_zone` VALUES (3127,205,'DZ',1);
INSERT INTO `oc_zone` VALUES (3128,205,'DI',1);
INSERT INTO `oc_zone` VALUES (3129,205,'HL',1);
INSERT INTO `oc_zone` VALUES (3130,205,'HM',1);
INSERT INTO `oc_zone` VALUES (3131,205,'HI',1);
INSERT INTO `oc_zone` VALUES (3132,205,'ID',1);
INSERT INTO `oc_zone` VALUES (3133,205,'RD',1);
INSERT INTO `oc_zone` VALUES (3134,205,'TA',1);
INSERT INTO `oc_zone` VALUES (3135,206,'CH',1);
INSERT INTO `oc_zone` VALUES (3136,206,'CI',1);
INSERT INTO `oc_zone` VALUES (3137,206,'HS',1);
INSERT INTO `oc_zone` VALUES (3138,206,'HL',1);
INSERT INTO `oc_zone` VALUES (3139,206,'IL',1);
INSERT INTO `oc_zone` VALUES (3140,206,'KH',1);
INSERT INTO `oc_zone` VALUES (3141,206,'KM',1);
INSERT INTO `oc_zone` VALUES (3142,206,'LC',1);
INSERT INTO `oc_zone` VALUES (3143,206,'ML',1);
INSERT INTO `oc_zone` VALUES (3144,206,'NT',1);
INSERT INTO `oc_zone` VALUES (3145,206,'PH',1);
INSERT INTO `oc_zone` VALUES (3146,206,'PT',1);
INSERT INTO `oc_zone` VALUES (3147,206,'TG',1);
INSERT INTO `oc_zone` VALUES (3148,206,'TA',1);
INSERT INTO `oc_zone` VALUES (3149,206,'TP',1);
INSERT INTO `oc_zone` VALUES (3150,206,'TT',1);
INSERT INTO `oc_zone` VALUES (3151,206,'TY',1);
INSERT INTO `oc_zone` VALUES (3152,206,'YL',1);
INSERT INTO `oc_zone` VALUES (3153,206,'CC',1);
INSERT INTO `oc_zone` VALUES (3154,206,'CL',1);
INSERT INTO `oc_zone` VALUES (3155,206,'HC',1);
INSERT INTO `oc_zone` VALUES (3156,206,'TH',1);
INSERT INTO `oc_zone` VALUES (3157,206,'TN',1);
INSERT INTO `oc_zone` VALUES (3158,206,'KC',1);
INSERT INTO `oc_zone` VALUES (3159,206,'TC',1);
INSERT INTO `oc_zone` VALUES (3160,207,'GB',1);
INSERT INTO `oc_zone` VALUES (3161,207,'KT',1);
INSERT INTO `oc_zone` VALUES (3162,207,'SU',1);
INSERT INTO `oc_zone` VALUES (3163,208,'AR',1);
INSERT INTO `oc_zone` VALUES (3164,208,'DS',1);
INSERT INTO `oc_zone` VALUES (3165,208,'DO',1);
INSERT INTO `oc_zone` VALUES (3166,208,'IR',1);
INSERT INTO `oc_zone` VALUES (3167,208,'KA',1);
INSERT INTO `oc_zone` VALUES (3168,208,'KI',1);
INSERT INTO `oc_zone` VALUES (3169,208,'KJ',1);
INSERT INTO `oc_zone` VALUES (3170,208,'LN',1);
INSERT INTO `oc_zone` VALUES (3171,208,'MY',1);
INSERT INTO `oc_zone` VALUES (3172,208,'MR',1);
INSERT INTO `oc_zone` VALUES (3173,208,'MB',1);
INSERT INTO `oc_zone` VALUES (3174,208,'MO',1);
INSERT INTO `oc_zone` VALUES (3175,208,'MT',1);
INSERT INTO `oc_zone` VALUES (3176,208,'MW',1);
INSERT INTO `oc_zone` VALUES (3177,208,'PN',1);
INSERT INTO `oc_zone` VALUES (3178,208,'PS',1);
INSERT INTO `oc_zone` VALUES (3179,208,'PW',1);
INSERT INTO `oc_zone` VALUES (3180,208,'RK',1);
INSERT INTO `oc_zone` VALUES (3181,208,'RV',1);
INSERT INTO `oc_zone` VALUES (3182,208,'SH',1);
INSERT INTO `oc_zone` VALUES (3183,208,'SI',1);
INSERT INTO `oc_zone` VALUES (3184,208,'TB',1);
INSERT INTO `oc_zone` VALUES (3185,208,'TN',1);
INSERT INTO `oc_zone` VALUES (3186,208,'ZC',1);
INSERT INTO `oc_zone` VALUES (3187,208,'ZN',1);
INSERT INTO `oc_zone` VALUES (3188,208,'ZU',1);
INSERT INTO `oc_zone` VALUES (3189,209,'37',1);
INSERT INTO `oc_zone` VALUES (3190,209,'15',1);
INSERT INTO `oc_zone` VALUES (3192,209,'10',1);
INSERT INTO `oc_zone` VALUES (3193,209,'31',1);
INSERT INTO `oc_zone` VALUES (3194,209,'24',1);
INSERT INTO `oc_zone` VALUES (3195,209,'18',1);
INSERT INTO `oc_zone` VALUES (3196,209,'36',1);
INSERT INTO `oc_zone` VALUES (3197,209,'22',1);
INSERT INTO `oc_zone` VALUES (3198,209,'50',1);
INSERT INTO `oc_zone` VALUES (3199,209,'57',1);
INSERT INTO `oc_zone` VALUES (3200,209,'20',1);
INSERT INTO `oc_zone` VALUES (3201,209,'86',1);
INSERT INTO `oc_zone` VALUES (3202,209,'46',1);
INSERT INTO `oc_zone` VALUES (3203,209,'62',1);
INSERT INTO `oc_zone` VALUES (3204,209,'71',1);
INSERT INTO `oc_zone` VALUES (3205,209,'40',1);
INSERT INTO `oc_zone` VALUES (3206,209,'81',1);
INSERT INTO `oc_zone` VALUES (3207,209,'52',1);
INSERT INTO `oc_zone` VALUES (3208,209,'51',1);
INSERT INTO `oc_zone` VALUES (3209,209,'42',1);
INSERT INTO `oc_zone` VALUES (3210,209,'1',1);
INSERT INTO `oc_zone` VALUES (3211,209,'55',1);
INSERT INTO `oc_zone` VALUES (3212,209,'44',1);
INSERT INTO `oc_zone` VALUES (3213,209,'49',1);
INSERT INTO `oc_zone` VALUES (3214,209,'26',1);
INSERT INTO `oc_zone` VALUES (3215,209,'73',1);
INSERT INTO `oc_zone` VALUES (3216,209,'48',1);
INSERT INTO `oc_zone` VALUES (3217,209,'30',1);
INSERT INTO `oc_zone` VALUES (3218,209,'60',1);
INSERT INTO `oc_zone` VALUES (3219,209,'80',1);
INSERT INTO `oc_zone` VALUES (3220,209,'55',1);
INSERT INTO `oc_zone` VALUES (3221,209,'96',1);
INSERT INTO `oc_zone` VALUES (3222,209,'39',1);
INSERT INTO `oc_zone` VALUES (3223,209,'43',1);
INSERT INTO `oc_zone` VALUES (3224,209,'12',1);
INSERT INTO `oc_zone` VALUES (3225,209,'13',1);
INSERT INTO `oc_zone` VALUES (3226,209,'94',1);
INSERT INTO `oc_zone` VALUES (3227,209,'82',1);
INSERT INTO `oc_zone` VALUES (3228,209,'93',1);
INSERT INTO `oc_zone` VALUES (3229,209,'Phayao',1);
INSERT INTO `oc_zone` VALUES (3230,209,'67',1);
INSERT INTO `oc_zone` VALUES (3231,209,'76',1);
INSERT INTO `oc_zone` VALUES (3232,209,'66',1);
INSERT INTO `oc_zone` VALUES (3233,209,'65',1);
INSERT INTO `oc_zone` VALUES (3234,209,'54',1);
INSERT INTO `oc_zone` VALUES (3235,209,'83',1);
INSERT INTO `oc_zone` VALUES (3236,209,'25',1);
INSERT INTO `oc_zone` VALUES (3237,209,'77',1);
INSERT INTO `oc_zone` VALUES (3238,209,'21',1);
INSERT INTO `oc_zone` VALUES (3239,209,'70',1);
INSERT INTO `oc_zone` VALUES (3240,209,'21',1);
INSERT INTO `oc_zone` VALUES (3241,209,'45',1);
INSERT INTO `oc_zone` VALUES (3242,209,'27',1);
INSERT INTO `oc_zone` VALUES (3243,209,'47',1);
INSERT INTO `oc_zone` VALUES (3244,209,'11',1);
INSERT INTO `oc_zone` VALUES (3245,209,'74',1);
INSERT INTO `oc_zone` VALUES (3246,209,'75',1);
INSERT INTO `oc_zone` VALUES (3247,209,'19',1);
INSERT INTO `oc_zone` VALUES (3248,209,'91',1);
INSERT INTO `oc_zone` VALUES (3249,209,'17',1);
INSERT INTO `oc_zone` VALUES (3250,209,'33',1);
INSERT INTO `oc_zone` VALUES (3251,209,'90',1);
INSERT INTO `oc_zone` VALUES (3252,209,'64',1);
INSERT INTO `oc_zone` VALUES (3253,209,'72',1);
INSERT INTO `oc_zone` VALUES (3254,209,'84',1);
INSERT INTO `oc_zone` VALUES (3255,209,'32',1);
INSERT INTO `oc_zone` VALUES (3256,209,'63',1);
INSERT INTO `oc_zone` VALUES (3257,209,'92',1);
INSERT INTO `oc_zone` VALUES (3258,209,'23',1);
INSERT INTO `oc_zone` VALUES (3259,209,'34',1);
INSERT INTO `oc_zone` VALUES (3260,209,'41',1);
INSERT INTO `oc_zone` VALUES (3261,209,'61',1);
INSERT INTO `oc_zone` VALUES (3262,209,'53',1);
INSERT INTO `oc_zone` VALUES (3263,209,'95',1);
INSERT INTO `oc_zone` VALUES (3264,209,'35',1);
INSERT INTO `oc_zone` VALUES (3265,210,'K',1);
INSERT INTO `oc_zone` VALUES (3266,210,'P',1);
INSERT INTO `oc_zone` VALUES (3267,210,'S',1);
INSERT INTO `oc_zone` VALUES (3268,210,'C',1);
INSERT INTO `oc_zone` VALUES (3269,210,'M',1);
INSERT INTO `oc_zone` VALUES (3270,211,'A',1);
INSERT INTO `oc_zone` VALUES (3271,211,'F',1);
INSERT INTO `oc_zone` VALUES (3272,211,'N',1);
INSERT INTO `oc_zone` VALUES (3273,212,'H',1);
INSERT INTO `oc_zone` VALUES (3274,212,'T',1);
INSERT INTO `oc_zone` VALUES (3275,212,'V',1);
INSERT INTO `oc_zone` VALUES (3276,213,'CT',1);
INSERT INTO `oc_zone` VALUES (3277,213,'DM',1);
INSERT INTO `oc_zone` VALUES (3278,213,'MR',1);
INSERT INTO `oc_zone` VALUES (3279,213,'PD',1);
INSERT INTO `oc_zone` VALUES (3280,213,'PT',1);
INSERT INTO `oc_zone` VALUES (3281,213,'SG',1);
INSERT INTO `oc_zone` VALUES (3282,213,'SL',1);
INSERT INTO `oc_zone` VALUES (3283,213,'SI',1);
INSERT INTO `oc_zone` VALUES (3284,213,'TP',1);
INSERT INTO `oc_zone` VALUES (3285,213,'PS',1);
INSERT INTO `oc_zone` VALUES (3286,213,'SF',1);
INSERT INTO `oc_zone` VALUES (3287,213,'AR',1);
INSERT INTO `oc_zone` VALUES (3288,213,'PF',1);
INSERT INTO `oc_zone` VALUES (3289,213,'CH',1);
INSERT INTO `oc_zone` VALUES (3290,213,'TO',1);
INSERT INTO `oc_zone` VALUES (3291,214,'AR',1);
INSERT INTO `oc_zone` VALUES (3292,214,'BJ',1);
INSERT INTO `oc_zone` VALUES (3293,214,'BA',1);
INSERT INTO `oc_zone` VALUES (3294,214,'BI',1);
INSERT INTO `oc_zone` VALUES (3295,214,'GB',1);
INSERT INTO `oc_zone` VALUES (3296,214,'GF',1);
INSERT INTO `oc_zone` VALUES (3297,214,'JE',1);
INSERT INTO `oc_zone` VALUES (3298,214,'KR',1);
INSERT INTO `oc_zone` VALUES (3299,214,'KS',1);
INSERT INTO `oc_zone` VALUES (3300,214,'KB',1);
INSERT INTO `oc_zone` VALUES (3301,214,'KF',1);
INSERT INTO `oc_zone` VALUES (3302,214,'MH',1);
INSERT INTO `oc_zone` VALUES (3303,214,'MN',1);
INSERT INTO `oc_zone` VALUES (3304,214,'ME',1);
INSERT INTO `oc_zone` VALUES (3305,214,'MO',1);
INSERT INTO `oc_zone` VALUES (3306,214,'NA',1);
INSERT INTO `oc_zone` VALUES (3307,214,'SF',1);
INSERT INTO `oc_zone` VALUES (3308,214,'SD',1);
INSERT INTO `oc_zone` VALUES (3309,214,'SL',1);
INSERT INTO `oc_zone` VALUES (3310,214,'SO',1);
INSERT INTO `oc_zone` VALUES (3311,214,'TA',1);
INSERT INTO `oc_zone` VALUES (3312,214,'TO',1);
INSERT INTO `oc_zone` VALUES (3313,214,'TU',1);
INSERT INTO `oc_zone` VALUES (3314,214,'ZA',1);
INSERT INTO `oc_zone` VALUES (3315,215,'TR-01',1);
INSERT INTO `oc_zone` VALUES (3316,215,'TR-02',1);
INSERT INTO `oc_zone` VALUES (3317,215,'TR-03',1);
INSERT INTO `oc_zone` VALUES (3318,215,'TR-04',1);
INSERT INTO `oc_zone` VALUES (3319,215,'TR-68',1);
INSERT INTO `oc_zone` VALUES (3320,215,'TR-05',1);
INSERT INTO `oc_zone` VALUES (3321,215,'TR-06',1);
INSERT INTO `oc_zone` VALUES (3322,215,'TR-07',1);
INSERT INTO `oc_zone` VALUES (3323,215,'TR-75',1);
INSERT INTO `oc_zone` VALUES (3324,215,'TR-08',1);
INSERT INTO `oc_zone` VALUES (3325,215,'TR-09',1);
INSERT INTO `oc_zone` VALUES (3326,215,'TR-10',1);
INSERT INTO `oc_zone` VALUES (3327,215,'TR-74',1);
INSERT INTO `oc_zone` VALUES (3328,215,'TR-72',1);
INSERT INTO `oc_zone` VALUES (3329,215,'TR-69',1);
INSERT INTO `oc_zone` VALUES (3330,215,'TR-11',1);
INSERT INTO `oc_zone` VALUES (3331,215,'TR-12',1);
INSERT INTO `oc_zone` VALUES (3332,215,'TR-13',1);
INSERT INTO `oc_zone` VALUES (3333,215,'TR-14',1);
INSERT INTO `oc_zone` VALUES (3334,215,'TR-15',1);
INSERT INTO `oc_zone` VALUES (3335,215,'TR-16',1);
INSERT INTO `oc_zone` VALUES (3336,215,'TR-17',1);
INSERT INTO `oc_zone` VALUES (3337,215,'TR-18',1);
INSERT INTO `oc_zone` VALUES (3338,215,'TR-19',1);
INSERT INTO `oc_zone` VALUES (3339,215,'TR-20',1);
INSERT INTO `oc_zone` VALUES (3340,215,'TR-21',1);
INSERT INTO `oc_zone` VALUES (3341,215,'TR-81',1);
INSERT INTO `oc_zone` VALUES (3342,215,'TR-22',1);
INSERT INTO `oc_zone` VALUES (3343,215,'TR-23',1);
INSERT INTO `oc_zone` VALUES (3344,215,'TR-24',1);
INSERT INTO `oc_zone` VALUES (3345,215,'TR-25',1);
INSERT INTO `oc_zone` VALUES (3346,215,'TR-26',1);
INSERT INTO `oc_zone` VALUES (3347,215,'TR-27',1);
INSERT INTO `oc_zone` VALUES (3348,215,'TR-28',1);
INSERT INTO `oc_zone` VALUES (3349,215,'TR-29',1);
INSERT INTO `oc_zone` VALUES (3350,215,'TR-30',1);
INSERT INTO `oc_zone` VALUES (3351,215,'TR-31',1);
INSERT INTO `oc_zone` VALUES (3352,215,'TR-76',1);
INSERT INTO `oc_zone` VALUES (3353,215,'TR-32',1);
INSERT INTO `oc_zone` VALUES (3354,215,'TR-34',1);
INSERT INTO `oc_zone` VALUES (3355,215,'TR-35',1);
INSERT INTO `oc_zone` VALUES (3356,215,'TR-46',1);
INSERT INTO `oc_zone` VALUES (3357,215,'TR-78',1);
INSERT INTO `oc_zone` VALUES (3358,215,'TR-70',1);
INSERT INTO `oc_zone` VALUES (3359,215,'TR-36',1);
INSERT INTO `oc_zone` VALUES (3360,215,'TR-37',1);
INSERT INTO `oc_zone` VALUES (3361,215,'TR-38',1);
INSERT INTO `oc_zone` VALUES (3362,215,'TR-79',1);
INSERT INTO `oc_zone` VALUES (3363,215,'TR-71',1);
INSERT INTO `oc_zone` VALUES (3364,215,'TR-39',1);
INSERT INTO `oc_zone` VALUES (3365,215,'TR-40',1);
INSERT INTO `oc_zone` VALUES (3366,215,'TR-41',1);
INSERT INTO `oc_zone` VALUES (3367,215,'TR-42',1);
INSERT INTO `oc_zone` VALUES (3368,215,'TR-43',1);
INSERT INTO `oc_zone` VALUES (3369,215,'TR-44',1);
INSERT INTO `oc_zone` VALUES (3370,215,'TR-45',1);
INSERT INTO `oc_zone` VALUES (3371,215,'TR-47',1);
INSERT INTO `oc_zone` VALUES (3372,215,'TR-33',1);
INSERT INTO `oc_zone` VALUES (3373,215,'TR-48',1);
INSERT INTO `oc_zone` VALUES (3374,215,'TR-49',1);
INSERT INTO `oc_zone` VALUES (3375,215,'TR-50',1);
INSERT INTO `oc_zone` VALUES (3376,215,'TR-51',1);
INSERT INTO `oc_zone` VALUES (3377,215,'TR-52',1);
INSERT INTO `oc_zone` VALUES (3378,215,'TR-80',1);
INSERT INTO `oc_zone` VALUES (3379,215,'TR-53',1);
INSERT INTO `oc_zone` VALUES (3380,215,'TR-54',1);
INSERT INTO `oc_zone` VALUES (3381,215,'TR-55',1);
INSERT INTO `oc_zone` VALUES (3382,215,'TR-63',1);
INSERT INTO `oc_zone` VALUES (3383,215,'TR-56',1);
INSERT INTO `oc_zone` VALUES (3384,215,'TR-57',1);
INSERT INTO `oc_zone` VALUES (3385,215,'TR-73',1);
INSERT INTO `oc_zone` VALUES (3386,215,'TR-58',1);
INSERT INTO `oc_zone` VALUES (3387,215,'TR-59',1);
INSERT INTO `oc_zone` VALUES (3388,215,'TR-60',1);
INSERT INTO `oc_zone` VALUES (3389,215,'TR-61',1);
INSERT INTO `oc_zone` VALUES (3390,215,'TR-62',1);
INSERT INTO `oc_zone` VALUES (3391,215,'TR-64',1);
INSERT INTO `oc_zone` VALUES (3392,215,'TR-65',1);
INSERT INTO `oc_zone` VALUES (3393,215,'TR-77',1);
INSERT INTO `oc_zone` VALUES (3394,215,'TR-66',1);
INSERT INTO `oc_zone` VALUES (3395,215,'TR-67',1);
INSERT INTO `oc_zone` VALUES (3396,216,'A',1);
INSERT INTO `oc_zone` VALUES (3397,216,'B',1);
INSERT INTO `oc_zone` VALUES (3398,216,'D',1);
INSERT INTO `oc_zone` VALUES (3399,216,'L',1);
INSERT INTO `oc_zone` VALUES (3400,216,'M',1);
INSERT INTO `oc_zone` VALUES (3401,217,'AC',1);
INSERT INTO `oc_zone` VALUES (3402,217,'DC',1);
INSERT INTO `oc_zone` VALUES (3403,217,'FC',1);
INSERT INTO `oc_zone` VALUES (3404,217,'LW',1);
INSERT INTO `oc_zone` VALUES (3405,217,'RC',1);
INSERT INTO `oc_zone` VALUES (3406,217,'PN',1);
INSERT INTO `oc_zone` VALUES (3407,217,'SL',1);
INSERT INTO `oc_zone` VALUES (3408,217,'GT',1);
INSERT INTO `oc_zone` VALUES (3409,217,'SC',1);
INSERT INTO `oc_zone` VALUES (3410,217,'EC',1);
INSERT INTO `oc_zone` VALUES (3411,217,'MC',1);
INSERT INTO `oc_zone` VALUES (3412,217,'NC',1);
INSERT INTO `oc_zone` VALUES (3413,217,'PR',1);
INSERT INTO `oc_zone` VALUES (3414,217,'WC',1);
INSERT INTO `oc_zone` VALUES (3415,218,'NMG',1);
INSERT INTO `oc_zone` VALUES (3416,218,'NLK',1);
INSERT INTO `oc_zone` VALUES (3417,218,'NTO',1);
INSERT INTO `oc_zone` VALUES (3418,218,'FUN',1);
INSERT INTO `oc_zone` VALUES (3419,218,'NME',1);
INSERT INTO `oc_zone` VALUES (3420,218,'NUI',1);
INSERT INTO `oc_zone` VALUES (3421,218,'NFT',1);
INSERT INTO `oc_zone` VALUES (3422,218,'NLL',1);
INSERT INTO `oc_zone` VALUES (3423,218,'VAI',1);
INSERT INTO `oc_zone` VALUES (3424,219,'KAL',1);
INSERT INTO `oc_zone` VALUES (3425,219,'KMP',1);
INSERT INTO `oc_zone` VALUES (3426,219,'KAY',1);
INSERT INTO `oc_zone` VALUES (3427,219,'KIB',1);
INSERT INTO `oc_zone` VALUES (3428,219,'LUW',1);
INSERT INTO `oc_zone` VALUES (3429,219,'MAS',1);
INSERT INTO `oc_zone` VALUES (3430,219,'MPI',1);
INSERT INTO `oc_zone` VALUES (3431,219,'MUB',1);
INSERT INTO `oc_zone` VALUES (3432,219,'MUK',1);
INSERT INTO `oc_zone` VALUES (3433,219,'NKS',1);
INSERT INTO `oc_zone` VALUES (3434,219,'RAK',1);
INSERT INTO `oc_zone` VALUES (3435,219,'SEM',1);
INSERT INTO `oc_zone` VALUES (3436,219,'WAK',1);
INSERT INTO `oc_zone` VALUES (3437,219,'BUG',1);
INSERT INTO `oc_zone` VALUES (3438,219,'BUS',1);
INSERT INTO `oc_zone` VALUES (3439,219,'IGA',1);
INSERT INTO `oc_zone` VALUES (3440,219,'JIN',1);
INSERT INTO `oc_zone` VALUES (3441,219,'KAB',1);
INSERT INTO `oc_zone` VALUES (3442,219,'KML',1);
INSERT INTO `oc_zone` VALUES (3443,219,'KPC',1);
INSERT INTO `oc_zone` VALUES (3444,219,'KTK',1);
INSERT INTO `oc_zone` VALUES (3445,219,'KUM',1);
INSERT INTO `oc_zone` VALUES (3446,219,'MAY',1);
INSERT INTO `oc_zone` VALUES (3447,219,'MBA',1);
INSERT INTO `oc_zone` VALUES (3448,219,'PAL',1);
INSERT INTO `oc_zone` VALUES (3449,219,'SIR',1);
INSERT INTO `oc_zone` VALUES (3450,219,'SOR',1);
INSERT INTO `oc_zone` VALUES (3451,219,'TOR',1);
INSERT INTO `oc_zone` VALUES (3452,219,'ADJ',1);
INSERT INTO `oc_zone` VALUES (3453,219,'APC',1);
INSERT INTO `oc_zone` VALUES (3454,219,'ARU',1);
INSERT INTO `oc_zone` VALUES (3455,219,'GUL',1);
INSERT INTO `oc_zone` VALUES (3456,219,'KIT',1);
INSERT INTO `oc_zone` VALUES (3457,219,'KOT',1);
INSERT INTO `oc_zone` VALUES (3458,219,'LIR',1);
INSERT INTO `oc_zone` VALUES (3459,219,'MRT',1);
INSERT INTO `oc_zone` VALUES (3460,219,'MOY',1);
INSERT INTO `oc_zone` VALUES (3461,219,'NAK',1);
INSERT INTO `oc_zone` VALUES (3462,219,'NEB',1);
INSERT INTO `oc_zone` VALUES (3463,219,'PAD',1);
INSERT INTO `oc_zone` VALUES (3464,219,'YUM',1);
INSERT INTO `oc_zone` VALUES (3465,219,'BUN',1);
INSERT INTO `oc_zone` VALUES (3466,219,'BSH',1);
INSERT INTO `oc_zone` VALUES (3467,219,'HOI',1);
INSERT INTO `oc_zone` VALUES (3468,219,'KBL',1);
INSERT INTO `oc_zone` VALUES (3469,219,'KAR',1);
INSERT INTO `oc_zone` VALUES (3470,219,'KAM',1);
INSERT INTO `oc_zone` VALUES (3471,219,'KAN',1);
INSERT INTO `oc_zone` VALUES (3472,219,'KAS',1);
INSERT INTO `oc_zone` VALUES (3473,219,'KBA',1);
INSERT INTO `oc_zone` VALUES (3474,219,'KIS',1);
INSERT INTO `oc_zone` VALUES (3475,219,'KYE',1);
INSERT INTO `oc_zone` VALUES (3476,219,'MSN',1);
INSERT INTO `oc_zone` VALUES (3477,219,'MBR',1);
INSERT INTO `oc_zone` VALUES (3478,219,'NTU',1);
INSERT INTO `oc_zone` VALUES (3479,219,'RUK',1);
INSERT INTO `oc_zone` VALUES (3480,220,'23',1);
INSERT INTO `oc_zone` VALUES (3481,220,'25',1);
INSERT INTO `oc_zone` VALUES (3482,220,'24',1);
INSERT INTO `oc_zone` VALUES (3483,220,'27',1);
INSERT INTO `oc_zone` VALUES (3484,220,'04',1);
INSERT INTO `oc_zone` VALUES (3485,220,'05',1);
INSERT INTO `oc_zone` VALUES (3486,220,'09',1);
INSERT INTO `oc_zone` VALUES (3487,220,'21',1);
INSERT INTO `oc_zone` VALUES (3488,220,'22',1);
INSERT INTO `oc_zone` VALUES (3489,220,'35',1);
INSERT INTO `oc_zone` VALUES (3490,220,'26',1);
INSERT INTO `oc_zone` VALUES (3491,220,'10',1);
INSERT INTO `oc_zone` VALUES (3492,220,'12',1);
INSERT INTO `oc_zone` VALUES (3493,220,'13',1);
INSERT INTO `oc_zone` VALUES (3494,220,'14',1);
INSERT INTO `oc_zone` VALUES (3495,220,'15',1);
INSERT INTO `oc_zone` VALUES (3496,220,'16',1);
INSERT INTO `oc_zone` VALUES (3497,220,'17',1);
INSERT INTO `oc_zone` VALUES (3498,220,'28',1);
INSERT INTO `oc_zone` VALUES (3499,220,'18',1);
INSERT INTO `oc_zone` VALUES (3500,220,'19',1);
INSERT INTO `oc_zone` VALUES (3501,220,'02',1);
INSERT INTO `oc_zone` VALUES (3502,220,'03',1);
INSERT INTO `oc_zone` VALUES (3503,220,'07',1);
INSERT INTO `oc_zone` VALUES (3504,220,'08',1);
INSERT INTO `oc_zone` VALUES (3505,220,'06',1);
INSERT INTO `oc_zone` VALUES (3506,221,'ADH',1);
INSERT INTO `oc_zone` VALUES (3507,221,'AJ',1);
INSERT INTO `oc_zone` VALUES (3508,221,'FU',1);
INSERT INTO `oc_zone` VALUES (3509,221,'SH',1);
INSERT INTO `oc_zone` VALUES (3510,221,'DU',1);
INSERT INTO `oc_zone` VALUES (3511,221,'RK',1);
INSERT INTO `oc_zone` VALUES (3512,221,'UQ',1);
INSERT INTO `oc_zone` VALUES (3513,222,'ABN',1);
INSERT INTO `oc_zone` VALUES (3514,222,'ABNS',1);
INSERT INTO `oc_zone` VALUES (3515,222,'ANG',1);
INSERT INTO `oc_zone` VALUES (3516,222,'AGS',1);
INSERT INTO `oc_zone` VALUES (3517,222,'ARY',1);
INSERT INTO `oc_zone` VALUES (3518,222,'BEDS',1);
INSERT INTO `oc_zone` VALUES (3519,222,'BERKS',1);
INSERT INTO `oc_zone` VALUES (3520,222,'BLA',1);
INSERT INTO `oc_zone` VALUES (3521,222,'BRI',1);
INSERT INTO `oc_zone` VALUES (3522,222,'BSTL',1);
INSERT INTO `oc_zone` VALUES (3523,222,'BUCKS',1);
INSERT INTO `oc_zone` VALUES (3524,222,'CAE',1);
INSERT INTO `oc_zone` VALUES (3525,222,'CAMBS',1);
INSERT INTO `oc_zone` VALUES (3526,222,'CDF',1);
INSERT INTO `oc_zone` VALUES (3527,222,'CARM',1);
INSERT INTO `oc_zone` VALUES (3528,222,'CDGN',1);
INSERT INTO `oc_zone` VALUES (3529,222,'CHES',1);
INSERT INTO `oc_zone` VALUES (3530,222,'CLACK',1);
INSERT INTO `oc_zone` VALUES (3531,222,'CON',1);
INSERT INTO `oc_zone` VALUES (3532,222,'CORN',1);
INSERT INTO `oc_zone` VALUES (3533,222,'DNBG',1);
INSERT INTO `oc_zone` VALUES (3534,222,'DERBY',1);
INSERT INTO `oc_zone` VALUES (3535,222,'DVN',1);
INSERT INTO `oc_zone` VALUES (3536,222,'DOR',1);
INSERT INTO `oc_zone` VALUES (3537,222,'DGL',1);
INSERT INTO `oc_zone` VALUES (3538,222,'DUND',1);
INSERT INTO `oc_zone` VALUES (3539,222,'DHM',1);
INSERT INTO `oc_zone` VALUES (3540,222,'ARYE',1);
INSERT INTO `oc_zone` VALUES (3541,222,'DUNBE',1);
INSERT INTO `oc_zone` VALUES (3542,222,'LOTE',1);
INSERT INTO `oc_zone` VALUES (3543,222,'RENE',1);
INSERT INTO `oc_zone` VALUES (3544,222,'ERYS',1);
INSERT INTO `oc_zone` VALUES (3545,222,'SXE',1);
INSERT INTO `oc_zone` VALUES (3546,222,'EDIN',1);
INSERT INTO `oc_zone` VALUES (3547,222,'ESX',1);
INSERT INTO `oc_zone` VALUES (3548,222,'FALK',1);
INSERT INTO `oc_zone` VALUES (3549,222,'FFE',1);
INSERT INTO `oc_zone` VALUES (3550,222,'FLINT',1);
INSERT INTO `oc_zone` VALUES (3551,222,'GLAS',1);
INSERT INTO `oc_zone` VALUES (3552,222,'GLOS',1);
INSERT INTO `oc_zone` VALUES (3553,222,'LDN',1);
INSERT INTO `oc_zone` VALUES (3554,222,'MCH',1);
INSERT INTO `oc_zone` VALUES (3555,222,'GDD',1);
INSERT INTO `oc_zone` VALUES (3556,222,'HANTS',1);
INSERT INTO `oc_zone` VALUES (3557,222,'HWR',1);
INSERT INTO `oc_zone` VALUES (3558,222,'HERTS',1);
INSERT INTO `oc_zone` VALUES (3559,222,'HLD',1);
INSERT INTO `oc_zone` VALUES (3560,222,'IVER',1);
INSERT INTO `oc_zone` VALUES (3561,222,'IOW',1);
INSERT INTO `oc_zone` VALUES (3562,222,'KNT',1);
INSERT INTO `oc_zone` VALUES (3563,222,'LANCS',1);
INSERT INTO `oc_zone` VALUES (3564,222,'LEICS',1);
INSERT INTO `oc_zone` VALUES (3565,222,'LINCS',1);
INSERT INTO `oc_zone` VALUES (3566,222,'MSY',1);
INSERT INTO `oc_zone` VALUES (3567,222,'MERT',1);
INSERT INTO `oc_zone` VALUES (3568,222,'MLOT',1);
INSERT INTO `oc_zone` VALUES (3569,222,'MMOUTH',1);
INSERT INTO `oc_zone` VALUES (3570,222,'MORAY',1);
INSERT INTO `oc_zone` VALUES (3571,222,'NPRTAL',1);
INSERT INTO `oc_zone` VALUES (3572,222,'NEWPT',1);
INSERT INTO `oc_zone` VALUES (3573,222,'NOR',1);
INSERT INTO `oc_zone` VALUES (3574,222,'ARYN',1);
INSERT INTO `oc_zone` VALUES (3575,222,'LANN',1);
INSERT INTO `oc_zone` VALUES (3576,222,'YSN',1);
INSERT INTO `oc_zone` VALUES (3577,222,'NHM',1);
INSERT INTO `oc_zone` VALUES (3578,222,'NLD',1);
INSERT INTO `oc_zone` VALUES (3579,222,'NOT',1);
INSERT INTO `oc_zone` VALUES (3580,222,'ORK',1);
INSERT INTO `oc_zone` VALUES (3581,222,'OFE',1);
INSERT INTO `oc_zone` VALUES (3582,222,'PEM',1);
INSERT INTO `oc_zone` VALUES (3583,222,'PERTH',1);
INSERT INTO `oc_zone` VALUES (3584,222,'PWS',1);
INSERT INTO `oc_zone` VALUES (3585,222,'REN',1);
INSERT INTO `oc_zone` VALUES (3586,222,'RHON',1);
INSERT INTO `oc_zone` VALUES (3587,222,'RUT',1);
INSERT INTO `oc_zone` VALUES (3588,222,'BOR',1);
INSERT INTO `oc_zone` VALUES (3589,222,'SHET',1);
INSERT INTO `oc_zone` VALUES (3590,222,'SPE',1);
INSERT INTO `oc_zone` VALUES (3591,222,'SOM',1);
INSERT INTO `oc_zone` VALUES (3592,222,'ARYS',1);
INSERT INTO `oc_zone` VALUES (3593,222,'LANS',1);
INSERT INTO `oc_zone` VALUES (3594,222,'YSS',1);
INSERT INTO `oc_zone` VALUES (3595,222,'SFD',1);
INSERT INTO `oc_zone` VALUES (3596,222,'STIR',1);
INSERT INTO `oc_zone` VALUES (3597,222,'SFK',1);
INSERT INTO `oc_zone` VALUES (3598,222,'SRY',1);
INSERT INTO `oc_zone` VALUES (3599,222,'SWAN',1);
INSERT INTO `oc_zone` VALUES (3600,222,'TORF',1);
INSERT INTO `oc_zone` VALUES (3601,222,'TWR',1);
INSERT INTO `oc_zone` VALUES (3602,222,'VGLAM',1);
INSERT INTO `oc_zone` VALUES (3603,222,'WARKS',1);
INSERT INTO `oc_zone` VALUES (3604,222,'WDUN',1);
INSERT INTO `oc_zone` VALUES (3605,222,'WLOT',1);
INSERT INTO `oc_zone` VALUES (3606,222,'WMD',1);
INSERT INTO `oc_zone` VALUES (3607,222,'SXW',1);
INSERT INTO `oc_zone` VALUES (3608,222,'YSW',1);
INSERT INTO `oc_zone` VALUES (3609,222,'WIL',1);
INSERT INTO `oc_zone` VALUES (3610,222,'WLT',1);
INSERT INTO `oc_zone` VALUES (3611,222,'WORCS',1);
INSERT INTO `oc_zone` VALUES (3612,222,'WRX',1);
INSERT INTO `oc_zone` VALUES (3613,223,'AL',1);
INSERT INTO `oc_zone` VALUES (3614,223,'AK',1);
INSERT INTO `oc_zone` VALUES (3615,223,'AS',1);
INSERT INTO `oc_zone` VALUES (3616,223,'AZ',1);
INSERT INTO `oc_zone` VALUES (3617,223,'AR',1);
INSERT INTO `oc_zone` VALUES (3618,223,'AF',1);
INSERT INTO `oc_zone` VALUES (3619,223,'AA',1);
INSERT INTO `oc_zone` VALUES (3620,223,'AC',1);
INSERT INTO `oc_zone` VALUES (3621,223,'AE',1);
INSERT INTO `oc_zone` VALUES (3622,223,'AM',1);
INSERT INTO `oc_zone` VALUES (3623,223,'AP',1);
INSERT INTO `oc_zone` VALUES (3624,223,'CA',1);
INSERT INTO `oc_zone` VALUES (3625,223,'CO',1);
INSERT INTO `oc_zone` VALUES (3626,223,'CT',1);
INSERT INTO `oc_zone` VALUES (3627,223,'DE',1);
INSERT INTO `oc_zone` VALUES (3628,223,'DC',1);
INSERT INTO `oc_zone` VALUES (3629,223,'FM',1);
INSERT INTO `oc_zone` VALUES (3630,223,'FL',1);
INSERT INTO `oc_zone` VALUES (3631,223,'GA',1);
INSERT INTO `oc_zone` VALUES (3632,223,'GU',1);
INSERT INTO `oc_zone` VALUES (3633,223,'HI',1);
INSERT INTO `oc_zone` VALUES (3634,223,'ID',1);
INSERT INTO `oc_zone` VALUES (3635,223,'IL',1);
INSERT INTO `oc_zone` VALUES (3636,223,'IN',1);
INSERT INTO `oc_zone` VALUES (3637,223,'IA',1);
INSERT INTO `oc_zone` VALUES (3638,223,'KS',1);
INSERT INTO `oc_zone` VALUES (3639,223,'KY',1);
INSERT INTO `oc_zone` VALUES (3640,223,'LA',1);
INSERT INTO `oc_zone` VALUES (3641,223,'ME',1);
INSERT INTO `oc_zone` VALUES (3642,223,'MH',1);
INSERT INTO `oc_zone` VALUES (3643,223,'MD',1);
INSERT INTO `oc_zone` VALUES (3644,223,'MA',1);
INSERT INTO `oc_zone` VALUES (3645,223,'MI',1);
INSERT INTO `oc_zone` VALUES (3646,223,'MN',1);
INSERT INTO `oc_zone` VALUES (3647,223,'MS',1);
INSERT INTO `oc_zone` VALUES (3648,223,'MO',1);
INSERT INTO `oc_zone` VALUES (3649,223,'MT',1);
INSERT INTO `oc_zone` VALUES (3650,223,'NE',1);
INSERT INTO `oc_zone` VALUES (3651,223,'NV',1);
INSERT INTO `oc_zone` VALUES (3652,223,'NH',1);
INSERT INTO `oc_zone` VALUES (3653,223,'NJ',1);
INSERT INTO `oc_zone` VALUES (3654,223,'NM',1);
INSERT INTO `oc_zone` VALUES (3655,223,'NY',1);
INSERT INTO `oc_zone` VALUES (3656,223,'NC',1);
INSERT INTO `oc_zone` VALUES (3657,223,'ND',1);
INSERT INTO `oc_zone` VALUES (3658,223,'MP',1);
INSERT INTO `oc_zone` VALUES (3659,223,'OH',1);
INSERT INTO `oc_zone` VALUES (3660,223,'OK',1);
INSERT INTO `oc_zone` VALUES (3661,223,'OR',1);
INSERT INTO `oc_zone` VALUES (3662,223,'PW',1);
INSERT INTO `oc_zone` VALUES (3663,223,'PA',1);
INSERT INTO `oc_zone` VALUES (3664,223,'PR',1);
INSERT INTO `oc_zone` VALUES (3665,223,'RI',1);
INSERT INTO `oc_zone` VALUES (3666,223,'SC',1);
INSERT INTO `oc_zone` VALUES (3667,223,'SD',1);
INSERT INTO `oc_zone` VALUES (3668,223,'TN',1);
INSERT INTO `oc_zone` VALUES (3669,223,'TX',1);
INSERT INTO `oc_zone` VALUES (3670,223,'UT',1);
INSERT INTO `oc_zone` VALUES (3671,223,'VT',1);
INSERT INTO `oc_zone` VALUES (3672,223,'VI',1);
INSERT INTO `oc_zone` VALUES (3673,223,'VA',1);
INSERT INTO `oc_zone` VALUES (3674,223,'WA',1);
INSERT INTO `oc_zone` VALUES (3675,223,'WV',1);
INSERT INTO `oc_zone` VALUES (3676,223,'WI',1);
INSERT INTO `oc_zone` VALUES (3677,223,'WY',1);
INSERT INTO `oc_zone` VALUES (3678,224,'BI',1);
INSERT INTO `oc_zone` VALUES (3679,224,'HI',1);
INSERT INTO `oc_zone` VALUES (3680,224,'JI',1);
INSERT INTO `oc_zone` VALUES (3681,224,'JA',1);
INSERT INTO `oc_zone` VALUES (3682,224,'KR',1);
INSERT INTO `oc_zone` VALUES (3683,224,'MA',1);
INSERT INTO `oc_zone` VALUES (3684,224,'NI',1);
INSERT INTO `oc_zone` VALUES (3685,224,'PA',1);
INSERT INTO `oc_zone` VALUES (3686,224,'WI',1);
INSERT INTO `oc_zone` VALUES (3687,225,'AR',1);
INSERT INTO `oc_zone` VALUES (3688,225,'CA',1);
INSERT INTO `oc_zone` VALUES (3689,225,'CL',1);
INSERT INTO `oc_zone` VALUES (3690,225,'CO',1);
INSERT INTO `oc_zone` VALUES (3691,225,'DU',1);
INSERT INTO `oc_zone` VALUES (3692,225,'FS',1);
INSERT INTO `oc_zone` VALUES (3693,225,'FA',1);
INSERT INTO `oc_zone` VALUES (3694,225,'LA',1);
INSERT INTO `oc_zone` VALUES (3695,225,'MA',1);
INSERT INTO `oc_zone` VALUES (3696,225,'MO',1);
INSERT INTO `oc_zone` VALUES (3697,225,'PA',1);
INSERT INTO `oc_zone` VALUES (3698,225,'RN',1);
INSERT INTO `oc_zone` VALUES (3699,225,'RV',1);
INSERT INTO `oc_zone` VALUES (3700,225,'RO',1);
INSERT INTO `oc_zone` VALUES (3701,225,'SL',1);
INSERT INTO `oc_zone` VALUES (3702,225,'SJ',1);
INSERT INTO `oc_zone` VALUES (3703,225,'SO',1);
INSERT INTO `oc_zone` VALUES (3704,225,'TA',1);
INSERT INTO `oc_zone` VALUES (3705,225,'TT',1);
INSERT INTO `oc_zone` VALUES (3706,226,'AN',1);
INSERT INTO `oc_zone` VALUES (3707,226,'BU',1);
INSERT INTO `oc_zone` VALUES (3708,226,'FA',1);
INSERT INTO `oc_zone` VALUES (3709,226,'JI',1);
INSERT INTO `oc_zone` VALUES (3710,226,'NG',1);
INSERT INTO `oc_zone` VALUES (3711,226,'NW',1);
INSERT INTO `oc_zone` VALUES (3712,226,'QA',1);
INSERT INTO `oc_zone` VALUES (3713,226,'QR',1);
INSERT INTO `oc_zone` VALUES (3714,226,'SA',1);
INSERT INTO `oc_zone` VALUES (3715,226,'SI',1);
INSERT INTO `oc_zone` VALUES (3716,226,'SU',1);
INSERT INTO `oc_zone` VALUES (3717,226,'TK',1);
INSERT INTO `oc_zone` VALUES (3718,226,'TO',1);
INSERT INTO `oc_zone` VALUES (3719,226,'XO',1);
INSERT INTO `oc_zone` VALUES (3720,227,'MA',1);
INSERT INTO `oc_zone` VALUES (3721,227,'PE',1);
INSERT INTO `oc_zone` VALUES (3722,227,'SA',1);
INSERT INTO `oc_zone` VALUES (3723,227,'SH',1);
INSERT INTO `oc_zone` VALUES (3724,227,'TA',1);
INSERT INTO `oc_zone` VALUES (3725,227,'TO',1);
INSERT INTO `oc_zone` VALUES (3726,229,'Z',1);
INSERT INTO `oc_zone` VALUES (3727,229,'B',1);
INSERT INTO `oc_zone` VALUES (3728,229,'C',1);
INSERT INTO `oc_zone` VALUES (3729,229,'D',1);
INSERT INTO `oc_zone` VALUES (3730,229,'E',1);
INSERT INTO `oc_zone` VALUES (3731,229,'F',1);
INSERT INTO `oc_zone` VALUES (3732,229,'G',1);
INSERT INTO `oc_zone` VALUES (3733,229,'H',1);
INSERT INTO `oc_zone` VALUES (3734,229,'Y',1);
INSERT INTO `oc_zone` VALUES (3735,229,'W',1);
INSERT INTO `oc_zone` VALUES (3736,229,'A',1);
INSERT INTO `oc_zone` VALUES (3737,229,'I',1);
INSERT INTO `oc_zone` VALUES (3738,229,'J',1);
INSERT INTO `oc_zone` VALUES (3739,229,'K',1);
INSERT INTO `oc_zone` VALUES (3740,229,'L',1);
INSERT INTO `oc_zone` VALUES (3741,229,'M',1);
INSERT INTO `oc_zone` VALUES (3742,229,'N',1);
INSERT INTO `oc_zone` VALUES (3743,229,'O',1);
INSERT INTO `oc_zone` VALUES (3744,229,'P',1);
INSERT INTO `oc_zone` VALUES (3745,229,'R',1);
INSERT INTO `oc_zone` VALUES (3746,229,'S',1);
INSERT INTO `oc_zone` VALUES (3747,229,'T',1);
INSERT INTO `oc_zone` VALUES (3748,229,'X',1);
INSERT INTO `oc_zone` VALUES (3749,229,'U',1);
INSERT INTO `oc_zone` VALUES (3750,229,'V',1);
INSERT INTO `oc_zone` VALUES (3751,230,'AG',1);
INSERT INTO `oc_zone` VALUES (3752,230,'BG',1);
INSERT INTO `oc_zone` VALUES (3753,230,'BK',1);
INSERT INTO `oc_zone` VALUES (3754,230,'BL',1);
INSERT INTO `oc_zone` VALUES (3755,230,'BC',1);
INSERT INTO `oc_zone` VALUES (3756,230,'BR',1);
INSERT INTO `oc_zone` VALUES (3757,230,'BN',1);
INSERT INTO `oc_zone` VALUES (3758,230,'BH',1);
INSERT INTO `oc_zone` VALUES (3759,230,'BU',1);
INSERT INTO `oc_zone` VALUES (3760,230,'BP',1);
INSERT INTO `oc_zone` VALUES (3761,230,'BT',1);
INSERT INTO `oc_zone` VALUES (3762,230,'CM',1);
INSERT INTO `oc_zone` VALUES (3763,230,'CT',1);
INSERT INTO `oc_zone` VALUES (3764,230,'CB',1);
INSERT INTO `oc_zone` VALUES (3765,230,'DL',1);
INSERT INTO `oc_zone` VALUES (3766,230,'DG',1);
INSERT INTO `oc_zone` VALUES (3767,230,'DN',1);
INSERT INTO `oc_zone` VALUES (3768,230,'DB',1);
INSERT INTO `oc_zone` VALUES (3769,230,'DI',1);
INSERT INTO `oc_zone` VALUES (3770,230,'DT',1);
INSERT INTO `oc_zone` VALUES (3771,230,'GL',1);
INSERT INTO `oc_zone` VALUES (3772,230,'HG',1);
INSERT INTO `oc_zone` VALUES (3773,230,'HD',1);
INSERT INTO `oc_zone` VALUES (3774,230,'HP',1);
INSERT INTO `oc_zone` VALUES (3775,230,'HM',1);
INSERT INTO `oc_zone` VALUES (3776,230,'HI',1);
INSERT INTO `oc_zone` VALUES (3777,230,'HT',1);
INSERT INTO `oc_zone` VALUES (3778,230,'HH',1);
INSERT INTO `oc_zone` VALUES (3779,230,'HB',1);
INSERT INTO `oc_zone` VALUES (3780,230,'HC',1);
INSERT INTO `oc_zone` VALUES (3781,230,'HU',1);
INSERT INTO `oc_zone` VALUES (3782,230,'HY',1);
INSERT INTO `oc_zone` VALUES (3783,232,'C',1);
INSERT INTO `oc_zone` VALUES (3784,232,'J',1);
INSERT INTO `oc_zone` VALUES (3785,232,'T',1);
INSERT INTO `oc_zone` VALUES (3786,233,'A',1);
INSERT INTO `oc_zone` VALUES (3787,233,'S',1);
INSERT INTO `oc_zone` VALUES (3788,233,'W',1);
INSERT INTO `oc_zone` VALUES (3789,235,'AB',1);
INSERT INTO `oc_zone` VALUES (3790,235,'AD',1);
INSERT INTO `oc_zone` VALUES (3791,235,'AM',1);
INSERT INTO `oc_zone` VALUES (3792,235,'BA',1);
INSERT INTO `oc_zone` VALUES (3793,235,'DA',1);
INSERT INTO `oc_zone` VALUES (3794,235,'DH',1);
INSERT INTO `oc_zone` VALUES (3795,235,'HD',1);
INSERT INTO `oc_zone` VALUES (3796,235,'HJ',1);
INSERT INTO `oc_zone` VALUES (3797,235,'HU',1);
INSERT INTO `oc_zone` VALUES (3798,235,'IB',1);
INSERT INTO `oc_zone` VALUES (3799,235,'JA',1);
INSERT INTO `oc_zone` VALUES (3800,235,'LA',1);
INSERT INTO `oc_zone` VALUES (3801,235,'MA',1);
INSERT INTO `oc_zone` VALUES (3802,235,'MR',1);
INSERT INTO `oc_zone` VALUES (3803,235,'MW',1);
INSERT INTO `oc_zone` VALUES (3804,235,'SD',1);
INSERT INTO `oc_zone` VALUES (3805,235,'SN',1);
INSERT INTO `oc_zone` VALUES (3806,235,'SH',1);
INSERT INTO `oc_zone` VALUES (3807,235,'TA',1);
INSERT INTO `oc_zone` VALUES (3812,237,'BC',1);
INSERT INTO `oc_zone` VALUES (3813,237,'BN',1);
INSERT INTO `oc_zone` VALUES (3814,237,'EQ',1);
INSERT INTO `oc_zone` VALUES (3815,237,'KA',1);
INSERT INTO `oc_zone` VALUES (3816,237,'KE',1);
INSERT INTO `oc_zone` VALUES (3817,237,'KN',1);
INSERT INTO `oc_zone` VALUES (3818,237,'KW',1);
INSERT INTO `oc_zone` VALUES (3819,237,'MA',1);
INSERT INTO `oc_zone` VALUES (3820,237,'NK',1);
INSERT INTO `oc_zone` VALUES (3821,237,'OR',1);
INSERT INTO `oc_zone` VALUES (3822,237,'SK',1);
INSERT INTO `oc_zone` VALUES (3823,238,'CE',1);
INSERT INTO `oc_zone` VALUES (3824,238,'CB',1);
INSERT INTO `oc_zone` VALUES (3825,238,'EA',1);
INSERT INTO `oc_zone` VALUES (3826,238,'LP',1);
INSERT INTO `oc_zone` VALUES (3827,238,'LK',1);
INSERT INTO `oc_zone` VALUES (3828,238,'NO',1);
INSERT INTO `oc_zone` VALUES (3829,238,'NW',1);
INSERT INTO `oc_zone` VALUES (3830,238,'SO',1);
INSERT INTO `oc_zone` VALUES (3831,238,'WE',1);
INSERT INTO `oc_zone` VALUES (3832,239,'BU',1);
INSERT INTO `oc_zone` VALUES (3833,239,'HA',1);
INSERT INTO `oc_zone` VALUES (3834,239,'ML',1);
INSERT INTO `oc_zone` VALUES (3835,239,'MC',1);
INSERT INTO `oc_zone` VALUES (3836,239,'ME',1);
INSERT INTO `oc_zone` VALUES (3837,239,'MW',1);
INSERT INTO `oc_zone` VALUES (3838,239,'MV',1);
INSERT INTO `oc_zone` VALUES (3839,239,'MN',1);
INSERT INTO `oc_zone` VALUES (3840,239,'MS',1);
INSERT INTO `oc_zone` VALUES (3841,239,'MD',1);
INSERT INTO `oc_zone` VALUES (3842,105,'AG',1);
INSERT INTO `oc_zone` VALUES (3843,105,'AL',1);
INSERT INTO `oc_zone` VALUES (3844,105,'AN',1);
INSERT INTO `oc_zone` VALUES (3845,105,'AO',1);
INSERT INTO `oc_zone` VALUES (3846,105,'AR',1);
INSERT INTO `oc_zone` VALUES (3847,105,'AP',1);
INSERT INTO `oc_zone` VALUES (3848,105,'AT',1);
INSERT INTO `oc_zone` VALUES (3849,105,'AV',1);
INSERT INTO `oc_zone` VALUES (3850,105,'BA',1);
INSERT INTO `oc_zone` VALUES (3851,105,'BL',1);
INSERT INTO `oc_zone` VALUES (3852,105,'BN',1);
INSERT INTO `oc_zone` VALUES (3853,105,'BG',1);
INSERT INTO `oc_zone` VALUES (3854,105,'BI',1);
INSERT INTO `oc_zone` VALUES (3855,105,'BO',1);
INSERT INTO `oc_zone` VALUES (3856,105,'BZ',1);
INSERT INTO `oc_zone` VALUES (3857,105,'BS',1);
INSERT INTO `oc_zone` VALUES (3858,105,'BR',1);
INSERT INTO `oc_zone` VALUES (3859,105,'CA',1);
INSERT INTO `oc_zone` VALUES (3860,105,'CL',1);
INSERT INTO `oc_zone` VALUES (3861,105,'CB',1);
INSERT INTO `oc_zone` VALUES (3863,105,'CE',1);
INSERT INTO `oc_zone` VALUES (3864,105,'CT',1);
INSERT INTO `oc_zone` VALUES (3865,105,'CZ',1);
INSERT INTO `oc_zone` VALUES (3866,105,'CH',1);
INSERT INTO `oc_zone` VALUES (3867,105,'CO',1);
INSERT INTO `oc_zone` VALUES (3868,105,'CS',1);
INSERT INTO `oc_zone` VALUES (3869,105,'CR',1);
INSERT INTO `oc_zone` VALUES (3870,105,'KR',1);
INSERT INTO `oc_zone` VALUES (3871,105,'CN',1);
INSERT INTO `oc_zone` VALUES (3872,105,'EN',1);
INSERT INTO `oc_zone` VALUES (3873,105,'FE',1);
INSERT INTO `oc_zone` VALUES (3874,105,'FI',1);
INSERT INTO `oc_zone` VALUES (3875,105,'FG',1);
INSERT INTO `oc_zone` VALUES (3876,105,'FC',1);
INSERT INTO `oc_zone` VALUES (3877,105,'FR',1);
INSERT INTO `oc_zone` VALUES (3878,105,'GE',1);
INSERT INTO `oc_zone` VALUES (3879,105,'GO',1);
INSERT INTO `oc_zone` VALUES (3880,105,'GR',1);
INSERT INTO `oc_zone` VALUES (3881,105,'IM',1);
INSERT INTO `oc_zone` VALUES (3882,105,'IS',1);
INSERT INTO `oc_zone` VALUES (3883,105,'AQ',1);
INSERT INTO `oc_zone` VALUES (3884,105,'SP',1);
INSERT INTO `oc_zone` VALUES (3885,105,'LT',1);
INSERT INTO `oc_zone` VALUES (3886,105,'LE',1);
INSERT INTO `oc_zone` VALUES (3887,105,'LC',1);
INSERT INTO `oc_zone` VALUES (3888,105,'LI',1);
INSERT INTO `oc_zone` VALUES (3889,105,'LO',1);
INSERT INTO `oc_zone` VALUES (3890,105,'LU',1);
INSERT INTO `oc_zone` VALUES (3891,105,'MC',1);
INSERT INTO `oc_zone` VALUES (3892,105,'MN',1);
INSERT INTO `oc_zone` VALUES (3893,105,'MS',1);
INSERT INTO `oc_zone` VALUES (3894,105,'MT',1);
INSERT INTO `oc_zone` VALUES (3896,105,'ME',1);
INSERT INTO `oc_zone` VALUES (3897,105,'MI',1);
INSERT INTO `oc_zone` VALUES (3898,105,'MO',1);
INSERT INTO `oc_zone` VALUES (3899,105,'NA',1);
INSERT INTO `oc_zone` VALUES (3900,105,'NO',1);
INSERT INTO `oc_zone` VALUES (3901,105,'NU',1);
INSERT INTO `oc_zone` VALUES (3904,105,'OR',1);
INSERT INTO `oc_zone` VALUES (3905,105,'PD',1);
INSERT INTO `oc_zone` VALUES (3906,105,'PA',1);
INSERT INTO `oc_zone` VALUES (3907,105,'PR',1);
INSERT INTO `oc_zone` VALUES (3908,105,'PV',1);
INSERT INTO `oc_zone` VALUES (3909,105,'PG',1);
INSERT INTO `oc_zone` VALUES (3910,105,'PU',1);
INSERT INTO `oc_zone` VALUES (3911,105,'PE',1);
INSERT INTO `oc_zone` VALUES (3912,105,'PC',1);
INSERT INTO `oc_zone` VALUES (3913,105,'PI',1);
INSERT INTO `oc_zone` VALUES (3914,105,'PT',1);
INSERT INTO `oc_zone` VALUES (3915,105,'PN',1);
INSERT INTO `oc_zone` VALUES (3916,105,'PZ',1);
INSERT INTO `oc_zone` VALUES (3917,105,'PO',1);
INSERT INTO `oc_zone` VALUES (3918,105,'RG',1);
INSERT INTO `oc_zone` VALUES (3919,105,'RA',1);
INSERT INTO `oc_zone` VALUES (3920,105,'RC',1);
INSERT INTO `oc_zone` VALUES (3921,105,'RE',1);
INSERT INTO `oc_zone` VALUES (3922,105,'RI',1);
INSERT INTO `oc_zone` VALUES (3923,105,'RN',1);
INSERT INTO `oc_zone` VALUES (3924,105,'RM',1);
INSERT INTO `oc_zone` VALUES (3925,105,'RO',1);
INSERT INTO `oc_zone` VALUES (3926,105,'SA',1);
INSERT INTO `oc_zone` VALUES (3927,105,'SS',1);
INSERT INTO `oc_zone` VALUES (3928,105,'SV',1);
INSERT INTO `oc_zone` VALUES (3929,105,'SI',1);
INSERT INTO `oc_zone` VALUES (3930,105,'SR',1);
INSERT INTO `oc_zone` VALUES (3931,105,'SO',1);
INSERT INTO `oc_zone` VALUES (3932,105,'TA',1);
INSERT INTO `oc_zone` VALUES (3933,105,'TE',1);
INSERT INTO `oc_zone` VALUES (3934,105,'TR',1);
INSERT INTO `oc_zone` VALUES (3935,105,'TO',1);
INSERT INTO `oc_zone` VALUES (3936,105,'TP',1);
INSERT INTO `oc_zone` VALUES (3937,105,'TN',1);
INSERT INTO `oc_zone` VALUES (3938,105,'TV',1);
INSERT INTO `oc_zone` VALUES (3939,105,'TS',1);
INSERT INTO `oc_zone` VALUES (3940,105,'UD',1);
INSERT INTO `oc_zone` VALUES (3941,105,'VA',1);
INSERT INTO `oc_zone` VALUES (3942,105,'VE',1);
INSERT INTO `oc_zone` VALUES (3943,105,'VB',1);
INSERT INTO `oc_zone` VALUES (3944,105,'VC',1);
INSERT INTO `oc_zone` VALUES (3945,105,'VR',1);
INSERT INTO `oc_zone` VALUES (3946,105,'VV',1);
INSERT INTO `oc_zone` VALUES (3947,105,'VI',1);
INSERT INTO `oc_zone` VALUES (3948,105,'VT',1);
INSERT INTO `oc_zone` VALUES (3949,222,'ANT',1);
INSERT INTO `oc_zone` VALUES (3950,222,'ARM',1);
INSERT INTO `oc_zone` VALUES (3951,222,'DOW',1);
INSERT INTO `oc_zone` VALUES (3952,222,'FER',1);
INSERT INTO `oc_zone` VALUES (3953,222,'LDY',1);
INSERT INTO `oc_zone` VALUES (3954,222,'TYR',1);
INSERT INTO `oc_zone` VALUES (3955,222,'CMA',1);
INSERT INTO `oc_zone` VALUES (3956,190,'1',1);
INSERT INTO `oc_zone` VALUES (3957,190,'2',1);
INSERT INTO `oc_zone` VALUES (3958,190,'3',1);
INSERT INTO `oc_zone` VALUES (3959,190,'4',1);
INSERT INTO `oc_zone` VALUES (3960,190,'5',1);
INSERT INTO `oc_zone` VALUES (3961,190,'6',1);
INSERT INTO `oc_zone` VALUES (3962,190,'7',1);
INSERT INTO `oc_zone` VALUES (3963,190,'8',1);
INSERT INTO `oc_zone` VALUES (3964,190,'9',1);
INSERT INTO `oc_zone` VALUES (3965,190,'10',1);
INSERT INTO `oc_zone` VALUES (3966,190,'11',1);
INSERT INTO `oc_zone` VALUES (3967,190,'12',1);
INSERT INTO `oc_zone` VALUES (3968,33,'',1);
INSERT INTO `oc_zone` VALUES (3969,101,'ALB',1);
INSERT INTO `oc_zone` VALUES (3970,21,'BRU',1);
INSERT INTO `oc_zone` VALUES (3971,138,'AG',1);
INSERT INTO `oc_zone` VALUES (3973,242,'01',1);
INSERT INTO `oc_zone` VALUES (3974,242,'02',1);
INSERT INTO `oc_zone` VALUES (3975,242,'03',1);
INSERT INTO `oc_zone` VALUES (3976,242,'04',1);
INSERT INTO `oc_zone` VALUES (3977,242,'05',1);
INSERT INTO `oc_zone` VALUES (3978,242,'06',1);
INSERT INTO `oc_zone` VALUES (3979,242,'07',1);
INSERT INTO `oc_zone` VALUES (3980,242,'08',1);
INSERT INTO `oc_zone` VALUES (3981,242,'09',1);
INSERT INTO `oc_zone` VALUES (3982,242,'10',1);
INSERT INTO `oc_zone` VALUES (3983,242,'11',1);
INSERT INTO `oc_zone` VALUES (3984,242,'12',1);
INSERT INTO `oc_zone` VALUES (3985,242,'13',1);
INSERT INTO `oc_zone` VALUES (3986,242,'14',1);
INSERT INTO `oc_zone` VALUES (3987,242,'15',1);
INSERT INTO `oc_zone` VALUES (3988,242,'16',1);
INSERT INTO `oc_zone` VALUES (3989,242,'17',1);
INSERT INTO `oc_zone` VALUES (3990,242,'18',1);
INSERT INTO `oc_zone` VALUES (3991,242,'19',1);
INSERT INTO `oc_zone` VALUES (3992,242,'20',1);
INSERT INTO `oc_zone` VALUES (3993,242,'21',1);
INSERT INTO `oc_zone` VALUES (3994,243,'00',1);
INSERT INTO `oc_zone` VALUES (3995,243,'01',1);
INSERT INTO `oc_zone` VALUES (3996,243,'02',1);
INSERT INTO `oc_zone` VALUES (3997,243,'03',1);
INSERT INTO `oc_zone` VALUES (3998,243,'04',1);
INSERT INTO `oc_zone` VALUES (3999,243,'05',1);
INSERT INTO `oc_zone` VALUES (4000,243,'06',1);
INSERT INTO `oc_zone` VALUES (4001,243,'07',1);
INSERT INTO `oc_zone` VALUES (4002,243,'08',1);
INSERT INTO `oc_zone` VALUES (4003,243,'09',1);
INSERT INTO `oc_zone` VALUES (4004,243,'10',1);
INSERT INTO `oc_zone` VALUES (4005,243,'11',1);
INSERT INTO `oc_zone` VALUES (4006,243,'12',1);
INSERT INTO `oc_zone` VALUES (4007,243,'13',1);
INSERT INTO `oc_zone` VALUES (4008,243,'14',1);
INSERT INTO `oc_zone` VALUES (4009,243,'15',1);
INSERT INTO `oc_zone` VALUES (4010,243,'16',1);
INSERT INTO `oc_zone` VALUES (4011,243,'17',1);
INSERT INTO `oc_zone` VALUES (4012,243,'18',1);
INSERT INTO `oc_zone` VALUES (4013,243,'19',1);
INSERT INTO `oc_zone` VALUES (4014,243,'20',1);
INSERT INTO `oc_zone` VALUES (4015,243,'21',1);
INSERT INTO `oc_zone` VALUES (4016,243,'22',1);
INSERT INTO `oc_zone` VALUES (4017,243,'23',1);
INSERT INTO `oc_zone` VALUES (4018,243,'24',1);
INSERT INTO `oc_zone` VALUES (4020,245,'BO',1);
INSERT INTO `oc_zone` VALUES (4021,245,'SA',1);
INSERT INTO `oc_zone` VALUES (4022,245,'SE',1);
INSERT INTO `oc_zone` VALUES (4023,248,'EC',1);
INSERT INTO `oc_zone` VALUES (4024,248,'EE',1);
INSERT INTO `oc_zone` VALUES (4025,248,'JG',1);
INSERT INTO `oc_zone` VALUES (4026,248,'LK',1);
INSERT INTO `oc_zone` VALUES (4027,248,'BN',1);
INSERT INTO `oc_zone` VALUES (4028,248,'UY',1);
INSERT INTO `oc_zone` VALUES (4029,248,'NU',1);
INSERT INTO `oc_zone` VALUES (4030,248,'WR',1);
INSERT INTO `oc_zone` VALUES (4031,248,'BW',1);
INSERT INTO `oc_zone` VALUES (4032,248,'EW',1);
INSERT INTO `oc_zone` VALUES (4035,129,'MY-16',1);
INSERT INTO `oc_zone` VALUES (4038,117,'002',1);
INSERT INTO `oc_zone` VALUES (4040,117,'003',1);
INSERT INTO `oc_zone` VALUES (4042,117,'004',1);
INSERT INTO `oc_zone` VALUES (4044,117,'005',1);
INSERT INTO `oc_zone` VALUES (4045,117,'006',1);
INSERT INTO `oc_zone` VALUES (4047,117,'007',1);
INSERT INTO `oc_zone` VALUES (4048,117,'008',1);
INSERT INTO `oc_zone` VALUES (4050,117,'008',1);
INSERT INTO `oc_zone` VALUES (4052,117,'010',1);
INSERT INTO `oc_zone` VALUES (4053,117,'011',1);
INSERT INTO `oc_zone` VALUES (4054,117,'012',1);
INSERT INTO `oc_zone` VALUES (4056,117,'013',1);
INSERT INTO `oc_zone` VALUES (4058,117,'014',1);
INSERT INTO `oc_zone` VALUES (4060,117,'015',1);
INSERT INTO `oc_zone` VALUES (4062,117,'016',1);
INSERT INTO `oc_zone` VALUES (4063,117,'017',1);
INSERT INTO `oc_zone` VALUES (4065,117,'018',1);
INSERT INTO `oc_zone` VALUES (4066,117,'019',1);
INSERT INTO `oc_zone` VALUES (4067,117,'020',1);
INSERT INTO `oc_zone` VALUES (4069,117,'021',1);
INSERT INTO `oc_zone` VALUES (4071,117,'022',1);
INSERT INTO `oc_zone` VALUES (4072,117,'023',1);
INSERT INTO `oc_zone` VALUES (4074,117,'024',1);
INSERT INTO `oc_zone` VALUES (4075,117,'DGV',1);
INSERT INTO `oc_zone` VALUES (4076,117,'025',1);
INSERT INTO `oc_zone` VALUES (4078,117,'026',1);
INSERT INTO `oc_zone` VALUES (4079,117,'027',1);
INSERT INTO `oc_zone` VALUES (4081,117,'028',1);
INSERT INTO `oc_zone` VALUES (4082,117,'029',1);
INSERT INTO `oc_zone` VALUES (4083,117,'030',1);
INSERT INTO `oc_zone` VALUES (4084,117,'031',1);
INSERT INTO `oc_zone` VALUES (4086,117,'032',1);
INSERT INTO `oc_zone` VALUES (4088,117,'033',1);
INSERT INTO `oc_zone` VALUES (4089,117,'034',1);
INSERT INTO `oc_zone` VALUES (4091,117,'035',1);
INSERT INTO `oc_zone` VALUES (4093,117,'036',1);
INSERT INTO `oc_zone` VALUES (4094,117,'037',1);
INSERT INTO `oc_zone` VALUES (4096,117,'038',1);
INSERT INTO `oc_zone` VALUES (4097,117,'039',1);
INSERT INTO `oc_zone` VALUES (4098,117,'040',1);
INSERT INTO `oc_zone` VALUES (4099,117,'JEL',1);
INSERT INTO `oc_zone` VALUES (4100,117,'041',1);
INSERT INTO `oc_zone` VALUES (4101,117,'JKB',1);
INSERT INTO `oc_zone` VALUES (4102,117,'042',1);
INSERT INTO `oc_zone` VALUES (4103,117,'JUR',1);
INSERT INTO `oc_zone` VALUES (4106,117,'043',1);
INSERT INTO `oc_zone` VALUES (4108,117,'044',1);
INSERT INTO `oc_zone` VALUES (4110,117,'046',1);
INSERT INTO `oc_zone` VALUES (4112,117,'047',1);
INSERT INTO `oc_zone` VALUES (4113,117,'048',1);
INSERT INTO `oc_zone` VALUES (4114,117,'049',1);
INSERT INTO `oc_zone` VALUES (4116,117,'050',1);
INSERT INTO `oc_zone` VALUES (4117,117,'051',1);
INSERT INTO `oc_zone` VALUES (4119,117,'052',1);
INSERT INTO `oc_zone` VALUES (4121,117,'053',1);
INSERT INTO `oc_zone` VALUES (4122,117,'LPX',1);
INSERT INTO `oc_zone` VALUES (4124,117,'054',1);
INSERT INTO `oc_zone` VALUES (4126,117,'055',1);
INSERT INTO `oc_zone` VALUES (4128,117,'056',1);
INSERT INTO `oc_zone` VALUES (4130,117,'057',1);
INSERT INTO `oc_zone` VALUES (4132,117,'058',1);
INSERT INTO `oc_zone` VALUES (4134,117,'059',1);
INSERT INTO `oc_zone` VALUES (4136,117,'060',1);
INSERT INTO `oc_zone` VALUES (4137,117,'061',1);
INSERT INTO `oc_zone` VALUES (4138,117,'062',1);
INSERT INTO `oc_zone` VALUES (4139,117,'063',1);
INSERT INTO `oc_zone` VALUES (4140,117,'064',1);
INSERT INTO `oc_zone` VALUES (4141,117,'065',1);
INSERT INTO `oc_zone` VALUES (4142,117,'066',1);
INSERT INTO `oc_zone` VALUES (4144,117,'067',1);
INSERT INTO `oc_zone` VALUES (4146,117,'068',1);
INSERT INTO `oc_zone` VALUES (4147,117,'069',1);
INSERT INTO `oc_zone` VALUES (4148,117,'070',1);
INSERT INTO `oc_zone` VALUES (4150,117,'071',1);
INSERT INTO `oc_zone` VALUES (4153,117,'072',1);
INSERT INTO `oc_zone` VALUES (4155,117,'073',1);
INSERT INTO `oc_zone` VALUES (4157,117,'074',1);
INSERT INTO `oc_zone` VALUES (4158,117,'075',1);
INSERT INTO `oc_zone` VALUES (4159,117,'076',1);
INSERT INTO `oc_zone` VALUES (4160,117,'REZ',1);
INSERT INTO `oc_zone` VALUES (4161,117,'077',1);
INSERT INTO `oc_zone` VALUES (4162,117,'078',1);
INSERT INTO `oc_zone` VALUES (4163,117,'RIX',1);
INSERT INTO `oc_zone` VALUES (4164,117,'079',1);
INSERT INTO `oc_zone` VALUES (4165,117,'080',1);
INSERT INTO `oc_zone` VALUES (4166,117,'081',1);
INSERT INTO `oc_zone` VALUES (4167,117,'082',1);
INSERT INTO `oc_zone` VALUES (4168,117,'083',1);
INSERT INTO `oc_zone` VALUES (4170,117,'084',1);
INSERT INTO `oc_zone` VALUES (4173,117,'086',1);
INSERT INTO `oc_zone` VALUES (4174,117,'085',1);
INSERT INTO `oc_zone` VALUES (4175,117,'087',1);
INSERT INTO `oc_zone` VALUES (4177,117,'088',1);
INSERT INTO `oc_zone` VALUES (4178,117,'0840201',1);
INSERT INTO `oc_zone` VALUES (4180,117,'089',1);
INSERT INTO `oc_zone` VALUES (4182,117,'090',1);
INSERT INTO `oc_zone` VALUES (4184,117,'091',1);
INSERT INTO `oc_zone` VALUES (4185,117,'092',1);
INSERT INTO `oc_zone` VALUES (4187,117,'093',1);
INSERT INTO `oc_zone` VALUES (4189,117,'094',1);
INSERT INTO `oc_zone` VALUES (4192,117,'095',1);
INSERT INTO `oc_zone` VALUES (4194,117,'096',1);
INSERT INTO `oc_zone` VALUES (4197,117,'097',1);
INSERT INTO `oc_zone` VALUES (4198,117,'098',1);
INSERT INTO `oc_zone` VALUES (4199,117,'099',1);
INSERT INTO `oc_zone` VALUES (4201,117,'100',1);
INSERT INTO `oc_zone` VALUES (4204,117,'101',1);
INSERT INTO `oc_zone` VALUES (4205,117,'VMR',1);
INSERT INTO `oc_zone` VALUES (4208,117,'102',1);
INSERT INTO `oc_zone` VALUES (4209,117,'103',1);
INSERT INTO `oc_zone` VALUES (4210,117,'104',1);
INSERT INTO `oc_zone` VALUES (4211,117,'105',1);
INSERT INTO `oc_zone` VALUES (4212,117,'VEN',1);
INSERT INTO `oc_zone` VALUES (4213,117,'106',1);
INSERT INTO `oc_zone` VALUES (4215,117,'107',1);
INSERT INTO `oc_zone` VALUES (4217,117,'108',1);
INSERT INTO `oc_zone` VALUES (4219,117,'109',1);
INSERT INTO `oc_zone` VALUES (4221,117,'110',1);
INSERT INTO `oc_zone` VALUES (4222,43,'AP',1);
INSERT INTO `oc_zone` VALUES (4223,43,'LR',1);
INSERT INTO `oc_zone` VALUES (4224,220,'63',1);
INSERT INTO `oc_zone` VALUES (4225,118,'LB-BR',1);
INSERT INTO `oc_zone` VALUES (4226,118,'LB-BE',1);
INSERT INTO `oc_zone` VALUES (4227,118,'LB-ML',1);
INSERT INTO `oc_zone` VALUES (4228,118,'LB-NB',1);
INSERT INTO `oc_zone` VALUES (4229,118,'LB-NR',1);
INSERT INTO `oc_zone` VALUES (4230,118,'LB-ST',1);
INSERT INTO `oc_zone` VALUES (4231,99,'TS',1);
INSERT INTO `oc_zone` VALUES (4232,44,'QH',1);
INSERT INTO `oc_zone` VALUES (4233,100,'PB',1);
INSERT INTO `oc_zone` VALUES (4234,100,'SR',1);
INSERT INTO `oc_zone` VALUES (4235,100,'KR',1);
INSERT INTO `oc_zone` VALUES (4236,105,'BT',1);
INSERT INTO `oc_zone` VALUES (4237,105,'FM',1);
INSERT INTO `oc_zone` VALUES (4238,105,'MB',1);
INSERT INTO `oc_zone` VALUES (4239,113,'11',1);
INSERT INTO `oc_zone` VALUES (4240,113,'26',1);
INSERT INTO `oc_zone` VALUES (4241,113,'27',1);
INSERT INTO `oc_zone` VALUES (4242,113,'30',1);
INSERT INTO `oc_zone` VALUES (4243,113,'29',1);
INSERT INTO `oc_zone` VALUES (4244,113,'28',1);
INSERT INTO `oc_zone` VALUES (4245,113,'31',1);
INSERT INTO `oc_zone` VALUES (4246,113,'43',1);
INSERT INTO `oc_zone` VALUES (4247,113,'44',1);
INSERT INTO `oc_zone` VALUES (4248,113,'42',1);
INSERT INTO `oc_zone` VALUES (4249,113,'41',1);
INSERT INTO `oc_zone` VALUES (4250,113,'47',1);
INSERT INTO `oc_zone` VALUES (4251,113,'48',1);
INSERT INTO `oc_zone` VALUES (4252,113,'45',1);
INSERT INTO `oc_zone` VALUES (4253,113,'46',1);
INSERT INTO `oc_zone` VALUES (4254,113,'49',1);
INSERT INTO `oc_zone` VALUES (4255,113,'50',1);
INSERT INTO `oc_zone` VALUES (4256,209,'14',1);
INSERT INTO `oc_zone` VALUES (4257,176,'RU-AD',1);
INSERT INTO `oc_zone` VALUES (4258,176,'RU-BA',1);
INSERT INTO `oc_zone` VALUES (4259,176,'RU-BU',1);
INSERT INTO `oc_zone` VALUES (4260,176,'RU-AL',1);
INSERT INTO `oc_zone` VALUES (4261,176,'RU-DA',1);
INSERT INTO `oc_zone` VALUES (4262,176,'RU-IN',1);
INSERT INTO `oc_zone` VALUES (4263,176,'RU-KB',1);
INSERT INTO `oc_zone` VALUES (4264,176,'RU-KL',1);
INSERT INTO `oc_zone` VALUES (4265,176,'RU-KC',1);
INSERT INTO `oc_zone` VALUES (4266,176,'RU-KR',1);
INSERT INTO `oc_zone` VALUES (4267,176,'RU-KO',1);
INSERT INTO `oc_zone` VALUES (4268,176,'RU-ME',1);
INSERT INTO `oc_zone` VALUES (4269,176,'RU-MO',1);
INSERT INTO `oc_zone` VALUES (4270,176,'RU-SA',1);
INSERT INTO `oc_zone` VALUES (4271,176,'RU-SE',1);
INSERT INTO `oc_zone` VALUES (4272,176,'RU-TA',1);
INSERT INTO `oc_zone` VALUES (4273,176,'RU-TY',1);
INSERT INTO `oc_zone` VALUES (4274,176,'RU-UD',1);
INSERT INTO `oc_zone` VALUES (4275,176,'RU-KK',1);
INSERT INTO `oc_zone` VALUES (4276,176,'RU-CE',1);
INSERT INTO `oc_zone` VALUES (4277,176,'RU-CU',1);
INSERT INTO `oc_zone` VALUES (4278,176,'RU-ALT',1);
INSERT INTO `oc_zone` VALUES (4279,176,'RU-KDA',1);
INSERT INTO `oc_zone` VALUES (4280,176,'RU-KYA',1);
INSERT INTO `oc_zone` VALUES (4281,176,'RU-PRI',1);
INSERT INTO `oc_zone` VALUES (4282,176,'RU-STA',1);
INSERT INTO `oc_zone` VALUES (4283,176,'RU-KHA',1);
INSERT INTO `oc_zone` VALUES (4284,176,'RU-AMU',1);
INSERT INTO `oc_zone` VALUES (4285,176,'RU-ARK',1);
INSERT INTO `oc_zone` VALUES (4286,176,'RU-AST',1);
INSERT INTO `oc_zone` VALUES (4287,176,'RU-BEL',1);
INSERT INTO `oc_zone` VALUES (4288,176,'RU-BRY',1);
INSERT INTO `oc_zone` VALUES (4289,176,'RU-VLA',1);
INSERT INTO `oc_zone` VALUES (4290,176,'RU-VGG',1);
INSERT INTO `oc_zone` VALUES (4291,176,'RU-VLG',1);
INSERT INTO `oc_zone` VALUES (4292,176,'RU-VOR',1);
INSERT INTO `oc_zone` VALUES (4293,176,'RU-IVA',1);
INSERT INTO `oc_zone` VALUES (4294,176,'RU-IRK',1);
INSERT INTO `oc_zone` VALUES (4295,176,'RU-KGD',1);
INSERT INTO `oc_zone` VALUES (4296,176,'RU-KLU',1);
INSERT INTO `oc_zone` VALUES (4297,176,'RU-KAM',1);
INSERT INTO `oc_zone` VALUES (4298,176,'RU-KEM',1);
INSERT INTO `oc_zone` VALUES (4299,176,'RU-KIR',1);
INSERT INTO `oc_zone` VALUES (4300,176,'RU-KOS',1);
INSERT INTO `oc_zone` VALUES (4301,176,'RU-KGN',1);
INSERT INTO `oc_zone` VALUES (4302,176,'RU-KRS',1);
INSERT INTO `oc_zone` VALUES (4303,176,'RU-LEN',1);
INSERT INTO `oc_zone` VALUES (4304,176,'RU-LIP',1);
INSERT INTO `oc_zone` VALUES (4305,176,'RU-MAG',1);
INSERT INTO `oc_zone` VALUES (4306,176,'RU-MOS',1);
INSERT INTO `oc_zone` VALUES (4307,176,'RU-MUR',1);
INSERT INTO `oc_zone` VALUES (4308,176,'RU-NIZ',1);
INSERT INTO `oc_zone` VALUES (4309,176,'RU-NGR',1);
INSERT INTO `oc_zone` VALUES (4310,176,'RU-NVS',1);
INSERT INTO `oc_zone` VALUES (4311,176,'RU-OMS',1);
INSERT INTO `oc_zone` VALUES (4312,176,'RU-ORE',1);
INSERT INTO `oc_zone` VALUES (4313,176,'RU-ORL',1);
INSERT INTO `oc_zone` VALUES (4314,176,'RU-PNZ',1);
INSERT INTO `oc_zone` VALUES (4315,176,'RU-PER',1);
INSERT INTO `oc_zone` VALUES (4316,176,'RU-PSK',1);
INSERT INTO `oc_zone` VALUES (4317,176,'RU-ROS',1);
INSERT INTO `oc_zone` VALUES (4318,176,'RU-RYA',1);
INSERT INTO `oc_zone` VALUES (4319,176,'RU-SAM',1);
INSERT INTO `oc_zone` VALUES (4320,176,'RU-SAR',1);
INSERT INTO `oc_zone` VALUES (4321,176,'RU-SAK',1);
INSERT INTO `oc_zone` VALUES (4322,176,'RU-SVE',1);
INSERT INTO `oc_zone` VALUES (4323,176,'RU-SMO',1);
INSERT INTO `oc_zone` VALUES (4324,176,'RU-TAM',1);
INSERT INTO `oc_zone` VALUES (4325,176,'RU-TVE',1);
INSERT INTO `oc_zone` VALUES (4326,176,'RU-TOM',1);
INSERT INTO `oc_zone` VALUES (4327,176,'RU-TUL',1);
INSERT INTO `oc_zone` VALUES (4328,176,'RU-TYU',1);
INSERT INTO `oc_zone` VALUES (4329,176,'RU-ULY',1);
INSERT INTO `oc_zone` VALUES (4330,176,'RU-CHE',1);
INSERT INTO `oc_zone` VALUES (4331,176,'RU-ZAB',1);
INSERT INTO `oc_zone` VALUES (4332,176,'RU-YAR',1);
INSERT INTO `oc_zone` VALUES (4333,176,'RU-MOW',1);
INSERT INTO `oc_zone` VALUES (4334,176,'RU-SPE',1);
INSERT INTO `oc_zone` VALUES (4335,176,'RU-YEV',1);
INSERT INTO `oc_zone` VALUES (4336,176,'RU-NEN',1);
INSERT INTO `oc_zone` VALUES (4337,176,'RU-KHM',1);
INSERT INTO `oc_zone` VALUES (4338,176,'RU-CHU',1);
INSERT INTO `oc_zone` VALUES (4339,176,'RU-YAN',1);
INSERT INTO `oc_zone` VALUES (4340,117,'001',1);
INSERT INTO `oc_zone` VALUES (4341,99,'CT',1);
INSERT INTO `oc_zone` VALUES (4342,99,'LA',1);
INSERT INTO `oc_zone` VALUES (4343,99,'UT',1);
INSERT INTO `oc_zone` VALUES (4439,105,'SO-E01',1);
INSERT INTO `oc_zone` VALUES (4440,105,'CO-E01',1);
INSERT INTO `oc_zone` VALUES (4441,84,'AO',1);
INSERT INTO `oc_zone` VALUES (4442,109,'ABA',1);
INSERT INTO `oc_zone` VALUES (4443,109,'JET',1);
INSERT INTO `oc_zone` VALUES (4444,109,'SHY',1);
INSERT INTO `oc_zone` VALUES (4445,109,'ULY',1);
INSERT INTO `oc_zone` VALUES (4446,97,'HU-BA',1);
INSERT INTO `oc_zone` VALUES (4447,97,'HU-BK',1);
INSERT INTO `oc_zone` VALUES (4448,97,'HU-BE',1);
INSERT INTO `oc_zone` VALUES (4449,97,'HU-BZ',1);
INSERT INTO `oc_zone` VALUES (4450,97,'HU-BU',1);
INSERT INTO `oc_zone` VALUES (4451,97,'HU-CS',1);
INSERT INTO `oc_zone` VALUES (4452,97,'HU-FE',1);
INSERT INTO `oc_zone` VALUES (4453,97,'HU-GS',1);
INSERT INTO `oc_zone` VALUES (4454,97,'HU-HB',1);
INSERT INTO `oc_zone` VALUES (4455,97,'HU-HE',1);
INSERT INTO `oc_zone` VALUES (4456,97,'HU-JN',1);
INSERT INTO `oc_zone` VALUES (4457,97,'HU-KE',1);
INSERT INTO `oc_zone` VALUES (4458,97,'HU-NO',1);
INSERT INTO `oc_zone` VALUES (4459,97,'HU-PE',1);
INSERT INTO `oc_zone` VALUES (4460,97,'HU-SO',1);
INSERT INTO `oc_zone` VALUES (4461,97,'HU-SZ',1);
INSERT INTO `oc_zone` VALUES (4462,97,'HU-TO',1);
INSERT INTO `oc_zone` VALUES (4463,97,'HU-VA',1);
INSERT INTO `oc_zone` VALUES (4464,97,'HU-VE',1);
INSERT INTO `oc_zone` VALUES (4465,97,'HU-ZA',1);
INSERT INTO `oc_zone` VALUES (4466,126,'MK001',1);
INSERT INTO `oc_zone` VALUES (4467,126,'MK002',1);
INSERT INTO `oc_zone` VALUES (4468,126,'MK003',1);
INSERT INTO `oc_zone` VALUES (4469,126,'MK004',1);
INSERT INTO `oc_zone` VALUES (4470,126,'MK005',1);
INSERT INTO `oc_zone` VALUES (4471,126,'MK006',1);
INSERT INTO `oc_zone` VALUES (4472,126,'MK007',1);
INSERT INTO `oc_zone` VALUES (4473,126,'MK008',1);
/*!40000 ALTER TABLE `oc_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_zone_description`
--

DROP TABLE IF EXISTS `oc_zone_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_zone_description` (
  `zone_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`zone_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_zone_description`
--

LOCK TABLES `oc_zone_description` WRITE;
/*!40000 ALTER TABLE `oc_zone_description` DISABLE KEYS */;
INSERT INTO `oc_zone_description` VALUES (3507,1,'\'Ajman');
INSERT INTO `oc_zone_description` VALUES (919,1,'\'Ali Sabih');
INSERT INTO `oc_zone_description` VALUES (1704,1,'\'Amman');
INSERT INTO `oc_zone_description` VALUES (2881,1,'\'Asir');
INSERT INTO `oc_zone_description` VALUES (2971,1,'&Aacute;lava');
INSERT INTO `oc_zone_description` VALUES (2976,1,'&Aacute;vila');
INSERT INTO `oc_zone_description` VALUES (2656,1,'&Eacute;vora');
INSERT INTO `oc_zone_description` VALUES (3034,1,'A\'ali an Nil');
INSERT INTO `oc_zone_description` VALUES (2852,1,'A\'ana');
INSERT INTO `oc_zone_description` VALUES (2649,1,'A&ccedil;ores');
INSERT INTO `oc_zone_description` VALUES (3095,1,'Aargau');
INSERT INTO `oc_zone_description` VALUES (4442,1,'Abai');
INSERT INTO `oc_zone_description` VALUES (1741,1,'Abaiang');
INSERT INTO `oc_zone_description` VALUES (1742,1,'Abemama');
INSERT INTO `oc_zone_description` VALUES (789,1,'Abengourou');
INSERT INTO `oc_zone_description` VALUES (3513,1,'Aberdeen');
INSERT INTO `oc_zone_description` VALUES (3514,1,'Aberdeenshire');
INSERT INTO `oc_zone_description` VALUES (2388,1,'Abia');
INSERT INTO `oc_zone_description` VALUES (790,1,'Abidjan');
INSERT INTO `oc_zone_description` VALUES (1242,1,'Abkhazia');
INSERT INTO `oc_zone_description` VALUES (791,1,'Aboisso');
INSERT INTO `oc_zone_description` VALUES (2552,1,'Abra');
INSERT INTO `oc_zone_description` VALUES (209,1,'Abseron');
INSERT INTO `oc_zone_description` VALUES (3506,1,'Abu Dhabi');
INSERT INTO `oc_zone_description` VALUES (2389,1,'Abuja Federal Capital Territory');
INSERT INTO `oc_zone_description` VALUES (3789,1,'Abyan');
INSERT INTO `oc_zone_description` VALUES (1507,1,'Aceh');
INSERT INTO `oc_zone_description` VALUES (284,1,'Acklins');
INSERT INTO `oc_zone_description` VALUES (2863,1,'Acquaviva');
INSERT INTO `oc_zone_description` VALUES (440,1,'Acre');
INSERT INTO `oc_zone_description` VALUES (2449,1,'Ad Dakhiliyah');
INSERT INTO `oc_zone_description` VALUES (2260,1,'Ad Dakhla');
INSERT INTO `oc_zone_description` VALUES (3793,1,'Ad Dali');
INSERT INTO `oc_zone_description` VALUES (1001,1,'Ad Daqahliyah');
INSERT INTO `oc_zone_description` VALUES (2669,1,'Ad Dawhah');
INSERT INTO `oc_zone_description` VALUES (2390,1,'Adamawa');
INSERT INTO `oc_zone_description` VALUES (592,1,'Adamawa (Adamaoua)');
INSERT INTO `oc_zone_description` VALUES (3790,1,'Adan');
INSERT INTO `oc_zone_description` VALUES (3315,1,'Adana');
INSERT INTO `oc_zone_description` VALUES (4053,1,'Ādažu novads');
INSERT INTO `oc_zone_description` VALUES (1078,1,'Addis Ababa');
INSERT INTO `oc_zone_description` VALUES (2005,1,'Addu');
INSERT INTO `oc_zone_description` VALUES (1219,1,'Adelie Land');
INSERT INTO `oc_zone_description` VALUES (792,1,'Adiake');
INSERT INTO `oc_zone_description` VALUES (3316,1,'Adıyaman');
INSERT INTO `oc_zone_description` VALUES (3452,1,'Adjumani');
INSERT INTO `oc_zone_description` VALUES (69,1,'Adrar');
INSERT INTO `oc_zone_description` VALUES (2116,1,'Adrar');
INSERT INTO `oc_zone_description` VALUES (4257,1,'Adygea, Republic of');
INSERT INTO `oc_zone_description` VALUES (793,1,'Adzope');
INSERT INTO `oc_zone_description` VALUES (1069,1,'Afar');
INSERT INTO `oc_zone_description` VALUES (3317,1,'Afyonkarahisar');
INSERT INTO `oc_zone_description` VALUES (2380,1,'Agadez');
INSERT INTO `oc_zone_description` VALUES (2221,1,'Agadir');
INSERT INTO `oc_zone_description` VALUES (2134,1,'Agalega Islands');
INSERT INTO `oc_zone_description` VALUES (794,1,'Agboville');
INSERT INTO `oc_zone_description` VALUES (210,1,'AgcabAdi');
INSERT INTO `oc_zone_description` VALUES (211,1,'Agdam');
INSERT INTO `oc_zone_description` VALUES (212,1,'Agdas');
INSERT INTO `oc_zone_description` VALUES (4340,1,'Aglonas novads');
INSERT INTO `oc_zone_description` VALUES (795,1,'Agnibilekrou');
INSERT INTO `oc_zone_description` VALUES (3842,1,'Agrigento');
INSERT INTO `oc_zone_description` VALUES (3318,1,'Ağrı');
INSERT INTO `oc_zone_description` VALUES (213,1,'Agstafa');
INSERT INTO `oc_zone_description` VALUES (214,1,'Agsu');
INSERT INTO `oc_zone_description` VALUES (3971,1,'Aguascalientes');
INSERT INTO `oc_zone_description` VALUES (2553,1,'Agusan del Norte');
INSERT INTO `oc_zone_description` VALUES (2554,1,'Agusan del Sur');
INSERT INTO `oc_zone_description` VALUES (3396,1,'Ahal Welayaty');
INSERT INTO `oc_zone_description` VALUES (1027,1,'Ahuachapan');
INSERT INTO `oc_zone_description` VALUES (1085,1,'Ahvenanmaan lääni');
INSERT INTO `oc_zone_description` VALUES (1657,1,'Aichi');
INSERT INTO `oc_zone_description` VALUES (2853,1,'Aiga-i-le-Tai');
INSERT INTO `oc_zone_description` VALUES (966,1,'Aileu');
INSERT INTO `oc_zone_description` VALUES (2083,1,'Ailinginae');
INSERT INTO `oc_zone_description` VALUES (2084,1,'Ailinglaplap');
INSERT INTO `oc_zone_description` VALUES (2085,1,'Ailuk');
INSERT INTO `oc_zone_description` VALUES (2463,1,'Aimeliik');
INSERT INTO `oc_zone_description` VALUES (1114,1,'Ain');
INSERT INTO `oc_zone_description` VALUES (70,1,'Ain Defla');
INSERT INTO `oc_zone_description` VALUES (71,1,'Ain Temouchent');
INSERT INTO `oc_zone_description` VALUES (967,1,'Ainaro');
INSERT INTO `oc_zone_description` VALUES (2464,1,'Airai');
INSERT INTO `oc_zone_description` VALUES (671,1,'Aisen del General Carlos Ibanez');
INSERT INTO `oc_zone_description` VALUES (1115,1,'Aisne');
INSERT INTO `oc_zone_description` VALUES (774,1,'Aitutaki');
INSERT INTO `oc_zone_description` VALUES (2301,1,'Aiwo');
INSERT INTO `oc_zone_description` VALUES (4038,1,'Aizkraukles novads');
INSERT INTO `oc_zone_description` VALUES (4040,1,'Aizputes novads');
INSERT INTO `oc_zone_description` VALUES (1243,1,'Ajaria');
INSERT INTO `oc_zone_description` VALUES (1875,1,'Ajdabiya');
INSERT INTO `oc_zone_description` VALUES (1705,1,'Ajlun');
INSERT INTO `oc_zone_description` VALUES (2429,1,'Akershus');
INSERT INTO `oc_zone_description` VALUES (1658,1,'Akita');
INSERT INTO `oc_zone_description` VALUES (2555,1,'Aklan');
INSERT INTO `oc_zone_description` VALUES (4042,1,'Aknīstes novads');
INSERT INTO `oc_zone_description` VALUES (3319,1,'Aksaray');
INSERT INTO `oc_zone_description` VALUES (2391,1,'Akwa Ibom');
INSERT INTO `oc_zone_description` VALUES (1706,1,'Al \'Aqabah');
INSERT INTO `oc_zone_description` VALUES (1788,1,'Al \'Asimah');
INSERT INTO `oc_zone_description` VALUES (1876,1,'Al \'Aziziyah');
INSERT INTO `oc_zone_description` VALUES (1789,1,'Al Ahmadi');
INSERT INTO `oc_zone_description` VALUES (1580,1,'Al Anbar');
INSERT INTO `oc_zone_description` VALUES (2874,1,'Al Bahah');
INSERT INTO `oc_zone_description` VALUES (1002,1,'Al Bahr al Ahmar');
INSERT INTO `oc_zone_description` VALUES (3035,1,'Al Bahr al Ahmar');
INSERT INTO `oc_zone_description` VALUES (1707,1,'Al Balqa\'');
INSERT INTO `oc_zone_description` VALUES (1573,1,'Al Basrah');
INSERT INTO `oc_zone_description` VALUES (2450,1,'Al Batinah');
INSERT INTO `oc_zone_description` VALUES (3792,1,'Al Bayda');
INSERT INTO `oc_zone_description` VALUES (1003,1,'Al Buhayrah');
INSERT INTO `oc_zone_description` VALUES (3036,1,'Al Buhayrat');
INSERT INTO `oc_zone_description` VALUES (1790,1,'Al Farwaniyah');
INSERT INTO `oc_zone_description` VALUES (1877,1,'Al Fatih');
INSERT INTO `oc_zone_description` VALUES (1004,1,'Al Fayyum');
INSERT INTO `oc_zone_description` VALUES (3508,1,'Al Fujayrah');
INSERT INTO `oc_zone_description` VALUES (1005,1,'Al Gharbiyah');
INSERT INTO `oc_zone_description` VALUES (2670,1,'Al Ghuwayriyah');
INSERT INTO `oc_zone_description` VALUES (3121,1,'Al Hasakah');
INSERT INTO `oc_zone_description` VALUES (2222,1,'Al Hoceima');
INSERT INTO `oc_zone_description` VALUES (3797,1,'Al Hudaydah');
INSERT INTO `oc_zone_description` VALUES (2875,1,'Al Hudud ash Shamaliyah');
INSERT INTO `oc_zone_description` VALUES (1006,1,'Al Iskandariyah');
INSERT INTO `oc_zone_description` VALUES (1007,1,'Al Isma\'iliyah');
INSERT INTO `oc_zone_description` VALUES (1878,1,'Al Jabal al Akhdar');
INSERT INTO `oc_zone_description` VALUES (1791,1,'Al Jahra\'');
INSERT INTO `oc_zone_description` VALUES (2876,1,'Al Jawf');
INSERT INTO `oc_zone_description` VALUES (3799,1,'Al Jawf');
INSERT INTO `oc_zone_description` VALUES (3037,1,'Al Jazirah');
INSERT INTO `oc_zone_description` VALUES (1008,1,'Al Jizah');
INSERT INTO `oc_zone_description` VALUES (1879,1,'Al Jufrah');
INSERT INTO `oc_zone_description` VALUES (2671,1,'Al Jumayliyah');
INSERT INTO `oc_zone_description` VALUES (1708,1,'Al Karak');
INSERT INTO `oc_zone_description` VALUES (1578,1,'Al Karbala');
INSERT INTO `oc_zone_description` VALUES (3038,1,'Al Khartum');
INSERT INTO `oc_zone_description` VALUES (2672,1,'Al Khawr');
INSERT INTO `oc_zone_description` VALUES (1880,1,'Al Khums');
INSERT INTO `oc_zone_description` VALUES (1881,1,'Al Kufrah');
INSERT INTO `oc_zone_description` VALUES (3122,1,'Al Ladhiqiyah');
INSERT INTO `oc_zone_description` VALUES (2877,1,'Al Madinah');
INSERT INTO `oc_zone_description` VALUES (1709,1,'Al Mafraq');
INSERT INTO `oc_zone_description` VALUES (3802,1,'Al Mahrah');
INSERT INTO `oc_zone_description` VALUES (3803,1,'Al Mahwit');
INSERT INTO `oc_zone_description` VALUES (1009,1,'Al Minufiyah');
INSERT INTO `oc_zone_description` VALUES (1010,1,'Al Minya');
INSERT INTO `oc_zone_description` VALUES (1575,1,'Al Muthanna');
INSERT INTO `oc_zone_description` VALUES (3039,1,'Al Qadarif');
INSERT INTO `oc_zone_description` VALUES (1576,1,'Al Qadisyah');
INSERT INTO `oc_zone_description` VALUES (1011,1,'Al Qahirah');
INSERT INTO `oc_zone_description` VALUES (1012,1,'Al Qalyubiyah');
INSERT INTO `oc_zone_description` VALUES (2878,1,'Al Qasim');
INSERT INTO `oc_zone_description` VALUES (3123,1,'Al Qunaytirah');
INSERT INTO `oc_zone_description` VALUES (1013,1,'Al Wadi al Jadid');
INSERT INTO `oc_zone_description` VALUES (3040,1,'Al Wahdah');
INSERT INTO `oc_zone_description` VALUES (2673,1,'Al Wakrah');
INSERT INTO `oc_zone_description` VALUES (2451,1,'Al Wusta');
INSERT INTO `oc_zone_description` VALUES (3613,1,'Alabama');
INSERT INTO `oc_zone_description` VALUES (441,1,'Alagoas');
INSERT INTO `oc_zone_description` VALUES (782,1,'Alajuela');
INSERT INTO `oc_zone_description` VALUES (3614,1,'Alaska');
INSERT INTO `oc_zone_description` VALUES (2679,1,'Alba');
INSERT INTO `oc_zone_description` VALUES (2972,1,'Albacete');
INSERT INTO `oc_zone_description` VALUES (2556,1,'Albay');
INSERT INTO `oc_zone_description` VALUES (602,1,'Alberta');
INSERT INTO `oc_zone_description` VALUES (3969,1,'Alborz');
INSERT INTO `oc_zone_description` VALUES (796,1,'Alepe');
INSERT INTO `oc_zone_description` VALUES (3843,1,'Alessandria');
INSERT INTO `oc_zone_description` VALUES (72,1,'Alger');
INSERT INTO `oc_zone_description` VALUES (208,1,'Ali Bayramli');
INSERT INTO `oc_zone_description` VALUES (360,1,'Alibori');
INSERT INTO `oc_zone_description` VALUES (2973,1,'Alicante');
INSERT INTO `oc_zone_description` VALUES (1116,1,'Allier');
INSERT INTO `oc_zone_description` VALUES (1716,1,'Almaty');
INSERT INTO `oc_zone_description` VALUES (1717,1,'Almaty City');
INSERT INTO `oc_zone_description` VALUES (2974,1,'Almeria');
INSERT INTO `oc_zone_description` VALUES (3786,1,'Alo');
INSERT INTO `oc_zone_description` VALUES (4044,1,'Alojas novads');
INSERT INTO `oc_zone_description` VALUES (1117,1,'Alpes de Haute Provence');
INSERT INTO `oc_zone_description` VALUES (1119,1,'Alpes Maritimes');
INSERT INTO `oc_zone_description` VALUES (4045,1,'Alsungas novads');
INSERT INTO `oc_zone_description` VALUES (1304,1,'Alta Verapaz');
INSERT INTO `oc_zone_description` VALUES (4278,1,'Altai Krai');
INSERT INTO `oc_zone_description` VALUES (4260,1,'Altai Republic');
INSERT INTO `oc_zone_description` VALUES (2509,1,'Alto Paraguay');
INSERT INTO `oc_zone_description` VALUES (2510,1,'Alto Parana');
INSERT INTO `oc_zone_description` VALUES (4047,1,'Alūksnes novads');
INSERT INTO `oc_zone_description` VALUES (1911,1,'Alytus');
INSERT INTO `oc_zone_description` VALUES (2511,1,'Amambay');
INSERT INTO `oc_zone_description` VALUES (442,1,'Amapá');
INSERT INTO `oc_zone_description` VALUES (3320,1,'Amasya');
INSERT INTO `oc_zone_description` VALUES (4048,1,'Amatas novads');
INSERT INTO `oc_zone_description` VALUES (443,1,'Amazonas');
INSERT INTO `oc_zone_description` VALUES (720,1,'Amazonas');
INSERT INTO `oc_zone_description` VALUES (2527,1,'Amazonas');
INSERT INTO `oc_zone_description` VALUES (3726,1,'Amazonas');
INSERT INTO `oc_zone_description` VALUES (3401,1,'Ambergris Cays');
INSERT INTO `oc_zone_description` VALUES (3615,1,'American Samoa');
INSERT INTO `oc_zone_description` VALUES (1070,1,'Amhara');
INSERT INTO `oc_zone_description` VALUES (3189,1,'Amnat Charoen');
INSERT INTO `oc_zone_description` VALUES (3791,1,'Amran');
INSERT INTO `oc_zone_description` VALUES (4284,1,'Amur Oblast');
INSERT INTO `oc_zone_description` VALUES (3751,1,'An Giang');
INSERT INTO `oc_zone_description` VALUES (1579,1,'An Najaf');
INSERT INTO `oc_zone_description` VALUES (3041,1,'An Nil al Abyad');
INSERT INTO `oc_zone_description` VALUES (3042,1,'An Nil al Azraq');
INSERT INTO `oc_zone_description` VALUES (1882,1,'An Nuqat al Khams');
INSERT INTO `oc_zone_description` VALUES (2302,1,'Anabar');
INSERT INTO `oc_zone_description` VALUES (2392,1,'Anambra');
INSERT INTO `oc_zone_description` VALUES (2528,1,'Ancash');
INSERT INTO `oc_zone_description` VALUES (3844,1,'Ancona');
INSERT INTO `oc_zone_description` VALUES (1475,1,'Andaman and Nicobar Islands');
INSERT INTO `oc_zone_description` VALUES (1476,1,'Andhra Pradesh');
INSERT INTO `oc_zone_description` VALUES (3706,1,'Andijon');
INSERT INTO `oc_zone_description` VALUES (122,1,'Andorra la Vella');
INSERT INTO `oc_zone_description` VALUES (3973,1,'Andrijevica');
INSERT INTO `oc_zone_description` VALUES (2303,1,'Anetan');
INSERT INTO `oc_zone_description` VALUES (3190,1,'Ang Thong');
INSERT INTO `oc_zone_description` VALUES (2465,1,'Angaur');
INSERT INTO `oc_zone_description` VALUES (3515,1,'Anglesey');
INSERT INTO `oc_zone_description` VALUES (3516,1,'Angus');
INSERT INTO `oc_zone_description` VALUES (684,1,'Anhui');
INSERT INTO `oc_zone_description` VALUES (2304,1,'Anibare');
INSERT INTO `oc_zone_description` VALUES (754,1,'Anjouan');
INSERT INTO `oc_zone_description` VALUES (3321,1,'Ankara');
INSERT INTO `oc_zone_description` VALUES (73,1,'Annaba');
INSERT INTO `oc_zone_description` VALUES (2898,1,'Anse aux Pins');
INSERT INTO `oc_zone_description` VALUES (2899,1,'Anse Boileau');
INSERT INTO `oc_zone_description` VALUES (2900,1,'Anse Etoile');
INSERT INTO `oc_zone_description` VALUES (2901,1,'Anse Louis');
INSERT INTO `oc_zone_description` VALUES (2902,1,'Anse Royale');
INSERT INTO `oc_zone_description` VALUES (2835,1,'Anse-la-Raye');
INSERT INTO `oc_zone_description` VALUES (1049,1,'Anseba (Keren)');
INSERT INTO `oc_zone_description` VALUES (3322,1,'Antalya');
INSERT INTO `oc_zone_description` VALUES (1938,1,'Antananarivo');
INSERT INTO `oc_zone_description` VALUES (155,1,'Antartida e Islas del Atlantico');
INSERT INTO `oc_zone_description` VALUES (721,1,'Antioquia');
INSERT INTO `oc_zone_description` VALUES (2557,1,'Antique');
INSERT INTO `oc_zone_description` VALUES (672,1,'Antofagasta');
INSERT INTO `oc_zone_description` VALUES (1939,1,'Antsiranana');
INSERT INTO `oc_zone_description` VALUES (344,1,'Antwerpen');
INSERT INTO `oc_zone_description` VALUES (3727,1,'Anzoategui');
INSERT INTO `oc_zone_description` VALUES (1659,1,'Aomori');
INSERT INTO `oc_zone_description` VALUES (3845,1,'Aosta');
INSERT INTO `oc_zone_description` VALUES (3453,1,'Apac');
INSERT INTO `oc_zone_description` VALUES (2558,1,'Apayao');
INSERT INTO `oc_zone_description` VALUES (4050,1,'Apes novads');
INSERT INTO `oc_zone_description` VALUES (3096,1,'Appenzell Ausserrhoden');
INSERT INTO `oc_zone_description` VALUES (3097,1,'Appenzell Innerrhoden');
INSERT INTO `oc_zone_description` VALUES (3728,1,'Apure');
INSERT INTO `oc_zone_description` VALUES (2529,1,'Apurimac');
INSERT INTO `oc_zone_description` VALUES (1718,1,'Aqmola');
INSERT INTO `oc_zone_description` VALUES (1719,1,'Aqtobe');
INSERT INTO `oc_zone_description` VALUES (3124,1,'Ar Raqqah');
INSERT INTO `oc_zone_description` VALUES (2674,1,'Ar Rayyan');
INSERT INTO `oc_zone_description` VALUES (2879,1,'Ar Riyad');
INSERT INTO `oc_zone_description` VALUES (2680,1,'Arad');
INSERT INTO `oc_zone_description` VALUES (180,1,'Aragatsotn');
INSERT INTO `oc_zone_description` VALUES (3729,1,'Aragua');
INSERT INTO `oc_zone_description` VALUES (1743,1,'Aranuka');
INSERT INTO `oc_zone_description` VALUES (181,1,'Ararat');
INSERT INTO `oc_zone_description` VALUES (722,1,'Arauca');
INSERT INTO `oc_zone_description` VALUES (673,1,'Araucania');
INSERT INTO `oc_zone_description` VALUES (1583,1,'Arbil');
INSERT INTO `oc_zone_description` VALUES (1210,1,'Archipel des Marquises');
INSERT INTO `oc_zone_description` VALUES (1211,1,'Archipel des Tuamotu');
INSERT INTO `oc_zone_description` VALUES (1212,1,'Archipel des Tubuai');
INSERT INTO `oc_zone_description` VALUES (1120,1,'Ard&egrave;che');
INSERT INTO `oc_zone_description` VALUES (1543,1,'Ardabil');
INSERT INTO `oc_zone_description` VALUES (3323,1,'Ardahan');
INSERT INTO `oc_zone_description` VALUES (1121,1,'Ardennes');
INSERT INTO `oc_zone_description` VALUES (2530,1,'Arequipa');
INSERT INTO `oc_zone_description` VALUES (3846,1,'Arezzo');
INSERT INTO `oc_zone_description` VALUES (2681,1,'Argeș');
INSERT INTO `oc_zone_description` VALUES (3517,1,'Argyll and Bute');
INSERT INTO `oc_zone_description` VALUES (2217,1,'Arhangay');
INSERT INTO `oc_zone_description` VALUES (1995,1,'Ari Atoll Dheknu');
INSERT INTO `oc_zone_description` VALUES (1994,1,'Ari Atoll Uthuru');
INSERT INTO `oc_zone_description` VALUES (1122,1,'Ari&egrave;ge');
INSERT INTO `oc_zone_description` VALUES (3291,1,'Ariana');
INSERT INTO `oc_zone_description` VALUES (4222,1,'Arica y Parinacota');
INSERT INTO `oc_zone_description` VALUES (3287,1,'Arima');
INSERT INTO `oc_zone_description` VALUES (3616,1,'Arizona');
INSERT INTO `oc_zone_description` VALUES (3617,1,'Arkansas');
INSERT INTO `oc_zone_description` VALUES (4285,1,'Arkhangelsk Oblast');
INSERT INTO `oc_zone_description` VALUES (182,1,'Armavir');
INSERT INTO `oc_zone_description` VALUES (3618,1,'Armed Forces Africa');
INSERT INTO `oc_zone_description` VALUES (3619,1,'Armed Forces Americas');
INSERT INTO `oc_zone_description` VALUES (3620,1,'Armed Forces Canada');
INSERT INTO `oc_zone_description` VALUES (3621,1,'Armed Forces Europe');
INSERT INTO `oc_zone_description` VALUES (3622,1,'Armed Forces Middle East');
INSERT INTO `oc_zone_description` VALUES (3623,1,'Armed Forces Pacific');
INSERT INTO `oc_zone_description` VALUES (2086,1,'Arno');
INSERT INTO `oc_zone_description` VALUES (1744,1,'Arorae');
INSERT INTO `oc_zone_description` VALUES (1379,1,'Artibonite');
INSERT INTO `oc_zone_description` VALUES (3687,1,'Artigas');
INSERT INTO `oc_zone_description` VALUES (3324,1,'Artvin');
INSERT INTO `oc_zone_description` VALUES (3454,1,'Arua');
INSERT INTO `oc_zone_description` VALUES (1477,1,'Arunachal Pradesh');
INSERT INTO `oc_zone_description` VALUES (3163,1,'Arusha');
INSERT INTO `oc_zone_description` VALUES (1585,1,'As Sulaymaniyah');
INSERT INTO `oc_zone_description` VALUES (3125,1,'As Suwayda');
INSERT INTO `oc_zone_description` VALUES (1015,1,'As Suways');
INSERT INTO `oc_zone_description` VALUES (3847,1,'Ascoli Piceno');
INSERT INTO `oc_zone_description` VALUES (3043,1,'Ash Shamaliyah');
INSERT INTO `oc_zone_description` VALUES (3509,1,'Ash Shāriqah');
INSERT INTO `oc_zone_description` VALUES (1014,1,'Ash Sharqiyah');
INSERT INTO `oc_zone_description` VALUES (2452,1,'Ash Sharqiyah');
INSERT INTO `oc_zone_description` VALUES (2880,1,'Ash Sharqiyah (Eastern)');
INSERT INTO `oc_zone_description` VALUES (1883,1,'Ash Shati\'');
INSERT INTO `oc_zone_description` VALUES (1270,1,'Ashanti Region');
INSERT INTO `oc_zone_description` VALUES (2117,1,'Assaba');
INSERT INTO `oc_zone_description` VALUES (1478,1,'Assam');
INSERT INTO `oc_zone_description` VALUES (1720,1,'Astana City');
INSERT INTO `oc_zone_description` VALUES (215,1,'Astara');
INSERT INTO `oc_zone_description` VALUES (3848,1,'Asti');
INSERT INTO `oc_zone_description` VALUES (4286,1,'Astrakhan Oblast');
INSERT INTO `oc_zone_description` VALUES (2975,1,'Asturias');
INSERT INTO `oc_zone_description` VALUES (2512,1,'Asuncion');
INSERT INTO `oc_zone_description` VALUES (1016,1,'Aswan');
INSERT INTO `oc_zone_description` VALUES (1017,1,'Asyut');
INSERT INTO `oc_zone_description` VALUES (1710,1,'At Tafilah');
INSERT INTO `oc_zone_description` VALUES (674,1,'Atacama');
INSERT INTO `oc_zone_description` VALUES (3270,1,'Atafu');
INSERT INTO `oc_zone_description` VALUES (361,1,'Atakora');
INSERT INTO `oc_zone_description` VALUES (778,1,'Atiu');
INSERT INTO `oc_zone_description` VALUES (723,1,'Atlantico');
INSERT INTO `oc_zone_description` VALUES (2363,1,'Atlantico Norte');
INSERT INTO `oc_zone_description` VALUES (2364,1,'Atlantico Sur');
INSERT INTO `oc_zone_description` VALUES (1392,1,'Atlantida');
INSERT INTO `oc_zone_description` VALUES (362,1,'Atlantique');
INSERT INTO `oc_zone_description` VALUES (1802,1,'Attapu');
INSERT INTO `oc_zone_description` VALUES (2015,1,'Attard');
INSERT INTO `oc_zone_description` VALUES (1280,1,'Attica');
INSERT INTO `oc_zone_description` VALUES (2854,1,'Atua');
INSERT INTO `oc_zone_description` VALUES (1721,1,'Atyrau');
INSERT INTO `oc_zone_description` VALUES (1123,1,'Aube');
INSERT INTO `oc_zone_description` VALUES (4052,1,'Auces novads');
INSERT INTO `oc_zone_description` VALUES (2344,1,'Auckland');
INSERT INTO `oc_zone_description` VALUES (1124,1,'Aude');
INSERT INTO `oc_zone_description` VALUES (2087,1,'Aur');
INSERT INTO `oc_zone_description` VALUES (2559,1,'Aurora');
INSERT INTO `oc_zone_description` VALUES (2430,1,'Aust-Agder');
INSERT INTO `oc_zone_description` VALUES (191,1,'Australian Capital Territory');
INSERT INTO `oc_zone_description` VALUES (1467,1,'Austurland');
INSERT INTO `oc_zone_description` VALUES (1293,1,'Avannaa');
INSERT INTO `oc_zone_description` VALUES (2650,1,'Aveiro');
INSERT INTO `oc_zone_description` VALUES (3849,1,'Avellino');
INSERT INTO `oc_zone_description` VALUES (1125,1,'Aveyron');
INSERT INTO `oc_zone_description` VALUES (3483,1,'Avtonomna Respublika Krym');
INSERT INTO `oc_zone_description` VALUES (1884,1,'Awbari');
INSERT INTO `oc_zone_description` VALUES (2943,1,'Awdal');
INSERT INTO `oc_zone_description` VALUES (2531,1,'Ayacucho');
INSERT INTO `oc_zone_description` VALUES (3325,1,'Aydın');
INSERT INTO `oc_zone_description` VALUES (2274,1,'Ayeyarwady');
INSERT INTO `oc_zone_description` VALUES (2453,1,'Az Zahirah');
INSERT INTO `oc_zone_description` VALUES (1711,1,'Az Zarqa\'');
INSERT INTO `oc_zone_description` VALUES (1885,1,'Az Zawiyah');
INSERT INTO `oc_zone_description` VALUES (2223,1,'Azilal');
INSERT INTO `oc_zone_description` VALUES (935,1,'Azua');
INSERT INTO `oc_zone_description` VALUES (979,1,'Azuay');
INSERT INTO `oc_zone_description` VALUES (3756,1,'Ba Ria-Vung Tau');
INSERT INTO `oc_zone_description` VALUES (217,1,'BabAk');
INSERT INTO `oc_zone_description` VALUES (1577,1,'Babil');
INSERT INTO `oc_zone_description` VALUES (4054,1,'Babītes novads');
INSERT INTO `oc_zone_description` VALUES (3752,1,'Bac Giang');
INSERT INTO `oc_zone_description` VALUES (3753,1,'Bac Kan');
INSERT INTO `oc_zone_description` VALUES (3754,1,'Bac Lieu');
INSERT INTO `oc_zone_description` VALUES (3755,1,'Bac Ninh');
INSERT INTO `oc_zone_description` VALUES (2682,1,'Bacău');
INSERT INTO `oc_zone_description` VALUES (4447,1,'Bács-Kiskun');
INSERT INTO `oc_zone_description` VALUES (2977,1,'Badajoz');
INSERT INTO `oc_zone_description` VALUES (1,1,'Badakhshan');
INSERT INTO `oc_zone_description` VALUES (1254,1,'Baden-Württemberg');
INSERT INTO `oc_zone_description` VALUES (2,1,'Badghis');
INSERT INTO `oc_zone_description` VALUES (1360,1,'Bafata Region');
INSERT INTO `oc_zone_description` VALUES (1568,1,'Baghdad');
INSERT INTO `oc_zone_description` VALUES (3,1,'Baghlan');
INSERT INTO `oc_zone_description` VALUES (2315,1,'Bagmati');
INSERT INTO `oc_zone_description` VALUES (2275,1,'Bago');
INSERT INTO `oc_zone_description` VALUES (444,1,'Bahia');
INSERT INTO `oc_zone_description` VALUES (3044,1,'Bahr al Jabal');
INSERT INTO `oc_zone_description` VALUES (2903,1,'Baie Lazare');
INSERT INTO `oc_zone_description` VALUES (2904,1,'Baie Sainte Anne');
INSERT INTO `oc_zone_description` VALUES (2305,1,'Baiti');
INSERT INTO `oc_zone_description` VALUES (2146,1,'Baja California');
INSERT INTO `oc_zone_description` VALUES (2147,1,'Baja California Sur');
INSERT INTO `oc_zone_description` VALUES (1305,1,'Baja Verapaz');
INSERT INTO `oc_zone_description` VALUES (3678,1,'Baker Island');
INSERT INTO `oc_zone_description` VALUES (216,1,'Baki');
INSERT INTO `oc_zone_description` VALUES (2944,1,'Bakool');
INSERT INTO `oc_zone_description` VALUES (1944,1,'Balaka');
INSERT INTO `oc_zone_description` VALUES (218,1,'BalakAn');
INSERT INTO `oc_zone_description` VALUES (4056,1,'Baldones novads');
INSERT INTO `oc_zone_description` VALUES (506,1,'Bale');
INSERT INTO `oc_zone_description` VALUES (2978,1,'Baleares');
INSERT INTO `oc_zone_description` VALUES (1508,1,'Bali');
INSERT INTO `oc_zone_description` VALUES (3326,1,'Balıkesir');
INSERT INTO `oc_zone_description` VALUES (3397,1,'Balkan Welayaty');
INSERT INTO `oc_zone_description` VALUES (4,1,'Balkh');
INSERT INTO `oc_zone_description` VALUES (2457,1,'Balochistan');
INSERT INTO `oc_zone_description` VALUES (2183,1,'Balti');
INSERT INTO `oc_zone_description` VALUES (4058,1,'Baltinavas novads');
INSERT INTO `oc_zone_description` VALUES (4060,1,'Balvu novads');
INSERT INTO `oc_zone_description` VALUES (2016,1,'Balzan');
INSERT INTO `oc_zone_description` VALUES (1902,1,'Balzers');
INSERT INTO `oc_zone_description` VALUES (507,1,'Bam');
INSERT INTO `oc_zone_description` VALUES (2014,1,'Bamako Capital District');
INSERT INTO `oc_zone_description` VALUES (5,1,'Bamian');
INSERT INTO `oc_zone_description` VALUES (640,1,'Bamingui-Bangoran');
INSERT INTO `oc_zone_description` VALUES (2945,1,'Banaadir');
INSERT INTO `oc_zone_description` VALUES (1745,1,'Banaba');
INSERT INTO `oc_zone_description` VALUES (3813,1,'Bandundu');
INSERT INTO `oc_zone_description` VALUES (1886,1,'Banghazi');
INSERT INTO `oc_zone_description` VALUES (3192,1,'Bangkok');
INSERT INTO `oc_zone_description` VALUES (798,1,'Bangolo');
INSERT INTO `oc_zone_description` VALUES (656,1,'Bangui');
INSERT INTO `oc_zone_description` VALUES (1018,1,'Bani Suwayf');
INSERT INTO `oc_zone_description` VALUES (423,1,'Banja Luka');
INSERT INTO `oc_zone_description` VALUES (1229,1,'Banjul');
INSERT INTO `oc_zone_description` VALUES (2925,1,'Banskobystrický');
INSERT INTO `oc_zone_description` VALUES (571,1,'Banteay Meanchey');
INSERT INTO `oc_zone_description` VALUES (1509,1,'Banten');
INSERT INTO `oc_zone_description` VALUES (508,1,'Banwa');
INSERT INTO `oc_zone_description` VALUES (936,1,'Baoruco');
INSERT INTO `oc_zone_description` VALUES (3974,1,'Bar');
INSERT INTO `oc_zone_description` VALUES (937,1,'Barahona');
INSERT INTO `oc_zone_description` VALUES (4446,1,'Baranya');
INSERT INTO `oc_zone_description` VALUES (153,1,'Barbuda');
INSERT INTO `oc_zone_description` VALUES (2979,1,'Barcelona');
INSERT INTO `oc_zone_description` VALUES (219,1,'BArdA');
INSERT INTO `oc_zone_description` VALUES (2946,1,'Bari');
INSERT INTO `oc_zone_description` VALUES (3850,1,'Bari');
INSERT INTO `oc_zone_description` VALUES (1369,1,'Barima-Waini');
INSERT INTO `oc_zone_description` VALUES (3730,1,'Barinas');
INSERT INTO `oc_zone_description` VALUES (320,1,'Barisal');
INSERT INTO `oc_zone_description` VALUES (4236,1,'Barletta-Andria-Trani');
INSERT INTO `oc_zone_description` VALUES (3327,1,'Bartın');
INSERT INTO `oc_zone_description` VALUES (1181,1,'Bas Rhin');
INSERT INTO `oc_zone_description` VALUES (3812,1,'Bas-Congo');
INSERT INTO `oc_zone_description` VALUES (3099,1,'Basel-Landschaft');
INSERT INTO `oc_zone_description` VALUES (3098,1,'Basel-Stadt');
INSERT INTO `oc_zone_description` VALUES (4258,1,'Bashkortostan, Republic of');
INSERT INTO `oc_zone_description` VALUES (2560,1,'Basilan');
INSERT INTO `oc_zone_description` VALUES (1230,1,'Basse');
INSERT INTO `oc_zone_description` VALUES (641,1,'Basse-Kotto');
INSERT INTO `oc_zone_description` VALUES (2561,1,'Bataan');
INSERT INTO `oc_zone_description` VALUES (2562,1,'Batanes');
INSERT INTO `oc_zone_description` VALUES (2563,1,'Batangas');
INSERT INTO `oc_zone_description` VALUES (657,1,'Batha');
INSERT INTO `oc_zone_description` VALUES (1794,1,'Batken');
INSERT INTO `oc_zone_description` VALUES (3328,1,'Batman');
INSERT INTO `oc_zone_description` VALUES (74,1,'Batna');
INSERT INTO `oc_zone_description` VALUES (572,1,'Battambang');
INSERT INTO `oc_zone_description` VALUES (1722,1,'Batys Qazaqstan');
INSERT INTO `oc_zone_description` VALUES (968,1,'Baucau');
INSERT INTO `oc_zone_description` VALUES (2393,1,'Bauchi');
INSERT INTO `oc_zone_description` VALUES (4062,1,'Bauskas novads');
INSERT INTO `oc_zone_description` VALUES (2947,1,'Bay');
INSERT INTO `oc_zone_description` VALUES (2345,1,'Bay of Plenty');
INSERT INTO `oc_zone_description` VALUES (2216,1,'Bayan-Olgiy');
INSERT INTO `oc_zone_description` VALUES (2215,1,'Bayanhongor');
INSERT INTO `oc_zone_description` VALUES (3329,1,'Bayburt');
INSERT INTO `oc_zone_description` VALUES (2394,1,'Bayelsa');
INSERT INTO `oc_zone_description` VALUES (1255,1,'Bayern');
INSERT INTO `oc_zone_description` VALUES (1723,1,'Bayqongyr City');
INSERT INTO `oc_zone_description` VALUES (509,1,'Bazega');
INSERT INTO `oc_zone_description` VALUES (1612,1,'Be\'er Sheva');
INSERT INTO `oc_zone_description` VALUES (2129,1,'Beau Bassin-Rose Hill');
INSERT INTO `oc_zone_description` VALUES (2905,1,'Beau Vallon');
INSERT INTO `oc_zone_description` VALUES (75,1,'Bechar');
INSERT INTO `oc_zone_description` VALUES (3518,1,'Bedfordshire');
INSERT INTO `oc_zone_description` VALUES (685,1,'Beijing');
INSERT INTO `oc_zone_description` VALUES (4225,1,'Beirut');
INSERT INTO `oc_zone_description` VALUES (2651,1,'Beja');
INSERT INTO `oc_zone_description` VALUES (3292,1,'Beja');
INSERT INTO `oc_zone_description` VALUES (76,1,'Bejaia');
INSERT INTO `oc_zone_description` VALUES (4226,1,'Bekaa');
INSERT INTO `oc_zone_description` VALUES (4448,1,'Békés');
INSERT INTO `oc_zone_description` VALUES (2906,1,'Bel Air');
INSERT INTO `oc_zone_description` VALUES (2907,1,'Bel Ombre');
INSERT INTO `oc_zone_description` VALUES (475,1,'Belait');
INSERT INTO `oc_zone_description` VALUES (4287,1,'Belgorod Oblast');
INSERT INTO `oc_zone_description` VALUES (3994,1,'Belgrade');
INSERT INTO `oc_zone_description` VALUES (354,1,'Belize');
INSERT INTO `oc_zone_description` VALUES (3851,1,'Belluno');
INSERT INTO `oc_zone_description` VALUES (3293,1,'Ben Arous');
INSERT INTO `oc_zone_description` VALUES (2225,1,'Ben Slimane');
INSERT INTO `oc_zone_description` VALUES (3757,1,'Ben Tre');
INSERT INTO `oc_zone_description` VALUES (3852,1,'Benevento');
INSERT INTO `oc_zone_description` VALUES (1510,1,'Bengkulu');
INSERT INTO `oc_zone_description` VALUES (129,1,'Bengo');
INSERT INTO `oc_zone_description` VALUES (130,1,'Benguela');
INSERT INTO `oc_zone_description` VALUES (2565,1,'Benguet');
INSERT INTO `oc_zone_description` VALUES (403,1,'Beni');
INSERT INTO `oc_zone_description` VALUES (2224,1,'Beni Mellal');
INSERT INTO `oc_zone_description` VALUES (1071,1,'Benishangul-Gumaz');
INSERT INTO `oc_zone_description` VALUES (2395,1,'Benue');
INSERT INTO `oc_zone_description` VALUES (799,1,'Beoumi');
INSERT INTO `oc_zone_description` VALUES (3975,1,'Berane');
INSERT INTO `oc_zone_description` VALUES (33,1,'Berat');
INSERT INTO `oc_zone_description` VALUES (1852,1,'Berea');
INSERT INTO `oc_zone_description` VALUES (3853,1,'Bergamo');
INSERT INTO `oc_zone_description` VALUES (3519,1,'Berkshire');
INSERT INTO `oc_zone_description` VALUES (1256,1,'Berlin');
INSERT INTO `oc_zone_description` VALUES (3100,1,'Bern');
INSERT INTO `oc_zone_description` VALUES (285,1,'Berry Islands');
INSERT INTO `oc_zone_description` VALUES (1746,1,'Beru');
INSERT INTO `oc_zone_description` VALUES (4063,1,'Beverīnas novads');
INSERT INTO `oc_zone_description` VALUES (1327,1,'Beyla');
INSERT INTO `oc_zone_description` VALUES (220,1,'Beylaqan');
INSERT INTO `oc_zone_description` VALUES (2316,1,'Bheri');
INSERT INTO `oc_zone_description` VALUES (800,1,'Biankouma');
INSERT INTO `oc_zone_description` VALUES (131,1,'Bie');
INSERT INTO `oc_zone_description` VALUES (3854,1,'Biella');
INSERT INTO `oc_zone_description` VALUES (1479,1,'Bihar');
INSERT INTO `oc_zone_description` VALUES (2683,1,'Bihor');
INSERT INTO `oc_zone_description` VALUES (425,1,'Bijeljina');
INSERT INTO `oc_zone_description` VALUES (3976,1,'Bijelo Polje');
INSERT INTO `oc_zone_description` VALUES (1613,1,'Bika\'at Hayarden');
INSERT INTO `oc_zone_description` VALUES (2088,1,'Bikar');
INSERT INTO `oc_zone_description` VALUES (2089,1,'Bikini');
INSERT INTO `oc_zone_description` VALUES (221,1,'Bilasuvar');
INSERT INTO `oc_zone_description` VALUES (3330,1,'Bilecik');
INSERT INTO `oc_zone_description` VALUES (2564,1,'Biliran');
INSERT INTO `oc_zone_description` VALUES (658,1,'Biltine');
INSERT INTO `oc_zone_description` VALUES (286,1,'Bimini');
INSERT INTO `oc_zone_description` VALUES (3331,1,'Bingöl');
INSERT INTO `oc_zone_description` VALUES (3758,1,'Binh Dinh');
INSERT INTO `oc_zone_description` VALUES (3759,1,'Binh Duong');
INSERT INTO `oc_zone_description` VALUES (3760,1,'Binh Phuoc');
INSERT INTO `oc_zone_description` VALUES (3761,1,'Binh Thuan');
INSERT INTO `oc_zone_description` VALUES (675,1,'Bio-Bio');
INSERT INTO `oc_zone_description` VALUES (1361,1,'Biombo Region');
INSERT INTO `oc_zone_description` VALUES (2017,1,'Birgu');
INSERT INTO `oc_zone_description` VALUES (2018,1,'Birkirkara');
INSERT INTO `oc_zone_description` VALUES (2019,1,'Birzebbuga');
INSERT INTO `oc_zone_description` VALUES (1793,1,'Bishkek');
INSERT INTO `oc_zone_description` VALUES (77,1,'Biskra');
INSERT INTO `oc_zone_description` VALUES (1362,1,'Bissau Region');
INSERT INTO `oc_zone_description` VALUES (2684,1,'Bistrița-Năsăud');
INSERT INTO `oc_zone_description` VALUES (3332,1,'Bitlis');
INSERT INTO `oc_zone_description` VALUES (3294,1,'Bizerte');
INSERT INTO `oc_zone_description` VALUES (3019,1,'Bizkaia');
INSERT INTO `oc_zone_description` VALUES (847,1,'Bjelovarsko-bilogorska');
INSERT INTO `oc_zone_description` VALUES (287,1,'Black Point');
INSERT INTO `oc_zone_description` VALUES (2137,1,'Black River');
INSERT INTO `oc_zone_description` VALUES (3520,1,'Blaenau Gwent');
INSERT INTO `oc_zone_description` VALUES (479,1,'Blagoevgrad');
INSERT INTO `oc_zone_description` VALUES (1945,1,'Blantyre');
INSERT INTO `oc_zone_description` VALUES (3074,1,'Blekinge');
INSERT INTO `oc_zone_description` VALUES (78,1,'Blida');
INSERT INTO `oc_zone_description` VALUES (615,1,'Boa Vista');
INSERT INTO `oc_zone_description` VALUES (2365,1,'Boaco');
INSERT INTO `oc_zone_description` VALUES (969,1,'Bobonaro');
INSERT INTO `oc_zone_description` VALUES (797,1,'Bocanda');
INSERT INTO `oc_zone_description` VALUES (2479,1,'Bocas del Toro');
INSERT INTO `oc_zone_description` VALUES (2306,1,'Boe');
INSERT INTO `oc_zone_description` VALUES (1328,1,'Boffa');
INSERT INTO `oc_zone_description` VALUES (724,1,'Bogota D.C.');
INSERT INTO `oc_zone_description` VALUES (2566,1,'Bohol');
INSERT INTO `oc_zone_description` VALUES (2090,1,'Bokak');
INSERT INTO `oc_zone_description` VALUES (1329,1,'Boke');
INSERT INTO `oc_zone_description` VALUES (1803,1,'Bokeo');
INSERT INTO `oc_zone_description` VALUES (1363,1,'Bolama Region');
INSERT INTO `oc_zone_description` VALUES (1804,1,'Bolikhamxai');
INSERT INTO `oc_zone_description` VALUES (725,1,'Bolivar');
INSERT INTO `oc_zone_description` VALUES (980,1,'Bolivar');
INSERT INTO `oc_zone_description` VALUES (3731,1,'Bolivar');
INSERT INTO `oc_zone_description` VALUES (3855,1,'Bologna');
INSERT INTO `oc_zone_description` VALUES (3333,1,'Bolu');
INSERT INTO `oc_zone_description` VALUES (3856,1,'Bolzano');
INSERT INTO `oc_zone_description` VALUES (1862,1,'Bomi');
INSERT INTO `oc_zone_description` VALUES (4020,1,'Bonaire');
INSERT INTO `oc_zone_description` VALUES (801,1,'Bondoukou');
INSERT INTO `oc_zone_description` VALUES (1863,1,'Bong');
INSERT INTO `oc_zone_description` VALUES (802,1,'Bongouanou');
INSERT INTO `oc_zone_description` VALUES (2513,1,'Boqueron');
INSERT INTO `oc_zone_description` VALUES (4008,1,'Bor');
INSERT INTO `oc_zone_description` VALUES (79,1,'Bordj Bou Arreridj');
INSERT INTO `oc_zone_description` VALUES (2864,1,'Borgo Maggiore');
INSERT INTO `oc_zone_description` VALUES (363,1,'Borgou');
INSERT INTO `oc_zone_description` VALUES (659,1,'Borkou-Ennedi-Tibesti');
INSERT INTO `oc_zone_description` VALUES (2020,1,'Bormla');
INSERT INTO `oc_zone_description` VALUES (2396,1,'Borno');
INSERT INTO `oc_zone_description` VALUES (4449,1,'Borsod-Abaúj-Zemplén');
INSERT INTO `oc_zone_description` VALUES (417,1,'Bosanskopodrinjski Kanton');
INSERT INTO `oc_zone_description` VALUES (2685,1,'Botoșani');
INSERT INTO `oc_zone_description` VALUES (803,1,'Bouafle');
INSERT INTO `oc_zone_description` VALUES (804,1,'Bouake');
INSERT INTO `oc_zone_description` VALUES (1126,1,'Bouches du Rh&ocirc;ne');
INSERT INTO `oc_zone_description` VALUES (756,1,'Bouenza');
INSERT INTO `oc_zone_description` VALUES (2489,1,'Bougainville');
INSERT INTO `oc_zone_description` VALUES (510,1,'Bougouriba');
INSERT INTO `oc_zone_description` VALUES (80,1,'Bouira');
INSERT INTO `oc_zone_description` VALUES (2261,1,'Boujdour');
INSERT INTO `oc_zone_description` VALUES (2226,1,'Boulemane');
INSERT INTO `oc_zone_description` VALUES (511,1,'Boulgou');
INSERT INTO `oc_zone_description` VALUES (512,1,'Boulkiemde');
INSERT INTO `oc_zone_description` VALUES (81,1,'Boumerdes');
INSERT INTO `oc_zone_description` VALUES (805,1,'Bouna');
INSERT INTO `oc_zone_description` VALUES (806,1,'Boundiali');
INSERT INTO `oc_zone_description` VALUES (726,1,'Boyaca');
INSERT INTO `oc_zone_description` VALUES (345,1,'Brabant Wallon');
INSERT INTO `oc_zone_description` VALUES (2652,1,'Braga');
INSERT INTO `oc_zone_description` VALUES (2653,1,'Bragan&ccedil;a');
INSERT INTO `oc_zone_description` VALUES (2687,1,'Brăila');
INSERT INTO `oc_zone_description` VALUES (2118,1,'Brakna');
INSERT INTO `oc_zone_description` VALUES (1257,1,'Brandenburg');
INSERT INTO `oc_zone_description` VALUES (4005,1,'Braničevo');
INSERT INTO `oc_zone_description` VALUES (2686,1,'Brașov');
INSERT INTO `oc_zone_description` VALUES (2926,1,'Bratislavský');
INSERT INTO `oc_zone_description` VALUES (616,1,'Brava');
INSERT INTO `oc_zone_description` VALUES (757,1,'Brazzaville');
INSERT INTO `oc_zone_description` VALUES (412,1,'Brcko district');
INSERT INTO `oc_zone_description` VALUES (1258,1,'Bremen');
INSERT INTO `oc_zone_description` VALUES (3857,1,'Brescia');
INSERT INTO `oc_zone_description` VALUES (337,1,'Brestskaya (Brest)');
INSERT INTO `oc_zone_description` VALUES (3521,1,'Bridgend');
INSERT INTO `oc_zone_description` VALUES (1231,1,'Brikama');
INSERT INTO `oc_zone_description` VALUES (3858,1,'Brindisi');
INSERT INTO `oc_zone_description` VALUES (3522,1,'Bristol');
INSERT INTO `oc_zone_description` VALUES (603,1,'British Columbia');
INSERT INTO `oc_zone_description` VALUES (4065,1,'Brocēnu novads');
INSERT INTO `oc_zone_description` VALUES (861,1,'Brodsko-posavska');
INSERT INTO `oc_zone_description` VALUES (3060,1,'Brokopondo');
INSERT INTO `oc_zone_description` VALUES (1271,1,'Brong-Ahafo Region');
INSERT INTO `oc_zone_description` VALUES (476,1,'Brunei and Muara');
INSERT INTO `oc_zone_description` VALUES (3970,1,'Brussels-Capital Region');
INSERT INTO `oc_zone_description` VALUES (4288,1,'Bryansk Oblast');
INSERT INTO `oc_zone_description` VALUES (2307,1,'Buada');
INSERT INTO `oc_zone_description` VALUES (551,1,'Bubanza');
INSERT INTO `oc_zone_description` VALUES (3523,1,'Buckinghamshire');
INSERT INTO `oc_zone_description` VALUES (2688,1,'București');
INSERT INTO `oc_zone_description` VALUES (4450,1,'Budapest');
INSERT INTO `oc_zone_description` VALUES (3977,1,'Budva');
INSERT INTO `oc_zone_description` VALUES (156,1,'Buenos Aires');
INSERT INTO `oc_zone_description` VALUES (3437,1,'Bugiri');
INSERT INTO `oc_zone_description` VALUES (552,1,'Bujumbura');
INSERT INTO `oc_zone_description` VALUES (2567,1,'Bukidnon');
INSERT INTO `oc_zone_description` VALUES (2568,1,'Bulacan');
INSERT INTO `oc_zone_description` VALUES (3832,1,'Bulawayo');
INSERT INTO `oc_zone_description` VALUES (2214,1,'Bulgan');
INSERT INTO `oc_zone_description` VALUES (34,1,'Bulqize');
INSERT INTO `oc_zone_description` VALUES (383,1,'Bumthang');
INSERT INTO `oc_zone_description` VALUES (3465,1,'Bundibugyo');
INSERT INTO `oc_zone_description` VALUES (1019,1,'Bur Sa\'id');
INSERT INTO `oc_zone_description` VALUES (3334,1,'Burdur');
INSERT INTO `oc_zone_description` VALUES (480,1,'Burgas');
INSERT INTO `oc_zone_description` VALUES (199,1,'Burgenland');
INSERT INTO `oc_zone_description` VALUES (2980,1,'Burgos');
INSERT INTO `oc_zone_description` VALUES (3193,1,'Buri Ram');
INSERT INTO `oc_zone_description` VALUES (3335,1,'Bursa');
INSERT INTO `oc_zone_description` VALUES (4066,1,'Burtnieku novads');
INSERT INTO `oc_zone_description` VALUES (553,1,'Bururi');
INSERT INTO `oc_zone_description` VALUES (4259,1,'Buryatia, Republic of');
INSERT INTO `oc_zone_description` VALUES (4240,1,'Busan-gwangyeoksi');
INSERT INTO `oc_zone_description` VALUES (1555,1,'Bushehr');
INSERT INTO `oc_zone_description` VALUES (3466,1,'Bushenyi');
INSERT INTO `oc_zone_description` VALUES (3438,1,'Busia');
INSERT INTO `oc_zone_description` VALUES (2431,1,'Buskerud');
INSERT INTO `oc_zone_description` VALUES (2809,1,'Butare');
INSERT INTO `oc_zone_description` VALUES (1747,1,'Butaritari');
INSERT INTO `oc_zone_description` VALUES (1853,1,'Butha-Buthe');
INSERT INTO `oc_zone_description` VALUES (3707,1,'Buxoro');
INSERT INTO `oc_zone_description` VALUES (2689,1,'Buzău');
INSERT INTO `oc_zone_description` VALUES (2810,1,'Byumba');
INSERT INTO `oc_zone_description` VALUES (2981,1,'C&aacute;ceres');
INSERT INTO `oc_zone_description` VALUES (2982,1,'C&aacute;diz');
INSERT INTO `oc_zone_description` VALUES (2987,1,'C&oacute;rdoba');
INSERT INTO `oc_zone_description` VALUES (1135,1,'C&ocirc;te d&#039;or');
INSERT INTO `oc_zone_description` VALUES (1136,1,'C&ocirc;tes d&#039;Armor');
INSERT INTO `oc_zone_description` VALUES (3762,1,'Ca Mau');
INSERT INTO `oc_zone_description` VALUES (981,1,'Ca&ntilde;ar');
INSERT INTO `oc_zone_description` VALUES (2514,1,'Caaguazu');
INSERT INTO `oc_zone_description` VALUES (2515,1,'Caazapa');
INSERT INTO `oc_zone_description` VALUES (1028,1,'Cabanas');
INSERT INTO `oc_zone_description` VALUES (132,1,'Cabinda');
INSERT INTO `oc_zone_description` VALUES (2263,1,'Cabo Delgado');
INSERT INTO `oc_zone_description` VALUES (222,1,'Cabrayil');
INSERT INTO `oc_zone_description` VALUES (1364,1,'Cacheu Region');
INSERT INTO `oc_zone_description` VALUES (3524,1,'Caerphilly');
INSERT INTO `oc_zone_description` VALUES (2569,1,'Cagayan');
INSERT INTO `oc_zone_description` VALUES (3859,1,'Cagliari');
INSERT INTO `oc_zone_description` VALUES (2184,1,'Cahul');
INSERT INTO `oc_zone_description` VALUES (2532,1,'Cajamarca');
INSERT INTO `oc_zone_description` VALUES (2691,1,'Călărași');
INSERT INTO `oc_zone_description` VALUES (727,1,'Caldas');
INSERT INTO `oc_zone_description` VALUES (617,1,'Calheta de Sao Miguel');
INSERT INTO `oc_zone_description` VALUES (3624,1,'California');
INSERT INTO `oc_zone_description` VALUES (223,1,'Calilabab');
INSERT INTO `oc_zone_description` VALUES (2533,1,'Callao');
INSERT INTO `oc_zone_description` VALUES (3860,1,'Caltanissetta');
INSERT INTO `oc_zone_description` VALUES (1127,1,'Calvados');
INSERT INTO `oc_zone_description` VALUES (868,1,'Camaguey');
INSERT INTO `oc_zone_description` VALUES (2570,1,'Camarines Norte');
INSERT INTO `oc_zone_description` VALUES (2571,1,'Camarines Sur');
INSERT INTO `oc_zone_description` VALUES (3525,1,'Cambridgeshire');
INSERT INTO `oc_zone_description` VALUES (2572,1,'Camiguin');
INSERT INTO `oc_zone_description` VALUES (2148,1,'Campeche');
INSERT INTO `oc_zone_description` VALUES (3861,1,'Campobasso');
INSERT INTO `oc_zone_description` VALUES (3763,1,'Can Tho');
INSERT INTO `oc_zone_description` VALUES (3336,1,'Çanakkale');
INSERT INTO `oc_zone_description` VALUES (3688,1,'Canelones');
INSERT INTO `oc_zone_description` VALUES (123,1,'Canillo');
INSERT INTO `oc_zone_description` VALUES (2516,1,'Canindeyu');
INSERT INTO `oc_zone_description` VALUES (3337,1,'Çankırı');
INSERT INTO `oc_zone_description` VALUES (554,1,'Cankuzo');
INSERT INTO `oc_zone_description` VALUES (2983,1,'Cantabria');
INSERT INTO `oc_zone_description` VALUES (1128,1,'Cantal');
INSERT INTO `oc_zone_description` VALUES (2346,1,'Canterbury');
INSERT INTO `oc_zone_description` VALUES (3764,1,'Cao Bang');
INSERT INTO `oc_zone_description` VALUES (1930,1,'Capellen');
INSERT INTO `oc_zone_description` VALUES (315,1,'Capital');
INSERT INTO `oc_zone_description` VALUES (2573,1,'Capiz');
INSERT INTO `oc_zone_description` VALUES (2288,1,'Caprivi');
INSERT INTO `oc_zone_description` VALUES (728,1,'Caqueta');
INSERT INTO `oc_zone_description` VALUES (3732,1,'Carabobo');
INSERT INTO `oc_zone_description` VALUES (2690,1,'Caraș-Severin');
INSERT INTO `oc_zone_description` VALUES (2366,1,'Carazo');
INSERT INTO `oc_zone_description` VALUES (982,1,'Carchi');
INSERT INTO `oc_zone_description` VALUES (3526,1,'Cardiff');
INSERT INTO `oc_zone_description` VALUES (2135,1,'Cargados Carajos Shoals (Saint Brandon Islands)');
INSERT INTO `oc_zone_description` VALUES (1586,1,'Carlow');
INSERT INTO `oc_zone_description` VALUES (3527,1,'Carmarthenshire');
INSERT INTO `oc_zone_description` VALUES (4067,1,'Carnikavas novads');
INSERT INTO `oc_zone_description` VALUES (1302,1,'Carriacou');
INSERT INTO `oc_zone_description` VALUES (783,1,'Cartago');
INSERT INTO `oc_zone_description` VALUES (2227,1,'Casablanca');
INSERT INTO `oc_zone_description` VALUES (729,1,'Casanare');
INSERT INTO `oc_zone_description` VALUES (2908,1,'Cascade');
INSERT INTO `oc_zone_description` VALUES (3863,1,'Caserta');
INSERT INTO `oc_zone_description` VALUES (2984,1,'Castell&oacute;n');
INSERT INTO `oc_zone_description` VALUES (2654,1,'Castelo Branco');
INSERT INTO `oc_zone_description` VALUES (2836,1,'Castries');
INSERT INTO `oc_zone_description` VALUES (288,1,'Cat Island');
INSERT INTO `oc_zone_description` VALUES (157,1,'Catamarca');
INSERT INTO `oc_zone_description` VALUES (2574,1,'Catanduanes');
INSERT INTO `oc_zone_description` VALUES (3864,1,'Catania');
INSERT INTO `oc_zone_description` VALUES (3865,1,'Catanzaro');
INSERT INTO `oc_zone_description` VALUES (1936,1,'Cathedral Parish');
INSERT INTO `oc_zone_description` VALUES (730,1,'Cauca');
INSERT INTO `oc_zone_description` VALUES (1587,1,'Cavan');
INSERT INTO `oc_zone_description` VALUES (2575,1,'Cavite');
INSERT INTO `oc_zone_description` VALUES (355,1,'Cayo');
INSERT INTO `oc_zone_description` VALUES (445,1,'Ceará');
INSERT INTO `oc_zone_description` VALUES (2576,1,'Cebu');
INSERT INTO `oc_zone_description` VALUES (316,1,'Central');
INSERT INTO `oc_zone_description` VALUES (430,1,'Central');
INSERT INTO `oc_zone_description` VALUES (1733,1,'Central');
INSERT INTO `oc_zone_description` VALUES (2490,1,'Central');
INSERT INTO `oc_zone_description` VALUES (2517,1,'Central');
INSERT INTO `oc_zone_description` VALUES (2933,1,'Central');
INSERT INTO `oc_zone_description` VALUES (3022,1,'Central');
INSERT INTO `oc_zone_description` VALUES (3823,1,'Central');
INSERT INTO `oc_zone_description` VALUES (1048,1,'Central (Maekel)');
INSERT INTO `oc_zone_description` VALUES (289,1,'Central Abaco');
INSERT INTO `oc_zone_description` VALUES (1410,1,'Central and Western Hong Kong Island');
INSERT INTO `oc_zone_description` VALUES (290,1,'Central Andros');
INSERT INTO `oc_zone_description` VALUES (3996,1,'Central Banat');
INSERT INTO `oc_zone_description` VALUES (1080,1,'Central Division');
INSERT INTO `oc_zone_description` VALUES (291,1,'Central Eleuthera');
INSERT INTO `oc_zone_description` VALUES (4023,1,'Central Equatoria');
INSERT INTO `oc_zone_description` VALUES (1281,1,'Central Greece');
INSERT INTO `oc_zone_description` VALUES (1282,1,'Central Macedonia');
INSERT INTO `oc_zone_description` VALUES (1272,1,'Central Region');
INSERT INTO `oc_zone_description` VALUES (1238,1,'Central River');
INSERT INTO `oc_zone_description` VALUES (3268,1,'Centrale');
INSERT INTO `oc_zone_description` VALUES (593,1,'Centre');
INSERT INTO `oc_zone_description` VALUES (1380,1,'Centre');
INSERT INTO `oc_zone_description` VALUES (3528,1,'Ceredigion');
INSERT INTO `oc_zone_description` VALUES (3689,1,'Cerro Largo');
INSERT INTO `oc_zone_description` VALUES (731,1,'Cesar');
INSERT INTO `oc_zone_description` VALUES (4071,1,'Cēsu novads');
INSERT INTO `oc_zone_description` VALUES (4069,1,'Cesvaines novads');
INSERT INTO `oc_zone_description` VALUES (3978,1,'Cetinje');
INSERT INTO `oc_zone_description` VALUES (2985,1,'Ceuta');
INSERT INTO `oc_zone_description` VALUES (3194,1,'Chachoengsao');
INSERT INTO `oc_zone_description` VALUES (158,1,'Chaco');
INSERT INTO `oc_zone_description` VALUES (1762,1,'Chagang-do');
INSERT INTO `oc_zone_description` VALUES (3289,1,'Chaguanas');
INSERT INTO `oc_zone_description` VALUES (1553,1,'Chahar Mahaal and Bakhtiari');
INSERT INTO `oc_zone_description` VALUES (3195,1,'Chai Nat');
INSERT INTO `oc_zone_description` VALUES (3196,1,'Chaiyaphum');
INSERT INTO `oc_zone_description` VALUES (1029,1,'Chalatenango');
INSERT INTO `oc_zone_description` VALUES (1805,1,'Champasak');
INSERT INTO `oc_zone_description` VALUES (1480,1,'Chandigarh');
INSERT INTO `oc_zone_description` VALUES (3135,1,'Chang-hua');
INSERT INTO `oc_zone_description` VALUES (3197,1,'Chanthaburi');
INSERT INTO `oc_zone_description` VALUES (2228,1,'Chaouen');
INSERT INTO `oc_zone_description` VALUES (1129,1,'Charente');
INSERT INTO `oc_zone_description` VALUES (1130,1,'Charente Maritime');
INSERT INTO `oc_zone_description` VALUES (660,1,'Chari-Baguirmi');
INSERT INTO `oc_zone_description` VALUES (2846,1,'Charlotte');
INSERT INTO `oc_zone_description` VALUES (4276,1,'Chechen Republic');
INSERT INTO `oc_zone_description` VALUES (4330,1,'Chelyabinsk Oblast');
INSERT INTO `oc_zone_description` VALUES (1131,1,'Cher');
INSERT INTO `oc_zone_description` VALUES (3480,1,'Cherkaska');
INSERT INTO `oc_zone_description` VALUES (3481,1,'Chernihivska');
INSERT INTO `oc_zone_description` VALUES (3482,1,'Chernivetska');
INSERT INTO `oc_zone_description` VALUES (3529,1,'Cheshire');
INSERT INTO `oc_zone_description` VALUES (4341,1,'Chhattisgarh');
INSERT INTO `oc_zone_description` VALUES (3154,1,'Chi-lung');
INSERT INTO `oc_zone_description` VALUES (3136,1,'Chia-i');
INSERT INTO `oc_zone_description` VALUES (3153,1,'Chia-i city');
INSERT INTO `oc_zone_description` VALUES (3198,1,'Chiang Mai');
INSERT INTO `oc_zone_description` VALUES (3199,1,'Chiang Rai');
INSERT INTO `oc_zone_description` VALUES (2149,1,'Chiapas');
INSERT INTO `oc_zone_description` VALUES (1660,1,'Chiba');
INSERT INTO `oc_zone_description` VALUES (2865,1,'Chiesanuova');
INSERT INTO `oc_zone_description` VALUES (3866,1,'Chieti');
INSERT INTO `oc_zone_description` VALUES (2150,1,'Chihuahua');
INSERT INTO `oc_zone_description` VALUES (1946,1,'Chikwawa');
INSERT INTO `oc_zone_description` VALUES (1306,1,'Chimaltenango');
INSERT INTO `oc_zone_description` VALUES (983,1,'Chimborazo');
INSERT INTO `oc_zone_description` VALUES (2491,1,'Chimbu');
INSERT INTO `oc_zone_description` VALUES (2281,1,'Chin State');
INSERT INTO `oc_zone_description` VALUES (2367,1,'Chinandega');
INSERT INTO `oc_zone_description` VALUES (1307,1,'Chiquimula');
INSERT INTO `oc_zone_description` VALUES (1947,1,'Chiradzulu');
INSERT INTO `oc_zone_description` VALUES (2480,1,'Chiriqui');
INSERT INTO `oc_zone_description` VALUES (2182,1,'Chisinau');
INSERT INTO `oc_zone_description` VALUES (1948,1,'Chitipa');
INSERT INTO `oc_zone_description` VALUES (321,1,'Chittagong');
INSERT INTO `oc_zone_description` VALUES (82,1,'Chlef');
INSERT INTO `oc_zone_description` VALUES (732,1,'Choco');
INSERT INTO `oc_zone_description` VALUES (2837,1,'Choiseul');
INSERT INTO `oc_zone_description` VALUES (2934,1,'Choiseul');
INSERT INTO `oc_zone_description` VALUES (1393,1,'Choluteca');
INSERT INTO `oc_zone_description` VALUES (3200,1,'Chon Buri');
INSERT INTO `oc_zone_description` VALUES (686,1,'Chongqing');
INSERT INTO `oc_zone_description` VALUES (2368,1,'Chontales');
INSERT INTO `oc_zone_description` VALUES (326,1,'Christ Church');
INSERT INTO `oc_zone_description` VALUES (2821,1,'Christ Church Nichola Town');
INSERT INTO `oc_zone_description` VALUES (1795,1,'Chu');
INSERT INTO `oc_zone_description` VALUES (159,1,'Chubut');
INSERT INTO `oc_zone_description` VALUES (384,1,'Chukha');
INSERT INTO `oc_zone_description` VALUES (4338,1,'Chukotka Autonomous Okrug');
INSERT INTO `oc_zone_description` VALUES (3201,1,'Chumphon');
INSERT INTO `oc_zone_description` VALUES (4246,1,'Chungcheongbuk-do');
INSERT INTO `oc_zone_description` VALUES (4247,1,'Chungcheongnam-do');
INSERT INTO `oc_zone_description` VALUES (404,1,'Chuquisaca');
INSERT INTO `oc_zone_description` VALUES (2177,1,'Chuuk');
INSERT INTO `oc_zone_description` VALUES (4277,1,'Chuvash Republic');
INSERT INTO `oc_zone_description` VALUES (555,1,'Cibitoke');
INSERT INTO `oc_zone_description` VALUES (4072,1,'Ciblas novads');
INSERT INTO `oc_zone_description` VALUES (869,1,'Ciego de Avila');
INSERT INTO `oc_zone_description` VALUES (870,1,'Cienfuegos');
INSERT INTO `oc_zone_description` VALUES (2870,1,'Citta di San Marino');
INSERT INTO `oc_zone_description` VALUES (292,1,'City of Freeport');
INSERT INTO `oc_zone_description` VALUES (162,1,'Ciudad Autónoma de Buenos Aires');
INSERT INTO `oc_zone_description` VALUES (871,1,'Ciudad de La Habana');
INSERT INTO `oc_zone_description` VALUES (2986,1,'Ciudad Real');
INSERT INTO `oc_zone_description` VALUES (3530,1,'Clackmannanshire');
INSERT INTO `oc_zone_description` VALUES (1588,1,'Clare');
INSERT INTO `oc_zone_description` VALUES (1643,1,'Clarendon Parish');
INSERT INTO `oc_zone_description` VALUES (1922,1,'Clervaux');
INSERT INTO `oc_zone_description` VALUES (2692,1,'Cluj');
INSERT INTO `oc_zone_description` VALUES (2151,1,'Coahuila de Zaragoza');
INSERT INTO `oc_zone_description` VALUES (1734,1,'Coast');
INSERT INTO `oc_zone_description` VALUES (405,1,'Cochabamba');
INSERT INTO `oc_zone_description` VALUES (2481,1,'Cocle');
INSERT INTO `oc_zone_description` VALUES (2655,1,'Coimbra');
INSERT INTO `oc_zone_description` VALUES (3733,1,'Cojedes');
INSERT INTO `oc_zone_description` VALUES (2152,1,'Colima');
INSERT INTO `oc_zone_description` VALUES (364,1,'Collines');
INSERT INTO `oc_zone_description` VALUES (1394,1,'Colon');
INSERT INTO `oc_zone_description` VALUES (2482,1,'Colon');
INSERT INTO `oc_zone_description` VALUES (3690,1,'Colonia');
INSERT INTO `oc_zone_description` VALUES (3625,1,'Colorado');
INSERT INTO `oc_zone_description` VALUES (1395,1,'Comayagua');
INSERT INTO `oc_zone_description` VALUES (3061,1,'Commewijne');
INSERT INTO `oc_zone_description` VALUES (3867,1,'Como');
INSERT INTO `oc_zone_description` VALUES (4440,1,'Como, Campione d’Italia and terretory Lake Lugano');
INSERT INTO `oc_zone_description` VALUES (513,1,'Comoe');
INSERT INTO `oc_zone_description` VALUES (2577,1,'Compostela');
INSERT INTO `oc_zone_description` VALUES (1326,1,'Conakry');
INSERT INTO `oc_zone_description` VALUES (2518,1,'Concepcion');
INSERT INTO `oc_zone_description` VALUES (3626,1,'Connecticut');
INSERT INTO `oc_zone_description` VALUES (2693,1,'Constanța');
INSERT INTO `oc_zone_description` VALUES (83,1,'Constantine');
INSERT INTO `oc_zone_description` VALUES (3531,1,'Conwy');
INSERT INTO `oc_zone_description` VALUES (1396,1,'Copan');
INSERT INTO `oc_zone_description` VALUES (3824,1,'Copperbelt');
INSERT INTO `oc_zone_description` VALUES (676,1,'Coquimbo');
INSERT INTO `oc_zone_description` VALUES (2519,1,'Cordillera');
INSERT INTO `oc_zone_description` VALUES (160,1,'Cordoba');
INSERT INTO `oc_zone_description` VALUES (733,1,'Cordoba');
INSERT INTO `oc_zone_description` VALUES (1589,1,'Cork');
INSERT INTO `oc_zone_description` VALUES (3532,1,'Cornwall');
INSERT INTO `oc_zone_description` VALUES (2347,1,'Coromandel');
INSERT INTO `oc_zone_description` VALUES (3062,1,'Coronie');
INSERT INTO `oc_zone_description` VALUES (356,1,'Corozal');
INSERT INTO `oc_zone_description` VALUES (1132,1,'Corr&egrave;ze');
INSERT INTO `oc_zone_description` VALUES (161,1,'Corrientes');
INSERT INTO `oc_zone_description` VALUES (1133,1,'Corse du Sud');
INSERT INTO `oc_zone_description` VALUES (1397,1,'Cortes');
INSERT INTO `oc_zone_description` VALUES (3338,1,'Çorum');
INSERT INTO `oc_zone_description` VALUES (3868,1,'Cosenza');
INSERT INTO `oc_zone_description` VALUES (984,1,'Cotopaxi');
INSERT INTO `oc_zone_description` VALUES (3949,1,'County Antrim');
INSERT INTO `oc_zone_description` VALUES (3950,1,'County Armagh');
INSERT INTO `oc_zone_description` VALUES (3951,1,'County Down');
INSERT INTO `oc_zone_description` VALUES (3952,1,'County Fermanagh');
INSERT INTO `oc_zone_description` VALUES (3953,1,'County Londonderry');
INSERT INTO `oc_zone_description` VALUES (3954,1,'County Tyrone');
INSERT INTO `oc_zone_description` VALUES (3276,1,'Couva/Tabaquite/Talparo');
INSERT INTO `oc_zone_description` VALUES (970,1,'Cova Lima');
INSERT INTO `oc_zone_description` VALUES (2694,1,'Covasna');
INSERT INTO `oc_zone_description` VALUES (1330,1,'Coyah');
INSERT INTO `oc_zone_description` VALUES (632,1,'Creek');
INSERT INTO `oc_zone_description` VALUES (3869,1,'Cremona');
INSERT INTO `oc_zone_description` VALUES (1283,1,'Crete');
INSERT INTO `oc_zone_description` VALUES (1137,1,'Creuse');
INSERT INTO `oc_zone_description` VALUES (293,1,'Crooked Island');
INSERT INTO `oc_zone_description` VALUES (2397,1,'Cross River');
INSERT INTO `oc_zone_description` VALUES (3870,1,'Crotone');
INSERT INTO `oc_zone_description` VALUES (4451,1,'Csongrád-Csanád');
INSERT INTO `oc_zone_description` VALUES (133,1,'Cuando-Cubango');
INSERT INTO `oc_zone_description` VALUES (134,1,'Cuanza Norte');
INSERT INTO `oc_zone_description` VALUES (135,1,'Cuanza Sul');
INSERT INTO `oc_zone_description` VALUES (2988,1,'Cuenca');
INSERT INTO `oc_zone_description` VALUES (2153,1,'Cuidad de Mexico');
INSERT INTO `oc_zone_description` VALUES (224,1,'Culfa');
INSERT INTO `oc_zone_description` VALUES (3955,1,'Cumbria');
INSERT INTO `oc_zone_description` VALUES (734,1,'Cundinamarca');
INSERT INTO `oc_zone_description` VALUES (136,1,'Cunene');
INSERT INTO `oc_zone_description` VALUES (3871,1,'Cuneo');
INSERT INTO `oc_zone_description` VALUES (2130,1,'Curepipe');
INSERT INTO `oc_zone_description` VALUES (1030,1,'Cuscatlan');
INSERT INTO `oc_zone_description` VALUES (2534,1,'Cusco');
INSERT INTO `oc_zone_description` VALUES (758,1,'Cuvette');
INSERT INTO `oc_zone_description` VALUES (759,1,'Cuvette-Ouest');
INSERT INTO `oc_zone_description` VALUES (1370,1,'Cuyuni-Mazaruni');
INSERT INTO `oc_zone_description` VALUES (2811,1,'Cyangugu');
INSERT INTO `oc_zone_description` VALUES (3767,1,'Da Nang');
INSERT INTO `oc_zone_description` VALUES (807,1,'Dabakala');
INSERT INTO `oc_zone_description` VALUES (1331,1,'Dabola');
INSERT INTO `oc_zone_description` VALUES (808,1,'Dabou');
INSERT INTO `oc_zone_description` VALUES (1481,1,'Dadra and Nagar Haveli and Davan and Diu');
INSERT INTO `oc_zone_description` VALUES (4241,1,'Daegu-gwangyeoksi');
INSERT INTO `oc_zone_description` VALUES (4242,1,'Daejeon-gwangyeoksi');
INSERT INTO `oc_zone_description` VALUES (385,1,'Dagana');
INSERT INTO `oc_zone_description` VALUES (4074,1,'Dagdas novads');
INSERT INTO `oc_zone_description` VALUES (4261,1,'Dagestan, Republic of');
INSERT INTO `oc_zone_description` VALUES (1582,1,'Dahuk');
INSERT INTO `oc_zone_description` VALUES (938,1,'Dajabon');
INSERT INTO `oc_zone_description` VALUES (3765,1,'Dak Lak');
INSERT INTO `oc_zone_description` VALUES (3766,1,'Dak Nong');
INSERT INTO `oc_zone_description` VALUES (2887,1,'Dakar');
INSERT INTO `oc_zone_description` VALUES (2119,1,'Dakhlet Nouadhibou');
INSERT INTO `oc_zone_description` VALUES (1332,1,'Dalaba');
INSERT INTO `oc_zone_description` VALUES (3075,1,'Dalarna');
INSERT INTO `oc_zone_description` VALUES (809,1,'Daloa');
INSERT INTO `oc_zone_description` VALUES (2695,1,'Dâmbovița');
INSERT INTO `oc_zone_description` VALUES (810,1,'Danane');
INSERT INTO `oc_zone_description` VALUES (472,1,'Danger Island');
INSERT INTO `oc_zone_description` VALUES (3979,1,'Danilovgrad');
INSERT INTO `oc_zone_description` VALUES (811,1,'Daoukro');
INSERT INTO `oc_zone_description` VALUES (3164,1,'Dar es Salaam');
INSERT INTO `oc_zone_description` VALUES (3126,1,'Dara');
INSERT INTO `oc_zone_description` VALUES (2198,1,'Darhan uul');
INSERT INTO `oc_zone_description` VALUES (2483,1,'Darien');
INSERT INTO `oc_zone_description` VALUES (1887,1,'Darnah');
INSERT INTO `oc_zone_description` VALUES (3398,1,'Dashhowuz Welayaty');
INSERT INTO `oc_zone_description` VALUES (225,1,'Daskasan');
INSERT INTO `oc_zone_description` VALUES (4075,1,'Daugavpils');
INSERT INTO `oc_zone_description` VALUES (4076,1,'Daugavpils novads');
INSERT INTO `oc_zone_description` VALUES (2838,1,'Dauphin');
INSERT INTO `oc_zone_description` VALUES (226,1,'Davaci');
INSERT INTO `oc_zone_description` VALUES (2578,1,'Davao del Norte');
INSERT INTO `oc_zone_description` VALUES (2579,1,'Davao del Sur');
INSERT INTO `oc_zone_description` VALUES (2580,1,'Davao Oriental');
INSERT INTO `oc_zone_description` VALUES (3127,1,'Dayr az Zawr');
INSERT INTO `oc_zone_description` VALUES (1949,1,'Dedza');
INSERT INTO `oc_zone_description` VALUES (3627,1,'Delaware');
INSERT INTO `oc_zone_description` VALUES (1483,1,'Delhi');
INSERT INTO `oc_zone_description` VALUES (3402,1,'Dellis Cay');
INSERT INTO `oc_zone_description` VALUES (2398,1,'Delta');
INSERT INTO `oc_zone_description` VALUES (3734,1,'Delta Amacuro');
INSERT INTO `oc_zone_description` VALUES (35,1,'Delvine');
INSERT INTO `oc_zone_description` VALUES (1371,1,'Demerara-Mahaica');
INSERT INTO `oc_zone_description` VALUES (3533,1,'Denbighshire');
INSERT INTO `oc_zone_description` VALUES (2308,1,'Denigomodu');
INSERT INTO `oc_zone_description` VALUES (3339,1,'Denizli');
INSERT INTO `oc_zone_description` VALUES (2839,1,'Dennery');
INSERT INTO `oc_zone_description` VALUES (3735,1,'Dependencias Federales');
INSERT INTO `oc_zone_description` VALUES (3534,1,'Derbyshire');
INSERT INTO `oc_zone_description` VALUES (1193,1,'Deux S&egrave;vres');
INSERT INTO `oc_zone_description` VALUES (36,1,'Devoll');
INSERT INTO `oc_zone_description` VALUES (3535,1,'Devon');
INSERT INTO `oc_zone_description` VALUES (372,1,'Devonshire');
INSERT INTO `oc_zone_description` VALUES (322,1,'Dhaka');
INSERT INTO `oc_zone_description` VALUES (3794,1,'Dhamar');
INSERT INTO `oc_zone_description` VALUES (2317,1,'Dhawalagiri');
INSERT INTO `oc_zone_description` VALUES (1574,1,'Dhi Qar');
INSERT INTO `oc_zone_description` VALUES (37,1,'Diber');
INSERT INTO `oc_zone_description` VALUES (474,1,'Diego Garcia');
INSERT INTO `oc_zone_description` VALUES (3277,1,'Diego Martin');
INSERT INTO `oc_zone_description` VALUES (1921,1,'Diekirch');
INSERT INTO `oc_zone_description` VALUES (3768,1,'Dien Bien');
INSERT INTO `oc_zone_description` VALUES (2381,1,'Diffa');
INSERT INTO `oc_zone_description` VALUES (920,1,'Dikhil');
INSERT INTO `oc_zone_description` VALUES (971,1,'Dili');
INSERT INTO `oc_zone_description` VALUES (3128,1,'Dimashq');
INSERT INTO `oc_zone_description` VALUES (812,1,'Dimbokro');
INSERT INTO `oc_zone_description` VALUES (2021,1,'Dingli');
INSERT INTO `oc_zone_description` VALUES (1333,1,'Dinguiraye');
INSERT INTO `oc_zone_description` VALUES (2888,1,'Diourbel');
INSERT INTO `oc_zone_description` VALUES (1079,1,'Dire Dawa');
INSERT INTO `oc_zone_description` VALUES (715,1,'Direction Island');
INSERT INTO `oc_zone_description` VALUES (3628,1,'District of Columbia');
INSERT INTO `oc_zone_description` VALUES (3736,1,'Distrito Capital');
INSERT INTO `oc_zone_description` VALUES (446,1,'Distrito Federal');
INSERT INTO `oc_zone_description` VALUES (934,1,'Distrito Nacional');
INSERT INTO `oc_zone_description` VALUES (813,1,'Divo');
INSERT INTO `oc_zone_description` VALUES (1570,1,'Diyala');
INSERT INTO `oc_zone_description` VALUES (3340,1,'Diyarbakır');
INSERT INTO `oc_zone_description` VALUES (84,1,'Djelfa');
INSERT INTO `oc_zone_description` VALUES (921,1,'Djibouti');
INSERT INTO `oc_zone_description` VALUES (3484,1,'Dnipropetrovska');
INSERT INTO `oc_zone_description` VALUES (4078,1,'Dobeles novads');
INSERT INTO `oc_zone_description` VALUES (424,1,'Doboj');
INSERT INTO `oc_zone_description` VALUES (481,1,'Dobrich');
INSERT INTO `oc_zone_description` VALUES (3165,1,'Dodoma');
INSERT INTO `oc_zone_description` VALUES (2696,1,'Dolj');
INSERT INTO `oc_zone_description` VALUES (2631,1,'Dolnoslaskie');
INSERT INTO `oc_zone_description` VALUES (2866,1,'Domagnano');
INSERT INTO `oc_zone_description` VALUES (1590,1,'Donegal');
INSERT INTO `oc_zone_description` VALUES (3485,1,'Donetska');
INSERT INTO `oc_zone_description` VALUES (3769,1,'Dong Nai');
INSERT INTO `oc_zone_description` VALUES (3770,1,'Dong Thap');
INSERT INTO `oc_zone_description` VALUES (365,1,'Donga');
INSERT INTO `oc_zone_description` VALUES (1138,1,'Dordogne');
INSERT INTO `oc_zone_description` VALUES (2210,1,'Dornod');
INSERT INTO `oc_zone_description` VALUES (2211,1,'Dornogov');
INSERT INTO `oc_zone_description` VALUES (3536,1,'Dorset');
INSERT INTO `oc_zone_description` VALUES (2382,1,'Dosso');
INSERT INTO `oc_zone_description` VALUES (1139,1,'Doubs');
INSERT INTO `oc_zone_description` VALUES (1950,1,'Dowa');
INSERT INTO `oc_zone_description` VALUES (1140,1,'Dr&ocirc;me');
INSERT INTO `oc_zone_description` VALUES (2329,1,'Drenthe');
INSERT INTO `oc_zone_description` VALUES (939,1,'Duarte');
INSERT INTO `oc_zone_description` VALUES (3510,1,'Dubai');
INSERT INTO `oc_zone_description` VALUES (1591,1,'Dublin');
INSERT INTO `oc_zone_description` VALUES (1334,1,'Dubreka');
INSERT INTO `oc_zone_description` VALUES (849,1,'Dubrovačko-neretvanska');
INSERT INTO `oc_zone_description` VALUES (814,1,'Duekoue');
INSERT INTO `oc_zone_description` VALUES (3537,1,'Dumfries and Galloway');
INSERT INTO `oc_zone_description` VALUES (1020,1,'Dumyat');
INSERT INTO `oc_zone_description` VALUES (4079,1,'Dundagas novads');
INSERT INTO `oc_zone_description` VALUES (3538,1,'Dundee');
INSERT INTO `oc_zone_description` VALUES (2209,1,'DundgovL');
INSERT INTO `oc_zone_description` VALUES (2154,1,'Durango');
INSERT INTO `oc_zone_description` VALUES (3691,1,'Durazno');
INSERT INTO `oc_zone_description` VALUES (4081,1,'Durbes novads');
INSERT INTO `oc_zone_description` VALUES (3539,1,'Durham');
INSERT INTO `oc_zone_description` VALUES (38,1,'Durres');
INSERT INTO `oc_zone_description` VALUES (3341,1,'Düzce');
INSERT INTO `oc_zone_description` VALUES (2208,1,'Dzavhan');
INSERT INTO `oc_zone_description` VALUES (471,1,'Eagle Islands');
INSERT INTO `oc_zone_description` VALUES (594,1,'East (Est)');
INSERT INTO `oc_zone_description` VALUES (3540,1,'East Ayrshire');
INSERT INTO `oc_zone_description` VALUES (1545,1,'East Azarbaijan');
INSERT INTO `oc_zone_description` VALUES (1372,1,'East Berbice-Corentyne');
INSERT INTO `oc_zone_description` VALUES (3410,1,'East Caicos');
INSERT INTO `oc_zone_description` VALUES (3541,1,'East Dunbartonshire');
INSERT INTO `oc_zone_description` VALUES (294,1,'East Grand Bahama');
INSERT INTO `oc_zone_description` VALUES (3542,1,'East Lothian');
INSERT INTO `oc_zone_description` VALUES (1284,1,'East Macedonia and Thrace');
INSERT INTO `oc_zone_description` VALUES (2493,1,'East New Britain');
INSERT INTO `oc_zone_description` VALUES (3543,1,'East Renfrewshire');
INSERT INTO `oc_zone_description` VALUES (3544,1,'East Riding of Yorkshire');
INSERT INTO `oc_zone_description` VALUES (2494,1,'East Sepik');
INSERT INTO `oc_zone_description` VALUES (3545,1,'East Sussex');
INSERT INTO `oc_zone_description` VALUES (117,1,'Eastern');
INSERT INTO `oc_zone_description` VALUES (633,1,'Eastern');
INSERT INTO `oc_zone_description` VALUES (1735,1,'Eastern');
INSERT INTO `oc_zone_description` VALUES (2921,1,'Eastern');
INSERT INTO `oc_zone_description` VALUES (3023,1,'Eastern');
INSERT INTO `oc_zone_description` VALUES (3825,1,'Eastern');
INSERT INTO `oc_zone_description` VALUES (2961,1,'Eastern Cape');
INSERT INTO `oc_zone_description` VALUES (1082,1,'Eastern Division');
INSERT INTO `oc_zone_description` VALUES (4024,1,'Eastern Equatoria');
INSERT INTO `oc_zone_description` VALUES (2492,1,'Eastern Highlands');
INSERT INTO `oc_zone_description` VALUES (1411,1,'Eastern Hong Kong Island');
INSERT INTO `oc_zone_description` VALUES (1273,1,'Eastern Region');
INSERT INTO `oc_zone_description` VALUES (2581,1,'Eastern Samar');
INSERT INTO `oc_zone_description` VALUES (2091,1,'Ebon');
INSERT INTO `oc_zone_description` VALUES (2399,1,'Ebonyi');
INSERT INTO `oc_zone_description` VALUES (1927,1,'Echternach');
INSERT INTO `oc_zone_description` VALUES (3546,1,'Edinburgh');
INSERT INTO `oc_zone_description` VALUES (2185,1,'Edinet');
INSERT INTO `oc_zone_description` VALUES (3342,1,'Edirne');
INSERT INTO `oc_zone_description` VALUES (2400,1,'Edo');
INSERT INTO `oc_zone_description` VALUES (473,1,'Egmont Islands');
INSERT INTO `oc_zone_description` VALUES (1661,1,'Ehime');
INSERT INTO `oc_zone_description` VALUES (1614,1,'Eilat and Arava');
INSERT INTO `oc_zone_description` VALUES (2401,1,'Ekiti');
INSERT INTO `oc_zone_description` VALUES (85,1,'El Bayadh');
INSERT INTO `oc_zone_description` VALUES (2229,1,'El Jadida');
INSERT INTO `oc_zone_description` VALUES (2230,1,'El Kelaa des Sraghna');
INSERT INTO `oc_zone_description` VALUES (985,1,'El Oro');
INSERT INTO `oc_zone_description` VALUES (86,1,'El Oued');
INSERT INTO `oc_zone_description` VALUES (1398,1,'El Paraiso');
INSERT INTO `oc_zone_description` VALUES (1308,1,'El Peten');
INSERT INTO `oc_zone_description` VALUES (1309,1,'El Progreso');
INSERT INTO `oc_zone_description` VALUES (1310,1,'El Quiche');
INSERT INTO `oc_zone_description` VALUES (941,1,'El Seybo');
INSERT INTO `oc_zone_description` VALUES (87,1,'El Tarf');
INSERT INTO `oc_zone_description` VALUES (3343,1,'Elazığ');
INSERT INTO `oc_zone_description` VALUES (39,1,'Elbasan');
INSERT INTO `oc_zone_description` VALUES (940,1,'Elias Pina');
INSERT INTO `oc_zone_description` VALUES (124,1,'Encamp');
INSERT INTO `oc_zone_description` VALUES (2092,1,'Enewetak');
INSERT INTO `oc_zone_description` VALUES (2495,1,'Enga');
INSERT INTO `oc_zone_description` VALUES (4082,1,'Engures novads');
INSERT INTO `oc_zone_description` VALUES (3872,1,'Enna');
INSERT INTO `oc_zone_description` VALUES (163,1,'Entre Rios');
INSERT INTO `oc_zone_description` VALUES (2402,1,'Enugu');
INSERT INTO `oc_zone_description` VALUES (1285,1,'Epirus');
INSERT INTO `oc_zone_description` VALUES (3814,1,'Equateur');
INSERT INTO `oc_zone_description` VALUES (2231,1,'Er Rachidia');
INSERT INTO `oc_zone_description` VALUES (4083,1,'Ērgļu novads');
INSERT INTO `oc_zone_description` VALUES (2093,1,'Erikub');
INSERT INTO `oc_zone_description` VALUES (972,1,'Ermera');
INSERT INTO `oc_zone_description` VALUES (2289,1,'Erongo');
INSERT INTO `oc_zone_description` VALUES (3344,1,'Erzincan');
INSERT INTO `oc_zone_description` VALUES (3345,1,'Erzurum');
INSERT INTO `oc_zone_description` VALUES (2262,1,'Es Smara');
INSERT INTO `oc_zone_description` VALUES (125,1,'Escaldes-Engordany');
INSERT INTO `oc_zone_description` VALUES (1931,1,'Esch-sur-Alzette');
INSERT INTO `oc_zone_description` VALUES (1904,1,'Eschen');
INSERT INTO `oc_zone_description` VALUES (1311,1,'Escuintla');
INSERT INTO `oc_zone_description` VALUES (1561,1,'Esfahan');
INSERT INTO `oc_zone_description` VALUES (3346,1,'Eskişehir');
INSERT INTO `oc_zone_description` VALUES (986,1,'Esmeraldas');
INSERT INTO `oc_zone_description` VALUES (942,1,'Espaillat');
INSERT INTO `oc_zone_description` VALUES (447,1,'Espírito Santo');
INSERT INTO `oc_zone_description` VALUES (2232,1,'Essaouira');
INSERT INTO `oc_zone_description` VALUES (1373,1,'Essequibo Islands-West Demerara');
INSERT INTO `oc_zone_description` VALUES (3547,1,'Essex');
INSERT INTO `oc_zone_description` VALUES (1205,1,'Essonne');
INSERT INTO `oc_zone_description` VALUES (2369,1,'Esteli');
INSERT INTO `oc_zone_description` VALUES (1220,1,'Estuaire');
INSERT INTO `oc_zone_description` VALUES (1086,1,'Etelä-Suomen lääni');
INSERT INTO `oc_zone_description` VALUES (1141,1,'Eure');
INSERT INTO `oc_zone_description` VALUES (1142,1,'Eure et Loir');
INSERT INTO `oc_zone_description` VALUES (2309,1,'Ewa');
INSERT INTO `oc_zone_description` VALUES (595,1,'Extreme North (Extreme-Nord)');
INSERT INTO `oc_zone_description` VALUES (295,1,'Exuma');
INSERT INTO `oc_zone_description` VALUES (2855,1,'Fa\'asaleleaga');
INSERT INTO `oc_zone_description` VALUES (1992,1,'Faadhippolhu');
INSERT INTO `oc_zone_description` VALUES (2867,1,'Faetano');
INSERT INTO `oc_zone_description` VALUES (3271,1,'Fakaofo');
INSERT INTO `oc_zone_description` VALUES (3737,1,'Falcon');
INSERT INTO `oc_zone_description` VALUES (3548,1,'Falkirk');
INSERT INTO `oc_zone_description` VALUES (883,1,'Famagusta');
INSERT INTO `oc_zone_description` VALUES (6,1,'Farah');
INSERT INTO `oc_zone_description` VALUES (1335,1,'Faranah');
INSERT INTO `oc_zone_description` VALUES (3708,1,'Farg\'ona');
INSERT INTO `oc_zone_description` VALUES (2657,1,'Faro');
INSERT INTO `oc_zone_description` VALUES (906,1,'Faroe Islands');
INSERT INTO `oc_zone_description` VALUES (1556,1,'Fars');
INSERT INTO `oc_zone_description` VALUES (7,1,'Faryab');
INSERT INTO `oc_zone_description` VALUES (2889,1,'Fatick');
INSERT INTO `oc_zone_description` VALUES (2458,1,'Federally Administered Tribal Areas');
INSERT INTO `oc_zone_description` VALUES (3629,1,'Federated States Of Micronesia');
INSERT INTO `oc_zone_description` VALUES (4452,1,'Fejér');
INSERT INTO `oc_zone_description` VALUES (1996,1,'Felidhe Atoll');
INSERT INTO `oc_zone_description` VALUES (815,1,'Ferkessedougou');
INSERT INTO `oc_zone_description` VALUES (4237,1,'Fermo');
INSERT INTO `oc_zone_description` VALUES (3873,1,'Ferrara');
INSERT INTO `oc_zone_description` VALUES (2233,1,'Fes');
INSERT INTO `oc_zone_description` VALUES (2022,1,'Fgura');
INSERT INTO `oc_zone_description` VALUES (1940,1,'Fianarantsoa');
INSERT INTO `oc_zone_description` VALUES (41,1,'Fier');
INSERT INTO `oc_zone_description` VALUES (3549,1,'Fife');
INSERT INTO `oc_zone_description` VALUES (2234,1,'Figuig');
INSERT INTO `oc_zone_description` VALUES (1143,1,'Finist&egrave;re');
INSERT INTO `oc_zone_description` VALUES (2432,1,'Finnmark');
INSERT INTO `oc_zone_description` VALUES (2349,1,'Fiordland');
INSERT INTO `oc_zone_description` VALUES (2868,1,'Fiorentino');
INSERT INTO `oc_zone_description` VALUES (3874,1,'Firenze');
INSERT INTO `oc_zone_description` VALUES (2138,1,'Flacq');
INSERT INTO `oc_zone_description` VALUES (1388,1,'Flat Island');
INSERT INTO `oc_zone_description` VALUES (2330,1,'Flevoland');
INSERT INTO `oc_zone_description` VALUES (3550,1,'Flintshire');
INSERT INTO `oc_zone_description` VALUES (3692,1,'Flores');
INSERT INTO `oc_zone_description` VALUES (2023,1,'Floriana');
INSERT INTO `oc_zone_description` VALUES (3630,1,'Florida');
INSERT INTO `oc_zone_description` VALUES (3693,1,'Florida');
INSERT INTO `oc_zone_description` VALUES (428,1,'Foca');
INSERT INTO `oc_zone_description` VALUES (3875,1,'Foggia');
INSERT INTO `oc_zone_description` VALUES (2069,1,'Fontana');
INSERT INTO `oc_zone_description` VALUES (2192,1,'Fontvieille');
INSERT INTO `oc_zone_description` VALUES (1336,1,'Forecariah');
INSERT INTO `oc_zone_description` VALUES (3876,1,'Forli-Cesena');
INSERT INTO `oc_zone_description` VALUES (164,1,'Formosa');
INSERT INTO `oc_zone_description` VALUES (1399,1,'Francisco Morazan');
INSERT INTO `oc_zone_description` VALUES (2962,1,'Free State');
INSERT INTO `oc_zone_description` VALUES (3403,1,'French Cay');
INSERT INTO `oc_zone_description` VALUES (1337,1,'Fria');
INSERT INTO `oc_zone_description` VALUES (3101,1,'Fribourg');
INSERT INTO `oc_zone_description` VALUES (2331,1,'Friesland');
INSERT INTO `oc_zone_description` VALUES (3877,1,'Frosinone');
INSERT INTO `oc_zone_description` VALUES (2004,1,'Fua Mulaku');
INSERT INTO `oc_zone_description` VALUES (687,1,'Fujian');
INSERT INTO `oc_zone_description` VALUES (1662,1,'Fukui');
INSERT INTO `oc_zone_description` VALUES (1663,1,'Fukuoka');
INSERT INTO `oc_zone_description` VALUES (1664,1,'Fukushima');
INSERT INTO `oc_zone_description` VALUES (3418,1,'Funafuti');
INSERT INTO `oc_zone_description` VALUES (227,1,'Fuzuli');
INSERT INTO `oc_zone_description` VALUES (3295,1,'Gabes');
INSERT INTO `oc_zone_description` VALUES (482,1,'Gabrovo');
INSERT INTO `oc_zone_description` VALUES (1365,1,'Gabu Region');
INSERT INTO `oc_zone_description` VALUES (229,1,'Gadabay');
INSERT INTO `oc_zone_description` VALUES (3296,1,'Gafsa');
INSERT INTO `oc_zone_description` VALUES (2856,1,'Gaga\'emauga');
INSERT INTO `oc_zone_description` VALUES (2857,1,'Gagaifomauga');
INSERT INTO `oc_zone_description` VALUES (2181,1,'Gagauzia');
INSERT INTO `oc_zone_description` VALUES (816,1,'Gagnoa');
INSERT INTO `oc_zone_description` VALUES (987,1,'Gal&aacute;pagos');
INSERT INTO `oc_zone_description` VALUES (2697,1,'Galați');
INSERT INTO `oc_zone_description` VALUES (2948,1,'Galguduud');
INSERT INTO `oc_zone_description` VALUES (1615,1,'Galil');
INSERT INTO `oc_zone_description` VALUES (1592,1,'Galway');
INSERT INTO `oc_zone_description` VALUES (1072,1,'Gambela');
INSERT INTO `oc_zone_description` VALUES (1908,1,'Gamprin');
INSERT INTO `oc_zone_description` VALUES (228,1,'Ganca');
INSERT INTO `oc_zone_description` VALUES (2318,1,'Gandaki');
INSERT INTO `oc_zone_description` VALUES (4248,1,'Gangwon-do');
INSERT INTO `oc_zone_description` VALUES (688,1,'Gansu');
INSERT INTO `oc_zone_description` VALUES (514,1,'Ganzourgou');
INSERT INTO `oc_zone_description` VALUES (2006,1,'Gao');
INSERT INTO `oc_zone_description` VALUES (1338,1,'Gaoual');
INSERT INTO `oc_zone_description` VALUES (1144,1,'Gard');
INSERT INTO `oc_zone_description` VALUES (2026,1,'Gargur');
INSERT INTO `oc_zone_description` VALUES (4084,1,'Garkalnes novads');
INSERT INTO `oc_zone_description` VALUES (386,1,'Gasa');
INSERT INTO `oc_zone_description` VALUES (1053,1,'Gash-Barka (Barentu)');
INSERT INTO `oc_zone_description` VALUES (2963,1,'Gauteng');
INSERT INTO `oc_zone_description` VALUES (3076,1,'Gävleborg');
INSERT INTO `oc_zone_description` VALUES (2027,1,'Gaxaq');
INSERT INTO `oc_zone_description` VALUES (2264,1,'Gaza');
INSERT INTO `oc_zone_description` VALUES (3347,1,'Gaziantep');
INSERT INTO `oc_zone_description` VALUES (2949,1,'Gedo');
INSERT INTO `oc_zone_description` VALUES (183,1,'Geghark\'unik\'');
INSERT INTO `oc_zone_description` VALUES (2332,1,'Gelderland');
INSERT INTO `oc_zone_description` VALUES (3102,1,'Gen&egrave;ve');
INSERT INTO `oc_zone_description` VALUES (3878,1,'Genova');
INSERT INTO `oc_zone_description` VALUES (3631,1,'Georgia');
INSERT INTO `oc_zone_description` VALUES (1146,1,'Gers');
INSERT INTO `oc_zone_description` VALUES (1888,1,'Ghadamis');
INSERT INTO `oc_zone_description` VALUES (2070,1,'Ghajnsielem');
INSERT INTO `oc_zone_description` VALUES (431,1,'Ghanzi');
INSERT INTO `oc_zone_description` VALUES (2071,1,'Gharb');
INSERT INTO `oc_zone_description` VALUES (3045,1,'Gharb al Istiwa\'iyah');
INSERT INTO `oc_zone_description` VALUES (3046,1,'Gharb Bahr al Ghazal');
INSERT INTO `oc_zone_description` VALUES (3047,1,'Gharb Darfur');
INSERT INTO `oc_zone_description` VALUES (3048,1,'Gharb Kurdufan');
INSERT INTO `oc_zone_description` VALUES (88,1,'Ghardaia');
INSERT INTO `oc_zone_description` VALUES (1889,1,'Gharyan');
INSERT INTO `oc_zone_description` VALUES (2072,1,'Ghasri');
INSERT INTO `oc_zone_description` VALUES (8,1,'Ghazni');
INSERT INTO `oc_zone_description` VALUES (9,1,'Ghowr');
INSERT INTO `oc_zone_description` VALUES (3771,1,'Gia Lai');
INSERT INTO `oc_zone_description` VALUES (1665,1,'Gifu');
INSERT INTO `oc_zone_description` VALUES (2812,1,'Gikongoro');
INSERT INTO `oc_zone_description` VALUES (1542,1,'Gilan');
INSERT INTO `oc_zone_description` VALUES (3348,1,'Giresun');
INSERT INTO `oc_zone_description` VALUES (2989,1,'Girona');
INSERT INTO `oc_zone_description` VALUES (1147,1,'Gironde');
INSERT INTO `oc_zone_description` VALUES (2348,1,'Gisborne');
INSERT INTO `oc_zone_description` VALUES (2813,1,'Gisenyi');
INSERT INTO `oc_zone_description` VALUES (2814,1,'Gitarama');
INSERT INTO `oc_zone_description` VALUES (556,1,'Gitega');
INSERT INTO `oc_zone_description` VALUES (2698,1,'Giurgiu');
INSERT INTO `oc_zone_description` VALUES (42,1,'Gjirokaster');
INSERT INTO `oc_zone_description` VALUES (2909,1,'Glacis');
INSERT INTO `oc_zone_description` VALUES (3103,1,'Glarus');
INSERT INTO `oc_zone_description` VALUES (3551,1,'Glasgow');
INSERT INTO `oc_zone_description` VALUES (3552,1,'Gloucestershire');
INSERT INTO `oc_zone_description` VALUES (515,1,'Gnagna');
INSERT INTO `oc_zone_description` VALUES (1484,1,'Goa');
INSERT INTO `oc_zone_description` VALUES (448,1,'Goiás');
INSERT INTO `oc_zone_description` VALUES (1564,1,'Golestan');
INSERT INTO `oc_zone_description` VALUES (2403,1,'Gombe');
INSERT INTO `oc_zone_description` VALUES (230,1,'Goranboy');
INSERT INTO `oc_zone_description` VALUES (3964,1,'Gorenjska');
INSERT INTO `oc_zone_description` VALUES (2120,1,'Gorgol');
INSERT INTO `oc_zone_description` VALUES (3966,1,'Goriška');
INSERT INTO `oc_zone_description` VALUES (3879,1,'Gorizia');
INSERT INTO `oc_zone_description` VALUES (2699,1,'Gorj');
INSERT INTO `oc_zone_description` VALUES (3160,1,'Gorno-Badakhstan');
INSERT INTO `oc_zone_description` VALUES (1512,1,'Gorontalo');
INSERT INTO `oc_zone_description` VALUES (3077,1,'Gotland');
INSERT INTO `oc_zone_description` VALUES (516,1,'Gourma');
INSERT INTO `oc_zone_description` VALUES (2213,1,'Govi-Altay');
INSERT INTO `oc_zone_description` VALUES (2212,1,'Govi-Sumber');
INSERT INTO `oc_zone_description` VALUES (231,1,'Goycay');
INSERT INTO `oc_zone_description` VALUES (1400,1,'Gracias a Dios');
INSERT INTO `oc_zone_description` VALUES (848,1,'Grad Zagreb');
INSERT INTO `oc_zone_description` VALUES (43,1,'Gramsh');
INSERT INTO `oc_zone_description` VALUES (2370,1,'Granada');
INSERT INTO `oc_zone_description` VALUES (2990,1,'Granada');
INSERT INTO `oc_zone_description` VALUES (1864,1,'Grand Bassa');
INSERT INTO `oc_zone_description` VALUES (1865,1,'Grand Cape Mount');
INSERT INTO `oc_zone_description` VALUES (296,1,'Grand Cay');
INSERT INTO `oc_zone_description` VALUES (1866,1,'Grand Gedeh');
INSERT INTO `oc_zone_description` VALUES (1867,1,'Grand Kru');
INSERT INTO `oc_zone_description` VALUES (2139,1,'Grand Port');
INSERT INTO `oc_zone_description` VALUES (3408,1,'Grand Turk');
INSERT INTO `oc_zone_description` VALUES (817,1,'Grand-Bassam');
INSERT INTO `oc_zone_description` VALUES (818,1,'Grand-Lahou');
INSERT INTO `oc_zone_description` VALUES (2910,1,'Grand\' Anse (on Mahe)');
INSERT INTO `oc_zone_description` VALUES (2911,1,'Grand\' Anse (on Praslin)');
INSERT INTO `oc_zone_description` VALUES (1381,1,'Grand\'Anse');
INSERT INTO `oc_zone_description` VALUES (753,1,'Grande Comore');
INSERT INTO `oc_zone_description` VALUES (872,1,'Granma');
INSERT INTO `oc_zone_description` VALUES (3104,1,'Graubünden');
INSERT INTO `oc_zone_description` VALUES (1274,1,'Greater Accra Region');
INSERT INTO `oc_zone_description` VALUES (3553,1,'Greater London');
INSERT INTO `oc_zone_description` VALUES (3554,1,'Greater Manchester');
INSERT INTO `oc_zone_description` VALUES (2847,1,'Grenadines');
INSERT INTO `oc_zone_description` VALUES (1926,1,'Grevenmacher');
INSERT INTO `oc_zone_description` VALUES (4086,1,'Grobiņas novads');
INSERT INTO `oc_zone_description` VALUES (2333,1,'Groningen');
INSERT INTO `oc_zone_description` VALUES (2840,1,'Gros-Islet');
INSERT INTO `oc_zone_description` VALUES (3880,1,'Grosseto');
INSERT INTO `oc_zone_description` VALUES (2991,1,'Guadalajara');
INSERT INTO `oc_zone_description` VALUES (2935,1,'Guadalcanal');
INSERT INTO `oc_zone_description` VALUES (735,1,'Guainia');
INSERT INTO `oc_zone_description` VALUES (2520,1,'Guaira');
INSERT INTO `oc_zone_description` VALUES (736,1,'Guajira');
INSERT INTO `oc_zone_description` VALUES (3632,1,'Guam');
INSERT INTO `oc_zone_description` VALUES (784,1,'Guanacaste');
INSERT INTO `oc_zone_description` VALUES (2155,1,'Guanajuato');
INSERT INTO `oc_zone_description` VALUES (689,1,'Guangdong');
INSERT INTO `oc_zone_description` VALUES (690,1,'Guangxi');
INSERT INTO `oc_zone_description` VALUES (873,1,'Guantanamo');
INSERT INTO `oc_zone_description` VALUES (2658,1,'Guarda');
INSERT INTO `oc_zone_description` VALUES (3738,1,'Guarico');
INSERT INTO `oc_zone_description` VALUES (1312,1,'Guatemala');
INSERT INTO `oc_zone_description` VALUES (737,1,'Guaviare');
INSERT INTO `oc_zone_description` VALUES (988,1,'Guayas');
INSERT INTO `oc_zone_description` VALUES (2024,1,'Gudja');
INSERT INTO `oc_zone_description` VALUES (1339,1,'Gueckedou');
INSERT INTO `oc_zone_description` VALUES (89,1,'Guelma');
INSERT INTO `oc_zone_description` VALUES (2235,1,'Guelmim');
INSERT INTO `oc_zone_description` VALUES (661,1,'Guera');
INSERT INTO `oc_zone_description` VALUES (2156,1,'Guerrero');
INSERT INTO `oc_zone_description` VALUES (2121,1,'Guidimaka');
INSERT INTO `oc_zone_description` VALUES (819,1,'Guiglo');
INSERT INTO `oc_zone_description` VALUES (2582,1,'Guimaras');
INSERT INTO `oc_zone_description` VALUES (2992,1,'Guip&uacute;zcoa');
INSERT INTO `oc_zone_description` VALUES (691,1,'Guizhou');
INSERT INTO `oc_zone_description` VALUES (1485,1,'Gujarat');
INSERT INTO `oc_zone_description` VALUES (4088,1,'Gulbenes novads');
INSERT INTO `oc_zone_description` VALUES (2496,1,'Gulf');
INSERT INTO `oc_zone_description` VALUES (3455,1,'Gulu');
INSERT INTO `oc_zone_description` VALUES (1666,1,'Gumma');
INSERT INTO `oc_zone_description` VALUES (3349,1,'Gümüşhane');
INSERT INTO `oc_zone_description` VALUES (1245,1,'Guria');
INSERT INTO `oc_zone_description` VALUES (4243,1,'Gwangju-gwangyeoksi');
INSERT INTO `oc_zone_description` VALUES (3555,1,'Gwynedd');
INSERT INTO `oc_zone_description` VALUES (4249,1,'Gyeonggi-do');
INSERT INTO `oc_zone_description` VALUES (4250,1,'Gyeongsangbuk-do');
INSERT INTO `oc_zone_description` VALUES (4251,1,'Gyeongsangnam-do');
INSERT INTO `oc_zone_description` VALUES (4453,1,'Győr-Moson-Sopron');
INSERT INTO `oc_zone_description` VALUES (2025,1,'Gzira');
INSERT INTO `oc_zone_description` VALUES (1148,1,'H&eacute;rault');
INSERT INTO `oc_zone_description` VALUES (3772,1,'Ha Giang');
INSERT INTO `oc_zone_description` VALUES (3775,1,'Ha Nam');
INSERT INTO `oc_zone_description` VALUES (3776,1,'Ha Noi');
INSERT INTO `oc_zone_description` VALUES (3777,1,'Ha Tay');
INSERT INTO `oc_zone_description` VALUES (3778,1,'Ha Tinh');
INSERT INTO `oc_zone_description` VALUES (3273,1,'Ha\'apai');
INSERT INTO `oc_zone_description` VALUES (2882,1,'Ha\'il');
INSERT INTO `oc_zone_description` VALUES (387,1,'Haa');
INSERT INTO `oc_zone_description` VALUES (232,1,'Haciqabul');
INSERT INTO `oc_zone_description` VALUES (2001,1,'Hadhdhunmathi');
INSERT INTO `oc_zone_description` VALUES (3795,1,'Hadramawt');
INSERT INTO `oc_zone_description` VALUES (3773,1,'Hai Duong');
INSERT INTO `oc_zone_description` VALUES (3774,1,'Hai Phong');
INSERT INTO `oc_zone_description` VALUES (1616,1,'Haifa');
INSERT INTO `oc_zone_description` VALUES (692,1,'Hainan');
INSERT INTO `oc_zone_description` VALUES (346,1,'Hainaut');
INSERT INTO `oc_zone_description` VALUES (4454,1,'Hajdú-Bihar');
INSERT INTO `oc_zone_description` VALUES (3796,1,'Hajjah');
INSERT INTO `oc_zone_description` VALUES (3350,1,'Hakkari');
INSERT INTO `oc_zone_description` VALUES (3129,1,'Halab');
INSERT INTO `oc_zone_description` VALUES (3078,1,'Halland');
INSERT INTO `oc_zone_description` VALUES (1548,1,'Hamadan');
INSERT INTO `oc_zone_description` VALUES (3130,1,'Hamah');
INSERT INTO `oc_zone_description` VALUES (1259,1,'Hamburg');
INSERT INTO `oc_zone_description` VALUES (1763,1,'Hamgyong-bukto');
INSERT INTO `oc_zone_description` VALUES (1764,1,'Hamgyong-namdo');
INSERT INTO `oc_zone_description` VALUES (374,1,'Hamilton');
INSERT INTO `oc_zone_description` VALUES (373,1,'Hamilton City');
INSERT INTO `oc_zone_description` VALUES (3556,1,'Hampshire');
INSERT INTO `oc_zone_description` VALUES (2028,1,'Hamrun');
INSERT INTO `oc_zone_description` VALUES (1644,1,'Hanover Parish');
INSERT INTO `oc_zone_description` VALUES (3833,1,'Harare');
INSERT INTO `oc_zone_description` VALUES (297,1,'Harbour Island');
INSERT INTO `oc_zone_description` VALUES (2290,1,'Hardap');
INSERT INTO `oc_zone_description` VALUES (2700,1,'Harghita');
INSERT INTO `oc_zone_description` VALUES (1073,1,'Hariai');
INSERT INTO `oc_zone_description` VALUES (1054,1,'Harjumaa (Tallinn)');
INSERT INTO `oc_zone_description` VALUES (1486,1,'Haryana');
INSERT INTO `oc_zone_description` VALUES (44,1,'Has');
INSERT INTO `oc_zone_description` VALUES (483,1,'Haskovo');
INSERT INTO `oc_zone_description` VALUES (3351,1,'Hatay');
INSERT INTO `oc_zone_description` VALUES (943,1,'Hato Mayor');
INSERT INTO `oc_zone_description` VALUES (2466,1,'Hatohobei');
INSERT INTO `oc_zone_description` VALUES (3781,1,'Hau Giang');
INSERT INTO `oc_zone_description` VALUES (1182,1,'Haut Rhin');
INSERT INTO `oc_zone_description` VALUES (643,1,'Haut-Mbomou');
INSERT INTO `oc_zone_description` VALUES (1221,1,'Haut-Ogooue');
INSERT INTO `oc_zone_description` VALUES (1134,1,'Haute Corse');
INSERT INTO `oc_zone_description` VALUES (1145,1,'Haute Garonne');
INSERT INTO `oc_zone_description` VALUES (1157,1,'Haute Loire');
INSERT INTO `oc_zone_description` VALUES (1166,1,'Haute Marne');
INSERT INTO `oc_zone_description` VALUES (1184,1,'Haute Sa&ocirc;ne');
INSERT INTO `oc_zone_description` VALUES (1188,1,'Haute Savoie');
INSERT INTO `oc_zone_description` VALUES (1201,1,'Haute Vienne');
INSERT INTO `oc_zone_description` VALUES (642,1,'Haute-Kotto');
INSERT INTO `oc_zone_description` VALUES (1179,1,'Hautes Pyr&eacute;n&eacute;es');
INSERT INTO `oc_zone_description` VALUES (1118,1,'Hautes-Alpes');
INSERT INTO `oc_zone_description` VALUES (1206,1,'Hauts de Seine');
INSERT INTO `oc_zone_description` VALUES (3633,1,'Hawaii');
INSERT INTO `oc_zone_description` VALUES (1792,1,'Hawalli');
INSERT INTO `oc_zone_description` VALUES (2350,1,'Hawke\'s Bay');
INSERT INTO `oc_zone_description` VALUES (1391,1,'Heard Island');
INSERT INTO `oc_zone_description` VALUES (693,1,'Hebei');
INSERT INTO `oc_zone_description` VALUES (2433,1,'Hedmark');
INSERT INTO `oc_zone_description` VALUES (694,1,'Heilongjiang');
INSERT INTO `oc_zone_description` VALUES (10,1,'Helmand');
INSERT INTO `oc_zone_description` VALUES (695,1,'Henan');
INSERT INTO `oc_zone_description` VALUES (2199,1,'Hentiy');
INSERT INTO `oc_zone_description` VALUES (11,1,'Herat');
INSERT INTO `oc_zone_description` VALUES (3980,1,'Herceg-Novi');
INSERT INTO `oc_zone_description` VALUES (419,1,'Hercegovacko-neretvanski Kanton');
INSERT INTO `oc_zone_description` VALUES (785,1,'Heredia');
INSERT INTO `oc_zone_description` VALUES (3557,1,'Herefordshire');
INSERT INTO `oc_zone_description` VALUES (2484,1,'Herrera');
INSERT INTO `oc_zone_description` VALUES (3558,1,'Hertfordshire');
INSERT INTO `oc_zone_description` VALUES (1260,1,'Hessen');
INSERT INTO `oc_zone_description` VALUES (4455,1,'Heves');
INSERT INTO `oc_zone_description` VALUES (3070,1,'Hhohho');
INSERT INTO `oc_zone_description` VALUES (2157,1,'Hidalgo');
INSERT INTO `oc_zone_description` VALUES (3559,1,'Highlands');
INSERT INTO `oc_zone_description` VALUES (2950,1,'Hiiraan');
INSERT INTO `oc_zone_description` VALUES (1055,1,'Hiiumaa (Kardla)');
INSERT INTO `oc_zone_description` VALUES (1487,1,'Himachal Pradesh');
INSERT INTO `oc_zone_description` VALUES (3131,1,'Hims');
INSERT INTO `oc_zone_description` VALUES (1667,1,'Hiroshima');
INSERT INTO `oc_zone_description` VALUES (3780,1,'Ho Chi Minh City');
INSERT INTO `oc_zone_description` VALUES (3779,1,'Hoa Binh');
INSERT INTO `oc_zone_description` VALUES (2122,1,'Hodh Ech Chargui');
INSERT INTO `oc_zone_description` VALUES (2123,1,'Hodh El Gharbi');
INSERT INTO `oc_zone_description` VALUES (1468,1,'Hofuoborgarsvaeoi');
INSERT INTO `oc_zone_description` VALUES (3467,1,'Hoima');
INSERT INTO `oc_zone_description` VALUES (1668,1,'Hokkaido');
INSERT INTO `oc_zone_description` VALUES (874,1,'Holguin');
INSERT INTO `oc_zone_description` VALUES (716,1,'Home Island');
INSERT INTO `oc_zone_description` VALUES (338,1,'Homyel\'skaya (Homyel\')');
INSERT INTO `oc_zone_description` VALUES (696,1,'Hong Kong');
INSERT INTO `oc_zone_description` VALUES (2936,1,'Honiara');
INSERT INTO `oc_zone_description` VALUES (298,1,'Hope Town');
INSERT INTO `oc_zone_description` VALUES (339,1,'Horad Minsk');
INSERT INTO `oc_zone_description` VALUES (2434,1,'Hordaland');
INSERT INTO `oc_zone_description` VALUES (1557,1,'Hormozgan');
INSERT INTO `oc_zone_description` VALUES (717,1,'Horsburgh Island');
INSERT INTO `oc_zone_description` VALUES (1806,1,'Houaphan');
INSERT INTO `oc_zone_description` VALUES (517,1,'Houet');
INSERT INTO `oc_zone_description` VALUES (2201,1,'Hovd');
INSERT INTO `oc_zone_description` VALUES (907,1,'Hovedstaden');
INSERT INTO `oc_zone_description` VALUES (2200,1,'Hovsgol');
INSERT INTO `oc_zone_description` VALUES (3679,1,'Howland Island');
INSERT INTO `oc_zone_description` VALUES (340,1,'Hrodzyenskaya (Hrodna)');
INSERT INTO `oc_zone_description` VALUES (3137,1,'Hsin-chu');
INSERT INTO `oc_zone_description` VALUES (3155,1,'Hsin-chu');
INSERT INTO `oc_zone_description` VALUES (3138,1,'Hua-lien');
INSERT INTO `oc_zone_description` VALUES (137,1,'Huambo');
INSERT INTO `oc_zone_description` VALUES (2535,1,'Huancavelica');
INSERT INTO `oc_zone_description` VALUES (2536,1,'Huanuco');
INSERT INTO `oc_zone_description` VALUES (697,1,'Hubei');
INSERT INTO `oc_zone_description` VALUES (1313,1,'Huehuetenango');
INSERT INTO `oc_zone_description` VALUES (2993,1,'Huelva');
INSERT INTO `oc_zone_description` VALUES (2994,1,'Huesca');
INSERT INTO `oc_zone_description` VALUES (138,1,'Huila');
INSERT INTO `oc_zone_description` VALUES (738,1,'Huila');
INSERT INTO `oc_zone_description` VALUES (698,1,'Hunan');
INSERT INTO `oc_zone_description` VALUES (2701,1,'Hunedoara');
INSERT INTO `oc_zone_description` VALUES (3782,1,'Hung Yen');
INSERT INTO `oc_zone_description` VALUES (2003,1,'Huvadhu Atoll Dhekunu');
INSERT INTO `oc_zone_description` VALUES (2002,1,'Huvadhu Atoll Uthuru');
INSERT INTO `oc_zone_description` VALUES (1765,1,'Hwanghae-bukto');
INSERT INTO `oc_zone_description` VALUES (1766,1,'Hwanghae-namdo');
INSERT INTO `oc_zone_description` VALUES (1669,1,'Hyogo');
INSERT INTO `oc_zone_description` VALUES (3139,1,'I-lan');
INSERT INTO `oc_zone_description` VALUES (2702,1,'Ialomița');
INSERT INTO `oc_zone_description` VALUES (2703,1,'Iași');
INSERT INTO `oc_zone_description` VALUES (1670,1,'Ibaraki');
INSERT INTO `oc_zone_description` VALUES (3798,1,'Ibb');
INSERT INTO `oc_zone_description` VALUES (2537,1,'Ica');
INSERT INTO `oc_zone_description` VALUES (1056,1,'Ida-Virumaa (Johvi)');
INSERT INTO `oc_zone_description` VALUES (3634,1,'Idaho');
INSERT INTO `oc_zone_description` VALUES (3132,1,'Idlib');
INSERT INTO `oc_zone_description` VALUES (4089,1,'Iecavas novads');
INSERT INTO `oc_zone_description` VALUES (2236,1,'Ifrane');
INSERT INTO `oc_zone_description` VALUES (2583,1,'Ifugao');
INSERT INTO `oc_zone_description` VALUES (3439,1,'Iganga');
INSERT INTO `oc_zone_description` VALUES (3352,1,'Iğdır');
INSERT INTO `oc_zone_description` VALUES (2310,1,'Ijuw');
INSERT INTO `oc_zone_description` VALUES (2029,1,'Iklin');
INSERT INTO `oc_zone_description` VALUES (4091,1,'Ikšķiles novads');
INSERT INTO `oc_zone_description` VALUES (1550,1,'Ilam');
INSERT INTO `oc_zone_description` VALUES (1217,1,'Ile Amsterdam');
INSERT INTO `oc_zone_description` VALUES (1218,1,'Ile Saint-Paul');
INSERT INTO `oc_zone_description` VALUES (1215,1,'Iles Crozet');
INSERT INTO `oc_zone_description` VALUES (1213,1,'Iles du Vent');
INSERT INTO `oc_zone_description` VALUES (1216,1,'Iles Kerguelen');
INSERT INTO `oc_zone_description` VALUES (2341,1,'Iles Loyaute');
INSERT INTO `oc_zone_description` VALUES (1214,1,'Iles Sous-le-Vent');
INSERT INTO `oc_zone_description` VALUES (2704,1,'Ilfov');
INSERT INTO `oc_zone_description` VALUES (1149,1,'Ille et Vilaine');
INSERT INTO `oc_zone_description` VALUES (3635,1,'Illinois');
INSERT INTO `oc_zone_description` VALUES (90,1,'Illizi');
INSERT INTO `oc_zone_description` VALUES (2584,1,'Ilocos Norte');
INSERT INTO `oc_zone_description` VALUES (2585,1,'Ilocos Sur');
INSERT INTO `oc_zone_description` VALUES (2586,1,'Iloilo');
INSERT INTO `oc_zone_description` VALUES (4093,1,'Ilūkstes novads');
INSERT INTO `oc_zone_description` VALUES (989,1,'Imbabura');
INSERT INTO `oc_zone_description` VALUES (1246,1,'Imereti');
INSERT INTO `oc_zone_description` VALUES (233,1,'Imisli');
INSERT INTO `oc_zone_description` VALUES (2404,1,'Imo');
INSERT INTO `oc_zone_description` VALUES (3881,1,'Imperia');
INSERT INTO `oc_zone_description` VALUES (299,1,'Inagua');
INSERT INTO `oc_zone_description` VALUES (4244,1,'Incheon-gwangyeoksi');
INSERT INTO `oc_zone_description` VALUES (2124,1,'Inchiri');
INSERT INTO `oc_zone_description` VALUES (4094,1,'Inčukalna novads');
INSERT INTO `oc_zone_description` VALUES (944,1,'Independencia');
INSERT INTO `oc_zone_description` VALUES (3636,1,'Indiana');
INSERT INTO `oc_zone_description` VALUES (1150,1,'Indre');
INSERT INTO `oc_zone_description` VALUES (1151,1,'Indre et Loire');
INSERT INTO `oc_zone_description` VALUES (4262,1,'Ingushetia, Republic of');
INSERT INTO `oc_zone_description` VALUES (2265,1,'Inhambane');
INSERT INTO `oc_zone_description` VALUES (699,1,'Inner Mongolia');
INSERT INTO `oc_zone_description` VALUES (1401,1,'Intibuca');
INSERT INTO `oc_zone_description` VALUES (3560,1,'Inverclyde');
INSERT INTO `oc_zone_description` VALUES (518,1,'Ioba');
INSERT INTO `oc_zone_description` VALUES (1286,1,'Ionian Islands');
INSERT INTO `oc_zone_description` VALUES (3637,1,'Iowa');
INSERT INTO `oc_zone_description` VALUES (1712,1,'Irbid');
INSERT INTO `oc_zone_description` VALUES (3166,1,'Iringa');
INSERT INTO `oc_zone_description` VALUES (4294,1,'Irkutsk Oblast');
INSERT INTO `oc_zone_description` VALUES (1152,1,'Is&eacute;re');
INSERT INTO `oc_zone_description` VALUES (2937,1,'Isabel');
INSERT INTO `oc_zone_description` VALUES (2587,1,'Isabela');
INSERT INTO `oc_zone_description` VALUES (3882,1,'Isernia');
INSERT INTO `oc_zone_description` VALUES (1671,1,'Ishikawa');
INSERT INTO `oc_zone_description` VALUES (2030,1,'Isla');
INSERT INTO `oc_zone_description` VALUES (875,1,'Isla de la Juventud');
INSERT INTO `oc_zone_description` VALUES (2459,1,'Islamabad Capital Territory');
INSERT INTO `oc_zone_description` VALUES (1419,1,'Islands New Territories');
INSERT INTO `oc_zone_description` VALUES (1402,1,'Islas de la Bahia (Bay Islands)');
INSERT INTO `oc_zone_description` VALUES (3561,1,'Isle of Wight');
INSERT INTO `oc_zone_description` VALUES (234,1,'Ismayilli');
INSERT INTO `oc_zone_description` VALUES (3353,1,'Isparta');
INSERT INTO `oc_zone_description` VALUES (820,1,'Issia');
INSERT INTO `oc_zone_description` VALUES (3354,1,'İstanbul');
INSERT INTO `oc_zone_description` VALUES (850,1,'Istarska');
INSERT INTO `oc_zone_description` VALUES (4467,1,'Istočen');
INSERT INTO `oc_zone_description` VALUES (1087,1,'Itä-Suomen lääni');
INSERT INTO `oc_zone_description` VALUES (2521,1,'Itapua');
INSERT INTO `oc_zone_description` VALUES (3486,1,'Ivano-Frankivska');
INSERT INTO `oc_zone_description` VALUES (4293,1,'Ivanovo Oblast');
INSERT INTO `oc_zone_description` VALUES (1672,1,'Iwate');
INSERT INTO `oc_zone_description` VALUES (1314,1,'Izabal');
INSERT INTO `oc_zone_description` VALUES (3355,1,'İzmir');
INSERT INTO `oc_zone_description` VALUES (2995,1,'Ja&eacute;n');
INSERT INTO `oc_zone_description` VALUES (2094,1,'Jabat');
INSERT INTO `oc_zone_description` VALUES (4017,1,'Jablanica');
INSERT INTO `oc_zone_description` VALUES (821,1,'Jacqueville');
INSERT INTO `oc_zone_description` VALUES (1513,1,'Jakarta');
INSERT INTO `oc_zone_description` VALUES (1796,1,'Jalal-Abad');
INSERT INTO `oc_zone_description` VALUES (1315,1,'Jalapa');
INSERT INTO `oc_zone_description` VALUES (2158,1,'Jalisco');
INSERT INTO `oc_zone_description` VALUES (2095,1,'Jaluit');
INSERT INTO `oc_zone_description` VALUES (1514,1,'Jambi');
INSERT INTO `oc_zone_description` VALUES (1488,1,'Jammu and Kashmir');
INSERT INTO `oc_zone_description` VALUES (3079,1,'Jämtland');
INSERT INTO `oc_zone_description` VALUES (2319,1,'Janakpur');
INSERT INTO `oc_zone_description` VALUES (1232,1,'Janjangbure');
INSERT INTO `oc_zone_description` VALUES (3049,1,'Janub Darfur');
INSERT INTO `oc_zone_description` VALUES (3050,1,'Janub Kurdufan');
INSERT INTO `oc_zone_description` VALUES (1021,1,'Janub Sina\'');
INSERT INTO `oc_zone_description` VALUES (1713,1,'Jarash');
INSERT INTO `oc_zone_description` VALUES (2675,1,'Jarayan al Batinah');
INSERT INTO `oc_zone_description` VALUES (1057,1,'Jarvamaa (Paide)');
INSERT INTO `oc_zone_description` VALUES (3680,1,'Jarvis Island');
INSERT INTO `oc_zone_description` VALUES (4456,1,'Jász-Nagykun-Szolnok');
INSERT INTO `oc_zone_description` VALUES (4096,1,'Jaunjelgavas novads');
INSERT INTO `oc_zone_description` VALUES (4097,1,'Jaunpiebalgas novads');
INSERT INTO `oc_zone_description` VALUES (4098,1,'Jaunpils novads');
INSERT INTO `oc_zone_description` VALUES (1515,1,'Jawa Barat');
INSERT INTO `oc_zone_description` VALUES (1516,1,'Jawa Tengah');
INSERT INTO `oc_zone_description` VALUES (1517,1,'Jawa Timur');
INSERT INTO `oc_zone_description` VALUES (1617,1,'Jehuda Mountains');
INSERT INTO `oc_zone_description` VALUES (4254,1,'Jeju-teukbyeoljachido');
INSERT INTO `oc_zone_description` VALUES (4101,1,'Jēkabpils');
INSERT INTO `oc_zone_description` VALUES (4102,1,'Jēkabpils novads');
INSERT INTO `oc_zone_description` VALUES (4099,1,'Jelgava');
INSERT INTO `oc_zone_description` VALUES (4100,1,'Jelgavas novads');
INSERT INTO `oc_zone_description` VALUES (2096,1,'Jemo');
INSERT INTO `oc_zone_description` VALUES (3297,1,'Jendouba');
INSERT INTO `oc_zone_description` VALUES (4252,1,'Jeollabuk-do');
INSERT INTO `oc_zone_description` VALUES (4253,1,'Jeollanam-do');
INSERT INTO `oc_zone_description` VALUES (1618,1,'Jerusalem');
INSERT INTO `oc_zone_description` VALUES (4443,1,'Jetisu');
INSERT INTO `oc_zone_description` VALUES (4335,1,'Jewish Autonomous Oblast');
INSERT INTO `oc_zone_description` VALUES (700,1,'Jiangsu');
INSERT INTO `oc_zone_description` VALUES (701,1,'Jiangxi');
INSERT INTO `oc_zone_description` VALUES (2405,1,'Jigawa');
INSERT INTO `oc_zone_description` VALUES (890,1,'Jihočeský');
INSERT INTO `oc_zone_description` VALUES (891,1,'Jihomoravský');
INSERT INTO `oc_zone_description` VALUES (91,1,'Jijel');
INSERT INTO `oc_zone_description` VALUES (702,1,'Jilin');
INSERT INTO `oc_zone_description` VALUES (3440,1,'Jinja');
INSERT INTO `oc_zone_description` VALUES (2371,1,'Jinotega');
INSERT INTO `oc_zone_description` VALUES (2883,1,'Jizan');
INSERT INTO `oc_zone_description` VALUES (3709,1,'Jizzax');
INSERT INTO `oc_zone_description` VALUES (1058,1,'Jogevamaa (Jogeva)');
INSERT INTO `oc_zone_description` VALUES (3681,1,'Johnston Atoll');
INSERT INTO `oc_zone_description` VALUES (1971,1,'Johor');
INSERT INTO `oc_zone_description` VALUES (4025,1,'Jonglei');
INSERT INTO `oc_zone_description` VALUES (3080,1,'Jönköping');
INSERT INTO `oc_zone_description` VALUES (12,1,'Jowzjan');
INSERT INTO `oc_zone_description` VALUES (2951,1,'Jubbada Dhexe');
INSERT INTO `oc_zone_description` VALUES (2952,1,'Jubbada Hoose');
INSERT INTO `oc_zone_description` VALUES (4469,1,'Jugoistočen');
INSERT INTO `oc_zone_description` VALUES (3962,1,'Jugovzhodna Slovenija');
INSERT INTO `oc_zone_description` VALUES (4468,1,'Jugozapaden');
INSERT INTO `oc_zone_description` VALUES (165,1,'Jujuy');
INSERT INTO `oc_zone_description` VALUES (2538,1,'Junin');
INSERT INTO `oc_zone_description` VALUES (3051,1,'Junqali');
INSERT INTO `oc_zone_description` VALUES (1153,1,'Jura');
INSERT INTO `oc_zone_description` VALUES (3105,1,'Jura');
INSERT INTO `oc_zone_description` VALUES (4103,1,'Jūrmala');
INSERT INTO `oc_zone_description` VALUES (1316,1,'Jutiapa');
INSERT INTO `oc_zone_description` VALUES (3468,1,'Kabale');
INSERT INTO `oc_zone_description` VALUES (4263,1,'Kabardino-Balkar Republic');
INSERT INTO `oc_zone_description` VALUES (3469,1,'Kabarole');
INSERT INTO `oc_zone_description` VALUES (3441,1,'Kaberamaido');
INSERT INTO `oc_zone_description` VALUES (13,1,'Kabul');
INSERT INTO `oc_zone_description` VALUES (2282,1,'Kachin State');
INSERT INTO `oc_zone_description` VALUES (519,1,'Kadiogo');
INSERT INTO `oc_zone_description` VALUES (2406,1,'Kaduna');
INSERT INTO `oc_zone_description` VALUES (1022,1,'Kafr ash Shaykh');
INSERT INTO `oc_zone_description` VALUES (1673,1,'Kagawa');
INSERT INTO `oc_zone_description` VALUES (3167,1,'Kagera');
INSERT INTO `oc_zone_description` VALUES (1674,1,'Kagoshima');
INSERT INTO `oc_zone_description` VALUES (3356,1,'Kahramanmaraş');
INSERT INTO `oc_zone_description` VALUES (3298,1,'Kairouan');
INSERT INTO `oc_zone_description` VALUES (1247,1,'Kakheti');
INSERT INTO `oc_zone_description` VALUES (3424,1,'Kalangala');
INSERT INTO `oc_zone_description` VALUES (3202,1,'Kalasin');
INSERT INTO `oc_zone_description` VALUES (235,1,'Kalbacar');
INSERT INTO `oc_zone_description` VALUES (1518,1,'Kalimantan Barat');
INSERT INTO `oc_zone_description` VALUES (1519,1,'Kalimantan Selatan');
INSERT INTO `oc_zone_description` VALUES (1520,1,'Kalimantan Tengah');
INSERT INTO `oc_zone_description` VALUES (1521,1,'Kalimantan Timur');
INSERT INTO `oc_zone_description` VALUES (1511,1,'Kalimantan Utara');
INSERT INTO `oc_zone_description` VALUES (2588,1,'Kalinga');
INSERT INTO `oc_zone_description` VALUES (4295,1,'Kaliningrad Oblast');
INSERT INTO `oc_zone_description` VALUES (2031,1,'Kalkara');
INSERT INTO `oc_zone_description` VALUES (3081,1,'Kalmar');
INSERT INTO `oc_zone_description` VALUES (4264,1,'Kalmykia, Republic of');
INSERT INTO `oc_zone_description` VALUES (4296,1,'Kaluga Oblast');
INSERT INTO `oc_zone_description` VALUES (4297,1,'Kamchatka Krai');
INSERT INTO `oc_zone_description` VALUES (3425,1,'Kampala');
INSERT INTO `oc_zone_description` VALUES (3203,1,'Kamphaeng Phet');
INSERT INTO `oc_zone_description` VALUES (573,1,'Kampong Cham');
INSERT INTO `oc_zone_description` VALUES (574,1,'Kampong Chhnang');
INSERT INTO `oc_zone_description` VALUES (576,1,'Kampong Som');
INSERT INTO `oc_zone_description` VALUES (575,1,'Kampong Speu');
INSERT INTO `oc_zone_description` VALUES (577,1,'Kampong Thom');
INSERT INTO `oc_zone_description` VALUES (578,1,'Kampot');
INSERT INTO `oc_zone_description` VALUES (3442,1,'Kamuli');
INSERT INTO `oc_zone_description` VALUES (3470,1,'Kamwenge');
INSERT INTO `oc_zone_description` VALUES (1675,1,'Kanagawa');
INSERT INTO `oc_zone_description` VALUES (3204,1,'Kanchanaburi');
INSERT INTO `oc_zone_description` VALUES (14,1,'Kandahar');
INSERT INTO `oc_zone_description` VALUES (579,1,'Kandal');
INSERT INTO `oc_zone_description` VALUES (4106,1,'Kandavas novads');
INSERT INTO `oc_zone_description` VALUES (662,1,'Kanem');
INSERT INTO `oc_zone_description` VALUES (1767,1,'Kangwon-do');
INSERT INTO `oc_zone_description` VALUES (1233,1,'Kanifeng');
INSERT INTO `oc_zone_description` VALUES (1340,1,'Kankan');
INSERT INTO `oc_zone_description` VALUES (2407,1,'Kano');
INSERT INTO `oc_zone_description` VALUES (3638,1,'Kansas');
INSERT INTO `oc_zone_description` VALUES (1748,1,'Kanton');
INSERT INTO `oc_zone_description` VALUES (421,1,'Kanton Sarajevo');
INSERT INTO `oc_zone_description` VALUES (3471,1,'Kanungu');
INSERT INTO `oc_zone_description` VALUES (3158,1,'Kao-hsiung city');
INSERT INTO `oc_zone_description` VALUES (3140,1,'Kao-hsiung county');
INSERT INTO `oc_zone_description` VALUES (580,1,'Kaoh Kong');
INSERT INTO `oc_zone_description` VALUES (2890,1,'Kaolack');
INSERT INTO `oc_zone_description` VALUES (3443,1,'Kapchorwa');
INSERT INTO `oc_zone_description` VALUES (15,1,'Kapisa');
INSERT INTO `oc_zone_description` VALUES (3265,1,'Kara');
INSERT INTO `oc_zone_description` VALUES (3357,1,'Karabük');
INSERT INTO `oc_zone_description` VALUES (4265,1,'Karachay-Cherkess Republic');
INSERT INTO `oc_zone_description` VALUES (3358,1,'Karaman');
INSERT INTO `oc_zone_description` VALUES (2291,1,'Karas');
INSERT INTO `oc_zone_description` VALUES (484,1,'Kardjali');
INSERT INTO `oc_zone_description` VALUES (4266,1,'Karelia, Republic of');
INSERT INTO `oc_zone_description` VALUES (851,1,'Karlovačka');
INSERT INTO `oc_zone_description` VALUES (892,1,'Karlovarský');
INSERT INTO `oc_zone_description` VALUES (2320,1,'Karnali');
INSERT INTO `oc_zone_description` VALUES (1489,1,'Karnataka');
INSERT INTO `oc_zone_description` VALUES (200,1,'Kärnten');
INSERT INTO `oc_zone_description` VALUES (1951,1,'Karonga');
INSERT INTO `oc_zone_description` VALUES (3359,1,'Kars');
INSERT INTO `oc_zone_description` VALUES (4108,1,'Kārsavas novads');
INSERT INTO `oc_zone_description` VALUES (557,1,'Karuzi');
INSERT INTO `oc_zone_description` VALUES (3818,1,'Kasai-Occidental');
INSERT INTO `oc_zone_description` VALUES (3816,1,'Kasai-Oriental');
INSERT INTO `oc_zone_description` VALUES (3472,1,'Kasese');
INSERT INTO `oc_zone_description` VALUES (3052,1,'Kassala');
INSERT INTO `oc_zone_description` VALUES (3299,1,'Kasserine');
INSERT INTO `oc_zone_description` VALUES (3360,1,'Kastamonu');
INSERT INTO `oc_zone_description` VALUES (1952,1,'Kasungu');
INSERT INTO `oc_zone_description` VALUES (3444,1,'Katakwi');
INSERT INTO `oc_zone_description` VALUES (3815,1,'Katanga');
INSERT INTO `oc_zone_description` VALUES (822,1,'Katiola');
INSERT INTO `oc_zone_description` VALUES (2408,1,'Katsina');
INSERT INTO `oc_zone_description` VALUES (1912,1,'Kaunas');
INSERT INTO `oc_zone_description` VALUES (45,1,'Kavaje');
INSERT INTO `oc_zone_description` VALUES (2292,1,'Kavango');
INSERT INTO `oc_zone_description` VALUES (2283,1,'Kayah State');
INSERT INTO `oc_zone_description` VALUES (2467,1,'Kayangel');
INSERT INTO `oc_zone_description` VALUES (558,1,'Kayanza');
INSERT INTO `oc_zone_description` VALUES (2007,1,'Kayes');
INSERT INTO `oc_zone_description` VALUES (2284,1,'Kayin State');
INSERT INTO `oc_zone_description` VALUES (3361,1,'Kayseri');
INSERT INTO `oc_zone_description` VALUES (3426,1,'Kayunga');
INSERT INTO `oc_zone_description` VALUES (570,1,'Keb');
INSERT INTO `oc_zone_description` VALUES (2409,1,'Kebbi');
INSERT INTO `oc_zone_description` VALUES (3300,1,'Kebili');
INSERT INTO `oc_zone_description` VALUES (1972,1,'Kedah');
INSERT INTO `oc_zone_description` VALUES (3301,1,'Kef');
INSERT INTO `oc_zone_description` VALUES (4117,1,'Ķeguma novads');
INSERT INTO `oc_zone_description` VALUES (4119,1,'Ķekavas novads');
INSERT INTO `oc_zone_description` VALUES (1973,1,'Kelantan');
INSERT INTO `oc_zone_description` VALUES (4298,1,'Kemerovo Oblast');
INSERT INTO `oc_zone_description` VALUES (644,1,'Kemo');
INSERT INTO `oc_zone_description` VALUES (520,1,'Kenedougou');
INSERT INTO `oc_zone_description` VALUES (2237,1,'Kenitra');
INSERT INTO `oc_zone_description` VALUES (3562,1,'Kent');
INSERT INTO `oc_zone_description` VALUES (3639,1,'Kentucky');
INSERT INTO `oc_zone_description` VALUES (1522,1,'Kepulauan Bangka Belitung');
INSERT INTO `oc_zone_description` VALUES (4235,1,'Kepulauan Riau');
INSERT INTO `oc_zone_description` VALUES (1490,1,'Kerala');
INSERT INTO `oc_zone_description` VALUES (2073,1,'Kercem');
INSERT INTO `oc_zone_description` VALUES (1234,1,'Kerewan');
INSERT INTO `oc_zone_description` VALUES (1559,1,'Kerman');
INSERT INTO `oc_zone_description` VALUES (1549,1,'Kermanshah');
INSERT INTO `oc_zone_description` VALUES (1341,1,'Kerouane');
INSERT INTO `oc_zone_description` VALUES (1593,1,'Kerry');
INSERT INTO `oc_zone_description` VALUES (432,1,'Kgalagadi');
INSERT INTO `oc_zone_description` VALUES (433,1,'Kgatleng');
INSERT INTO `oc_zone_description` VALUES (4283,1,'Khabarovsk Krai');
INSERT INTO `oc_zone_description` VALUES (4275,1,'Khakassia, Republic of');
INSERT INTO `oc_zone_description` VALUES (1807,1,'Khammouan');
INSERT INTO `oc_zone_description` VALUES (4337,1,'Khanty–Mansi Autonomous Okrug – Yugra');
INSERT INTO `oc_zone_description` VALUES (4224,1,'Kharkivska');
INSERT INTO `oc_zone_description` VALUES (3161,1,'Khatlon');
INSERT INTO `oc_zone_description` VALUES (2238,1,'Khemisset');
INSERT INTO `oc_zone_description` VALUES (92,1,'Khenchela');
INSERT INTO `oc_zone_description` VALUES (2239,1,'Khenifra');
INSERT INTO `oc_zone_description` VALUES (3487,1,'Khersonska');
INSERT INTO `oc_zone_description` VALUES (3488,1,'Khmelnytska');
INSERT INTO `oc_zone_description` VALUES (2293,1,'Khomas');
INSERT INTO `oc_zone_description` VALUES (3205,1,'Khon Kaen');
INSERT INTO `oc_zone_description` VALUES (16,1,'Khost');
INSERT INTO `oc_zone_description` VALUES (2240,1,'Khouribga');
INSERT INTO `oc_zone_description` VALUES (323,1,'Khulna');
INSERT INTO `oc_zone_description` VALUES (1552,1,'Khuzestan');
INSERT INTO `oc_zone_description` VALUES (3473,1,'Kibaale');
INSERT INTO `oc_zone_description` VALUES (3427,1,'Kiboga');
INSERT INTO `oc_zone_description` VALUES (2815,1,'Kibungo');
INSERT INTO `oc_zone_description` VALUES (2816,1,'Kibuye');
INSERT INTO `oc_zone_description` VALUES (2008,1,'Kidal');
INSERT INTO `oc_zone_description` VALUES (2817,1,'Kigali Rurale');
INSERT INTO `oc_zone_description` VALUES (2818,1,'Kigali-ville');
INSERT INTO `oc_zone_description` VALUES (3168,1,'Kigoma');
INSERT INTO `oc_zone_description` VALUES (1594,1,'Kildare');
INSERT INTO `oc_zone_description` VALUES (2097,1,'Kili');
INSERT INTO `oc_zone_description` VALUES (3169,1,'Kilimanjaro');
INSERT INTO `oc_zone_description` VALUES (3362,1,'Kilis');
INSERT INTO `oc_zone_description` VALUES (1595,1,'Kilkenny');
INSERT INTO `oc_zone_description` VALUES (3141,1,'Kin-men');
INSERT INTO `oc_zone_description` VALUES (1342,1,'Kindia');
INSERT INTO `oc_zone_description` VALUES (3682,1,'Kingman Reef');
INSERT INTO `oc_zone_description` VALUES (1645,1,'Kingston Parish');
INSERT INTO `oc_zone_description` VALUES (3817,1,'Kinshasa');
INSERT INTO `oc_zone_description` VALUES (1749,1,'Kiritimati');
INSERT INTO `oc_zone_description` VALUES (2032,1,'Kirkop');
INSERT INTO `oc_zone_description` VALUES (1584,1,'Kirkuk');
INSERT INTO `oc_zone_description` VALUES (4299,1,'Kirov Oblast');
INSERT INTO `oc_zone_description` VALUES (3489,1,'Kirovohradska');
INSERT INTO `oc_zone_description` VALUES (559,1,'Kirundo');
INSERT INTO `oc_zone_description` VALUES (3474,1,'Kisoro');
INSERT INTO `oc_zone_description` VALUES (1343,1,'Kissidougou');
INSERT INTO `oc_zone_description` VALUES (1295,1,'Kitaa');
INSERT INTO `oc_zone_description` VALUES (3456,1,'Kitgum');
INSERT INTO `oc_zone_description` VALUES (3363,1,'Kırıkkale');
INSERT INTO `oc_zone_description` VALUES (3364,1,'Kırklareli');
INSERT INTO `oc_zone_description` VALUES (3365,1,'Kırşehir');
INSERT INTO `oc_zone_description` VALUES (1913,1,'Klaipeda');
INSERT INTO `oc_zone_description` VALUES (3366,1,'Kocaeli');
INSERT INTO `oc_zone_description` VALUES (1676,1,'Kochi');
INSERT INTO `oc_zone_description` VALUES (2410,1,'Kogi');
INSERT INTO `oc_zone_description` VALUES (1554,1,'Kohkiluyeh and Buyer Ahmad');
INSERT INTO `oc_zone_description` VALUES (4110,1,'Kokneses novads');
INSERT INTO `oc_zone_description` VALUES (3981,1,'Kolašin');
INSERT INTO `oc_zone_description` VALUES (2891,1,'Kolda');
INSERT INTO `oc_zone_description` VALUES (2000,1,'Kolhumadulu');
INSERT INTO `oc_zone_description` VALUES (40,1,'Kolonje');
INSERT INTO `oc_zone_description` VALUES (4003,1,'Kolubara');
INSERT INTO `oc_zone_description` VALUES (4457,1,'Komárom-Esztergom');
INSERT INTO `oc_zone_description` VALUES (4267,1,'Komi Republic');
INSERT INTO `oc_zone_description` VALUES (521,1,'Komondjari');
INSERT INTO `oc_zone_description` VALUES (522,1,'Kompienga');
INSERT INTO `oc_zone_description` VALUES (17,1,'Konar');
INSERT INTO `oc_zone_description` VALUES (18,1,'Kondoz');
INSERT INTO `oc_zone_description` VALUES (3367,1,'Konya');
INSERT INTO `oc_zone_description` VALUES (852,1,'Koprivničko-križevačka');
INSERT INTO `oc_zone_description` VALUES (48,1,'Korce');
INSERT INTO `oc_zone_description` VALUES (823,1,'Korhogo');
INSERT INTO `oc_zone_description` VALUES (2468,1,'Koror');
INSERT INTO `oc_zone_description` VALUES (3958,1,'Koroška');
INSERT INTO `oc_zone_description` VALUES (2321,1,'Kosi');
INSERT INTO `oc_zone_description` VALUES (2927,1,'Košický');
INSERT INTO `oc_zone_description` VALUES (2178,1,'Kosrae');
INSERT INTO `oc_zone_description` VALUES (523,1,'Kossi');
INSERT INTO `oc_zone_description` VALUES (4300,1,'Kostroma Oblast');
INSERT INTO `oc_zone_description` VALUES (184,1,'Kotayk\'');
INSERT INTO `oc_zone_description` VALUES (3457,1,'Kotido');
INSERT INTO `oc_zone_description` VALUES (3982,1,'Kotor');
INSERT INTO `oc_zone_description` VALUES (1344,1,'Koubia');
INSERT INTO `oc_zone_description` VALUES (366,1,'Kouffo');
INSERT INTO `oc_zone_description` VALUES (760,1,'Kouilou');
INSERT INTO `oc_zone_description` VALUES (2009,1,'Koulikoro');
INSERT INTO `oc_zone_description` VALUES (524,1,'Koulpelogo');
INSERT INTO `oc_zone_description` VALUES (1345,1,'Koundara');
INSERT INTO `oc_zone_description` VALUES (525,1,'Kouritenga');
INSERT INTO `oc_zone_description` VALUES (1346,1,'Kouroussa');
INSERT INTO `oc_zone_description` VALUES (526,1,'Kourweogo');
INSERT INTO `oc_zone_description` VALUES (1414,1,'Kowloon City Kowloon');
INSERT INTO `oc_zone_description` VALUES (3206,1,'Krabi');
INSERT INTO `oc_zone_description` VALUES (893,1,'Královehradecký');
INSERT INTO `oc_zone_description` VALUES (853,1,'Krapinsko-zagorska');
INSERT INTO `oc_zone_description` VALUES (4112,1,'Krāslavas novads');
INSERT INTO `oc_zone_description` VALUES (4279,1,'Krasnodar Krai');
INSERT INTO `oc_zone_description` VALUES (4280,1,'Krasnoyarsk Krai');
INSERT INTO `oc_zone_description` VALUES (581,1,'Kratie');
INSERT INTO `oc_zone_description` VALUES (4113,1,'Krimuldas novads');
INSERT INTO `oc_zone_description` VALUES (3082,1,'Kronoberg');
INSERT INTO `oc_zone_description` VALUES (49,1,'Kruje');
INSERT INTO `oc_zone_description` VALUES (4114,1,'Krustpils novads');
INSERT INTO `oc_zone_description` VALUES (1985,1,'Kuala Lumpur');
INSERT INTO `oc_zone_description` VALUES (47,1,'Kucove');
INSERT INTO `oc_zone_description` VALUES (2632,1,'Kujawsko-Pomorskie');
INSERT INTO `oc_zone_description` VALUES (50,1,'Kukes');
INSERT INTO `oc_zone_description` VALUES (4116,1,'Kuldīgas novads');
INSERT INTO `oc_zone_description` VALUES (1677,1,'Kumamoto');
INSERT INTO `oc_zone_description` VALUES (3445,1,'Kumi');
INSERT INTO `oc_zone_description` VALUES (2294,1,'Kunene');
INSERT INTO `oc_zone_description` VALUES (1235,1,'Kuntaur');
INSERT INTO `oc_zone_description` VALUES (46,1,'Kurbin');
INSERT INTO `oc_zone_description` VALUES (236,1,'Kurdamir');
INSERT INTO `oc_zone_description` VALUES (1547,1,'Kurdistan');
INSERT INTO `oc_zone_description` VALUES (4301,1,'Kurgan Oblast');
INSERT INTO `oc_zone_description` VALUES (1750,1,'Kuria');
INSERT INTO `oc_zone_description` VALUES (4302,1,'Kursk Oblast');
INSERT INTO `oc_zone_description` VALUES (3368,1,'Kütahya');
INSERT INTO `oc_zone_description` VALUES (1248,1,'Kvemo Kartli');
INSERT INTO `oc_zone_description` VALUES (1420,1,'Kwai Tsing New Territories');
INSERT INTO `oc_zone_description` VALUES (2098,1,'Kwajalein');
INSERT INTO `oc_zone_description` VALUES (2411,1,'Kwara');
INSERT INTO `oc_zone_description` VALUES (2964,1,'KwaZulu-Natal');
INSERT INTO `oc_zone_description` VALUES (434,1,'Kweneng');
INSERT INTO `oc_zone_description` VALUES (1415,1,'Kwun Tong Kowloon');
INSERT INTO `oc_zone_description` VALUES (3475,1,'Kyenjojo');
INSERT INTO `oc_zone_description` VALUES (3490,1,'Kyiv');
INSERT INTO `oc_zone_description` VALUES (3491,1,'Kyivska');
INSERT INTO `oc_zone_description` VALUES (1678,1,'Kyoto');
INSERT INTO `oc_zone_description` VALUES (884,1,'Kyrenia');
INSERT INTO `oc_zone_description` VALUES (485,1,'Kyustendil');
INSERT INTO `oc_zone_description` VALUES (3883,1,'L&#39;Aquila');
INSERT INTO `oc_zone_description` VALUES (945,1,'La Altagracia');
INSERT INTO `oc_zone_description` VALUES (2193,1,'La Condamine');
INSERT INTO `oc_zone_description` VALUES (2970,1,'La Coru&ntilde;a');
INSERT INTO `oc_zone_description` VALUES (2912,1,'La Digue');
INSERT INTO `oc_zone_description` VALUES (876,1,'La Habana');
INSERT INTO `oc_zone_description` VALUES (1031,1,'La Libertad');
INSERT INTO `oc_zone_description` VALUES (2539,1,'La Libertad');
INSERT INTO `oc_zone_description` VALUES (126,1,'La Massana');
INSERT INTO `oc_zone_description` VALUES (166,1,'La Pampa');
INSERT INTO `oc_zone_description` VALUES (406,1,'La Paz');
INSERT INTO `oc_zone_description` VALUES (1032,1,'La Paz');
INSERT INTO `oc_zone_description` VALUES (1403,1,'La Paz');
INSERT INTO `oc_zone_description` VALUES (167,1,'La Rioja');
INSERT INTO `oc_zone_description` VALUES (2996,1,'La Rioja');
INSERT INTO `oc_zone_description` VALUES (2913,1,'La Riviere Anglaise');
INSERT INTO `oc_zone_description` VALUES (946,1,'La Romana');
INSERT INTO `oc_zone_description` VALUES (3884,1,'La Spezia');
INSERT INTO `oc_zone_description` VALUES (1033,1,'La Union');
INSERT INTO `oc_zone_description` VALUES (2592,1,'La Union');
INSERT INTO `oc_zone_description` VALUES (947,1,'La Vega');
INSERT INTO `oc_zone_description` VALUES (1059,1,'Laane-Virumaa (Rakvere)');
INSERT INTO `oc_zone_description` VALUES (1060,1,'Laanemaa (Haapsalu)');
INSERT INTO `oc_zone_description` VALUES (2241,1,'Laayoune');
INSERT INTO `oc_zone_description` VALUES (1347,1,'Labe');
INSERT INTO `oc_zone_description` VALUES (2841,1,'Laborie');
INSERT INTO `oc_zone_description` VALUES (1974,1,'Labuan');
INSERT INTO `oc_zone_description` VALUES (663,1,'Lac');
INSERT INTO `oc_zone_description` VALUES (238,1,'Lacin');
INSERT INTO `oc_zone_description` VALUES (4342,1,'Ladakh');
INSERT INTO `oc_zone_description` VALUES (2099,1,'Lae');
INSERT INTO `oc_zone_description` VALUES (19,1,'Laghman');
INSERT INTO `oc_zone_description` VALUES (93,1,'Laghouat');
INSERT INTO `oc_zone_description` VALUES (2412,1,'Lagos');
INSERT INTO `oc_zone_description` VALUES (2589,1,'Laguna');
INSERT INTO `oc_zone_description` VALUES (3800,1,'Lahij');
INSERT INTO `oc_zone_description` VALUES (4026,1,'Lakes');
INSERT INTO `oc_zone_description` VALUES (824,1,'Lakota');
INSERT INTO `oc_zone_description` VALUES (1491,1,'Lakshadweep');
INSERT INTO `oc_zone_description` VALUES (2540,1,'Lambayeque');
INSERT INTO `oc_zone_description` VALUES (3207,1,'Lampang');
INSERT INTO `oc_zone_description` VALUES (3208,1,'Lamphun');
INSERT INTO `oc_zone_description` VALUES (1523,1,'Lampung');
INSERT INTO `oc_zone_description` VALUES (2590,1,'Lanao del Norte');
INSERT INTO `oc_zone_description` VALUES (2591,1,'Lanao del Sur');
INSERT INTO `oc_zone_description` VALUES (3563,1,'Lancashire');
INSERT INTO `oc_zone_description` VALUES (1154,1,'Landes');
INSERT INTO `oc_zone_description` VALUES (237,1,'Lankaran');
INSERT INTO `oc_zone_description` VALUES (239,1,'Lankaran');
INSERT INTO `oc_zone_description` VALUES (1088,1,'Länsi-Suomen lääni');
INSERT INTO `oc_zone_description` VALUES (1596,1,'Laois');
INSERT INTO `oc_zone_description` VALUES (1089,1,'Lapin lääni');
INSERT INTO `oc_zone_description` VALUES (2186,1,'Lapusna');
INSERT INTO `oc_zone_description` VALUES (3739,1,'Lara');
INSERT INTO `oc_zone_description` VALUES (2242,1,'Larache');
INSERT INTO `oc_zone_description` VALUES (885,1,'Larnaca');
INSERT INTO `oc_zone_description` VALUES (2997,1,'Las Palmas');
INSERT INTO `oc_zone_description` VALUES (877,1,'Las Tunas');
INSERT INTO `oc_zone_description` VALUES (3885,1,'Latina');
INSERT INTO `oc_zone_description` VALUES (973,1,'Lautem');
INSERT INTO `oc_zone_description` VALUES (3694,1,'Lavalleja');
INSERT INTO `oc_zone_description` VALUES (3399,1,'Lebap Welayaty');
INSERT INTO `oc_zone_description` VALUES (3886,1,'Lecce');
INSERT INTO `oc_zone_description` VALUES (3887,1,'Lecco');
INSERT INTO `oc_zone_description` VALUES (3564,1,'Leicestershire');
INSERT INTO `oc_zone_description` VALUES (2659,1,'Leiria');
INSERT INTO `oc_zone_description` VALUES (1597,1,'Leitrim');
INSERT INTO `oc_zone_description` VALUES (761,1,'Lekoumou');
INSERT INTO `oc_zone_description` VALUES (1348,1,'Lelouma');
INSERT INTO `oc_zone_description` VALUES (1404,1,'Lempira');
INSERT INTO `oc_zone_description` VALUES (4303,1,'Leningrad Oblast');
INSERT INTO `oc_zone_description` VALUES (2372,1,'Leon');
INSERT INTO `oc_zone_description` VALUES (2998,1,'Leon');
INSERT INTO `oc_zone_description` VALUES (527,1,'Leraba');
INSERT INTO `oc_zone_description` VALUES (1854,1,'Leribe');
INSERT INTO `oc_zone_description` VALUES (240,1,'Lerik');
INSERT INTO `oc_zone_description` VALUES (2593,1,'Leyte');
INSERT INTO `oc_zone_description` VALUES (52,1,'Lezhe');
INSERT INTO `oc_zone_description` VALUES (388,1,'Lhuntse');
INSERT INTO `oc_zone_description` VALUES (703,1,'Liaoning');
INSERT INTO `oc_zone_description` VALUES (2100,1,'Lib');
INSERT INTO `oc_zone_description` VALUES (894,1,'Liberecký');
INSERT INTO `oc_zone_description` VALUES (677,1,'Libertador General Bernardo O\'Higgins');
INSERT INTO `oc_zone_description` VALUES (51,1,'Librazhd');
INSERT INTO `oc_zone_description` VALUES (854,1,'Ličko-senjska');
INSERT INTO `oc_zone_description` VALUES (347,1,'Liège');
INSERT INTO `oc_zone_description` VALUES (4121,1,'Lielvārdes novads');
INSERT INTO `oc_zone_description` VALUES (3142,1,'Lien-chiang');
INSERT INTO `oc_zone_description` VALUES (4122,1,'Liepāja');
INSERT INTO `oc_zone_description` VALUES (4126,1,'Līgatnes novads');
INSERT INTO `oc_zone_description` VALUES (2033,1,'Lija');
INSERT INTO `oc_zone_description` VALUES (2101,1,'Likiep');
INSERT INTO `oc_zone_description` VALUES (1953,1,'Likoma');
INSERT INTO `oc_zone_description` VALUES (762,1,'Likouala');
INSERT INTO `oc_zone_description` VALUES (1954,1,'Lilongwe');
INSERT INTO `oc_zone_description` VALUES (2541,1,'Lima');
INSERT INTO `oc_zone_description` VALUES (886,1,'Limassol');
INSERT INTO `oc_zone_description` VALUES (4124,1,'Limbažu novads');
INSERT INTO `oc_zone_description` VALUES (348,1,'Limburg');
INSERT INTO `oc_zone_description` VALUES (2334,1,'Limburg');
INSERT INTO `oc_zone_description` VALUES (1598,1,'Limerick');
INSERT INTO `oc_zone_description` VALUES (786,1,'Limon');
INSERT INTO `oc_zone_description` VALUES (2965,1,'Limpopo');
INSERT INTO `oc_zone_description` VALUES (3565,1,'Lincolnshire');
INSERT INTO `oc_zone_description` VALUES (3170,1,'Lindi');
INSERT INTO `oc_zone_description` VALUES (4304,1,'Lipetsk Oblast');
INSERT INTO `oc_zone_description` VALUES (974,1,'Liquica');
INSERT INTO `oc_zone_description` VALUES (3458,1,'Lira');
INSERT INTO `oc_zone_description` VALUES (2660,1,'Lisboa');
INSERT INTO `oc_zone_description` VALUES (3404,1,'Little Water Cay');
INSERT INTO `oc_zone_description` VALUES (367,1,'Littoral');
INSERT INTO `oc_zone_description` VALUES (596,1,'Littoral');
INSERT INTO `oc_zone_description` VALUES (4128,1,'Līvānu novads');
INSERT INTO `oc_zone_description` VALUES (3888,1,'Livorno');
INSERT INTO `oc_zone_description` VALUES (2999,1,'Lleida');
INSERT INTO `oc_zone_description` VALUES (645,1,'Lobaye');
INSERT INTO `oc_zone_description` VALUES (3889,1,'Lodi');
INSERT INTO `oc_zone_description` VALUES (2633,1,'Lodzkie');
INSERT INTO `oc_zone_description` VALUES (3209,1,'Loei');
INSERT INTO `oc_zone_description` VALUES (1868,1,'Lofa');
INSERT INTO `oc_zone_description` VALUES (664,1,'Logone Occidental');
INSERT INTO `oc_zone_description` VALUES (665,1,'Logone Oriental');
INSERT INTO `oc_zone_description` VALUES (1155,1,'Loir et Cher');
INSERT INTO `oc_zone_description` VALUES (1156,1,'Loire');
INSERT INTO `oc_zone_description` VALUES (1158,1,'Loire Atlantique');
INSERT INTO `oc_zone_description` VALUES (1159,1,'Loiret');
INSERT INTO `oc_zone_description` VALUES (990,1,'Loja');
INSERT INTO `oc_zone_description` VALUES (1349,1,'Lola');
INSERT INTO `oc_zone_description` VALUES (300,1,'Long Island');
INSERT INTO `oc_zone_description` VALUES (1599,1,'Longford');
INSERT INTO `oc_zone_description` VALUES (3210,1,'Lop Buri');
INSERT INTO `oc_zone_description` VALUES (1551,1,'Lorestan');
INSERT INTO `oc_zone_description` VALUES (2542,1,'Loreto');
INSERT INTO `oc_zone_description` VALUES (528,1,'Loroum');
INSERT INTO `oc_zone_description` VALUES (185,1,'Lorri');
INSERT INTO `oc_zone_description` VALUES (678,1,'Los Lagos');
INSERT INTO `oc_zone_description` VALUES (991,1,'Los Rios');
INSERT INTO `oc_zone_description` VALUES (4223,1,'Los Rios');
INSERT INTO `oc_zone_description` VALUES (2485,1,'Los Santos');
INSERT INTO `oc_zone_description` VALUES (1160,1,'Lot');
INSERT INTO `oc_zone_description` VALUES (1161,1,'Lot et Garonne');
INSERT INTO `oc_zone_description` VALUES (1808,1,'Louang Namtha');
INSERT INTO `oc_zone_description` VALUES (1809,1,'Louangphabang');
INSERT INTO `oc_zone_description` VALUES (2892,1,'Louga');
INSERT INTO `oc_zone_description` VALUES (3640,1,'Louisiana');
INSERT INTO `oc_zone_description` VALUES (1600,1,'Louth');
INSERT INTO `oc_zone_description` VALUES (486,1,'Lovech');
INSERT INTO `oc_zone_description` VALUES (1237,1,'Lower River');
INSERT INTO `oc_zone_description` VALUES (20,1,'Lowgar');
INSERT INTO `oc_zone_description` VALUES (1162,1,'Loz&egrave;re');
INSERT INTO `oc_zone_description` VALUES (139,1,'Luanda');
INSERT INTO `oc_zone_description` VALUES (3826,1,'Luapula');
INSERT INTO `oc_zone_description` VALUES (4130,1,'Lubānas novads');
INSERT INTO `oc_zone_description` VALUES (2634,1,'Lubelskie');
INSERT INTO `oc_zone_description` VALUES (3071,1,'Lubombo');
INSERT INTO `oc_zone_description` VALUES (2635,1,'Lubuskie');
INSERT INTO `oc_zone_description` VALUES (3890,1,'Lucca');
INSERT INTO `oc_zone_description` VALUES (4132,1,'Ludzas novads');
INSERT INTO `oc_zone_description` VALUES (3000,1,'Lugo');
INSERT INTO `oc_zone_description` VALUES (3492,1,'Luhanska');
INSERT INTO `oc_zone_description` VALUES (2322,1,'Lumbini');
INSERT INTO `oc_zone_description` VALUES (140,1,'Lunda Norte');
INSERT INTO `oc_zone_description` VALUES (141,1,'Lunda Sul');
INSERT INTO `oc_zone_description` VALUES (2034,1,'Luqa');
INSERT INTO `oc_zone_description` VALUES (3827,1,'Lusaka');
INSERT INTO `oc_zone_description` VALUES (53,1,'Lushnje');
INSERT INTO `oc_zone_description` VALUES (3428,1,'Luwero');
INSERT INTO `oc_zone_description` VALUES (349,1,'Luxembourg');
INSERT INTO `oc_zone_description` VALUES (1929,1,'Luxembourg');
INSERT INTO `oc_zone_description` VALUES (3106,1,'Luzern');
INSERT INTO `oc_zone_description` VALUES (3493,1,'Lvivska');
INSERT INTO `oc_zone_description` VALUES (98,1,'M\'Sila');
INSERT INTO `oc_zone_description` VALUES (1714,1,'Ma\'an');
INSERT INTO `oc_zone_description` VALUES (3801,1,'Ma\'rib');
INSERT INTO `oc_zone_description` VALUES (1991,1,'Maalhosmadulu Dhekunu');
INSERT INTO `oc_zone_description` VALUES (1990,1,'Maalhosmadulu Uthuru');
INSERT INTO `oc_zone_description` VALUES (704,1,'Macau');
INSERT INTO `oc_zone_description` VALUES (1350,1,'Macenta');
INSERT INTO `oc_zone_description` VALUES (3891,1,'Macerata');
INSERT INTO `oc_zone_description` VALUES (1955,1,'Machinga');
INSERT INTO `oc_zone_description` VALUES (4002,1,'Mačva');
INSERT INTO `oc_zone_description` VALUES (1715,1,'Madaba');
INSERT INTO `oc_zone_description` VALUES (2497,1,'Madang');
INSERT INTO `oc_zone_description` VALUES (2661,1,'Madeira');
INSERT INTO `oc_zone_description` VALUES (1492,1,'Madhya Pradesh');
INSERT INTO `oc_zone_description` VALUES (2676,1,'Madinat ash Shamal');
INSERT INTO `oc_zone_description` VALUES (4134,1,'Madonas novads');
INSERT INTO `oc_zone_description` VALUES (2543,1,'Madre de Dios');
INSERT INTO `oc_zone_description` VALUES (3001,1,'Madrid');
INSERT INTO `oc_zone_description` VALUES (2373,1,'Madriz');
INSERT INTO `oc_zone_description` VALUES (3211,1,'Mae Hong Son');
INSERT INTO `oc_zone_description` VALUES (1855,1,'Mafeteng');
INSERT INTO `oc_zone_description` VALUES (4305,1,'Magadan Oblast');
INSERT INTO `oc_zone_description` VALUES (679,1,'Magallanes y de la Antartica Chilena');
INSERT INTO `oc_zone_description` VALUES (739,1,'Magdalena');
INSERT INTO `oc_zone_description` VALUES (2594,1,'Maguindanao');
INSERT INTO `oc_zone_description` VALUES (2276,1,'Magway');
INSERT INTO `oc_zone_description` VALUES (3212,1,'Maha Sarakham');
INSERT INTO `oc_zone_description` VALUES (1374,1,'Mahaica-Berbice');
INSERT INTO `oc_zone_description` VALUES (1941,1,'Mahajanga');
INSERT INTO `oc_zone_description` VALUES (2323,1,'Mahakali');
INSERT INTO `oc_zone_description` VALUES (1493,1,'Maharashtra');
INSERT INTO `oc_zone_description` VALUES (3302,1,'Mahdia');
INSERT INTO `oc_zone_description` VALUES (341,1,'Mahilyowskaya (Mahilyow)');
INSERT INTO `oc_zone_description` VALUES (1751,1,'Maiana');
INSERT INTO `oc_zone_description` VALUES (3641,1,'Maine');
INSERT INTO `oc_zone_description` VALUES (1163,1,'Maine et Loire');
INSERT INTO `oc_zone_description` VALUES (618,1,'Maio');
INSERT INTO `oc_zone_description` VALUES (2102,1,'Majuro');
INSERT INTO `oc_zone_description` VALUES (560,1,'Makamba');
INSERT INTO `oc_zone_description` VALUES (1752,1,'Makin');
INSERT INTO `oc_zone_description` VALUES (2938,1,'Makira');
INSERT INTO `oc_zone_description` VALUES (2884,1,'Makkah');
INSERT INTO `oc_zone_description` VALUES (3002,1,'Malaga');
INSERT INTO `oc_zone_description` VALUES (2939,1,'Malaita');
INSERT INTO `oc_zone_description` VALUES (3720,1,'Malampa');
INSERT INTO `oc_zone_description` VALUES (142,1,'Malange');
INSERT INTO `oc_zone_description` VALUES (3369,1,'Malatya');
INSERT INTO `oc_zone_description` VALUES (3695,1,'Maldonado');
INSERT INTO `oc_zone_description` VALUES (1993,1,'Male Atoll');
INSERT INTO `oc_zone_description` VALUES (54,1,'Malesi e Madhe');
INSERT INTO `oc_zone_description` VALUES (1351,1,'Mali');
INSERT INTO `oc_zone_description` VALUES (55,1,'Mallakaster');
INSERT INTO `oc_zone_description` VALUES (2103,1,'Maloelap');
INSERT INTO `oc_zone_description` VALUES (2636,1,'Malopolskie');
INSERT INTO `oc_zone_description` VALUES (4137,1,'Mālpils novads');
INSERT INTO `oc_zone_description` VALUES (1524,1,'Maluku');
INSERT INTO `oc_zone_description` VALUES (1525,1,'Maluku Utara');
INSERT INTO `oc_zone_description` VALUES (646,1,'Mambere-KadeÔ');
INSERT INTO `oc_zone_description` VALUES (1352,1,'Mamou');
INSERT INTO `oc_zone_description` VALUES (825,1,'Man');
INSERT INTO `oc_zone_description` VALUES (992,1,'Manab&iacute;');
INSERT INTO `oc_zone_description` VALUES (2374,1,'Managua');
INSERT INTO `oc_zone_description` VALUES (975,1,'Manatuto');
INSERT INTO `oc_zone_description` VALUES (2352,1,'Manawatu-Wanganui');
INSERT INTO `oc_zone_description` VALUES (1164,1,'Manche');
INSERT INTO `oc_zone_description` VALUES (1646,1,'Manchester Parish');
INSERT INTO `oc_zone_description` VALUES (2277,1,'Mandalay');
INSERT INTO `oc_zone_description` VALUES (1353,1,'Mandiana');
INSERT INTO `oc_zone_description` VALUES (781,1,'Mangaia');
INSERT INTO `oc_zone_description` VALUES (1724,1,'Mangghystau');
INSERT INTO `oc_zone_description` VALUES (1956,1,'Mangochi');
INSERT INTO `oc_zone_description` VALUES (301,1,'Mangrove Cay');
INSERT INTO `oc_zone_description` VALUES (2266,1,'Manica');
INSERT INTO `oc_zone_description` VALUES (3834,1,'Manicaland');
INSERT INTO `oc_zone_description` VALUES (3819,1,'Maniema');
INSERT INTO `oc_zone_description` VALUES (769,1,'Manihiki');
INSERT INTO `oc_zone_description` VALUES (1494,1,'Manipur');
INSERT INTO `oc_zone_description` VALUES (3370,1,'Manisa');
INSERT INTO `oc_zone_description` VALUES (604,1,'Manitoba');
INSERT INTO `oc_zone_description` VALUES (826,1,'Mankono');
INSERT INTO `oc_zone_description` VALUES (3303,1,'Manouba');
INSERT INTO `oc_zone_description` VALUES (1236,1,'Mansakonko');
INSERT INTO `oc_zone_description` VALUES (3892,1,'Mantova');
INSERT INTO `oc_zone_description` VALUES (118,1,'Manu\'a');
INSERT INTO `oc_zone_description` VALUES (775,1,'Manuae');
INSERT INTO `oc_zone_description` VALUES (976,1,'Manufahi');
INSERT INTO `oc_zone_description` VALUES (2498,1,'Manus');
INSERT INTO `oc_zone_description` VALUES (3171,1,'Manyara');
INSERT INTO `oc_zone_description` VALUES (3072,1,'Manzini');
INSERT INTO `oc_zone_description` VALUES (2268,1,'Maputo');
INSERT INTO `oc_zone_description` VALUES (2267,1,'Maputo (city)');
INSERT INTO `oc_zone_description` VALUES (3172,1,'Mara');
INSERT INTO `oc_zone_description` VALUES (2383,1,'Maradi');
INSERT INTO `oc_zone_description` VALUES (1753,1,'Marakei');
INSERT INTO `oc_zone_description` VALUES (2705,1,'Maramureș');
INSERT INTO `oc_zone_description` VALUES (449,1,'Maranhão');
INSERT INTO `oc_zone_description` VALUES (3371,1,'Mardin');
INSERT INTO `oc_zone_description` VALUES (1869,1,'Margibi');
INSERT INTO `oc_zone_description` VALUES (4268,1,'Mari El Republic');
INSERT INTO `oc_zone_description` VALUES (948,1,'Maria Trinidad Sanchez');
INSERT INTO `oc_zone_description` VALUES (1914,1,'Marijampole');
INSERT INTO `oc_zone_description` VALUES (2595,1,'Marinduque');
INSERT INTO `oc_zone_description` VALUES (3269,1,'Maritime');
INSERT INTO `oc_zone_description` VALUES (1540,1,'Markazi');
INSERT INTO `oc_zone_description` VALUES (2351,1,'Marlborough');
INSERT INTO `oc_zone_description` VALUES (1165,1,'Marne');
INSERT INTO `oc_zone_description` VALUES (3063,1,'Marowijne');
INSERT INTO `oc_zone_description` VALUES (2243,1,'Marrakech');
INSERT INTO `oc_zone_description` VALUES (2035,1,'Marsa');
INSERT INTO `oc_zone_description` VALUES (2036,1,'Marsaskala');
INSERT INTO `oc_zone_description` VALUES (2037,1,'Marsaxlokk');
INSERT INTO `oc_zone_description` VALUES (3642,1,'Marshall Islands');
INSERT INTO `oc_zone_description` VALUES (4138,1,'Mārupes novads');
INSERT INTO `oc_zone_description` VALUES (3400,1,'Mary Welayaty');
INSERT INTO `oc_zone_description` VALUES (1870,1,'Maryland');
INSERT INTO `oc_zone_description` VALUES (3643,1,'Maryland');
INSERT INTO `oc_zone_description` VALUES (3429,1,'Masaka');
INSERT INTO `oc_zone_description` VALUES (241,1,'Masalli');
INSERT INTO `oc_zone_description` VALUES (2375,1,'Masaya');
INSERT INTO `oc_zone_description` VALUES (2596,1,'Masbate');
INSERT INTO `oc_zone_description` VALUES (94,1,'Mascara');
INSERT INTO `oc_zone_description` VALUES (1856,1,'Maseru');
INSERT INTO `oc_zone_description` VALUES (3835,1,'Mashonaland Central');
INSERT INTO `oc_zone_description` VALUES (3836,1,'Mashonaland East');
INSERT INTO `oc_zone_description` VALUES (3837,1,'Mashonaland West');
INSERT INTO `oc_zone_description` VALUES (3476,1,'Masindi');
INSERT INTO `oc_zone_description` VALUES (2454,1,'Masqat');
INSERT INTO `oc_zone_description` VALUES (3893,1,'Massa-Carrara');
INSERT INTO `oc_zone_description` VALUES (3644,1,'Massachusetts');
INSERT INTO `oc_zone_description` VALUES (3838,1,'Masvingo');
INSERT INTO `oc_zone_description` VALUES (56,1,'Mat');
INSERT INTO `oc_zone_description` VALUES (3839,1,'Matabeleland North');
INSERT INTO `oc_zone_description` VALUES (3840,1,'Matabeleland South');
INSERT INTO `oc_zone_description` VALUES (2376,1,'Matagalpa');
INSERT INTO `oc_zone_description` VALUES (2893,1,'Matam');
INSERT INTO `oc_zone_description` VALUES (878,1,'Matanzas');
INSERT INTO `oc_zone_description` VALUES (3894,1,'Matera');
INSERT INTO `oc_zone_description` VALUES (450,1,'Mato Grosso');
INSERT INTO `oc_zone_description` VALUES (451,1,'Mato Grosso do Sul');
INSERT INTO `oc_zone_description` VALUES (1023,1,'Matruh');
INSERT INTO `oc_zone_description` VALUES (779,1,'Mauke');
INSERT INTO `oc_zone_description` VALUES (680,1,'Maule');
INSERT INTO `oc_zone_description` VALUES (1905,1,'Mauren');
INSERT INTO `oc_zone_description` VALUES (302,1,'Mayaguana');
INSERT INTO `oc_zone_description` VALUES (3278,1,'Mayaro/Rio Claro');
INSERT INTO `oc_zone_description` VALUES (1167,1,'Mayenne');
INSERT INTO `oc_zone_description` VALUES (1601,1,'Mayo');
INSERT INTO `oc_zone_description` VALUES (666,1,'Mayo-Kebbi');
INSERT INTO `oc_zone_description` VALUES (1572,1,'Maysan');
INSERT INTO `oc_zone_description` VALUES (3446,1,'Mayuge');
INSERT INTO `oc_zone_description` VALUES (1563,1,'Mazandaran');
INSERT INTO `oc_zone_description` VALUES (2637,1,'Mazowieckie');
INSERT INTO `oc_zone_description` VALUES (4136,1,'Mazsalacas novads');
INSERT INTO `oc_zone_description` VALUES (827,1,'Mbahiakro');
INSERT INTO `oc_zone_description` VALUES (3447,1,'Mbale');
INSERT INTO `oc_zone_description` VALUES (3477,1,'Mbarara');
INSERT INTO `oc_zone_description` VALUES (3173,1,'Mbeya');
INSERT INTO `oc_zone_description` VALUES (647,1,'Mbomou');
INSERT INTO `oc_zone_description` VALUES (1389,1,'McDonald Island');
INSERT INTO `oc_zone_description` VALUES (1957,1,'Mchinji');
INSERT INTO `oc_zone_description` VALUES (2038,1,'Mdina');
INSERT INTO `oc_zone_description` VALUES (1602,1,'Meath');
INSERT INTO `oc_zone_description` VALUES (2324,1,'Mechi');
INSERT INTO `oc_zone_description` VALUES (1261,1,'Mecklenburg-Vorpommern');
INSERT INTO `oc_zone_description` VALUES (95,1,'Medea');
INSERT INTO `oc_zone_description` VALUES (3304,1,'Medenine');
INSERT INTO `oc_zone_description` VALUES (855,1,'Međimurska');
INSERT INTO `oc_zone_description` VALUES (1495,1,'Meghalaya');
INSERT INTO `oc_zone_description` VALUES (2706,1,'Mehedinți');
INSERT INTO `oc_zone_description` VALUES (2104,1,'Mejit');
INSERT INTO `oc_zone_description` VALUES (2244,1,'Meknes');
INSERT INTO `oc_zone_description` VALUES (1975,1,'Melaka');
INSERT INTO `oc_zone_description` VALUES (2469,1,'Melekeok');
INSERT INTO `oc_zone_description` VALUES (3003,1,'Melilla');
INSERT INTO `oc_zone_description` VALUES (2039,1,'Melliea');
INSERT INTO `oc_zone_description` VALUES (168,1,'Mendoza');
INSERT INTO `oc_zone_description` VALUES (2311,1,'Meneng');
INSERT INTO `oc_zone_description` VALUES (3740,1,'Merida');
INSERT INTO `oc_zone_description` VALUES (1932,1,'Mersch');
INSERT INTO `oc_zone_description` VALUES (3566,1,'Merseyside');
INSERT INTO `oc_zone_description` VALUES (3372,1,'Mersin');
INSERT INTO `oc_zone_description` VALUES (4139,1,'Mērsraga novads');
INSERT INTO `oc_zone_description` VALUES (3567,1,'Merthyr Tydfil');
INSERT INTO `oc_zone_description` VALUES (3896,1,'Messina');
INSERT INTO `oc_zone_description` VALUES (740,1,'Meta');
INSERT INTO `oc_zone_description` VALUES (1168,1,'Meurthe et Moselle');
INSERT INTO `oc_zone_description` VALUES (1169,1,'Meuse');
INSERT INTO `oc_zone_description` VALUES (2159,1,'Mexico');
INSERT INTO `oc_zone_description` VALUES (2040,1,'Mgarr');
INSERT INTO `oc_zone_description` VALUES (3143,1,'Miao-li');
INSERT INTO `oc_zone_description` VALUES (3645,1,'Michigan');
INSERT INTO `oc_zone_description` VALUES (2160,1,'Michoacan de Ocampo');
INSERT INTO `oc_zone_description` VALUES (2842,1,'Micoud');
INSERT INTO `oc_zone_description` VALUES (3411,1,'Middle Caicos');
INSERT INTO `oc_zone_description` VALUES (634,1,'Midland');
INSERT INTO `oc_zone_description` VALUES (3841,1,'Midlands');
INSERT INTO `oc_zone_description` VALUES (3568,1,'Midlothian');
INSERT INTO `oc_zone_description` VALUES (904,1,'Midtjylland');
INSERT INTO `oc_zone_description` VALUES (3683,1,'Midway Atoll');
INSERT INTO `oc_zone_description` VALUES (1679,1,'Mie');
INSERT INTO `oc_zone_description` VALUES (96,1,'Mila');
INSERT INTO `oc_zone_description` VALUES (1989,1,'Miladhunmadulu Dhekunu');
INSERT INTO `oc_zone_description` VALUES (1988,1,'Miladhunmadulu Uthuru');
INSERT INTO `oc_zone_description` VALUES (3897,1,'Milano');
INSERT INTO `oc_zone_description` VALUES (2105,1,'Mili');
INSERT INTO `oc_zone_description` VALUES (2499,1,'Milne Bay');
INSERT INTO `oc_zone_description` VALUES (452,1,'Minas Gerais');
INSERT INTO `oc_zone_description` VALUES (2597,1,'Mindoro Occidental');
INSERT INTO `oc_zone_description` VALUES (2598,1,'Mindoro Oriental');
INSERT INTO `oc_zone_description` VALUES (242,1,'Mingacevir');
INSERT INTO `oc_zone_description` VALUES (3646,1,'Minnesota');
INSERT INTO `oc_zone_description` VALUES (342,1,'Minskaya');
INSERT INTO `oc_zone_description` VALUES (2648,1,'Miquelon');
INSERT INTO `oc_zone_description` VALUES (3741,1,'Miranda');
INSERT INTO `oc_zone_description` VALUES (57,1,'Mirdite');
INSERT INTO `oc_zone_description` VALUES (2599,1,'Misamis Occidental');
INSERT INTO `oc_zone_description` VALUES (2600,1,'Misamis Oriental');
INSERT INTO `oc_zone_description` VALUES (169,1,'Misiones');
INSERT INTO `oc_zone_description` VALUES (2522,1,'Misiones');
INSERT INTO `oc_zone_description` VALUES (1890,1,'Misratah');
INSERT INTO `oc_zone_description` VALUES (3647,1,'Mississippi');
INSERT INTO `oc_zone_description` VALUES (3648,1,'Missouri');
INSERT INTO `oc_zone_description` VALUES (777,1,'Mitiaro');
INSERT INTO `oc_zone_description` VALUES (1680,1,'Miyagi');
INSERT INTO `oc_zone_description` VALUES (1681,1,'Miyazaki');
INSERT INTO `oc_zone_description` VALUES (1496,1,'Mizoram');
INSERT INTO `oc_zone_description` VALUES (3898,1,'Modena');
INSERT INTO `oc_zone_description` VALUES (1857,1,'Mohale\'s Hoek');
INSERT INTO `oc_zone_description` VALUES (755,1,'Moheli');
INSERT INTO `oc_zone_description` VALUES (3983,1,'Mojkovac');
INSERT INTO `oc_zone_description` VALUES (2140,1,'Moka');
INSERT INTO `oc_zone_description` VALUES (1858,1,'Mokhotlong');
INSERT INTO `oc_zone_description` VALUES (2285,1,'Mon State');
INSERT INTO `oc_zone_description` VALUES (2194,1,'Monaco-Ville');
INSERT INTO `oc_zone_description` VALUES (3742,1,'Monagas');
INSERT INTO `oc_zone_description` VALUES (1603,1,'Monaghan');
INSERT INTO `oc_zone_description` VALUES (3305,1,'Monastir');
INSERT INTO `oc_zone_description` VALUES (582,1,'Mondul Kiri');
INSERT INTO `oc_zone_description` VALUES (389,1,'Mongar');
INSERT INTO `oc_zone_description` VALUES (3569,1,'Monmouthshire');
INSERT INTO `oc_zone_description` VALUES (368,1,'Mono');
INSERT INTO `oc_zone_description` VALUES (949,1,'Monsenor Nouel');
INSERT INTO `oc_zone_description` VALUES (2914,1,'Mont Buxton');
INSERT INTO `oc_zone_description` VALUES (2915,1,'Mont Fleuri');
INSERT INTO `oc_zone_description` VALUES (487,1,'Montana');
INSERT INTO `oc_zone_description` VALUES (3649,1,'Montana');
INSERT INTO `oc_zone_description` VALUES (950,1,'Monte Cristi');
INSERT INTO `oc_zone_description` VALUES (951,1,'Monte Plata');
INSERT INTO `oc_zone_description` VALUES (2195,1,'Monte-Carlo');
INSERT INTO `oc_zone_description` VALUES (2869,1,'Montegiardino');
INSERT INTO `oc_zone_description` VALUES (3696,1,'Montevideo');
INSERT INTO `oc_zone_description` VALUES (1871,1,'Montserrado');
INSERT INTO `oc_zone_description` VALUES (4238,1,'Monza Brianza');
INSERT INTO `oc_zone_description` VALUES (303,1,'Moore\'s Island');
INSERT INTO `oc_zone_description` VALUES (2010,1,'Mopti');
INSERT INTO `oc_zone_description` VALUES (2544,1,'Moquegua');
INSERT INTO `oc_zone_description` VALUES (4011,1,'Moravica');
INSERT INTO `oc_zone_description` VALUES (895,1,'Moravskoslezský');
INSERT INTO `oc_zone_description` VALUES (3570,1,'Moray');
INSERT INTO `oc_zone_description` VALUES (1034,1,'Morazan');
INSERT INTO `oc_zone_description` VALUES (1170,1,'Morbihan');
INSERT INTO `oc_zone_description` VALUES (4269,1,'Mordovia, Republic of');
INSERT INTO `oc_zone_description` VALUES (2435,1,'More og Romdal');
INSERT INTO `oc_zone_description` VALUES (2161,1,'Morelos');
INSERT INTO `oc_zone_description` VALUES (2500,1,'Morobe');
INSERT INTO `oc_zone_description` VALUES (3174,1,'Morogoro');
INSERT INTO `oc_zone_description` VALUES (993,1,'Morona Santiago');
INSERT INTO `oc_zone_description` VALUES (3459,1,'Moroto');
INSERT INTO `oc_zone_description` VALUES (4333,1,'Moscow');
INSERT INTO `oc_zone_description` VALUES (4306,1,'Moscow Oblast');
INSERT INTO `oc_zone_description` VALUES (1171,1,'Moselle');
INSERT INTO `oc_zone_description` VALUES (2041,1,'Mosta');
INSERT INTO `oc_zone_description` VALUES (97,1,'Mostaganem');
INSERT INTO `oc_zone_description` VALUES (619,1,'Mosteiros');
INSERT INTO `oc_zone_description` VALUES (529,1,'Mouhoun');
INSERT INTO `oc_zone_description` VALUES (4441,1,'Mount Athos');
INSERT INTO `oc_zone_description` VALUES (4227,1,'Mount Lebanon');
INSERT INTO `oc_zone_description` VALUES (2601,1,'Mountain');
INSERT INTO `oc_zone_description` VALUES (143,1,'Moxico');
INSERT INTO `oc_zone_description` VALUES (667,1,'Moyen-Chari');
INSERT INTO `oc_zone_description` VALUES (1222,1,'Moyen-Ogooue');
INSERT INTO `oc_zone_description` VALUES (3460,1,'Moyo');
INSERT INTO `oc_zone_description` VALUES (3430,1,'Mpigi');
INSERT INTO `oc_zone_description` VALUES (2966,1,'Mpumalanga');
INSERT INTO `oc_zone_description` VALUES (2042,1,'Mqabba');
INSERT INTO `oc_zone_description` VALUES (2043,1,'Msida');
INSERT INTO `oc_zone_description` VALUES (2353,1,'Mt Cook-Mackenzie');
INSERT INTO `oc_zone_description` VALUES (2044,1,'Mtarfa');
INSERT INTO `oc_zone_description` VALUES (1249,1,'Mtskheta-Mtianeti');
INSERT INTO `oc_zone_description` VALUES (3175,1,'Mtwara');
INSERT INTO `oc_zone_description` VALUES (3431,1,'Mubende');
INSERT INTO `oc_zone_description` VALUES (2953,1,'Mudug');
INSERT INTO `oc_zone_description` VALUES (3373,1,'Muğla');
INSERT INTO `oc_zone_description` VALUES (317,1,'Muharraq');
INSERT INTO `oc_zone_description` VALUES (3213,1,'Mukdahan');
INSERT INTO `oc_zone_description` VALUES (3432,1,'Mukono');
INSERT INTO `oc_zone_description` VALUES (1997,1,'Mulaku Atoll');
INSERT INTO `oc_zone_description` VALUES (1958,1,'Mulanje');
INSERT INTO `oc_zone_description` VALUES (2074,1,'Munxar');
INSERT INTO `oc_zone_description` VALUES (561,1,'Muramvya');
INSERT INTO `oc_zone_description` VALUES (3004,1,'Murcia');
INSERT INTO `oc_zone_description` VALUES (2707,1,'Mureș');
INSERT INTO `oc_zone_description` VALUES (4307,1,'Murmansk Oblast');
INSERT INTO `oc_zone_description` VALUES (1891,1,'Murzuq');
INSERT INTO `oc_zone_description` VALUES (3374,1,'Muş');
INSERT INTO `oc_zone_description` VALUES (2455,1,'Musandam');
INSERT INTO `oc_zone_description` VALUES (562,1,'Muyinga');
INSERT INTO `oc_zone_description` VALUES (1959,1,'Mwanza');
INSERT INTO `oc_zone_description` VALUES (3176,1,'Mwanza');
INSERT INTO `oc_zone_description` VALUES (563,1,'Mwaro');
INSERT INTO `oc_zone_description` VALUES (3494,1,'Mykolaivska');
INSERT INTO `oc_zone_description` VALUES (1960,1,'Mzimba');
INSERT INTO `oc_zone_description` VALUES (99,1,'Naama');
INSERT INTO `oc_zone_description` VALUES (4228,1,'Nabatieh');
INSERT INTO `oc_zone_description` VALUES (3306,1,'Nabeul');
INSERT INTO `oc_zone_description` VALUES (2245,1,'Nador');
INSERT INTO `oc_zone_description` VALUES (2075,1,'Nadur');
INSERT INTO `oc_zone_description` VALUES (243,1,'Naftalan');
INSERT INTO `oc_zone_description` VALUES (1497,1,'Nagaland');
INSERT INTO `oc_zone_description` VALUES (1682,1,'Nagano');
INSERT INTO `oc_zone_description` VALUES (1683,1,'Nagasaki');
INSERT INTO `oc_zone_description` VALUES (530,1,'Nahouri');
INSERT INTO `oc_zone_description` VALUES (3053,1,'Nahr an Nil');
INSERT INTO `oc_zone_description` VALUES (1736,1,'Nairobi Area');
INSERT INTO `oc_zone_description` VALUES (2885,1,'Najran');
INSERT INTO `oc_zone_description` VALUES (3461,1,'Nakapiripirit');
INSERT INTO `oc_zone_description` VALUES (3433,1,'Nakasongola');
INSERT INTO `oc_zone_description` VALUES (3214,1,'Nakhon Nayok');
INSERT INTO `oc_zone_description` VALUES (3215,1,'Nakhon Pathom');
INSERT INTO `oc_zone_description` VALUES (3216,1,'Nakhon Phanom');
INSERT INTO `oc_zone_description` VALUES (3217,1,'Nakhon Ratchasima');
INSERT INTO `oc_zone_description` VALUES (3218,1,'Nakhon Sawan');
INSERT INTO `oc_zone_description` VALUES (3219,1,'Nakhon Si Thammarat');
INSERT INTO `oc_zone_description` VALUES (3710,1,'Namangan');
INSERT INTO `oc_zone_description` VALUES (531,1,'Namentenga');
INSERT INTO `oc_zone_description` VALUES (144,1,'Namibe');
INSERT INTO `oc_zone_description` VALUES (2106,1,'Namorik');
INSERT INTO `oc_zone_description` VALUES (2269,1,'Nampula');
INSERT INTO `oc_zone_description` VALUES (2107,1,'Namu');
INSERT INTO `oc_zone_description` VALUES (350,1,'Namur');
INSERT INTO `oc_zone_description` VALUES (3220,1,'Nan');
INSERT INTO `oc_zone_description` VALUES (3144,1,'Nan-t\'ou');
INSERT INTO `oc_zone_description` VALUES (654,1,'Nana-Grebizi');
INSERT INTO `oc_zone_description` VALUES (648,1,'Nana-Mambere');
INSERT INTO `oc_zone_description` VALUES (21,1,'Nangrahar');
INSERT INTO `oc_zone_description` VALUES (3415,1,'Nanumanga');
INSERT INTO `oc_zone_description` VALUES (3419,1,'Nanumea');
INSERT INTO `oc_zone_description` VALUES (994,1,'Napo');
INSERT INTO `oc_zone_description` VALUES (3899,1,'Napoli');
INSERT INTO `oc_zone_description` VALUES (1684,1,'Nara');
INSERT INTO `oc_zone_description` VALUES (3221,1,'Narathiwat');
INSERT INTO `oc_zone_description` VALUES (2325,1,'Narayani');
INSERT INTO `oc_zone_description` VALUES (741,1,'Narino');
INSERT INTO `oc_zone_description` VALUES (1797,1,'Naryn');
INSERT INTO `oc_zone_description` VALUES (2413,1,'Nassarawa');
INSERT INTO `oc_zone_description` VALUES (771,1,'Nassau Island');
INSERT INTO `oc_zone_description` VALUES (2501,1,'National Capital');
INSERT INTO `oc_zone_description` VALUES (4140,1,'Naukšēnu novads');
INSERT INTO `oc_zone_description` VALUES (3005,1,'Navarra');
INSERT INTO `oc_zone_description` VALUES (3684,1,'Navassa Island');
INSERT INTO `oc_zone_description` VALUES (3711,1,'Navoiy');
INSERT INTO `oc_zone_description` VALUES (283,1,'Naxcivan');
INSERT INTO `oc_zone_description` VALUES (2045,1,'Naxxar');
INSERT INTO `oc_zone_description` VALUES (532,1,'Nayala');
INSERT INTO `oc_zone_description` VALUES (2162,1,'Nayarit');
INSERT INTO `oc_zone_description` VALUES (2708,1,'Neamț');
INSERT INTO `oc_zone_description` VALUES (3571,1,'Neath Port Talbot');
INSERT INTO `oc_zone_description` VALUES (3462,1,'Nebbi');
INSERT INTO `oc_zone_description` VALUES (3650,1,'Nebraska');
INSERT INTO `oc_zone_description` VALUES (2523,1,'Neembucu');
INSERT INTO `oc_zone_description` VALUES (244,1,'Neftcala');
INSERT INTO `oc_zone_description` VALUES (1976,1,'Negeri Sembilan');
INSERT INTO `oc_zone_description` VALUES (1619,1,'Negev');
INSERT INTO `oc_zone_description` VALUES (2602,1,'Negros Occidental');
INSERT INTO `oc_zone_description` VALUES (2603,1,'Negros Oriental');
INSERT INTO `oc_zone_description` VALUES (2354,1,'Nelson');
INSERT INTO `oc_zone_description` VALUES (469,1,'Nelsons Island');
INSERT INTO `oc_zone_description` VALUES (4336,1,'Nenets Autonomous Okrug');
INSERT INTO `oc_zone_description` VALUES (4141,1,'Neretas novads');
INSERT INTO `oc_zone_description` VALUES (3107,1,'Neuch&acirc;tel');
INSERT INTO `oc_zone_description` VALUES (170,1,'Neuquen');
INSERT INTO `oc_zone_description` VALUES (3651,1,'Nevada');
INSERT INTO `oc_zone_description` VALUES (3375,1,'Nevşehir');
INSERT INTO `oc_zone_description` VALUES (605,1,'New Brunswick');
INSERT INTO `oc_zone_description` VALUES (3652,1,'New Hampshire');
INSERT INTO `oc_zone_description` VALUES (2502,1,'New Ireland');
INSERT INTO `oc_zone_description` VALUES (3653,1,'New Jersey');
INSERT INTO `oc_zone_description` VALUES (3654,1,'New Mexico');
INSERT INTO `oc_zone_description` VALUES (192,1,'New South Wales');
INSERT INTO `oc_zone_description` VALUES (3655,1,'New York');
INSERT INTO `oc_zone_description` VALUES (606,1,'Newfoundland and Labrador');
INSERT INTO `oc_zone_description` VALUES (3572,1,'Newport');
INSERT INTO `oc_zone_description` VALUES (435,1,'Ngamiland');
INSERT INTO `oc_zone_description` VALUES (2470,1,'Ngaraard');
INSERT INTO `oc_zone_description` VALUES (2471,1,'Ngarchelong');
INSERT INTO `oc_zone_description` VALUES (2472,1,'Ngardmau');
INSERT INTO `oc_zone_description` VALUES (2473,1,'Ngatpang');
INSERT INTO `oc_zone_description` VALUES (2474,1,'Ngchesar');
INSERT INTO `oc_zone_description` VALUES (2475,1,'Ngeremlengui');
INSERT INTO `oc_zone_description` VALUES (2476,1,'Ngiwal');
INSERT INTO `oc_zone_description` VALUES (1223,1,'Ngounie');
INSERT INTO `oc_zone_description` VALUES (564,1,'Ngozi');
INSERT INTO `oc_zone_description` VALUES (1172,1,'Ni&egrave;vre');
INSERT INTO `oc_zone_description` VALUES (2384,1,'Niamey');
INSERT INTO `oc_zone_description` VALUES (763,1,'Niari');
INSERT INTO `oc_zone_description` VALUES (2270,1,'Niassa');
INSERT INTO `oc_zone_description` VALUES (2312,1,'Nibok');
INSERT INTO `oc_zone_description` VALUES (4142,1,'Nīcas novads');
INSERT INTO `oc_zone_description` VALUES (3064,1,'Nickerie');
INSERT INTO `oc_zone_description` VALUES (887,1,'Nicosia');
INSERT INTO `oc_zone_description` VALUES (3108,1,'Nidwald');
INSERT INTO `oc_zone_description` VALUES (201,1,'Niederösterreich');
INSERT INTO `oc_zone_description` VALUES (1262,1,'Niedersachsen');
INSERT INTO `oc_zone_description` VALUES (3376,1,'Niğde');
INSERT INTO `oc_zone_description` VALUES (2414,1,'Niger');
INSERT INTO `oc_zone_description` VALUES (1685,1,'Niigata');
INSERT INTO `oc_zone_description` VALUES (3984,1,'Nikšić');
INSERT INTO `oc_zone_description` VALUES (1754,1,'Nikunau');
INSERT INTO `oc_zone_description` VALUES (1999,1,'Nilandhe Atoll Dhekunu');
INSERT INTO `oc_zone_description` VALUES (1998,1,'Nilandhe Atoll Uthuru');
INSERT INTO `oc_zone_description` VALUES (1872,1,'Nimba');
INSERT INTO `oc_zone_description` VALUES (22,1,'Nimruz');
INSERT INTO `oc_zone_description` VALUES (1581,1,'Ninawa');
INSERT INTO `oc_zone_description` VALUES (705,1,'Ningxia');
INSERT INTO `oc_zone_description` VALUES (4014,1,'Nišava');
INSERT INTO `oc_zone_description` VALUES (2928,1,'Nitriansky');
INSERT INTO `oc_zone_description` VALUES (3416,1,'Niulakita');
INSERT INTO `oc_zone_description` VALUES (3417,1,'Niutao');
INSERT INTO `oc_zone_description` VALUES (4308,1,'Nizhny Novgorod Oblast');
INSERT INTO `oc_zone_description` VALUES (1962,1,'Nkhata Bay');
INSERT INTO `oc_zone_description` VALUES (1963,1,'Nkhotakota');
INSERT INTO `oc_zone_description` VALUES (4458,1,'Nógrád');
INSERT INTO `oc_zone_description` VALUES (3222,1,'Nong Bua Lamphu');
INSERT INTO `oc_zone_description` VALUES (3223,1,'Nong Khai');
INSERT INTO `oc_zone_description` VALUES (1755,1,'Nonouti');
INSERT INTO `oc_zone_description` VALUES (3224,1,'Nonthaburi');
INSERT INTO `oc_zone_description` VALUES (2335,1,'Noord-Brabant');
INSERT INTO `oc_zone_description` VALUES (2336,1,'Noord-Holland');
INSERT INTO `oc_zone_description` VALUES (1173,1,'Nord');
INSERT INTO `oc_zone_description` VALUES (1382,1,'Nord');
INSERT INTO `oc_zone_description` VALUES (2342,1,'Nord');
INSERT INTO `oc_zone_description` VALUES (1383,1,'Nord-Est');
INSERT INTO `oc_zone_description` VALUES (3820,1,'Nord-Kivu');
INSERT INTO `oc_zone_description` VALUES (1384,1,'Nord-Ouest');
INSERT INTO `oc_zone_description` VALUES (2436,1,'Nord-Trondelag');
INSERT INTO `oc_zone_description` VALUES (903,1,'Nordjyland');
INSERT INTO `oc_zone_description` VALUES (2437,1,'Nordland');
INSERT INTO `oc_zone_description` VALUES (1263,1,'Nordrhein-Westfalen');
INSERT INTO `oc_zone_description` VALUES (3573,1,'Norfolk');
INSERT INTO `oc_zone_description` VALUES (1469,1,'Norourland eystra');
INSERT INTO `oc_zone_description` VALUES (1470,1,'Norourland vestra');
INSERT INTO `oc_zone_description` VALUES (3083,1,'Norrbotten');
INSERT INTO `oc_zone_description` VALUES (742,1,'Norte de Santander');
INSERT INTO `oc_zone_description` VALUES (4229,1,'North');
INSERT INTO `oc_zone_description` VALUES (597,1,'North (Nord)');
INSERT INTO `oc_zone_description` VALUES (304,1,'North Abaco');
INSERT INTO `oc_zone_description` VALUES (1287,1,'North Aegean');
INSERT INTO `oc_zone_description` VALUES (305,1,'North Andros');
INSERT INTO `oc_zone_description` VALUES (3574,1,'North Ayrshire');
INSERT INTO `oc_zone_description` VALUES (3995,1,'North Bačka');
INSERT INTO `oc_zone_description` VALUES (3997,1,'North Banat');
INSERT INTO `oc_zone_description` VALUES (1239,1,'North Bank');
INSERT INTO `oc_zone_description` VALUES (3412,1,'North Caicos');
INSERT INTO `oc_zone_description` VALUES (3656,1,'North Carolina');
INSERT INTO `oc_zone_description` VALUES (3024,1,'North Central');
INSERT INTO `oc_zone_description` VALUES (2604,1,'North Cotabato');
INSERT INTO `oc_zone_description` VALUES (3657,1,'North Dakota');
INSERT INTO `oc_zone_description` VALUES (436,1,'North East');
INSERT INTO `oc_zone_description` VALUES (1737,1,'North Eastern');
INSERT INTO `oc_zone_description` VALUES (306,1,'North Eleuthera');
INSERT INTO `oc_zone_description` VALUES (1565,1,'North Khorasan');
INSERT INTO `oc_zone_description` VALUES (3575,1,'North Lanarkshire');
INSERT INTO `oc_zone_description` VALUES (1421,1,'North New Territories');
INSERT INTO `oc_zone_description` VALUES (4271,1,'North Ossetia-Alania, Republic of');
INSERT INTO `oc_zone_description` VALUES (437,1,'North West');
INSERT INTO `oc_zone_description` VALUES (2967,1,'North West');
INSERT INTO `oc_zone_description` VALUES (3026,1,'North Western');
INSERT INTO `oc_zone_description` VALUES (3576,1,'North Yorkshire');
INSERT INTO `oc_zone_description` VALUES (2460,1,'North-West Frontier');
INSERT INTO `oc_zone_description` VALUES (3829,1,'North-Western');
INSERT INTO `oc_zone_description` VALUES (3577,1,'Northamptonshire');
INSERT INTO `oc_zone_description` VALUES (318,1,'Northern');
INSERT INTO `oc_zone_description` VALUES (2503,1,'Northern');
INSERT INTO `oc_zone_description` VALUES (2922,1,'Northern');
INSERT INTO `oc_zone_description` VALUES (3025,1,'Northern');
INSERT INTO `oc_zone_description` VALUES (3828,1,'Northern');
INSERT INTO `oc_zone_description` VALUES (4027,1,'Northern Bahr el-Ghazal');
INSERT INTO `oc_zone_description` VALUES (2968,1,'Northern Cape');
INSERT INTO `oc_zone_description` VALUES (1081,1,'Northern Division');
INSERT INTO `oc_zone_description` VALUES (2425,1,'Northern Islands');
INSERT INTO `oc_zone_description` VALUES (3658,1,'Northern Mariana Islands');
INSERT INTO `oc_zone_description` VALUES (1051,1,'Northern Red Sea (Semien-Keih-Bahri)');
INSERT INTO `oc_zone_description` VALUES (1275,1,'Northern Region');
INSERT INTO `oc_zone_description` VALUES (2605,1,'Northern Samar');
INSERT INTO `oc_zone_description` VALUES (193,1,'Northern Territory');
INSERT INTO `oc_zone_description` VALUES (2355,1,'Northland');
INSERT INTO `oc_zone_description` VALUES (3578,1,'Northumberland');
INSERT INTO `oc_zone_description` VALUES (598,1,'Northwest (Nord-Ouest)');
INSERT INTO `oc_zone_description` VALUES (607,1,'Northwest Territories');
INSERT INTO `oc_zone_description` VALUES (3965,1,'Notranjsko-kraška');
INSERT INTO `oc_zone_description` VALUES (3579,1,'Nottinghamshire');
INSERT INTO `oc_zone_description` VALUES (2128,1,'Nouakchott');
INSERT INTO `oc_zone_description` VALUES (533,1,'Noumbiel');
INSERT INTO `oc_zone_description` VALUES (608,1,'Nova Scotia');
INSERT INTO `oc_zone_description` VALUES (3900,1,'Novara');
INSERT INTO `oc_zone_description` VALUES (4309,1,'Novgorod Oblast');
INSERT INTO `oc_zone_description` VALUES (4310,1,'Novosibirsk Oblast');
INSERT INTO `oc_zone_description` VALUES (1964,1,'Nsanje');
INSERT INTO `oc_zone_description` VALUES (1961,1,'Ntcheu');
INSERT INTO `oc_zone_description` VALUES (1965,1,'Ntchisi');
INSERT INTO `oc_zone_description` VALUES (3478,1,'Ntungamo');
INSERT INTO `oc_zone_description` VALUES (2606,1,'Nueva Ecija');
INSERT INTO `oc_zone_description` VALUES (3743,1,'Nueva Esparta');
INSERT INTO `oc_zone_description` VALUES (2607,1,'Nueva Vizcaya');
INSERT INTO `oc_zone_description` VALUES (2163,1,'Nuevo Leon');
INSERT INTO `oc_zone_description` VALUES (2377,1,'Nuevo Segovia');
INSERT INTO `oc_zone_description` VALUES (2954,1,'Nugaal');
INSERT INTO `oc_zone_description` VALUES (3420,1,'Nui');
INSERT INTO `oc_zone_description` VALUES (3421,1,'Nukufetau');
INSERT INTO `oc_zone_description` VALUES (3422,1,'Nukulaelae');
INSERT INTO `oc_zone_description` VALUES (3272,1,'Nukunonu');
INSERT INTO `oc_zone_description` VALUES (609,1,'Nunavut');
INSERT INTO `oc_zone_description` VALUES (3901,1,'Nuoro');
INSERT INTO `oc_zone_description` VALUES (23,1,'Nurestan');
INSERT INTO `oc_zone_description` VALUES (1526,1,'Nusa Tenggara Barat');
INSERT INTO `oc_zone_description` VALUES (1527,1,'Nusa Tenggara Timur');
INSERT INTO `oc_zone_description` VALUES (1224,1,'Nyanga');
INSERT INTO `oc_zone_description` VALUES (1738,1,'Nyanza');
INSERT INTO `oc_zone_description` VALUES (1354,1,'Nzerekore');
INSERT INTO `oc_zone_description` VALUES (2164,1,'Oaxaca');
INSERT INTO `oc_zone_description` VALUES (3967,1,'Obalno-kraška');
INSERT INTO `oc_zone_description` VALUES (202,1,'Oberösterreich');
INSERT INTO `oc_zone_description` VALUES (922,1,'Obock');
INSERT INTO `oc_zone_description` VALUES (3109,1,'Obwald');
INSERT INTO `oc_zone_description` VALUES (1405,1,'Ocotepeque');
INSERT INTO `oc_zone_description` VALUES (583,1,'Oddar Meancheay');
INSERT INTO `oc_zone_description` VALUES (3495,1,'Odeska');
INSERT INTO `oc_zone_description` VALUES (828,1,'Odienne');
INSERT INTO `oc_zone_description` VALUES (1498,1,'Odisha');
INSERT INTO `oc_zone_description` VALUES (977,1,'Oecussi');
INSERT INTO `oc_zone_description` VALUES (1604,1,'Offaly');
INSERT INTO `oc_zone_description` VALUES (1225,1,'Ogooue-Ivindo');
INSERT INTO `oc_zone_description` VALUES (1226,1,'Ogooue-Lolo');
INSERT INTO `oc_zone_description` VALUES (1227,1,'Ogooue-Maritime');
INSERT INTO `oc_zone_description` VALUES (4144,1,'Ogres novads');
INSERT INTO `oc_zone_description` VALUES (2415,1,'Ogun');
INSERT INTO `oc_zone_description` VALUES (245,1,'Oguz');
INSERT INTO `oc_zone_description` VALUES (2295,1,'Ohangwena');
INSERT INTO `oc_zone_description` VALUES (3659,1,'Ohio');
INSERT INTO `oc_zone_description` VALUES (1366,1,'Oio Region');
INSERT INTO `oc_zone_description` VALUES (1174,1,'Oise');
INSERT INTO `oc_zone_description` VALUES (1686,1,'Oita');
INSERT INTO `oc_zone_description` VALUES (1687,1,'Okayama');
INSERT INTO `oc_zone_description` VALUES (1688,1,'Okinawa');
INSERT INTO `oc_zone_description` VALUES (3660,1,'Oklahoma');
INSERT INTO `oc_zone_description` VALUES (4146,1,'Olaines novads');
INSERT INTO `oc_zone_description` VALUES (1406,1,'Olancho');
INSERT INTO `oc_zone_description` VALUES (896,1,'Olomoucký');
INSERT INTO `oc_zone_description` VALUES (2709,1,'Olt');
INSERT INTO `oc_zone_description` VALUES (2296,1,'Omaheke');
INSERT INTO `oc_zone_description` VALUES (649,1,'Ombella-M\'Poko');
INSERT INTO `oc_zone_description` VALUES (2206,1,'Omnogovi');
INSERT INTO `oc_zone_description` VALUES (4311,1,'Omsk Oblast');
INSERT INTO `oc_zone_description` VALUES (2297,1,'Omusati');
INSERT INTO `oc_zone_description` VALUES (2416,1,'Ondo');
INSERT INTO `oc_zone_description` VALUES (1725,1,'Ongtustik Qazaqstan');
INSERT INTO `oc_zone_description` VALUES (1756,1,'Onotoa');
INSERT INTO `oc_zone_description` VALUES (610,1,'Ontario');
INSERT INTO `oc_zone_description` VALUES (351,1,'Oost-Vlaanderen');
INSERT INTO `oc_zone_description` VALUES (2638,1,'Opolskie');
INSERT INTO `oc_zone_description` VALUES (2439,1,'Oppland');
INSERT INTO `oc_zone_description` VALUES (100,1,'Oran');
INSERT INTO `oc_zone_description` VALUES (357,1,'Orange Walk');
INSERT INTO `oc_zone_description` VALUES (127,1,'Ordino');
INSERT INTO `oc_zone_description` VALUES (3377,1,'Ordu');
INSERT INTO `oc_zone_description` VALUES (246,1,'Ordubad');
INSERT INTO `oc_zone_description` VALUES (3084,1,'Örebro');
INSERT INTO `oc_zone_description` VALUES (3661,1,'Oregon');
INSERT INTO `oc_zone_description` VALUES (995,1,'Orellana');
INSERT INTO `oc_zone_description` VALUES (4312,1,'Orenburg Oblast');
INSERT INTO `oc_zone_description` VALUES (2187,1,'Orhei');
INSERT INTO `oc_zone_description` VALUES (2197,1,'Orhon');
INSERT INTO `oc_zone_description` VALUES (3821,1,'Orientale');
INSERT INTO `oc_zone_description` VALUES (3904,1,'Oristano');
INSERT INTO `oc_zone_description` VALUES (3580,1,'Orkney Islands');
INSERT INTO `oc_zone_description` VALUES (1175,1,'Orne');
INSERT INTO `oc_zone_description` VALUES (1074,1,'Oromia');
INSERT INTO `oc_zone_description` VALUES (407,1,'Oruro');
INSERT INTO `oc_zone_description` VALUES (24,1,'Oruzgan');
INSERT INTO `oc_zone_description` VALUES (4313,1,'Oryol Oblast');
INSERT INTO `oc_zone_description` VALUES (1689,1,'Osaka');
INSERT INTO `oc_zone_description` VALUES (1798,1,'Osh');
INSERT INTO `oc_zone_description` VALUES (2298,1,'Oshana');
INSERT INTO `oc_zone_description` VALUES (2299,1,'Oshikoto');
INSERT INTO `oc_zone_description` VALUES (856,1,'Osječko-baranjska');
INSERT INTO `oc_zone_description` VALUES (2440,1,'Oslo');
INSERT INTO `oc_zone_description` VALUES (3378,1,'Osmaniye');
INSERT INTO `oc_zone_description` VALUES (3963,1,'Osrednjeslovenska');
INSERT INTO `oc_zone_description` VALUES (3085,1,'Östergötland');
INSERT INTO `oc_zone_description` VALUES (2438,1,'Ostfold');
INSERT INTO `oc_zone_description` VALUES (2417,1,'Osun');
INSERT INTO `oc_zone_description` VALUES (2356,1,'Otago');
INSERT INTO `oc_zone_description` VALUES (2300,1,'Otjozondjupa');
INSERT INTO `oc_zone_description` VALUES (668,1,'Ouaddai');
INSERT INTO `oc_zone_description` VALUES (650,1,'Ouaka');
INSERT INTO `oc_zone_description` VALUES (101,1,'Ouargla');
INSERT INTO `oc_zone_description` VALUES (2246,1,'Ouarzazate');
INSERT INTO `oc_zone_description` VALUES (534,1,'Oubritenga');
INSERT INTO `oc_zone_description` VALUES (535,1,'Oudalan');
INSERT INTO `oc_zone_description` VALUES (1810,1,'Oudomxai');
INSERT INTO `oc_zone_description` VALUES (369,1,'Oueme');
INSERT INTO `oc_zone_description` VALUES (1385,1,'Ouest');
INSERT INTO `oc_zone_description` VALUES (651,1,'Ouham');
INSERT INTO `oc_zone_description` VALUES (652,1,'Ouham-Pende');
INSERT INTO `oc_zone_description` VALUES (2247,1,'Oujda');
INSERT INTO `oc_zone_description` VALUES (1090,1,'Oulun lääni');
INSERT INTO `oc_zone_description` VALUES (102,1,'Oum el-Bouaghi');
INSERT INTO `oc_zone_description` VALUES (829,1,'Oume');
INSERT INTO `oc_zone_description` VALUES (1933,1,'Our Lady Fatima Parish');
INSERT INTO `oc_zone_description` VALUES (3006,1,'Ourense');
INSERT INTO `oc_zone_description` VALUES (2337,1,'Overijssel');
INSERT INTO `oc_zone_description` VALUES (2207,1,'Ovorhangay');
INSERT INTO `oc_zone_description` VALUES (3581,1,'Oxfordshire');
INSERT INTO `oc_zone_description` VALUES (2418,1,'Oyo');
INSERT INTO `oc_zone_description` VALUES (4147,1,'Ozolnieku novads');
INSERT INTO `oc_zone_description` VALUES (3145,1,'P\'eng-hu');
INSERT INTO `oc_zone_description` VALUES (3146,1,'P\'ing-tung');
INSERT INTO `oc_zone_description` VALUES (1768,1,'P\'yongan-bukto');
INSERT INTO `oc_zone_description` VALUES (1769,1,'P\'yongan-namdo');
INSERT INTO `oc_zone_description` VALUES (1772,1,'P\'yongyang Special City');
INSERT INTO `oc_zone_description` VALUES (3463,1,'Pader');
INSERT INTO `oc_zone_description` VALUES (3905,1,'Padova');
INSERT INTO `oc_zone_description` VALUES (375,1,'Paget');
INSERT INTO `oc_zone_description` VALUES (1977,1,'Pahang');
INSERT INTO `oc_zone_description` VALUES (569,1,'Pailin');
INSERT INTO `oc_zone_description` VALUES (25,1,'Paktia');
INSERT INTO `oc_zone_description` VALUES (26,1,'Paktika');
INSERT INTO `oc_zone_description` VALUES (3662,1,'Palau');
INSERT INTO `oc_zone_description` VALUES (2858,1,'Palauli');
INSERT INTO `oc_zone_description` VALUES (2608,1,'Palawan');
INSERT INTO `oc_zone_description` VALUES (3007,1,'Palencia');
INSERT INTO `oc_zone_description` VALUES (3906,1,'Palermo');
INSERT INTO `oc_zone_description` VALUES (3448,1,'Pallisa');
INSERT INTO `oc_zone_description` VALUES (773,1,'Palmerston');
INSERT INTO `oc_zone_description` VALUES (3685,1,'Palmyra Atoll');
INSERT INTO `oc_zone_description` VALUES (2609,1,'Pampanga');
INSERT INTO `oc_zone_description` VALUES (2141,1,'Pamplemousses');
INSERT INTO `oc_zone_description` VALUES (2486,1,'Panama');
INSERT INTO `oc_zone_description` VALUES (408,1,'Pando');
INSERT INTO `oc_zone_description` VALUES (1915,1,'Panevezys');
INSERT INTO `oc_zone_description` VALUES (2610,1,'Pangasinan');
INSERT INTO `oc_zone_description` VALUES (2046,1,'Paola');
INSERT INTO `oc_zone_description` VALUES (888,1,'Paphos');
INSERT INTO `oc_zone_description` VALUES (1528,1,'Papua');
INSERT INTO `oc_zone_description` VALUES (4233,1,'Papua Barat');
INSERT INTO `oc_zone_description` VALUES (453,1,'Pará');
INSERT INTO `oc_zone_description` VALUES (3065,1,'Para');
INSERT INTO `oc_zone_description` VALUES (2524,1,'Paraguari');
INSERT INTO `oc_zone_description` VALUES (454,1,'Paraíba');
INSERT INTO `oc_zone_description` VALUES (3066,1,'Paramaribo');
INSERT INTO `oc_zone_description` VALUES (455,1,'Paraná');
INSERT INTO `oc_zone_description` VALUES (897,1,'Pardubický');
INSERT INTO `oc_zone_description` VALUES (4148,1,'Pārgaujas novads');
INSERT INTO `oc_zone_description` VALUES (1189,1,'Paris');
INSERT INTO `oc_zone_description` VALUES (3907,1,'Parma');
INSERT INTO `oc_zone_description` VALUES (1061,1,'Parnumaa (Parnu)');
INSERT INTO `oc_zone_description` VALUES (390,1,'Paro');
INSERT INTO `oc_zone_description` VALUES (3405,1,'Parrot Cay');
INSERT INTO `oc_zone_description` VALUES (27,1,'Parwan');
INSERT INTO `oc_zone_description` VALUES (1176,1,'Pas de Calais');
INSERT INTO `oc_zone_description` VALUES (2545,1,'Pasco');
INSERT INTO `oc_zone_description` VALUES (536,1,'Passore');
INSERT INTO `oc_zone_description` VALUES (996,1,'Pastaza');
INSERT INTO `oc_zone_description` VALUES (3225,1,'Pathum Thani');
INSERT INTO `oc_zone_description` VALUES (3226,1,'Pattani');
INSERT INTO `oc_zone_description` VALUES (620,1,'Paul');
INSERT INTO `oc_zone_description` VALUES (3908,1,'Pavia');
INSERT INTO `oc_zone_description` VALUES (4150,1,'Pāvilostas novads');
INSERT INTO `oc_zone_description` VALUES (1726,1,'Pavlodar');
INSERT INTO `oc_zone_description` VALUES (3697,1,'Paysandu');
INSERT INTO `oc_zone_description` VALUES (488,1,'Pazardjik');
INSERT INTO `oc_zone_description` VALUES (4018,1,'Pčinja');
INSERT INTO `oc_zone_description` VALUES (952,1,'Pedernales');
INSERT INTO `oc_zone_description` VALUES (4470,1,'Pelagoniski');
INSERT INTO `oc_zone_description` VALUES (2477,1,'Peleliu');
INSERT INTO `oc_zone_description` VALUES (1288,1,'Peloponnesos');
INSERT INTO `oc_zone_description` VALUES (391,1,'Pemagatshel');
INSERT INTO `oc_zone_description` VALUES (3177,1,'Pemba North');
INSERT INTO `oc_zone_description` VALUES (3178,1,'Pemba South');
INSERT INTO `oc_zone_description` VALUES (376,1,'Pembroke');
INSERT INTO `oc_zone_description` VALUES (2047,1,'Pembroke');
INSERT INTO `oc_zone_description` VALUES (3582,1,'Pembrokeshire');
INSERT INTO `oc_zone_description` VALUES (3279,1,'Penal/Debe');
INSERT INTO `oc_zone_description` VALUES (3721,1,'Penama');
INSERT INTO `oc_zone_description` VALUES (3663,1,'Pennsylvania');
INSERT INTO `oc_zone_description` VALUES (770,1,'Penrhyn');
INSERT INTO `oc_zone_description` VALUES (4314,1,'Penza Oblast');
INSERT INTO `oc_zone_description` VALUES (58,1,'Peqin');
INSERT INTO `oc_zone_description` VALUES (1978,1,'Perak');
INSERT INTO `oc_zone_description` VALUES (953,1,'Peravia (Bani)');
INSERT INTO `oc_zone_description` VALUES (1979,1,'Perlis');
INSERT INTO `oc_zone_description` VALUES (4315,1,'Perm Krai');
INSERT INTO `oc_zone_description` VALUES (59,1,'Permet');
INSERT INTO `oc_zone_description` VALUES (456,1,'Pernambuco');
INSERT INTO `oc_zone_description` VALUES (489,1,'Pernik');
INSERT INTO `oc_zone_description` VALUES (467,1,'Peros Banhos');
INSERT INTO `oc_zone_description` VALUES (3583,1,'Perth and Kinross');
INSERT INTO `oc_zone_description` VALUES (3909,1,'Perugia');
INSERT INTO `oc_zone_description` VALUES (3910,1,'Pesaro e Urbino');
INSERT INTO `oc_zone_description` VALUES (3911,1,'Pescara');
INSERT INTO `oc_zone_description` VALUES (4459,1,'Pest');
INSERT INTO `oc_zone_description` VALUES (1303,1,'Petit Martinique');
INSERT INTO `oc_zone_description` VALUES (1966,1,'Phalombe');
INSERT INTO `oc_zone_description` VALUES (3227,1,'Phangnga');
INSERT INTO `oc_zone_description` VALUES (3228,1,'Phatthalung');
INSERT INTO `oc_zone_description` VALUES (3229,1,'Phayao');
INSERT INTO `oc_zone_description` VALUES (3230,1,'Phetchabun');
INSERT INTO `oc_zone_description` VALUES (3231,1,'Phetchaburi');
INSERT INTO `oc_zone_description` VALUES (3232,1,'Phichit');
INSERT INTO `oc_zone_description` VALUES (3233,1,'Phitsanulok');
INSERT INTO `oc_zone_description` VALUES (567,1,'Phnom Penh');
INSERT INTO `oc_zone_description` VALUES (1811,1,'Phongsali');
INSERT INTO `oc_zone_description` VALUES (4256,1,'Phra Nakhon Si Ayutthaya');
INSERT INTO `oc_zone_description` VALUES (3234,1,'Phrae');
INSERT INTO `oc_zone_description` VALUES (3235,1,'Phuket');
INSERT INTO `oc_zone_description` VALUES (3912,1,'Piacenza');
INSERT INTO `oc_zone_description` VALUES (457,1,'Piauí');
INSERT INTO `oc_zone_description` VALUES (997,1,'Pichincha');
INSERT INTO `oc_zone_description` VALUES (2048,1,'Pieta');
INSERT INTO `oc_zone_description` VALUES (879,1,'Pinar del Rio');
INSERT INTO `oc_zone_description` VALUES (3406,1,'Pine Cay');
INSERT INTO `oc_zone_description` VALUES (4016,1,'Pirot');
INSERT INTO `oc_zone_description` VALUES (3913,1,'Pisa');
INSERT INTO `oc_zone_description` VALUES (3914,1,'Pistoia');
INSERT INTO `oc_zone_description` VALUES (1355,1,'Pita');
INSERT INTO `oc_zone_description` VALUES (2546,1,'Piura');
INSERT INTO `oc_zone_description` VALUES (2142,1,'Plaines Wilhems');
INSERT INTO `oc_zone_description` VALUES (2916,1,'Plaisance');
INSERT INTO `oc_zone_description` VALUES (1910,1,'Planken');
INSERT INTO `oc_zone_description` VALUES (370,1,'Plateau');
INSERT INTO `oc_zone_description` VALUES (2419,1,'Plateau');
INSERT INTO `oc_zone_description` VALUES (764,1,'Plateaux');
INSERT INTO `oc_zone_description` VALUES (3266,1,'Plateaux');
INSERT INTO `oc_zone_description` VALUES (3985,1,'Plav');
INSERT INTO `oc_zone_description` VALUES (4153,1,'Pļaviņu novads');
INSERT INTO `oc_zone_description` VALUES (490,1,'Pleven');
INSERT INTO `oc_zone_description` VALUES (3986,1,'Pljevlja');
INSERT INTO `oc_zone_description` VALUES (491,1,'Plovdiv');
INSERT INTO `oc_zone_description` VALUES (3987,1,'Plužine');
INSERT INTO `oc_zone_description` VALUES (898,1,'Plzeňský');
INSERT INTO `oc_zone_description` VALUES (3988,1,'Podgorica');
INSERT INTO `oc_zone_description` VALUES (2639,1,'Podkarpackie');
INSERT INTO `oc_zone_description` VALUES (2640,1,'Podlaskie');
INSERT INTO `oc_zone_description` VALUES (3957,1,'Podravska');
INSERT INTO `oc_zone_description` VALUES (4004,1,'Podunavlje');
INSERT INTO `oc_zone_description` VALUES (60,1,'Pogradec');
INSERT INTO `oc_zone_description` VALUES (2179,1,'Pohnpei');
INSERT INTO `oc_zone_description` VALUES (3288,1,'Point Fortin');
INSERT INTO `oc_zone_description` VALUES (2917,1,'Pointe La Rue');
INSERT INTO `oc_zone_description` VALUES (4471,1,'Pološki');
INSERT INTO `oc_zone_description` VALUES (3496,1,'Poltavska');
INSERT INTO `oc_zone_description` VALUES (1062,1,'Polvamaa (Polva)');
INSERT INTO `oc_zone_description` VALUES (1375,1,'Pomeroon-Supenaam');
INSERT INTO `oc_zone_description` VALUES (4007,1,'Pomoravlje');
INSERT INTO `oc_zone_description` VALUES (2641,1,'Pomorskie');
INSERT INTO `oc_zone_description` VALUES (3956,1,'Pomurska');
INSERT INTO `oc_zone_description` VALUES (537,1,'Poni');
INSERT INTO `oc_zone_description` VALUES (3008,1,'Pontevedra');
INSERT INTO `oc_zone_description` VALUES (765,1,'Pool');
INSERT INTO `oc_zone_description` VALUES (3915,1,'Pordenone');
INSERT INTO `oc_zone_description` VALUES (2918,1,'Port Glaud');
INSERT INTO `oc_zone_description` VALUES (2131,1,'Port Louis');
INSERT INTO `oc_zone_description` VALUES (2143,1,'Port Louis');
INSERT INTO `oc_zone_description` VALUES (3285,1,'Port of Spain');
INSERT INTO `oc_zone_description` VALUES (2662,1,'Portalegre');
INSERT INTO `oc_zone_description` VALUES (1647,1,'Portland Parish');
INSERT INTO `oc_zone_description` VALUES (2663,1,'Porto');
INSERT INTO `oc_zone_description` VALUES (621,1,'Porto Novo');
INSERT INTO `oc_zone_description` VALUES (3744,1,'Portuguesa');
INSERT INTO `oc_zone_description` VALUES (414,1,'Posavski Kanton');
INSERT INTO `oc_zone_description` VALUES (1376,1,'Potaro-Siparuni');
INSERT INTO `oc_zone_description` VALUES (3916,1,'Potenza');
INSERT INTO `oc_zone_description` VALUES (409,1,'Potosi');
INSERT INTO `oc_zone_description` VALUES (3584,1,'Powys');
INSERT INTO `oc_zone_description` VALUES (857,1,'Požeško-slavonska');
INSERT INTO `oc_zone_description` VALUES (3236,1,'Prachin Buri');
INSERT INTO `oc_zone_description` VALUES (3237,1,'Prachuap Khiri Khan');
INSERT INTO `oc_zone_description` VALUES (899,1,'Praha');
INSERT INTO `oc_zone_description` VALUES (2710,1,'Prahova');
INSERT INTO `oc_zone_description` VALUES (622,1,'Praia');
INSERT INTO `oc_zone_description` VALUES (2843,1,'Praslin');
INSERT INTO `oc_zone_description` VALUES (3917,1,'Prato');
INSERT INTO `oc_zone_description` VALUES (568,1,'Preah Seihanu (Kompong Som or Sihanoukville)');
INSERT INTO `oc_zone_description` VALUES (585,1,'Preah Vihear');
INSERT INTO `oc_zone_description` VALUES (4155,1,'Preiļu novads');
INSERT INTO `oc_zone_description` VALUES (2525,1,'Presidente Hayes');
INSERT INTO `oc_zone_description` VALUES (2929,1,'Prešovský');
INSERT INTO `oc_zone_description` VALUES (586,1,'Prey Veng');
INSERT INTO `oc_zone_description` VALUES (4157,1,'Priekules novads');
INSERT INTO `oc_zone_description` VALUES (4158,1,'Priekuļu novads');
INSERT INTO `oc_zone_description` VALUES (858,1,'Primorsko-goranska');
INSERT INTO `oc_zone_description` VALUES (4281,1,'Primorsky Krai');
INSERT INTO `oc_zone_description` VALUES (611,1,'Prince Edward Island');
INSERT INTO `oc_zone_description` VALUES (3280,1,'Princes Town');
INSERT INTO `oc_zone_description` VALUES (2873,1,'Principe');
INSERT INTO `oc_zone_description` VALUES (3413,1,'Providenciales');
INSERT INTO `oc_zone_description` VALUES (1041,1,'Provincia Annobon');
INSERT INTO `oc_zone_description` VALUES (1042,1,'Provincia Bioko Norte');
INSERT INTO `oc_zone_description` VALUES (1043,1,'Provincia Bioko Sur');
INSERT INTO `oc_zone_description` VALUES (1044,1,'Provincia Centro Sur');
INSERT INTO `oc_zone_description` VALUES (1045,1,'Provincia Kie-Ntem');
INSERT INTO `oc_zone_description` VALUES (1046,1,'Provincia Litoral');
INSERT INTO `oc_zone_description` VALUES (1047,1,'Provincia Wele-Nzas');
INSERT INTO `oc_zone_description` VALUES (4316,1,'Pskov Oblast');
INSERT INTO `oc_zone_description` VALUES (1499,1,'Puducherry');
INSERT INTO `oc_zone_description` VALUES (2165,1,'Puebla');
INSERT INTO `oc_zone_description` VALUES (954,1,'Puerto Plata');
INSERT INTO `oc_zone_description` VALUES (3664,1,'Puerto Rico');
INSERT INTO `oc_zone_description` VALUES (767,1,'Pukapuka');
INSERT INTO `oc_zone_description` VALUES (61,1,'Puke');
INSERT INTO `oc_zone_description` VALUES (1980,1,'Pulau Pinang');
INSERT INTO `oc_zone_description` VALUES (392,1,'Punakha');
INSERT INTO `oc_zone_description` VALUES (1500,1,'Punjab');
INSERT INTO `oc_zone_description` VALUES (2461,1,'Punjab');
INSERT INTO `oc_zone_description` VALUES (2547,1,'Puno');
INSERT INTO `oc_zone_description` VALUES (787,1,'Puntarenas');
INSERT INTO `oc_zone_description` VALUES (584,1,'Pursat');
INSERT INTO `oc_zone_description` VALUES (4035,1,'Putrajaya');
INSERT INTO `oc_zone_description` VALUES (743,1,'Putumayo');
INSERT INTO `oc_zone_description` VALUES (1177,1,'Puy de D&ocirc;me');
INSERT INTO `oc_zone_description` VALUES (3179,1,'Pwani');
INSERT INTO `oc_zone_description` VALUES (1178,1,'Pyr&eacute;n&eacute;es Atlantiques');
INSERT INTO `oc_zone_description` VALUES (1180,1,'Pyr&eacute;n&eacute;es Orientales');
INSERT INTO `oc_zone_description` VALUES (247,1,'Qabala');
INSERT INTO `oc_zone_description` VALUES (1859,1,'Qacha\'s Nek');
INSERT INTO `oc_zone_description` VALUES (2076,1,'Qala');
INSERT INTO `oc_zone_description` VALUES (1727,1,'Qaraghandy');
INSERT INTO `oc_zone_description` VALUES (3712,1,'Qashqadaryo');
INSERT INTO `oc_zone_description` VALUES (248,1,'Qax');
INSERT INTO `oc_zone_description` VALUES (249,1,'Qazax');
INSERT INTO `oc_zone_description` VALUES (1541,1,'Qazvin');
INSERT INTO `oc_zone_description` VALUES (1024,1,'Qina');
INSERT INTO `oc_zone_description` VALUES (4232,1,'Qinghai');
INSERT INTO `oc_zone_description` VALUES (250,1,'Qobustan');
INSERT INTO `oc_zone_description` VALUES (1539,1,'Qom');
INSERT INTO `oc_zone_description` VALUES (3713,1,'Qoraqalpog\'iston Republikasi');
INSERT INTO `oc_zone_description` VALUES (2049,1,'Qormi');
INSERT INTO `oc_zone_description` VALUES (1728,1,'Qostanay');
INSERT INTO `oc_zone_description` VALUES (2050,1,'Qrendi');
INSERT INTO `oc_zone_description` VALUES (612,1,'Qu&eacute;bec');
INSERT INTO `oc_zone_description` VALUES (2132,1,'Quatre Bornes');
INSERT INTO `oc_zone_description` VALUES (251,1,'Quba');
INSERT INTO `oc_zone_description` VALUES (252,1,'Qubadli');
INSERT INTO `oc_zone_description` VALUES (194,1,'Queensland');
INSERT INTO `oc_zone_description` VALUES (2166,1,'Queretaro');
INSERT INTO `oc_zone_description` VALUES (1317,1,'Quetzaltenango');
INSERT INTO `oc_zone_description` VALUES (2611,1,'Quezon');
INSERT INTO `oc_zone_description` VALUES (1367,1,'Quinara Region');
INSERT INTO `oc_zone_description` VALUES (744,1,'Quindio');
INSERT INTO `oc_zone_description` VALUES (2167,1,'Quintana Roo');
INSERT INTO `oc_zone_description` VALUES (2612,1,'Quirino');
INSERT INTO `oc_zone_description` VALUES (253,1,'Qusar');
INSERT INTO `oc_zone_description` VALUES (1860,1,'Quthing');
INSERT INTO `oc_zone_description` VALUES (1729,1,'Qyzylorda');
INSERT INTO `oc_zone_description` VALUES (3511,1,'Ra’s al Khaymah');
INSERT INTO `oc_zone_description` VALUES (2051,1,'Rabat');
INSERT INTO `oc_zone_description` VALUES (2248,1,'Rabat-Sale');
INSERT INTO `oc_zone_description` VALUES (1250,1,'Racha Lechkhumi and Kvemo Svanet');
INSERT INTO `oc_zone_description` VALUES (307,1,'Ragged Island');
INSERT INTO `oc_zone_description` VALUES (3918,1,'Ragusa');
INSERT INTO `oc_zone_description` VALUES (1501,1,'Rajasthan');
INSERT INTO `oc_zone_description` VALUES (324,1,'Rajshahi');
INSERT INTO `oc_zone_description` VALUES (768,1,'Rakahanga');
INSERT INTO `oc_zone_description` VALUES (3434,1,'Rakai');
INSERT INTO `oc_zone_description` VALUES (2286,1,'Rakhine State');
INSERT INTO `oc_zone_description` VALUES (3238,1,'Ranong');
INSERT INTO `oc_zone_description` VALUES (1063,1,'Raplamaa (Rapla)');
INSERT INTO `oc_zone_description` VALUES (2326,1,'Rapti');
INSERT INTO `oc_zone_description` VALUES (780,1,'Rarotonga');
INSERT INTO `oc_zone_description` VALUES (4013,1,'Rasina');
INSERT INTO `oc_zone_description` VALUES (4012,1,'Raška');
INSERT INTO `oc_zone_description` VALUES (1771,1,'Rason Directly Governed City');
INSERT INTO `oc_zone_description` VALUES (587,1,'Ratanak Kiri');
INSERT INTO `oc_zone_description` VALUES (3239,1,'Ratchaburi');
INSERT INTO `oc_zone_description` VALUES (4159,1,'Raunas novads');
INSERT INTO `oc_zone_description` VALUES (3919,1,'Ravenna');
INSERT INTO `oc_zone_description` VALUES (3240,1,'Rayong');
INSERT INTO `oc_zone_description` VALUES (1566,1,'Razavi Khorasan');
INSERT INTO `oc_zone_description` VALUES (492,1,'Razgrad');
INSERT INTO `oc_zone_description` VALUES (1923,1,'Redange');
INSERT INTO `oc_zone_description` VALUES (154,1,'Redonda');
INSERT INTO `oc_zone_description` VALUES (3920,1,'Reggio Calabria');
INSERT INTO `oc_zone_description` VALUES (3921,1,'Reggio Emilia');
INSERT INTO `oc_zone_description` VALUES (681,1,'Region Metropolitana');
INSERT INTO `oc_zone_description` VALUES (103,1,'Relizane');
INSERT INTO `oc_zone_description` VALUES (1928,1,'Remich');
INSERT INTO `oc_zone_description` VALUES (3585,1,'Renfrewshire');
INSERT INTO `oc_zone_description` VALUES (2940,1,'Rennell and Bellona');
INSERT INTO `oc_zone_description` VALUES (1318,1,'Retalhuleu');
INSERT INTO `oc_zone_description` VALUES (4160,1,'Rēzekne');
INSERT INTO `oc_zone_description` VALUES (4161,1,'Rēzeknes novads');
INSERT INTO `oc_zone_description` VALUES (1183,1,'Rh&ocirc;ne');
INSERT INTO `oc_zone_description` VALUES (1264,1,'Rheinland-Pfalz');
INSERT INTO `oc_zone_description` VALUES (3665,1,'Rhode Island');
INSERT INTO `oc_zone_description` VALUES (3586,1,'Rhondda Cynon Taff');
INSERT INTO `oc_zone_description` VALUES (1529,1,'Riau');
INSERT INTO `oc_zone_description` VALUES (623,1,'Ribeira Grande');
INSERT INTO `oc_zone_description` VALUES (4162,1,'Riebiņu novads');
INSERT INTO `oc_zone_description` VALUES (3922,1,'Rieti');
INSERT INTO `oc_zone_description` VALUES (3133,1,'Rif Dimashq');
INSERT INTO `oc_zone_description` VALUES (1739,1,'Rift Valley');
INSERT INTO `oc_zone_description` VALUES (4163,1,'Rīga');
INSERT INTO `oc_zone_description` VALUES (3923,1,'Rimini');
INSERT INTO `oc_zone_description` VALUES (458,1,'Rio de Janeiro');
INSERT INTO `oc_zone_description` VALUES (459,1,'Rio Grande do Norte');
INSERT INTO `oc_zone_description` VALUES (460,1,'Rio Grande do Sul');
INSERT INTO `oc_zone_description` VALUES (171,1,'Rio Negro');
INSERT INTO `oc_zone_description` VALUES (3698,1,'Rio Negro');
INSERT INTO `oc_zone_description` VALUES (2378,1,'Rio San Juan');
INSERT INTO `oc_zone_description` VALUES (745,1,'Risaralda');
INSERT INTO `oc_zone_description` VALUES (2379,1,'Rivas');
INSERT INTO `oc_zone_description` VALUES (1873,1,'River Cess');
INSERT INTO `oc_zone_description` VALUES (3699,1,'Rivera');
INSERT INTO `oc_zone_description` VALUES (2420,1,'Rivers');
INSERT INTO `oc_zone_description` VALUES (2144,1,'Riviere du Rempart');
INSERT INTO `oc_zone_description` VALUES (3497,1,'Rivnenska');
INSERT INTO `oc_zone_description` VALUES (2613,1,'Rizal');
INSERT INTO `oc_zone_description` VALUES (3379,1,'Rize');
INSERT INTO `oc_zone_description` VALUES (3700,1,'Rocha');
INSERT INTO `oc_zone_description` VALUES (2136,1,'Rodrigues');
INSERT INTO `oc_zone_description` VALUES (2441,1,'Rogaland');
INSERT INTO `oc_zone_description` VALUES (3241,1,'Roi Et');
INSERT INTO `oc_zone_description` VALUES (4164,1,'Rojas novads');
INSERT INTO `oc_zone_description` VALUES (3924,1,'Roma');
INSERT INTO `oc_zone_description` VALUES (2614,1,'Romblon');
INSERT INTO `oc_zone_description` VALUES (461,1,'Rondônia');
INSERT INTO `oc_zone_description` VALUES (2108,1,'Rongelap');
INSERT INTO `oc_zone_description` VALUES (2109,1,'Rongrik');
INSERT INTO `oc_zone_description` VALUES (4165,1,'Ropažu novads');
INSERT INTO `oc_zone_description` VALUES (462,1,'Roraima');
INSERT INTO `oc_zone_description` VALUES (1605,1,'Roscommon');
INSERT INTO `oc_zone_description` VALUES (119,1,'Rose Island');
INSERT INTO `oc_zone_description` VALUES (4317,1,'Rostov Oblast');
INSERT INTO `oc_zone_description` VALUES (2426,1,'Rota');
INSERT INTO `oc_zone_description` VALUES (1084,1,'Rotuma');
INSERT INTO `oc_zone_description` VALUES (3925,1,'Rovigo');
INSERT INTO `oc_zone_description` VALUES (3989,1,'Rožaje');
INSERT INTO `oc_zone_description` VALUES (4166,1,'Rucavas novads');
INSERT INTO `oc_zone_description` VALUES (4167,1,'Rugāju novads');
INSERT INTO `oc_zone_description` VALUES (1907,1,'Ruggell');
INSERT INTO `oc_zone_description` VALUES (2819,1,'Ruhengeri');
INSERT INTO `oc_zone_description` VALUES (4170,1,'Rūjienas novads');
INSERT INTO `oc_zone_description` VALUES (3479,1,'Rukungiri');
INSERT INTO `oc_zone_description` VALUES (3180,1,'Rukwa');
INSERT INTO `oc_zone_description` VALUES (308,1,'Rum Cay');
INSERT INTO `oc_zone_description` VALUES (1967,1,'Rumphi');
INSERT INTO `oc_zone_description` VALUES (4168,1,'Rundāles novads');
INSERT INTO `oc_zone_description` VALUES (3968,1,'Ruse');
INSERT INTO `oc_zone_description` VALUES (565,1,'Rutana');
INSERT INTO `oc_zone_description` VALUES (3587,1,'Rutland');
INSERT INTO `oc_zone_description` VALUES (3181,1,'Ruvuma');
INSERT INTO `oc_zone_description` VALUES (566,1,'Ruyigi');
INSERT INTO `oc_zone_description` VALUES (1770,1,'Ryanggang-do (Yanggang-do)');
INSERT INTO `oc_zone_description` VALUES (4318,1,'Ryazan Oblast');
INSERT INTO `oc_zone_description` VALUES (3242,1,'Sa Kaeo');
INSERT INTO `oc_zone_description` VALUES (3804,1,'Sa\'dah');
INSERT INTO `oc_zone_description` VALUES (1185,1,'Sa&ocirc;ne et Loire');
INSERT INTO `oc_zone_description` VALUES (1064,1,'Saaremaa (Kuessaare)');
INSERT INTO `oc_zone_description` VALUES (1265,1,'Saarland');
INSERT INTO `oc_zone_description` VALUES (255,1,'Saatli');
INSERT INTO `oc_zone_description` VALUES (4021,1,'Saba');
INSERT INTO `oc_zone_description` VALUES (1981,1,'Sabah');
INSERT INTO `oc_zone_description` VALUES (3027,1,'Sabaragamuwa');
INSERT INTO `oc_zone_description` VALUES (1892,1,'Sabha');
INSERT INTO `oc_zone_description` VALUES (256,1,'Sabirabad');
INSERT INTO `oc_zone_description` VALUES (1319,1,'Sacatepequez');
INSERT INTO `oc_zone_description` VALUES (1266,1,'Sachsen');
INSERT INTO `oc_zone_description` VALUES (1267,1,'Sachsen-Anhalt');
INSERT INTO `oc_zone_description` VALUES (257,1,'Sadarak');
INSERT INTO `oc_zone_description` VALUES (2052,1,'Safi');
INSERT INTO `oc_zone_description` VALUES (2249,1,'Safi');
INSERT INTO `oc_zone_description` VALUES (1690,1,'Saga');
INSERT INTO `oc_zone_description` VALUES (2278,1,'Sagaing');
INSERT INTO `oc_zone_description` VALUES (2327,1,'Sagarmatha');
INSERT INTO `oc_zone_description` VALUES (258,1,'Sahbuz');
INSERT INTO `oc_zone_description` VALUES (1422,1,'Sai Kung New Territories');
INSERT INTO `oc_zone_description` VALUES (104,1,'Saida');
INSERT INTO `oc_zone_description` VALUES (327,1,'Saint Andrew');
INSERT INTO `oc_zone_description` VALUES (1296,1,'Saint Andrew');
INSERT INTO `oc_zone_description` VALUES (2848,1,'Saint Andrew');
INSERT INTO `oc_zone_description` VALUES (924,1,'Saint Andrew Parish');
INSERT INTO `oc_zone_description` VALUES (1648,1,'Saint Andrew Parish');
INSERT INTO `oc_zone_description` VALUES (1649,1,'Saint Ann Parish');
INSERT INTO `oc_zone_description` VALUES (2822,1,'Saint Anne Sandy Point');
INSERT INTO `oc_zone_description` VALUES (2218,1,'Saint Anthony');
INSERT INTO `oc_zone_description` VALUES (1650,1,'Saint Catherine Parish');
INSERT INTO `oc_zone_description` VALUES (3783,1,'Saint Croix');
INSERT INTO `oc_zone_description` VALUES (1297,1,'Saint David');
INSERT INTO `oc_zone_description` VALUES (2849,1,'Saint David');
INSERT INTO `oc_zone_description` VALUES (925,1,'Saint David Parish');
INSERT INTO `oc_zone_description` VALUES (1651,1,'Saint Elizabeth Parish');
INSERT INTO `oc_zone_description` VALUES (147,1,'Saint George');
INSERT INTO `oc_zone_description` VALUES (328,1,'Saint George');
INSERT INTO `oc_zone_description` VALUES (1298,1,'Saint George');
INSERT INTO `oc_zone_description` VALUES (2850,1,'Saint George');
INSERT INTO `oc_zone_description` VALUES (2823,1,'Saint George Basseterre');
INSERT INTO `oc_zone_description` VALUES (377,1,'Saint George City');
INSERT INTO `oc_zone_description` VALUES (2824,1,'Saint George Gingerland');
INSERT INTO `oc_zone_description` VALUES (926,1,'Saint George Parish');
INSERT INTO `oc_zone_description` VALUES (378,1,'Saint George\'s');
INSERT INTO `oc_zone_description` VALUES (2219,1,'Saint Georges');
INSERT INTO `oc_zone_description` VALUES (3032,1,'Saint Helena');
INSERT INTO `oc_zone_description` VALUES (329,1,'Saint James');
INSERT INTO `oc_zone_description` VALUES (1652,1,'Saint James Parish');
INSERT INTO `oc_zone_description` VALUES (2825,1,'Saint James Windward');
INSERT INTO `oc_zone_description` VALUES (148,1,'Saint John');
INSERT INTO `oc_zone_description` VALUES (330,1,'Saint John');
INSERT INTO `oc_zone_description` VALUES (1299,1,'Saint John');
INSERT INTO `oc_zone_description` VALUES (3784,1,'Saint John');
INSERT INTO `oc_zone_description` VALUES (2826,1,'Saint John Capesterre');
INSERT INTO `oc_zone_description` VALUES (2827,1,'Saint John Figtree');
INSERT INTO `oc_zone_description` VALUES (927,1,'Saint John Parish');
INSERT INTO `oc_zone_description` VALUES (331,1,'Saint Joseph');
INSERT INTO `oc_zone_description` VALUES (928,1,'Saint Joseph Parish');
INSERT INTO `oc_zone_description` VALUES (2919,1,'Saint Louis');
INSERT INTO `oc_zone_description` VALUES (332,1,'Saint Lucy');
INSERT INTO `oc_zone_description` VALUES (929,1,'Saint Luke Parish');
INSERT INTO `oc_zone_description` VALUES (1300,1,'Saint Mark');
INSERT INTO `oc_zone_description` VALUES (930,1,'Saint Mark Parish');
INSERT INTO `oc_zone_description` VALUES (149,1,'Saint Mary');
INSERT INTO `oc_zone_description` VALUES (2828,1,'Saint Mary Cayon');
INSERT INTO `oc_zone_description` VALUES (1653,1,'Saint Mary Parish');
INSERT INTO `oc_zone_description` VALUES (333,1,'Saint Michael');
INSERT INTO `oc_zone_description` VALUES (1301,1,'Saint Patrick');
INSERT INTO `oc_zone_description` VALUES (2851,1,'Saint Patrick');
INSERT INTO `oc_zone_description` VALUES (931,1,'Saint Patrick Parish');
INSERT INTO `oc_zone_description` VALUES (150,1,'Saint Paul');
INSERT INTO `oc_zone_description` VALUES (2829,1,'Saint Paul Capesterre');
INSERT INTO `oc_zone_description` VALUES (2830,1,'Saint Paul Charlestown');
INSERT INTO `oc_zone_description` VALUES (932,1,'Saint Paul Parish');
INSERT INTO `oc_zone_description` VALUES (151,1,'Saint Peter');
INSERT INTO `oc_zone_description` VALUES (334,1,'Saint Peter');
INSERT INTO `oc_zone_description` VALUES (2220,1,'Saint Peter');
INSERT INTO `oc_zone_description` VALUES (2831,1,'Saint Peter Basseterre');
INSERT INTO `oc_zone_description` VALUES (933,1,'Saint Peter Parish');
INSERT INTO `oc_zone_description` VALUES (4334,1,'Saint Petersburg');
INSERT INTO `oc_zone_description` VALUES (152,1,'Saint Philip');
INSERT INTO `oc_zone_description` VALUES (335,1,'Saint Philip');
INSERT INTO `oc_zone_description` VALUES (2647,1,'Saint Pierre');
INSERT INTO `oc_zone_description` VALUES (336,1,'Saint Thomas');
INSERT INTO `oc_zone_description` VALUES (3785,1,'Saint Thomas');
INSERT INTO `oc_zone_description` VALUES (2832,1,'Saint Thomas Lowland');
INSERT INTO `oc_zone_description` VALUES (2833,1,'Saint Thomas Middle Island');
INSERT INTO `oc_zone_description` VALUES (1654,1,'Saint Thomas Parish');
INSERT INTO `oc_zone_description` VALUES (2894,1,'Saint-Louis');
INSERT INTO `oc_zone_description` VALUES (2427,1,'Saipan');
INSERT INTO `oc_zone_description` VALUES (1691,1,'Saitama');
INSERT INTO `oc_zone_description` VALUES (3380,1,'Sakarya');
INSERT INTO `oc_zone_description` VALUES (830,1,'Sakassou');
INSERT INTO `oc_zone_description` VALUES (4270,1,'Sakha (Yakutia) Republic');
INSERT INTO `oc_zone_description` VALUES (4321,1,'Sakhalin Oblast');
INSERT INTO `oc_zone_description` VALUES (254,1,'Saki');
INSERT INTO `oc_zone_description` VALUES (259,1,'Saki');
INSERT INTO `oc_zone_description` VALUES (3243,1,'Sakon Nakhon');
INSERT INTO `oc_zone_description` VALUES (624,1,'Sal');
INSERT INTO `oc_zone_description` VALUES (4173,1,'Salacgrīvas novads');
INSERT INTO `oc_zone_description` VALUES (1569,1,'Salah ad Din');
INSERT INTO `oc_zone_description` VALUES (2712,1,'Sălaj');
INSERT INTO `oc_zone_description` VALUES (3009,1,'Salamanca');
INSERT INTO `oc_zone_description` VALUES (669,1,'Salamat');
INSERT INTO `oc_zone_description` VALUES (4174,1,'Salas novads');
INSERT INTO `oc_zone_description` VALUES (4175,1,'Salaspils novads');
INSERT INTO `oc_zone_description` VALUES (1812,1,'Salavan');
INSERT INTO `oc_zone_description` VALUES (955,1,'Salcedo');
INSERT INTO `oc_zone_description` VALUES (4177,1,'Saldus novads');
INSERT INTO `oc_zone_description` VALUES (4178,1,'Saldus, Saldus novads');
INSERT INTO `oc_zone_description` VALUES (3926,1,'Salerno');
INSERT INTO `oc_zone_description` VALUES (1968,1,'Salima');
INSERT INTO `oc_zone_description` VALUES (468,1,'Salomon Islands');
INSERT INTO `oc_zone_description` VALUES (3407,1,'Salt Cay');
INSERT INTO `oc_zone_description` VALUES (172,1,'Salta');
INSERT INTO `oc_zone_description` VALUES (3701,1,'Salto');
INSERT INTO `oc_zone_description` VALUES (260,1,'Salyan');
INSERT INTO `oc_zone_description` VALUES (203,1,'Salzburg');
INSERT INTO `oc_zone_description` VALUES (956,1,'Samana');
INSERT INTO `oc_zone_description` VALUES (28,1,'Samangan');
INSERT INTO `oc_zone_description` VALUES (2615,1,'Samar');
INSERT INTO `oc_zone_description` VALUES (4319,1,'Samara Oblast');
INSERT INTO `oc_zone_description` VALUES (3714,1,'Samarqand');
INSERT INTO `oc_zone_description` VALUES (262,1,'Samaxi');
INSERT INTO `oc_zone_description` VALUES (393,1,'Samdrup Jongkhar');
INSERT INTO `oc_zone_description` VALUES (1251,1,'Samegrelo-Zemo Svaneti');
INSERT INTO `oc_zone_description` VALUES (263,1,'Samkir');
INSERT INTO `oc_zone_description` VALUES (3381,1,'Samsun');
INSERT INTO `oc_zone_description` VALUES (394,1,'Samtse');
INSERT INTO `oc_zone_description` VALUES (1252,1,'Samtskhe-Javakheti');
INSERT INTO `oc_zone_description` VALUES (3244,1,'Samut Prakan');
INSERT INTO `oc_zone_description` VALUES (3245,1,'Samut Sakhon');
INSERT INTO `oc_zone_description` VALUES (3246,1,'Samut Songkhram');
INSERT INTO `oc_zone_description` VALUES (264,1,'Samux');
INSERT INTO `oc_zone_description` VALUES (746,1,'San Andres y Providencia');
INSERT INTO `oc_zone_description` VALUES (2487,1,'San Blas');
INSERT INTO `oc_zone_description` VALUES (958,1,'San Cristobal');
INSERT INTO `oc_zone_description` VALUES (3286,1,'San Fernando');
INSERT INTO `oc_zone_description` VALUES (2053,1,'San Giljan');
INSERT INTO `oc_zone_description` VALUES (2056,1,'San Gwann');
INSERT INTO `oc_zone_description` VALUES (788,1,'San Jose');
INSERT INTO `oc_zone_description` VALUES (3702,1,'San Jose');
INSERT INTO `oc_zone_description` VALUES (959,1,'San Jose de Ocoa');
INSERT INTO `oc_zone_description` VALUES (173,1,'San Juan');
INSERT INTO `oc_zone_description` VALUES (960,1,'San Juan');
INSERT INTO `oc_zone_description` VALUES (3282,1,'San Juan/Laventille');
INSERT INTO `oc_zone_description` VALUES (2078,1,'San Lawrenz');
INSERT INTO `oc_zone_description` VALUES (174,1,'San Luis');
INSERT INTO `oc_zone_description` VALUES (2168,1,'San Luis Potosi');
INSERT INTO `oc_zone_description` VALUES (1320,1,'San Marcos');
INSERT INTO `oc_zone_description` VALUES (2548,1,'San Martin');
INSERT INTO `oc_zone_description` VALUES (1035,1,'San Miguel');
INSERT INTO `oc_zone_description` VALUES (2055,1,'San Pawl il-Bahar');
INSERT INTO `oc_zone_description` VALUES (2526,1,'San Pedro');
INSERT INTO `oc_zone_description` VALUES (961,1,'San Pedro de Macoris');
INSERT INTO `oc_zone_description` VALUES (309,1,'San Salvador');
INSERT INTO `oc_zone_description` VALUES (1036,1,'San Salvador');
INSERT INTO `oc_zone_description` VALUES (1037,1,'San Vicente');
INSERT INTO `oc_zone_description` VALUES (831,1,'San-Pedro');
INSERT INTO `oc_zone_description` VALUES (3805,1,'San\'a');
INSERT INTO `oc_zone_description` VALUES (2955,1,'Sanaag');
INSERT INTO `oc_zone_description` VALUES (957,1,'Sanchez Ramirez');
INSERT INTO `oc_zone_description` VALUES (880,1,'Sancti Spiritus');
INSERT INTO `oc_zone_description` VALUES (2504,1,'Sandaun');
INSERT INTO `oc_zone_description` VALUES (379,1,'Sandys');
INSERT INTO `oc_zone_description` VALUES (766,1,'Sangha');
INSERT INTO `oc_zone_description` VALUES (655,1,'Sangha-Mbaere');
INSERT INTO `oc_zone_description` VALUES (3281,1,'Sangre Grande');
INSERT INTO `oc_zone_description` VALUES (538,1,'Sanguie');
INSERT INTO `oc_zone_description` VALUES (3382,1,'Şanlıurfa');
INSERT INTO `oc_zone_description` VALUES (3722,1,'Sanma');
INSERT INTO `oc_zone_description` VALUES (539,1,'Sanmatenga');
INSERT INTO `oc_zone_description` VALUES (2079,1,'Sannat');
INSERT INTO `oc_zone_description` VALUES (128,1,'Sant Julia de Loria');
INSERT INTO `oc_zone_description` VALUES (1038,1,'Santa Ana');
INSERT INTO `oc_zone_description` VALUES (1407,1,'Santa Barbara');
INSERT INTO `oc_zone_description` VALUES (463,1,'Santa Catarina');
INSERT INTO `oc_zone_description` VALUES (625,1,'Santa Catarina');
INSERT INTO `oc_zone_description` VALUES (175,1,'Santa Cruz');
INSERT INTO `oc_zone_description` VALUES (410,1,'Santa Cruz');
INSERT INTO `oc_zone_description` VALUES (626,1,'Santa Cruz');
INSERT INTO `oc_zone_description` VALUES (3010,1,'Santa Cruz de Tenerife');
INSERT INTO `oc_zone_description` VALUES (176,1,'Santa Fe');
INSERT INTO `oc_zone_description` VALUES (2054,1,'Santa Lucija');
INSERT INTO `oc_zone_description` VALUES (1321,1,'Santa Rosa');
INSERT INTO `oc_zone_description` VALUES (2057,1,'Santa Venera');
INSERT INTO `oc_zone_description` VALUES (747,1,'Santander');
INSERT INTO `oc_zone_description` VALUES (2664,1,'Santar&eacute;m');
INSERT INTO `oc_zone_description` VALUES (962,1,'Santiago');
INSERT INTO `oc_zone_description` VALUES (881,1,'Santiago de Cuba');
INSERT INTO `oc_zone_description` VALUES (177,1,'Santiago del Estero');
INSERT INTO `oc_zone_description` VALUES (963,1,'Santiago Rodriguez');
INSERT INTO `oc_zone_description` VALUES (964,1,'Santo Domingo');
INSERT INTO `oc_zone_description` VALUES (627,1,'Sao Domingos');
INSERT INTO `oc_zone_description` VALUES (628,1,'Sao Filipe');
INSERT INTO `oc_zone_description` VALUES (629,1,'Sao Nicolau');
INSERT INTO `oc_zone_description` VALUES (464,1,'São Paulo');
INSERT INTO `oc_zone_description` VALUES (2872,1,'Sao Tome');
INSERT INTO `oc_zone_description` VALUES (630,1,'Sao Vicente');
INSERT INTO `oc_zone_description` VALUES (29,1,'Sar-e Pol');
INSERT INTO `oc_zone_description` VALUES (3247,1,'Saraburi');
INSERT INTO `oc_zone_description` VALUES (427,1,'Sarajevo-Romanija or Sokolac');
INSERT INTO `oc_zone_description` VALUES (3067,1,'Saramacca');
INSERT INTO `oc_zone_description` VALUES (64,1,'Sarande');
INSERT INTO `oc_zone_description` VALUES (2616,1,'Sarangani');
INSERT INTO `oc_zone_description` VALUES (4320,1,'Saratov Oblast');
INSERT INTO `oc_zone_description` VALUES (1982,1,'Sarawak');
INSERT INTO `oc_zone_description` VALUES (395,1,'Sarpang');
INSERT INTO `oc_zone_description` VALUES (1186,1,'Sarthe');
INSERT INTO `oc_zone_description` VALUES (265,1,'Sarur');
INSERT INTO `oc_zone_description` VALUES (613,1,'Saskatchewan');
INSERT INTO `oc_zone_description` VALUES (832,1,'Sassandra');
INSERT INTO `oc_zone_description` VALUES (3927,1,'Sassari');
INSERT INTO `oc_zone_description` VALUES (2711,1,'Satu-Mare');
INSERT INTO `oc_zone_description` VALUES (3248,1,'Satun');
INSERT INTO `oc_zone_description` VALUES (2859,1,'Satupa\'itea');
INSERT INTO `oc_zone_description` VALUES (4180,1,'Saulkrastu novads');
INSERT INTO `oc_zone_description` VALUES (3267,1,'Savanes');
INSERT INTO `oc_zone_description` VALUES (1813,1,'Savannakhet');
INSERT INTO `oc_zone_description` VALUES (2145,1,'Savanne');
INSERT INTO `oc_zone_description` VALUES (3959,1,'Savinjska');
INSERT INTO `oc_zone_description` VALUES (3990,1,'Šavnik');
INSERT INTO `oc_zone_description` VALUES (1187,1,'Savoie');
INSERT INTO `oc_zone_description` VALUES (3928,1,'Savona');
INSERT INTO `oc_zone_description` VALUES (1893,1,'Sawfajjin');
INSERT INTO `oc_zone_description` VALUES (1901,1,'Schaan');
INSERT INTO `oc_zone_description` VALUES (3111,1,'Schaffhausen');
INSERT INTO `oc_zone_description` VALUES (1909,1,'Schellenberg');
INSERT INTO `oc_zone_description` VALUES (1268,1,'Schleswig-Holstein');
INSERT INTO `oc_zone_description` VALUES (3112,1,'Schwyz');
INSERT INTO `oc_zone_description` VALUES (3588,1,'Scottish Borders');
INSERT INTO `oc_zone_description` VALUES (2011,1,'Segou');
INSERT INTO `oc_zone_description` VALUES (3011,1,'Segovia');
INSERT INTO `oc_zone_description` VALUES (833,1,'Seguela');
INSERT INTO `oc_zone_description` VALUES (1191,1,'Seine et Marne');
INSERT INTO `oc_zone_description` VALUES (1190,1,'Seine Maritime');
INSERT INTO `oc_zone_description` VALUES (1207,1,'Seine St-Denis');
INSERT INTO `oc_zone_description` VALUES (4182,1,'Sējas novads');
INSERT INTO `oc_zone_description` VALUES (4255,1,'Sejong-teukbyeoljachisi');
INSERT INTO `oc_zone_description` VALUES (1983,1,'Selangor');
INSERT INTO `oc_zone_description` VALUES (2204,1,'Selenge');
INSERT INTO `oc_zone_description` VALUES (1620,1,'Semaria');
INSERT INTO `oc_zone_description` VALUES (3435,1,'Sembabule');
INSERT INTO `oc_zone_description` VALUES (1562,1,'Semnan');
INSERT INTO `oc_zone_description` VALUES (540,1,'Seno');
INSERT INTO `oc_zone_description` VALUES (4239,1,'Seoul-teukbyeolsi');
INSERT INTO `oc_zone_description` VALUES (465,1,'Sergipe');
INSERT INTO `oc_zone_description` VALUES (2871,1,'Serravalle');
INSERT INTO `oc_zone_description` VALUES (2665,1,'Set&uacute;bal');
INSERT INTO `oc_zone_description` VALUES (2328,1,'Seti');
INSERT INTO `oc_zone_description` VALUES (105,1,'Setif');
INSERT INTO `oc_zone_description` VALUES (2250,1,'Settat');
INSERT INTO `oc_zone_description` VALUES (3498,1,'Sevastopol');
INSERT INTO `oc_zone_description` VALUES (4472,1,'Severoistočen');
INSERT INTO `oc_zone_description` VALUES (3012,1,'Sevilla');
INSERT INTO `oc_zone_description` VALUES (3307,1,'Sfax');
INSERT INTO `oc_zone_description` VALUES (1423,1,'Sha Tin New Territories');
INSERT INTO `oc_zone_description` VALUES (706,1,'Shaanxi');
INSERT INTO `oc_zone_description` VALUES (2956,1,'Shabeellaha Dhexe');
INSERT INTO `oc_zone_description` VALUES (2957,1,'Shabeellaha Hoose');
INSERT INTO `oc_zone_description` VALUES (3806,1,'Shabwah');
INSERT INTO `oc_zone_description` VALUES (1390,1,'Shag Island');
INSERT INTO `oc_zone_description` VALUES (1416,1,'Sham Shui Po Kowloon');
INSERT INTO `oc_zone_description` VALUES (3054,1,'Shamal Bahr al Ghazal');
INSERT INTO `oc_zone_description` VALUES (3055,1,'Shamal Darfur');
INSERT INTO `oc_zone_description` VALUES (3056,1,'Shamal Kurdufan');
INSERT INTO `oc_zone_description` VALUES (1025,1,'Shamal Sina\'');
INSERT INTO `oc_zone_description` VALUES (2287,1,'Shan State');
INSERT INTO `oc_zone_description` VALUES (707,1,'Shandong');
INSERT INTO `oc_zone_description` VALUES (708,1,'Shanghai');
INSERT INTO `oc_zone_description` VALUES (709,1,'Shanxi');
INSERT INTO `oc_zone_description` VALUES (1621,1,'Sharon');
INSERT INTO `oc_zone_description` VALUES (3057,1,'Sharq al Istiwa\'iyah');
INSERT INTO `oc_zone_description` VALUES (3723,1,'Shefa');
INSERT INTO `oc_zone_description` VALUES (3589,1,'Shetland Islands');
INSERT INTO `oc_zone_description` VALUES (1253,1,'Shida Kartli');
INSERT INTO `oc_zone_description` VALUES (1692,1,'Shiga');
INSERT INTO `oc_zone_description` VALUES (1693,1,'Shimane');
INSERT INTO `oc_zone_description` VALUES (3182,1,'Shinyanga');
INSERT INTO `oc_zone_description` VALUES (186,1,'Shirak');
INSERT INTO `oc_zone_description` VALUES (3073,1,'Shishelweni');
INSERT INTO `oc_zone_description` VALUES (1694,1,'Shizuoka');
INSERT INTO `oc_zone_description` VALUES (62,1,'Shkoder');
INSERT INTO `oc_zone_description` VALUES (3590,1,'Shropshire');
INSERT INTO `oc_zone_description` VALUES (493,1,'Shumen');
INSERT INTO `oc_zone_description` VALUES (1730,1,'Shyghys Qazaqstan');
INSERT INTO `oc_zone_description` VALUES (4444,1,'Shymkent');
INSERT INTO `oc_zone_description` VALUES (3250,1,'Si Sa Ket');
INSERT INTO `oc_zone_description` VALUES (1916,1,'Siauliai');
INSERT INTO `oc_zone_description` VALUES (859,1,'Šibensko-kninska');
INSERT INTO `oc_zone_description` VALUES (2713,1,'Sibiu');
INSERT INTO `oc_zone_description` VALUES (710,1,'Sichuan');
INSERT INTO `oc_zone_description` VALUES (3308,1,'Sidi');
INSERT INTO `oc_zone_description` VALUES (106,1,'Sidi Bel Abbes');
INSERT INTO `oc_zone_description` VALUES (2251,1,'Sidi Kacem');
INSERT INTO `oc_zone_description` VALUES (588,1,'Siemreap');
INSERT INTO `oc_zone_description` VALUES (3929,1,'Siena');
INSERT INTO `oc_zone_description` VALUES (3787,1,'Sigave');
INSERT INTO `oc_zone_description` VALUES (2058,1,'Siggiewi');
INSERT INTO `oc_zone_description` VALUES (1356,1,'Siguiri');
INSERT INTO `oc_zone_description` VALUES (4184,1,'Siguldas novads');
INSERT INTO `oc_zone_description` VALUES (3383,1,'Siirt');
INSERT INTO `oc_zone_description` VALUES (2012,1,'Sikasso');
INSERT INTO `oc_zone_description` VALUES (1502,1,'Sikkim');
INSERT INTO `oc_zone_description` VALUES (3309,1,'Siliana');
INSERT INTO `oc_zone_description` VALUES (494,1,'Silistra');
INSERT INTO `oc_zone_description` VALUES (2169,1,'Sinaloa');
INSERT INTO `oc_zone_description` VALUES (2462,1,'Sindh');
INSERT INTO `oc_zone_description` VALUES (834,1,'Sinfra');
INSERT INTO `oc_zone_description` VALUES (3249,1,'Sing Buri');
INSERT INTO `oc_zone_description` VALUES (3183,1,'Singida');
INSERT INTO `oc_zone_description` VALUES (3058,1,'Sinnar');
INSERT INTO `oc_zone_description` VALUES (1874,1,'Sinoe');
INSERT INTO `oc_zone_description` VALUES (3384,1,'Sinop');
INSERT INTO `oc_zone_description` VALUES (4022,1,'Sint Eustatius');
INSERT INTO `oc_zone_description` VALUES (3068,1,'Sipaliwini');
INSERT INTO `oc_zone_description` VALUES (3283,1,'Siparia');
INSERT INTO `oc_zone_description` VALUES (2617,1,'Siquijor');
INSERT INTO `oc_zone_description` VALUES (3930,1,'Siracusa');
INSERT INTO `oc_zone_description` VALUES (3715,1,'Sirdaryo');
INSERT INTO `oc_zone_description` VALUES (3449,1,'Sironko');
INSERT INTO `oc_zone_description` VALUES (860,1,'Sisačko-moslavačka');
INSERT INTO `oc_zone_description` VALUES (541,1,'Sissili');
INSERT INTO `oc_zone_description` VALUES (1558,1,'Sistan and Baluchistan');
INSERT INTO `oc_zone_description` VALUES (3386,1,'Sivas');
INSERT INTO `oc_zone_description` VALUES (266,1,'Siyazan');
INSERT INTO `oc_zone_description` VALUES (3385,1,'Şırnak');
INSERT INTO `oc_zone_description` VALUES (908,1,'Sjælland');
INSERT INTO `oc_zone_description` VALUES (3086,1,'Sk&aring;ne');
INSERT INTO `oc_zone_description` VALUES (107,1,'Skikda');
INSERT INTO `oc_zone_description` VALUES (4473,1,'Skopski');
INSERT INTO `oc_zone_description` VALUES (63,1,'Skrapar');
INSERT INTO `oc_zone_description` VALUES (4185,1,'Skrīveru novads');
INSERT INTO `oc_zone_description` VALUES (4187,1,'Skrundas novads');
INSERT INTO `oc_zone_description` VALUES (2642,1,'Slaskie');
INSERT INTO `oc_zone_description` VALUES (2059,1,'Sliema');
INSERT INTO `oc_zone_description` VALUES (1606,1,'Sligo');
INSERT INTO `oc_zone_description` VALUES (495,1,'Sliven');
INSERT INTO `oc_zone_description` VALUES (4189,1,'Smiltenes novads');
INSERT INTO `oc_zone_description` VALUES (380,1,'Smith\'s');
INSERT INTO `oc_zone_description` VALUES (4323,1,'Smolensk Oblast');
INSERT INTO `oc_zone_description` VALUES (496,1,'Smolyan');
INSERT INTO `oc_zone_description` VALUES (3087,1,'Södermanland');
INSERT INTO `oc_zone_description` VALUES (2271,1,'Sofala');
INSERT INTO `oc_zone_description` VALUES (497,1,'Sofia');
INSERT INTO `oc_zone_description` VALUES (498,1,'Sofia - town');
INSERT INTO `oc_zone_description` VALUES (2443,1,'Sogn og Fjordane');
INSERT INTO `oc_zone_description` VALUES (2421,1,'Sokoto');
INSERT INTO `oc_zone_description` VALUES (1322,1,'Solola');
INSERT INTO `oc_zone_description` VALUES (3113,1,'Solothurn');
INSERT INTO `oc_zone_description` VALUES (1731,1,'Soltustik Qazaqstan');
INSERT INTO `oc_zone_description` VALUES (1075,1,'Somali');
INSERT INTO `oc_zone_description` VALUES (3591,1,'Somerset');
INSERT INTO `oc_zone_description` VALUES (1194,1,'Somme');
INSERT INTO `oc_zone_description` VALUES (4460,1,'Somogy');
INSERT INTO `oc_zone_description` VALUES (3931,1,'Sondrio');
INSERT INTO `oc_zone_description` VALUES (4439,1,'Sondrio, Livigno');
INSERT INTO `oc_zone_description` VALUES (3251,1,'Songkhla');
INSERT INTO `oc_zone_description` VALUES (2170,1,'Sonora');
INSERT INTO `oc_zone_description` VALUES (1039,1,'Sonsonate');
INSERT INTO `oc_zone_description` VALUES (2478,1,'Sonsorol');
INSERT INTO `oc_zone_description` VALUES (2958,1,'Sool');
INSERT INTO `oc_zone_description` VALUES (2442,1,'Sor-Trondelag');
INSERT INTO `oc_zone_description` VALUES (3013,1,'Soria');
INSERT INTO `oc_zone_description` VALUES (3703,1,'Soriano');
INSERT INTO `oc_zone_description` VALUES (2188,1,'Soroca');
INSERT INTO `oc_zone_description` VALUES (3450,1,'Soroti');
INSERT INTO `oc_zone_description` VALUES (2618,1,'Sorsogon');
INSERT INTO `oc_zone_description` VALUES (835,1,'Soubre');
INSERT INTO `oc_zone_description` VALUES (2844,1,'Soufriere');
INSERT INTO `oc_zone_description` VALUES (108,1,'Souk Ahras');
INSERT INTO `oc_zone_description` VALUES (542,1,'Soum');
INSERT INTO `oc_zone_description` VALUES (543,1,'Sourou');
INSERT INTO `oc_zone_description` VALUES (3310,1,'Sousse');
INSERT INTO `oc_zone_description` VALUES (4230,1,'South');
INSERT INTO `oc_zone_description` VALUES (600,1,'South (Sud)');
INSERT INTO `oc_zone_description` VALUES (310,1,'South Abaco');
INSERT INTO `oc_zone_description` VALUES (1289,1,'South Aegean');
INSERT INTO `oc_zone_description` VALUES (311,1,'South Andros');
INSERT INTO `oc_zone_description` VALUES (195,1,'South Australia');
INSERT INTO `oc_zone_description` VALUES (3592,1,'South Ayrshire');
INSERT INTO `oc_zone_description` VALUES (4000,1,'South Bačka');
INSERT INTO `oc_zone_description` VALUES (3998,1,'South Banat');
INSERT INTO `oc_zone_description` VALUES (3409,1,'South Caicos');
INSERT INTO `oc_zone_description` VALUES (3666,1,'South Carolina');
INSERT INTO `oc_zone_description` VALUES (2619,1,'South Cotabato');
INSERT INTO `oc_zone_description` VALUES (3667,1,'South Dakota');
INSERT INTO `oc_zone_description` VALUES (438,1,'South East');
INSERT INTO `oc_zone_description` VALUES (312,1,'South Eleuthera');
INSERT INTO `oc_zone_description` VALUES (718,1,'South Island');
INSERT INTO `oc_zone_description` VALUES (1567,1,'South Khorasan');
INSERT INTO `oc_zone_description` VALUES (3593,1,'South Lanarkshire');
INSERT INTO `oc_zone_description` VALUES (635,1,'South Town');
INSERT INTO `oc_zone_description` VALUES (3594,1,'South Yorkshire');
INSERT INTO `oc_zone_description` VALUES (381,1,'Southampton');
INSERT INTO `oc_zone_description` VALUES (319,1,'Southern');
INSERT INTO `oc_zone_description` VALUES (439,1,'Southern');
INSERT INTO `oc_zone_description` VALUES (2923,1,'Southern');
INSERT INTO `oc_zone_description` VALUES (3028,1,'Southern');
INSERT INTO `oc_zone_description` VALUES (3830,1,'Southern');
INSERT INTO `oc_zone_description` VALUES (1052,1,'Southern (Debub)');
INSERT INTO `oc_zone_description` VALUES (2505,1,'Southern Highlands');
INSERT INTO `oc_zone_description` VALUES (1412,1,'Southern Hong Kong Island');
INSERT INTO `oc_zone_description` VALUES (2620,1,'Southern Leyte');
INSERT INTO `oc_zone_description` VALUES (1076,1,'Southern Nations - Nationalities and Peoples Region');
INSERT INTO `oc_zone_description` VALUES (1050,1,'Southern Red Sea (Debub-Keih-Bahri)');
INSERT INTO `oc_zone_description` VALUES (2357,1,'Southland');
INSERT INTO `oc_zone_description` VALUES (601,1,'Southwest (Sud-Ouest).');
INSERT INTO `oc_zone_description` VALUES (313,1,'Spanish Wells');
INSERT INTO `oc_zone_description` VALUES (862,1,'Splitsko-dalmatinska');
INSERT INTO `oc_zone_description` VALUES (3961,1,'Spodnjeposavska');
INSERT INTO `oc_zone_description` VALUES (636,1,'Spot Bay');
INSERT INTO `oc_zone_description` VALUES (418,1,'Srednjebosanski Kanton');
INSERT INTO `oc_zone_description` VALUES (4001,1,'Srem');
INSERT INTO `oc_zone_description` VALUES (1934,1,'St. Anthony Parish');
INSERT INTO `oc_zone_description` VALUES (3110,1,'St. Gallen');
INSERT INTO `oc_zone_description` VALUES (1937,1,'St. Lawrence Parish');
INSERT INTO `oc_zone_description` VALUES (1935,1,'St. Lazarus Parish');
INSERT INTO `oc_zone_description` VALUES (2191,1,'St‚nga Nistrului');
INSERT INTO `oc_zone_description` VALUES (3595,1,'Staffordshire');
INSERT INTO `oc_zone_description` VALUES (637,1,'Stake Bay');
INSERT INTO `oc_zone_description` VALUES (358,1,'Stann Creek');
INSERT INTO `oc_zone_description` VALUES (499,1,'Stara Zagora');
INSERT INTO `oc_zone_description` VALUES (4282,1,'Stavropol Krai');
INSERT INTO `oc_zone_description` VALUES (204,1,'Steiermark');
INSERT INTO `oc_zone_description` VALUES (3596,1,'Stirling');
INSERT INTO `oc_zone_description` VALUES (3088,1,'Stockholm');
INSERT INTO `oc_zone_description` VALUES (4192,1,'Stopiņu novads');
INSERT INTO `oc_zone_description` VALUES (900,1,'Středočeský');
INSERT INTO `oc_zone_description` VALUES (4194,1,'Strenču novads');
INSERT INTO `oc_zone_description` VALUES (589,1,'Stung Treng');
INSERT INTO `oc_zone_description` VALUES (2714,1,'Suceava');
INSERT INTO `oc_zone_description` VALUES (1323,1,'Suchitepequez');
INSERT INTO `oc_zone_description` VALUES (748,1,'Sucre');
INSERT INTO `oc_zone_description` VALUES (3745,1,'Sucre');
INSERT INTO `oc_zone_description` VALUES (998,1,'Sucumb&iacute;os');
INSERT INTO `oc_zone_description` VALUES (1386,1,'Sud');
INSERT INTO `oc_zone_description` VALUES (2343,1,'Sud');
INSERT INTO `oc_zone_description` VALUES (1387,1,'Sud-Est');
INSERT INTO `oc_zone_description` VALUES (3822,1,'Sud-Kivu');
INSERT INTO `oc_zone_description` VALUES (3597,1,'Suffolk');
INSERT INTO `oc_zone_description` VALUES (3162,1,'Sughd');
INSERT INTO `oc_zone_description` VALUES (1026,1,'Suhaj');
INSERT INTO `oc_zone_description` VALUES (2205,1,'Suhbaatar');
INSERT INTO `oc_zone_description` VALUES (3252,1,'Sukhothai');
INSERT INTO `oc_zone_description` VALUES (4234,1,'Sulawesi Barat');
INSERT INTO `oc_zone_description` VALUES (1530,1,'Sulawesi Selatan');
INSERT INTO `oc_zone_description` VALUES (1531,1,'Sulawesi Tengah');
INSERT INTO `oc_zone_description` VALUES (1532,1,'Sulawesi Tenggara');
INSERT INTO `oc_zone_description` VALUES (1533,1,'Sulawesi Utara');
INSERT INTO `oc_zone_description` VALUES (2621,1,'Sultan Kudarat');
INSERT INTO `oc_zone_description` VALUES (2622,1,'Sulu');
INSERT INTO `oc_zone_description` VALUES (4006,1,'Šumadija');
INSERT INTO `oc_zone_description` VALUES (1534,1,'Sumatera Barat');
INSERT INTO `oc_zone_description` VALUES (1535,1,'Sumatera Selatan');
INSERT INTO `oc_zone_description` VALUES (1536,1,'Sumatera Utara');
INSERT INTO `oc_zone_description` VALUES (261,1,'Sumqayit');
INSERT INTO `oc_zone_description` VALUES (3499,1,'Sumska');
INSERT INTO `oc_zone_description` VALUES (1471,1,'Suourland');
INSERT INTO `oc_zone_description` VALUES (1472,1,'Suournes');
INSERT INTO `oc_zone_description` VALUES (3253,1,'Suphan Buri');
INSERT INTO `oc_zone_description` VALUES (3254,1,'Surat Thani');
INSERT INTO `oc_zone_description` VALUES (2623,1,'Surigao del Norte');
INSERT INTO `oc_zone_description` VALUES (2624,1,'Surigao del Sur');
INSERT INTO `oc_zone_description` VALUES (3255,1,'Surin');
INSERT INTO `oc_zone_description` VALUES (3598,1,'Surrey');
INSERT INTO `oc_zone_description` VALUES (1894,1,'Surt');
INSERT INTO `oc_zone_description` VALUES (772,1,'Surwarrow');
INSERT INTO `oc_zone_description` VALUES (3716,1,'Surxondaryo');
INSERT INTO `oc_zone_description` VALUES (267,1,'Susa');
INSERT INTO `oc_zone_description` VALUES (268,1,'Susa');
INSERT INTO `oc_zone_description` VALUES (2444,1,'Svalbard');
INSERT INTO `oc_zone_description` VALUES (590,1,'Svay Rieng');
INSERT INTO `oc_zone_description` VALUES (4322,1,'Sverdlovsk Oblast');
INSERT INTO `oc_zone_description` VALUES (120,1,'Swains Island');
INSERT INTO `oc_zone_description` VALUES (3599,1,'Swansea');
INSERT INTO `oc_zone_description` VALUES (2060,1,'Swieqi');
INSERT INTO `oc_zone_description` VALUES (2643,1,'Swietokrzyskie');
INSERT INTO `oc_zone_description` VALUES (905,1,'Syddanmark');
INSERT INTO `oc_zone_description` VALUES (325,1,'Sylhet');
INSERT INTO `oc_zone_description` VALUES (187,1,'Syunik\'');
INSERT INTO `oc_zone_description` VALUES (4461,1,'Szabolcs-Szatmár-Bereg');
INSERT INTO `oc_zone_description` VALUES (3147,1,'T\'ai-chung');
INSERT INTO `oc_zone_description` VALUES (3156,1,'T\'ai-chung');
INSERT INTO `oc_zone_description` VALUES (3148,1,'T\'ai-nan');
INSERT INTO `oc_zone_description` VALUES (3157,1,'T\'ai-nan');
INSERT INTO `oc_zone_description` VALUES (3159,1,'T\'ai-pei city');
INSERT INTO `oc_zone_description` VALUES (3149,1,'T\'ai-pei county');
INSERT INTO `oc_zone_description` VALUES (3150,1,'T\'ai-tung');
INSERT INTO `oc_zone_description` VALUES (3151,1,'T\'ao-yuan');
INSERT INTO `oc_zone_description` VALUES (2061,1,'Ta Xbiex');
INSERT INTO `oc_zone_description` VALUES (3807,1,'Ta\'izz');
INSERT INTO `oc_zone_description` VALUES (2171,1,'Tabasco');
INSERT INTO `oc_zone_description` VALUES (1757,1,'Tabiteuea');
INSERT INTO `oc_zone_description` VALUES (3184,1,'Tabora');
INSERT INTO `oc_zone_description` VALUES (836,1,'Tabou');
INSERT INTO `oc_zone_description` VALUES (1758,1,'Tabuaeran');
INSERT INTO `oc_zone_description` VALUES (2886,1,'Tabuk');
INSERT INTO `oc_zone_description` VALUES (3746,1,'Tachira');
INSERT INTO `oc_zone_description` VALUES (2549,1,'Tacna');
INSERT INTO `oc_zone_description` VALUES (3704,1,'Tacuarembo');
INSERT INTO `oc_zone_description` VALUES (923,1,'Tadjoura');
INSERT INTO `oc_zone_description` VALUES (3724,1,'Tafea');
INSERT INTO `oc_zone_description` VALUES (2125,1,'Tagant');
INSERT INTO `oc_zone_description` VALUES (2385,1,'Tahoua');
INSERT INTO `oc_zone_description` VALUES (1424,1,'Tai Po New Territories');
INSERT INTO `oc_zone_description` VALUES (3256,1,'Tak');
INSERT INTO `oc_zone_description` VALUES (2920,1,'Takamaka');
INSERT INTO `oc_zone_description` VALUES (591,1,'Takeo');
INSERT INTO `oc_zone_description` VALUES (30,1,'Takhar');
INSERT INTO `oc_zone_description` VALUES (776,1,'Takutea');
INSERT INTO `oc_zone_description` VALUES (1799,1,'Talas');
INSERT INTO `oc_zone_description` VALUES (4197,1,'Talsu novads');
INSERT INTO `oc_zone_description` VALUES (1759,1,'Tamana');
INSERT INTO `oc_zone_description` VALUES (109,1,'Tamanrasset');
INSERT INTO `oc_zone_description` VALUES (2172,1,'Tamaulipas');
INSERT INTO `oc_zone_description` VALUES (2895,1,'Tambacounda');
INSERT INTO `oc_zone_description` VALUES (4324,1,'Tambov Oblast');
INSERT INTO `oc_zone_description` VALUES (1503,1,'Tamil Nadu');
INSERT INTO `oc_zone_description` VALUES (2253,1,'Tan-Tan');
INSERT INTO `oc_zone_description` VALUES (837,1,'Tanda');
INSERT INTO `oc_zone_description` VALUES (670,1,'Tandjile');
INSERT INTO `oc_zone_description` VALUES (3185,1,'Tanga');
INSERT INTO `oc_zone_description` VALUES (2252,1,'Tangier');
INSERT INTO `oc_zone_description` VALUES (2279,1,'Tanintharyi');
INSERT INTO `oc_zone_description` VALUES (2254,1,'Taounate');
INSERT INTO `oc_zone_description` VALUES (544,1,'Tapoa');
INSERT INTO `oc_zone_description` VALUES (2422,1,'Taraba');
INSERT INTO `oc_zone_description` VALUES (1895,1,'Tarabulus (Tripoli)');
INSERT INTO `oc_zone_description` VALUES (2358,1,'Taranaki');
INSERT INTO `oc_zone_description` VALUES (3932,1,'Taranto');
INSERT INTO `oc_zone_description` VALUES (682,1,'Tarapaca');
INSERT INTO `oc_zone_description` VALUES (1760,1,'Tarawa');
INSERT INTO `oc_zone_description` VALUES (500,1,'Targovishte');
INSERT INTO `oc_zone_description` VALUES (1896,1,'Tarhunah');
INSERT INTO `oc_zone_description` VALUES (411,1,'Tarija');
INSERT INTO `oc_zone_description` VALUES (2625,1,'Tarlac');
INSERT INTO `oc_zone_description` VALUES (1195,1,'Tarn');
INSERT INTO `oc_zone_description` VALUES (1196,1,'Tarn et Garonne');
INSERT INTO `oc_zone_description` VALUES (2255,1,'Taroudannt');
INSERT INTO `oc_zone_description` VALUES (631,1,'Tarrafal');
INSERT INTO `oc_zone_description` VALUES (3014,1,'Tarragona');
INSERT INTO `oc_zone_description` VALUES (269,1,'Tartar');
INSERT INTO `oc_zone_description` VALUES (1065,1,'Tartumaa (Tartu)');
INSERT INTO `oc_zone_description` VALUES (3134,1,'Tartus');
INSERT INTO `oc_zone_description` VALUES (2062,1,'Tarxien');
INSERT INTO `oc_zone_description` VALUES (196,1,'Tasmania');
INSERT INTO `oc_zone_description` VALUES (2256,1,'Tata');
INSERT INTO `oc_zone_description` VALUES (3311,1,'Tataouine');
INSERT INTO `oc_zone_description` VALUES (4272,1,'Tatarstan, Republic of');
INSERT INTO `oc_zone_description` VALUES (1917,1,'Taurage');
INSERT INTO `oc_zone_description` VALUES (188,1,'Tavush');
INSERT INTO `oc_zone_description` VALUES (2626,1,'Tawi-Tawi');
INSERT INTO `oc_zone_description` VALUES (2257,1,'Taza');
INSERT INTO `oc_zone_description` VALUES (1244,1,'Tbilisi');
INSERT INTO `oc_zone_description` VALUES (110,1,'Tebessa');
INSERT INTO `oc_zone_description` VALUES (1538,1,'Tehran');
INSERT INTO `oc_zone_description` VALUES (3387,1,'Tekirdağ');
INSERT INTO `oc_zone_description` VALUES (1622,1,'Tel Aviv (Gosh Dan)');
INSERT INTO `oc_zone_description` VALUES (4231,1,'Telangana');
INSERT INTO `oc_zone_description` VALUES (2445,1,'Telemark');
INSERT INTO `oc_zone_description` VALUES (2715,1,'Teleorman');
INSERT INTO `oc_zone_description` VALUES (1357,1,'Telimele');
INSERT INTO `oc_zone_description` VALUES (1918,1,'Telsiai');
INSERT INTO `oc_zone_description` VALUES (477,1,'Temburong');
INSERT INTO `oc_zone_description` VALUES (2941,1,'Temotu');
INSERT INTO `oc_zone_description` VALUES (3668,1,'Tennessee');
INSERT INTO `oc_zone_description` VALUES (65,1,'Tepelene');
INSERT INTO `oc_zone_description` VALUES (1761,1,'Teraina');
INSERT INTO `oc_zone_description` VALUES (3933,1,'Teramo');
INSERT INTO `oc_zone_description` VALUES (1984,1,'Terengganu');
INSERT INTO `oc_zone_description` VALUES (3934,1,'Terni');
INSERT INTO `oc_zone_description` VALUES (3500,1,'Ternopilska');
INSERT INTO `oc_zone_description` VALUES (1204,1,'Territoire de Belfort');
INSERT INTO `oc_zone_description` VALUES (3015,1,'Teruel');
INSERT INTO `oc_zone_description` VALUES (4198,1,'Tērvetes novads');
INSERT INTO `oc_zone_description` VALUES (2272,1,'Tete');
INSERT INTO `oc_zone_description` VALUES (2258,1,'Tetouan');
INSERT INTO `oc_zone_description` VALUES (3669,1,'Texas');
INSERT INTO `oc_zone_description` VALUES (1861,1,'Thaba-Tseka');
INSERT INTO `oc_zone_description` VALUES (1290,1,'Thessaly');
INSERT INTO `oc_zone_description` VALUES (2896,1,'Thies');
INSERT INTO `oc_zone_description` VALUES (1987,1,'Thiladhunmathi Dhekunu');
INSERT INTO `oc_zone_description` VALUES (1986,1,'Thiladhunmathi Uthuru');
INSERT INTO `oc_zone_description` VALUES (396,1,'Thimphu');
INSERT INTO `oc_zone_description` VALUES (470,1,'Three Brothers');
INSERT INTO `oc_zone_description` VALUES (3114,1,'Thurgau');
INSERT INTO `oc_zone_description` VALUES (1269,1,'Thüringen');
INSERT INTO `oc_zone_description` VALUES (1969,1,'Thyolo');
INSERT INTO `oc_zone_description` VALUES (711,1,'Tianjin');
INSERT INTO `oc_zone_description` VALUES (111,1,'Tiaret');
INSERT INTO `oc_zone_description` VALUES (840,1,'Tiassale');
INSERT INTO `oc_zone_description` VALUES (3115,1,'Ticino');
INSERT INTO `oc_zone_description` VALUES (838,1,'Tiebissou');
INSERT INTO `oc_zone_description` VALUES (178,1,'Tierra del Fuego');
INSERT INTO `oc_zone_description` VALUES (2189,1,'Tighina');
INSERT INTO `oc_zone_description` VALUES (1077,1,'Tigray');
INSERT INTO `oc_zone_description` VALUES (2386,1,'Tillaberi');
INSERT INTO `oc_zone_description` VALUES (2716,1,'Timiș');
INSERT INTO `oc_zone_description` VALUES (112,1,'Tindouf');
INSERT INTO `oc_zone_description` VALUES (839,1,'Tingrela');
INSERT INTO `oc_zone_description` VALUES (2428,1,'Tinian');
INSERT INTO `oc_zone_description` VALUES (113,1,'Tipaza');
INSERT INTO `oc_zone_description` VALUES (1607,1,'Tipperary');
INSERT INTO `oc_zone_description` VALUES (67,1,'Tirane');
INSERT INTO `oc_zone_description` VALUES (2126,1,'Tiris Zemmour');
INSERT INTO `oc_zone_description` VALUES (205,1,'Tirol');
INSERT INTO `oc_zone_description` VALUES (114,1,'Tissemsilt');
INSERT INTO `oc_zone_description` VALUES (3991,1,'Tivat');
INSERT INTO `oc_zone_description` VALUES (115,1,'Tizi Ouzou');
INSERT INTO `oc_zone_description` VALUES (2259,1,'Tiznit');
INSERT INTO `oc_zone_description` VALUES (2173,1,'Tlaxcala');
INSERT INTO `oc_zone_description` VALUES (116,1,'Tlemcen');
INSERT INTO `oc_zone_description` VALUES (1942,1,'Toamasina');
INSERT INTO `oc_zone_description` VALUES (3290,1,'Tobago');
INSERT INTO `oc_zone_description` VALUES (466,1,'Tocantins');
INSERT INTO `oc_zone_description` VALUES (1695,1,'Tochigi');
INSERT INTO `oc_zone_description` VALUES (2959,1,'Togdheer');
INSERT INTO `oc_zone_description` VALUES (3388,1,'Tokat');
INSERT INTO `oc_zone_description` VALUES (2110,1,'Toke');
INSERT INTO `oc_zone_description` VALUES (1696,1,'Tokushima');
INSERT INTO `oc_zone_description` VALUES (1697,1,'Tokyo');
INSERT INTO `oc_zone_description` VALUES (359,1,'Toledo');
INSERT INTO `oc_zone_description` VALUES (3016,1,'Toledo');
INSERT INTO `oc_zone_description` VALUES (1943,1,'Toliara');
INSERT INTO `oc_zone_description` VALUES (749,1,'Tolima');
INSERT INTO `oc_zone_description` VALUES (4462,1,'Tolna');
INSERT INTO `oc_zone_description` VALUES (1368,1,'Tombali Region');
INSERT INTO `oc_zone_description` VALUES (2013,1,'Tombouctou');
INSERT INTO `oc_zone_description` VALUES (4326,1,'Tomsk Oblast');
INSERT INTO `oc_zone_description` VALUES (3274,1,'Tongatapu');
INSERT INTO `oc_zone_description` VALUES (4015,1,'Toplica');
INSERT INTO `oc_zone_description` VALUES (3725,1,'Torba');
INSERT INTO `oc_zone_description` VALUES (3600,1,'Torfaen');
INSERT INTO `oc_zone_description` VALUES (3935,1,'Torino');
INSERT INTO `oc_zone_description` VALUES (3451,1,'Tororo');
INSERT INTO `oc_zone_description` VALUES (3717,1,'Toshkent City');
INSERT INTO `oc_zone_description` VALUES (3718,1,'Toshkent Region');
INSERT INTO `oc_zone_description` VALUES (1324,1,'Totonicapan');
INSERT INTO `oc_zone_description` VALUES (1698,1,'Tottori');
INSERT INTO `oc_zone_description` VALUES (841,1,'Touba');
INSERT INTO `oc_zone_description` VALUES (1358,1,'Tougue');
INSERT INTO `oc_zone_description` VALUES (842,1,'Toulepleu');
INSERT INTO `oc_zone_description` VALUES (843,1,'Toumodi');
INSERT INTO `oc_zone_description` VALUES (2203,1,'Tov');
INSERT INTO `oc_zone_description` VALUES (270,1,'Tovuz');
INSERT INTO `oc_zone_description` VALUES (1699,1,'Toyama');
INSERT INTO `oc_zone_description` VALUES (3312,1,'Tozeur');
INSERT INTO `oc_zone_description` VALUES (3389,1,'Trabzon');
INSERT INTO `oc_zone_description` VALUES (3257,1,'Trang');
INSERT INTO `oc_zone_description` VALUES (3936,1,'Trapani');
INSERT INTO `oc_zone_description` VALUES (2127,1,'Trarza');
INSERT INTO `oc_zone_description` VALUES (397,1,'Trashigang');
INSERT INTO `oc_zone_description` VALUES (398,1,'Trashiyangste');
INSERT INTO `oc_zone_description` VALUES (3258,1,'Trat');
INSERT INTO `oc_zone_description` VALUES (429,1,'Trebinje');
INSERT INTO `oc_zone_description` VALUES (3705,1,'Treinta y Tres');
INSERT INTO `oc_zone_description` VALUES (1655,1,'Trelawny Parish');
INSERT INTO `oc_zone_description` VALUES (2930,1,'Trenčiansky');
INSERT INTO `oc_zone_description` VALUES (3937,1,'Trento');
INSERT INTO `oc_zone_description` VALUES (3938,1,'Treviso');
INSERT INTO `oc_zone_description` VALUES (1903,1,'Triesen');
INSERT INTO `oc_zone_description` VALUES (1906,1,'Triesenberg');
INSERT INTO `oc_zone_description` VALUES (3939,1,'Trieste');
INSERT INTO `oc_zone_description` VALUES (2834,1,'Trinity Palmetto Point');
INSERT INTO `oc_zone_description` VALUES (1504,1,'Tripura');
INSERT INTO `oc_zone_description` VALUES (2931,1,'Trnavský');
INSERT INTO `oc_zone_description` VALUES (2446,1,'Troms');
INSERT INTO `oc_zone_description` VALUES (399,1,'Trongsa');
INSERT INTO `oc_zone_description` VALUES (66,1,'Tropoje');
INSERT INTO `oc_zone_description` VALUES (3747,1,'Trujillo');
INSERT INTO `oc_zone_description` VALUES (400,1,'Tsirang');
INSERT INTO `oc_zone_description` VALUES (1425,1,'Tsuen Wan New Territories');
INSERT INTO `oc_zone_description` VALUES (2860,1,'Tuamasaga');
INSERT INTO `oc_zone_description` VALUES (1897,1,'Tubruq');
INSERT INTO `oc_zone_description` VALUES (179,1,'Tucuman');
INSERT INTO `oc_zone_description` VALUES (1426,1,'Tuen Mun New Territories');
INSERT INTO `oc_zone_description` VALUES (4199,1,'Tukuma novads');
INSERT INTO `oc_zone_description` VALUES (4327,1,'Tula Oblast');
INSERT INTO `oc_zone_description` VALUES (2717,1,'Tulcea');
INSERT INTO `oc_zone_description` VALUES (2550,1,'Tumbes');
INSERT INTO `oc_zone_description` VALUES (3284,1,'Tunapuna/Piarco');
INSERT INTO `oc_zone_description` VALUES (3390,1,'Tunceli');
INSERT INTO `oc_zone_description` VALUES (999,1,'Tungurahua');
INSERT INTO `oc_zone_description` VALUES (3313,1,'Tunis');
INSERT INTO `oc_zone_description` VALUES (1294,1,'Tunu');
INSERT INTO `oc_zone_description` VALUES (478,1,'Tutong');
INSERT INTO `oc_zone_description` VALUES (4273,1,'Tuva Republic');
INSERT INTO `oc_zone_description` VALUES (545,1,'Tuy');
INSERT INTO `oc_zone_description` VALUES (415,1,'Tuzlanski Kanton');
INSERT INTO `oc_zone_description` VALUES (4325,1,'Tver Oblast');
INSERT INTO `oc_zone_description` VALUES (3601,1,'Tyne and Wear');
INSERT INTO `oc_zone_description` VALUES (4328,1,'Tyumen Oblast');
INSERT INTO `oc_zone_description` VALUES (2313,1,'Uaboe');
INSERT INTO `oc_zone_description` VALUES (3259,1,'Ubon Ratchathani');
INSERT INTO `oc_zone_description` VALUES (271,1,'Ucar');
INSERT INTO `oc_zone_description` VALUES (2551,1,'Ucayali');
INSERT INTO `oc_zone_description` VALUES (3940,1,'Udine');
INSERT INTO `oc_zone_description` VALUES (4274,1,'Udmurt Republic');
INSERT INTO `oc_zone_description` VALUES (3260,1,'Udon Thani');
INSERT INTO `oc_zone_description` VALUES (145,1,'Uige');
INSERT INTO `oc_zone_description` VALUES (2111,1,'Ujae');
INSERT INTO `oc_zone_description` VALUES (2112,1,'Ujelang');
INSERT INTO `oc_zone_description` VALUES (2196,1,'Ulanbaatar');
INSERT INTO `oc_zone_description` VALUES (3992,1,'Ulcinj');
INSERT INTO `oc_zone_description` VALUES (4245,1,'Ulsan-gwangyeoksi');
INSERT INTO `oc_zone_description` VALUES (4329,1,'Ulyanovsk Oblast');
INSERT INTO `oc_zone_description` VALUES (4445,1,'Ulytau');
INSERT INTO `oc_zone_description` VALUES (3512,1,'Umm al Qaywayn');
INSERT INTO `oc_zone_description` VALUES (2677,1,'Umm Sa\'id');
INSERT INTO `oc_zone_description` VALUES (2678,1,'Umm Salal');
INSERT INTO `oc_zone_description` VALUES (2820,1,'Umutara');
INSERT INTO `oc_zone_description` VALUES (2190,1,'Ungheni');
INSERT INTO `oc_zone_description` VALUES (4028,1,'Unity');
INSERT INTO `oc_zone_description` VALUES (413,1,'Unsko-Sanski Kanton');
INSERT INTO `oc_zone_description` VALUES (1377,1,'Upper Demerara-Berbice');
INSERT INTO `oc_zone_description` VALUES (1276,1,'Upper East Region');
INSERT INTO `oc_zone_description` VALUES (4029,1,'Upper Nile');
INSERT INTO `oc_zone_description` VALUES (1240,1,'Upper River');
INSERT INTO `oc_zone_description` VALUES (1378,1,'Upper Takutu-Upper Essequibo');
INSERT INTO `oc_zone_description` VALUES (1277,1,'Upper West Region');
INSERT INTO `oc_zone_description` VALUES (3089,1,'Uppsala');
INSERT INTO `oc_zone_description` VALUES (3116,1,'Uri');
INSERT INTO `oc_zone_description` VALUES (3391,1,'Uşak');
INSERT INTO `oc_zone_description` VALUES (889,1,'Ústecký');
INSERT INTO `oc_zone_description` VALUES (1040,1,'Usulutan');
INSERT INTO `oc_zone_description` VALUES (3670,1,'Utah');
INSERT INTO `oc_zone_description` VALUES (1919,1,'Utena');
INSERT INTO `oc_zone_description` VALUES (3261,1,'Uthai Thani');
INSERT INTO `oc_zone_description` VALUES (2113,1,'Utirik');
INSERT INTO `oc_zone_description` VALUES (2338,1,'Utrecht');
INSERT INTO `oc_zone_description` VALUES (1505,1,'Uttar Pradesh');
INSERT INTO `oc_zone_description` VALUES (3262,1,'Uttaradit');
INSERT INTO `oc_zone_description` VALUES (4343,1,'Uttarakhand');
INSERT INTO `oc_zone_description` VALUES (3029,1,'Uva');
INSERT INTO `oc_zone_description` VALUES (2202,1,'Uvs');
INSERT INTO `oc_zone_description` VALUES (2861,1,'Va\'a-o-Fonoti');
INSERT INTO `oc_zone_description` VALUES (2133,1,'Vacoas-Phoenix');
INSERT INTO `oc_zone_description` VALUES (1900,1,'Vaduz');
INSERT INTO `oc_zone_description` VALUES (4201,1,'Vaiņodes novads');
INSERT INTO `oc_zone_description` VALUES (2862,1,'Vaisigano');
INSERT INTO `oc_zone_description` VALUES (3423,1,'Vaitupu');
INSERT INTO `oc_zone_description` VALUES (653,1,'Vakaga');
INSERT INTO `oc_zone_description` VALUES (1209,1,'Val d\'Oise');
INSERT INTO `oc_zone_description` VALUES (1208,1,'Val de Marne');
INSERT INTO `oc_zone_description` VALUES (3117,1,'Valais');
INSERT INTO `oc_zone_description` VALUES (2719,1,'Vâlcea');
INSERT INTO `oc_zone_description` VALUES (3602,1,'Vale of Glamorgan');
INSERT INTO `oc_zone_description` VALUES (3017,1,'Valencia');
INSERT INTO `oc_zone_description` VALUES (1066,1,'Valgamaa (Valga)');
INSERT INTO `oc_zone_description` VALUES (4204,1,'Valkas novads');
INSERT INTO `oc_zone_description` VALUES (3018,1,'Valladolid');
INSERT INTO `oc_zone_description` VALUES (1408,1,'Valle');
INSERT INTO `oc_zone_description` VALUES (750,1,'Valle del Cauca');
INSERT INTO `oc_zone_description` VALUES (2063,1,'Valletta');
INSERT INTO `oc_zone_description` VALUES (4205,1,'Valmiera');
INSERT INTO `oc_zone_description` VALUES (683,1,'Valparaiso');
INSERT INTO `oc_zone_description` VALUES (965,1,'Valverde');
INSERT INTO `oc_zone_description` VALUES (3392,1,'Van');
INSERT INTO `oc_zone_description` VALUES (1197,1,'Var');
INSERT INTO `oc_zone_description` VALUES (4208,1,'Varakļānu novads');
INSERT INTO `oc_zone_description` VALUES (863,1,'Varaždinska');
INSERT INTO `oc_zone_description` VALUES (4466,1,'Vardarski');
INSERT INTO `oc_zone_description` VALUES (3941,1,'Varese');
INSERT INTO `oc_zone_description` VALUES (3748,1,'Vargas');
INSERT INTO `oc_zone_description` VALUES (4209,1,'Vārkavas novads');
INSERT INTO `oc_zone_description` VALUES (3090,1,'Värmland');
INSERT INTO `oc_zone_description` VALUES (501,1,'Varna');
INSERT INTO `oc_zone_description` VALUES (4463,1,'Vas');
INSERT INTO `oc_zone_description` VALUES (2718,1,'Vaslui');
INSERT INTO `oc_zone_description` VALUES (3091,1,'Västerbotten');
INSERT INTO `oc_zone_description` VALUES (3092,1,'Västernorrland');
INSERT INTO `oc_zone_description` VALUES (3093,1,'Västmanland');
INSERT INTO `oc_zone_description` VALUES (3094,1,'Västra Götaland');
INSERT INTO `oc_zone_description` VALUES (1198,1,'Vaucluse');
INSERT INTO `oc_zone_description` VALUES (3118,1,'Vaud');
INSERT INTO `oc_zone_description` VALUES (751,1,'Vaupes');
INSERT INTO `oc_zone_description` VALUES (3275,1,'Vava\'u');
INSERT INTO `oc_zone_description` VALUES (844,1,'Vavoua');
INSERT INTO `oc_zone_description` VALUES (189,1,'Vayots\' Dzor');
INSERT INTO `oc_zone_description` VALUES (4210,1,'Vecpiebalgas novads');
INSERT INTO `oc_zone_description` VALUES (4211,1,'Vecumnieku novads');
INSERT INTO `oc_zone_description` VALUES (502,1,'Veliko Tarnovo');
INSERT INTO `oc_zone_description` VALUES (1199,1,'Vend&eacute;e');
INSERT INTO `oc_zone_description` VALUES (3942,1,'Venezia');
INSERT INTO `oc_zone_description` VALUES (4212,1,'Ventspils');
INSERT INTO `oc_zone_description` VALUES (4213,1,'Ventspils novads');
INSERT INTO `oc_zone_description` VALUES (2174,1,'Veracruz de Ignacio de la Llave');
INSERT INTO `oc_zone_description` VALUES (2488,1,'Veraguas');
INSERT INTO `oc_zone_description` VALUES (3943,1,'Verbano-Cusio-Ossola');
INSERT INTO `oc_zone_description` VALUES (3944,1,'Vercelli');
INSERT INTO `oc_zone_description` VALUES (3671,1,'Vermont');
INSERT INTO `oc_zone_description` VALUES (3945,1,'Verona');
INSERT INTO `oc_zone_description` VALUES (2447,1,'Vest-Agder');
INSERT INTO `oc_zone_description` VALUES (1473,1,'Vestfiroir');
INSERT INTO `oc_zone_description` VALUES (2448,1,'Vestfold');
INSERT INTO `oc_zone_description` VALUES (1474,1,'Vesturland');
INSERT INTO `oc_zone_description` VALUES (4464,1,'Veszprém');
INSERT INTO `oc_zone_description` VALUES (2666,1,'Viana do Castelo');
INSERT INTO `oc_zone_description` VALUES (1924,1,'Vianden');
INSERT INTO `oc_zone_description` VALUES (3946,1,'Vibo Valentia');
INSERT INTO `oc_zone_description` VALUES (3947,1,'Vicenza');
INSERT INTO `oc_zone_description` VALUES (752,1,'Vichada');
INSERT INTO `oc_zone_description` VALUES (197,1,'Victoria');
INSERT INTO `oc_zone_description` VALUES (2077,1,'Victoria');
INSERT INTO `oc_zone_description` VALUES (503,1,'Vidin');
INSERT INTO `oc_zone_description` VALUES (1200,1,'Vienne');
INSERT INTO `oc_zone_description` VALUES (1801,1,'Vientiane');
INSERT INTO `oc_zone_description` VALUES (1814,1,'Vientiane');
INSERT INTO `oc_zone_description` VALUES (4215,1,'Viesītes novads');
INSERT INTO `oc_zone_description` VALUES (2845,1,'Vieux-Fort');
INSERT INTO `oc_zone_description` VALUES (2667,1,'Vila Real');
INSERT INTO `oc_zone_description` VALUES (4217,1,'Viļakas novads');
INSERT INTO `oc_zone_description` VALUES (4219,1,'Viļānu novads');
INSERT INTO `oc_zone_description` VALUES (1067,1,'Viljandimaa (Viljandi)');
INSERT INTO `oc_zone_description` VALUES (882,1,'Villa Clara');
INSERT INTO `oc_zone_description` VALUES (1920,1,'Vilnius');
INSERT INTO `oc_zone_description` VALUES (3501,1,'Vinnytska');
INSERT INTO `oc_zone_description` VALUES (978,1,'Viqueque');
INSERT INTO `oc_zone_description` VALUES (3672,1,'Virgin Islands');
INSERT INTO `oc_zone_description` VALUES (3673,1,'Virginia');
INSERT INTO `oc_zone_description` VALUES (864,1,'Virovitičko-podravska');
INSERT INTO `oc_zone_description` VALUES (2668,1,'Viseu');
INSERT INTO `oc_zone_description` VALUES (3948,1,'Viterbo');
INSERT INTO `oc_zone_description` VALUES (343,1,'Vitsyebskaya (Vitsyebsk)');
INSERT INTO `oc_zone_description` VALUES (352,1,'Vlaams Brabant');
INSERT INTO `oc_zone_description` VALUES (4289,1,'Vladimir Oblast');
INSERT INTO `oc_zone_description` VALUES (426,1,'Vlasenica');
INSERT INTO `oc_zone_description` VALUES (68,1,'Vlore');
INSERT INTO `oc_zone_description` VALUES (4290,1,'Volgograd Oblast');
INSERT INTO `oc_zone_description` VALUES (4291,1,'Vologda Oblast');
INSERT INTO `oc_zone_description` VALUES (1278,1,'Volta Region');
INSERT INTO `oc_zone_description` VALUES (3502,1,'Volynska');
INSERT INTO `oc_zone_description` VALUES (206,1,'Vorarlberg');
INSERT INTO `oc_zone_description` VALUES (4292,1,'Voronezh Oblast');
INSERT INTO `oc_zone_description` VALUES (1068,1,'Vorumaa (Voru)');
INSERT INTO `oc_zone_description` VALUES (1202,1,'Vosges');
INSERT INTO `oc_zone_description` VALUES (2720,1,'Vrancea');
INSERT INTO `oc_zone_description` VALUES (504,1,'Vratza');
INSERT INTO `oc_zone_description` VALUES (865,1,'Vukovarsko-srijemska');
INSERT INTO `oc_zone_description` VALUES (901,1,'Vysočina');
INSERT INTO `oc_zone_description` VALUES (2360,1,'Waikato');
INSERT INTO `oc_zone_description` VALUES (2361,1,'Wairarapa');
INSERT INTO `oc_zone_description` VALUES (1700,1,'Wakayama');
INSERT INTO `oc_zone_description` VALUES (3686,1,'Wake Island');
INSERT INTO `oc_zone_description` VALUES (3436,1,'Wakiso');
INSERT INTO `oc_zone_description` VALUES (3788,1,'Wallis');
INSERT INTO `oc_zone_description` VALUES (1413,1,'Wan Chai Hong Kong Island');
INSERT INTO `oc_zone_description` VALUES (401,1,'Wangdue Phodrang');
INSERT INTO `oc_zone_description` VALUES (3069,1,'Wanica');
INSERT INTO `oc_zone_description` VALUES (3059,1,'Warab');
INSERT INTO `oc_zone_description` VALUES (31,1,'Wardak');
INSERT INTO `oc_zone_description` VALUES (2644,1,'Warminsko-Mazurskie');
INSERT INTO `oc_zone_description` VALUES (4030,1,'Warrap');
INSERT INTO `oc_zone_description` VALUES (382,1,'Warwick');
INSERT INTO `oc_zone_description` VALUES (3603,1,'Warwickshire');
INSERT INTO `oc_zone_description` VALUES (3674,1,'Washington');
INSERT INTO `oc_zone_description` VALUES (1571,1,'Wasit');
INSERT INTO `oc_zone_description` VALUES (1608,1,'Waterford');
INSERT INTO `oc_zone_description` VALUES (2359,1,'Wellington');
INSERT INTO `oc_zone_description` VALUES (599,1,'West (Ouest)');
INSERT INTO `oc_zone_description` VALUES (1546,1,'West Azarbaijan');
INSERT INTO `oc_zone_description` VALUES (3999,1,'West Bačka');
INSERT INTO `oc_zone_description` VALUES (1506,1,'West Bengal');
INSERT INTO `oc_zone_description` VALUES (3414,1,'West Caicos');
INSERT INTO `oc_zone_description` VALUES (2362,1,'West Coast');
INSERT INTO `oc_zone_description` VALUES (3604,1,'West Dunbartonshire');
INSERT INTO `oc_zone_description` VALUES (638,1,'West End');
INSERT INTO `oc_zone_description` VALUES (314,1,'West Grand Bahama');
INSERT INTO `oc_zone_description` VALUES (1291,1,'West Greece');
INSERT INTO `oc_zone_description` VALUES (719,1,'West Island');
INSERT INTO `oc_zone_description` VALUES (3605,1,'West Lothian');
INSERT INTO `oc_zone_description` VALUES (1292,1,'West Macedonia');
INSERT INTO `oc_zone_description` VALUES (3606,1,'West Midlands');
INSERT INTO `oc_zone_description` VALUES (2508,1,'West New Britain');
INSERT INTO `oc_zone_description` VALUES (3607,1,'West Sussex');
INSERT INTO `oc_zone_description` VALUES (3675,1,'West Virginia');
INSERT INTO `oc_zone_description` VALUES (3608,1,'West Yorkshire');
INSERT INTO `oc_zone_description` VALUES (353,1,'West-Vlaanderen');
INSERT INTO `oc_zone_description` VALUES (121,1,'Western');
INSERT INTO `oc_zone_description` VALUES (639,1,'Western');
INSERT INTO `oc_zone_description` VALUES (1241,1,'Western');
INSERT INTO `oc_zone_description` VALUES (1740,1,'Western');
INSERT INTO `oc_zone_description` VALUES (2506,1,'Western');
INSERT INTO `oc_zone_description` VALUES (2924,1,'Western');
INSERT INTO `oc_zone_description` VALUES (2942,1,'Western');
INSERT INTO `oc_zone_description` VALUES (3030,1,'Western');
INSERT INTO `oc_zone_description` VALUES (3831,1,'Western');
INSERT INTO `oc_zone_description` VALUES (198,1,'Western Australia');
INSERT INTO `oc_zone_description` VALUES (4031,1,'Western Bahr el-Ghazal');
INSERT INTO `oc_zone_description` VALUES (2969,1,'Western Cape');
INSERT INTO `oc_zone_description` VALUES (1083,1,'Western Division');
INSERT INTO `oc_zone_description` VALUES (4032,1,'Western Equatoria');
INSERT INTO `oc_zone_description` VALUES (2507,1,'Western Highlands');
INSERT INTO `oc_zone_description` VALUES (3609,1,'Western Isles');
INSERT INTO `oc_zone_description` VALUES (1279,1,'Western Region');
INSERT INTO `oc_zone_description` VALUES (1609,1,'Westmeath');
INSERT INTO `oc_zone_description` VALUES (1656,1,'Westmoreland Parish');
INSERT INTO `oc_zone_description` VALUES (1610,1,'Wexford');
INSERT INTO `oc_zone_description` VALUES (1611,1,'Wicklow');
INSERT INTO `oc_zone_description` VALUES (2645,1,'Wielkopolskie');
INSERT INTO `oc_zone_description` VALUES (207,1,'Wien');
INSERT INTO `oc_zone_description` VALUES (3610,1,'Wiltshire');
INSERT INTO `oc_zone_description` VALUES (1925,1,'Wiltz');
INSERT INTO `oc_zone_description` VALUES (3676,1,'Wisconsin');
INSERT INTO `oc_zone_description` VALUES (1228,1,'Woleu-Ntem');
INSERT INTO `oc_zone_description` VALUES (1417,1,'Wong Tai Sin Kowloon');
INSERT INTO `oc_zone_description` VALUES (2960,1,'Woqooyi Galbeed');
INSERT INTO `oc_zone_description` VALUES (3611,1,'Worcestershire');
INSERT INTO `oc_zone_description` VALUES (2114,1,'Wotho');
INSERT INTO `oc_zone_description` VALUES (2115,1,'Wotje');
INSERT INTO `oc_zone_description` VALUES (3612,1,'Wrexham');
INSERT INTO `oc_zone_description` VALUES (3677,1,'Wyoming');
INSERT INTO `oc_zone_description` VALUES (273,1,'Xacmaz');
INSERT INTO `oc_zone_description` VALUES (2080,1,'Xagra');
INSERT INTO `oc_zone_description` VALUES (1815,1,'Xaignabouli');
INSERT INTO `oc_zone_description` VALUES (1818,1,'Xaisomboun');
INSERT INTO `oc_zone_description` VALUES (272,1,'Xankandi');
INSERT INTO `oc_zone_description` VALUES (274,1,'Xanlar');
INSERT INTO `oc_zone_description` VALUES (1816,1,'Xekong');
INSERT INTO `oc_zone_description` VALUES (2081,1,'Xewkija');
INSERT INTO `oc_zone_description` VALUES (2064,1,'Xgajra');
INSERT INTO `oc_zone_description` VALUES (1817,1,'Xiangkhoang');
INSERT INTO `oc_zone_description` VALUES (712,1,'Xinjiang');
INSERT INTO `oc_zone_description` VALUES (275,1,'Xizi');
INSERT INTO `oc_zone_description` VALUES (276,1,'Xocali');
INSERT INTO `oc_zone_description` VALUES (277,1,'Xocavand');
INSERT INTO `oc_zone_description` VALUES (3719,1,'Xorazm');
INSERT INTO `oc_zone_description` VALUES (1898,1,'Yafran');
INSERT INTO `oc_zone_description` VALUES (546,1,'Yagha');
INSERT INTO `oc_zone_description` VALUES (3263,1,'Yala');
INSERT INTO `oc_zone_description` VALUES (3393,1,'Yalova');
INSERT INTO `oc_zone_description` VALUES (1701,1,'Yamagata');
INSERT INTO `oc_zone_description` VALUES (1702,1,'Yamaguchi');
INSERT INTO `oc_zone_description` VALUES (4339,1,'Yamalo-Nenets Autonomous Okrug');
INSERT INTO `oc_zone_description` VALUES (1703,1,'Yamanashi');
INSERT INTO `oc_zone_description` VALUES (505,1,'Yambol');
INSERT INTO `oc_zone_description` VALUES (845,1,'Yamoussoukro');
INSERT INTO `oc_zone_description` VALUES (2280,1,'Yangon');
INSERT INTO `oc_zone_description` VALUES (2180,1,'Yap');
INSERT INTO `oc_zone_description` VALUES (3749,1,'Yaracuy');
INSERT INTO `oc_zone_description` VALUES (278,1,'Yardimli');
INSERT INTO `oc_zone_description` VALUES (2314,1,'Yaren');
INSERT INTO `oc_zone_description` VALUES (4332,1,'Yaroslavl Oblast');
INSERT INTO `oc_zone_description` VALUES (3264,1,'Yasothon');
INSERT INTO `oc_zone_description` VALUES (547,1,'Yatenga');
INSERT INTO `oc_zone_description` VALUES (1418,1,'Yau Tsim Mong Kowloon');
INSERT INTO `oc_zone_description` VALUES (1560,1,'Yazd');
INSERT INTO `oc_zone_description` VALUES (190,1,'Yerevan');
INSERT INTO `oc_zone_description` VALUES (279,1,'Yevlax');
INSERT INTO `oc_zone_description` VALUES (2423,1,'Yobe');
INSERT INTO `oc_zone_description` VALUES (1537,1,'Yogyakarta');
INSERT INTO `oc_zone_description` VALUES (1359,1,'Yomou');
INSERT INTO `oc_zone_description` VALUES (1203,1,'Yonne');
INSERT INTO `oc_zone_description` VALUES (1409,1,'Yoro');
INSERT INTO `oc_zone_description` VALUES (3394,1,'Yozgat');
INSERT INTO `oc_zone_description` VALUES (1800,1,'Ysyk-Kol');
INSERT INTO `oc_zone_description` VALUES (2175,1,'Yucatan');
INSERT INTO `oc_zone_description` VALUES (1427,1,'Yuen Long New Territories');
INSERT INTO `oc_zone_description` VALUES (614,1,'Yukon Territory');
INSERT INTO `oc_zone_description` VALUES (3464,1,'Yumbe');
INSERT INTO `oc_zone_description` VALUES (3152,1,'Yun-lin');
INSERT INTO `oc_zone_description` VALUES (713,1,'Yunnan');
INSERT INTO `oc_zone_description` VALUES (1192,1,'Yvelines');
INSERT INTO `oc_zone_description` VALUES (4331,1,'Zabaykalsky Krai');
INSERT INTO `oc_zone_description` VALUES (2065,1,'Zabbar');
INSERT INTO `oc_zone_description` VALUES (3993,1,'Žabljak');
INSERT INTO `oc_zone_description` VALUES (32,1,'Zabol');
INSERT INTO `oc_zone_description` VALUES (1325,1,'Zacapa');
INSERT INTO `oc_zone_description` VALUES (2176,1,'Zacatecas');
INSERT INTO `oc_zone_description` VALUES (2646,1,'Zachodniopomorskie');
INSERT INTO `oc_zone_description` VALUES (866,1,'Zadarska');
INSERT INTO `oc_zone_description` VALUES (3314,1,'Zaghouan');
INSERT INTO `oc_zone_description` VALUES (867,1,'Zagrebačka');
INSERT INTO `oc_zone_description` VALUES (146,1,'Zaire');
INSERT INTO `oc_zone_description` VALUES (4009,1,'Zaječar');
INSERT INTO `oc_zone_description` VALUES (3503,1,'Zakarpatska');
INSERT INTO `oc_zone_description` VALUES (4465,1,'Zala');
INSERT INTO `oc_zone_description` VALUES (2627,1,'Zambales');
INSERT INTO `oc_zone_description` VALUES (2273,1,'Zambezia');
INSERT INTO `oc_zone_description` VALUES (2628,1,'Zamboanga del Norte');
INSERT INTO `oc_zone_description` VALUES (2629,1,'Zamboanga del Sur');
INSERT INTO `oc_zone_description` VALUES (2630,1,'Zamboanga Sibugay');
INSERT INTO `oc_zone_description` VALUES (2424,1,'Zamfara');
INSERT INTO `oc_zone_description` VALUES (3020,1,'Zamora');
INSERT INTO `oc_zone_description` VALUES (1000,1,'Zamora Chinchipe');
INSERT INTO `oc_zone_description` VALUES (280,1,'Zangilan');
INSERT INTO `oc_zone_description` VALUES (1544,1,'Zanjan');
INSERT INTO `oc_zone_description` VALUES (3186,1,'Zanzibar Central/South');
INSERT INTO `oc_zone_description` VALUES (3187,1,'Zanzibar North');
INSERT INTO `oc_zone_description` VALUES (3188,1,'Zanzibar Urban/West');
INSERT INTO `oc_zone_description` VALUES (422,1,'Zapadnobosanska');
INSERT INTO `oc_zone_description` VALUES (420,1,'Zapadnohercegovacka Zupanija');
INSERT INTO `oc_zone_description` VALUES (3504,1,'Zaporizka');
INSERT INTO `oc_zone_description` VALUES (281,1,'Zaqatala');
INSERT INTO `oc_zone_description` VALUES (3021,1,'Zaragoza');
INSERT INTO `oc_zone_description` VALUES (282,1,'Zardab');
INSERT INTO `oc_zone_description` VALUES (3960,1,'Zasavska');
INSERT INTO `oc_zone_description` VALUES (2066,1,'Zebbug');
INSERT INTO `oc_zone_description` VALUES (2082,1,'Zebbug');
INSERT INTO `oc_zone_description` VALUES (2339,1,'Zeeland');
INSERT INTO `oc_zone_description` VALUES (2067,1,'Zejtun');
INSERT INTO `oc_zone_description` VALUES (416,1,'Zenicko-Dobojski Kanton');
INSERT INTO `oc_zone_description` VALUES (1732,1,'Zhambyl');
INSERT INTO `oc_zone_description` VALUES (714,1,'Zhejiang');
INSERT INTO `oc_zone_description` VALUES (402,1,'Zhemgang');
INSERT INTO `oc_zone_description` VALUES (3505,1,'Zhytomyrskа');
INSERT INTO `oc_zone_description` VALUES (2897,1,'Ziguinchor');
INSERT INTO `oc_zone_description` VALUES (2932,1,'Žilinský');
INSERT INTO `oc_zone_description` VALUES (4221,1,'Zilupes novads');
INSERT INTO `oc_zone_description` VALUES (2387,1,'Zinder');
INSERT INTO `oc_zone_description` VALUES (548,1,'Ziro');
INSERT INTO `oc_zone_description` VALUES (4010,1,'Zlatibor');
INSERT INTO `oc_zone_description` VALUES (902,1,'Zlínský');
INSERT INTO `oc_zone_description` VALUES (1899,1,'Zlitan');
INSERT INTO `oc_zone_description` VALUES (1970,1,'Zomba');
INSERT INTO `oc_zone_description` VALUES (549,1,'Zondoma');
INSERT INTO `oc_zone_description` VALUES (3395,1,'Zonguldak');
INSERT INTO `oc_zone_description` VALUES (371,1,'Zou');
INSERT INTO `oc_zone_description` VALUES (550,1,'Zoundweogo');
INSERT INTO `oc_zone_description` VALUES (846,1,'Zuenoula');
INSERT INTO `oc_zone_description` VALUES (2456,1,'Zufar');
INSERT INTO `oc_zone_description` VALUES (3119,1,'Zug');
INSERT INTO `oc_zone_description` VALUES (2340,1,'Zuid-Holland');
INSERT INTO `oc_zone_description` VALUES (3750,1,'Zulia');
INSERT INTO `oc_zone_description` VALUES (3120,1,'Zürich');
INSERT INTO `oc_zone_description` VALUES (2068,1,'Zurrieq');
/*!40000 ALTER TABLE `oc_zone_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_zone_to_geo_zone`
--

DROP TABLE IF EXISTS `oc_zone_to_geo_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT 0,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

LOCK TABLES `oc_zone_to_geo_zone` WRITE;
/*!40000 ALTER TABLE `oc_zone_to_geo_zone` DISABLE KEYS */;
INSERT INTO `oc_zone_to_geo_zone` VALUES (1,4,222,0);
INSERT INTO `oc_zone_to_geo_zone` VALUES (2,3,222,3513);
INSERT INTO `oc_zone_to_geo_zone` VALUES (3,3,222,3514);
INSERT INTO `oc_zone_to_geo_zone` VALUES (4,3,222,3515);
INSERT INTO `oc_zone_to_geo_zone` VALUES (5,3,222,3516);
INSERT INTO `oc_zone_to_geo_zone` VALUES (6,3,222,3517);
INSERT INTO `oc_zone_to_geo_zone` VALUES (7,3,222,3518);
INSERT INTO `oc_zone_to_geo_zone` VALUES (8,3,222,3519);
INSERT INTO `oc_zone_to_geo_zone` VALUES (9,3,222,3520);
INSERT INTO `oc_zone_to_geo_zone` VALUES (10,3,222,3521);
INSERT INTO `oc_zone_to_geo_zone` VALUES (11,3,222,3522);
INSERT INTO `oc_zone_to_geo_zone` VALUES (12,3,222,3523);
INSERT INTO `oc_zone_to_geo_zone` VALUES (13,3,222,3524);
INSERT INTO `oc_zone_to_geo_zone` VALUES (14,3,222,3525);
INSERT INTO `oc_zone_to_geo_zone` VALUES (15,3,222,3526);
INSERT INTO `oc_zone_to_geo_zone` VALUES (16,3,222,3527);
INSERT INTO `oc_zone_to_geo_zone` VALUES (17,3,222,3528);
INSERT INTO `oc_zone_to_geo_zone` VALUES (18,3,222,3529);
INSERT INTO `oc_zone_to_geo_zone` VALUES (19,3,222,3530);
INSERT INTO `oc_zone_to_geo_zone` VALUES (20,3,222,3531);
INSERT INTO `oc_zone_to_geo_zone` VALUES (21,3,222,3532);
INSERT INTO `oc_zone_to_geo_zone` VALUES (22,3,222,3533);
INSERT INTO `oc_zone_to_geo_zone` VALUES (23,3,222,3534);
INSERT INTO `oc_zone_to_geo_zone` VALUES (24,3,222,3535);
INSERT INTO `oc_zone_to_geo_zone` VALUES (25,3,222,3536);
INSERT INTO `oc_zone_to_geo_zone` VALUES (26,3,222,3537);
INSERT INTO `oc_zone_to_geo_zone` VALUES (27,3,222,3538);
INSERT INTO `oc_zone_to_geo_zone` VALUES (28,3,222,3539);
INSERT INTO `oc_zone_to_geo_zone` VALUES (29,3,222,3540);
INSERT INTO `oc_zone_to_geo_zone` VALUES (30,3,222,3541);
INSERT INTO `oc_zone_to_geo_zone` VALUES (31,3,222,3542);
INSERT INTO `oc_zone_to_geo_zone` VALUES (32,3,222,3543);
INSERT INTO `oc_zone_to_geo_zone` VALUES (33,3,222,3544);
INSERT INTO `oc_zone_to_geo_zone` VALUES (34,3,222,3545);
INSERT INTO `oc_zone_to_geo_zone` VALUES (35,3,222,3546);
INSERT INTO `oc_zone_to_geo_zone` VALUES (36,3,222,3547);
INSERT INTO `oc_zone_to_geo_zone` VALUES (37,3,222,3548);
INSERT INTO `oc_zone_to_geo_zone` VALUES (38,3,222,3549);
INSERT INTO `oc_zone_to_geo_zone` VALUES (39,3,222,3550);
INSERT INTO `oc_zone_to_geo_zone` VALUES (40,3,222,3551);
INSERT INTO `oc_zone_to_geo_zone` VALUES (41,3,222,3552);
INSERT INTO `oc_zone_to_geo_zone` VALUES (42,3,222,3553);
INSERT INTO `oc_zone_to_geo_zone` VALUES (43,3,222,3554);
INSERT INTO `oc_zone_to_geo_zone` VALUES (44,3,222,3555);
INSERT INTO `oc_zone_to_geo_zone` VALUES (45,3,222,3556);
INSERT INTO `oc_zone_to_geo_zone` VALUES (46,3,222,3557);
INSERT INTO `oc_zone_to_geo_zone` VALUES (47,3,222,3558);
INSERT INTO `oc_zone_to_geo_zone` VALUES (48,3,222,3559);
INSERT INTO `oc_zone_to_geo_zone` VALUES (49,3,222,3560);
INSERT INTO `oc_zone_to_geo_zone` VALUES (50,3,222,3561);
INSERT INTO `oc_zone_to_geo_zone` VALUES (51,3,222,3562);
INSERT INTO `oc_zone_to_geo_zone` VALUES (52,3,222,3563);
INSERT INTO `oc_zone_to_geo_zone` VALUES (53,3,222,3564);
INSERT INTO `oc_zone_to_geo_zone` VALUES (54,3,222,3565);
INSERT INTO `oc_zone_to_geo_zone` VALUES (55,3,222,3566);
INSERT INTO `oc_zone_to_geo_zone` VALUES (56,3,222,3567);
INSERT INTO `oc_zone_to_geo_zone` VALUES (57,3,222,3568);
INSERT INTO `oc_zone_to_geo_zone` VALUES (58,3,222,3569);
INSERT INTO `oc_zone_to_geo_zone` VALUES (59,3,222,3570);
INSERT INTO `oc_zone_to_geo_zone` VALUES (60,3,222,3571);
INSERT INTO `oc_zone_to_geo_zone` VALUES (61,3,222,3572);
INSERT INTO `oc_zone_to_geo_zone` VALUES (62,3,222,3573);
INSERT INTO `oc_zone_to_geo_zone` VALUES (63,3,222,3574);
INSERT INTO `oc_zone_to_geo_zone` VALUES (64,3,222,3575);
INSERT INTO `oc_zone_to_geo_zone` VALUES (65,3,222,3576);
INSERT INTO `oc_zone_to_geo_zone` VALUES (66,3,222,3577);
INSERT INTO `oc_zone_to_geo_zone` VALUES (67,3,222,3578);
INSERT INTO `oc_zone_to_geo_zone` VALUES (68,3,222,3579);
INSERT INTO `oc_zone_to_geo_zone` VALUES (69,3,222,3580);
INSERT INTO `oc_zone_to_geo_zone` VALUES (70,3,222,3581);
INSERT INTO `oc_zone_to_geo_zone` VALUES (71,3,222,3582);
INSERT INTO `oc_zone_to_geo_zone` VALUES (72,3,222,3583);
INSERT INTO `oc_zone_to_geo_zone` VALUES (73,3,222,3584);
INSERT INTO `oc_zone_to_geo_zone` VALUES (74,3,222,3585);
INSERT INTO `oc_zone_to_geo_zone` VALUES (75,3,222,3586);
INSERT INTO `oc_zone_to_geo_zone` VALUES (76,3,222,3587);
INSERT INTO `oc_zone_to_geo_zone` VALUES (77,3,222,3588);
INSERT INTO `oc_zone_to_geo_zone` VALUES (78,3,222,3589);
INSERT INTO `oc_zone_to_geo_zone` VALUES (79,3,222,3590);
INSERT INTO `oc_zone_to_geo_zone` VALUES (80,3,222,3591);
INSERT INTO `oc_zone_to_geo_zone` VALUES (81,3,222,3592);
INSERT INTO `oc_zone_to_geo_zone` VALUES (82,3,222,3593);
INSERT INTO `oc_zone_to_geo_zone` VALUES (83,3,222,3594);
INSERT INTO `oc_zone_to_geo_zone` VALUES (84,3,222,3595);
INSERT INTO `oc_zone_to_geo_zone` VALUES (85,3,222,3596);
INSERT INTO `oc_zone_to_geo_zone` VALUES (86,3,222,3597);
INSERT INTO `oc_zone_to_geo_zone` VALUES (87,3,222,3598);
INSERT INTO `oc_zone_to_geo_zone` VALUES (88,3,222,3599);
INSERT INTO `oc_zone_to_geo_zone` VALUES (89,3,222,3600);
INSERT INTO `oc_zone_to_geo_zone` VALUES (90,3,222,3601);
INSERT INTO `oc_zone_to_geo_zone` VALUES (91,3,222,3602);
INSERT INTO `oc_zone_to_geo_zone` VALUES (92,3,222,3603);
INSERT INTO `oc_zone_to_geo_zone` VALUES (93,3,222,3604);
INSERT INTO `oc_zone_to_geo_zone` VALUES (94,3,222,3605);
INSERT INTO `oc_zone_to_geo_zone` VALUES (95,3,222,3606);
INSERT INTO `oc_zone_to_geo_zone` VALUES (96,3,222,3607);
INSERT INTO `oc_zone_to_geo_zone` VALUES (97,3,222,3608);
INSERT INTO `oc_zone_to_geo_zone` VALUES (98,3,222,3609);
INSERT INTO `oc_zone_to_geo_zone` VALUES (99,3,222,3610);
INSERT INTO `oc_zone_to_geo_zone` VALUES (100,3,222,3611);
INSERT INTO `oc_zone_to_geo_zone` VALUES (101,3,222,3612);
INSERT INTO `oc_zone_to_geo_zone` VALUES (102,3,222,3949);
INSERT INTO `oc_zone_to_geo_zone` VALUES (103,3,222,3950);
INSERT INTO `oc_zone_to_geo_zone` VALUES (104,3,222,3951);
INSERT INTO `oc_zone_to_geo_zone` VALUES (105,3,222,3952);
INSERT INTO `oc_zone_to_geo_zone` VALUES (106,3,222,3953);
INSERT INTO `oc_zone_to_geo_zone` VALUES (107,3,222,3954);
INSERT INTO `oc_zone_to_geo_zone` VALUES (108,3,222,3955);
/*!40000 ALTER TABLE `oc_zone_to_geo_zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-26 21:23:39
