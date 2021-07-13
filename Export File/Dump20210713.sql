-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ghanari
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `ava`
--

DROP TABLE IF EXISTS `ava`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ava` (
  `ava_id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(256) NOT NULL,
  `sender` varchar(20) NOT NULL,
  `parent_comment` int DEFAULT NULL,
  `send_date` datetime NOT NULL,
  PRIMARY KEY (`ava_id`),
  UNIQUE KEY `ava_id` (`ava_id`),
  KEY `sender` (`sender`),
  KEY `parent_comment` (`parent_comment`),
  CONSTRAINT `ava_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `user` (`user_name`),
  CONSTRAINT `ava_ibfk_2` FOREIGN KEY (`parent_comment`) REFERENCES `ava` (`ava_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ava`
--

LOCK TABLES `ava` WRITE;
/*!40000 ALTER TABLE `ava` DISABLE KEYS */;
INSERT INTO `ava` VALUES (1,'ddddddddddd','agak',NULL,'2021-07-13 03:51:27'),(2,'ssssss','agak',NULL,'2021-07-13 04:03:59'),(3,'rr','agak',1,'2021-07-13 04:09:50'),(4,'rrh','agak',3,'2021-07-13 04:13:28'),(5,'333','agak',3,'2021-07-13 04:15:32'),(7,'d','agak',NULL,'2021-07-13 05:03:41'),(9,'ggg','agak',1,'2021-07-13 05:15:33'),(10,'afdshy','e',NULL,'2021-07-13 19:27:08'),(11,'fdhfrtjf#ssssss','e',NULL,'2021-07-13 19:31:44'),(14,'dgs','e',NULL,'2021-07-13 19:32:40'),(17,'sssss','e',NULL,'2021-07-13 19:34:46'),(19,'sssss','e',NULL,'2021-07-13 19:39:05'),(20,'sss#ddddss','e',NULL,'2021-07-13 19:39:08'),(21,'sss#dss','e',NULL,'2021-07-13 19:41:18'),(22,'ava comment','gak',1,'2021-07-13 21:06:59'),(23,'ava comment2','rak',1,'2021-07-13 21:06:59'),(24,'ava comment3','rak',2,'2021-07-13 21:06:59'),(25,'ava comment4','aak',2,'2021-07-13 21:06:59');
/*!40000 ALTER TABLE `ava` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `new_ava` AFTER INSERT ON `ava` FOR EACH ROW begin
  insert into new_ava(ava_id, sender, send_date)
			values(NEW.ava_id, NEW.sender,  NEW.send_date);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `new_hashtag` AFTER INSERT ON `ava` FOR EACH ROW begin
    set @i = 1;
    loop_label:  loop
		if  @i > length(NEW.content) THEN 
		  LEAVE  loop_label;
		end if;
		if substr(NEW.content, @i , 6) like '#_____' then
		  call add_hashtag_ava(substr(NEW.content, @i , 6), NEW.ava_id );
		end if;
    set  @i = @i + 1;
	end loop;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `blocks`
--

DROP TABLE IF EXISTS `blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blocks` (
  `blocker` varchar(20) NOT NULL,
  `blocked` varchar(20) NOT NULL,
  PRIMARY KEY (`blocker`,`blocked`),
  KEY `blocked` (`blocked`),
  CONSTRAINT `blocks_ibfk_1` FOREIGN KEY (`blocker`) REFERENCES `user` (`user_name`),
  CONSTRAINT `blocks_ibfk_2` FOREIGN KEY (`blocked`) REFERENCES `user` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blocks`
--

