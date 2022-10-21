-
-- CREATE DATABASE `SOCIAL_MEDIA` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

-- - MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: SOCIAL_MEDIA
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.22.04.1

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
  `messagesUserId` varchar(45) NOT NULL,
  `fileUrl` varchar(45) NOT NULL,
  `createdAt` timestamp NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLOCK_LIST`
--

LOCK TABLES `BLOCK_LIST` WRITE;
/*!40000 ALTER TABLE `BLOCK_LIST` DISABLE KEYS */;
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
  `createdBy` bigint NOT NULL,
  `updatedBy` bigint NOT NULL,
  `title` varchar(75) NOT NULL,
  `noMember` int NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `profile` text,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP`
--

LOCK TABLES `GROUP` WRITE;
/*!40000 ALTER TABLE `GROUP` DISABLE KEYS */;
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
  `postComment` enum('text','image','video','audio') NOT NULL,
  `groupId` bigint DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  `commentId` bigint NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gcomment_group` (`groupId`),
  CONSTRAINT `GROUP_COMMENT_FK` FOREIGN KEY (`id`) REFERENCES `GROUP_POST` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_COMMENT`
--

LOCK TABLES `GROUP_COMMENT` WRITE;
/*!40000 ALTER TABLE `GROUP_COMMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_COMMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_FOLLOWER`
--

DROP TABLE IF EXISTS `GROUP_FOLLOWER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_FOLLOWER` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `groupId` bigint NOT NULL,
  `userId` bigint NOT NULL,
  `type` smallint NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_friend` (`groupId`,`userId`,`type`),
  KEY `idx_gfollower_group` (`groupId`),
  KEY `idx_gfollower_user` (`userId`),
  CONSTRAINT `fk_gfollower_group` FOREIGN KEY (`groupId`) REFERENCES `GROUP` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_FOLLOWER`
--

LOCK TABLES `GROUP_FOLLOWER` WRITE;
/*!40000 ALTER TABLE `GROUP_FOLLOWER` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_FOLLOWER` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_LIKE`
--

LOCK TABLES `GROUP_LIKE` WRITE;
/*!40000 ALTER TABLE `GROUP_LIKE` DISABLE KEYS */;
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
  `groupId` bigint NOT NULL,
  `userId` bigint NOT NULL,
  `type` smallint NOT NULL DEFAULT '0',
  `status` smallint NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_friend` (`groupId`,`userId`),
  KEY `idx_member_group` (`groupId`),
  KEY `idx_member_user` (`userId`),
  CONSTRAINT `fk_member_group` FOREIGN KEY (`groupId`) REFERENCES `GROUP` (`id`),
  CONSTRAINT `fk_member_user` FOREIGN KEY (`userId`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_MEMBER`
--

LOCK TABLES `GROUP_MEMBER` WRITE;
/*!40000 ALTER TABLE `GROUP_MEMBER` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_MEMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_MESSENGER`
--

DROP TABLE IF EXISTS `GROUP_MESSENGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_MESSENGER` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `groupId` bigint DEFAULT NULL,
  `userId` bigint DEFAULT NULL,
  `message` tinytext,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gmessage_group` (`groupId`),
  KEY `idx_gmessage_user` (`userId`),
  CONSTRAINT `fk_gmessage_group` FOREIGN KEY (`groupId`) REFERENCES `GROUP` (`id`),
  CONSTRAINT `fk_gmessage_user` FOREIGN KEY (`userId`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_MESSENGER`
--

LOCK TABLES `GROUP_MESSENGER` WRITE;
/*!40000 ALTER TABLE `GROUP_MESSENGER` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_MESSENGER` ENABLE KEYS */;
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
  `caption` text NOT NULL,
  `postType` enum('text','image','video','audio') NOT NULL,
  `numberLike` int DEFAULT NULL,
  `commentId` bigint NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gpost_group` (`groupId`),
  KEY `idx_gpost_user` (`userId`),
  CONSTRAINT `fk_gpost_group` FOREIGN KEY (`groupId`) REFERENCES `GROUP` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_POST`
--

LOCK TABLES `GROUP_POST` WRITE;
/*!40000 ALTER TABLE `GROUP_POST` DISABLE KEYS */;
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
  `passwordHash` varchar(32) NOT NULL,
  `registeredAt` datetime NOT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `intro` tinytext,
  `profile` text,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_reported` tinyint(1) NOT NULL DEFAULT '0',
  `is_blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_username` (`username`),
  UNIQUE KEY `uq_mobile` (`mobile`),
  UNIQUE KEY `uq_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
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
-- Table structure for table `USER_FOLOWER`
--

DROP TABLE IF EXISTS `USER_FOLOWER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FOLOWER` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sourceId` bigint NOT NULL,
  `targetId` bigint NOT NULL,
  `type` smallint NOT NULL DEFAULT '0',
  `status` smallint NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `idx_folower_source` (`sourceId`),
  KEY `idx_folower_target` (`targetId`),
  CONSTRAINT `fk_folower_source` FOREIGN KEY (`sourceId`) REFERENCES `USER` (`id`),
  CONSTRAINT `fk_folower_target` FOREIGN KEY (`targetId`) REFERENCES `USER` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FOLOWER`
--

LOCK TABLES `USER_FOLOWER` WRITE;
/*!40000 ALTER TABLE `USER_FOLOWER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FOLOWER` ENABLE KEYS */;
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
  `firstName` varchar(20) NOT NULL DEFAULT '',
  `middleName` varchar(20) NOT NULL DEFAULT '',
  `lastName` varchar(20) NOT NULL DEFAULT '',
  `phone` varchar(14) NOT NULL,
  `email` varchar(255) NOT NULL,
  `createdAt` varchar(45) NOT NULL,
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
-- Table structure for table `USER_MESSENSER`
--

DROP TABLE IF EXISTS `USER_MESSENGER`;
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
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-09 20:12:30
