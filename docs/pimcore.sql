-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pimcore
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

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
-- Table structure for table `application_logs`
--

DROP TABLE IF EXISTS `application_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `message` varchar(1024) DEFAULT NULL,
  `priority` enum('emergency','alert','critical','error','warning','notice','info','debug') DEFAULT NULL,
  `fileobject` varchar(1024) DEFAULT NULL,
  `info` varchar(1024) DEFAULT NULL,
  `component` varchar(190) DEFAULT NULL,
  `source` varchar(190) DEFAULT NULL,
  `relatedobject` bigint(20) DEFAULT NULL,
  `relatedobjecttype` enum('object','document','asset') DEFAULT NULL,
  `maintenanceChecked` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `component` (`component`),
  KEY `timestamp` (`timestamp`),
  KEY `relatedobject` (`relatedobject`),
  KEY `priority` (`priority`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_logs`
--

LOCK TABLES `application_logs` WRITE;
/*!40000 ALTER TABLE `application_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) unsigned DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET ascii DEFAULT '',
  `path` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `mimetype` varchar(190) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  `userOwner` int(11) unsigned DEFAULT NULL,
  `userModification` int(11) unsigned DEFAULT NULL,
  `customSettings` text,
  `hasMetaData` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullpath` (`path`,`filename`),
  KEY `parentId` (`parentId`),
  KEY `filename` (`filename`),
  KEY `path` (`path`),
  KEY `modificationDate` (`modificationDate`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,0,'folder','','/',NULL,1484151280,1484151280,1,1,NULL,0),(4,1,'image','_rbcxo9au-u-robert-lukeman.jpg','/','image/jpeg',1484395890,1484396249,2,2,'a:3:{s:10:\"imageWidth\";i:1000;s:11:\"imageHeight\";i:667;s:25:\"imageDimensionsCalculated\";b:1;}',0),(5,1,'folder','bg_pictures','/',NULL,1484840094,1484840094,2,2,'a:0:{}',0),(6,5,'image','home-bg.jpg','/bg_pictures/','image/jpeg',1484840118,1484840118,2,2,'a:3:{s:10:\"imageWidth\";i:1900;s:11:\"imageHeight\";i:872;s:25:\"imageDimensionsCalculated\";b:1;}',0),(7,5,'image','about-bg.jpg','/bg_pictures/','image/jpeg',1484840118,1484840118,2,2,'a:3:{s:10:\"imageWidth\";i:1900;s:11:\"imageHeight\";i:492;s:25:\"imageDimensionsCalculated\";b:1;}',0),(8,5,'image','post-bg.jpg','/bg_pictures/','image/jpeg',1484840118,1484840118,2,2,'a:3:{s:10:\"imageWidth\";i:1900;s:11:\"imageHeight\";i:600;s:25:\"imageDimensionsCalculated\";b:1;}',0),(9,5,'image','post-sample-image.jpg','/bg_pictures/','image/jpeg',1484840118,1484840118,2,2,'a:3:{s:10:\"imageWidth\";i:778;s:11:\"imageHeight\";i:514;s:25:\"imageDimensionsCalculated\";b:1;}',0),(10,5,'image','contact-bg.jpg','/bg_pictures/','image/jpeg',1484840118,1484840118,2,2,'a:3:{s:10:\"imageWidth\";i:1900;s:11:\"imageHeight\";i:864;s:25:\"imageDimensionsCalculated\";b:1;}',0);
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_metadata`
--

DROP TABLE IF EXISTS `assets_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets_metadata` (
  `cid` int(11) DEFAULT NULL,
  `name` varchar(190) DEFAULT NULL,
  `language` varchar(190) DEFAULT NULL,
  `type` enum('input','textarea','asset','document','object','date','select','checkbox') DEFAULT NULL,
  `data` text,
  KEY `cid` (`cid`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_metadata`
--

LOCK TABLES `assets_metadata` WRITE;
/*!40000 ALTER TABLE `assets_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `id` varchar(165) NOT NULL DEFAULT '',
  `data` longblob,
  `mtime` bigint(20) DEFAULT NULL,
  `expire` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('pimcore_asset_1','O:26:\"Pimcore\\Model\\Asset\\Folder\":17:{s:4:\"type\";s:6:\"folder\";s:2:\"id\";i:1;s:8:\"parentId\";i:0;s:8:\"filename\";s:0:\"\";s:4:\"path\";s:1:\"/\";s:8:\"mimetype\";N;s:12:\"creationDate\";i:1484151280;s:16:\"modificationDate\";i:1484151280;s:9:\"userOwner\";s:1:\"1\";s:16:\"userModification\";s:1:\"1\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:0:{}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1484661454,1487080654),('pimcore_asset_10','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:10;s:8:\"parentId\";i:5;s:8:\"filename\";s:14:\"contact-bg.jpg\";s:4:\"path\";s:13:\"/bg_pictures/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1484840118;s:16:\"modificationDate\";i:1484840118;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:1900;s:11:\"imageHeight\";i:864;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1484840121,1487259321),('pimcore_asset_4','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:4;s:8:\"parentId\";i:1;s:8:\"filename\";s:30:\"_rbcxo9au-u-robert-lukeman.jpg\";s:4:\"path\";s:1:\"/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1484395890;s:16:\"modificationDate\";i:1484396249;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:1000;s:11:\"imageHeight\";i:667;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1484400304,1486819504),('pimcore_asset_5','O:26:\"Pimcore\\Model\\Asset\\Folder\":17:{s:4:\"type\";s:6:\"folder\";s:2:\"id\";i:5;s:8:\"parentId\";i:1;s:8:\"filename\";s:11:\"bg_pictures\";s:4:\"path\";s:1:\"/\";s:8:\"mimetype\";N;s:12:\"creationDate\";i:1484840094;s:16:\"modificationDate\";i:1484840094;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:0:{}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1484840096,1487259296),('pimcore_asset_6','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:6;s:8:\"parentId\";i:5;s:8:\"filename\";s:11:\"home-bg.jpg\";s:4:\"path\";s:13:\"/bg_pictures/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1484840118;s:16:\"modificationDate\";i:1484840118;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:1900;s:11:\"imageHeight\";i:872;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1484840121,1487259321),('pimcore_asset_7','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:7;s:8:\"parentId\";i:5;s:8:\"filename\";s:12:\"about-bg.jpg\";s:4:\"path\";s:13:\"/bg_pictures/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1484840118;s:16:\"modificationDate\";i:1484840118;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:1900;s:11:\"imageHeight\";i:492;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1484840121,1487259321),('pimcore_asset_8','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:8;s:8:\"parentId\";i:5;s:8:\"filename\";s:11:\"post-bg.jpg\";s:4:\"path\";s:13:\"/bg_pictures/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1484840118;s:16:\"modificationDate\";i:1484840118;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:1900;s:11:\"imageHeight\";i:600;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1484840121,1487259321),('pimcore_asset_9','O:25:\"Pimcore\\Model\\Asset\\Image\":17:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:9;s:8:\"parentId\";i:5;s:8:\"filename\";s:21:\"post-sample-image.jpg\";s:4:\"path\";s:13:\"/bg_pictures/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1484840118;s:16:\"modificationDate\";i:1484840118;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:778;s:11:\"imageHeight\";i:514;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;}',1484840121,1487259321),('pimcore_document_1','O:27:\"Pimcore\\Model\\Document\\Page\":25:{s:5:\"title\";s:4:\"Home\";s:11:\"description\";s:46:\"This is the awesome pimcore tutorial home page\";s:8:\"metaData\";a:0:{}s:4:\"type\";s:4:\"page\";s:9:\"prettyUrl\";N;s:8:\"personas\";s:0:\"\";s:6:\"module\";N;s:10:\"controller\";s:7:\"default\";s:6:\"action\";s:7:\"default\";s:8:\"template\";N;s:8:\"elements\";N;s:23:\"contentMasterDocumentId\";N;s:2:\"id\";i:1;s:8:\"parentId\";i:0;s:3:\"key\";s:0:\"\";s:4:\"path\";s:1:\"/\";s:5:\"index\";i:999999;s:9:\"published\";b:1;s:12:\"creationDate\";i:1484151280;s:16:\"modificationDate\";i:1484840141;s:9:\"userOwner\";i:1;s:16:\"userModification\";i:2;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:6:\"locked\";N;}',1484840142,1487259342),('pimcore_document_3','O:29:\"Pimcore\\Model\\Document\\Folder\":14:{s:4:\"type\";s:6:\"folder\";s:2:\"id\";i:3;s:8:\"parentId\";i:1;s:3:\"key\";s:8:\"includes\";s:4:\"path\";s:1:\"/\";s:5:\"index\";i:2;s:9:\"published\";b:1;s:12:\"creationDate\";i:1484680172;s:16:\"modificationDate\";i:1484680172;s:9:\"userOwner\";i:2;s:16:\"userModification\";i:2;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:6:\"locked\";N;}',1484680173,1487099373),('pimcore_document_4','O:27:\"Pimcore\\Model\\Document\\Page\":25:{s:5:\"title\";s:0:\"\";s:11:\"description\";s:0:\"\";s:8:\"metaData\";a:0:{}s:4:\"type\";s:4:\"page\";s:9:\"prettyUrl\";N;s:8:\"personas\";s:0:\"\";s:6:\"module\";N;s:10:\"controller\";s:7:\"default\";s:6:\"action\";s:6:\"footer\";s:8:\"template\";N;s:8:\"elements\";N;s:23:\"contentMasterDocumentId\";N;s:2:\"id\";i:4;s:8:\"parentId\";i:3;s:3:\"key\";s:6:\"footer\";s:4:\"path\";s:10:\"/includes/\";s:5:\"index\";i:1;s:9:\"published\";b:1;s:12:\"creationDate\";i:1484680181;s:16:\"modificationDate\";i:1484680696;s:9:\"userOwner\";i:2;s:16:\"userModification\";i:2;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:6:\"locked\";N;}',1484680697,1487099897),('pimcore_document_5','O:27:\"Pimcore\\Model\\Document\\Page\":25:{s:5:\"title\";s:0:\"\";s:11:\"description\";s:0:\"\";s:8:\"metaData\";a:0:{}s:4:\"type\";s:4:\"page\";s:9:\"prettyUrl\";N;s:8:\"personas\";s:0:\"\";s:6:\"module\";N;s:10:\"controller\";s:7:\"default\";s:6:\"action\";s:6:\"header\";s:8:\"template\";N;s:8:\"elements\";N;s:23:\"contentMasterDocumentId\";N;s:2:\"id\";i:5;s:8:\"parentId\";i:3;s:3:\"key\";s:10:\"navigation\";s:4:\"path\";s:10:\"/includes/\";s:5:\"index\";i:2;s:9:\"published\";b:1;s:12:\"creationDate\";i:1484745052;s:16:\"modificationDate\";i:1484840072;s:9:\"userOwner\";i:2;s:16:\"userModification\";i:2;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:6:\"locked\";N;}',1484840073,1487259273),('pimcore_document_6','O:27:\"Pimcore\\Model\\Document\\Page\":25:{s:5:\"title\";s:5:\"About\";s:11:\"description\";s:0:\"\";s:8:\"metaData\";a:0:{}s:4:\"type\";s:4:\"page\";s:9:\"prettyUrl\";N;s:8:\"personas\";s:0:\"\";s:6:\"module\";N;s:10:\"controller\";s:7:\"default\";s:6:\"action\";s:7:\"default\";s:8:\"template\";N;s:8:\"elements\";N;s:23:\"contentMasterDocumentId\";N;s:2:\"id\";i:6;s:8:\"parentId\";i:1;s:3:\"key\";s:5:\"about\";s:4:\"path\";s:1:\"/\";s:5:\"index\";i:3;s:9:\"published\";b:1;s:12:\"creationDate\";i:1484832093;s:16:\"modificationDate\";i:1484840144;s:9:\"userOwner\";i:2;s:16:\"userModification\";i:2;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:6:\"locked\";N;}',1484840145,1487259345),('pimcore_document_7','O:27:\"Pimcore\\Model\\Document\\Page\":25:{s:5:\"title\";s:10:\"Contact Us\";s:11:\"description\";s:0:\"\";s:8:\"metaData\";a:0:{}s:4:\"type\";s:4:\"page\";s:9:\"prettyUrl\";N;s:8:\"personas\";s:0:\"\";s:6:\"module\";N;s:10:\"controller\";s:7:\"default\";s:6:\"action\";s:7:\"default\";s:8:\"template\";N;s:8:\"elements\";N;s:23:\"contentMasterDocumentId\";N;s:2:\"id\";i:7;s:8:\"parentId\";i:1;s:3:\"key\";s:7:\"contact\";s:4:\"path\";s:1:\"/\";s:5:\"index\";i:4;s:9:\"published\";b:1;s:12:\"creationDate\";i:1484835706;s:16:\"modificationDate\";i:1484840148;s:9:\"userOwner\";i:2;s:16:\"userModification\";i:2;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:6:\"locked\";N;}',1484840149,1487259349),('pimcore_document_properties_1','a:0:{}',1484840150,1487259350),('pimcore_document_properties_4','a:1:{s:15:\"navigation_name\";O:22:\"Pimcore\\Model\\Property\":8:{s:4:\"name\";s:15:\"navigation_name\";s:4:\"data\";s:6:\"footer\";s:4:\"type\";s:4:\"text\";s:5:\"ctype\";s:8:\"document\";s:5:\"cpath\";N;s:3:\"cid\";i:4;s:11:\"inheritable\";b:1;s:9:\"inherited\";b:0;}}',1484840150,1487259350),('pimcore_document_properties_5','a:1:{s:15:\"navigation_name\";O:22:\"Pimcore\\Model\\Property\":8:{s:4:\"name\";s:15:\"navigation_name\";s:4:\"data\";s:6:\"header\";s:4:\"type\";s:4:\"text\";s:5:\"ctype\";s:8:\"document\";s:5:\"cpath\";N;s:3:\"cid\";i:5;s:11:\"inheritable\";b:1;s:9:\"inherited\";b:0;}}',1484840150,1487259350),('pimcore_document_properties_6','a:1:{s:15:\"navigation_name\";O:22:\"Pimcore\\Model\\Property\":8:{s:4:\"name\";s:15:\"navigation_name\";s:4:\"data\";s:5:\"about\";s:4:\"type\";s:4:\"text\";s:5:\"ctype\";s:8:\"document\";s:5:\"cpath\";N;s:3:\"cid\";i:6;s:11:\"inheritable\";b:1;s:9:\"inherited\";b:0;}}',1484840155,1487259355),('pimcore_document_properties_7','a:1:{s:15:\"navigation_name\";O:22:\"Pimcore\\Model\\Property\":8:{s:4:\"name\";s:15:\"navigation_name\";s:4:\"data\";s:7:\"contact\";s:4:\"type\";s:4:\"text\";s:5:\"ctype\";s:8:\"document\";s:5:\"cpath\";N;s:3:\"cid\";i:7;s:11:\"inheritable\";b:1;s:9:\"inherited\";b:0;}}',1484840159,1487259359),('pimcore_minimized_script_path','s:102:\"/admin/misc/script-proxy?scripts=minified_javascript_core_fb19d19c6397e356778a18043a530e8b.js&_dc=4029\";',1484661438,1487080638),('pimcore_object_1','O:27:\"Pimcore\\Model\\Object\\Folder\":14:{s:6:\"o_type\";s:6:\"folder\";s:4:\"o_id\";i:1;s:10:\"o_parentId\";i:0;s:5:\"o_key\";s:0:\"\";s:6:\"o_path\";s:1:\"/\";s:7:\"o_index\";i:999999;s:14:\"o_creationDate\";i:1484151280;s:18:\"o_modificationDate\";i:1484151280;s:11:\"o_userOwner\";i:1;s:18:\"o_userModification\";i:1;s:10:\"o_siblings\";N;s:13:\"o_hasSiblings\";N;s:8:\"o_locked\";N;s:19:\"o_elementAdminStyle\";N;}',1484661453,1487080653),('pimcore_object_3','O:27:\"Pimcore\\Model\\Object\\Folder\":14:{s:6:\"o_type\";s:6:\"folder\";s:4:\"o_id\";i:3;s:10:\"o_parentId\";i:1;s:5:\"o_key\";s:9:\"blogposts\";s:6:\"o_path\";s:1:\"/\";s:7:\"o_index\";i:0;s:14:\"o_creationDate\";i:1484661572;s:18:\"o_modificationDate\";i:1484661572;s:11:\"o_userOwner\";i:2;s:18:\"o_userModification\";i:2;s:10:\"o_siblings\";N;s:13:\"o_hasSiblings\";N;s:8:\"o_locked\";N;s:19:\"o_elementAdminStyle\";N;}',1484661573,1487080773),('pimcore_object_4','O:29:\"Pimcore\\Model\\Object\\Blogpost\":24:{s:9:\"o_classId\";i:2;s:11:\"o_className\";s:8:\"blogpost\";s:5:\"title\";s:24:\"This is a great headline\";s:8:\"subtitle\";s:44:\"Problems look mighty small from 150 miles up\";s:7:\"content\";s:2203:\"<p>Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe, a round earth in which all the directions eventually meet, in which there is no center because every point, or none, is center — an equal earth which all men occupy as equals. The airman\'s earth, if free men make it, will be truly round: a globe in practice, not in theory.</p>\n\n<p>Science cuts two ways, of course; its products can be used for both good and evil. But there\'s no turning back from science. The early warnings about technological dangers also come from science.</p>\n\n<p>What was most significant about the lunar voyage was not that man set foot on the Moon but that they set eye on the earth.</p>\n\n<p>A Chinese tale tells of some men sent to harm a young girl who, upon seeing her beauty, become her protectors rather than her violators. That\'s how I felt seeing the Earth for the first time. I could not help but love and cherish her.</p>\n\n<p>For those who have seen the Earth from space, and for the hundreds and perhaps thousands more who will, the experience most certainly changes your perspective. The things that we share in our world are far more valuable than those which divide us.</p>\n\n<h2>The Final Frontier</h2>\n\n<p>There can be no thought of finishing for ‘aiming for the stars.’ Both figuratively and literally, it is a task to occupy the generations. And no matter how much progress one makes, there is always the thrill of just beginning.</p>\n\n<p>There can be no thought of finishing for ‘aiming for the stars.’ Both figuratively and literally, it is a task to occupy the generations. And no matter how much progress one makes, there is always the thrill of just beginning.</p>\n\n<blockquote>The dreams of yesterday are the hopes of today and the reality of tomorrow. Science has not yet mastered prophecy. We predict too much for the next year and yet far too little for the next ten.</blockquote>\n\n<p>Spaceflights cannot be stopped. This is not the work of any one man or even a group of men. It is a historical process which mankind is carrying out in accordance with the natural laws of human development.</p>\n\";s:6:\"author\";s:6:\"Thomas\";s:15:\"blogpostcreated\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2017-01-17 00:00:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:21:\"headerbackgroundimage\";O:25:\"Pimcore\\Model\\Asset\\Image\":18:{s:4:\"type\";s:5:\"image\";s:2:\"id\";i:4;s:8:\"parentId\";i:1;s:8:\"filename\";s:30:\"_rbcxo9au-u-robert-lukeman.jpg\";s:4:\"path\";s:1:\"/\";s:8:\"mimetype\";s:10:\"image/jpeg\";s:12:\"creationDate\";i:1484395890;s:16:\"modificationDate\";i:1484396249;s:9:\"userOwner\";s:1:\"2\";s:16:\"userModification\";s:1:\"2\";s:8:\"metadata\";a:0:{}s:6:\"locked\";N;s:14:\"customSettings\";a:3:{s:10:\"imageWidth\";i:1000;s:11:\"imageHeight\";i:667;s:25:\"imageDimensionsCalculated\";b:1;}s:11:\"hasMetaData\";b:0;s:8:\"siblings\";N;s:11:\"hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:24:\"____pimcore_cache_item__\";s:15:\"pimcore_asset_4\";}s:16:\"lazyLoadedFields\";N;s:11:\"o_published\";b:1;s:4:\"o_id\";i:4;s:10:\"o_parentId\";i:3;s:6:\"o_type\";s:6:\"object\";s:5:\"o_key\";s:10:\"01_myfirst\";s:6:\"o_path\";s:11:\"/blogposts/\";s:7:\"o_index\";i:0;s:14:\"o_creationDate\";i:1484661585;s:18:\"o_modificationDate\";i:1484673945;s:11:\"o_userOwner\";i:2;s:18:\"o_userModification\";i:2;s:10:\"o_siblings\";N;s:13:\"o_hasSiblings\";N;s:8:\"o_locked\";N;s:19:\"o_elementAdminStyle\";N;}',1484673946,1487093146),('pimcore_object_5','O:29:\"Pimcore\\Model\\Object\\Blogpost\":23:{s:9:\"o_classId\";i:2;s:11:\"o_className\";s:8:\"blogpost\";s:5:\"title\";s:11:\"Second post\";s:8:\"subtitle\";N;s:7:\"content\";s:29:\"<p>without a subheadline</p>\n\";s:6:\"author\";s:6:\"Thomas\";s:15:\"blogpostcreated\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2017-01-20 00:00:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:16:\"lazyLoadedFields\";N;s:11:\"o_published\";b:1;s:4:\"o_id\";i:5;s:10:\"o_parentId\";i:3;s:6:\"o_type\";s:6:\"object\";s:5:\"o_key\";s:11:\"02-mysecond\";s:6:\"o_path\";s:11:\"/blogposts/\";s:7:\"o_index\";i:0;s:14:\"o_creationDate\";i:1484664923;s:18:\"o_modificationDate\";i:1484665045;s:11:\"o_userOwner\";i:2;s:18:\"o_userModification\";i:2;s:10:\"o_siblings\";N;s:13:\"o_hasSiblings\";N;s:8:\"o_locked\";N;s:19:\"o_elementAdminStyle\";N;}',1484665046,1487084246),('pimcore_object_6','O:29:\"Pimcore\\Model\\Object\\Blogpost\":23:{s:9:\"o_classId\";i:2;s:11:\"o_className\";s:8:\"blogpost\";s:5:\"title\";s:32:\"The third post in a row, awesome\";s:8:\"subtitle\";s:21:\"with subheadline here\";s:7:\"content\";s:14:\"<p>yoyoyo</p>\n\";s:6:\"author\";s:6:\"Thomas\";s:15:\"blogpostcreated\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2017-01-09 00:00:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:16:\"lazyLoadedFields\";N;s:11:\"o_published\";b:1;s:4:\"o_id\";i:6;s:10:\"o_parentId\";i:3;s:6:\"o_type\";s:6:\"object\";s:5:\"o_key\";s:8:\"03-third\";s:6:\"o_path\";s:11:\"/blogposts/\";s:7:\"o_index\";i:0;s:14:\"o_creationDate\";i:1484664941;s:18:\"o_modificationDate\";i:1484665054;s:11:\"o_userOwner\";i:2;s:18:\"o_userModification\";i:2;s:10:\"o_siblings\";N;s:13:\"o_hasSiblings\";N;s:8:\"o_locked\";N;s:19:\"o_elementAdminStyle\";N;}',1484665055,1487084255),('pimcore_object_7','O:29:\"Pimcore\\Model\\Object\\Blogpost\":23:{s:9:\"o_classId\";i:2;s:11:\"o_className\";s:8:\"blogpost\";s:5:\"title\";s:41:\"oh well, a fourth post, that is so great!\";s:8:\"subtitle\";N;s:7:\"content\";N;s:6:\"author\";s:6:\"Thomas\";s:15:\"blogpostcreated\";O:13:\"Carbon\\Carbon\":3:{s:4:\"date\";s:26:\"2017-01-11 00:00:00.000000\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:13:\"Europe/Berlin\";}s:16:\"lazyLoadedFields\";N;s:11:\"o_published\";b:1;s:4:\"o_id\";i:7;s:10:\"o_parentId\";i:3;s:6:\"o_type\";s:6:\"object\";s:5:\"o_key\";s:9:\"04-fourth\";s:6:\"o_path\";s:11:\"/blogposts/\";s:7:\"o_index\";i:0;s:14:\"o_creationDate\";i:1484664968;s:18:\"o_modificationDate\";i:1484665060;s:11:\"o_userOwner\";i:2;s:18:\"o_userModification\";i:2;s:10:\"o_siblings\";N;s:13:\"o_hasSiblings\";N;s:8:\"o_locked\";N;s:19:\"o_elementAdminStyle\";N;}',1484665062,1487084262),('pimcore_object_8','O:27:\"Pimcore\\Model\\Object\\Folder\":14:{s:6:\"o_type\";s:6:\"folder\";s:4:\"o_id\";i:8;s:10:\"o_parentId\";i:1;s:5:\"o_key\";s:3:\"crm\";s:6:\"o_path\";s:1:\"/\";s:7:\"o_index\";i:0;s:14:\"o_creationDate\";i:1484840368;s:18:\"o_modificationDate\";i:1484840368;s:11:\"o_userOwner\";i:2;s:18:\"o_userModification\";i:2;s:10:\"o_siblings\";N;s:13:\"o_hasSiblings\";N;s:8:\"o_locked\";N;s:19:\"o_elementAdminStyle\";N;}',1484840369,1487259569),('pimcore_object_9','O:29:\"Pimcore\\Model\\Object\\Contacts\":22:{s:9:\"o_classId\";i:3;s:11:\"o_className\";s:8:\"contacts\";s:4:\"name\";s:6:\"Thomas\";s:5:\"email\";s:11:\"abc@abc.com\";s:5:\"phone\";s:6:\"123456\";s:7:\"message\";s:12:\"Hello World!\";s:16:\"lazyLoadedFields\";N;s:11:\"o_published\";b:0;s:4:\"o_id\";i:9;s:10:\"o_parentId\";i:8;s:6:\"o_type\";s:6:\"object\";s:5:\"o_key\";s:15:\"20170119_thomas\";s:6:\"o_path\";s:5:\"/crm/\";s:7:\"o_index\";i:0;s:14:\"o_creationDate\";i:1484840558;s:18:\"o_modificationDate\";i:1484840616;s:11:\"o_userOwner\";i:0;s:18:\"o_userModification\";i:2;s:10:\"o_siblings\";N;s:13:\"o_hasSiblings\";N;s:8:\"o_locked\";N;s:19:\"o_elementAdminStyle\";N;}',1484840617,1487259817),('pimcore_site_domain_421aa90e079fa326b6494f812ad13e79','s:6:\"failed\";',1484840540,1487259740),('pimcore_system_resource_columns_edit_lock','a:6:{i:0;s:2:\"id\";i:1;s:3:\"cid\";i:2;s:5:\"ctype\";i:3;s:6:\"userId\";i:4;s:9:\"sessionId\";i:5;s:4:\"date\";}',1484840567,1487259767),('pimcore_system_route_redirect','a:0:{}',1484858819,1487278019),('pimcore_Translate_Website_data_en','a:2:{s:15:\"__pimcore_dummy\";s:12:\"only_a_dummy\";s:66:\"\'%value%\' does not match the expected structure for a dns hostname\";s:0:\"\";}',1484840632,1487259832),('pimcore_website_config','O:11:\"Zend_Config\":8:{s:22:\"\0*\0_allowModifications\";b:1;s:9:\"\0*\0_index\";i:0;s:9:\"\0*\0_count\";i:0;s:8:\"\0*\0_data\";a:0:{}s:21:\"\0*\0_skipNextIteration\";N;s:17:\"\0*\0_loadedSection\";N;s:11:\"\0*\0_extends\";a:0:{}s:20:\"\0*\0_loadFileErrorStr\";N;}',1484840632,1487259832),('Zend_LocaleC_en_language_aa','s:11:\"s:4:\"Afar\";\";',1484661441,1487080641),('Zend_LocaleC_en_language_aa_DJ','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_aa_ER','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_aa_ET','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_af','s:16:\"s:9:\"Afrikaans\";\";',1484661441,1487080641),('Zend_LocaleC_en_language_af_NA','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_af_ZA','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_agq','s:12:\"s:5:\"Aghem\";\";',1484661441,1487080641),('Zend_LocaleC_en_language_agq_CM','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_ak','s:11:\"s:4:\"Akan\";\";',1484661441,1487080641),('Zend_LocaleC_en_language_ak_GH','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_am','s:14:\"s:7:\"Amharic\";\";',1484661441,1487080641),('Zend_LocaleC_en_language_am_ET','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_ar','s:13:\"s:6:\"Arabic\";\";',1484661441,1487080641),('Zend_LocaleC_en_language_ar_001','s:30:\"s:22:\"Modern Standard Arabic\";\";',1484661441,1487080641),('Zend_LocaleC_en_language_ar_AE','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_ar_BH','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_ar_DJ','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_ar_DZ','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_ar_EG','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_ar_EH','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_ar_ER','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_ar_IL','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_ar_IQ','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_ar_JO','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_ar_KM','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_ar_KW','s:4:\"b:0;\";',1484661441,1487080641),('Zend_LocaleC_en_language_ar_LB','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ar_LY','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ar_MA','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ar_MR','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ar_OM','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ar_PS','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ar_QA','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ar_SA','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ar_SD','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ar_SO','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ar_SS','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ar_SY','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ar_TD','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ar_TN','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ar_YE','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_as','s:15:\"s:8:\"Assamese\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_asa','s:10:\"s:3:\"Asu\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_asa_TZ','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ast','s:15:\"s:8:\"Asturian\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_ast_ES','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_as_IN','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_az','s:19:\"s:11:\"Azerbaijani\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_az_AZ','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_az_Cyrl','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_az_Cyrl_AZ','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_az_Latn','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_az_Latn_AZ','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_bas','s:12:\"s:5:\"Basaa\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_bas_CM','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_be','s:18:\"s:10:\"Belarusian\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_bem','s:12:\"s:5:\"Bemba\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_bem_ZM','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_bez','s:11:\"s:4:\"Bena\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_bez_TZ','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_be_BY','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_bg','s:16:\"s:9:\"Bulgarian\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_bg_BG','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_bm','s:14:\"s:7:\"Bambara\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_bm_ML','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_bn','s:14:\"s:7:\"Bengali\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_bn_BD','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_bn_IN','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_bo','s:14:\"s:7:\"Tibetan\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_bo_CN','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_bo_IN','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_br','s:13:\"s:6:\"Breton\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_brx','s:11:\"s:4:\"Bodo\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_brx_IN','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_br_FR','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_bs','s:14:\"s:7:\"Bosnian\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_bs_BA','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_bs_Cyrl','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_bs_Cyrl_BA','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_bs_Latn','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_bs_Latn_BA','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_byn','s:11:\"s:4:\"Blin\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_byn_ER','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ca','s:14:\"s:7:\"Catalan\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_ca_AD','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ca_ES','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ca_ES_VALENCIA','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ca_FR','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ca_IT','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_cgg','s:12:\"s:5:\"Chiga\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_cgg_UG','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_chr','s:15:\"s:8:\"Cherokee\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_chr_US','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_cs','s:12:\"s:5:\"Czech\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_cs_CZ','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_cy','s:12:\"s:5:\"Welsh\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_cy_GB','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_da','s:13:\"s:6:\"Danish\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_dav','s:12:\"s:5:\"Taita\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_dav_KE','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_da_DK','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_da_GL','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_de','s:13:\"s:6:\"German\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_de_AT','s:23:\"s:15:\"Austrian German\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_de_BE','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_de_CH','s:25:\"s:17:\"Swiss High German\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_de_DE','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_de_LI','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_de_LU','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_dje','s:12:\"s:5:\"Zarma\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_dje_NE','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_dua','s:12:\"s:5:\"Duala\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_dua_CM','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_dyo','s:18:\"s:10:\"Jola-Fonyi\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_dyo_SN','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_dz','s:15:\"s:8:\"Dzongkha\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_dz_BT','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ebu','s:11:\"s:4:\"Embu\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_ebu_KE','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ee','s:10:\"s:3:\"Ewe\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_ee_GH','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_ee_TG','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_el','s:12:\"s:5:\"Greek\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_el_CY','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_el_GR','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en','s:14:\"s:7:\"English\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_001','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_150','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_AG','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_AI','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_AS','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_AU','s:26:\"s:18:\"Australian English\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_BB','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_BE','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_BM','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_BS','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_BW','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_BZ','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_CA','s:24:\"s:16:\"Canadian English\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_CC','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_CK','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_CM','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_CX','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_DG','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_DM','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_Dsrt','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_Dsrt_US','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_ER','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_FJ','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_FK','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_FM','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_GB','s:23:\"s:15:\"British English\";\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_GD','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_GG','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_GH','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_GI','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_GM','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_GU','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_GY','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_HK','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_IE','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_IM','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_IN','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_IO','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_JE','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_JM','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_KE','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_KI','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_KN','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_KY','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_LC','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_LR','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_LS','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_MG','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_MH','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_language_en_MO','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_MP','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_MS','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_MT','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_MU','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_MW','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_NA','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_NF','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_NG','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_NR','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_NU','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_NZ','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_PG','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_PH','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_PK','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_PN','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_PR','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_PW','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_RW','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_SB','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_SC','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_SD','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_SG','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_SH','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_SL','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_SS','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_SX','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_SZ','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_TC','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_TK','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_TO','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_TT','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_TV','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_TZ','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_UG','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_UM','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_US','s:24:\"s:16:\"American English\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_US_POSIX','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_VC','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_VG','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_VI','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_VU','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_WS','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_ZA','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_ZM','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_en_ZW','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_eo','s:16:\"s:9:\"Esperanto\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_eo_001','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es','s:14:\"s:7:\"Spanish\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_419','s:30:\"s:22:\"Latin American Spanish\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_AR','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_BO','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_CL','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_CO','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_CR','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_CU','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_DO','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_EA','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_EC','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_ES','s:24:\"s:16:\"European Spanish\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_GQ','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_GT','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_HN','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_IC','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_MX','s:23:\"s:15:\"Mexican Spanish\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_NI','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_PA','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_PE','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_PH','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_PR','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_PY','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_SV','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_US','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_UY','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_es_VE','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_et','s:15:\"s:8:\"Estonian\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_et_EE','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_eu','s:13:\"s:6:\"Basque\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_eu_ES','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_ewo','s:13:\"s:6:\"Ewondo\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_ewo_CM','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fa','s:14:\"s:7:\"Persian\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_fa_AF','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fa_IR','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_ff','s:12:\"s:5:\"Fulah\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_ff_CM','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_ff_GN','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_ff_MR','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_ff_SN','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fi','s:14:\"s:7:\"Finnish\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_fil','s:15:\"s:8:\"Filipino\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_fil_PH','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fi_FI','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fo','s:14:\"s:7:\"Faroese\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_fo_FO','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr','s:13:\"s:6:\"French\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_BE','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_BF','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_BI','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_BJ','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_BL','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_CA','s:23:\"s:15:\"Canadian French\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_CD','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_CF','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_CG','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_CH','s:20:\"s:12:\"Swiss French\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_CI','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_CM','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_DJ','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_DZ','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_FR','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_GA','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_GF','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_GN','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_GP','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_GQ','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_HT','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_KM','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_LU','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_MA','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_MC','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_MF','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_MG','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_ML','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_MQ','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_MR','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_MU','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_NC','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_NE','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_PF','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_PM','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_RE','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_RW','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_SC','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_SN','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_SY','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_TD','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_TG','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_TN','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_VU','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_WF','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fr_YT','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fur','s:15:\"s:8:\"Friulian\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_fur_IT','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_fy','s:23:\"s:15:\"Western Frisian\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_fy_NL','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_ga','s:12:\"s:5:\"Irish\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_ga_IE','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_gd','s:23:\"s:15:\"Scottish Gaelic\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_gd_GB','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_gl','s:15:\"s:8:\"Galician\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_gl_ES','s:4:\"b:0;\";',1484661443,1487080643),('Zend_LocaleC_en_language_gsw','s:20:\"s:12:\"Swiss German\";\";',1484661443,1487080643),('Zend_LocaleC_en_language_gsw_CH','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_gsw_LI','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_gu','s:15:\"s:8:\"Gujarati\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_guz','s:12:\"s:5:\"Gusii\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_guz_KE','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_gu_IN','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_gv','s:11:\"s:4:\"Manx\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_gv_IM','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ha','s:12:\"s:5:\"Hausa\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_haw','s:15:\"s:8:\"Hawaiian\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_haw_US','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ha_GH','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ha_Latn','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ha_Latn_GH','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ha_Latn_NE','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ha_Latn_NG','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ha_NE','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ha_NG','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_he','s:13:\"s:6:\"Hebrew\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_he_IL','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_hi','s:12:\"s:5:\"Hindi\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_hi_IN','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_hr','s:15:\"s:8:\"Croatian\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_hr_BA','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_hr_HR','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_hu','s:16:\"s:9:\"Hungarian\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_hu_HU','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_hy','s:15:\"s:8:\"Armenian\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_hy_AM','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ia','s:19:\"s:11:\"Interlingua\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ia_FR','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_id','s:18:\"s:10:\"Indonesian\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_id_ID','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ig','s:11:\"s:4:\"Igbo\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ig_NG','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ii','s:18:\"s:10:\"Sichuan Yi\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ii_CN','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_is','s:16:\"s:9:\"Icelandic\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_is_IS','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_it','s:14:\"s:7:\"Italian\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_it_CH','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_it_IT','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_it_SM','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ja','s:15:\"s:8:\"Japanese\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ja_JP','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_jgo','s:13:\"s:6:\"Ngomba\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_jgo_CM','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_jmc','s:14:\"s:7:\"Machame\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_jmc_TZ','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ka','s:15:\"s:8:\"Georgian\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_kab','s:13:\"s:6:\"Kabyle\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_kab_DZ','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_kam','s:12:\"s:5:\"Kamba\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_kam_KE','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ka_GE','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_kde','s:14:\"s:7:\"Makonde\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_kde_TZ','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_kea','s:20:\"s:12:\"Kabuverdianu\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_kea_CV','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_khq','s:20:\"s:12:\"Koyra Chiini\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_khq_ML','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ki','s:13:\"s:6:\"Kikuyu\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ki_KE','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_kk','s:13:\"s:6:\"Kazakh\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_kkj','s:11:\"s:4:\"Kako\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_kkj_CM','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_kk_Cyrl','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_kk_Cyrl_KZ','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_kk_KZ','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_kl','s:19:\"s:11:\"Kalaallisut\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_kln','s:15:\"s:8:\"Kalenjin\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_kln_KE','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_kl_GL','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_km','s:12:\"s:5:\"Khmer\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_km_KH','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_kn','s:14:\"s:7:\"Kannada\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_kn_IN','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ko','s:13:\"s:6:\"Korean\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_kok','s:14:\"s:7:\"Konkani\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_kok_IN','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ko_KP','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ko_KR','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ks','s:15:\"s:8:\"Kashmiri\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ksb','s:15:\"s:8:\"Shambala\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ksb_TZ','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ksf','s:12:\"s:5:\"Bafia\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ksf_CM','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ksh','s:16:\"s:9:\"Colognian\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ksh_DE','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ks_Arab','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ks_Arab_IN','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ks_IN','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_kw','s:14:\"s:7:\"Cornish\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_kw_GB','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ky','s:13:\"s:6:\"Kyrgyz\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ky_Cyrl','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ky_Cyrl_KG','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_lag','s:12:\"s:5:\"Langi\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_lag_TZ','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_lg','s:12:\"s:5:\"Ganda\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_lg_UG','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_lkt','s:13:\"s:6:\"Lakota\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_lkt_US','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ln','s:14:\"s:7:\"Lingala\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ln_AO','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ln_CD','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ln_CF','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ln_CG','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_lo','s:10:\"s:3:\"Lao\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_lo_LA','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_lt','s:18:\"s:10:\"Lithuanian\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_lt_LT','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_lu','s:20:\"s:12:\"Luba-Katanga\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_luo','s:10:\"s:3:\"Luo\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_luo_KE','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_luy','s:12:\"s:5:\"Luyia\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_luy_KE','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_lu_CD','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_lv','s:14:\"s:7:\"Latvian\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_lv_LV','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_mas','s:12:\"s:5:\"Masai\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_mas_KE','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_mas_TZ','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_mer','s:11:\"s:4:\"Meru\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_mer_KE','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_mfe','s:15:\"s:8:\"Morisyen\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_mfe_MU','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_mg','s:15:\"s:8:\"Malagasy\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_mgh','s:22:\"s:14:\"Makhuwa-Meetto\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_mgh_MZ','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_mgo','s:12:\"s:5:\"Meta\'\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_mgo_CM','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_mg_MG','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_mk','s:18:\"s:10:\"Macedonian\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_mk_MK','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ml','s:16:\"s:9:\"Malayalam\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ml_IN','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_mn','s:16:\"s:9:\"Mongolian\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_mn_Cyrl','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_mn_Cyrl_MN','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_mn_MN','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_mr','s:14:\"s:7:\"Marathi\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_mr_IN','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ms','s:12:\"s:5:\"Malay\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ms_BN','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ms_Latn','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ms_Latn_BN','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ms_Latn_MY','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ms_Latn_SG','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ms_MY','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ms_SG','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_mt','s:14:\"s:7:\"Maltese\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_mt_MT','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_mua','s:14:\"s:7:\"Mundang\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_mua_CM','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_my','s:14:\"s:7:\"Burmese\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_my_MM','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_naq','s:11:\"s:4:\"Nama\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_naq_NA','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_nb','s:25:\"s:17:\"Norwegian Bokmål\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_nb_NO','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_nb_SJ','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_nd','s:21:\"s:13:\"North Ndebele\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_nd_ZW','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ne','s:13:\"s:6:\"Nepali\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ne_IN','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ne_NP','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_nl','s:12:\"s:5:\"Dutch\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_nl_AW','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_nl_BE','s:14:\"s:7:\"Flemish\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_nl_BQ','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_nl_CW','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_nl_NL','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_nl_SR','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_nl_SX','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_nmg','s:13:\"s:6:\"Kwasio\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_nmg_CM','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_nn','s:25:\"s:17:\"Norwegian Nynorsk\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_nnh','s:16:\"s:9:\"Ngiemboon\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_nnh_CM','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_nn_NO','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_nr','s:21:\"s:13:\"South Ndebele\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_nr_ZA','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_nso','s:22:\"s:14:\"Northern Sotho\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_nso_ZA','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_nus','s:11:\"s:4:\"Nuer\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_nus_SD','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_nyn','s:15:\"s:8:\"Nyankole\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_nyn_UG','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_om','s:12:\"s:5:\"Oromo\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_om_ET','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_om_KE','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_or','s:12:\"s:5:\"Oriya\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ordinals','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_or_IN','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_os','s:14:\"s:7:\"Ossetic\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_os_GE','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_os_RU','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_pa','s:14:\"s:7:\"Punjabi\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_pa_Arab','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_pa_Arab_PK','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_pa_Guru','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_pa_Guru_IN','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_pa_IN','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_pa_PK','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_pl','s:13:\"s:6:\"Polish\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_plurals','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_pl_PL','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ps','s:13:\"s:6:\"Pashto\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ps_AF','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_pt','s:18:\"s:10:\"Portuguese\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_pt_AO','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_pt_BR','s:28:\"s:20:\"Brazilian Portuguese\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_pt_CV','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_pt_GW','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_pt_MO','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_pt_MZ','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_pt_PT','s:27:\"s:19:\"European Portuguese\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_pt_ST','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_pt_TL','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_rm','s:14:\"s:7:\"Romansh\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_rm_CH','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_rn','s:12:\"s:5:\"Rundi\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_rn_BI','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ro','s:15:\"s:8:\"Romanian\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_rof','s:12:\"s:5:\"Rombo\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_rof_TZ','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_root','s:11:\"s:4:\"Root\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ro_MD','s:16:\"s:9:\"Moldavian\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ro_RO','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ru','s:14:\"s:7:\"Russian\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ru_BY','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ru_KG','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ru_KZ','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ru_MD','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ru_RU','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ru_UA','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_rw','s:19:\"s:11:\"Kinyarwanda\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_rwk','s:10:\"s:3:\"Rwa\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_rwk_TZ','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_rw_RW','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_sah','s:12:\"s:5:\"Sakha\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_sah_RU','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_saq','s:14:\"s:7:\"Samburu\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_saq_KE','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_sbp','s:12:\"s:5:\"Sangu\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_sbp_TZ','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_se','s:21:\"s:13:\"Northern Sami\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_seh','s:11:\"s:4:\"Sena\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_seh_MZ','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_ses','s:23:\"s:15:\"Koyraboro Senni\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_ses_ML','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_se_FI','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_se_NO','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_sg','s:12:\"s:5:\"Sango\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_sg_CF','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_shi','s:16:\"s:9:\"Tachelhit\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_shi_Latn','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_shi_Latn_MA','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_shi_MA','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_shi_Tfng','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_shi_Tfng_MA','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_si','s:14:\"s:7:\"Sinhala\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_si_LK','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_sk','s:13:\"s:6:\"Slovak\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_sk_SK','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_sl','s:16:\"s:9:\"Slovenian\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_sl_SI','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_sn','s:12:\"s:5:\"Shona\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_sn_ZW','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_so','s:13:\"s:6:\"Somali\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_so_DJ','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_so_ET','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_so_KE','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_so_SO','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_sq','s:15:\"s:8:\"Albanian\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_sq_AL','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_sq_MK','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_sq_XK','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_sr','s:14:\"s:7:\"Serbian\";\";',1484661444,1487080644),('Zend_LocaleC_en_language_sr_BA','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_sr_Cyrl','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_sr_Cyrl_BA','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_sr_Cyrl_ME','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_sr_Cyrl_RS','s:4:\"b:0;\";',1484661444,1487080644),('Zend_LocaleC_en_language_sr_Cyrl_XK','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_sr_Latn','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_sr_Latn_BA','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_sr_Latn_ME','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_sr_Latn_RS','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_sr_Latn_XK','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_sr_ME','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_sr_RS','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_sr_XK','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ss','s:12:\"s:5:\"Swati\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_ssy','s:11:\"s:4:\"Saho\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_ssy_ER','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ss_SZ','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ss_ZA','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_st','s:22:\"s:14:\"Southern Sotho\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_st_LS','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_st_ZA','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_sv','s:14:\"s:7:\"Swedish\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_sv_AX','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_sv_FI','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_sv_SE','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_sw','s:14:\"s:7:\"Swahili\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_swc','s:21:\"s:13:\"Congo Swahili\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_swc_CD','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_sw_KE','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_sw_TZ','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_sw_UG','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ta','s:12:\"s:5:\"Tamil\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_ta_IN','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ta_LK','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ta_MY','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ta_SG','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_te','s:13:\"s:6:\"Telugu\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_teo','s:11:\"s:4:\"Teso\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_teo_KE','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_teo_UG','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_te_IN','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_tg','s:12:\"s:5:\"Tajik\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_tg_Cyrl','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_tg_Cyrl_TJ','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_tg_TJ','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_th','s:11:\"s:4:\"Thai\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_th_TH','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ti','s:15:\"s:8:\"Tigrinya\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_tig','s:12:\"s:5:\"Tigre\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_tig_ER','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ti_ER','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ti_ET','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_tn','s:13:\"s:6:\"Tswana\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_tn_BW','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_tn_ZA','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_to','s:13:\"s:6:\"Tongan\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_to_TO','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_tr','s:14:\"s:7:\"Turkish\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_tr_CY','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_tr_TR','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ts','s:13:\"s:6:\"Tsonga\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_ts_ZA','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_twq','s:14:\"s:7:\"Tasawaq\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_twq_NE','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_tzm','s:31:\"s:23:\"Central Atlas Tamazight\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_tzm_Latn','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_tzm_Latn_MA','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_tzm_MA','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ug','s:13:\"s:6:\"Uyghur\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_ug_Arab','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ug_Arab_CN','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_uk','s:16:\"s:9:\"Ukrainian\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_uk_UA','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ur','s:11:\"s:4:\"Urdu\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_ur_IN','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ur_PK','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_uz','s:12:\"s:5:\"Uzbek\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_uz_AF','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_uz_Arab','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_uz_Arab_AF','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_uz_Cyrl','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_uz_Cyrl_UZ','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_uz_Latn','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_uz_Latn_UZ','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_uz_UZ','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_vai','s:10:\"s:3:\"Vai\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_vai_Latn','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_vai_Latn_LR','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_vai_LR','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_vai_Vaii','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_vai_Vaii_LR','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_ve','s:12:\"s:5:\"Venda\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_ve_ZA','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_vi','s:18:\"s:10:\"Vietnamese\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_vi_VN','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_vo','s:15:\"s:8:\"Volapük\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_vo_001','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_vun','s:12:\"s:5:\"Vunjo\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_vun_TZ','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_wae','s:13:\"s:6:\"Walser\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_wae_CH','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_wal','s:15:\"s:8:\"Wolaytta\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_wal_ET','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_xh','s:12:\"s:5:\"Xhosa\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_xh_ZA','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_xog','s:11:\"s:4:\"Soga\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_xog_UG','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_yav','s:14:\"s:7:\"Yangben\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_yav_CM','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_yo','s:13:\"s:6:\"Yoruba\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_yo_BJ','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_yo_NG','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_zgh','s:35:\"s:27:\"Standard Moroccan Tamazight\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_zgh_MA','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_zh','s:14:\"s:7:\"Chinese\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_zh_CN','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_zh_Hans','s:26:\"s:18:\"Simplified Chinese\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_zh_Hans_CN','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_zh_Hans_HK','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_zh_Hans_MO','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_zh_Hans_SG','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_zh_Hant','s:27:\"s:19:\"Traditional Chinese\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_zh_Hant_HK','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_zh_Hant_MO','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_zh_Hant_TW','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_zh_HK','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_zh_MO','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_zh_SG','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_zh_TW','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_language_zu','s:11:\"s:4:\"Zulu\";\";',1484661445,1487080645),('Zend_LocaleC_en_language_zu_ZA','s:4:\"b:0;\";',1484661445,1487080645),('Zend_LocaleC_en_territory_','s:4:\"b:0;\";',1484661442,1487080642),('Zend_LocaleC_en_territory_001','s:12:\"s:5:\"World\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_150','s:13:\"s:6:\"Europe\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_AD','s:14:\"s:7:\"Andorra\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_AE','s:28:\"s:20:\"United Arab Emirates\";\";',1484661441,1487080641),('Zend_LocaleC_en_territory_AF','s:19:\"s:11:\"Afghanistan\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_AG','s:27:\"s:19:\"Antigua and Barbuda\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_AI','s:15:\"s:8:\"Anguilla\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_AL','s:14:\"s:7:\"Albania\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_AM','s:14:\"s:7:\"Armenia\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_AO','s:13:\"s:6:\"Angola\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_AR','s:16:\"s:9:\"Argentina\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_AS','s:22:\"s:14:\"American Samoa\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_AW','s:12:\"s:5:\"Aruba\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_AX','s:22:\"s:14:\"Åland Islands\";\";',1484661445,1487080645),('Zend_LocaleC_en_territory_AZ','s:18:\"s:10:\"Azerbaijan\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_BA','s:30:\"s:22:\"Bosnia and Herzegovina\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_BB','s:15:\"s:8:\"Barbados\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_BD','s:18:\"s:10:\"Bangladesh\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_BE','s:14:\"s:7:\"Belgium\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_BF','s:20:\"s:12:\"Burkina Faso\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_BG','s:15:\"s:8:\"Bulgaria\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_BH','s:14:\"s:7:\"Bahrain\";\";',1484661441,1487080641),('Zend_LocaleC_en_territory_BI','s:14:\"s:7:\"Burundi\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_BJ','s:12:\"s:5:\"Benin\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_BL','s:25:\"s:17:\"Saint Barthélemy\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_BM','s:14:\"s:7:\"Bermuda\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_BN','s:13:\"s:6:\"Brunei\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_BO','s:14:\"s:7:\"Bolivia\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_BQ','s:29:\"s:21:\"Caribbean Netherlands\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_BS','s:14:\"s:7:\"Bahamas\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_BT','s:13:\"s:6:\"Bhutan\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_BW','s:15:\"s:8:\"Botswana\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_BY','s:14:\"s:7:\"Belarus\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_BZ','s:13:\"s:6:\"Belize\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_CC','s:31:\"s:23:\"Cocos (Keeling) Islands\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_CD','s:24:\"s:16:\"Congo - Kinshasa\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_CF','s:32:\"s:24:\"Central African Republic\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_CG','s:27:\"s:19:\"Congo - Brazzaville\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_CH','s:19:\"s:11:\"Switzerland\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_CI','s:24:\"s:16:\"Côte d’Ivoire\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_CK','s:20:\"s:12:\"Cook Islands\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_CL','s:12:\"s:5:\"Chile\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_CM','s:15:\"s:8:\"Cameroon\";\";',1484661441,1487080641),('Zend_LocaleC_en_territory_CN','s:12:\"s:5:\"China\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_CO','s:15:\"s:8:\"Colombia\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_CR','s:18:\"s:10:\"Costa Rica\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_CU','s:11:\"s:4:\"Cuba\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_CV','s:18:\"s:10:\"Cape Verde\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_CW','s:15:\"s:8:\"Curaçao\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_CX','s:24:\"s:16:\"Christmas Island\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_CY','s:13:\"s:6:\"Cyprus\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_CZ','s:22:\"s:14:\"Czech Republic\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_DE','s:14:\"s:7:\"Germany\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_DG','s:20:\"s:12:\"Diego Garcia\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_DJ','s:15:\"s:8:\"Djibouti\";\";',1484661441,1487080641),('Zend_LocaleC_en_territory_DK','s:14:\"s:7:\"Denmark\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_DM','s:15:\"s:8:\"Dominica\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_DO','s:26:\"s:18:\"Dominican Republic\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_DZ','s:14:\"s:7:\"Algeria\";\";',1484661441,1487080641),('Zend_LocaleC_en_territory_EA','s:25:\"s:17:\"Ceuta and Melilla\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_EC','s:14:\"s:7:\"Ecuador\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_EE','s:14:\"s:7:\"Estonia\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_EG','s:12:\"s:5:\"Egypt\";\";',1484661441,1487080641),('Zend_LocaleC_en_territory_EH','s:22:\"s:14:\"Western Sahara\";\";',1484661441,1487080641),('Zend_LocaleC_en_territory_ER','s:14:\"s:7:\"Eritrea\";\";',1484661441,1487080641),('Zend_LocaleC_en_territory_ES','s:12:\"s:5:\"Spain\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_ET','s:15:\"s:8:\"Ethiopia\";\";',1484661441,1487080641),('Zend_LocaleC_en_territory_FI','s:14:\"s:7:\"Finland\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_FJ','s:11:\"s:4:\"Fiji\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_FK','s:24:\"s:16:\"Falkland Islands\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_FM','s:18:\"s:10:\"Micronesia\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_FO','s:21:\"s:13:\"Faroe Islands\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_FR','s:13:\"s:6:\"France\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_GA','s:12:\"s:5:\"Gabon\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_GB','s:22:\"s:14:\"United Kingdom\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_GD','s:14:\"s:7:\"Grenada\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_GE','s:14:\"s:7:\"Georgia\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_GF','s:21:\"s:13:\"French Guiana\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_GG','s:15:\"s:8:\"Guernsey\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_GH','s:12:\"s:5:\"Ghana\";\";',1484661441,1487080641),('Zend_LocaleC_en_territory_GI','s:16:\"s:9:\"Gibraltar\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_GL','s:16:\"s:9:\"Greenland\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_GM','s:13:\"s:6:\"Gambia\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_GN','s:13:\"s:6:\"Guinea\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_GP','s:18:\"s:10:\"Guadeloupe\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_GQ','s:25:\"s:17:\"Equatorial Guinea\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_GR','s:13:\"s:6:\"Greece\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_GT','s:16:\"s:9:\"Guatemala\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_GU','s:11:\"s:4:\"Guam\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_GW','s:21:\"s:13:\"Guinea-Bissau\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_GY','s:13:\"s:6:\"Guyana\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_HK','s:27:\"s:19:\"Hong Kong SAR China\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_HN','s:15:\"s:8:\"Honduras\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_HR','s:14:\"s:7:\"Croatia\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_HT','s:12:\"s:5:\"Haiti\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_HU','s:14:\"s:7:\"Hungary\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_IC','s:22:\"s:14:\"Canary Islands\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_ID','s:16:\"s:9:\"Indonesia\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_IE','s:14:\"s:7:\"Ireland\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_IL','s:13:\"s:6:\"Israel\";\";',1484661441,1487080641),('Zend_LocaleC_en_territory_IM','s:19:\"s:11:\"Isle of Man\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_IN','s:12:\"s:5:\"India\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_IO','s:38:\"s:30:\"British Indian Ocean Territory\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_IQ','s:11:\"s:4:\"Iraq\";\";',1484661441,1487080641),('Zend_LocaleC_en_territory_IR','s:11:\"s:4:\"Iran\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_IS','s:14:\"s:7:\"Iceland\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_IT','s:12:\"s:5:\"Italy\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_JE','s:13:\"s:6:\"Jersey\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_JM','s:14:\"s:7:\"Jamaica\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_JO','s:13:\"s:6:\"Jordan\";\";',1484661441,1487080641),('Zend_LocaleC_en_territory_JP','s:12:\"s:5:\"Japan\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_KE','s:12:\"s:5:\"Kenya\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_KG','s:18:\"s:10:\"Kyrgyzstan\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_KH','s:15:\"s:8:\"Cambodia\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_KI','s:15:\"s:8:\"Kiribati\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_KM','s:14:\"s:7:\"Comoros\";\";',1484661441,1487080641),('Zend_LocaleC_en_territory_KN','s:29:\"s:21:\"Saint Kitts and Nevis\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_KP','s:19:\"s:11:\"North Korea\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_KR','s:19:\"s:11:\"South Korea\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_KW','s:13:\"s:6:\"Kuwait\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_KY','s:22:\"s:14:\"Cayman Islands\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_KZ','s:18:\"s:10:\"Kazakhstan\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_LA','s:11:\"s:4:\"Laos\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_LB','s:14:\"s:7:\"Lebanon\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_LC','s:19:\"s:11:\"Saint Lucia\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_LI','s:21:\"s:13:\"Liechtenstein\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_LK','s:16:\"s:9:\"Sri Lanka\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_LR','s:14:\"s:7:\"Liberia\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_LS','s:14:\"s:7:\"Lesotho\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_LT','s:16:\"s:9:\"Lithuania\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_LU','s:18:\"s:10:\"Luxembourg\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_LV','s:13:\"s:6:\"Latvia\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_LY','s:12:\"s:5:\"Libya\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_MA','s:14:\"s:7:\"Morocco\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_MC','s:13:\"s:6:\"Monaco\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_MD','s:14:\"s:7:\"Moldova\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_ME','s:18:\"s:10:\"Montenegro\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_MF','s:20:\"s:12:\"Saint Martin\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_MG','s:18:\"s:10:\"Madagascar\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_MH','s:24:\"s:16:\"Marshall Islands\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_MK','s:16:\"s:9:\"Macedonia\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_ML','s:11:\"s:4:\"Mali\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_MM','s:23:\"s:15:\"Myanmar (Burma)\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_MN','s:15:\"s:8:\"Mongolia\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_MO','s:23:\"s:15:\"Macau SAR China\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_MP','s:32:\"s:24:\"Northern Mariana Islands\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_MQ','s:18:\"s:10:\"Martinique\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_MR','s:18:\"s:10:\"Mauritania\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_MS','s:18:\"s:10:\"Montserrat\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_MT','s:12:\"s:5:\"Malta\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_MU','s:16:\"s:9:\"Mauritius\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_MW','s:13:\"s:6:\"Malawi\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_MY','s:15:\"s:8:\"Malaysia\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_MZ','s:18:\"s:10:\"Mozambique\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_NA','s:14:\"s:7:\"Namibia\";\";',1484661441,1487080641),('Zend_LocaleC_en_territory_NC','s:21:\"s:13:\"New Caledonia\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_NE','s:12:\"s:5:\"Niger\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_NF','s:22:\"s:14:\"Norfolk Island\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_NG','s:14:\"s:7:\"Nigeria\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_NI','s:16:\"s:9:\"Nicaragua\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_NL','s:19:\"s:11:\"Netherlands\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_NO','s:13:\"s:6:\"Norway\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_NP','s:12:\"s:5:\"Nepal\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_NR','s:12:\"s:5:\"Nauru\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_NU','s:11:\"s:4:\"Niue\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_NZ','s:19:\"s:11:\"New Zealand\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_OM','s:11:\"s:4:\"Oman\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_PA','s:13:\"s:6:\"Panama\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_PE','s:11:\"s:4:\"Peru\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_PF','s:24:\"s:16:\"French Polynesia\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_PG','s:24:\"s:16:\"Papua New Guinea\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_PH','s:19:\"s:11:\"Philippines\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_PK','s:15:\"s:8:\"Pakistan\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_PL','s:13:\"s:6:\"Poland\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_PM','s:33:\"s:25:\"Saint Pierre and Miquelon\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_PN','s:24:\"s:16:\"Pitcairn Islands\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_PR','s:19:\"s:11:\"Puerto Rico\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_PS','s:31:\"s:23:\"Palestinian Territories\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_PW','s:12:\"s:5:\"Palau\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_PY','s:15:\"s:8:\"Paraguay\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_QA','s:12:\"s:5:\"Qatar\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_RE','s:15:\"s:8:\"Réunion\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_RO','s:14:\"s:7:\"Romania\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_RS','s:13:\"s:6:\"Serbia\";\";',1484661445,1487080645),('Zend_LocaleC_en_territory_RU','s:13:\"s:6:\"Russia\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_RW','s:13:\"s:6:\"Rwanda\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_SA','s:20:\"s:12:\"Saudi Arabia\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_SB','s:23:\"s:15:\"Solomon Islands\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_SC','s:18:\"s:10:\"Seychelles\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_SD','s:12:\"s:5:\"Sudan\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_SE','s:13:\"s:6:\"Sweden\";\";',1484661445,1487080645),('Zend_LocaleC_en_territory_SG','s:16:\"s:9:\"Singapore\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_SH','s:20:\"s:12:\"Saint Helena\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_SI','s:15:\"s:8:\"Slovenia\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_SJ','s:30:\"s:22:\"Svalbard and Jan Mayen\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_SK','s:15:\"s:8:\"Slovakia\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_SL','s:20:\"s:12:\"Sierra Leone\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_SM','s:18:\"s:10:\"San Marino\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_SN','s:14:\"s:7:\"Senegal\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_SO','s:14:\"s:7:\"Somalia\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_SR','s:15:\"s:8:\"Suriname\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_SS','s:19:\"s:11:\"South Sudan\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_ST','s:32:\"s:24:\"São Tomé and Príncipe\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_SV','s:19:\"s:11:\"El Salvador\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_SX','s:20:\"s:12:\"Sint Maarten\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_SY','s:12:\"s:5:\"Syria\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_SZ','s:16:\"s:9:\"Swaziland\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_TC','s:32:\"s:24:\"Turks and Caicos Islands\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_TD','s:11:\"s:4:\"Chad\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_TG','s:11:\"s:4:\"Togo\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_TH','s:15:\"s:8:\"Thailand\";\";',1484661445,1487080645),('Zend_LocaleC_en_territory_TJ','s:18:\"s:10:\"Tajikistan\";\";',1484661445,1487080645),('Zend_LocaleC_en_territory_TK','s:14:\"s:7:\"Tokelau\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_TL','s:19:\"s:11:\"Timor-Leste\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_TN','s:14:\"s:7:\"Tunisia\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_TO','s:12:\"s:5:\"Tonga\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_TR','s:13:\"s:6:\"Turkey\";\";',1484661445,1487080645),('Zend_LocaleC_en_territory_TT','s:27:\"s:19:\"Trinidad and Tobago\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_TV','s:13:\"s:6:\"Tuvalu\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_TW','s:13:\"s:6:\"Taiwan\";\";',1484661445,1487080645),('Zend_LocaleC_en_territory_TZ','s:15:\"s:8:\"Tanzania\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_UA','s:14:\"s:7:\"Ukraine\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_UG','s:13:\"s:6:\"Uganda\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_UM','s:29:\"s:21:\"U.S. Outlying Islands\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_US','s:21:\"s:13:\"United States\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_UY','s:14:\"s:7:\"Uruguay\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_UZ','s:18:\"s:10:\"Uzbekistan\";\";',1484661445,1487080645),('Zend_LocaleC_en_territory_VC','s:32:\"s:24:\"St. Vincent & Grenadines\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_VE','s:16:\"s:9:\"Venezuela\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_VG','s:30:\"s:22:\"British Virgin Islands\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_VI','s:27:\"s:19:\"U.S. Virgin Islands\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_VN','s:14:\"s:7:\"Vietnam\";\";',1484661445,1487080645),('Zend_LocaleC_en_territory_VU','s:14:\"s:7:\"Vanuatu\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_WF','s:25:\"s:17:\"Wallis and Futuna\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_WS','s:12:\"s:5:\"Samoa\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_XK','s:13:\"s:6:\"Kosovo\";\";',1484661444,1487080644),('Zend_LocaleC_en_territory_YE','s:12:\"s:5:\"Yemen\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_YT','s:14:\"s:7:\"Mayotte\";\";',1484661443,1487080643),('Zend_LocaleC_en_territory_ZA','s:20:\"s:12:\"South Africa\";\";',1484661441,1487080641),('Zend_LocaleC_en_territory_ZM','s:13:\"s:6:\"Zambia\";\";',1484661442,1487080642),('Zend_LocaleC_en_territory_ZW','s:15:\"s:8:\"Zimbabwe\";\";',1484661443,1487080643);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_tags`
--

DROP TABLE IF EXISTS `cache_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_tags` (
  `id` varchar(165) NOT NULL DEFAULT '',
  `tag` varchar(165) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`tag`),
  KEY `id` (`id`),
  KEY `tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_tags`
--

LOCK TABLES `cache_tags` WRITE;
/*!40000 ALTER TABLE `cache_tags` DISABLE KEYS */;
INSERT INTO `cache_tags` VALUES ('pimcore_asset_1','asset_1'),('pimcore_asset_10','asset_10'),('pimcore_asset_4','asset_4'),('pimcore_asset_5','asset_5'),('pimcore_asset_6','asset_6'),('pimcore_asset_7','asset_7'),('pimcore_asset_8','asset_8'),('pimcore_asset_9','asset_9'),('pimcore_document_1','document_1'),('pimcore_document_3','document_3'),('pimcore_document_4','document_4'),('pimcore_document_5','document_5'),('pimcore_document_6','document_6'),('pimcore_document_7','document_7'),('pimcore_document_properties_1','document_1'),('pimcore_document_properties_1','document_properties'),('pimcore_document_properties_1','document_properties_1'),('pimcore_document_properties_4','document_4'),('pimcore_document_properties_4','document_properties'),('pimcore_document_properties_4','document_properties_4'),('pimcore_document_properties_5','document_5'),('pimcore_document_properties_5','document_properties'),('pimcore_document_properties_5','document_properties_5'),('pimcore_document_properties_6','document_6'),('pimcore_document_properties_6','document_properties'),('pimcore_document_properties_6','document_properties_6'),('pimcore_document_properties_7','document_7'),('pimcore_document_properties_7','document_properties'),('pimcore_document_properties_7','document_properties_7'),('pimcore_minimized_script_path','minimized_script_path'),('pimcore_object_1','object_1'),('pimcore_object_3','object_3'),('pimcore_object_4','object_4'),('pimcore_object_5','object_5'),('pimcore_object_6','object_6'),('pimcore_object_7','object_7'),('pimcore_object_8','object_8'),('pimcore_object_9','object_9'),('pimcore_site_domain_421aa90e079fa326b6494f812ad13e79','site'),('pimcore_site_domain_421aa90e079fa326b6494f812ad13e79','site_domain_421aa90e079fa326b6494f812ad13e79'),('pimcore_site_domain_421aa90e079fa326b6494f812ad13e79','system'),('pimcore_system_resource_columns_edit_lock','resource'),('pimcore_system_resource_columns_edit_lock','system'),('pimcore_system_resource_columns_edit_lock','system_resource_columns_edit_lock'),('pimcore_system_route_redirect','redirect'),('pimcore_system_route_redirect','route'),('pimcore_system_route_redirect','system'),('pimcore_system_route_redirect','system_route_redirect'),('pimcore_Translate_Website_data_en','translate'),('pimcore_Translate_Website_data_en','Translate_Website_data_en'),('pimcore_Translate_Website_data_en','translator'),('pimcore_Translate_Website_data_en','translator_website'),('pimcore_website_config','config'),('pimcore_website_config','output'),('pimcore_website_config','system'),('pimcore_website_config','website_config'),('Zend_LocaleC_en_language_aa','Zend_Locale'),('Zend_LocaleC_en_language_aa_DJ','Zend_Locale'),('Zend_LocaleC_en_language_aa_ER','Zend_Locale'),('Zend_LocaleC_en_language_aa_ET','Zend_Locale'),('Zend_LocaleC_en_language_af','Zend_Locale'),('Zend_LocaleC_en_language_af_NA','Zend_Locale'),('Zend_LocaleC_en_language_af_ZA','Zend_Locale'),('Zend_LocaleC_en_language_agq','Zend_Locale'),('Zend_LocaleC_en_language_agq_CM','Zend_Locale'),('Zend_LocaleC_en_language_ak','Zend_Locale'),('Zend_LocaleC_en_language_ak_GH','Zend_Locale'),('Zend_LocaleC_en_language_am','Zend_Locale'),('Zend_LocaleC_en_language_am_ET','Zend_Locale'),('Zend_LocaleC_en_language_ar','Zend_Locale'),('Zend_LocaleC_en_language_ar_001','Zend_Locale'),('Zend_LocaleC_en_language_ar_AE','Zend_Locale'),('Zend_LocaleC_en_language_ar_BH','Zend_Locale'),('Zend_LocaleC_en_language_ar_DJ','Zend_Locale'),('Zend_LocaleC_en_language_ar_DZ','Zend_Locale'),('Zend_LocaleC_en_language_ar_EG','Zend_Locale'),('Zend_LocaleC_en_language_ar_EH','Zend_Locale'),('Zend_LocaleC_en_language_ar_ER','Zend_Locale'),('Zend_LocaleC_en_language_ar_IL','Zend_Locale'),('Zend_LocaleC_en_language_ar_IQ','Zend_Locale'),('Zend_LocaleC_en_language_ar_JO','Zend_Locale'),('Zend_LocaleC_en_language_ar_KM','Zend_Locale'),('Zend_LocaleC_en_language_ar_KW','Zend_Locale'),('Zend_LocaleC_en_language_ar_LB','Zend_Locale'),('Zend_LocaleC_en_language_ar_LY','Zend_Locale'),('Zend_LocaleC_en_language_ar_MA','Zend_Locale'),('Zend_LocaleC_en_language_ar_MR','Zend_Locale'),('Zend_LocaleC_en_language_ar_OM','Zend_Locale'),('Zend_LocaleC_en_language_ar_PS','Zend_Locale'),('Zend_LocaleC_en_language_ar_QA','Zend_Locale'),('Zend_LocaleC_en_language_ar_SA','Zend_Locale'),('Zend_LocaleC_en_language_ar_SD','Zend_Locale'),('Zend_LocaleC_en_language_ar_SO','Zend_Locale'),('Zend_LocaleC_en_language_ar_SS','Zend_Locale'),('Zend_LocaleC_en_language_ar_SY','Zend_Locale'),('Zend_LocaleC_en_language_ar_TD','Zend_Locale'),('Zend_LocaleC_en_language_ar_TN','Zend_Locale'),('Zend_LocaleC_en_language_ar_YE','Zend_Locale'),('Zend_LocaleC_en_language_as','Zend_Locale'),('Zend_LocaleC_en_language_asa','Zend_Locale'),('Zend_LocaleC_en_language_asa_TZ','Zend_Locale'),('Zend_LocaleC_en_language_ast','Zend_Locale'),('Zend_LocaleC_en_language_ast_ES','Zend_Locale'),('Zend_LocaleC_en_language_as_IN','Zend_Locale'),('Zend_LocaleC_en_language_az','Zend_Locale'),('Zend_LocaleC_en_language_az_AZ','Zend_Locale'),('Zend_LocaleC_en_language_az_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_az_Cyrl_AZ','Zend_Locale'),('Zend_LocaleC_en_language_az_Latn','Zend_Locale'),('Zend_LocaleC_en_language_az_Latn_AZ','Zend_Locale'),('Zend_LocaleC_en_language_bas','Zend_Locale'),('Zend_LocaleC_en_language_bas_CM','Zend_Locale'),('Zend_LocaleC_en_language_be','Zend_Locale'),('Zend_LocaleC_en_language_bem','Zend_Locale'),('Zend_LocaleC_en_language_bem_ZM','Zend_Locale'),('Zend_LocaleC_en_language_bez','Zend_Locale'),('Zend_LocaleC_en_language_bez_TZ','Zend_Locale'),('Zend_LocaleC_en_language_be_BY','Zend_Locale'),('Zend_LocaleC_en_language_bg','Zend_Locale'),('Zend_LocaleC_en_language_bg_BG','Zend_Locale'),('Zend_LocaleC_en_language_bm','Zend_Locale'),('Zend_LocaleC_en_language_bm_ML','Zend_Locale'),('Zend_LocaleC_en_language_bn','Zend_Locale'),('Zend_LocaleC_en_language_bn_BD','Zend_Locale'),('Zend_LocaleC_en_language_bn_IN','Zend_Locale'),('Zend_LocaleC_en_language_bo','Zend_Locale'),('Zend_LocaleC_en_language_bo_CN','Zend_Locale'),('Zend_LocaleC_en_language_bo_IN','Zend_Locale'),('Zend_LocaleC_en_language_br','Zend_Locale'),('Zend_LocaleC_en_language_brx','Zend_Locale'),('Zend_LocaleC_en_language_brx_IN','Zend_Locale'),('Zend_LocaleC_en_language_br_FR','Zend_Locale'),('Zend_LocaleC_en_language_bs','Zend_Locale'),('Zend_LocaleC_en_language_bs_BA','Zend_Locale'),('Zend_LocaleC_en_language_bs_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_bs_Cyrl_BA','Zend_Locale'),('Zend_LocaleC_en_language_bs_Latn','Zend_Locale'),('Zend_LocaleC_en_language_bs_Latn_BA','Zend_Locale'),('Zend_LocaleC_en_language_byn','Zend_Locale'),('Zend_LocaleC_en_language_byn_ER','Zend_Locale'),('Zend_LocaleC_en_language_ca','Zend_Locale'),('Zend_LocaleC_en_language_ca_AD','Zend_Locale'),('Zend_LocaleC_en_language_ca_ES','Zend_Locale'),('Zend_LocaleC_en_language_ca_ES_VALENCIA','Zend_Locale'),('Zend_LocaleC_en_language_ca_FR','Zend_Locale'),('Zend_LocaleC_en_language_ca_IT','Zend_Locale'),('Zend_LocaleC_en_language_cgg','Zend_Locale'),('Zend_LocaleC_en_language_cgg_UG','Zend_Locale'),('Zend_LocaleC_en_language_chr','Zend_Locale'),('Zend_LocaleC_en_language_chr_US','Zend_Locale'),('Zend_LocaleC_en_language_cs','Zend_Locale'),('Zend_LocaleC_en_language_cs_CZ','Zend_Locale'),('Zend_LocaleC_en_language_cy','Zend_Locale'),('Zend_LocaleC_en_language_cy_GB','Zend_Locale'),('Zend_LocaleC_en_language_da','Zend_Locale'),('Zend_LocaleC_en_language_dav','Zend_Locale'),('Zend_LocaleC_en_language_dav_KE','Zend_Locale'),('Zend_LocaleC_en_language_da_DK','Zend_Locale'),('Zend_LocaleC_en_language_da_GL','Zend_Locale'),('Zend_LocaleC_en_language_de','Zend_Locale'),('Zend_LocaleC_en_language_de_AT','Zend_Locale'),('Zend_LocaleC_en_language_de_BE','Zend_Locale'),('Zend_LocaleC_en_language_de_CH','Zend_Locale'),('Zend_LocaleC_en_language_de_DE','Zend_Locale'),('Zend_LocaleC_en_language_de_LI','Zend_Locale'),('Zend_LocaleC_en_language_de_LU','Zend_Locale'),('Zend_LocaleC_en_language_dje','Zend_Locale'),('Zend_LocaleC_en_language_dje_NE','Zend_Locale'),('Zend_LocaleC_en_language_dua','Zend_Locale'),('Zend_LocaleC_en_language_dua_CM','Zend_Locale'),('Zend_LocaleC_en_language_dyo','Zend_Locale'),('Zend_LocaleC_en_language_dyo_SN','Zend_Locale'),('Zend_LocaleC_en_language_dz','Zend_Locale'),('Zend_LocaleC_en_language_dz_BT','Zend_Locale'),('Zend_LocaleC_en_language_ebu','Zend_Locale'),('Zend_LocaleC_en_language_ebu_KE','Zend_Locale'),('Zend_LocaleC_en_language_ee','Zend_Locale'),('Zend_LocaleC_en_language_ee_GH','Zend_Locale'),('Zend_LocaleC_en_language_ee_TG','Zend_Locale'),('Zend_LocaleC_en_language_el','Zend_Locale'),('Zend_LocaleC_en_language_el_CY','Zend_Locale'),('Zend_LocaleC_en_language_el_GR','Zend_Locale'),('Zend_LocaleC_en_language_en','Zend_Locale'),('Zend_LocaleC_en_language_en_001','Zend_Locale'),('Zend_LocaleC_en_language_en_150','Zend_Locale'),('Zend_LocaleC_en_language_en_AG','Zend_Locale'),('Zend_LocaleC_en_language_en_AI','Zend_Locale'),('Zend_LocaleC_en_language_en_AS','Zend_Locale'),('Zend_LocaleC_en_language_en_AU','Zend_Locale'),('Zend_LocaleC_en_language_en_BB','Zend_Locale'),('Zend_LocaleC_en_language_en_BE','Zend_Locale'),('Zend_LocaleC_en_language_en_BM','Zend_Locale'),('Zend_LocaleC_en_language_en_BS','Zend_Locale'),('Zend_LocaleC_en_language_en_BW','Zend_Locale'),('Zend_LocaleC_en_language_en_BZ','Zend_Locale'),('Zend_LocaleC_en_language_en_CA','Zend_Locale'),('Zend_LocaleC_en_language_en_CC','Zend_Locale'),('Zend_LocaleC_en_language_en_CK','Zend_Locale'),('Zend_LocaleC_en_language_en_CM','Zend_Locale'),('Zend_LocaleC_en_language_en_CX','Zend_Locale'),('Zend_LocaleC_en_language_en_DG','Zend_Locale'),('Zend_LocaleC_en_language_en_DM','Zend_Locale'),('Zend_LocaleC_en_language_en_Dsrt','Zend_Locale'),('Zend_LocaleC_en_language_en_Dsrt_US','Zend_Locale'),('Zend_LocaleC_en_language_en_ER','Zend_Locale'),('Zend_LocaleC_en_language_en_FJ','Zend_Locale'),('Zend_LocaleC_en_language_en_FK','Zend_Locale'),('Zend_LocaleC_en_language_en_FM','Zend_Locale'),('Zend_LocaleC_en_language_en_GB','Zend_Locale'),('Zend_LocaleC_en_language_en_GD','Zend_Locale'),('Zend_LocaleC_en_language_en_GG','Zend_Locale'),('Zend_LocaleC_en_language_en_GH','Zend_Locale'),('Zend_LocaleC_en_language_en_GI','Zend_Locale'),('Zend_LocaleC_en_language_en_GM','Zend_Locale'),('Zend_LocaleC_en_language_en_GU','Zend_Locale'),('Zend_LocaleC_en_language_en_GY','Zend_Locale'),('Zend_LocaleC_en_language_en_HK','Zend_Locale'),('Zend_LocaleC_en_language_en_IE','Zend_Locale'),('Zend_LocaleC_en_language_en_IM','Zend_Locale'),('Zend_LocaleC_en_language_en_IN','Zend_Locale'),('Zend_LocaleC_en_language_en_IO','Zend_Locale'),('Zend_LocaleC_en_language_en_JE','Zend_Locale'),('Zend_LocaleC_en_language_en_JM','Zend_Locale'),('Zend_LocaleC_en_language_en_KE','Zend_Locale'),('Zend_LocaleC_en_language_en_KI','Zend_Locale'),('Zend_LocaleC_en_language_en_KN','Zend_Locale'),('Zend_LocaleC_en_language_en_KY','Zend_Locale'),('Zend_LocaleC_en_language_en_LC','Zend_Locale'),('Zend_LocaleC_en_language_en_LR','Zend_Locale'),('Zend_LocaleC_en_language_en_LS','Zend_Locale'),('Zend_LocaleC_en_language_en_MG','Zend_Locale'),('Zend_LocaleC_en_language_en_MH','Zend_Locale'),('Zend_LocaleC_en_language_en_MO','Zend_Locale'),('Zend_LocaleC_en_language_en_MP','Zend_Locale'),('Zend_LocaleC_en_language_en_MS','Zend_Locale'),('Zend_LocaleC_en_language_en_MT','Zend_Locale'),('Zend_LocaleC_en_language_en_MU','Zend_Locale'),('Zend_LocaleC_en_language_en_MW','Zend_Locale'),('Zend_LocaleC_en_language_en_NA','Zend_Locale'),('Zend_LocaleC_en_language_en_NF','Zend_Locale'),('Zend_LocaleC_en_language_en_NG','Zend_Locale'),('Zend_LocaleC_en_language_en_NR','Zend_Locale'),('Zend_LocaleC_en_language_en_NU','Zend_Locale'),('Zend_LocaleC_en_language_en_NZ','Zend_Locale'),('Zend_LocaleC_en_language_en_PG','Zend_Locale'),('Zend_LocaleC_en_language_en_PH','Zend_Locale'),('Zend_LocaleC_en_language_en_PK','Zend_Locale'),('Zend_LocaleC_en_language_en_PN','Zend_Locale'),('Zend_LocaleC_en_language_en_PR','Zend_Locale'),('Zend_LocaleC_en_language_en_PW','Zend_Locale'),('Zend_LocaleC_en_language_en_RW','Zend_Locale'),('Zend_LocaleC_en_language_en_SB','Zend_Locale'),('Zend_LocaleC_en_language_en_SC','Zend_Locale'),('Zend_LocaleC_en_language_en_SD','Zend_Locale'),('Zend_LocaleC_en_language_en_SG','Zend_Locale'),('Zend_LocaleC_en_language_en_SH','Zend_Locale'),('Zend_LocaleC_en_language_en_SL','Zend_Locale'),('Zend_LocaleC_en_language_en_SS','Zend_Locale'),('Zend_LocaleC_en_language_en_SX','Zend_Locale'),('Zend_LocaleC_en_language_en_SZ','Zend_Locale'),('Zend_LocaleC_en_language_en_TC','Zend_Locale'),('Zend_LocaleC_en_language_en_TK','Zend_Locale'),('Zend_LocaleC_en_language_en_TO','Zend_Locale'),('Zend_LocaleC_en_language_en_TT','Zend_Locale'),('Zend_LocaleC_en_language_en_TV','Zend_Locale'),('Zend_LocaleC_en_language_en_TZ','Zend_Locale'),('Zend_LocaleC_en_language_en_UG','Zend_Locale'),('Zend_LocaleC_en_language_en_UM','Zend_Locale'),('Zend_LocaleC_en_language_en_US','Zend_Locale'),('Zend_LocaleC_en_language_en_US_POSIX','Zend_Locale'),('Zend_LocaleC_en_language_en_VC','Zend_Locale'),('Zend_LocaleC_en_language_en_VG','Zend_Locale'),('Zend_LocaleC_en_language_en_VI','Zend_Locale'),('Zend_LocaleC_en_language_en_VU','Zend_Locale'),('Zend_LocaleC_en_language_en_WS','Zend_Locale'),('Zend_LocaleC_en_language_en_ZA','Zend_Locale'),('Zend_LocaleC_en_language_en_ZM','Zend_Locale'),('Zend_LocaleC_en_language_en_ZW','Zend_Locale'),('Zend_LocaleC_en_language_eo','Zend_Locale'),('Zend_LocaleC_en_language_eo_001','Zend_Locale'),('Zend_LocaleC_en_language_es','Zend_Locale'),('Zend_LocaleC_en_language_es_419','Zend_Locale'),('Zend_LocaleC_en_language_es_AR','Zend_Locale'),('Zend_LocaleC_en_language_es_BO','Zend_Locale'),('Zend_LocaleC_en_language_es_CL','Zend_Locale'),('Zend_LocaleC_en_language_es_CO','Zend_Locale'),('Zend_LocaleC_en_language_es_CR','Zend_Locale'),('Zend_LocaleC_en_language_es_CU','Zend_Locale'),('Zend_LocaleC_en_language_es_DO','Zend_Locale'),('Zend_LocaleC_en_language_es_EA','Zend_Locale'),('Zend_LocaleC_en_language_es_EC','Zend_Locale'),('Zend_LocaleC_en_language_es_ES','Zend_Locale'),('Zend_LocaleC_en_language_es_GQ','Zend_Locale'),('Zend_LocaleC_en_language_es_GT','Zend_Locale'),('Zend_LocaleC_en_language_es_HN','Zend_Locale'),('Zend_LocaleC_en_language_es_IC','Zend_Locale'),('Zend_LocaleC_en_language_es_MX','Zend_Locale'),('Zend_LocaleC_en_language_es_NI','Zend_Locale'),('Zend_LocaleC_en_language_es_PA','Zend_Locale'),('Zend_LocaleC_en_language_es_PE','Zend_Locale'),('Zend_LocaleC_en_language_es_PH','Zend_Locale'),('Zend_LocaleC_en_language_es_PR','Zend_Locale'),('Zend_LocaleC_en_language_es_PY','Zend_Locale'),('Zend_LocaleC_en_language_es_SV','Zend_Locale'),('Zend_LocaleC_en_language_es_US','Zend_Locale'),('Zend_LocaleC_en_language_es_UY','Zend_Locale'),('Zend_LocaleC_en_language_es_VE','Zend_Locale'),('Zend_LocaleC_en_language_et','Zend_Locale'),('Zend_LocaleC_en_language_et_EE','Zend_Locale'),('Zend_LocaleC_en_language_eu','Zend_Locale'),('Zend_LocaleC_en_language_eu_ES','Zend_Locale'),('Zend_LocaleC_en_language_ewo','Zend_Locale'),('Zend_LocaleC_en_language_ewo_CM','Zend_Locale'),('Zend_LocaleC_en_language_fa','Zend_Locale'),('Zend_LocaleC_en_language_fa_AF','Zend_Locale'),('Zend_LocaleC_en_language_fa_IR','Zend_Locale'),('Zend_LocaleC_en_language_ff','Zend_Locale'),('Zend_LocaleC_en_language_ff_CM','Zend_Locale'),('Zend_LocaleC_en_language_ff_GN','Zend_Locale'),('Zend_LocaleC_en_language_ff_MR','Zend_Locale'),('Zend_LocaleC_en_language_ff_SN','Zend_Locale'),('Zend_LocaleC_en_language_fi','Zend_Locale'),('Zend_LocaleC_en_language_fil','Zend_Locale'),('Zend_LocaleC_en_language_fil_PH','Zend_Locale'),('Zend_LocaleC_en_language_fi_FI','Zend_Locale'),('Zend_LocaleC_en_language_fo','Zend_Locale'),('Zend_LocaleC_en_language_fo_FO','Zend_Locale'),('Zend_LocaleC_en_language_fr','Zend_Locale'),('Zend_LocaleC_en_language_fr_BE','Zend_Locale'),('Zend_LocaleC_en_language_fr_BF','Zend_Locale'),('Zend_LocaleC_en_language_fr_BI','Zend_Locale'),('Zend_LocaleC_en_language_fr_BJ','Zend_Locale'),('Zend_LocaleC_en_language_fr_BL','Zend_Locale'),('Zend_LocaleC_en_language_fr_CA','Zend_Locale'),('Zend_LocaleC_en_language_fr_CD','Zend_Locale'),('Zend_LocaleC_en_language_fr_CF','Zend_Locale'),('Zend_LocaleC_en_language_fr_CG','Zend_Locale'),('Zend_LocaleC_en_language_fr_CH','Zend_Locale'),('Zend_LocaleC_en_language_fr_CI','Zend_Locale'),('Zend_LocaleC_en_language_fr_CM','Zend_Locale'),('Zend_LocaleC_en_language_fr_DJ','Zend_Locale'),('Zend_LocaleC_en_language_fr_DZ','Zend_Locale'),('Zend_LocaleC_en_language_fr_FR','Zend_Locale'),('Zend_LocaleC_en_language_fr_GA','Zend_Locale'),('Zend_LocaleC_en_language_fr_GF','Zend_Locale'),('Zend_LocaleC_en_language_fr_GN','Zend_Locale'),('Zend_LocaleC_en_language_fr_GP','Zend_Locale'),('Zend_LocaleC_en_language_fr_GQ','Zend_Locale'),('Zend_LocaleC_en_language_fr_HT','Zend_Locale'),('Zend_LocaleC_en_language_fr_KM','Zend_Locale'),('Zend_LocaleC_en_language_fr_LU','Zend_Locale'),('Zend_LocaleC_en_language_fr_MA','Zend_Locale'),('Zend_LocaleC_en_language_fr_MC','Zend_Locale'),('Zend_LocaleC_en_language_fr_MF','Zend_Locale'),('Zend_LocaleC_en_language_fr_MG','Zend_Locale'),('Zend_LocaleC_en_language_fr_ML','Zend_Locale'),('Zend_LocaleC_en_language_fr_MQ','Zend_Locale'),('Zend_LocaleC_en_language_fr_MR','Zend_Locale'),('Zend_LocaleC_en_language_fr_MU','Zend_Locale'),('Zend_LocaleC_en_language_fr_NC','Zend_Locale'),('Zend_LocaleC_en_language_fr_NE','Zend_Locale'),('Zend_LocaleC_en_language_fr_PF','Zend_Locale'),('Zend_LocaleC_en_language_fr_PM','Zend_Locale'),('Zend_LocaleC_en_language_fr_RE','Zend_Locale'),('Zend_LocaleC_en_language_fr_RW','Zend_Locale'),('Zend_LocaleC_en_language_fr_SC','Zend_Locale'),('Zend_LocaleC_en_language_fr_SN','Zend_Locale'),('Zend_LocaleC_en_language_fr_SY','Zend_Locale'),('Zend_LocaleC_en_language_fr_TD','Zend_Locale'),('Zend_LocaleC_en_language_fr_TG','Zend_Locale'),('Zend_LocaleC_en_language_fr_TN','Zend_Locale'),('Zend_LocaleC_en_language_fr_VU','Zend_Locale'),('Zend_LocaleC_en_language_fr_WF','Zend_Locale'),('Zend_LocaleC_en_language_fr_YT','Zend_Locale'),('Zend_LocaleC_en_language_fur','Zend_Locale'),('Zend_LocaleC_en_language_fur_IT','Zend_Locale'),('Zend_LocaleC_en_language_fy','Zend_Locale'),('Zend_LocaleC_en_language_fy_NL','Zend_Locale'),('Zend_LocaleC_en_language_ga','Zend_Locale'),('Zend_LocaleC_en_language_ga_IE','Zend_Locale'),('Zend_LocaleC_en_language_gd','Zend_Locale'),('Zend_LocaleC_en_language_gd_GB','Zend_Locale'),('Zend_LocaleC_en_language_gl','Zend_Locale'),('Zend_LocaleC_en_language_gl_ES','Zend_Locale'),('Zend_LocaleC_en_language_gsw','Zend_Locale'),('Zend_LocaleC_en_language_gsw_CH','Zend_Locale'),('Zend_LocaleC_en_language_gsw_LI','Zend_Locale'),('Zend_LocaleC_en_language_gu','Zend_Locale'),('Zend_LocaleC_en_language_guz','Zend_Locale'),('Zend_LocaleC_en_language_guz_KE','Zend_Locale'),('Zend_LocaleC_en_language_gu_IN','Zend_Locale'),('Zend_LocaleC_en_language_gv','Zend_Locale'),('Zend_LocaleC_en_language_gv_IM','Zend_Locale'),('Zend_LocaleC_en_language_ha','Zend_Locale'),('Zend_LocaleC_en_language_haw','Zend_Locale'),('Zend_LocaleC_en_language_haw_US','Zend_Locale'),('Zend_LocaleC_en_language_ha_GH','Zend_Locale'),('Zend_LocaleC_en_language_ha_Latn','Zend_Locale'),('Zend_LocaleC_en_language_ha_Latn_GH','Zend_Locale'),('Zend_LocaleC_en_language_ha_Latn_NE','Zend_Locale'),('Zend_LocaleC_en_language_ha_Latn_NG','Zend_Locale'),('Zend_LocaleC_en_language_ha_NE','Zend_Locale'),('Zend_LocaleC_en_language_ha_NG','Zend_Locale'),('Zend_LocaleC_en_language_he','Zend_Locale'),('Zend_LocaleC_en_language_he_IL','Zend_Locale'),('Zend_LocaleC_en_language_hi','Zend_Locale'),('Zend_LocaleC_en_language_hi_IN','Zend_Locale'),('Zend_LocaleC_en_language_hr','Zend_Locale'),('Zend_LocaleC_en_language_hr_BA','Zend_Locale'),('Zend_LocaleC_en_language_hr_HR','Zend_Locale'),('Zend_LocaleC_en_language_hu','Zend_Locale'),('Zend_LocaleC_en_language_hu_HU','Zend_Locale'),('Zend_LocaleC_en_language_hy','Zend_Locale'),('Zend_LocaleC_en_language_hy_AM','Zend_Locale'),('Zend_LocaleC_en_language_ia','Zend_Locale'),('Zend_LocaleC_en_language_ia_FR','Zend_Locale'),('Zend_LocaleC_en_language_id','Zend_Locale'),('Zend_LocaleC_en_language_id_ID','Zend_Locale'),('Zend_LocaleC_en_language_ig','Zend_Locale'),('Zend_LocaleC_en_language_ig_NG','Zend_Locale'),('Zend_LocaleC_en_language_ii','Zend_Locale'),('Zend_LocaleC_en_language_ii_CN','Zend_Locale'),('Zend_LocaleC_en_language_is','Zend_Locale'),('Zend_LocaleC_en_language_is_IS','Zend_Locale'),('Zend_LocaleC_en_language_it','Zend_Locale'),('Zend_LocaleC_en_language_it_CH','Zend_Locale'),('Zend_LocaleC_en_language_it_IT','Zend_Locale'),('Zend_LocaleC_en_language_it_SM','Zend_Locale'),('Zend_LocaleC_en_language_ja','Zend_Locale'),('Zend_LocaleC_en_language_ja_JP','Zend_Locale'),('Zend_LocaleC_en_language_jgo','Zend_Locale'),('Zend_LocaleC_en_language_jgo_CM','Zend_Locale'),('Zend_LocaleC_en_language_jmc','Zend_Locale'),('Zend_LocaleC_en_language_jmc_TZ','Zend_Locale'),('Zend_LocaleC_en_language_ka','Zend_Locale'),('Zend_LocaleC_en_language_kab','Zend_Locale'),('Zend_LocaleC_en_language_kab_DZ','Zend_Locale'),('Zend_LocaleC_en_language_kam','Zend_Locale'),('Zend_LocaleC_en_language_kam_KE','Zend_Locale'),('Zend_LocaleC_en_language_ka_GE','Zend_Locale'),('Zend_LocaleC_en_language_kde','Zend_Locale'),('Zend_LocaleC_en_language_kde_TZ','Zend_Locale'),('Zend_LocaleC_en_language_kea','Zend_Locale'),('Zend_LocaleC_en_language_kea_CV','Zend_Locale'),('Zend_LocaleC_en_language_khq','Zend_Locale'),('Zend_LocaleC_en_language_khq_ML','Zend_Locale'),('Zend_LocaleC_en_language_ki','Zend_Locale'),('Zend_LocaleC_en_language_ki_KE','Zend_Locale'),('Zend_LocaleC_en_language_kk','Zend_Locale'),('Zend_LocaleC_en_language_kkj','Zend_Locale'),('Zend_LocaleC_en_language_kkj_CM','Zend_Locale'),('Zend_LocaleC_en_language_kk_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_kk_Cyrl_KZ','Zend_Locale'),('Zend_LocaleC_en_language_kk_KZ','Zend_Locale'),('Zend_LocaleC_en_language_kl','Zend_Locale'),('Zend_LocaleC_en_language_kln','Zend_Locale'),('Zend_LocaleC_en_language_kln_KE','Zend_Locale'),('Zend_LocaleC_en_language_kl_GL','Zend_Locale'),('Zend_LocaleC_en_language_km','Zend_Locale'),('Zend_LocaleC_en_language_km_KH','Zend_Locale'),('Zend_LocaleC_en_language_kn','Zend_Locale'),('Zend_LocaleC_en_language_kn_IN','Zend_Locale'),('Zend_LocaleC_en_language_ko','Zend_Locale'),('Zend_LocaleC_en_language_kok','Zend_Locale'),('Zend_LocaleC_en_language_kok_IN','Zend_Locale'),('Zend_LocaleC_en_language_ko_KP','Zend_Locale'),('Zend_LocaleC_en_language_ko_KR','Zend_Locale'),('Zend_LocaleC_en_language_ks','Zend_Locale'),('Zend_LocaleC_en_language_ksb','Zend_Locale'),('Zend_LocaleC_en_language_ksb_TZ','Zend_Locale'),('Zend_LocaleC_en_language_ksf','Zend_Locale'),('Zend_LocaleC_en_language_ksf_CM','Zend_Locale'),('Zend_LocaleC_en_language_ksh','Zend_Locale'),('Zend_LocaleC_en_language_ksh_DE','Zend_Locale'),('Zend_LocaleC_en_language_ks_Arab','Zend_Locale'),('Zend_LocaleC_en_language_ks_Arab_IN','Zend_Locale'),('Zend_LocaleC_en_language_ks_IN','Zend_Locale'),('Zend_LocaleC_en_language_kw','Zend_Locale'),('Zend_LocaleC_en_language_kw_GB','Zend_Locale'),('Zend_LocaleC_en_language_ky','Zend_Locale'),('Zend_LocaleC_en_language_ky_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_ky_Cyrl_KG','Zend_Locale'),('Zend_LocaleC_en_language_lag','Zend_Locale'),('Zend_LocaleC_en_language_lag_TZ','Zend_Locale'),('Zend_LocaleC_en_language_lg','Zend_Locale'),('Zend_LocaleC_en_language_lg_UG','Zend_Locale'),('Zend_LocaleC_en_language_lkt','Zend_Locale'),('Zend_LocaleC_en_language_lkt_US','Zend_Locale'),('Zend_LocaleC_en_language_ln','Zend_Locale'),('Zend_LocaleC_en_language_ln_AO','Zend_Locale'),('Zend_LocaleC_en_language_ln_CD','Zend_Locale'),('Zend_LocaleC_en_language_ln_CF','Zend_Locale'),('Zend_LocaleC_en_language_ln_CG','Zend_Locale'),('Zend_LocaleC_en_language_lo','Zend_Locale'),('Zend_LocaleC_en_language_lo_LA','Zend_Locale'),('Zend_LocaleC_en_language_lt','Zend_Locale'),('Zend_LocaleC_en_language_lt_LT','Zend_Locale'),('Zend_LocaleC_en_language_lu','Zend_Locale'),('Zend_LocaleC_en_language_luo','Zend_Locale'),('Zend_LocaleC_en_language_luo_KE','Zend_Locale'),('Zend_LocaleC_en_language_luy','Zend_Locale'),('Zend_LocaleC_en_language_luy_KE','Zend_Locale'),('Zend_LocaleC_en_language_lu_CD','Zend_Locale'),('Zend_LocaleC_en_language_lv','Zend_Locale'),('Zend_LocaleC_en_language_lv_LV','Zend_Locale'),('Zend_LocaleC_en_language_mas','Zend_Locale'),('Zend_LocaleC_en_language_mas_KE','Zend_Locale'),('Zend_LocaleC_en_language_mas_TZ','Zend_Locale'),('Zend_LocaleC_en_language_mer','Zend_Locale'),('Zend_LocaleC_en_language_mer_KE','Zend_Locale'),('Zend_LocaleC_en_language_mfe','Zend_Locale'),('Zend_LocaleC_en_language_mfe_MU','Zend_Locale'),('Zend_LocaleC_en_language_mg','Zend_Locale'),('Zend_LocaleC_en_language_mgh','Zend_Locale'),('Zend_LocaleC_en_language_mgh_MZ','Zend_Locale'),('Zend_LocaleC_en_language_mgo','Zend_Locale'),('Zend_LocaleC_en_language_mgo_CM','Zend_Locale'),('Zend_LocaleC_en_language_mg_MG','Zend_Locale'),('Zend_LocaleC_en_language_mk','Zend_Locale'),('Zend_LocaleC_en_language_mk_MK','Zend_Locale'),('Zend_LocaleC_en_language_ml','Zend_Locale'),('Zend_LocaleC_en_language_ml_IN','Zend_Locale'),('Zend_LocaleC_en_language_mn','Zend_Locale'),('Zend_LocaleC_en_language_mn_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_mn_Cyrl_MN','Zend_Locale'),('Zend_LocaleC_en_language_mn_MN','Zend_Locale'),('Zend_LocaleC_en_language_mr','Zend_Locale'),('Zend_LocaleC_en_language_mr_IN','Zend_Locale'),('Zend_LocaleC_en_language_ms','Zend_Locale'),('Zend_LocaleC_en_language_ms_BN','Zend_Locale'),('Zend_LocaleC_en_language_ms_Latn','Zend_Locale'),('Zend_LocaleC_en_language_ms_Latn_BN','Zend_Locale'),('Zend_LocaleC_en_language_ms_Latn_MY','Zend_Locale'),('Zend_LocaleC_en_language_ms_Latn_SG','Zend_Locale'),('Zend_LocaleC_en_language_ms_MY','Zend_Locale'),('Zend_LocaleC_en_language_ms_SG','Zend_Locale'),('Zend_LocaleC_en_language_mt','Zend_Locale'),('Zend_LocaleC_en_language_mt_MT','Zend_Locale'),('Zend_LocaleC_en_language_mua','Zend_Locale'),('Zend_LocaleC_en_language_mua_CM','Zend_Locale'),('Zend_LocaleC_en_language_my','Zend_Locale'),('Zend_LocaleC_en_language_my_MM','Zend_Locale'),('Zend_LocaleC_en_language_naq','Zend_Locale'),('Zend_LocaleC_en_language_naq_NA','Zend_Locale'),('Zend_LocaleC_en_language_nb','Zend_Locale'),('Zend_LocaleC_en_language_nb_NO','Zend_Locale'),('Zend_LocaleC_en_language_nb_SJ','Zend_Locale'),('Zend_LocaleC_en_language_nd','Zend_Locale'),('Zend_LocaleC_en_language_nd_ZW','Zend_Locale'),('Zend_LocaleC_en_language_ne','Zend_Locale'),('Zend_LocaleC_en_language_ne_IN','Zend_Locale'),('Zend_LocaleC_en_language_ne_NP','Zend_Locale'),('Zend_LocaleC_en_language_nl','Zend_Locale'),('Zend_LocaleC_en_language_nl_AW','Zend_Locale'),('Zend_LocaleC_en_language_nl_BE','Zend_Locale'),('Zend_LocaleC_en_language_nl_BQ','Zend_Locale'),('Zend_LocaleC_en_language_nl_CW','Zend_Locale'),('Zend_LocaleC_en_language_nl_NL','Zend_Locale'),('Zend_LocaleC_en_language_nl_SR','Zend_Locale'),('Zend_LocaleC_en_language_nl_SX','Zend_Locale'),('Zend_LocaleC_en_language_nmg','Zend_Locale'),('Zend_LocaleC_en_language_nmg_CM','Zend_Locale'),('Zend_LocaleC_en_language_nn','Zend_Locale'),('Zend_LocaleC_en_language_nnh','Zend_Locale'),('Zend_LocaleC_en_language_nnh_CM','Zend_Locale'),('Zend_LocaleC_en_language_nn_NO','Zend_Locale'),('Zend_LocaleC_en_language_nr','Zend_Locale'),('Zend_LocaleC_en_language_nr_ZA','Zend_Locale'),('Zend_LocaleC_en_language_nso','Zend_Locale'),('Zend_LocaleC_en_language_nso_ZA','Zend_Locale'),('Zend_LocaleC_en_language_nus','Zend_Locale'),('Zend_LocaleC_en_language_nus_SD','Zend_Locale'),('Zend_LocaleC_en_language_nyn','Zend_Locale'),('Zend_LocaleC_en_language_nyn_UG','Zend_Locale'),('Zend_LocaleC_en_language_om','Zend_Locale'),('Zend_LocaleC_en_language_om_ET','Zend_Locale'),('Zend_LocaleC_en_language_om_KE','Zend_Locale'),('Zend_LocaleC_en_language_or','Zend_Locale'),('Zend_LocaleC_en_language_ordinals','Zend_Locale'),('Zend_LocaleC_en_language_or_IN','Zend_Locale'),('Zend_LocaleC_en_language_os','Zend_Locale'),('Zend_LocaleC_en_language_os_GE','Zend_Locale'),('Zend_LocaleC_en_language_os_RU','Zend_Locale'),('Zend_LocaleC_en_language_pa','Zend_Locale'),('Zend_LocaleC_en_language_pa_Arab','Zend_Locale'),('Zend_LocaleC_en_language_pa_Arab_PK','Zend_Locale'),('Zend_LocaleC_en_language_pa_Guru','Zend_Locale'),('Zend_LocaleC_en_language_pa_Guru_IN','Zend_Locale'),('Zend_LocaleC_en_language_pa_IN','Zend_Locale'),('Zend_LocaleC_en_language_pa_PK','Zend_Locale'),('Zend_LocaleC_en_language_pl','Zend_Locale'),('Zend_LocaleC_en_language_plurals','Zend_Locale'),('Zend_LocaleC_en_language_pl_PL','Zend_Locale'),('Zend_LocaleC_en_language_ps','Zend_Locale'),('Zend_LocaleC_en_language_ps_AF','Zend_Locale'),('Zend_LocaleC_en_language_pt','Zend_Locale'),('Zend_LocaleC_en_language_pt_AO','Zend_Locale'),('Zend_LocaleC_en_language_pt_BR','Zend_Locale'),('Zend_LocaleC_en_language_pt_CV','Zend_Locale'),('Zend_LocaleC_en_language_pt_GW','Zend_Locale'),('Zend_LocaleC_en_language_pt_MO','Zend_Locale'),('Zend_LocaleC_en_language_pt_MZ','Zend_Locale'),('Zend_LocaleC_en_language_pt_PT','Zend_Locale'),('Zend_LocaleC_en_language_pt_ST','Zend_Locale'),('Zend_LocaleC_en_language_pt_TL','Zend_Locale'),('Zend_LocaleC_en_language_rm','Zend_Locale'),('Zend_LocaleC_en_language_rm_CH','Zend_Locale'),('Zend_LocaleC_en_language_rn','Zend_Locale'),('Zend_LocaleC_en_language_rn_BI','Zend_Locale'),('Zend_LocaleC_en_language_ro','Zend_Locale'),('Zend_LocaleC_en_language_rof','Zend_Locale'),('Zend_LocaleC_en_language_rof_TZ','Zend_Locale'),('Zend_LocaleC_en_language_root','Zend_Locale'),('Zend_LocaleC_en_language_ro_MD','Zend_Locale'),('Zend_LocaleC_en_language_ro_RO','Zend_Locale'),('Zend_LocaleC_en_language_ru','Zend_Locale'),('Zend_LocaleC_en_language_ru_BY','Zend_Locale'),('Zend_LocaleC_en_language_ru_KG','Zend_Locale'),('Zend_LocaleC_en_language_ru_KZ','Zend_Locale'),('Zend_LocaleC_en_language_ru_MD','Zend_Locale'),('Zend_LocaleC_en_language_ru_RU','Zend_Locale'),('Zend_LocaleC_en_language_ru_UA','Zend_Locale'),('Zend_LocaleC_en_language_rw','Zend_Locale'),('Zend_LocaleC_en_language_rwk','Zend_Locale'),('Zend_LocaleC_en_language_rwk_TZ','Zend_Locale'),('Zend_LocaleC_en_language_rw_RW','Zend_Locale'),('Zend_LocaleC_en_language_sah','Zend_Locale'),('Zend_LocaleC_en_language_sah_RU','Zend_Locale'),('Zend_LocaleC_en_language_saq','Zend_Locale'),('Zend_LocaleC_en_language_saq_KE','Zend_Locale'),('Zend_LocaleC_en_language_sbp','Zend_Locale'),('Zend_LocaleC_en_language_sbp_TZ','Zend_Locale'),('Zend_LocaleC_en_language_se','Zend_Locale'),('Zend_LocaleC_en_language_seh','Zend_Locale'),('Zend_LocaleC_en_language_seh_MZ','Zend_Locale'),('Zend_LocaleC_en_language_ses','Zend_Locale'),('Zend_LocaleC_en_language_ses_ML','Zend_Locale'),('Zend_LocaleC_en_language_se_FI','Zend_Locale'),('Zend_LocaleC_en_language_se_NO','Zend_Locale'),('Zend_LocaleC_en_language_sg','Zend_Locale'),('Zend_LocaleC_en_language_sg_CF','Zend_Locale'),('Zend_LocaleC_en_language_shi','Zend_Locale'),('Zend_LocaleC_en_language_shi_Latn','Zend_Locale'),('Zend_LocaleC_en_language_shi_Latn_MA','Zend_Locale'),('Zend_LocaleC_en_language_shi_MA','Zend_Locale'),('Zend_LocaleC_en_language_shi_Tfng','Zend_Locale'),('Zend_LocaleC_en_language_shi_Tfng_MA','Zend_Locale'),('Zend_LocaleC_en_language_si','Zend_Locale'),('Zend_LocaleC_en_language_si_LK','Zend_Locale'),('Zend_LocaleC_en_language_sk','Zend_Locale'),('Zend_LocaleC_en_language_sk_SK','Zend_Locale'),('Zend_LocaleC_en_language_sl','Zend_Locale'),('Zend_LocaleC_en_language_sl_SI','Zend_Locale'),('Zend_LocaleC_en_language_sn','Zend_Locale'),('Zend_LocaleC_en_language_sn_ZW','Zend_Locale'),('Zend_LocaleC_en_language_so','Zend_Locale'),('Zend_LocaleC_en_language_so_DJ','Zend_Locale'),('Zend_LocaleC_en_language_so_ET','Zend_Locale'),('Zend_LocaleC_en_language_so_KE','Zend_Locale'),('Zend_LocaleC_en_language_so_SO','Zend_Locale'),('Zend_LocaleC_en_language_sq','Zend_Locale'),('Zend_LocaleC_en_language_sq_AL','Zend_Locale'),('Zend_LocaleC_en_language_sq_MK','Zend_Locale'),('Zend_LocaleC_en_language_sq_XK','Zend_Locale'),('Zend_LocaleC_en_language_sr','Zend_Locale'),('Zend_LocaleC_en_language_sr_BA','Zend_Locale'),('Zend_LocaleC_en_language_sr_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_sr_Cyrl_BA','Zend_Locale'),('Zend_LocaleC_en_language_sr_Cyrl_ME','Zend_Locale'),('Zend_LocaleC_en_language_sr_Cyrl_RS','Zend_Locale'),('Zend_LocaleC_en_language_sr_Cyrl_XK','Zend_Locale'),('Zend_LocaleC_en_language_sr_Latn','Zend_Locale'),('Zend_LocaleC_en_language_sr_Latn_BA','Zend_Locale'),('Zend_LocaleC_en_language_sr_Latn_ME','Zend_Locale'),('Zend_LocaleC_en_language_sr_Latn_RS','Zend_Locale'),('Zend_LocaleC_en_language_sr_Latn_XK','Zend_Locale'),('Zend_LocaleC_en_language_sr_ME','Zend_Locale'),('Zend_LocaleC_en_language_sr_RS','Zend_Locale'),('Zend_LocaleC_en_language_sr_XK','Zend_Locale'),('Zend_LocaleC_en_language_ss','Zend_Locale'),('Zend_LocaleC_en_language_ssy','Zend_Locale'),('Zend_LocaleC_en_language_ssy_ER','Zend_Locale'),('Zend_LocaleC_en_language_ss_SZ','Zend_Locale'),('Zend_LocaleC_en_language_ss_ZA','Zend_Locale'),('Zend_LocaleC_en_language_st','Zend_Locale'),('Zend_LocaleC_en_language_st_LS','Zend_Locale'),('Zend_LocaleC_en_language_st_ZA','Zend_Locale'),('Zend_LocaleC_en_language_sv','Zend_Locale'),('Zend_LocaleC_en_language_sv_AX','Zend_Locale'),('Zend_LocaleC_en_language_sv_FI','Zend_Locale'),('Zend_LocaleC_en_language_sv_SE','Zend_Locale'),('Zend_LocaleC_en_language_sw','Zend_Locale'),('Zend_LocaleC_en_language_swc','Zend_Locale'),('Zend_LocaleC_en_language_swc_CD','Zend_Locale'),('Zend_LocaleC_en_language_sw_KE','Zend_Locale'),('Zend_LocaleC_en_language_sw_TZ','Zend_Locale'),('Zend_LocaleC_en_language_sw_UG','Zend_Locale'),('Zend_LocaleC_en_language_ta','Zend_Locale'),('Zend_LocaleC_en_language_ta_IN','Zend_Locale'),('Zend_LocaleC_en_language_ta_LK','Zend_Locale'),('Zend_LocaleC_en_language_ta_MY','Zend_Locale'),('Zend_LocaleC_en_language_ta_SG','Zend_Locale'),('Zend_LocaleC_en_language_te','Zend_Locale'),('Zend_LocaleC_en_language_teo','Zend_Locale'),('Zend_LocaleC_en_language_teo_KE','Zend_Locale'),('Zend_LocaleC_en_language_teo_UG','Zend_Locale'),('Zend_LocaleC_en_language_te_IN','Zend_Locale'),('Zend_LocaleC_en_language_tg','Zend_Locale'),('Zend_LocaleC_en_language_tg_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_tg_Cyrl_TJ','Zend_Locale'),('Zend_LocaleC_en_language_tg_TJ','Zend_Locale'),('Zend_LocaleC_en_language_th','Zend_Locale'),('Zend_LocaleC_en_language_th_TH','Zend_Locale'),('Zend_LocaleC_en_language_ti','Zend_Locale'),('Zend_LocaleC_en_language_tig','Zend_Locale'),('Zend_LocaleC_en_language_tig_ER','Zend_Locale'),('Zend_LocaleC_en_language_ti_ER','Zend_Locale'),('Zend_LocaleC_en_language_ti_ET','Zend_Locale'),('Zend_LocaleC_en_language_tn','Zend_Locale'),('Zend_LocaleC_en_language_tn_BW','Zend_Locale'),('Zend_LocaleC_en_language_tn_ZA','Zend_Locale'),('Zend_LocaleC_en_language_to','Zend_Locale'),('Zend_LocaleC_en_language_to_TO','Zend_Locale'),('Zend_LocaleC_en_language_tr','Zend_Locale'),('Zend_LocaleC_en_language_tr_CY','Zend_Locale'),('Zend_LocaleC_en_language_tr_TR','Zend_Locale'),('Zend_LocaleC_en_language_ts','Zend_Locale'),('Zend_LocaleC_en_language_ts_ZA','Zend_Locale'),('Zend_LocaleC_en_language_twq','Zend_Locale'),('Zend_LocaleC_en_language_twq_NE','Zend_Locale'),('Zend_LocaleC_en_language_tzm','Zend_Locale'),('Zend_LocaleC_en_language_tzm_Latn','Zend_Locale'),('Zend_LocaleC_en_language_tzm_Latn_MA','Zend_Locale'),('Zend_LocaleC_en_language_tzm_MA','Zend_Locale'),('Zend_LocaleC_en_language_ug','Zend_Locale'),('Zend_LocaleC_en_language_ug_Arab','Zend_Locale'),('Zend_LocaleC_en_language_ug_Arab_CN','Zend_Locale'),('Zend_LocaleC_en_language_uk','Zend_Locale'),('Zend_LocaleC_en_language_uk_UA','Zend_Locale'),('Zend_LocaleC_en_language_ur','Zend_Locale'),('Zend_LocaleC_en_language_ur_IN','Zend_Locale'),('Zend_LocaleC_en_language_ur_PK','Zend_Locale'),('Zend_LocaleC_en_language_uz','Zend_Locale'),('Zend_LocaleC_en_language_uz_AF','Zend_Locale'),('Zend_LocaleC_en_language_uz_Arab','Zend_Locale'),('Zend_LocaleC_en_language_uz_Arab_AF','Zend_Locale'),('Zend_LocaleC_en_language_uz_Cyrl','Zend_Locale'),('Zend_LocaleC_en_language_uz_Cyrl_UZ','Zend_Locale'),('Zend_LocaleC_en_language_uz_Latn','Zend_Locale'),('Zend_LocaleC_en_language_uz_Latn_UZ','Zend_Locale'),('Zend_LocaleC_en_language_uz_UZ','Zend_Locale'),('Zend_LocaleC_en_language_vai','Zend_Locale'),('Zend_LocaleC_en_language_vai_Latn','Zend_Locale'),('Zend_LocaleC_en_language_vai_Latn_LR','Zend_Locale'),('Zend_LocaleC_en_language_vai_LR','Zend_Locale'),('Zend_LocaleC_en_language_vai_Vaii','Zend_Locale'),('Zend_LocaleC_en_language_vai_Vaii_LR','Zend_Locale'),('Zend_LocaleC_en_language_ve','Zend_Locale'),('Zend_LocaleC_en_language_ve_ZA','Zend_Locale'),('Zend_LocaleC_en_language_vi','Zend_Locale'),('Zend_LocaleC_en_language_vi_VN','Zend_Locale'),('Zend_LocaleC_en_language_vo','Zend_Locale'),('Zend_LocaleC_en_language_vo_001','Zend_Locale'),('Zend_LocaleC_en_language_vun','Zend_Locale'),('Zend_LocaleC_en_language_vun_TZ','Zend_Locale'),('Zend_LocaleC_en_language_wae','Zend_Locale'),('Zend_LocaleC_en_language_wae_CH','Zend_Locale'),('Zend_LocaleC_en_language_wal','Zend_Locale'),('Zend_LocaleC_en_language_wal_ET','Zend_Locale'),('Zend_LocaleC_en_language_xh','Zend_Locale'),('Zend_LocaleC_en_language_xh_ZA','Zend_Locale'),('Zend_LocaleC_en_language_xog','Zend_Locale'),('Zend_LocaleC_en_language_xog_UG','Zend_Locale'),('Zend_LocaleC_en_language_yav','Zend_Locale'),('Zend_LocaleC_en_language_yav_CM','Zend_Locale'),('Zend_LocaleC_en_language_yo','Zend_Locale'),('Zend_LocaleC_en_language_yo_BJ','Zend_Locale'),('Zend_LocaleC_en_language_yo_NG','Zend_Locale'),('Zend_LocaleC_en_language_zgh','Zend_Locale'),('Zend_LocaleC_en_language_zgh_MA','Zend_Locale'),('Zend_LocaleC_en_language_zh','Zend_Locale'),('Zend_LocaleC_en_language_zh_CN','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hans','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hans_CN','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hans_HK','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hans_MO','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hans_SG','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hant','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hant_HK','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hant_MO','Zend_Locale'),('Zend_LocaleC_en_language_zh_Hant_TW','Zend_Locale'),('Zend_LocaleC_en_language_zh_HK','Zend_Locale'),('Zend_LocaleC_en_language_zh_MO','Zend_Locale'),('Zend_LocaleC_en_language_zh_SG','Zend_Locale'),('Zend_LocaleC_en_language_zh_TW','Zend_Locale'),('Zend_LocaleC_en_language_zu','Zend_Locale'),('Zend_LocaleC_en_language_zu_ZA','Zend_Locale'),('Zend_LocaleC_en_territory_','Zend_Locale'),('Zend_LocaleC_en_territory_001','Zend_Locale'),('Zend_LocaleC_en_territory_150','Zend_Locale'),('Zend_LocaleC_en_territory_AD','Zend_Locale'),('Zend_LocaleC_en_territory_AE','Zend_Locale'),('Zend_LocaleC_en_territory_AF','Zend_Locale'),('Zend_LocaleC_en_territory_AG','Zend_Locale'),('Zend_LocaleC_en_territory_AI','Zend_Locale'),('Zend_LocaleC_en_territory_AL','Zend_Locale'),('Zend_LocaleC_en_territory_AM','Zend_Locale'),('Zend_LocaleC_en_territory_AO','Zend_Locale'),('Zend_LocaleC_en_territory_AR','Zend_Locale'),('Zend_LocaleC_en_territory_AS','Zend_Locale'),('Zend_LocaleC_en_territory_AW','Zend_Locale'),('Zend_LocaleC_en_territory_AX','Zend_Locale'),('Zend_LocaleC_en_territory_AZ','Zend_Locale'),('Zend_LocaleC_en_territory_BA','Zend_Locale'),('Zend_LocaleC_en_territory_BB','Zend_Locale'),('Zend_LocaleC_en_territory_BD','Zend_Locale'),('Zend_LocaleC_en_territory_BE','Zend_Locale'),('Zend_LocaleC_en_territory_BF','Zend_Locale'),('Zend_LocaleC_en_territory_BG','Zend_Locale'),('Zend_LocaleC_en_territory_BH','Zend_Locale'),('Zend_LocaleC_en_territory_BI','Zend_Locale'),('Zend_LocaleC_en_territory_BJ','Zend_Locale'),('Zend_LocaleC_en_territory_BL','Zend_Locale'),('Zend_LocaleC_en_territory_BM','Zend_Locale'),('Zend_LocaleC_en_territory_BN','Zend_Locale'),('Zend_LocaleC_en_territory_BO','Zend_Locale'),('Zend_LocaleC_en_territory_BQ','Zend_Locale'),('Zend_LocaleC_en_territory_BS','Zend_Locale'),('Zend_LocaleC_en_territory_BT','Zend_Locale'),('Zend_LocaleC_en_territory_BW','Zend_Locale'),('Zend_LocaleC_en_territory_BY','Zend_Locale'),('Zend_LocaleC_en_territory_BZ','Zend_Locale'),('Zend_LocaleC_en_territory_CC','Zend_Locale'),('Zend_LocaleC_en_territory_CD','Zend_Locale'),('Zend_LocaleC_en_territory_CF','Zend_Locale'),('Zend_LocaleC_en_territory_CG','Zend_Locale'),('Zend_LocaleC_en_territory_CH','Zend_Locale'),('Zend_LocaleC_en_territory_CI','Zend_Locale'),('Zend_LocaleC_en_territory_CK','Zend_Locale'),('Zend_LocaleC_en_territory_CL','Zend_Locale'),('Zend_LocaleC_en_territory_CM','Zend_Locale'),('Zend_LocaleC_en_territory_CN','Zend_Locale'),('Zend_LocaleC_en_territory_CO','Zend_Locale'),('Zend_LocaleC_en_territory_CR','Zend_Locale'),('Zend_LocaleC_en_territory_CU','Zend_Locale'),('Zend_LocaleC_en_territory_CV','Zend_Locale'),('Zend_LocaleC_en_territory_CW','Zend_Locale'),('Zend_LocaleC_en_territory_CX','Zend_Locale'),('Zend_LocaleC_en_territory_CY','Zend_Locale'),('Zend_LocaleC_en_territory_CZ','Zend_Locale'),('Zend_LocaleC_en_territory_DE','Zend_Locale'),('Zend_LocaleC_en_territory_DG','Zend_Locale'),('Zend_LocaleC_en_territory_DJ','Zend_Locale'),('Zend_LocaleC_en_territory_DK','Zend_Locale'),('Zend_LocaleC_en_territory_DM','Zend_Locale'),('Zend_LocaleC_en_territory_DO','Zend_Locale'),('Zend_LocaleC_en_territory_DZ','Zend_Locale'),('Zend_LocaleC_en_territory_EA','Zend_Locale'),('Zend_LocaleC_en_territory_EC','Zend_Locale'),('Zend_LocaleC_en_territory_EE','Zend_Locale'),('Zend_LocaleC_en_territory_EG','Zend_Locale'),('Zend_LocaleC_en_territory_EH','Zend_Locale'),('Zend_LocaleC_en_territory_ER','Zend_Locale'),('Zend_LocaleC_en_territory_ES','Zend_Locale'),('Zend_LocaleC_en_territory_ET','Zend_Locale'),('Zend_LocaleC_en_territory_FI','Zend_Locale'),('Zend_LocaleC_en_territory_FJ','Zend_Locale'),('Zend_LocaleC_en_territory_FK','Zend_Locale'),('Zend_LocaleC_en_territory_FM','Zend_Locale'),('Zend_LocaleC_en_territory_FO','Zend_Locale'),('Zend_LocaleC_en_territory_FR','Zend_Locale'),('Zend_LocaleC_en_territory_GA','Zend_Locale'),('Zend_LocaleC_en_territory_GB','Zend_Locale'),('Zend_LocaleC_en_territory_GD','Zend_Locale'),('Zend_LocaleC_en_territory_GE','Zend_Locale'),('Zend_LocaleC_en_territory_GF','Zend_Locale'),('Zend_LocaleC_en_territory_GG','Zend_Locale'),('Zend_LocaleC_en_territory_GH','Zend_Locale'),('Zend_LocaleC_en_territory_GI','Zend_Locale'),('Zend_LocaleC_en_territory_GL','Zend_Locale'),('Zend_LocaleC_en_territory_GM','Zend_Locale'),('Zend_LocaleC_en_territory_GN','Zend_Locale'),('Zend_LocaleC_en_territory_GP','Zend_Locale'),('Zend_LocaleC_en_territory_GQ','Zend_Locale'),('Zend_LocaleC_en_territory_GR','Zend_Locale'),('Zend_LocaleC_en_territory_GT','Zend_Locale'),('Zend_LocaleC_en_territory_GU','Zend_Locale'),('Zend_LocaleC_en_territory_GW','Zend_Locale'),('Zend_LocaleC_en_territory_GY','Zend_Locale'),('Zend_LocaleC_en_territory_HK','Zend_Locale'),('Zend_LocaleC_en_territory_HN','Zend_Locale'),('Zend_LocaleC_en_territory_HR','Zend_Locale'),('Zend_LocaleC_en_territory_HT','Zend_Locale'),('Zend_LocaleC_en_territory_HU','Zend_Locale'),('Zend_LocaleC_en_territory_IC','Zend_Locale'),('Zend_LocaleC_en_territory_ID','Zend_Locale'),('Zend_LocaleC_en_territory_IE','Zend_Locale'),('Zend_LocaleC_en_territory_IL','Zend_Locale'),('Zend_LocaleC_en_territory_IM','Zend_Locale'),('Zend_LocaleC_en_territory_IN','Zend_Locale'),('Zend_LocaleC_en_territory_IO','Zend_Locale'),('Zend_LocaleC_en_territory_IQ','Zend_Locale'),('Zend_LocaleC_en_territory_IR','Zend_Locale'),('Zend_LocaleC_en_territory_IS','Zend_Locale'),('Zend_LocaleC_en_territory_IT','Zend_Locale'),('Zend_LocaleC_en_territory_JE','Zend_Locale'),('Zend_LocaleC_en_territory_JM','Zend_Locale'),('Zend_LocaleC_en_territory_JO','Zend_Locale'),('Zend_LocaleC_en_territory_JP','Zend_Locale'),('Zend_LocaleC_en_territory_KE','Zend_Locale'),('Zend_LocaleC_en_territory_KG','Zend_Locale'),('Zend_LocaleC_en_territory_KH','Zend_Locale'),('Zend_LocaleC_en_territory_KI','Zend_Locale'),('Zend_LocaleC_en_territory_KM','Zend_Locale'),('Zend_LocaleC_en_territory_KN','Zend_Locale'),('Zend_LocaleC_en_territory_KP','Zend_Locale'),('Zend_LocaleC_en_territory_KR','Zend_Locale'),('Zend_LocaleC_en_territory_KW','Zend_Locale'),('Zend_LocaleC_en_territory_KY','Zend_Locale'),('Zend_LocaleC_en_territory_KZ','Zend_Locale'),('Zend_LocaleC_en_territory_LA','Zend_Locale'),('Zend_LocaleC_en_territory_LB','Zend_Locale'),('Zend_LocaleC_en_territory_LC','Zend_Locale'),('Zend_LocaleC_en_territory_LI','Zend_Locale'),('Zend_LocaleC_en_territory_LK','Zend_Locale'),('Zend_LocaleC_en_territory_LR','Zend_Locale'),('Zend_LocaleC_en_territory_LS','Zend_Locale'),('Zend_LocaleC_en_territory_LT','Zend_Locale'),('Zend_LocaleC_en_territory_LU','Zend_Locale'),('Zend_LocaleC_en_territory_LV','Zend_Locale'),('Zend_LocaleC_en_territory_LY','Zend_Locale'),('Zend_LocaleC_en_territory_MA','Zend_Locale'),('Zend_LocaleC_en_territory_MC','Zend_Locale'),('Zend_LocaleC_en_territory_MD','Zend_Locale'),('Zend_LocaleC_en_territory_ME','Zend_Locale'),('Zend_LocaleC_en_territory_MF','Zend_Locale'),('Zend_LocaleC_en_territory_MG','Zend_Locale'),('Zend_LocaleC_en_territory_MH','Zend_Locale'),('Zend_LocaleC_en_territory_MK','Zend_Locale'),('Zend_LocaleC_en_territory_ML','Zend_Locale'),('Zend_LocaleC_en_territory_MM','Zend_Locale'),('Zend_LocaleC_en_territory_MN','Zend_Locale'),('Zend_LocaleC_en_territory_MO','Zend_Locale'),('Zend_LocaleC_en_territory_MP','Zend_Locale'),('Zend_LocaleC_en_territory_MQ','Zend_Locale'),('Zend_LocaleC_en_territory_MR','Zend_Locale'),('Zend_LocaleC_en_territory_MS','Zend_Locale'),('Zend_LocaleC_en_territory_MT','Zend_Locale'),('Zend_LocaleC_en_territory_MU','Zend_Locale'),('Zend_LocaleC_en_territory_MW','Zend_Locale'),('Zend_LocaleC_en_territory_MY','Zend_Locale'),('Zend_LocaleC_en_territory_MZ','Zend_Locale'),('Zend_LocaleC_en_territory_NA','Zend_Locale'),('Zend_LocaleC_en_territory_NC','Zend_Locale'),('Zend_LocaleC_en_territory_NE','Zend_Locale'),('Zend_LocaleC_en_territory_NF','Zend_Locale'),('Zend_LocaleC_en_territory_NG','Zend_Locale'),('Zend_LocaleC_en_territory_NI','Zend_Locale'),('Zend_LocaleC_en_territory_NL','Zend_Locale'),('Zend_LocaleC_en_territory_NO','Zend_Locale'),('Zend_LocaleC_en_territory_NP','Zend_Locale'),('Zend_LocaleC_en_territory_NR','Zend_Locale'),('Zend_LocaleC_en_territory_NU','Zend_Locale'),('Zend_LocaleC_en_territory_NZ','Zend_Locale'),('Zend_LocaleC_en_territory_OM','Zend_Locale'),('Zend_LocaleC_en_territory_PA','Zend_Locale'),('Zend_LocaleC_en_territory_PE','Zend_Locale'),('Zend_LocaleC_en_territory_PF','Zend_Locale'),('Zend_LocaleC_en_territory_PG','Zend_Locale'),('Zend_LocaleC_en_territory_PH','Zend_Locale'),('Zend_LocaleC_en_territory_PK','Zend_Locale'),('Zend_LocaleC_en_territory_PL','Zend_Locale'),('Zend_LocaleC_en_territory_PM','Zend_Locale'),('Zend_LocaleC_en_territory_PN','Zend_Locale'),('Zend_LocaleC_en_territory_PR','Zend_Locale'),('Zend_LocaleC_en_territory_PS','Zend_Locale'),('Zend_LocaleC_en_territory_PW','Zend_Locale'),('Zend_LocaleC_en_territory_PY','Zend_Locale'),('Zend_LocaleC_en_territory_QA','Zend_Locale'),('Zend_LocaleC_en_territory_RE','Zend_Locale'),('Zend_LocaleC_en_territory_RO','Zend_Locale'),('Zend_LocaleC_en_territory_RS','Zend_Locale'),('Zend_LocaleC_en_territory_RU','Zend_Locale'),('Zend_LocaleC_en_territory_RW','Zend_Locale'),('Zend_LocaleC_en_territory_SA','Zend_Locale'),('Zend_LocaleC_en_territory_SB','Zend_Locale'),('Zend_LocaleC_en_territory_SC','Zend_Locale'),('Zend_LocaleC_en_territory_SD','Zend_Locale'),('Zend_LocaleC_en_territory_SE','Zend_Locale'),('Zend_LocaleC_en_territory_SG','Zend_Locale'),('Zend_LocaleC_en_territory_SH','Zend_Locale'),('Zend_LocaleC_en_territory_SI','Zend_Locale'),('Zend_LocaleC_en_territory_SJ','Zend_Locale'),('Zend_LocaleC_en_territory_SK','Zend_Locale'),('Zend_LocaleC_en_territory_SL','Zend_Locale'),('Zend_LocaleC_en_territory_SM','Zend_Locale'),('Zend_LocaleC_en_territory_SN','Zend_Locale'),('Zend_LocaleC_en_territory_SO','Zend_Locale'),('Zend_LocaleC_en_territory_SR','Zend_Locale'),('Zend_LocaleC_en_territory_SS','Zend_Locale'),('Zend_LocaleC_en_territory_ST','Zend_Locale'),('Zend_LocaleC_en_territory_SV','Zend_Locale'),('Zend_LocaleC_en_territory_SX','Zend_Locale'),('Zend_LocaleC_en_territory_SY','Zend_Locale'),('Zend_LocaleC_en_territory_SZ','Zend_Locale'),('Zend_LocaleC_en_territory_TC','Zend_Locale'),('Zend_LocaleC_en_territory_TD','Zend_Locale'),('Zend_LocaleC_en_territory_TG','Zend_Locale'),('Zend_LocaleC_en_territory_TH','Zend_Locale'),('Zend_LocaleC_en_territory_TJ','Zend_Locale'),('Zend_LocaleC_en_territory_TK','Zend_Locale'),('Zend_LocaleC_en_territory_TL','Zend_Locale'),('Zend_LocaleC_en_territory_TN','Zend_Locale'),('Zend_LocaleC_en_territory_TO','Zend_Locale'),('Zend_LocaleC_en_territory_TR','Zend_Locale'),('Zend_LocaleC_en_territory_TT','Zend_Locale'),('Zend_LocaleC_en_territory_TV','Zend_Locale'),('Zend_LocaleC_en_territory_TW','Zend_Locale'),('Zend_LocaleC_en_territory_TZ','Zend_Locale'),('Zend_LocaleC_en_territory_UA','Zend_Locale'),('Zend_LocaleC_en_territory_UG','Zend_Locale'),('Zend_LocaleC_en_territory_UM','Zend_Locale'),('Zend_LocaleC_en_territory_US','Zend_Locale'),('Zend_LocaleC_en_territory_UY','Zend_Locale'),('Zend_LocaleC_en_territory_UZ','Zend_Locale'),('Zend_LocaleC_en_territory_VC','Zend_Locale'),('Zend_LocaleC_en_territory_VE','Zend_Locale'),('Zend_LocaleC_en_territory_VG','Zend_Locale'),('Zend_LocaleC_en_territory_VI','Zend_Locale'),('Zend_LocaleC_en_territory_VN','Zend_Locale'),('Zend_LocaleC_en_territory_VU','Zend_Locale'),('Zend_LocaleC_en_territory_WF','Zend_Locale'),('Zend_LocaleC_en_territory_WS','Zend_Locale'),('Zend_LocaleC_en_territory_XK','Zend_Locale'),('Zend_LocaleC_en_territory_YE','Zend_Locale'),('Zend_LocaleC_en_territory_YT','Zend_Locale'),('Zend_LocaleC_en_territory_ZA','Zend_Locale'),('Zend_LocaleC_en_territory_ZM','Zend_Locale'),('Zend_LocaleC_en_territory_ZW','Zend_Locale');
/*!40000 ALTER TABLE `cache_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(190) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (2,'blogpost'),(3,'contacts');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_collectionrelations`
--

DROP TABLE IF EXISTS `classificationstore_collectionrelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classificationstore_collectionrelations` (
  `colId` bigint(20) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `sorter` int(10) DEFAULT '0',
  PRIMARY KEY (`colId`,`groupId`),
  KEY `colId` (`colId`),
  KEY `FK_classificationstore_collectionrelations_groups` (`groupId`),
  CONSTRAINT `FK_classificationstore_collectionrelations_groups` FOREIGN KEY (`groupId`) REFERENCES `classificationstore_groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_collectionrelations`
--

LOCK TABLES `classificationstore_collectionrelations` WRITE;
/*!40000 ALTER TABLE `classificationstore_collectionrelations` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_collectionrelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_collections`
--

DROP TABLE IF EXISTS `classificationstore_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classificationstore_collections` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `storeId` (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_collections`
--

LOCK TABLES `classificationstore_collections` WRITE;
/*!40000 ALTER TABLE `classificationstore_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_groups`
--

DROP TABLE IF EXISTS `classificationstore_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classificationstore_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL,
  `parentId` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `storeId` (`storeId`),
  KEY `name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_groups`
--

LOCK TABLES `classificationstore_groups` WRITE;
/*!40000 ALTER TABLE `classificationstore_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_keys`
--

DROP TABLE IF EXISTS `classificationstore_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classificationstore_keys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `storeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `type` varchar(255) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  `definition` longtext,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`(191)),
  KEY `enabled` (`enabled`),
  KEY `type` (`type`(191)),
  KEY `storeId` (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_keys`
--

LOCK TABLES `classificationstore_keys` WRITE;
/*!40000 ALTER TABLE `classificationstore_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_relations`
--

DROP TABLE IF EXISTS `classificationstore_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classificationstore_relations` (
  `groupId` bigint(20) NOT NULL,
  `keyId` bigint(20) NOT NULL,
  `sorter` int(11) DEFAULT NULL,
  `mandatory` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`groupId`,`keyId`),
  KEY `FK_classificationstore_relations_classificationstore_keys` (`keyId`),
  KEY `groupId` (`groupId`),
  KEY `mandatory` (`mandatory`),
  CONSTRAINT `FK_classificationstore_relations_classificationstore_groups` FOREIGN KEY (`groupId`) REFERENCES `classificationstore_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_classificationstore_relations_classificationstore_keys` FOREIGN KEY (`keyId`) REFERENCES `classificationstore_keys` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_relations`
--

LOCK TABLES `classificationstore_relations` WRITE;
/*!40000 ALTER TABLE `classificationstore_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_stores`
--

DROP TABLE IF EXISTS `classificationstore_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classificationstore_stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_stores`
--

LOCK TABLES `classificationstore_stores` WRITE;
/*!40000 ALTER TABLE `classificationstore_stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_layouts`
--

DROP TABLE IF EXISTS `custom_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_layouts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `classId` int(11) unsigned NOT NULL,
  `name` varchar(190) DEFAULT NULL,
  `description` text,
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  `userOwner` int(11) unsigned DEFAULT NULL,
  `userModification` int(11) unsigned DEFAULT NULL,
  `default` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_layouts`
--

LOCK TABLES `custom_layouts` WRITE;
/*!40000 ALTER TABLE `custom_layouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencies`
--

DROP TABLE IF EXISTS `dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependencies` (
  `sourcetype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `sourceid` int(11) unsigned NOT NULL DEFAULT '0',
  `targettype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `targetid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`sourcetype`,`sourceid`,`targetid`,`targettype`),
  KEY `sourceid` (`sourceid`),
  KEY `targetid` (`targetid`),
  KEY `sourcetype` (`sourcetype`),
  KEY `targettype` (`targettype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencies`
--

LOCK TABLES `dependencies` WRITE;
/*!40000 ALTER TABLE `dependencies` DISABLE KEYS */;
INSERT INTO `dependencies` VALUES ('document',1,'asset',6),('document',5,'document',1),('document',5,'document',6),('document',5,'document',7),('document',6,'asset',7),('document',7,'asset',10),('object',4,'asset',4);
/*!40000 ALTER TABLE `dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) unsigned DEFAULT NULL,
  `type` enum('page','link','snippet','folder','hardlink','email','newsletter','printpage','printcontainer') DEFAULT NULL,
  `key` varchar(255) CHARACTER SET ascii DEFAULT '',
  `path` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `index` int(11) unsigned DEFAULT '0',
  `published` tinyint(1) unsigned DEFAULT '1',
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  `userOwner` int(11) unsigned DEFAULT NULL,
  `userModification` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullpath` (`path`,`key`),
  KEY `parentId` (`parentId`),
  KEY `key` (`key`),
  KEY `path` (`path`),
  KEY `published` (`published`),
  KEY `modificationDate` (`modificationDate`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,0,'page','','/',999999,1,1484151280,1484840141,1,2),(3,1,'folder','includes','/',2,1,1484680172,1484680172,2,2),(4,3,'page','footer','/includes/',1,1,1484680181,1484680696,2,2),(5,3,'page','navigation','/includes/',2,1,1484745052,1484840072,2,2),(6,1,'page','about','/',3,1,1484832093,1484840144,2,2),(7,1,'page','contact','/',4,1,1484835706,1484840148,2,2);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_elements`
--

DROP TABLE IF EXISTS `documents_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_elements` (
  `documentId` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(750) CHARACTER SET ascii NOT NULL DEFAULT '',
  `type` varchar(50) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`documentId`,`name`),
  KEY `documentId` (`documentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_elements`
--

LOCK TABLES `documents_elements` WRITE;
/*!40000 ALTER TABLE `documents_elements` DISABLE KEYS */;
INSERT INTO `documents_elements` VALUES (1,'bg_colormyAreablock3','input','#333'),(1,'bg_imagemyAreablock3','image','a:9:{s:2:\"id\";i:6;s:3:\"alt\";s:0:\"\";s:11:\"cropPercent\";N;s:9:\"cropWidth\";N;s:10:\"cropHeight\";N;s:7:\"cropTop\";N;s:8:\"cropLeft\";N;s:8:\"hotspots\";N;s:6:\"marker\";N;}'),(1,'headlinemyAreablock3','input','Something big'),(1,'myAreablock','areablock','a:2:{i:0;a:2:{s:3:\"key\";s:1:\"3\";s:4:\"type\";s:6:\"header\";}i:1;a:2:{s:3:\"key\";s:1:\"4\";s:4:\"type\";s:9:\"blogindex\";}}'),(1,'subheadlinemyAreablock3','input','is coming up! Stay tuned!'),(4,'contentblock','block','a:3:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";}'),(4,'copyright_message','input','The Great Tutorial'),(4,'fa_codecontentblock1','input','fa-facebook'),(4,'fa_codecontentblock2','input','fa-github'),(4,'fa_codecontentblock3','input','fa-twitter'),(4,'urlcontentblock1','input','https://facebook.com'),(4,'urlcontentblock2','input','https://github.com'),(4,'urlcontentblock3','input','https://twitter.com'),(5,'brandLink','link','a:15:{s:4:\"text\";s:13:\"Tutorial Home\";s:4:\"path\";s:1:\"/\";s:6:\"target\";s:0:\"\";s:10:\"parameters\";s:0:\"\";s:6:\"anchor\";s:0:\"\";s:5:\"title\";s:0:\"\";s:9:\"accesskey\";s:0:\"\";s:3:\"rel\";s:0:\"\";s:8:\"tabindex\";s:0:\"\";s:5:\"class\";s:0:\"\";s:10:\"attributes\";s:0:\"\";s:8:\"internal\";b:1;s:10:\"internalId\";i:1;s:12:\"internalType\";s:8:\"document\";s:4:\"type\";s:8:\"internal\";}'),(5,'linkblock','block','a:3:{i:0;s:1:\"3\";i:1;s:1:\"2\";i:2;s:1:\"1\";}'),(5,'myNavLinklinkblock1','link','a:15:{s:4:\"text\";s:10:\"Contact Us\";s:4:\"path\";s:8:\"/contact\";s:6:\"target\";s:0:\"\";s:10:\"parameters\";s:0:\"\";s:6:\"anchor\";s:0:\"\";s:5:\"title\";s:0:\"\";s:9:\"accesskey\";s:0:\"\";s:3:\"rel\";s:0:\"\";s:8:\"tabindex\";s:0:\"\";s:5:\"class\";s:0:\"\";s:10:\"attributes\";s:0:\"\";s:8:\"internal\";b:1;s:10:\"internalId\";i:7;s:12:\"internalType\";s:8:\"document\";s:4:\"type\";s:8:\"internal\";}'),(5,'myNavLinklinkblock2','link','a:15:{s:4:\"text\";s:5:\"About\";s:4:\"path\";s:6:\"/about\";s:6:\"target\";s:0:\"\";s:10:\"parameters\";s:0:\"\";s:6:\"anchor\";s:0:\"\";s:5:\"title\";s:0:\"\";s:9:\"accesskey\";s:0:\"\";s:3:\"rel\";s:0:\"\";s:8:\"tabindex\";s:0:\"\";s:5:\"class\";s:0:\"\";s:10:\"attributes\";s:0:\"\";s:8:\"internal\";b:1;s:10:\"internalId\";i:6;s:12:\"internalType\";s:8:\"document\";s:4:\"type\";s:8:\"internal\";}'),(5,'myNavLinklinkblock3','link','a:14:{s:4:\"text\";s:4:\"Home\";s:4:\"path\";s:1:\"/\";s:6:\"target\";s:0:\"\";s:10:\"parameters\";s:0:\"\";s:6:\"anchor\";s:0:\"\";s:5:\"title\";s:0:\"\";s:9:\"accesskey\";s:0:\"\";s:3:\"rel\";s:0:\"\";s:8:\"tabindex\";s:0:\"\";s:5:\"class\";s:0:\"\";s:10:\"attributes\";s:0:\"\";s:8:\"internal\";b:1;s:10:\"internalId\";i:1;s:12:\"internalType\";s:8:\"document\";}'),(6,'bg_colormyAreablock1','input','#aaa'),(6,'bg_imagemyAreablock1','image','a:9:{s:2:\"id\";i:7;s:3:\"alt\";s:0:\"\";s:11:\"cropPercent\";N;s:9:\"cropWidth\";N;s:10:\"cropHeight\";N;s:7:\"cropTop\";N;s:8:\"cropLeft\";N;s:8:\"hotspots\";N;s:6:\"marker\";N;}'),(6,'contentmyAreablock2','wysiwyg','<p>Here is some additional text about us!</p>\n'),(6,'headlinemyAreablock1','input','About'),(6,'myAreablock','areablock','a:2:{i:0;a:2:{s:3:\"key\";s:1:\"1\";s:4:\"type\";s:6:\"header\";}i:1;a:2:{s:3:\"key\";s:1:\"2\";s:4:\"type\";s:8:\"richtext\";}}'),(6,'subheadlinemyAreablock1','input','us.'),(7,'bg_colormyAreablock1','input','#333'),(7,'bg_imagemyAreablock1','image','a:9:{s:2:\"id\";i:10;s:3:\"alt\";s:0:\"\";s:11:\"cropPercent\";N;s:9:\"cropWidth\";N;s:10:\"cropHeight\";N;s:7:\"cropTop\";N;s:8:\"cropLeft\";N;s:8:\"hotspots\";N;s:6:\"marker\";N;}'),(7,'headlinemyAreablock1','input','Contact Us'),(7,'myAreablock','areablock','a:2:{i:0;a:2:{s:3:\"key\";s:1:\"1\";s:4:\"type\";s:6:\"header\";}i:1;a:2:{s:3:\"key\";s:1:\"2\";s:4:\"type\";s:11:\"contactform\";}}'),(7,'subheadlinemyAreablock1','input','via Email');
/*!40000 ALTER TABLE `documents_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_email`
--

DROP TABLE IF EXISTS `documents_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_email` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_email`
--

LOCK TABLES `documents_email` WRITE;
/*!40000 ALTER TABLE `documents_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_hardlink`
--

DROP TABLE IF EXISTS `documents_hardlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_hardlink` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `sourceId` int(11) DEFAULT NULL,
  `propertiesFromSource` tinyint(1) DEFAULT NULL,
  `childsFromSource` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_hardlink`
--

LOCK TABLES `documents_hardlink` WRITE;
/*!40000 ALTER TABLE `documents_hardlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_hardlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_link`
--

DROP TABLE IF EXISTS `documents_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_link` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `internalType` enum('document','asset') DEFAULT NULL,
  `internal` int(11) unsigned DEFAULT NULL,
  `direct` varchar(1000) DEFAULT NULL,
  `linktype` enum('direct','internal') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_link`
--

LOCK TABLES `documents_link` WRITE;
/*!40000 ALTER TABLE `documents_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_newsletter`
--

DROP TABLE IF EXISTS `documents_newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_newsletter` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `trackingParameterSource` varchar(255) DEFAULT NULL,
  `trackingParameterMedium` varchar(255) DEFAULT NULL,
  `trackingParameterName` varchar(255) DEFAULT NULL,
  `enableTrackingParameters` tinyint(1) unsigned DEFAULT NULL,
  `sendingMode` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_newsletter`
--

LOCK TABLES `documents_newsletter` WRITE;
/*!40000 ALTER TABLE `documents_newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_page`
--

DROP TABLE IF EXISTS `documents_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_page` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `metaData` text,
  `prettyUrl` varchar(190) DEFAULT NULL,
  `contentMasterDocumentId` int(11) DEFAULT NULL,
  `personas` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prettyUrl` (`prettyUrl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_page`
--

LOCK TABLES `documents_page` WRITE;
/*!40000 ALTER TABLE `documents_page` DISABLE KEYS */;
INSERT INTO `documents_page` VALUES (1,NULL,'default','default',NULL,'Home','This is the awesome pimcore tutorial home page','a:0:{}',NULL,NULL,''),(4,NULL,'default','footer',NULL,'','','a:0:{}',NULL,NULL,''),(5,NULL,'default','header',NULL,'','','a:0:{}',NULL,NULL,''),(6,NULL,'default','default',NULL,'About','','a:0:{}',NULL,NULL,''),(7,NULL,'default','default',NULL,'Contact Us','','a:0:{}',NULL,NULL,'');
/*!40000 ALTER TABLE `documents_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_printpage`
--

DROP TABLE IF EXISTS `documents_printpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_printpage` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `lastGenerated` int(11) DEFAULT NULL,
  `lastGenerateMessage` text,
  `contentMasterDocumentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_printpage`
--

LOCK TABLES `documents_printpage` WRITE;
/*!40000 ALTER TABLE `documents_printpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_printpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_snippet`
--

DROP TABLE IF EXISTS `documents_snippet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_snippet` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `contentMasterDocumentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_snippet`
--

LOCK TABLES `documents_snippet` WRITE;
/*!40000 ALTER TABLE `documents_snippet` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_snippet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_translations`
--

DROP TABLE IF EXISTS `documents_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_translations` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `sourceId` int(11) unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`sourceId`,`language`),
  KEY `id` (`id`),
  KEY `sourceId` (`sourceId`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_translations`
--

LOCK TABLES `documents_translations` WRITE;
/*!40000 ALTER TABLE `documents_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_lock`
--

DROP TABLE IF EXISTS `edit_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edit_lock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `userId` int(11) unsigned NOT NULL DEFAULT '0',
  `sessionId` varchar(255) DEFAULT NULL,
  `date` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `cidtype` (`cid`,`ctype`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_lock`
--

LOCK TABLES `edit_lock` WRITE;
/*!40000 ALTER TABLE `edit_lock` DISABLE KEYS */;
INSERT INTO `edit_lock` VALUES (36,2,'object',2,'22lj4dor436rjjo73m7t10lt31',1484397728),(44,5,'object',2,'ssnfj3tal13k68mvstngtq6sm3',1484665039),(45,6,'object',2,'ssnfj3tal13k68mvstngtq6sm3',1484665049),(46,7,'object',2,'ssnfj3tal13k68mvstngtq6sm3',1484665056),(53,4,'document',2,'0o3jdv45k7795hkuu426kufmn3',1484744968),(83,9,'object',2,'p0br0to3ss7ebo1d98b7t0jcu0',1484840567),(84,8,'object',2,'p0br0to3ss7ebo1d98b7t0jcu0',1484840572);
/*!40000 ALTER TABLE `edit_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element_workflow_state`
--

DROP TABLE IF EXISTS `element_workflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element_workflow_state` (
  `cid` int(10) NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL,
  `workflowId` int(11) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`,`ctype`,`workflowId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_workflow_state`
--

LOCK TABLES `element_workflow_state` WRITE;
/*!40000 ALTER TABLE `element_workflow_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `element_workflow_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_blacklist`
--

DROP TABLE IF EXISTS `email_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_blacklist` (
  `address` varchar(190) NOT NULL DEFAULT '',
  `creationDate` int(11) unsigned DEFAULT NULL,
  `modificationDate` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_blacklist`
--

LOCK TABLES `email_blacklist` WRITE;
/*!40000 ALTER TABLE `email_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentId` int(11) DEFAULT NULL,
  `requestUri` varchar(500) DEFAULT NULL,
  `params` text,
  `from` varchar(500) DEFAULT NULL,
  `to` longtext,
  `cc` longtext,
  `bcc` longtext,
  `sentDate` bigint(20) DEFAULT NULL,
  `subject` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
INSERT INTO `email_log` VALUES (1,NULL,'/contact','[]',NULL,'thomas@vomtom.at ()',NULL,NULL,1484836685,'Debug email: '),(2,NULL,'/contact','[]',NULL,'thomas@vomtom.at ()',NULL,NULL,1484840558,'Debug email: ');
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glossary`
--

DROP TABLE IF EXISTS `glossary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glossary` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(10) DEFAULT NULL,
  `casesensitive` tinyint(1) DEFAULT NULL,
  `exactmatch` tinyint(1) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `abbr` varchar(255) DEFAULT NULL,
  `acronym` varchar(255) DEFAULT NULL,
  `site` int(11) unsigned DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `language` (`language`),
  KEY `site` (`site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glossary`
--

LOCK TABLES `glossary` WRITE;
/*!40000 ALTER TABLE `glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `http_error_log`
--

DROP TABLE IF EXISTS `http_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `http_error_log` (
  `uri` varchar(3000) CHARACTER SET ascii DEFAULT NULL,
  `code` int(3) DEFAULT NULL,
  `parametersGet` longtext,
  `parametersPost` longtext,
  `cookies` longtext,
  `serverVars` longtext,
  `date` bigint(20) DEFAULT NULL,
  `count` bigint(20) DEFAULT NULL,
  KEY `uri` (`uri`(765)),
  KEY `code` (`code`),
  KEY `date` (`date`),
  KEY `count` (`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `http_error_log`
--

LOCK TABLES `http_error_log` WRITE;
/*!40000 ALTER TABLE `http_error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `http_error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyvalue_groups`
--

DROP TABLE IF EXISTS `keyvalue_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyvalue_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyvalue_groups`
--

LOCK TABLES `keyvalue_groups` WRITE;
/*!40000 ALTER TABLE `keyvalue_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyvalue_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyvalue_keys`
--

DROP TABLE IF EXISTS `keyvalue_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyvalue_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `type` enum('bool','number','select','text','translated','translatedSelect','range') DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `possiblevalues` text,
  `group` int(11) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  `translator` int(11) DEFAULT NULL,
  `mandatory` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group` (`group`),
  CONSTRAINT `keyvalue_keys_ibfk_1` FOREIGN KEY (`group`) REFERENCES `keyvalue_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyvalue_keys`
--

LOCK TABLES `keyvalue_keys` WRITE;
/*!40000 ALTER TABLE `keyvalue_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyvalue_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyvalue_translator_configuration`
--

DROP TABLE IF EXISTS `keyvalue_translator_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keyvalue_translator_configuration` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `translator` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyvalue_translator_configuration`
--

LOCK TABLES `keyvalue_translator_configuration` WRITE;
/*!40000 ALTER TABLE `keyvalue_translator_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyvalue_translator_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locks`
--

DROP TABLE IF EXISTS `locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locks` (
  `id` varchar(150) NOT NULL DEFAULT '',
  `date` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locks`
--

LOCK TABLES `locks` WRITE;
/*!40000 ALTER TABLE `locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `ctype` enum('asset','document','object') DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes_data`
--

DROP TABLE IF EXISTS `notes_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes_data` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `type` enum('text','date','document','asset','object','bool') DEFAULT NULL,
  `data` text,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes_data`
--

LOCK TABLES `notes_data` WRITE;
/*!40000 ALTER TABLE `notes_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `object_2`
--

DROP TABLE IF EXISTS `object_2`;
/*!50001 DROP VIEW IF EXISTS `object_2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `object_2` (
  `oo_id` tinyint NOT NULL,
  `oo_classId` tinyint NOT NULL,
  `oo_className` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `subtitle` tinyint NOT NULL,
  `content` tinyint NOT NULL,
  `author` tinyint NOT NULL,
  `blogpostcreated` tinyint NOT NULL,
  `headerbackgroundimage` tinyint NOT NULL,
  `o_id` tinyint NOT NULL,
  `o_parentId` tinyint NOT NULL,
  `o_type` tinyint NOT NULL,
  `o_key` tinyint NOT NULL,
  `o_path` tinyint NOT NULL,
  `o_index` tinyint NOT NULL,
  `o_published` tinyint NOT NULL,
  `o_creationDate` tinyint NOT NULL,
  `o_modificationDate` tinyint NOT NULL,
  `o_userOwner` tinyint NOT NULL,
  `o_userModification` tinyint NOT NULL,
  `o_classId` tinyint NOT NULL,
  `o_className` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `object_3`
--

DROP TABLE IF EXISTS `object_3`;
/*!50001 DROP VIEW IF EXISTS `object_3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `object_3` (
  `oo_id` tinyint NOT NULL,
  `oo_classId` tinyint NOT NULL,
  `oo_className` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `message` tinyint NOT NULL,
  `o_id` tinyint NOT NULL,
  `o_parentId` tinyint NOT NULL,
  `o_type` tinyint NOT NULL,
  `o_key` tinyint NOT NULL,
  `o_path` tinyint NOT NULL,
  `o_index` tinyint NOT NULL,
  `o_published` tinyint NOT NULL,
  `o_creationDate` tinyint NOT NULL,
  `o_modificationDate` tinyint NOT NULL,
  `o_userOwner` tinyint NOT NULL,
  `o_userModification` tinyint NOT NULL,
  `o_classId` tinyint NOT NULL,
  `o_className` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `object_query_2`
--

DROP TABLE IF EXISTS `object_query_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_query_2` (
  `oo_id` int(11) NOT NULL DEFAULT '0',
  `oo_classId` int(11) DEFAULT '2',
  `oo_className` varchar(255) DEFAULT 'blogpost',
  `title` varchar(190) DEFAULT NULL,
  `subtitle` varchar(190) DEFAULT NULL,
  `content` longtext,
  `author` varchar(190) DEFAULT NULL,
  `blogpostcreated` bigint(20) DEFAULT NULL,
  `headerbackgroundimage` int(11) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_2`
--

LOCK TABLES `object_query_2` WRITE;
/*!40000 ALTER TABLE `object_query_2` DISABLE KEYS */;
INSERT INTO `object_query_2` VALUES (4,2,'blogpost','This is a great headline','Problems look mighty small from 150 miles up','Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe, a round earth in which all the directions eventually meet, in which there is no center because every point, or none, is center — an equal earth which all men occupy as equals. The airman\'s earth, if free men make it, will be truly round: a globe in practice, not in theory. Science cuts two ways, of course; its products can be used for both good and evil. But there\'s no turning back from science. The early warnings about technological dangers also come from science. What was most significant about the lunar voyage was not that man set foot on the Moon but that they set eye on the earth. A Chinese tale tells of some men sent to harm a young girl who, upon seeing her beauty, become her protectors rather than her violators. That\'s how I felt seeing the Earth for the first time. I could not help but love and cherish her. For those who have seen the Earth from space, and for the hundreds and perhaps thousands more who will, the experience most certainly changes your perspective. The things that we share in our world are far more valuable than those which divide us. The Final Frontier There can be no thought of finishing for ‘aiming for the stars.’ Both figuratively and literally, it is a task to occupy the generations. And no matter how much progress one makes, there is always the thrill of just beginning. There can be no thought of finishing for ‘aiming for the stars.’ Both figuratively and literally, it is a task to occupy the generations. And no matter how much progress one makes, there is always the thrill of just beginning. The dreams of yesterday are the hopes of today and the reality of tomorrow. Science has not yet mastered prophecy. We predict too much for the next year and yet far too little for the next ten. Spaceflights cannot be stopped. This is not the work of any one man or even a group of men. It is a historical process which mankind is carrying out in accordance with the natural laws of human development. ','Thomas',1484607600,4),(5,2,'blogpost','Second post',NULL,'without a subheadline ','Thomas',1484866800,NULL),(6,2,'blogpost','The third post in a row, awesome','with subheadline here','yoyoyo ','Thomas',1483916400,NULL),(7,2,'blogpost','oh well, a fourth post, that is so great!',NULL,'','Thomas',1484089200,NULL);
/*!40000 ALTER TABLE `object_query_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_query_3`
--

DROP TABLE IF EXISTS `object_query_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_query_3` (
  `oo_id` int(11) NOT NULL DEFAULT '0',
  `oo_classId` int(11) DEFAULT '3',
  `oo_className` varchar(255) DEFAULT 'contacts',
  `name` varchar(190) DEFAULT NULL,
  `email` varchar(190) DEFAULT NULL,
  `phone` varchar(190) DEFAULT NULL,
  `message` longtext,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_3`
--

LOCK TABLES `object_query_3` WRITE;
/*!40000 ALTER TABLE `object_query_3` DISABLE KEYS */;
INSERT INTO `object_query_3` VALUES (9,3,'contacts','Thomas','abc@abc.com','123456','Hello World!');
/*!40000 ALTER TABLE `object_query_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_relations_2`
--

DROP TABLE IF EXISTS `object_relations_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_relations_2` (
  `src_id` int(11) NOT NULL DEFAULT '0',
  `dest_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int(11) unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`src_id`,`dest_id`,`ownertype`,`ownername`,`fieldname`,`type`,`position`),
  KEY `index` (`index`),
  KEY `src_id` (`src_id`),
  KEY `dest_id` (`dest_id`),
  KEY `fieldname` (`fieldname`),
  KEY `position` (`position`),
  KEY `ownertype` (`ownertype`),
  KEY `type` (`type`),
  KEY `ownername` (`ownername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_relations_2`
--

LOCK TABLES `object_relations_2` WRITE;
/*!40000 ALTER TABLE `object_relations_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_relations_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_relations_3`
--

DROP TABLE IF EXISTS `object_relations_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_relations_3` (
  `src_id` int(11) NOT NULL DEFAULT '0',
  `dest_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int(11) unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`src_id`,`dest_id`,`ownertype`,`ownername`,`fieldname`,`type`,`position`),
  KEY `index` (`index`),
  KEY `src_id` (`src_id`),
  KEY `dest_id` (`dest_id`),
  KEY `fieldname` (`fieldname`),
  KEY `position` (`position`),
  KEY `ownertype` (`ownertype`),
  KEY `type` (`type`),
  KEY `ownername` (`ownername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_relations_3`
--

LOCK TABLES `object_relations_3` WRITE;
/*!40000 ALTER TABLE `object_relations_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_relations_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_store_2`
--

DROP TABLE IF EXISTS `object_store_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_store_2` (
  `oo_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(190) DEFAULT NULL,
  `subtitle` varchar(190) DEFAULT NULL,
  `content` longtext,
  `author` varchar(190) DEFAULT NULL,
  `blogpostcreated` bigint(20) DEFAULT NULL,
  `headerbackgroundimage` int(11) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_2`
--

LOCK TABLES `object_store_2` WRITE;
/*!40000 ALTER TABLE `object_store_2` DISABLE KEYS */;
INSERT INTO `object_store_2` VALUES (4,'This is a great headline','Problems look mighty small from 150 miles up','<p>Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe, a round earth in which all the directions eventually meet, in which there is no center because every point, or none, is center — an equal earth which all men occupy as equals. The airman\'s earth, if free men make it, will be truly round: a globe in practice, not in theory.</p>\n\n<p>Science cuts two ways, of course; its products can be used for both good and evil. But there\'s no turning back from science. The early warnings about technological dangers also come from science.</p>\n\n<p>What was most significant about the lunar voyage was not that man set foot on the Moon but that they set eye on the earth.</p>\n\n<p>A Chinese tale tells of some men sent to harm a young girl who, upon seeing her beauty, become her protectors rather than her violators. That\'s how I felt seeing the Earth for the first time. I could not help but love and cherish her.</p>\n\n<p>For those who have seen the Earth from space, and for the hundreds and perhaps thousands more who will, the experience most certainly changes your perspective. The things that we share in our world are far more valuable than those which divide us.</p>\n\n<h2>The Final Frontier</h2>\n\n<p>There can be no thought of finishing for ‘aiming for the stars.’ Both figuratively and literally, it is a task to occupy the generations. And no matter how much progress one makes, there is always the thrill of just beginning.</p>\n\n<p>There can be no thought of finishing for ‘aiming for the stars.’ Both figuratively and literally, it is a task to occupy the generations. And no matter how much progress one makes, there is always the thrill of just beginning.</p>\n\n<blockquote>The dreams of yesterday are the hopes of today and the reality of tomorrow. Science has not yet mastered prophecy. We predict too much for the next year and yet far too little for the next ten.</blockquote>\n\n<p>Spaceflights cannot be stopped. This is not the work of any one man or even a group of men. It is a historical process which mankind is carrying out in accordance with the natural laws of human development.</p>\n','Thomas',1484607600,4),(5,'Second post',NULL,'<p>without a subheadline</p>\n','Thomas',1484866800,NULL),(6,'The third post in a row, awesome','with subheadline here','<p>yoyoyo</p>\n','Thomas',1483916400,NULL),(7,'oh well, a fourth post, that is so great!',NULL,NULL,'Thomas',1484089200,NULL);
/*!40000 ALTER TABLE `object_store_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_store_3`
--

DROP TABLE IF EXISTS `object_store_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_store_3` (
  `oo_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(190) DEFAULT NULL,
  `email` varchar(190) DEFAULT NULL,
  `phone` varchar(190) DEFAULT NULL,
  `message` longtext,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_3`
--

LOCK TABLES `object_store_3` WRITE;
/*!40000 ALTER TABLE `object_store_3` DISABLE KEYS */;
INSERT INTO `object_store_3` VALUES (9,'Thomas','abc@abc.com','123456','Hello World!');
/*!40000 ALTER TABLE `object_store_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objects`
--

DROP TABLE IF EXISTS `objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objects` (
  `o_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `o_parentId` int(11) unsigned DEFAULT NULL,
  `o_type` enum('object','folder','variant') DEFAULT NULL,
  `o_key` varchar(255) CHARACTER SET ascii DEFAULT '',
  `o_path` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `o_index` int(11) unsigned DEFAULT '0',
  `o_published` tinyint(1) unsigned DEFAULT '1',
  `o_creationDate` bigint(20) unsigned DEFAULT NULL,
  `o_modificationDate` bigint(20) unsigned DEFAULT NULL,
  `o_userOwner` int(11) unsigned DEFAULT NULL,
  `o_userModification` int(11) unsigned DEFAULT NULL,
  `o_classId` int(11) unsigned DEFAULT NULL,
  `o_className` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`o_id`),
  UNIQUE KEY `fullpath` (`o_path`,`o_key`),
  KEY `key` (`o_key`),
  KEY `path` (`o_path`),
  KEY `published` (`o_published`),
  KEY `parentId` (`o_parentId`),
  KEY `type` (`o_type`),
  KEY `o_modificationDate` (`o_modificationDate`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objects`
--

LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;
INSERT INTO `objects` VALUES (1,0,'folder','','/',999999,1,1484151280,1484151280,1,1,NULL,NULL),(3,1,'folder','blogposts','/',NULL,1,1484661572,1484661572,2,2,NULL,NULL),(4,3,'object','01_myfirst','/blogposts/',0,1,1484661585,1484673945,2,2,2,'blogpost'),(5,3,'object','02-mysecond','/blogposts/',0,1,1484664923,1484665045,2,2,2,'blogpost'),(6,3,'object','03-third','/blogposts/',0,1,1484664941,1484665054,2,2,2,'blogpost'),(7,3,'object','04-fourth','/blogposts/',0,1,1484664968,1484665060,2,2,2,'blogpost'),(8,1,'folder','crm','/',NULL,1,1484840368,1484840368,2,2,NULL,NULL),(9,8,'object','20170119_thomas','/crm/',0,0,1484840558,1484840616,0,2,3,'contacts');
/*!40000 ALTER TABLE `objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `cpath` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `name` varchar(190) NOT NULL DEFAULT '',
  `type` enum('text','document','asset','object','bool','select') DEFAULT NULL,
  `data` text,
  `inheritable` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`cid`,`ctype`,`name`),
  KEY `cpath` (`cpath`),
  KEY `inheritable` (`inheritable`),
  KEY `ctype` (`ctype`),
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (4,'document','/includes/footer','navigation_name','text','footer',1),(5,'document','/includes/navigation','navigation_name','text','header',1),(6,'document','/about','navigation_name','text','about',1),(7,'document','/contact','navigation_name','text','contact',1);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quantityvalue_units`
--

DROP TABLE IF EXISTS `quantityvalue_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quantityvalue_units` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group` varchar(50) DEFAULT NULL,
  `abbreviation` varchar(10) NOT NULL,
  `longname` varchar(250) DEFAULT NULL,
  `baseunit` varchar(10) DEFAULT NULL,
  `factor` double DEFAULT NULL,
  `conversionOffset` double DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quantityvalue_units`
--

LOCK TABLES `quantityvalue_units` WRITE;
/*!40000 ALTER TABLE `quantityvalue_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `quantityvalue_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recyclebin`
--

DROP TABLE IF EXISTS `recyclebin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recyclebin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(20) DEFAULT NULL,
  `path` varchar(765) DEFAULT NULL,
  `amount` int(3) DEFAULT NULL,
  `date` bigint(20) DEFAULT NULL,
  `deletedby` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recyclebin`
--

LOCK TABLES `recyclebin` WRITE;
/*!40000 ALTER TABLE `recyclebin` DISABLE KEYS */;
INSERT INTO `recyclebin` VALUES (1,'asset','image','/_rbcxo9au-u-robert-lukeman.jpg',1,1484394410,'admin'),(2,'asset','image','/_rbcxo9au-u-robert-lukeman.jpg',1,1484395795,'admin'),(3,'object','object','/sample1',1,1484751189,'admin'),(4,'document','page','/abc',1,1484835768,'admin');
/*!40000 ALTER TABLE `recyclebin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirects`
--

DROP TABLE IF EXISTS `redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(255) DEFAULT NULL,
  `sourceEntireUrl` tinyint(1) DEFAULT NULL,
  `sourceSite` int(11) DEFAULT NULL,
  `passThroughParameters` tinyint(1) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `targetSite` int(11) DEFAULT NULL,
  `statusCode` varchar(3) DEFAULT NULL,
  `priority` int(2) DEFAULT '0',
  `active` tinyint(1) DEFAULT NULL,
  `expiry` bigint(20) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `priority` (`priority`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirects`
--

LOCK TABLES `redirects` WRITE;
/*!40000 ALTER TABLE `redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanitycheck`
--

DROP TABLE IF EXISTS `sanitycheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sanitycheck` (
  `id` int(11) unsigned NOT NULL,
  `type` enum('document','asset','object') NOT NULL,
  PRIMARY KEY (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanitycheck`
--

LOCK TABLES `sanitycheck` WRITE;
/*!40000 ALTER TABLE `sanitycheck` DISABLE KEYS */;
INSERT INTO `sanitycheck` VALUES (1,'document'),(5,'document');
/*!40000 ALTER TABLE `sanitycheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_tasks`
--

DROP TABLE IF EXISTS `schedule_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_tasks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned DEFAULT NULL,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `date` bigint(20) unsigned DEFAULT NULL,
  `action` enum('publish','unpublish','delete','publish-version') DEFAULT NULL,
  `version` bigint(20) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_tasks`
--

LOCK TABLES `schedule_tasks` WRITE;
/*!40000 ALTER TABLE `schedule_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_backend_data`
--

DROP TABLE IF EXISTS `search_backend_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_backend_data` (
  `id` int(11) NOT NULL,
  `fullpath` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `maintype` varchar(8) NOT NULL DEFAULT '',
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(255) DEFAULT NULL,
  `published` bigint(20) DEFAULT NULL,
  `creationDate` bigint(20) DEFAULT NULL,
  `modificationDate` bigint(20) DEFAULT NULL,
  `userOwner` int(11) DEFAULT NULL,
  `userModification` int(11) DEFAULT NULL,
  `data` longtext,
  `properties` text,
  PRIMARY KEY (`id`,`maintype`),
  KEY `id` (`id`),
  KEY `fullpath` (`fullpath`),
  KEY `maintype` (`maintype`),
  KEY `type` (`type`),
  KEY `subtype` (`subtype`(250)),
  KEY `published` (`published`),
  FULLTEXT KEY `fulltext` (`data`,`properties`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_backend_data`
--

LOCK TABLES `search_backend_data` WRITE;
/*!40000 ALTER TABLE `search_backend_data` DISABLE KEYS */;
INSERT INTO `search_backend_data` VALUES (1,'/','document','page','page',1,1484151280,1484840141,1,2,'ID: 1  \nPath: /  \n #333 Something big is coming up! Stay tuned! Home This the awesome pimcore tutorial home page',''),(4,'/_rbcxo9au-u-robert-lukeman.jpg','asset','image','image',1,1484395890,1484396249,2,2,'ID: 4  \nPath: /_rbcxo9au-u-robert-lukeman.jpg  \n_rbcxo9au-u-robert-lukeman jpg',''),(6,'/about','document','page','page',1,1484832093,1484840144,2,2,'ID: 6  \nPath: /about  \n #aaa About us Here is some additional text about us!','navigation_name:about '),(5,'/bg_pictures','asset','folder','folder',1,1484840094,1484840094,2,2,'ID: 5  \nPath: /bg_pictures  \nbg_pictures',''),(3,'/blogposts','object','folder','folder',1,1484661572,1484661572,2,2,'ID: 3  \nPath: /blogposts  \nblogposts',''),(4,'/blogposts/01_myfirst','object','object','blogpost',1,1484661585,1484673945,2,2,'ID: 4  \nPath: /blogposts/01_myfirst  \nThis is a great headline Problems look mighty small from 150 miles up Never in all their history have men been able truly to conceive of the world as one single sphere globe having qualities round earth which directions eventually meet there no center because every point or none — an equal occupy equals The airman s if free make it will be practice not theory Science cuts two ways course its products can used for both good and evil But turning back science early warnings about technological dangers also come What was most significant lunar voyage that man set foot on Moon but they eye A Chinese tale tells some sent harm young girl who upon seeing her beauty become protectors rather than violators That how I felt Earth first time could help love cherish For those seen space hundreds perhaps thousands more experience certainly changes your perspective things we share our are far valuable divide us Final Frontier There thought finishing ‘aiming stars ’ Both figuratively literally task generations And matter much progress makes always thrill just beginning dreams yesterday hopes today reality tomorrow has yet mastered prophecy We predict too next year little ten Spaceflights cannot stopped work any even group It historical process mankind carrying out accordance with natural laws human development Thomas ',''),(5,'/blogposts/02-mysecond','object','object','blogpost',1,1484664923,1484665045,2,2,'ID: 5  \nPath: /blogposts/02-mysecond  \nSecond post without a subheadline Thomas ',''),(6,'/blogposts/03-third','object','object','blogpost',1,1484664941,1484665054,2,2,'ID: 6  \nPath: /blogposts/03-third  \nThe third post in a row awesome with subheadline here yoyoyo Thomas ',''),(7,'/blogposts/04-fourth','object','object','blogpost',1,1484664968,1484665060,2,2,'ID: 7  \nPath: /blogposts/04-fourth  \noh well a fourth post that is so great! Thomas ',''),(3,'/includes','document','folder','folder',1,1484680172,1484680172,2,2,'ID: 3  \nPath: /includes  \nincludes',''),(4,'/includes/footer','document','page','page',1,1484680181,1484680696,2,2,'ID: 4  \nPath: /includes/footer  \n fa-facebook https //facebook com fa-github //github fa-twitter //twitter The Great Tutorial','navigation_name:footer '),(5,'/includes/navigation','document','page','page',1,1484745052,1484840072,2,2,'ID: 5  \nPath: /includes/navigation  \nTutorial Home About Contact Us ','navigation_name:header '),(7,'/contact','document','page','page',1,1484835706,1484840148,2,2,'ID: 7  \nPath: /contact  \n #333 Contact Us via Email','navigation_name:contact '),(7,'/bg_pictures/about-bg.jpg','asset','image','image',1,1484840118,1484840118,2,2,'ID: 7  \nPath: /bg_pictures/about-bg.jpg  \nabout-bg jpg FileName FileDateTime 1484840121 FileSize 33097 FileType 2 MimeType image/jpeg SectionsFound APP12 Company Ducky Info ',''),(9,'/bg_pictures/post-sample-image.jpg','asset','image','image',1,1484840118,1484840118,2,2,'ID: 9  \nPath: /bg_pictures/post-sample-image.jpg  \npost-sample-image jpg FileName FileDateTime 1484840121 FileSize 115144 FileType 2 MimeType image/jpeg SectionsFound APP12 Company Ducky Info ',''),(8,'/bg_pictures/post-bg.jpg','asset','image','image',1,1484840118,1484840118,2,2,'ID: 8  \nPath: /bg_pictures/post-bg.jpg  \npost-bg jpg FileName FileDateTime 1484840121 FileSize 140909 FileType 2 MimeType image/jpeg SectionsFound APP12 Company Ducky Info ',''),(6,'/bg_pictures/home-bg.jpg','asset','image','image',1,1484840118,1484840118,2,2,'ID: 6  \nPath: /bg_pictures/home-bg.jpg  \nhome-bg jpg FileName FileDateTime 1484840121 FileSize 172779 FileType 2 MimeType image/jpeg SectionsFound APP12 Company Ducky Info ',''),(10,'/bg_pictures/contact-bg.jpg','asset','image','image',1,1484840118,1484840118,2,2,'ID: 10  \nPath: /bg_pictures/contact-bg.jpg  \ncontact-bg jpg FileName FileDateTime 1484840121 FileSize 290070 FileType 2 MimeType image/jpeg SectionsFound APP12 Company Ducky Info ',''),(8,'/crm','object','folder','folder',1,1484840368,1484840368,2,2,'ID: 8  \nPath: /crm  \ncrm',''),(9,'/crm/20170119_thomas','object','object','contacts',0,1484840558,1484840616,0,2,'ID: 9  \nPath: /crm/20170119_thomas  \nThomas abc@abc com 123456 Hello World! ','');
/*!40000 ALTER TABLE `search_backend_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mainDomain` varchar(255) DEFAULT NULL,
  `domains` text,
  `rootId` int(11) unsigned DEFAULT NULL,
  `errorDocument` varchar(255) DEFAULT NULL,
  `redirectToMainDomain` tinyint(1) DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rootId` (`rootId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(10) unsigned DEFAULT NULL,
  `idPath` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idpath` (`idPath`(191)),
  KEY `parentid` (`parentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_assignment`
--

DROP TABLE IF EXISTS `tags_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_assignment` (
  `tagid` int(10) unsigned NOT NULL DEFAULT '0',
  `cid` int(10) NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL,
  PRIMARY KEY (`tagid`,`cid`,`ctype`),
  KEY `ctype` (`ctype`),
  KEY `ctype_cid` (`cid`,`ctype`),
  KEY `tagid` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_assignment`
--

LOCK TABLES `tags_assignment` WRITE;
/*!40000 ALTER TABLE `tags_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targeting_personas`
--

DROP TABLE IF EXISTS `targeting_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `targeting_personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `conditions` longtext,
  `threshold` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targeting_personas`
--

LOCK TABLES `targeting_personas` WRITE;
/*!40000 ALTER TABLE `targeting_personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `targeting_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targeting_rules`
--

DROP TABLE IF EXISTS `targeting_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `targeting_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `scope` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `conditions` longtext,
  `actions` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targeting_rules`
--

LOCK TABLES `targeting_rules` WRITE;
/*!40000 ALTER TABLE `targeting_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `targeting_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_store`
--

DROP TABLE IF EXISTS `tmp_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmp_store` (
  `id` varchar(190) NOT NULL DEFAULT '',
  `tag` varchar(190) DEFAULT NULL,
  `data` longtext,
  `serialized` tinyint(2) NOT NULL DEFAULT '0',
  `date` int(10) DEFAULT NULL,
  `expiryDate` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag` (`tag`),
  KEY `date` (`date`),
  KEY `expiryDate` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_store`
--

LOCK TABLES `tmp_store` WRITE;
/*!40000 ALTER TABLE `tmp_store` DISABLE KEYS */;
INSERT INTO `tmp_store` VALUES ('image-thumbnails/0/10/thumb__headerbackground/contact-bg.jpeg','image-optimize-queue','-',0,1484840160,1484926560),('image-thumbnails/0/4/thumb__headerbackground/_rbcxo9au-u-robert-lukeman.jpeg','image-optimize-queue','-',0,1484674110,1484760510),('image-thumbnails/0/4/thumb__square500/_rbcxo9au-u-robert-lukeman.jpeg','image-optimize-queue','-',0,1484399966,1484486366),('image-thumbnails/0/6/thumb__headerbackground/home-bg.jpeg','image-optimize-queue','-',0,1484840151,1484926551),('image-thumbnails/0/7/thumb__headerbackground/about-bg.jpeg','image-optimize-queue','-',0,1484840156,1484926556);
/*!40000 ALTER TABLE `tmp_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking_events`
--

DROP TABLE IF EXISTS `tracking_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracking_events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `timestamp` bigint(20) unsigned DEFAULT NULL,
  `year` int(5) unsigned DEFAULT NULL,
  `month` int(2) unsigned DEFAULT NULL,
  `day` int(2) unsigned DEFAULT NULL,
  `dayOfWeek` int(1) unsigned DEFAULT NULL,
  `dayOfYear` int(3) unsigned DEFAULT NULL,
  `weekOfYear` int(2) unsigned DEFAULT NULL,
  `hour` int(2) unsigned DEFAULT NULL,
  `minute` int(2) unsigned DEFAULT NULL,
  `second` int(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `year` (`year`),
  KEY `month` (`month`),
  KEY `day` (`day`),
  KEY `dayOfWeek` (`dayOfWeek`),
  KEY `dayOfYear` (`dayOfYear`),
  KEY `weekOfYear` (`weekOfYear`),
  KEY `hour` (`hour`),
  KEY `minute` (`minute`),
  KEY `second` (`second`),
  KEY `category` (`category`(191)),
  KEY `action` (`action`(191)),
  KEY `label` (`label`(191)),
  KEY `data` (`data`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking_events`
--

LOCK TABLES `tracking_events` WRITE;
/*!40000 ALTER TABLE `tracking_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracking_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations_admin`
--

DROP TABLE IF EXISTS `translations_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations_admin` (
  `key` varchar(190) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text,
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations_admin`
--

LOCK TABLES `translations_admin` WRITE;
/*!40000 ALTER TABLE `translations_admin` DISABLE KEYS */;
INSERT INTO `translations_admin` VALUES ('a paginated list of blog posts','en','',1484832515,1484832515),('a simple contact form','en','',1484835287,1484835287),('a simple header with a headline and a subheadline','en','',1484753688,1484753688),('a simple richtext editor','en','',1484832064,1484832064),('author','ca','',1484661598,1484661598),('author','cs','',1484661598,1484661598),('author','de','',1484661598,1484661598),('author','en','',1484661598,1484661598),('author','es','',1484661598,1484661598),('author','fa','',1484661598,1484661598),('author','fr','',1484661598,1484661598),('author','it','',1484661598,1484661598),('author','ja','',1484661598,1484661598),('author','nl','',1484661598,1484661598),('author','pl','',1484661598,1484661598),('author','pt','',1484661598,1484661598),('author','pt_BR','',1484661598,1484661598),('author','ru','',1484661598,1484661598),('author','sk','',1484661598,1484661598),('author','sv','',1484661598,1484661598),('author','tr','',1484661598,1484661598),('author','uk','',1484661598,1484661598),('author','zh_Hans','',1484661598,1484661598),('blogindex','en','',1484832515,1484832515),('blogpost','ca','',1484661471,1484661471),('blogpost','cs','',1484661471,1484661471),('blogpost','de','',1484661471,1484661471),('blogpost','en','',1484661471,1484661471),('blogpost','es','',1484661471,1484661471),('blogpost','fa','',1484661471,1484661471),('blogpost','fr','',1484661471,1484661471),('blogpost','it','',1484661471,1484661471),('blogpost','ja','',1484661471,1484661471),('blogpost','nl','',1484661471,1484661471),('blogpost','pl','',1484661471,1484661471),('blogpost','pt','',1484661471,1484661471),('blogpost','pt_BR','',1484661471,1484661471),('blogpost','ru','',1484661471,1484661471),('blogpost','sk','',1484661471,1484661471),('blogpost','sv','',1484661471,1484661471),('blogpost','tr','',1484661471,1484661471),('blogpost','uk','',1484661471,1484661471),('blogpost','zh_Hans','',1484661471,1484661471),('blogpost content','ca','',1484840333,1484840333),('blogpost content','cs','',1484840333,1484840333),('blogpost content','de','',1484840333,1484840333),('blogpost content','en','',1484840333,1484840333),('blogpost content','es','',1484840333,1484840333),('blogpost content','fa','',1484840333,1484840333),('blogpost content','fr','',1484840333,1484840333),('blogpost content','it','',1484840333,1484840333),('blogpost content','ja','',1484840333,1484840333),('blogpost content','nl','',1484840333,1484840333),('blogpost content','pl','',1484840333,1484840333),('blogpost content','pt','',1484840333,1484840333),('blogpost content','pt_BR','',1484840333,1484840333),('blogpost content','ru','',1484840333,1484840333),('blogpost content','sk','',1484840333,1484840333),('blogpost content','sv','',1484840333,1484840333),('blogpost content','tr','',1484840333,1484840333),('blogpost content','uk','',1484840333,1484840333),('blogpost content','zh_Hans','',1484840333,1484840333),('blogpost created on','ca','',1484840333,1484840333),('blogpost created on','cs','',1484840333,1484840333),('blogpost created on','de','',1484840333,1484840333),('blogpost created on','en','',1484840333,1484840333),('blogpost created on','es','',1484840333,1484840333),('blogpost created on','fa','',1484840333,1484840333),('blogpost created on','fr','',1484840333,1484840333),('blogpost created on','it','',1484840333,1484840333),('blogpost created on','ja','',1484840333,1484840333),('blogpost created on','nl','',1484840333,1484840333),('blogpost created on','pl','',1484840333,1484840333),('blogpost created on','pt','',1484840333,1484840333),('blogpost created on','pt_BR','',1484840333,1484840333),('blogpost created on','ru','',1484840333,1484840333),('blogpost created on','sk','',1484840333,1484840333),('blogpost created on','sv','',1484840333,1484840333),('blogpost created on','tr','',1484840333,1484840333),('blogpost created on','uk','',1484840333,1484840333),('blogpost created on','zh_Hans','',1484840333,1484840333),('blogpostcreated','ca','',1484665052,1484665052),('blogpostcreated','cs','',1484665052,1484665052),('blogpostcreated','de','',1484665052,1484665052),('blogpostcreated','en','',1484665052,1484665052),('blogpostcreated','es','',1484665052,1484665052),('blogpostcreated','fa','',1484665052,1484665052),('blogpostcreated','fr','',1484665052,1484665052),('blogpostcreated','it','',1484665052,1484665052),('blogpostcreated','ja','',1484665052,1484665052),('blogpostcreated','nl','',1484665052,1484665052),('blogpostcreated','pl','',1484665052,1484665052),('blogpostcreated','pt','',1484665052,1484665052),('blogpostcreated','pt_BR','',1484665052,1484665052),('blogpostcreated','ru','',1484665052,1484665052),('blogpostcreated','sk','',1484665052,1484665052),('blogpostcreated','sv','',1484665052,1484665052),('blogpostcreated','tr','',1484665052,1484665052),('blogpostcreated','uk','',1484665052,1484665052),('blogpostcreated','zh_Hans','',1484665052,1484665052),('contactform','en','',1484835287,1484835287),('contacts','ca','',1484840328,1484840328),('contacts','cs','',1484840328,1484840328),('contacts','de','',1484840328,1484840328),('contacts','en','',1484840328,1484840328),('contacts','es','',1484840328,1484840328),('contacts','fa','',1484840328,1484840328),('contacts','fr','',1484840328,1484840328),('contacts','it','',1484840328,1484840328),('contacts','ja','',1484840328,1484840328),('contacts','nl','',1484840328,1484840328),('contacts','pl','',1484840328,1484840328),('contacts','pt','',1484840328,1484840328),('contacts','pt_BR','',1484840328,1484840328),('contacts','ru','',1484840328,1484840328),('contacts','sk','',1484840328,1484840328),('contacts','sv','',1484840328,1484840328),('contacts','tr','',1484840328,1484840328),('contacts','uk','',1484840328,1484840328),('contacts','zh_Hans','',1484840328,1484840328),('content','ca','',1484661598,1484661598),('content','cs','',1484661598,1484661598),('content','de','',1484661598,1484661598),('content','en','',1484661598,1484661598),('content','es','',1484661598,1484661598),('content','fa','',1484661598,1484661598),('content','fr','',1484661598,1484661598),('content','it','',1484661598,1484661598),('content','ja','',1484661598,1484661598),('content','nl','',1484661598,1484661598),('content','pl','',1484661598,1484661598),('content','pt','',1484661598,1484661598),('content','pt_BR','',1484661598,1484661598),('content','ru','',1484661598,1484661598),('content','sk','',1484661598,1484661598),('content','sv','',1484661598,1484661598),('content','tr','',1484661598,1484661598),('content','uk','',1484661598,1484661598),('content','zh_Hans','',1484661598,1484661598),('email','ca','',1484840575,1484840575),('email','cs','',1484840575,1484840575),('email','de','',1484840575,1484840575),('email','en','',1484840575,1484840575),('email','es','',1484840575,1484840575),('email','fa','',1484840575,1484840575),('email','fr','',1484840575,1484840575),('email','it','',1484840575,1484840575),('email','ja','',1484840575,1484840575),('email','nl','',1484840575,1484840575),('email','pl','',1484840575,1484840575),('email','pt','',1484840575,1484840575),('email','pt_BR','',1484840575,1484840575),('email','ru','',1484840575,1484840575),('email','sk','',1484840575,1484840575),('email','sv','',1484840575,1484840575),('email','tr','',1484840575,1484840575),('email','uk','',1484840575,1484840575),('email','zh_Hans','',1484840575,1484840575),('header-background image','ca','',1484840333,1484840333),('header-background image','cs','',1484840333,1484840333),('header-background image','de','',1484840333,1484840333),('header-background image','en','',1484840333,1484840333),('header-background image','es','',1484840333,1484840333),('header-background image','fa','',1484840333,1484840333),('header-background image','fr','',1484840333,1484840333),('header-background image','it','',1484840333,1484840333),('header-background image','ja','',1484840333,1484840333),('header-background image','nl','',1484840333,1484840333),('header-background image','pl','',1484840333,1484840333),('header-background image','pt','',1484840333,1484840333),('header-background image','pt_BR','',1484840333,1484840333),('header-background image','ru','',1484840333,1484840333),('header-background image','sk','',1484840333,1484840333),('header-background image','sv','',1484840333,1484840333),('header-background image','tr','',1484840333,1484840333),('header-background image','uk','',1484840333,1484840333),('header-background image','zh_Hans','',1484840333,1484840333),('headerbackgroundimage','ca','',1484673937,1484673937),('headerbackgroundimage','cs','',1484673937,1484673937),('headerbackgroundimage','de','',1484673937,1484673937),('headerbackgroundimage','en','',1484673937,1484673937),('headerbackgroundimage','es','',1484673937,1484673937),('headerbackgroundimage','fa','',1484673937,1484673937),('headerbackgroundimage','fr','',1484673937,1484673937),('headerbackgroundimage','it','',1484673937,1484673937),('headerbackgroundimage','ja','',1484673937,1484673937),('headerbackgroundimage','nl','',1484673937,1484673937),('headerbackgroundimage','pl','',1484673937,1484673937),('headerbackgroundimage','pt','',1484673937,1484673937),('headerbackgroundimage','pt_BR','',1484673937,1484673937),('headerbackgroundimage','ru','',1484673937,1484673937),('headerbackgroundimage','sk','',1484673937,1484673937),('headerbackgroundimage','sv','',1484673937,1484673937),('headerbackgroundimage','tr','',1484673937,1484673937),('headerbackgroundimage','uk','',1484673937,1484673937),('headerbackgroundimage','zh_Hans','',1484673937,1484673937),('master','ca','',1484397734,1484397734),('master','cs','',1484397734,1484397734),('master','de','',1484397734,1484397734),('master','en','',1484397734,1484397734),('master','es','',1484397734,1484397734),('master','fa','',1484397734,1484397734),('master','fr','',1484397734,1484397734),('master','it','',1484397734,1484397734),('master','ja','',1484397734,1484397734),('master','nl','',1484397734,1484397734),('master','pl','',1484397734,1484397734),('master','pt','',1484397734,1484397734),('master','pt_BR','',1484397734,1484397734),('master','ru','',1484397734,1484397734),('master','sk','',1484397734,1484397734),('master','sv','',1484397734,1484397734),('master','tr','',1484397734,1484397734),('master','uk','',1484397734,1484397734),('master','zh_Hans','',1484397734,1484397734),('master (admin mode)','ca','',1484397734,1484397734),('master (admin mode)','cs','',1484397734,1484397734),('master (admin mode)','de','',1484397734,1484397734),('master (admin mode)','en','',1484397734,1484397734),('master (admin mode)','es','',1484397734,1484397734),('master (admin mode)','fa','',1484397734,1484397734),('master (admin mode)','fr','',1484397734,1484397734),('master (admin mode)','it','',1484397734,1484397734),('master (admin mode)','ja','',1484397734,1484397734),('master (admin mode)','nl','',1484397734,1484397734),('master (admin mode)','pl','',1484397734,1484397734),('master (admin mode)','pt','',1484397734,1484397734),('master (admin mode)','pt_BR','',1484397734,1484397734),('master (admin mode)','ru','',1484397734,1484397734),('master (admin mode)','sk','',1484397734,1484397734),('master (admin mode)','sv','',1484397734,1484397734),('master (admin mode)','tr','',1484397734,1484397734),('master (admin mode)','uk','',1484397734,1484397734),('master (admin mode)','zh_Hans','',1484397734,1484397734),('message','ca','',1484840575,1484840575),('message','cs','',1484840575,1484840575),('message','de','',1484840575,1484840575),('message','en','',1484840575,1484840575),('message','es','',1484840575,1484840575),('message','fa','',1484840575,1484840575),('message','fr','',1484840575,1484840575),('message','it','',1484840575,1484840575),('message','ja','',1484840575,1484840575),('message','nl','',1484840575,1484840575),('message','pl','',1484840575,1484840575),('message','pt','',1484840575,1484840575),('message','pt_BR','',1484840575,1484840575),('message','ru','',1484840575,1484840575),('message','sk','',1484840575,1484840575),('message','sv','',1484840575,1484840575),('message','tr','',1484840575,1484840575),('message','uk','',1484840575,1484840575),('message','zh_Hans','',1484840575,1484840575),('my','ca','',1484397536,1484397536),('my','cs','',1484397536,1484397536),('my','de','',1484397536,1484397536),('my','en','',1484397536,1484397536),('my','es','',1484397536,1484397536),('my','fa','',1484397536,1484397536),('my','fr','',1484397536,1484397536),('my','it','',1484397536,1484397536),('my','ja','',1484397536,1484397536),('my','nl','',1484397536,1484397536),('my','pl','',1484397536,1484397536),('my','pt','',1484397536,1484397536),('my','pt_BR','',1484397536,1484397536),('my','ru','',1484397536,1484397536),('my','sk','',1484397536,1484397536),('my','sv','',1484397536,1484397536),('my','tr','',1484397536,1484397536),('my','uk','',1484397536,1484397536),('my','zh_Hans','',1484397536,1484397536),('myinput text','ca','',1484397734,1484397734),('myinput text','cs','',1484397734,1484397734),('myinput text','de','',1484397734,1484397734),('myinput text','en','',1484397734,1484397734),('myinput text','es','',1484397734,1484397734),('myinput text','fa','',1484397734,1484397734),('myinput text','fr','',1484397734,1484397734),('myinput text','it','',1484397734,1484397734),('myinput text','ja','',1484397734,1484397734),('myinput text','nl','',1484397734,1484397734),('myinput text','pl','',1484397734,1484397734),('myinput text','pt','',1484397734,1484397734),('myinput text','pt_BR','',1484397734,1484397734),('myinput text','ru','',1484397734,1484397734),('myinput text','sk','',1484397734,1484397734),('myinput text','sv','',1484397734,1484397734),('myinput text','tr','',1484397734,1484397734),('myinput text','uk','',1484397734,1484397734),('myinput text','zh_Hans','',1484397734,1484397734),('mysample','ca','',1484397553,1484397553),('mysample','cs','',1484397553,1484397553),('mysample','de','',1484397553,1484397553),('mysample','en','',1484397553,1484397553),('mysample','es','',1484397553,1484397553),('mysample','fa','',1484397553,1484397553),('mysample','fr','',1484397553,1484397553),('mysample','it','',1484397553,1484397553),('mysample','ja','',1484397553,1484397553),('mysample','nl','',1484397553,1484397553),('mysample','pl','',1484397553,1484397553),('mysample','pt','',1484397553,1484397553),('mysample','pt_BR','',1484397553,1484397553),('mysample','ru','',1484397553,1484397553),('mysample','sk','',1484397553,1484397553),('mysample','sv','',1484397553,1484397553),('mysample','tr','',1484397553,1484397553),('mysample','uk','',1484397553,1484397553),('mysample','zh_Hans','',1484397553,1484397553),('name','ca','',1484840575,1484840575),('name','cs','',1484840575,1484840575),('name','de','',1484840575,1484840575),('name','en','',1484840575,1484840575),('name','es','',1484840575,1484840575),('name','fa','',1484840575,1484840575),('name','fr','',1484840575,1484840575),('name','it','',1484840575,1484840575),('name','ja','',1484840575,1484840575),('name','nl','',1484840575,1484840575),('name','pl','',1484840575,1484840575),('name','pt','',1484840575,1484840575),('name','pt_BR','',1484840575,1484840575),('name','ru','',1484840575,1484840575),('name','sk','',1484840575,1484840575),('name','sv','',1484840575,1484840575),('name','tr','',1484840575,1484840575),('name','uk','',1484840575,1484840575),('name','zh_Hans','',1484840575,1484840575),('page header','en','',1484753688,1484753688),('phone','ca','',1484840575,1484840575),('phone','cs','',1484840575,1484840575),('phone','de','',1484840575,1484840575),('phone','en','',1484840575,1484840575),('phone','es','',1484840575,1484840575),('phone','fa','',1484840575,1484840575),('phone','fr','',1484840575,1484840575),('phone','it','',1484840575,1484840575),('phone','ja','',1484840575,1484840575),('phone','nl','',1484840575,1484840575),('phone','pl','',1484840575,1484840575),('phone','pt','',1484840575,1484840575),('phone','pt_BR','',1484840575,1484840575),('phone','ru','',1484840575,1484840575),('phone','sk','',1484840575,1484840575),('phone','sv','',1484840575,1484840575),('phone','tr','',1484840575,1484840575),('phone','uk','',1484840575,1484840575),('phone','zh_Hans','',1484840575,1484840575),('post subtitle','ca','',1484840333,1484840333),('post subtitle','cs','',1484840333,1484840333),('post subtitle','de','',1484840333,1484840333),('post subtitle','en','',1484840333,1484840333),('post subtitle','es','',1484840333,1484840333),('post subtitle','fa','',1484840333,1484840333),('post subtitle','fr','',1484840333,1484840333),('post subtitle','it','',1484840333,1484840333),('post subtitle','ja','',1484840333,1484840333),('post subtitle','nl','',1484840333,1484840333),('post subtitle','pl','',1484840333,1484840333),('post subtitle','pt','',1484840333,1484840333),('post subtitle','pt_BR','',1484840333,1484840333),('post subtitle','ru','',1484840333,1484840333),('post subtitle','sk','',1484840333,1484840333),('post subtitle','sv','',1484840333,1484840333),('post subtitle','tr','',1484840333,1484840333),('post subtitle','uk','',1484840333,1484840333),('post subtitle','zh_Hans','',1484840333,1484840333),('post title','ca','',1484840333,1484840333),('post title','cs','',1484840333,1484840333),('post title','de','',1484840333,1484840333),('post title','en','',1484840333,1484840333),('post title','es','',1484840333,1484840333),('post title','fa','',1484840333,1484840333),('post title','fr','',1484840333,1484840333),('post title','it','',1484840333,1484840333),('post title','ja','',1484840333,1484840333),('post title','nl','',1484840333,1484840333),('post title','pl','',1484840333,1484840333),('post title','pt','',1484840333,1484840333),('post title','pt_BR','',1484840333,1484840333),('post title','ru','',1484840333,1484840333),('post title','sk','',1484840333,1484840333),('post title','sv','',1484840333,1484840333),('post title','tr','',1484840333,1484840333),('post title','uk','',1484840333,1484840333),('post title','zh_Hans','',1484840333,1484840333),('richtext editor','en','',1484832064,1484832064),('subtitle','ca','',1484661598,1484661598),('subtitle','cs','',1484661598,1484661598),('subtitle','de','',1484661598,1484661598),('subtitle','en','',1484661598,1484661598),('subtitle','es','',1484661598,1484661598),('subtitle','fa','',1484661598,1484661598),('subtitle','fr','',1484661598,1484661598),('subtitle','it','',1484661598,1484661598),('subtitle','ja','',1484661598,1484661598),('subtitle','nl','',1484661598,1484661598),('subtitle','pl','',1484661598,1484661598),('subtitle','pt','',1484661598,1484661598),('subtitle','pt_BR','',1484661598,1484661598),('subtitle','ru','',1484661598,1484661598),('subtitle','sk','',1484661598,1484661598),('subtitle','sv','',1484661598,1484661598),('subtitle','tr','',1484661598,1484661598),('subtitle','uk','',1484661598,1484661598),('subtitle','zh_Hans','',1484661598,1484661598),('title','ca','',1484661598,1484661598),('title','cs','',1484661598,1484661598),('title','de','',1484661598,1484661598),('title','en','',1484661598,1484661598),('title','es','',1484661598,1484661598),('title','fa','',1484661598,1484661598),('title','fr','',1484661598,1484661598),('title','it','',1484661598,1484661598),('title','ja','',1484661598,1484661598),('title','nl','',1484661598,1484661598),('title','pl','',1484661598,1484661598),('title','pt','',1484661598,1484661598),('title','pt_BR','',1484661598,1484661598),('title','ru','',1484661598,1484661598),('title','sk','',1484661598,1484661598),('title','sv','',1484661598,1484661598),('title','tr','',1484661598,1484661598),('title','uk','',1484661598,1484661598),('title','zh_Hans','',1484661598,1484661598);
/*!40000 ALTER TABLE `translations_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations_website`
--

DROP TABLE IF EXISTS `translations_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations_website` (
  `key` varchar(190) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text,
  `creationDate` bigint(20) unsigned DEFAULT NULL,
  `modificationDate` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations_website`
--

LOCK TABLES `translations_website` WRITE;
/*!40000 ALTER TABLE `translations_website` DISABLE KEYS */;
INSERT INTO `translations_website` VALUES ('\'%value%\' does not match the expected structure for a dns hostname','en','',1484836684,1484836684);
/*!40000 ALTER TABLE `translations_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tree_locks`
--

DROP TABLE IF EXISTS `tree_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tree_locks` (
  `id` int(11) NOT NULL DEFAULT '0',
  `type` enum('asset','document','object') NOT NULL DEFAULT 'asset',
  `locked` enum('self','propagate') DEFAULT NULL,
  PRIMARY KEY (`id`,`type`),
  KEY `id` (`id`),
  KEY `type` (`type`),
  KEY `locked` (`locked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tree_locks`
--

LOCK TABLES `tree_locks` WRITE;
/*!40000 ALTER TABLE `tree_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tree_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) unsigned DEFAULT NULL,
  `type` enum('user','userfolder','role','rolefolder') NOT NULL DEFAULT 'user',
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `contentLanguages` longtext,
  `admin` tinyint(1) unsigned DEFAULT '0',
  `active` tinyint(1) unsigned DEFAULT '1',
  `permissions` text,
  `roles` varchar(1000) DEFAULT NULL,
  `welcomescreen` tinyint(1) DEFAULT NULL,
  `closeWarning` tinyint(1) DEFAULT NULL,
  `memorizeTabs` tinyint(1) DEFAULT NULL,
  `allowDirtyClose` tinyint(1) unsigned DEFAULT '1',
  `docTypes` varchar(255) DEFAULT NULL,
  `classes` varchar(255) DEFAULT NULL,
  `apiKey` varchar(255) DEFAULT NULL,
  `activePerspective` varchar(255) DEFAULT NULL,
  `perspectives` longtext,
  `websiteTranslationLanguagesEdit` longtext,
  `websiteTranslationLanguagesView` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type`,`name`),
  KEY `parentId` (`parentId`),
  KEY `name` (`name`),
  KEY `password` (`password`(191))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,0,'user','system',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,0,'user','admin','$2y$10$e/F5xZGiq02leYaZ/9g1ROu82J8Ua1g31eptIltcP5Wp4iJ4ntK3q',NULL,NULL,NULL,'en',NULL,1,1,'','',0,1,1,1,'','',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_permission_definitions`
--

DROP TABLE IF EXISTS `users_permission_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_permission_definitions` (
  `key` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_permission_definitions`
--

LOCK TABLES `users_permission_definitions` WRITE;
/*!40000 ALTER TABLE `users_permission_definitions` DISABLE KEYS */;
INSERT INTO `users_permission_definitions` VALUES ('application_logging'),('assets'),('backup'),('classes'),('clear_cache'),('clear_temp_files'),('dashboards'),('documents'),('document_types'),('emails'),('glossary'),('http_errors'),('notes_events'),('objects'),('plugins'),('predefined_properties'),('qr_codes'),('recyclebin'),('redirects'),('reports'),('robots.txt'),('routes'),('seemode'),('seo_document_editor'),('system_settings'),('tags_assignment'),('tags_config'),('tags_search'),('tag_snippet_management'),('targeting'),('thumbnails'),('translations'),('users'),('website_settings');
/*!40000 ALTER TABLE `users_permission_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_asset`
--

DROP TABLE IF EXISTS `users_workspaces_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_workspaces_asset` (
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `list` tinyint(1) DEFAULT '0',
  `view` tinyint(1) DEFAULT '0',
  `publish` tinyint(1) DEFAULT '0',
  `delete` tinyint(1) DEFAULT '0',
  `rename` tinyint(1) DEFAULT '0',
  `create` tinyint(1) DEFAULT '0',
  `settings` tinyint(1) DEFAULT '0',
  `versions` tinyint(1) DEFAULT '0',
  `properties` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`cid`,`userId`),
  KEY `cid` (`cid`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_asset`
--

LOCK TABLES `users_workspaces_asset` WRITE;
/*!40000 ALTER TABLE `users_workspaces_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_document`
--

DROP TABLE IF EXISTS `users_workspaces_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_workspaces_document` (
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `list` tinyint(1) unsigned DEFAULT '0',
  `view` tinyint(1) unsigned DEFAULT '0',
  `save` tinyint(1) unsigned DEFAULT '0',
  `publish` tinyint(1) unsigned DEFAULT '0',
  `unpublish` tinyint(1) unsigned DEFAULT '0',
  `delete` tinyint(1) unsigned DEFAULT '0',
  `rename` tinyint(1) unsigned DEFAULT '0',
  `create` tinyint(1) unsigned DEFAULT '0',
  `settings` tinyint(1) unsigned DEFAULT '0',
  `versions` tinyint(1) unsigned DEFAULT '0',
  `properties` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`cid`,`userId`),
  KEY `cid` (`cid`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_document`
--

LOCK TABLES `users_workspaces_document` WRITE;
/*!40000 ALTER TABLE `users_workspaces_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_object`
--

DROP TABLE IF EXISTS `users_workspaces_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_workspaces_object` (
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET ascii DEFAULT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `list` tinyint(1) unsigned DEFAULT '0',
  `view` tinyint(1) unsigned DEFAULT '0',
  `save` tinyint(1) unsigned DEFAULT '0',
  `publish` tinyint(1) unsigned DEFAULT '0',
  `unpublish` tinyint(1) unsigned DEFAULT '0',
  `delete` tinyint(1) unsigned DEFAULT '0',
  `rename` tinyint(1) unsigned DEFAULT '0',
  `create` tinyint(1) unsigned DEFAULT '0',
  `settings` tinyint(1) unsigned DEFAULT '0',
  `versions` tinyint(1) unsigned DEFAULT '0',
  `properties` tinyint(1) unsigned DEFAULT '0',
  `lEdit` text,
  `lView` text,
  `layouts` text,
  PRIMARY KEY (`cid`,`userId`),
  KEY `cid` (`cid`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_object`
--

LOCK TABLES `users_workspaces_object` WRITE;
/*!40000 ALTER TABLE `users_workspaces_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uuids`
--

DROP TABLE IF EXISTS `uuids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uuids` (
  `uuid` char(36) NOT NULL,
  `itemId` bigint(20) unsigned NOT NULL,
  `type` varchar(25) NOT NULL,
  `instanceIdentifier` varchar(50) NOT NULL,
  PRIMARY KEY (`itemId`,`type`,`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uuids`
--

LOCK TABLES `uuids` WRITE;
/*!40000 ALTER TABLE `uuids` DISABLE KEYS */;
/*!40000 ALTER TABLE `uuids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned DEFAULT NULL,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `userId` int(11) unsigned DEFAULT NULL,
  `note` text,
  `date` bigint(1) unsigned DEFAULT NULL,
  `public` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `serialized` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,1,'document',2,NULL,1484327225,0,1),(2,1,'document',2,NULL,1484327260,0,1),(3,1,'document',2,NULL,1484327272,0,1),(14,4,'asset',2,NULL,1484395890,0,1),(15,4,'asset',2,NULL,1484396247,0,1),(16,4,'asset',2,NULL,1484396249,0,1),(20,1,'document',2,NULL,1484399960,0,1),(21,1,'document',2,NULL,1484400259,0,1),(23,4,'object',2,NULL,1484661585,0,1),(24,4,'object',2,NULL,1484661638,0,1),(25,4,'object',2,NULL,1484662059,0,1),(26,5,'object',2,NULL,1484664923,0,1),(27,5,'object',2,NULL,1484664935,0,1),(28,6,'object',2,NULL,1484664941,0,1),(29,6,'object',2,NULL,1484664955,0,1),(30,6,'object',2,NULL,1484664957,0,1),(31,5,'object',2,NULL,1484664958,0,1),(32,7,'object',2,NULL,1484664968,0,1),(33,7,'object',2,NULL,1484664980,0,1),(34,7,'object',2,NULL,1484664992,0,1),(35,5,'object',2,NULL,1484664996,0,1),(36,6,'object',2,NULL,1484664999,0,1),(37,7,'object',2,NULL,1484665002,0,1),(38,4,'object',2,NULL,1484665037,0,1),(39,5,'object',2,NULL,1484665045,0,1),(40,6,'object',2,NULL,1484665054,0,1),(41,7,'object',2,NULL,1484665060,0,1),(42,4,'object',2,NULL,1484673945,0,1),(43,4,'document',2,NULL,1484680181,0,1),(44,4,'document',2,NULL,1484680220,0,1),(45,4,'document',2,NULL,1484680404,0,1),(46,4,'document',2,NULL,1484680696,0,1),(47,5,'document',2,NULL,1484745052,0,1),(48,5,'document',2,NULL,1484745069,0,1),(49,5,'document',2,NULL,1484745251,0,1),(50,5,'document',2,NULL,1484745298,0,1),(51,1,'document',2,NULL,1484748630,0,1),(52,1,'document',2,NULL,1484753808,0,1),(53,1,'document',2,NULL,1484753888,0,1),(58,1,'document',2,NULL,1484832085,0,1),(59,6,'document',2,NULL,1484832093,0,1),(60,6,'document',2,NULL,1484832553,0,1),(61,6,'document',2,NULL,1484833606,0,1),(62,6,'document',2,NULL,1484833630,0,1),(63,5,'document',2,NULL,1484833645,0,1),(64,1,'document',2,NULL,1484833663,0,1),(65,6,'document',2,NULL,1484835300,0,1),(66,6,'document',2,NULL,1484835693,0,1),(67,7,'document',2,NULL,1484835706,0,1),(68,7,'document',2,NULL,1484835722,0,1),(69,7,'document',2,NULL,1484835725,0,1),(70,7,'document',2,NULL,1484835732,0,1),(71,7,'document',2,NULL,1484835754,0,1),(72,7,'document',2,NULL,1484835757,0,1),(73,7,'document',2,NULL,1484835758,0,1),(74,5,'document',2,NULL,1484835787,0,1),(75,5,'document',2,NULL,1484840072,0,1),(76,6,'asset',2,NULL,1484840118,0,1),(77,8,'asset',2,NULL,1484840118,0,1),(78,7,'asset',2,NULL,1484840118,0,1),(79,9,'asset',2,NULL,1484840118,0,1),(80,10,'asset',2,NULL,1484840118,0,1),(81,1,'document',2,NULL,1484840141,0,1),(82,6,'document',2,NULL,1484840144,0,1),(83,7,'document',2,NULL,1484840148,0,1),(84,9,'object',0,NULL,1484840558,0,1),(85,9,'object',2,NULL,1484840616,0,1);
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website_settings`
--

DROP TABLE IF EXISTS `website_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` enum('text','document','asset','object','bool') DEFAULT NULL,
  `data` text,
  `siteId` int(11) unsigned DEFAULT NULL,
  `creationDate` bigint(20) unsigned DEFAULT '0',
  `modificationDate` bigint(20) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`(191)),
  KEY `siteId` (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_settings`
--

LOCK TABLES `website_settings` WRITE;
/*!40000 ALTER TABLE `website_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `website_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `object_2`
--

/*!50001 DROP TABLE IF EXISTS `object_2`*/;
/*!50001 DROP VIEW IF EXISTS `object_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `object_2` AS select `object_query_2`.`oo_id` AS `oo_id`,`object_query_2`.`oo_classId` AS `oo_classId`,`object_query_2`.`oo_className` AS `oo_className`,`object_query_2`.`title` AS `title`,`object_query_2`.`subtitle` AS `subtitle`,`object_query_2`.`content` AS `content`,`object_query_2`.`author` AS `author`,`object_query_2`.`blogpostcreated` AS `blogpostcreated`,`object_query_2`.`headerbackgroundimage` AS `headerbackgroundimage`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className` from (`object_query_2` join `objects` on((`objects`.`o_id` = `object_query_2`.`oo_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `object_3`
--

/*!50001 DROP TABLE IF EXISTS `object_3`*/;
/*!50001 DROP VIEW IF EXISTS `object_3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50001 VIEW `object_3` AS select `object_query_3`.`oo_id` AS `oo_id`,`object_query_3`.`oo_classId` AS `oo_classId`,`object_query_3`.`oo_className` AS `oo_className`,`object_query_3`.`name` AS `name`,`object_query_3`.`email` AS `email`,`object_query_3`.`phone` AS `phone`,`object_query_3`.`message` AS `message`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className` from (`object_query_3` join `objects` on((`objects`.`o_id` = `object_query_3`.`oo_id`))) */;
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

-- Dump completed on 2017-01-19 21:01:40