LOCK TABLES `blocks` WRITE;
/*!40000 ALTER TABLE `blocks` DISABLE KEYS */;
INSERT INTO `blocks` VALUES ('agak','b'),('aak','gak');
/*!40000 ALTER TABLE `blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followers` (
  `follower` varchar(20) NOT NULL,
  `followed` varchar(20) NOT NULL,
  PRIMARY KEY (`follower`,`followed`),
  KEY `followed` (`followed`),
  CONSTRAINT `followers_ibfk_1` FOREIGN KEY (`follower`) REFERENCES `user` (`user_name`),
  CONSTRAINT `followers_ibfk_2` FOREIGN KEY (`followed`) REFERENCES `user` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followers`
--

LOCK TABLES `followers` WRITE;
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;
INSERT INTO `followers` VALUES ('gak','aak'),('rak','aak'),('agak','b'),('aak','rak');
/*!40000 ALTER TABLE `followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashtag`
--

DROP TABLE IF EXISTS `hashtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hashtag` (
  `text` char(6) NOT NULL,
  PRIMARY KEY (`text`),
  UNIQUE KEY `text` (`text`),
  CONSTRAINT `hashtag_chk_1` CHECK ((`text` like _utf8mb4'#_____'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtag`
--

LOCK TABLES `hashtag` WRITE;
/*!40000 ALTER TABLE `hashtag` DISABLE KEYS */;
INSERT INTO `hashtag` VALUES ('#abs5h'),('#bbbbb'),('#dddds');
/*!40000 ALTER TABLE `hashtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashtags`
--

DROP TABLE IF EXISTS `hashtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hashtags` (
  `text` char(6) NOT NULL,
  `ava_id` int NOT NULL,
  PRIMARY KEY (`text`,`ava_id`),
  KEY `ava_id` (`ava_id`),
  CONSTRAINT `hashtags_ibfk_1` FOREIGN KEY (`text`) REFERENCES `hashtag` (`text`),
  CONSTRAINT `hashtags_ibfk_2` FOREIGN KEY (`ava_id`) REFERENCES `ava` (`ava_id`),
  CONSTRAINT `hashtags_chk_1` CHECK ((`text` like _utf8mb4'#_____'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtags`
--

LOCK TABLES `hashtags` WRITE;
/*!40000 ALTER TABLE `hashtags` DISABLE KEYS */;
INSERT INTO `hashtags` VALUES ('#abs5h',1),('#abs5h',2),('#bbbbb',3),('#dddds',20);
/*!40000 ALTER TABLE `hashtags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `user_name` varchar(20) NOT NULL,
  `ava_id` int NOT NULL,
  PRIMARY KEY (`user_name`,`ava_id`),
  KEY `ava_id` (`ava_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `user` (`user_name`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`ava_id`) REFERENCES `ava` (`ava_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES ('aak',1),('agak',1),('gak',1),('rak',1),('aak',2),('rak',2),('gak',3);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logins` (
  `user_name` varchar(20) NOT NULL,
  `login_date` datetime NOT NULL,
  KEY `user_name` (`user_name`),
  CONSTRAINT `logins_ibfk_1` FOREIGN KEY (`user_name`) REFERENCES `user` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logins`
--

LOCK TABLES `logins` WRITE;
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
INSERT INTO `logins` VALUES ('agak','2021-07-12 23:14:15'),('agak','2021-07-12 23:14:42'),('agak','2021-07-12 23:17:23'),('agak','2021-07-12 23:17:47'),('agak','2021-07-12 23:17:54'),('agak','2021-07-12 23:18:32'),('agak','2021-07-12 23:18:45'),('agak','2021-07-12 23:19:27'),('agak','2021-07-12 23:19:49'),('agak','2021-07-12 23:21:33'),('agak','2021-07-12 23:22:16'),('agak','2021-07-12 23:23:02'),('agak','2021-07-13 01:10:38'),('agak','2021-07-13 01:10:59'),('agak','2021-07-13 01:44:39'),('agak','2021-07-13 01:45:01'),('agak','2021-07-13 01:46:34'),('agak','2021-07-13 01:46:45'),('agak','2021-07-13 01:47:12'),('agak','2021-07-13 01:47:40'),('agak','2021-07-13 01:48:03'),('agak','2021-07-13 01:48:17'),('agak','2021-07-13 01:57:38'),('agak','2021-07-13 01:58:35'),('agak','2021-07-13 01:59:49'),('agak','2021-07-13 02:00:24'),('agak','2021-07-13 02:12:04'),('agak','2021-07-13 02:12:53'),('agak','2021-07-13 02:14:39'),('agak','2021-07-13 02:15:41'),('agak','2021-07-13 02:16:27'),('agak','2021-07-13 02:18:13'),('agak','2021-07-13 02:18:26'),('agak','2021-07-13 02:19:40'),('agak','2021-07-13 02:19:44'),('agak','2021-07-13 02:20:08'),('agak','2021-07-13 02:22:26'),('agak','2021-07-13 02:22:50'),('agak','2021-07-13 02:23:13'),('agak','2021-07-13 02:23:18'),('agak','2021-07-13 02:32:49'),('agak','2021-07-13 02:32:57'),('agak','2021-07-13 02:34:03'),('agak','2021-07-13 02:34:20'),('agak','2021-07-13 02:34:30'),('agak','2021-07-13 02:34:34'),('agak','2021-07-13 02:36:46'),('agak','2021-07-13 02:36:50'),('agak','2021-07-13 02:43:06'),('agak','2021-07-13 02:43:14'),('agak','2021-07-13 02:43:58'),('agak','2021-07-13 02:44:10'),('agak','2021-07-13 02:44:40'),('agak','2021-07-13 02:44:46'),('agak','2021-07-13 02:45:38'),('agak','2021-07-13 02:45:42'),('agak','2021-07-13 02:46:51'),('agak','2021-07-13 02:46:55'),('agak','2021-07-13 02:47:14'),('agak','2021-07-13 02:54:26'),('agak','2021-07-13 02:54:38'),('agak','2021-07-13 03:32:10'),('agak','2021-07-13 03:32:38'),('agak','2021-07-13 03:32:55'),('agak','2021-07-13 04:03:27'),('agak','2021-07-13 04:03:39'),('agak','2021-07-13 04:14:53'),('agak','2021-07-13 04:15:17'),('agak','2021-07-13 04:30:13'),('agak','2021-07-13 04:30:27'),('agak','2021-07-13 04:33:51'),('agak','2021-07-13 04:37:25'),('agak','2021-07-13 04:37:43'),('agak','2021-07-13 04:42:46'),('agak','2021-07-13 04:43:06'),('agak','2021-07-13 04:43:54'),('agak','2021-07-13 04:44:04'),('agak','2021-07-13 04:47:52'),('agak','2021-07-13 04:48:00'),('agak','2021-07-13 05:01:21'),('agak','2021-07-13 05:01:38'),('agak','2021-07-13 05:01:50'),('agak','2021-07-13 05:09:58'),('agak','2021-07-13 05:10:13'),('agak','2021-07-13 05:13:17'),('agak','2021-07-13 05:33:13'),('agak','2021-07-13 05:33:23'),('agak','2021-07-13 06:28:22'),('e','2021-07-13 07:04:46'),('aak','2021-07-13 21:10:05');
/*!40000 ALTER TABLE `logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `ava_content` int DEFAULT NULL,
  `text_content` varchar(256) DEFAULT NULL,
  `sender` varchar(20) NOT NULL,
  `receiver` varchar(20) NOT NULL,
  `send_date` datetime NOT NULL,
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `message_id` (`message_id`),
  KEY `sender` (`sender`),
  KEY `receiver` (`receiver`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `user` (`user_name`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`receiver`) REFERENCES `user` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,1,NULL,'ss','agak','b','2021-07-13 04:27:13'),(2,1,NULL,'ss','agak','b','2021-07-13 04:27:24'),(3,0,3,NULL,'agak','b','2021-07-13 04:29:35'),(4,0,3,NULL,'agak','b','2021-07-13 04:29:42'),(5,1,NULL,'ss','agak','b','2021-07-13 04:29:46'),(6,1,NULL,'ss','agak','b','2021-07-13 04:29:53'),(7,1,NULL,'ss','agak','b','2021-07-13 04:40:28'),(8,1,NULL,'ss','agak','b','2021-07-13 04:44:10'),(9,1,NULL,'ss','agak','b','2021-07-13 04:47:41'),(10,1,NULL,'text message','aak','rak','2021-07-13 21:10:31'),(11,0,1,NULL,'aak','rak','2021-07-13 21:10:31'),(12,1,NULL,'text message2','rak','aak','2021-07-13 21:10:31'),(13,1,NULL,'I will block you','aak','gak','2021-07-13 21:10:31'),(14,1,NULL,'text message3','gak','rak','2021-07-13 21:10:32'),(15,1,NULL,'text message','aak','rak','2021-07-13 21:11:04'),(16,0,1,NULL,'aak','rak','2021-07-13 21:11:04'),(17,1,NULL,'text message2','rak','aak','2021-07-13 21:11:04'),(18,1,NULL,'I will block you','aak','gak','2021-07-13 21:11:04'),(19,1,NULL,'text message3','gak','rak','2021-07-13 21:11:04');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_ava`
--

DROP TABLE IF EXISTS `new_ava`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_ava` (
  `ava_id` int NOT NULL AUTO_INCREMENT,
  `sender` varchar(20) NOT NULL,
  `send_date` datetime NOT NULL,
  PRIMARY KEY (`ava_id`),
  UNIQUE KEY `ava_id` (`ava_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_ava`
--

LOCK TABLES `new_ava` WRITE;
/*!40000 ALTER TABLE `new_ava` DISABLE KEYS */;
INSERT INTO `new_ava` VALUES (1,'agak','2021-07-13 03:51:27'),(2,'agak','2021-07-13 04:03:59'),(3,'agak','2021-07-13 04:09:50'),(4,'agak','2021-07-13 04:13:28'),(5,'agak','2021-07-13 04:15:32'),(7,'agak','2021-07-13 05:03:41'),(9,'agak','2021-07-13 05:15:33'),(10,'e','2021-07-13 19:27:08'),(11,'e','2021-07-13 19:31:44'),(14,'e','2021-07-13 19:32:40'),(17,'e','2021-07-13 19:34:46'),(19,'e','2021-07-13 19:39:05'),(20,'e','2021-07-13 19:39:08'),(21,'e','2021-07-13 19:41:18'),(22,'gak','2021-07-13 21:06:59'),(23,'rak','2021-07-13 21:06:59'),(24,'rak','2021-07-13 21:06:59'),(25,'aak','2021-07-13 21:06:59');
/*!40000 ALTER TABLE `new_ava` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_log`
--

DROP TABLE IF EXISTS `new_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_log` (
  `user_name` varchar(20) NOT NULL,
  `join_date` date NOT NULL,
  PRIMARY KEY (`user_name`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_log`
--

LOCK TABLES `new_log` WRITE;
/*!40000 ALTER TABLE `new_log` DISABLE KEYS */;
INSERT INTO `new_log` VALUES ('ab','2021-07-13'),('b','2021-07-13'),('e','2021-07-13'),('gak','2021-07-13'),('q','2021-07-13'),('w','2021-07-13');
/*!40000 ALTER TABLE `new_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `birth_date` date NOT NULL,
  `join_date` date NOT NULL,
  `bio` varchar(64) NOT NULL,
  PRIMARY KEY (`user_name`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('ali','akbari','aak','ccd34fa9a29686c703590c9cac6cc0f73b01033f83e20ab3bc2abcaf9f0842de11cd99648dac33ad6a7c4aad012ee2ebc7f5bf75cba21c6b80a6fdf54363dacf','1990-01-01','2021-07-12','from iran'),('a','b','ab','2d408a0717ec188158278a796c689044361dc6fdde28d6f04973b80896e1823975cdbf12eb63f9e0591328ee235d80e9b5bf1aa6a44f4617ff3caf6400eb172d','1990-01-01','2021-07-13','from tehran'),('ali','akbari','agak','ccd34fa9a29686c703590c9cac6cc0f73b01033f83e20ab3bc2abcaf9f0842de11cd99648dac33ad6a7c4aad012ee2ebc7f5bf75cba21c6b80a6fdf54363dacf','1990-01-01','2021-07-12','from iran'),('ali','akbari','b','ccd34fa9a29686c703590c9cac6cc0f73b01033f83e20ab3bc2abcaf9f0842de11cd99648dac33ad6a7c4aad012ee2ebc7f5bf75cba21c6b80a6fdf54363dacf','1990-01-01','2021-07-13','from iran'),('e','e','e','87c568e037a5fa50b1bc911e8ee19a77c4dd3c22bce9932f86fdd8a216afe1681c89737fada6859e91047eece711ec16da62d6ccb9fd0de2c51f132347350d8c','1999-01-01','2021-07-13','e'),('ffreza','akbari','frak','d89cb51875c65bb0bd038446e2f45a77508dc015a42894502fb6727320fac445575e004301219009221b982aaa39771ac66ce723d22aac80592d648cfb18d0f9','1990-01-01','2021-07-12','from iran'),('gholi','akbari','gak','59eee9a4a3ee675ee5dd1e3e139cf8b9bcc41e45f3e8bcde5db997f1bf11b0fd5f9b5dc91e61c52283a6eb8859071867f4e66a46979a2f5121333c895d6d3d55','1990-01-01','2021-07-13','from iran'),('q','q','q','2e96772232487fb3a058d58f2c310023e07e4017c94d56cc5fae4b54b44605f42a75b0b1f358991f8c6cbe9b68b64e5b2a09d0ad23fcac07ee9a9198a745e1d5','1990-01-01','2021-07-13','from tehran'),('reza','akbari','rak','d89cb51875c65bb0bd038446e2f45a77508dc015a42894502fb6727320fac445575e004301219009221b982aaa39771ac66ce723d22aac80592d648cfb18d0f9','1990-01-01','2021-07-12','from iran'),('w','w','w','aa66509891ad28030349ba9581e8c92528faab6a34349061a44b6f8fcd8d6877a67b05508983f12f8610302d1783401a07ec41c7e9ebd656de34ec60d84d9511','2000-01-01','2021-07-13','w');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `new_log` AFTER INSERT ON `user` FOR EACH ROW begin
	insert into new_log(user_name, join_date)
	values(NEW.user_name, NEW.join_date);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'ghanari'
--

--
-- Dumping routines for database 'ghanari'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_hashtag_ava` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_hashtag_ava`(in given_hashtag char(6), in given_ava_id int)
begin
	insert into hashtag(text)
	values(given_hashtag);
    
    insert into hashtags(text, ava_id)
	values(given_hashtag, given_ava_id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `block` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `block`(in given_blocked varchar(20))
begin
    set @given_blocker = (select user_name
                            from logins
                            order by login_date desc limit 1);
	insert into blocks(blocker, blocked)
	values (@given_blocker, given_blocked);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `comment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `comment`(in given_content varchar(256), in given_parent_comment int)
begin
    set @given_sender = (select user_name
                            from logins
                            order by login_date desc limit 1);
	insert into ava(content, sender, parent_comment, send_date)
	select given_content, @given_sender,  given_parent_comment, now()
	from ava
	where ava_id = given_parent_comment and (sender, @given_sender) not in (select * from blocks);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `follow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `follow`(in gievn_followed varchar(20))
begin
    set @given_follower = (select user_name
                            from logins
                            order by login_date desc limit 1);
    insert into followers(follower , followed)
	values (@given_follower, gievn_followed);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `like_ava` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `like_ava`(in given_ava_id int)
begin     
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);        
	insert into likes(user_name, ava_id)
	select @given_user_name, given_ava_id
	where @given_user_name not in (select blocked 
					from blocks
					where blocker = (select sender from ava where ava_id = given_ava_id));
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(in given_user_name varchar(20), in given_password varchar(128))
begin
	insert into logins(user_name, login_date)
	select user.user_name , sysdate()
	from user
	where user.user_name = given_user_name and user.password = sha2(given_password, 512);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `make_tables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `make_tables`()
begin

create table user (
first_name varchar(20) not null
,last_name varchar(20) not null
,user_name varchar(20) not null primary key unique key
,password varchar(128) not null
,birth_date date not null
,join_date date not null
,bio varchar(64) not null
);

create table ava (
ava_id int not null primary key unique key auto_increment
,content varchar(256) not null
,sender varchar(20) not null
,parent_comment int
,send_date datetime not null
,foreign key(sender) references user(user_name)
,foreign key(parent_comment) references ava(ava_id)
);

create table message (
message_id int not null primary key unique key auto_increment
,type int not null -- ava or text
,ava_content int references ava(ava_id)
,text_content varchar(256)
,sender varchar(20) not null
,receiver varchar(20) not null
,send_date datetime not null
,foreign key(sender) references user(user_name)
,foreign key(receiver) references user(user_name)
);

create table hashtag (
text char(6) check (text like '#_____') not null primary key unique key
);

create table hashtags (
text char(6) check (text like '#_____') not null
,ava_id int not null
,primary key (text, ava_id)
,foreign key(text) references hashtag(text)
,foreign key(ava_id) references ava(ava_id)
);

create table logins (
user_name varchar(20) not null
,login_date datetime not null
,foreign key(user_name) references user(user_name)
);

create table likes (
user_name varchar(20) not null
,ava_id int not null
,primary key (user_name, ava_id)
,foreign key(user_name) references user(user_name)
,foreign key(ava_id) references ava(ava_id)
);

create table blocks (
blocker varchar(20) not null
,blocked varchar(20) not null
,primary key (blocker, blocked)
,foreign key(blocker) references user(user_name)
,foreign key(blocked) references user(user_name)
);

create table followers (
follower varchar(20) not null
,followed varchar(20) not null
,primary key (follower, followed)
,foreign key(follower) references user(user_name)
,foreign key(followed) references user(user_name)
);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register_account`(in given_first_name varchar(20), in given_last_name varchar(20), in given_user_name varchar(20), in given_password varchar(128), in given_birth_date date, in given_bio varchar(64))
begin
	insert into user(first_name, last_name, user_name, password, birth_date, join_date, bio )
	values(given_first_name, given_last_name, given_user_name, sha2(given_password, 512), given_birth_date, curdate(), given_bio);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `send_ava` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `send_ava`(in given_content varchar(256))
begin
    set @given_sender = (select user_name
                            from logins
                            order by login_date desc limit 1);   
	insert into ava(content, sender, parent_comment, send_date)
	values(given_content, @given_sender, null, now());
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `send_message` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `send_message`(in given_type int, in given_ava_content int, in given_text_content varchar(256), in given_receiver varchar(20))
begin
    set @given_sender = (select user_name
                            from logins
                            order by login_date desc limit 1);
    if (given_type = 0) then
		insert into message(type, ava_content, text_content, sender, receiver, send_date)
		select given_type, given_ava_content, null, @given_sender, given_receiver, now()
		where @given_sender not in (select blocked from blocks where blocker = given_receiver)
			and @given_sender not in (select blocked from blocks where blocker = (select sender from ava where ava_id = given_ava_content));
	end if;
    if (given_type = 1) then
		insert into message(type, ava_content, text_content, sender, receiver, send_date)
		select given_type, null, given_text_content, @given_sender, given_receiver, now()
		where @given_sender not in (select blocked from blocks where blocker = given_receiver);
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_ava_hashtags` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_ava_hashtags`(in given_hashtag char(6))
begin
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select content, sender, send_date
	from hashtags natural join ava
	where text = given_hashtag and @given_user_name not in (select blocked from blocks where blocker = sender )
	order by send_date desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_comments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_comments`(in given_ava_id int)
begin
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select * 
	from ava
	where parent_comment = given_ava_id and @given_user_name not in (select blocked
												from blocks join ava on blocks.blocker = ava.sender
												where ava.ava_id = given_ava_id)
							and @given_user_name not in (select blocked
												from blocks 
												where blocker = ava.sender);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_following_activity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_following_activity`()
begin
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select content, sender, send_date
	from ava
	where sender in (select followed from followers where follower = @given_user_name)
		and sender not in (select blocker from blocks where blocked = @given_user_name )
	order by send_date desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_likers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_likers`(in given_ava_id int)
begin
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select user_name 
	from likes
	where ava_id = given_ava_id and @given_user_name not in (select blocked
										from blocks join ava on blocks.blocker = ava.sender
										where ava_id = given_ava_id)
					and @given_user_name not in (select blocked
										from blocks 
										where blocker = user_name);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_like_number` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_like_number`(in given_ava_id int)
begin
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select count(user_name) as like_number 
	from likes natural join ava
	where @given_user_name not in (select blocked from blocks where blocker = sender)
		and ava_id = given_ava_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_logins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_logins`()
begin
    set @given__user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select login_date
	from logins
	where user_name = @given__user_name
	order by login_date desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_messages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_messages`(in given_sender varchar(20))
begin
    set @given_receiver = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select message.sender, message.receiver, ava_content, text_content, message.send_date 
	from message
	where message.sender = given_sender
		and message.receiver = @given_receiver
	order by send_date desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_popular_ava` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_popular_ava`()
begin
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select  ava.sender, content, count(ava_id) as like_number 
	from likes natural join ava
	where @given_user_name not in (select blocked from blocks where blocker = sender)
	group by ava_id
	order by like_number desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_senders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_senders`()
begin
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	 select distinct sender, last_message
	 from (select sender , max(send_date) as last_message
			from message
			where receiver = @given_user_name
			group by sender
			order by max(send_date) desc) as temp;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_user_activity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_user_activity`(in sender_user_name varchar(20))
begin
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select content , send_date
	from ava
	where sender = sender_user_name and @given_user_name not in (select blocked 
											from blocks
											where blocker = sender_user_name)
	order by send_date desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_user_avas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `show_user_avas`()
begin
    set @given_user_name = (select user_name
                            from logins
                            order by login_date desc limit 1);
	select content,  send_date
	from ava
	where sender = @given_user_name
	order by send_date desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unblock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `unblock`(in given_blocked varchar(20))
BEGIN
    set @given_blocker = (select user_name
                            from logins
                            order by login_date desc limit 1);
	delete from blocks
	where blocker = @given_blocker and blocked = given_blocked;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unfollow` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `unfollow`(in given_followed varchar(20))
begin
    set @given_follower = (select user_name
                            from logins
                            order by login_date desc limit 1);
	delete from followers
	where follower = @given_follower and followed = given_followed;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-13 21:12:11
