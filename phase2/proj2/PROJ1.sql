-- MariaDB dump 10.19  Distrib 10.5.9-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: PROJ1
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
  CONSTRAINT `AVA_ibfk_3` FOREIGN KEY (`COMMENT_TO_AVA_ID`) REFERENCES `AVA` (`A_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AVA`
--

LOCK TABLES `AVA` WRITE;
/*!40000 ALTER TABLE `AVA` DISABLE KEYS */;
INSERT INTO `AVA` VALUES (1,1,'First ava ever!','2021-05-28 03:36:12',NULL),(2,1,'SECOND ava ever!','2021-05-28 03:37:01',NULL),(4,3,'ava 33333333333333333333333333','2021-05-28 03:37:14',NULL),(5,2,'my ava 2','2021-05-28 03:37:19',NULL),(6,3,'ava 3XXX33XXX33XXX33XXX33XXX33XXX3','2021-05-28 03:37:23',NULL),(7,3,'AVA 33','2021-06-03 16:44:29',NULL),(8,5,'contexxxxxxxxxxxxxxxxxxxxxxxxxxt','2021-06-03 17:22:09',NULL),(9,2,'FIRST comment context!!!!','2021-06-03 19:22:20',1),(28,3,'DONT DELETE YOUR POST! :))) ','2021-06-03 20:15:13',8),(29,5,'ok dont delete.','2021-06-03 20:18:51',28),(30,1,'++++++++++++++++','2021-06-03 21:27:52',8),(31,2,'NICE POST! :))) ','2021-06-03 21:27:52',8),(32,43,'asdasd dsad sds #QWERT df #TGBVF Dsds','2021-07-07 17:35:18',NULL),(33,43,'asdasd dsad sds #QWERT df #TGBVF Dsds','2021-07-07 17:36:07',NULL),(34,43,'asdasd dsad sds #QWERT df #TGBVF Dsds','2021-07-07 17:38:14',NULL),(35,43,'asdasd dsad sds #QWERT df #TGBVF Dsds','2021-07-07 17:40:33',NULL),(37,43,'asdasd dsad sds #QWERT df #TGBVF Dsds','2021-07-07 17:43:00',NULL),(38,43,'asdasd dsad sds #QWERT df #TGBVF Dsds','2021-07-07 17:46:24',NULL),(39,43,'asdasd dsad sds #QWERT df #TGBVF Dsds','2021-07-07 17:54:34',NULL),(40,43,'asdasd dsad sds #QWERT df #TGBVF Dsds','2021-07-07 17:54:41',NULL),(41,43,'asdasd dsad sds #QWERT df #TGBVF Dsds','2021-07-07 17:54:55',NULL),(42,43,'asdasd dsad sds #QWERT df #TGBVF DsdsXXXXXXXXXXXX','2021-07-07 17:55:34',NULL),(43,43,'asdasd dsad sds #QWERT df #TGBVF DsdsXXXXXXXXXXXX','2021-07-07 17:56:48',NULL),(44,43,'asdasd dsad sds #QWERT df #TGBVF DsdsXXXXXXXXXXXX','2021-07-07 17:57:37',NULL),(45,43,'asdasd dsad sds #QWERT df #TGBVF DsdsXXXXXXXXXXXX','2021-07-07 17:58:39',NULL),(46,43,'asdasd dsad sds #QWERT df #TGBVF DsdsXXXXXXXXXXXX','2021-07-07 17:59:14',NULL),(47,43,'asdasd dsad sds #QWERT df #TGBVF DsdsXXXXXXXXXXXX','2021-07-07 18:00:02',NULL),(48,43,'dd #YUUII DsdsXXXXXXXXXXXX','2021-07-07 18:00:39',NULL),(49,43,'asdasd dsad sds #QWERT df #TGBVF DsdsXXXXXXXXXXXX','2021-07-07 18:02:04',NULL),(50,43,'asdasd dsad sds #QWERT df #TGBVF DsdsXXXXXXXXXXXX','2021-07-07 18:02:10',NULL),(51,43,'asdasd dsad sds #QWERT df #TGBVF DsdsXXXXXXXXXXXX','2021-07-07 18:02:55',NULL),(52,43,'asdasd dsad sds #ZZZZz df #TGBVF DsdsXXXXXXXXXXXX','2021-07-07 18:03:20',NULL),(53,43,'asdasd dsad sds #ZZZZz df #TGBVF DsdsXXXXXXXXXXXX','2021-07-07 18:30:18',NULL),(54,43,'asdasd dsad sds #ZZZZz df #TGBVF DsdsXXXXXXXXXXXX','2021-07-07 18:30:50',NULL),(55,43,'asdasd dsad sds #ZZZZz df #TGBVF DsdsXXXXXXXXXXXX','2021-07-07 18:31:55',NULL),(56,43,'asdasd dsad sds #ZZZZz df #TGBVr DsdsXXXXXXXXXXXX','2021-07-07 18:32:14',NULL),(57,43,'asdasd dsad sds #ZZZZz df #TGBVr DsdsXXXXXXXXXXXX','2021-07-07 18:33:50',NULL),(58,43,'asdasd dsad sds #ZZZZz df #TGBVr DsdsXXXXXXXXXXXX','2021-07-07 18:34:32',NULL),(59,43,'asdasd dsad sds #ZZZZz df #TGBVr DsdsXXXXXXXXXXXX','2021-07-07 18:35:39',NULL),(60,43,'asdasd dsad sds #ZZZZz df #TGBVr DsdsXXXXXXXXXXXX','2021-07-07 18:39:11',NULL),(61,43,'asdasd dsad sds #ZZZZz df #TGBVr DsdsXXXXXXXXXXXX','2021-07-07 18:40:09',NULL),(62,43,'asdasd dsad sds #ZZZZz df #TGBVr DsdsXXXXXXXXXXXX','2021-07-07 18:40:21',NULL),(63,43,'asdasd dsad sds #ZZZZz df #TGBVr DsdsXXXXXXXXXXXX','2021-07-07 18:40:58',NULL),(65,43,'asd #eeEEe XXXXXXXXXX','2021-07-07 18:42:14',NULL),(66,43,'asd #eeEEe dddd XXXXXXXXXX','2021-07-07 18:42:33',NULL),(67,43,'asd #geEEe dddd XXXXXXXXXX','2021-07-07 18:43:42',NULL),(68,43,'asd #geEEe dddd XXXXXXXXXX','2021-07-07 18:44:44',NULL),(69,43,'asd #geEEe dddd XXXXXXXXXX','2021-07-07 18:45:12',NULL),(70,43,'asd #geEEe #dddd XXXXXXXXXX','2021-07-07 18:51:00',NULL),(71,43,'asd #geEEe dddd XXXXXXXXXX','2021-07-07 18:52:22',NULL),(72,43,'asd #geEEw dddd XXXXXXXXXX','2021-07-07 18:52:26',NULL),(73,43,'asd #geEEw dddd XXXXXXXXXX','2021-07-07 18:52:46',NULL),(74,43,'asd #geEEw #dddd XXXXXXXXXX','2021-07-07 18:52:54',NULL),(75,43,'asd #gxEEw dddd XXXXXXXXXX','2021-07-07 18:53:17',NULL),(76,43,'asd #geEEx dddd XXXXXXXXXX','2021-07-07 18:54:47',NULL),(77,43,'asd #geEEx #dddd XXXXXXXXXX','2021-07-07 18:54:54',NULL),(79,43,'asd #geEEx #ddddc XXXXXXXXXX','2021-07-07 18:55:51',NULL),(81,43,'asd #geEEx #ddddc XXXXXXXXXX','2021-07-07 18:57:08',NULL),(83,43,'asd #geEEx #dddpc XXXXXXXXXX','2021-07-07 18:57:23',NULL),(85,43,'asd #geEEx #ddjpv XXXXXXXXXX','2021-07-07 18:58:16',NULL),(87,43,'asd #geEEx #ddjpc XXXXXXXXXX','2021-07-07 18:59:33',NULL),(89,43,'asd #geEEx #ddepc XXXXXXXXXX','2021-07-07 19:00:04',NULL),(91,43,'asd #geEEx #ddjpc XXXXXXXXXX','2021-07-07 19:01:07',NULL),(92,43,'asd #geEEq #ddjpc XXXXXXXXXX','2021-07-07 19:01:10',NULL),(93,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:01:57',NULL),(94,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:01:59',NULL),(95,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:04:14',NULL),(96,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:04:15',NULL),(97,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:10:21',NULL),(98,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:10:41',NULL),(99,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:10:59',NULL),(100,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:13:43',NULL),(102,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:15:00',NULL),(104,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:15:19',NULL),(106,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:15:49',NULL),(107,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:15:49',NULL),(108,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:16:05',NULL),(109,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:16:14',NULL),(111,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:21:52',NULL),(112,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:21:59',NULL),(113,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:22:24',NULL),(115,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:23:01',NULL),(116,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:23:03',NULL),(117,43,'asd #geEEw #djpc XXXXXXXXXX','2021-07-07 19:23:05',NULL),(118,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:24:59',NULL),(119,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:25:33',NULL),(121,43,'asd #geEEw #ddjpc XXXXXXXXXX','2021-07-07 19:26:14',NULL),(123,43,'asd #ddrrr XXXXXXXXXX','2021-07-07 19:26:59',NULL),(124,43,'asd #ddruu XXXXXXXXXX','2021-07-07 19:27:04',NULL),(125,43,'asd #ddruu XXXXXXXXXX','2021-07-07 19:27:07',NULL),(127,43,'asd #ddrrr XXXXXXXXXX','2021-07-07 19:28:56',NULL),(129,43,'asd #ddrrl XXXXXXXXXX','2021-07-07 19:29:40',NULL),(130,43,'asd #ddrrb XXXXXXXXXX','2021-07-07 19:29:45',NULL),(131,43,'asd #ddrrb XXXXXXXXXX','2021-07-07 19:29:47',NULL),(132,43,'asd #ddrrb XXXXXXXXXX','2021-07-07 19:29:48',NULL),(133,43,'asd #ddrrb XXXXXXXXXX','2021-07-07 19:29:48',NULL),(134,43,'asd #ddrrb XXXXXXXXXX','2021-07-07 19:29:49',NULL),(135,43,'asd #ddrrb XXXXXXXXXX','2021-07-07 19:29:50',NULL),(136,43,'asd #ddrrb XXXXXXXXXX','2021-07-07 19:30:47',NULL),(137,43,'asd #ddrrb XXXXXXXXXX','2021-07-07 19:31:41',NULL),(138,43,'asd #ddrrb XXXXXXXXXX','2021-07-07 19:33:06',NULL),(139,43,'asd #ddrrb XXXXXXXXXX','2021-07-07 19:36:18',NULL),(140,43,'asd #ddrrb XXXXXXXXXX','2021-07-07 19:36:20',NULL),(141,43,'asd #ddrrb XXXXXXXXXX','2021-07-07 19:36:20',NULL),(142,43,'asd #ddrrb XXXXXXXXXX','2021-07-07 19:36:21',NULL),(143,43,'asd #ddrrb XXXXXXXXXX','2021-07-07 19:36:21',NULL),(144,43,'asd #ddrrb XXXXXXXXXX','2021-07-07 19:36:21',NULL),(145,43,'asd #ddrrb XXXXXXXXXX','2021-07-07 19:36:22',NULL),(146,43,'asd #ddrrb XXXXXXXXXX','2021-07-07 19:36:22',NULL),(147,43,'asd #ddrrb XXXXXXXXXX','2021-07-07 20:01:08',NULL),(148,43,'asd #ddrrB XXXXXXXXXX','2021-07-07 20:01:16',NULL),(149,43,'asd #ddrRB XXXXXXXXXX','2021-07-07 20:01:26',NULL),(150,43,'asd #ddrRB XXXXXXXXXX','2021-07-07 20:01:29',NULL),(151,43,'asd #ddrRI XXXXXXXXXX','2021-07-07 20:02:49',NULL),(152,43,'asd #ddrRB XXXXXXXXXX','2021-07-07 20:03:02',NULL),(153,43,'asd #ddzRB XXXXXXXXXX','2021-07-07 20:03:17',NULL),(154,43,'asd #ddzRB XXXXXXXXXX','2021-07-07 20:05:33',NULL),(155,43,'asd #ddzRB XXXXXXXXXX','2021-07-07 20:05:43',NULL),(156,43,'my first comment!','2021-07-07 23:59:43',5),(157,43,'my first comment!','2021-07-07 23:59:49',5),(159,43,'dsds #q #we #ert # #tttyp ll','2021-07-08 00:01:58',NULL),(160,43,'dsds #q #we #ert # #tttyp ll','2021-07-08 00:03:07',NULL),(161,43,'comment to first comment 156 .','2021-07-08 00:04:10',156),(163,43,'dsds #q #we #ert # #tttyp ll','2021-07-08 00:07:26',NULL),(164,43,'dsds #q #we #ert # #tttyp ll','2021-07-08 00:07:49',NULL),(165,43,'dsds #q #we #ert # #t,typ ll','2021-07-08 00:07:55',NULL),(166,43,'dsds #q #we #ert # #tREGT ll','2021-07-08 00:07:59',NULL),(167,43,'aaa #l #OOOOO dre #ds','2021-07-08 00:47:36',NULL),(168,43,'aaa #l #OOOOO #KKKKK dre #ds','2021-07-08 00:48:20',NULL),(169,43,'aaa #l #OOOOO #KKKKK dre #ds','2021-07-08 00:48:41',NULL),(170,43,'rerereR','2021-07-08 18:06:58',NULL),(171,43,'first ava #FIRST sent!','2021-07-08 21:45:15',NULL),(248,43,'kkkk','2021-07-13 23:02:17',NULL),(249,43,'kkkk','2021-07-13 23:02:18',NULL),(250,45,'KkKKkkKKKK','2021-07-14 01:42:54',249),(251,45,'kk KK','2021-07-14 01:43:55',249),(253,43,'RR','2021-07-14 20:31:25',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AVA_LOGS`
--

LOCK TABLES `AVA_LOGS` WRITE;
/*!40000 ALTER TABLE `AVA_LOGS` DISABLE KEYS */;
INSERT INTO `AVA_LOGS` VALUES (253,43,'2021-07-14 20:31:25');
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
INSERT INTO `AVA_SPECS` VALUES (1,5),(2,7),(4,7),(5,5),(6,5),(8,22),(32,110),(32,120),(44,5),(44,28),(45,5),(46,5),(62,31),(63,31),(65,35),(66,35),(69,37),(73,39),(76,41),(77,41),(79,41),(81,41),(83,41),(85,41),(87,41),(89,41),(91,41),(93,39),(95,39),(102,39),(104,39),(106,39),(108,39),(113,39),(119,39),(121,39),(123,60),(124,61),(125,61),(127,60),(129,64),(130,65),(131,65),(132,65),(133,65),(134,65),(135,65),(136,65),(137,65),(138,65),(139,65),(140,65),(141,65),(142,65),(143,65),(144,65),(145,65),(146,65),(147,65),(148,65),(149,65),(150,65),(152,65),(154,88),(155,88),(160,91),(163,91),(164,91),(166,94),(167,95),(168,95),(168,97),(168,110),(168,123),(168,124),(168,125),(169,5),(169,95),(169,97),(169,100),(169,108),(169,110),(171,130);
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
INSERT INTO `BLOCKED_USERS` VALUES (2,1),(2,3),(2,43),(3,2),(3,43),(5,3),(43,1);
/*!40000 ALTER TABLE `BLOCKED_USERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREATE_LOGS`
--

DROP TABLE IF EXISTS `CREATE_LOGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREATE_LOGS` (
  `USER_ID` bigint(20) unsigned NOT NULL,
  `USER_NAME` varchar(20) NOT NULL,
  `CREATE_DATE` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`USER_ID`),
  CONSTRAINT `CREATE_LOGS_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `USERS` (`U_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREATE_LOGS`
--

LOCK TABLES `CREATE_LOGS` WRITE;
/*!40000 ALTER TABLE `CREATE_LOGS` DISABLE KEYS */;
INSERT INTO `CREATE_LOGS` VALUES (46,'e','2021-07-14 20:22:46');
/*!40000 ALTER TABLE `CREATE_LOGS` ENABLE KEYS */;
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
INSERT INTO `FOLLOWS` VALUES (1,2),(1,3),(3,1),(3,2),(3,5),(5,1),(43,1),(43,2),(43,3),(43,5);
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
INSERT INTO `LIKES` VALUES (1,6),(1,8),(2,2),(3,2),(43,8),(43,55),(43,249);
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
INSERT INTO `LOGINS` VALUES ('uuu','2021-07-07 17:29:52'),('t','2021-07-07 17:31:11'),('t','2021-07-07 17:33:13'),('t','2021-07-07 17:34:31'),('t','2021-07-07 17:35:08'),('t','2021-07-07 17:36:06'),('t','2021-07-07 17:37:40'),('t','2021-07-07 17:38:00'),('t','2021-07-07 19:04:40'),('t','2021-07-07 19:04:42'),('t','2021-07-07 19:04:44'),('t','2021-07-07 19:04:59'),('t','2021-07-07 20:52:17'),('t','2021-07-08 18:06:50'),('t','2021-07-08 18:08:07'),('t','2021-07-08 18:50:34'),('t','2021-07-08 21:44:53'),('t','2021-07-08 22:19:41'),('t','2021-07-08 22:29:58'),('t','2021-07-13 19:11:02'),('t','2021-07-13 19:12:26'),('t','2021-07-13 19:27:04'),('t','2021-07-13 19:27:51'),('t','2021-07-13 19:47:27'),('t','2021-07-13 21:25:50'),('g','2021-07-13 21:34:04'),('g','2021-07-13 21:34:06'),('g','2021-07-13 21:50:07'),('g','2021-07-13 21:50:21'),('g','2021-07-13 22:06:50'),('g','2021-07-13 22:06:53'),('t','2021-07-13 22:28:43'),('t','2021-07-13 22:54:58'),('t','2021-07-13 23:01:22'),('g','2021-07-14 01:36:45'),('t','2021-07-14 01:37:44'),('g','2021-07-14 01:42:44'),('g','2021-07-14 01:43:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MSG`
--

LOCK TABLES `MSG` WRITE;
/*!40000 ALTER TABLE `MSG` DISABLE KEYS */;
INSERT INTO `MSG` VALUES (1,1,5,'msssssssg 1',NULL,'2021-06-03 22:36:09'),(4,2,1,'BUT CAN MSG FROM 2 TO 1 !!!!!! ',NULL,'2021-06-03 22:40:16'),(5,1,3,NULL,8,'2021-06-03 22:47:03'),(8,1,3,NULL,8,'2021-06-03 22:59:26'),(9,1,3,'MY first msg to 3 :p',NULL,'2021-06-04 00:51:43'),(10,1,3,NULL,2,'2021-06-04 01:06:57'),(11,1,5,NULL,1,'2021-06-04 01:19:22'),(12,3,1,'BB TO U1 11111',NULL,'2021-06-04 01:41:36'),(13,5,1,'U44 (AS 5) TO U1 AS 1',NULL,'2021-06-04 01:42:09'),(14,43,5,'hello u44 ',NULL,'2021-07-08 05:47:07'),(15,43,3,'hello number 3',NULL,'2021-07-08 05:48:31'),(16,43,3,'hello number 3',NULL,'2021-07-08 05:48:32'),(17,43,1,NULL,8,'2021-07-08 17:59:00'),(18,43,5,'www',NULL,'2021-07-14 18:00:05'),(19,43,5,NULL,2,'2021-07-14 18:05:24'),(21,43,5,NULL,249,'2021-07-14 18:06:36'),(23,43,5,NULL,2,'2021-07-14 18:08:36');
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
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPECS`
--

LOCK TABLES `SPECS` WRITE;
/*!40000 ALTER TABLE `SPECS` DISABLE KEYS */;
INSERT INTO `SPECS` VALUES (26,'#ASDDC'),(24,'#ASDDS'),(1,'#ASDwq'),(125,'#cwibK'),(129,'#cwiqK'),(124,'#cwiTK'),(65,'#ddrrb'),(86,'#ddrRI'),(64,'#ddrrl'),(60,'#ddrrr'),(61,'#ddruu'),(88,'#ddzRB'),(3,'#DSDwq'),(35,'#eeEEe'),(130,'#FIRST'),(37,'#geEEe'),(39,'#geEEw'),(41,'#geEEx'),(120,'#kjeTK'),(110,'#kjiTK'),(108,'#kjiuK'),(97,'#KKKKK'),(123,'#kwiTK'),(22,'#LOVED'),(100,'#MMMMM'),(95,'#OOOOO'),(5,'#QWERT'),(28,'#TGBVF'),(94,'#tREGT'),(91,'#tttyp'),(7,'#XXXXX'),(31,'#ZZZZz');
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES (1,'USER 1 FIRST NAME','USER 1 LAST NAME','U1_USERNAME','7810f1ec4456e6ba090e3f32af060df6',NULL,'2021-05-27',NULL),(2,'aaa','AA','aaAA','99f384c9bfe4574b89a41eaab37720a2',NULL,'2021-05-27',NULL),(3,'bbbbb','B','BBbB','120ce68aa4ed02d8a2baca4ec7729faa',NULL,'2021-05-27',NULL),(5,'u4','u44last','U44','4373b07322934d16540c702b5850b143',NULL,'2021-06-03',NULL),(41,'gui_f','gui_l','guif','f8a882bf50178a25d4913b9349f1f7e9',NULL,'2021-07-07',NULL),(42,'fff','lll','uuu','6e8405483aa70af5440b86aafca658f2',NULL,'2021-07-07',NULL),(43,'t','t','t','e358efa489f58062f10dd7316b65649e',NULL,'2021-07-07',NULL),(44,'fff','ff','ffff','eed8cdc400dfd4ec85dff70a170066b7',NULL,'2021-07-13',NULL),(45,'g','gg','g','b2f5ff47436671b6e533d8dc3614845d',NULL,'2021-07-13',NULL),(46,'q','w','e','4b43b0aee35624cd95b910189b3dc231',NULL,'2021-07-14',NULL);
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

-- Dump completed on 2021-07-14 21:32:59
