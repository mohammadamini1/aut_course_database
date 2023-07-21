-- MariaDB dump 10.19  Distrib 10.5.9-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: PROJ2
-- ------------------------------------------------------
-- Server version	10.5.9-MariaDB-1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AVA`
--

DROP TABLE IF EXISTS `AVA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AVA` (
  `A_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `SENDER_ID` bigint(20) unsigned NOT NULL,
  `CONTEXT` varchar(256) NOT NULL,
  `SEND_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  `COMMENT_TO_AVA_ID` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`A_ID`),
  KEY `SENDER_ID` (`SENDER_ID`),
  KEY `COMMENT_TO_AVA_ID` (`COMMENT_TO_AVA_ID`),
  CONSTRAINT `AVA_ibfk_1` FOREIGN KEY (`SENDER_ID`) REFERENCES `USERS` (`U_ID`) ON UPDATE CASCADE,
  CONSTRAINT `AVA_ibfk_2` FOREIGN KEY (`COMMENT_TO_AVA_ID`) REFERENCES `AVA` (`A_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AVA`
--

LOCK TABLES `AVA` WRITE;
/*!40000 ALTER TABLE `AVA` DISABLE KEYS */;
/*!40000 ALTER TABLE `AVA` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_new_ava
AFTER
INSERT
    ON AVA FOR EACH ROW 
BEGIN


INSERT INTO AVA_LOGS (A_ID, SENDER_ID) VALUES (NEW.A_ID, NEW.SENDER_ID);


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `AVA_LOGS`
--

DROP TABLE IF EXISTS `AVA_LOGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AVA_LOGS` (
  `A_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `SENDER_ID` bigint(20) unsigned NOT NULL,
  `SEND_DATE` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`A_ID`),
  KEY `SENDER_ID` (`SENDER_ID`),
  CONSTRAINT `AVA_LOGS_ibfk_1` FOREIGN KEY (`A_ID`) REFERENCES `AVA` (`A_ID`) ON UPDATE CASCADE,
  CONSTRAINT `AVA_LOGS_ibfk_2` FOREIGN KEY (`SENDER_ID`) REFERENCES `USERS` (`U_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AVA_LOGS`
--

LOCK TABLES `AVA_LOGS` WRITE;
/*!40000 ALTER TABLE `AVA_LOGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AVA_LOGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AVA_SPECS`
--

DROP TABLE IF EXISTS `AVA_SPECS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AVA_SPECS` (
  `AVA_ID` bigint(20) unsigned NOT NULL,
  `SPEC_ID` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`AVA_ID`,`SPEC_ID`),
  KEY `SPEC_ID` (`SPEC_ID`),
  CONSTRAINT `AVA_SPECS_ibfk_1` FOREIGN KEY (`AVA_ID`) REFERENCES `AVA` (`A_ID`) ON UPDATE CASCADE,
  CONSTRAINT `AVA_SPECS_ibfk_2` FOREIGN KEY (`SPEC_ID`) REFERENCES `SPECS` (`S_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AVA_SPECS`
--

LOCK TABLES `AVA_SPECS` WRITE;
/*!40000 ALTER TABLE `AVA_SPECS` DISABLE KEYS */;
/*!40000 ALTER TABLE `AVA_SPECS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLOCKED_USERS`
--

DROP TABLE IF EXISTS `BLOCKED_USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BLOCKED_USERS` (
  `BLOCKER` bigint(20) unsigned NOT NULL,
  `BLOCKED` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`BLOCKER`,`BLOCKED`),
  KEY `BLOCKED` (`BLOCKED`),
  CONSTRAINT `BLOCKED_USERS_ibfk_1` FOREIGN KEY (`BLOCKER`) REFERENCES `USERS` (`U_ID`) ON UPDATE CASCADE,
  CONSTRAINT `BLOCKED_USERS_ibfk_2` FOREIGN KEY (`BLOCKED`) REFERENCES `USERS` (`U_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLOCKED_USERS`
--

LOCK TABLES `BLOCKED_USERS` WRITE;
/*!40000 ALTER TABLE `BLOCKED_USERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLOCKED_USERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FOLLOWS`
--

DROP TABLE IF EXISTS `FOLLOWS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FOLLOWS` (
  `FOLLOWER` bigint(20) unsigned NOT NULL,
  `FOLLOWED` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`FOLLOWER`,`FOLLOWED`),
  KEY `FOLLOWED` (`FOLLOWED`),
  CONSTRAINT `FOLLOWS_ibfk_1` FOREIGN KEY (`FOLLOWER`) REFERENCES `USERS` (`U_ID`) ON UPDATE CASCADE,
  CONSTRAINT `FOLLOWS_ibfk_2` FOREIGN KEY (`FOLLOWED`) REFERENCES `USERS` (`U_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FOLLOWS`
--

LOCK TABLES `FOLLOWS` WRITE;
/*!40000 ALTER TABLE `FOLLOWS` DISABLE KEYS */;
/*!40000 ALTER TABLE `FOLLOWS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LIKES`
--

DROP TABLE IF EXISTS `LIKES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LIKES` (
  `USER_ID` bigint(20) unsigned NOT NULL,
  `AVA_ID` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`USER_ID`,`AVA_ID`),
  KEY `AVA_ID` (`AVA_ID`),
  CONSTRAINT `LIKES_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`U_ID`) ON UPDATE CASCADE,
  CONSTRAINT `LIKES_ibfk_2` FOREIGN KEY (`AVA_ID`) REFERENCES `AVA` (`A_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LIKES`
--

LOCK TABLES `LIKES` WRITE;
/*!40000 ALTER TABLE `LIKES` DISABLE KEYS */;
/*!40000 ALTER TABLE `LIKES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOGINS`
--

DROP TABLE IF EXISTS `LOGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOGINS` (
  `USER_NAME` varchar(20) NOT NULL,
  `LOGIN_DATE` datetime DEFAULT current_timestamp(),
  KEY `USER_NAME` (`USER_NAME`),
  CONSTRAINT `LOGINS_ibfk_1` FOREIGN KEY (`USER_NAME`) REFERENCES `USERS` (`USER_NAME`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOGINS`
--

LOCK TABLES `LOGINS` WRITE;
/*!40000 ALTER TABLE `LOGINS` DISABLE KEYS */;
INSERT INTO `LOGINS` VALUES ('t','2021-07-08 22:04:34'),('t','2021-07-08 22:04:47');
/*!40000 ALTER TABLE `LOGINS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MSG`
--

DROP TABLE IF EXISTS `MSG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MSG` (
  `M_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `SENDER_ID` bigint(20) unsigned NOT NULL,
  `RECEIVER_ID` bigint(20) unsigned NOT NULL,
  `CONTEXT` varchar(256) DEFAULT NULL,
  `AVA_ID` bigint(20) unsigned DEFAULT NULL,
  `MSG_DATE` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`M_ID`),
  KEY `AVA_ID` (`AVA_ID`),
  KEY `SENDER_ID` (`SENDER_ID`),
  KEY `RECEIVER_ID` (`RECEIVER_ID`),
  CONSTRAINT `MSG_ibfk_1` FOREIGN KEY (`AVA_ID`) REFERENCES `AVA` (`A_ID`),
  CONSTRAINT `MSG_ibfk_2` FOREIGN KEY (`SENDER_ID`) REFERENCES `USERS` (`U_ID`) ON UPDATE CASCADE,
  CONSTRAINT `MSG_ibfk_3` FOREIGN KEY (`RECEIVER_ID`) REFERENCES `USERS` (`U_ID`) ON UPDATE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (`CONTEXT` is not null or `AVA_ID` is not null)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MSG`
--

LOCK TABLES `MSG` WRITE;
/*!40000 ALTER TABLE `MSG` DISABLE KEYS */;
/*!40000 ALTER TABLE `MSG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPECS`
--

DROP TABLE IF EXISTS `SPECS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SPECS` (
  `S_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `S_TEXT` varchar(6) NOT NULL,
  PRIMARY KEY (`S_ID`),
  UNIQUE KEY `S_TEXT` (`S_TEXT`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`S_TEXT` regexp '^[#][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z]$')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPECS`
--

LOCK TABLES `SPECS` WRITE;
/*!40000 ALTER TABLE `SPECS` DISABLE KEYS */;
/*!40000 ALTER TABLE `SPECS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS` (
  `U_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(20) NOT NULL,
  `LAST_NAME` varchar(20) NOT NULL,
  `USER_NAME` varchar(20) NOT NULL,
  `PASSWORD` varchar(128) NOT NULL,
  `BIRTH_DATE` date DEFAULT NULL,
  `REGISTER_DATE` date DEFAULT NULL,
  `BIOGRAPHY` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`U_ID`),
  UNIQUE KEY `USER_NAME` (`USER_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES (1,'tf','tl','t','e358efa489f58062f10dd7316b65649e',NULL,'2021-07-08',NULL);
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER log_new_create_account
AFTER
INSERT
    ON USERS FOR EACH ROW 

BEGIN
    INSERT INTO
        CREATE_LOGS (USER_ID, USER_NAME)
    VALUES
        (NEW.U_ID, NEW.USER_NAME);
END */;;
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

-- Dump completed on 2021-07-14 21:33:28
