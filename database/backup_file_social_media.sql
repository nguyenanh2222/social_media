-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: SOCIAL_MEDIA
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.22.04.1

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
-- Table structure for table `ACTIVITIES`
--

DROP TABLE IF EXISTS `ACTIVITIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACTIVITIES` (
  `id` bigint NOT NULL,
  `activityType` varchar(45) NOT NULL,
  `activityID` int NOT NULL,
  `title` varchar(45) NOT NULL,
  `detail` text NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTIVITIES`
--

LOCK TABLES `ACTIVITIES` WRITE;
/*!40000 ALTER TABLE `ACTIVITIES` DISABLE KEYS */;
INSERT INTO `ACTIVITIES` VALUES (1,'comment',1,'hello world','first commit','2016-03-09 03:30:25','2016-03-09 03:30:25');
/*!40000 ALTER TABLE `ACTIVITIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ATTACHEMENT`
--

DROP TABLE IF EXISTS `ATTACHEMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ATTACHEMENT` (
  `id` int NOT NULL,
  `messagesUserId` bigint DEFAULT NULL,
  `thumbUrl` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fileUrl` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `messengesGroupId` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ATTACHEMENT`
--

LOCK TABLES `ATTACHEMENT` WRITE;
/*!40000 ALTER TABLE `ATTACHEMENT` DISABLE KEYS */;
INSERT INTO `ATTACHEMENT` VALUES (1,1,'https:k/#@sangnt84','https:k/#@sangnt84','2016-03-08 20:30:25','2016-03-09 03:30:25',NULL);
/*!40000 ALTER TABLE `ATTACHEMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLOCK_LIST`
--

DROP TABLE IF EXISTS `BLOCK_LIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BLOCK_LIST` (
  `id` int NOT NULL AUTO_INCREMENT,
  `users_id` varchar(26) NOT NULL,
  `participants_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLOCK_LIST`
--

LOCK TABLES `BLOCK_LIST` WRITE;
/*!40000 ALTER TABLE `BLOCK_LIST` DISABLE KEYS */;
INSERT INTO `BLOCK_LIST` VALUES (1,'1',1,'2016-03-09 03:30:25');
/*!40000 ALTER TABLE `BLOCK_LIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP`
--

DROP TABLE IF EXISTS `GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdBy` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updatedBy` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `title` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `noMember` int DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `profile` text,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP`
--

LOCK TABLES `GROUP` WRITE;
/*!40000 ALTER TABLE `GROUP` DISABLE KEYS */;
INSERT INTO `GROUP` VALUES (1,'dalata','kalata','title',10,'2016-03-09 03:30:25','2016-03-09 03:30:25','hahaha','hihihi');
/*!40000 ALTER TABLE `GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_COMMENT`
--

DROP TABLE IF EXISTS `GROUP_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_COMMENT` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `postComment` enum('text','image','video','audio') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `groupId` bigint DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  `commentId` bigint DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gcomment_group` (`groupId`),
  CONSTRAINT `GROUP_COMMENT_FK` FOREIGN KEY (`id`) REFERENCES `GROUP_POST` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_COMMENT`
--

LOCK TABLES `GROUP_COMMENT` WRITE;
/*!40000 ALTER TABLE `GROUP_COMMENT` DISABLE KEYS */;
INSERT INTO `GROUP_COMMENT` VALUES (1,'text',1,1,1,'2016-03-09 03:30:25','2016-03-09 03:30:25');
/*!40000 ALTER TABLE `GROUP_COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_FOLLOWING`
--

DROP TABLE IF EXISTS `GROUP_FOLLOWING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_FOLLOWING` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sourceId` bigint NOT NULL,
  `targetId` bigint NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_friend` (`sourceId`,`targetId`),
  KEY `idx_gfollower_group` (`sourceId`),
  KEY `idx_gfollower_user` (`targetId`),
  CONSTRAINT `GROUP_FOLLOWING_FK` FOREIGN KEY (`sourceId`) REFERENCES `GROUP` (`id`),
  CONSTRAINT `GROUP_FOLLOWING_FK_1` FOREIGN KEY (`targetId`) REFERENCES `GROUP` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_FOLLOWING`
--

LOCK TABLES `GROUP_FOLLOWING` WRITE;
/*!40000 ALTER TABLE `GROUP_FOLLOWING` DISABLE KEYS */;
INSERT INTO `GROUP_FOLLOWING` VALUES (1,1,1,'2016-03-09 03:30:25');
/*!40000 ALTER TABLE `GROUP_FOLLOWING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_LIKE`
--

DROP TABLE IF EXISTS `GROUP_LIKE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_LIKE` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `groupId` bigint DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  `commentId` bigint NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_glike_group` (`groupId`),
  CONSTRAINT `fk_glike_group` FOREIGN KEY (`groupId`) REFERENCES `GROUP_POST` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_LIKE`
--

LOCK TABLES `GROUP_LIKE` WRITE;
/*!40000 ALTER TABLE `GROUP_LIKE` DISABLE KEYS */;
INSERT INTO `GROUP_LIKE` VALUES (1,1,1,1,'2016-03-09 03:30:25','2016-03-09 03:30:25');
/*!40000 ALTER TABLE `GROUP_LIKE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_MEMBER`
--

DROP TABLE IF EXISTS `GROUP_MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_MEMBER` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `groupId` bigint DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `notes` enum('not changed','edited') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` enum('admin','member','accepting') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_friend` (`groupId`,`userId`),
  KEY `idx_member_group` (`groupId`),
  KEY `idx_member_user` (`userId`),
  CONSTRAINT `fk_member_group` FOREIGN KEY (`groupId`) REFERENCES `GROUP` (`id`),
  CONSTRAINT `fk_member_user` FOREIGN KEY (`userId`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_MEMBER`
--

LOCK TABLES `GROUP_MEMBER` WRITE;
/*!40000 ALTER TABLE `GROUP_MEMBER` DISABLE KEYS */;
INSERT INTO `GROUP_MEMBER` VALUES (1,1,1,'2016-03-09 03:30:25','2016-03-09 03:30:25','edited','admin');
/*!40000 ALTER TABLE `GROUP_MEMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_POST`
--

DROP TABLE IF EXISTS `GROUP_POST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_POST` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `groupId` bigint DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  `caption` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `postType` enum('text','image','video','audio') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `numberLike` int DEFAULT NULL,
  `commentId` bigint DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gpost_group` (`groupId`),
  KEY `idx_gpost_user` (`userId`),
  CONSTRAINT `fk_gpost_group` FOREIGN KEY (`groupId`) REFERENCES `GROUP` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_POST`
--

LOCK TABLES `GROUP_POST` WRITE;
/*!40000 ALTER TABLE `GROUP_POST` DISABLE KEYS */;
INSERT INTO `GROUP_POST` VALUES (1,NULL,1,'none','text',12,1,'2016-03-09 03:30:25','2016-03-09 03:30:25');
/*!40000 ALTER TABLE `GROUP_POST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REPORT`
--

DROP TABLE IF EXISTS `REPORT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REPORT` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usersId` varchar(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `participantsId` bigint NOT NULL,
  `reportType` varchar(45) NOT NULL,
  `notes` text NOT NULL,
  `status` enum('pending','resolved') NOT NULL DEFAULT 'pending',
  `createdAt` datetime NOT NULL,
  `groupId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REPORT`
--

LOCK TABLES `REPORT` WRITE;
/*!40000 ALTER TABLE `REPORT` DISABLE KEYS */;
/*!40000 ALTER TABLE `REPORT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uuid` varchar(26) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `passwordHash` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `registeredAt` datetime DEFAULT NULL,
  `intro` tinytext,
  `profile` text,
  `is_active` tinyint(1) DEFAULT '0',
  `is_reported` tinyint(1) DEFAULT '0',
  `is_blocked` tinyint(1) DEFAULT '0',
  `password` varchar(100) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_username` (`username`),
  UNIQUE KEY `uq_mobile` (`mobile`),
  UNIQUE KEY `uq_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'001','Sang',NULL,'Nguyen','Sang','090909012','sanghh111@gmail.com','123','2013-11-20 20:09:26','123','123',1,0,0,NULL,NULL),(6,'f806dfa6-0f32-48a2-8a78','asd',NULL,'sas','nguyenanh2222','0334865104','nguyenvie2103@gmail.com','21432','2012-09-04 14:00:00','asf','asd',0,0,0,'django pass','2012-09-04 14:00:00');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_COMMENT`
--

DROP TABLE IF EXISTS `USER_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_COMMENT` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `postComment` enum('text','image','vedio','audio') NOT NULL,
  `groupId` bigint DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  `commentId` bigint NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ucomment_group` (`userId`),
  CONSTRAINT `fk_ucomment_group` FOREIGN KEY (`userId`) REFERENCES `USER_POST` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_COMMENT`
--

LOCK TABLES `USER_COMMENT` WRITE;
/*!40000 ALTER TABLE `USER_COMMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FOLOWING`
--

DROP TABLE IF EXISTS `USER_FOLOWING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FOLOWING` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sourceId` bigint NOT NULL,
  `targetId` bigint NOT NULL,
  `createdAt` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_following_target` (`targetId`),
  KEY `idx_following_source` (`sourceId`),
  CONSTRAINT `idx_following_source` FOREIGN KEY (`sourceId`) REFERENCES `USER` (`id`),
  CONSTRAINT `idx_following_target` FOREIGN KEY (`targetId`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FOLOWING`
--

LOCK TABLES `USER_FOLOWING` WRITE;
/*!40000 ALTER TABLE `USER_FOLOWING` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FOLOWING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FRIEND`
--

DROP TABLE IF EXISTS `USER_FRIEND`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FRIEND` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sourceId` bigint NOT NULL,
  `targetId` bigint NOT NULL,
  `type` smallint NOT NULL DEFAULT '0',
  `status` smallint NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_friend` (`sourceId`,`targetId`),
  KEY `idx_friend_source` (`sourceId`),
  KEY `idx_friend_target` (`targetId`),
  CONSTRAINT `fk_friend_source` FOREIGN KEY (`sourceId`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FRIEND`
--

LOCK TABLES `USER_FRIEND` WRITE;
/*!40000 ALTER TABLE `USER_FRIEND` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FRIEND` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_LIKE`
--

DROP TABLE IF EXISTS `USER_LIKE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_LIKE` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `groupId` bigint DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  `commentId` bigint NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ulike_group` (`userId`),
  CONSTRAINT `fk_ulike_group` FOREIGN KEY (`userId`) REFERENCES `USER_POST` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_LIKE`
--

LOCK TABLES `USER_LIKE` WRITE;
/*!40000 ALTER TABLE `USER_LIKE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_LIKE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_MESSENGER`
--

DROP TABLE IF EXISTS `USER_MESSENGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_MESSENGER` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sourceId` bigint DEFAULT NULL,
  `targetId` bigint DEFAULT NULL,
  `message` tinytext,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `messageType` enum('text','image','video','audio') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gmessage_group` (`sourceId`),
  KEY `idx_gmessage_user` (`targetId`),
  CONSTRAINT `fk_gmessage_group` FOREIGN KEY (`sourceId`) REFERENCES `GROUP` (`id`),
  CONSTRAINT `fk_gmessage_user` FOREIGN KEY (`targetId`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_MESSENGER`
--

LOCK TABLES `USER_MESSENGER` WRITE;
/*!40000 ALTER TABLE `USER_MESSENGER` DISABLE KEYS */;
INSERT INTO `USER_MESSENGER` VALUES (1,1,1,'none','2016-03-09 03:30:25','2016-03-09 03:30:25','text');
/*!40000 ALTER TABLE `USER_MESSENGER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_MESSENSER`
--

DROP TABLE IF EXISTS `USER_MESSENSER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_MESSENSER` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sourceId` bigint NOT NULL,
  `targetId` bigint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `guid` varchar(26) NOT NULL,
  `conversation_id` int NOT NULL,
  `messageType` enum('text','image','vedio','audio') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_umessage_source` (`sourceId`),
  CONSTRAINT `fk_umessage_source` FOREIGN KEY (`sourceId`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_MESSENSER`
--

LOCK TABLES `USER_MESSENSER` WRITE;
/*!40000 ALTER TABLE `USER_MESSENSER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_MESSENSER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_POST`
--

DROP TABLE IF EXISTS `USER_POST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_POST` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `caption` text NOT NULL,
  `postType` enum('text','image','vedio','audio') NOT NULL,
  `userId` bigint NOT NULL,
  `numberLike` int NOT NULL,
  `commentId` bigint NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_upost_user` (`userId`),
  CONSTRAINT `fk_upost_user` FOREIGN KEY (`userId`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_POST`
--

LOCK TABLES `USER_POST` WRITE;
/*!40000 ALTER TABLE `USER_POST` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_POST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user model',7,'add_usermodel'),(26,'Can change user model',7,'change_usermodel'),(27,'Can delete user model',7,'delete_usermodel'),(28,'Can view user model',7,'view_usermodel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'core','usermodel'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-10-12 12:54:44.419610'),(2,'auth','0001_initial','2022-10-12 12:54:45.878416'),(3,'admin','0001_initial','2022-10-12 12:54:46.251734'),(4,'admin','0002_logentry_remove_auto_add','2022-10-12 12:54:46.287687'),(5,'admin','0003_logentry_add_action_flag_choices','2022-10-12 12:54:46.306482'),(6,'contenttypes','0002_remove_content_type_name','2022-10-12 12:54:46.507759'),(7,'auth','0002_alter_permission_name_max_length','2022-10-12 12:54:46.667112'),(8,'auth','0003_alter_user_email_max_length','2022-10-12 12:54:46.742269'),(9,'auth','0004_alter_user_username_opts','2022-10-12 12:54:46.763384'),(10,'auth','0005_alter_user_last_login_null','2022-10-12 12:54:46.888923'),(11,'auth','0006_require_contenttypes_0002','2022-10-12 12:54:46.900451'),(12,'auth','0007_alter_validators_add_error_messages','2022-10-12 12:54:46.935048'),(13,'auth','0008_alter_user_username_max_length','2022-10-12 12:54:47.097172'),(14,'auth','0009_alter_user_last_name_max_length','2022-10-12 12:54:47.239512'),(15,'auth','0010_alter_group_name_max_length','2022-10-12 12:54:47.286738'),(16,'auth','0011_update_proxy_permissions','2022-10-12 12:54:47.309754'),(17,'auth','0012_alter_user_first_name_max_length','2022-10-12 12:54:47.467201'),(18,'sessions','0001_initial','2022-10-13 12:32:45.086585');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-03 13:54:45
