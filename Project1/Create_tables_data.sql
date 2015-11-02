-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: LibraryDb
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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

CREATE SCHEMA IF NOT EXISTS `LibraryDb` ;
USE `LibraryDb` ;

--
-- Table structure for table `Accounts`
--

DROP TABLE IF EXISTS `Accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Accounts` (
  `patron_id` varchar(50) NOT NULL,
  `lib_id` smallint(6) NOT NULL,
  `due_balance` float(10,2) NOT NULL,
  PRIMARY KEY (`patron_id`,`lib_id`),
  KEY `lib_id` (`lib_id`),
  CONSTRAINT `Accounts_ibfk_1` FOREIGN KEY (`patron_id`) REFERENCES `Patrons` (`patron_id`),
  CONSTRAINT `Accounts_ibfk_2` FOREIGN KEY (`lib_id`) REFERENCES `Libraries` (`lib_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts`
--

LOCK TABLES `Accounts` WRITE;
/*!40000 ALTER TABLE `Accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books` (
  `ISBN` varchar(50) NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `edition` varchar(20) NOT NULL,
  `reserved` tinyint(1) NOT NULL,
  PRIMARY KEY (`ISBN`),
  CONSTRAINT `Books_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `Publications` (`pub_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
INSERT INTO `LibraryDb`.`Books` VALUES ('B1','Pub1','1',1),('B2','Pub2','2',0),('B3','Pub3','3',1),('B4','Pub4','4',0);
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cam_checkout`
--

DROP TABLE IF EXISTS `Cam_checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cam_checkout` (
  `patron_id` varchar(50) NOT NULL,
  `cam_id` varchar(25) NOT NULL,
  `out_date` date NOT NULL,
  `due_date` date NOT NULL,
  PRIMARY KEY (`patron_id`,`cam_id`),
  KEY `cam_id` (`cam_id`),
  CONSTRAINT `Cam_checkout_ibfk_1` FOREIGN KEY (`patron_id`) REFERENCES `Patrons` (`patron_id`),
  CONSTRAINT `Cam_checkout_ibfk_2` FOREIGN KEY (`cam_id`) REFERENCES `Cameras` (`cam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cam_checkout`
--

LOCK TABLES `Cam_checkout` WRITE;
/*!40000 ALTER TABLE `Cam_checkout` DISABLE KEYS */;
INSERT INTO `Cam_checkout` VALUES ('S1','CA1','2015-11-06','2015-11-12'),('S2','CA3','2015-10-16','2015-10-22'),('S3','CA2','2015-10-30','2015-11-05');
/*!40000 ALTER TABLE `Cam_checkout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cameras`
--

DROP TABLE IF EXISTS `Cameras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cameras` (
  `cam_id` varchar(25) NOT NULL,
  `make` varchar(20) NOT NULL,
  `model` varchar(20) NOT NULL,
  `memory_available` varchar(10) NOT NULL,
  `lens_config` varchar(20) NOT NULL,
  PRIMARY KEY (`cam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cameras`
--

LOCK TABLES `Cameras` WRITE;
/*!40000 ALTER TABLE `Cameras` DISABLE KEYS */;
INSERT INTO `Cameras` VALUES ('CA1','Olympus','E-620','16G','14­42mm lens 1:3.5­5'),('CA2','Canon','EOS Rebel T4i','32G','18­135mm EF­S IS STM'),('CA3','Canon','EOS Rebel T4i','32G','18­135mm EF­S IS STM');
/*!40000 ALTER TABLE `Cameras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Conference_Proceedings`
--

DROP TABLE IF EXISTS `Conference_Proceedings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Conference_Proceedings` (
  `conf_num` varchar(50) NOT NULL,
  `conf_name` varchar(200) NOT NULL,
  PRIMARY KEY (`conf_num`),
  CONSTRAINT `Conference_Proceedings_ibfk_1` FOREIGN KEY (`conf_num`) REFERENCES `Publications` (`pub_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Conference_Proceedings`
--

LOCK TABLES `Conference_Proceedings` WRITE;
/*!40000 ALTER TABLE `Conference_Proceedings` DISABLE KEYS */;
INSERT INTO `LibraryDb`.`Conference_Proceedings` VALUES ('C1','WWW'),('C2','SIGMOD');
/*!40000 ALTER TABLE `Conference_Proceedings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Courses`
--

DROP TABLE IF EXISTS `Courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Courses` (
  `course_id` varchar(20) NOT NULL,
  `faculty_id` varchar(50) DEFAULT NULL,
  `book_name` varchar(50) NOT NULL,
  PRIMARY KEY (`course_id`),
  CONSTRAINT `Courses_ibfk_1` FOREIGN KEY(`faculty_id`) REFERENCES `Faculty` (`faculty_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courses`
--

LOCK TABLES `Courses` WRITE;
/*!40000 ALTER TABLE `Courses` DISABLE KEYS */;
INSERT INTO `Courses` VALUES ('CH101','F1','Introduction to Chemistry'),('CH102','F2','Introduction to Organic Chemistry'),('CH103','F3','Introduction to Physical Chemistry'),('CH104','F4','Introduction to Inorganic Chemistry');
/*!40000 ALTER TABLE `Courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `E_copy_checkout`
--

DROP TABLE IF EXISTS `E_copy_checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `E_copy_checkout` (
	`pub_id` varchar(50) NOT NULL,
    `patron_id` varchar(50) NOT NULL,
    `checkout` datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`pub_id`,`patron_id`),
    CONSTRAINT `E_copy_checkout_ibfk_1` FOREIGN KEY (`pub_id`) REFERENCES `Publications` (`pub_id`),
    CONSTRAINT `E_copy_checkout_ibfk_2` FOREIGN KEY (`patron_id`) REFERENCES `Patrons` (`patron_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Enrolled_in`
--

DROP TABLE IF EXISTS `Enrolled_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Enrolled_in` (
  `student_id` varchar(50) NOT NULL,
  `course_id` varchar(20) NOT NULL,
  PRIMARY KEY (`student_id`,`course_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `Enrolled_in_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `Students` (`student_id`),
  CONSTRAINT `Enrolled_in_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Enrolled_in`
--

LOCK TABLES `Enrolled_in` WRITE;
/*!40000 ALTER TABLE `Enrolled_in` DISABLE KEYS */;
INSERT INTO `Enrolled_in` VALUES ('S1','CH101'),('S2','CH101'),('S3','CH101'),('S2','CH102'),('S3','CH102'),('S4','CH102'),('S1','CH103'),('S3','CH103'),('S4','CH103'),('S1','CH104'),('S2','CH104'),('S4','CH104');
/*!40000 ALTER TABLE `Enrolled_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Faculty` (
  `faculty_id` varchar(50) NOT NULL,
  KEY `faculty_id` (`faculty_id`),
  CONSTRAINT `Faculty_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `Patrons` (`patron_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES ('F1'),('F2'),('F3'),('F4');
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Journals`
--

DROP TABLE IF EXISTS `Journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Journals` (
  `ISSN` varchar(50) NOT NULL,
  PRIMARY KEY (`ISSN`),
  CONSTRAINT `Journals_ibfk_1` FOREIGN KEY (`ISSN`) REFERENCES `Publications` (`pub_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Journals`
--

LOCK TABLES `Journals` WRITE;
/*!40000 ALTER TABLE `Journals` DISABLE KEYS */;
INSERT INTO `LibraryDb`.`Journals` VALUES ('J1'),('J2');
/*!40000 ALTER TABLE `Journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Libraries`
--

DROP TABLE IF EXISTS `Libraries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Libraries` (
  `lib_id` smallint(6) NOT NULL,
  `lib_name` varchar(20) NOT NULL,
  PRIMARY KEY (`lib_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Libraries`
--

LOCK TABLES `Libraries` WRITE;
/*!40000 ALTER TABLE `Libraries` DISABLE KEYS */;
INSERT INTO `Libraries` VALUES (1,'D. H. Hill'),(2,'J. B. Hunt');
/*!40000 ALTER TABLE `Libraries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Library_Cameras`
--

DROP TABLE IF EXISTS `Library_Cameras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Library_Cameras` (
  `cam_id` varchar(25) NOT NULL,
  `lib_id` smallint(6) NOT NULL,
  `status` varchar(25) NOT NULL,
  PRIMARY KEY (`cam_id`,`lib_id`),
  KEY `lib_id` (`lib_id`),
  CONSTRAINT `Library_Cameras_ibfk_1` FOREIGN KEY (`cam_id`) REFERENCES `Cameras` (`cam_id`),
  CONSTRAINT `Library_Cameras_ibfk_2` FOREIGN KEY (`lib_id`) REFERENCES `Libraries` (`lib_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Library_Cameras`
--

LOCK TABLES `Library_Cameras` WRITE;
/*!40000 ALTER TABLE `Library_Cameras` DISABLE KEYS */;
INSERT INTO `Library_Cameras` VALUES ('CA1',2,'Available'),('CA2',2,'Available'),('CA3',2,'Checked Out');
/*!40000 ALTER TABLE `Library_Cameras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Library_Publications`
--

DROP TABLE IF EXISTS `Library_Publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Library_Publications` (
  `pub_id` varchar(50) NOT NULL,
  `lib_id` smallint(6) NOT NULL,
  `number_available` smallint(6) NOT NULL,
  PRIMARY KEY (`pub_id`,`lib_id`),
  KEY `lib_id` (`lib_id`),
  CONSTRAINT `Library_Publications_ibfk_1` FOREIGN KEY (`pub_id`) REFERENCES `Publications` (`pub_id`),
  CONSTRAINT `Library_Publications_ibfk_2` FOREIGN KEY (`lib_id`) REFERENCES `Libraries` (`lib_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Library_Publications`
--

LOCK TABLES `Library_Publications` WRITE;
/*!40000 ALTER TABLE `Library_Publications` DISABLE KEYS */;
INSERT INTO `Library_Publications` VALUES ('B1',1,2),('B1',2,2),('B2',1,2),('B2',2,2),('B3',1,2),('B3',2,2),('B4',1,2),('B4',2,2),('J1',1,1),('J1',2,1),('J2',1,1),('J2',2,1),('C1',1,1),('C1',2,1),('C2',1,1),('C2',2,1);
/*!40000 ALTER TABLE `Library_Publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Library_Rooms`
--

DROP TABLE IF EXISTS `Library_Rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Library_Rooms` (
  `lib_id` smallint(6) NOT NULL,
  `room_no` varchar(6) NOT NULL,
  `position_floor` smallint(6) NOT NULL,
  `type` enum('Conference','Study') NOT NULL,
  `capacity` smallint(6) NOT NULL,
  `status` varchar(25) NOT NULL,
  PRIMARY KEY (`lib_id`,`room_no`),
  CONSTRAINT `Library_Rooms_ibfk_1` FOREIGN KEY (`lib_id`) REFERENCES `Libraries` (`lib_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Library_Rooms`
--

LOCK TABLES `Library_Rooms` WRITE;
/*!40000 ALTER TABLE `Library_Rooms` DISABLE KEYS */;
INSERT INTO `Library_Rooms` VALUES (2,'R1',3,'Conference',2,'Available'),(2,'R2',3,'Study',3,'Available'),(1,'R3',2,'Study',4,'Available'),(2,'R4',3,'Conference',3,'Available'),(2,'R5',3,'Study',4,'Available'),(1,'R6',3,'Study',4,'Available'),(2,'R7',2,'Study',2,'Available');
/*!40000 ALTER TABLE `Library_Rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patron_Addresses`
--

DROP TABLE IF EXISTS `Student_Addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student_Addresses` (
  `student_id` varchar(50) NOT NULL,
  `address_line1` varchar(100) NOT NULL,
  `address_line2` varchar(200) DEFAULT NULL,
  `postal_code` int(11) NOT NULL,
  `city` varchar(30) NOT NULL,
  PRIMARY KEY (`student_id`,`address_line1`,`postal_code`),
  CONSTRAINT `Patron_Addresses_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `Patrons` (`patron_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patron_Addresses`
--

LOCK TABLES `Student_Addresses` WRITE;
/*!40000 ALTER TABLE `Student_Addresses` DISABLE KEYS */;
INSERT INTO `Student_Addresses` VALUES ('S1','1511 Graduate Lane','NC',27606,'Raleigh'),('S2','1512 Graduate Lane','NC',27606,'Raleigh'),('S3','1513 Graduate Lane','NC',27606,'Raleigh'),('S4','1514 Graduate Lane','NC',27606,'Raleigh');
/*!40000 ALTER TABLE `Student_Addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patrons`
--

DROP TABLE IF EXISTS `Patrons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patrons` (
  `patron_id` varchar(50) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `nationality` varchar(45) NOT NULL,
  `phone_no` char(20) DEFAULT NULL,
  `alternate_phone` char(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `department` varchar(45) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `sex` enum('Male','Female') DEFAULT NULL,
  PRIMARY KEY (`patron_id`),
  UNIQUE (`user_id`,`password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patrons`
--

LOCK TABLES `Patrons` WRITE;
/*!40000 ALTER TABLE `Patrons` DISABLE KEYS */;
INSERT INTO `Patrons` VALUES ('F1','wwhite','wwhite','Walter','White','American',NULL,NULL,NULL,'Chemistry','Professor',NULL),('F2','gfring','gfring','Gustavo','Fring','American',NULL,NULL,NULL,'Chemistry','Assistant Professor',NULL),('F3','hschrad','hschrad','Hank','Schrader','American',NULL,NULL,NULL,'Chemistry','Associate Professor',NULL),('F4','swhite','swhite','Skyler','White','American',NULL,NULL,NULL,'Chemistry','Professor',NULL),('S1','jpink','jpink','Jesse','Pinkman','American','123456789','123456787','1988-10-03','Chemistry','First Year','Male'),('S2','wjr','wjr','Walt','Jr.','American','123456780','123456781','1988-11-03','Chemistry','Second Year','Male'),('S3','gboet','gboet','Gale','Boetticher','Chile','123456782','123456783','1988-12-03','Chemistry','Third Year','Male'),('S4','sgood','sgood','Saul','Goodman','American','123456784','123456785','1988-01-03','Chemistry','Second Year','Male');
/*!40000 ALTER TABLE `Patrons` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Insert_Faculty AFTER Insert on LibraryDb.Patrons FOR EACH ROW IF NEW.category LIKE "%Professor%" THEN Insert Into Faculty Values (new.patron_id); END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Pub_Authors`
--

DROP TABLE IF EXISTS `Pub_Authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pub_Authors` (
  `pub_id` varchar(50) NOT NULL,
  `author_name` varchar(100) NOT NULL,
  PRIMARY KEY (`pub_id`,`author_name`),
  CONSTRAINT `Pub_Authors_ibfk_1` FOREIGN KEY (`pub_id`) REFERENCES `Publications` (`pub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pub_Authors`
--

LOCK TABLES `Pub_Authors` WRITE;
/*!40000 ALTER TABLE `Pub_Authors` DISABLE KEYS */;
INSERT INTO `LibraryDb`.`Pub_Authors` VALUES ('B1','SK Goyal'),('B2','HC Verma'),('B3','Resnick Halliday Walker'),('B4','RC Mukherjee'),('J1','Roberto Navigli'),('J2','Tim Berners Lee'),('C1','HyeongSik Kim'),('C2','Sidan Gao');
/*!40000 ALTER TABLE `Pub_Authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pub_checkout`
--

DROP TABLE IF EXISTS `Pub_checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pub_checkout` (
  `patron_id` varchar(50) NOT NULL,
  `pub_id` varchar(50) NOT NULL,
  `out_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `due_date` datetime NOT NULL,
  `status` varchar(25) NOT NULL,
  PRIMARY KEY (`patron_id`,`pub_id`),
  KEY `pub_id` (`pub_id`),
  CONSTRAINT `Pub_checkout_ibfk_1` FOREIGN KEY (`patron_id`) REFERENCES `Patrons` (`patron_id`),
  CONSTRAINT `Pub_checkout_ibfk_2` FOREIGN KEY (`pub_id`) REFERENCES `Publications` (`pub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pub_checkout`
--

LOCK TABLES `Pub_checkout` WRITE;
/*!40000 ALTER TABLE `Pub_checkout` DISABLE KEYS */;
INSERT INTO `Pub_checkout` VALUES ('S1','B2','2015-11-01','2015-11-08','Available'),('S4','B4','2015-11-01','2015-11-06','Available'),('S2','B2','2015-07-01','2015-08-08','Available'),('S3','B2','2015-10-01','2015-10-10','Available');
/*!40000 ALTER TABLE `Pub_checkout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publications`
--

DROP TABLE IF EXISTS `Publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publications` (
  `pub_id` varchar(50) NOT NULL,
  `title` varchar(100) NOT NULL,
  `pub_year` year(4) NOT NULL,
  `category` enum('Book','Conference Proceeding','Journal') NOT NULL,
  `e_copy` tinyint(1) DEFAULT 0,
  `number_available` smallint(6),
  PRIMARY KEY (`pub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publications`
--

LOCK TABLES `Publications` WRITE;
/*!40000 ALTER TABLE `Publications` DISABLE KEYS */;
INSERT INTO `LibraryDb`.`Publications` VALUES ('B1','Introduction to Chemistry',2005,'Book',1,2),('B2','Introduction to Organic Chemistry',2006,'Book',1,2),('B3','Introduction to Physical Chemistry',2000,'Book',0,2),('B4','Introduction to Inorganic Chemistry',2005,'Book',0,2),('J1','Journal of Web Semantic',2010,'Journal',1,1),('J2','International Journal on Semantic Web and Information',2011,'Journal',1,1),('C1','Optimization Techniques for Large Scale Graph Analytics on Map Reduce',2013,'Conference Proceeding',1,1),('C2','An agglomerative query model for discovery in linked data: semantics and approach',2014,'Conference Proceeding',1,1);
/*!40000 ALTER TABLE `Publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room_Reservations`
--

DROP TABLE IF EXISTS `Room_Reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Room_Reservations` (
  `patron_id` varchar(50) NOT NULL,
  `lib_id` smallint(6) NOT NULL,
  `room_no` varchar(6) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`patron_id`,`lib_id`,`room_no`),
  KEY `lib_id` (`lib_id`,`room_no`),
  CONSTRAINT `Room_Reservations_ibfk_1` FOREIGN KEY (`patron_id`) REFERENCES `Patrons` (`patron_id`),
  CONSTRAINT `Room_Reservations_ibfk_2` FOREIGN KEY (`lib_id`, `room_no`) REFERENCES `Library_Rooms` (`lib_id`, `room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room_Reservations`
--

LOCK TABLES `Room_Reservations` WRITE;
/*!40000 ALTER TABLE `Room_Reservations` DISABLE KEYS */;
INSERT INTO `Room_Reservations` VALUES ('F1',1,'R3','2015-10-10','09:00:00','11:30:00'),('S1',2,'R5','2015-10-12','15:00:00','17:00:00'),('F4',1,'R6','2015-10-15','11:00:00','13:30:00'),('F2',2,'R1','2015-10-20','09:00:00','10:30:00');
/*!40000 ALTER TABLE `Room_Reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Students` (
  `student_id` varchar(50) NOT NULL,
  `degree` varchar(50) NOT NULL,
  `class` enum('Undergraduate','Graduate','Postgraduate') NOT NULL,
  PRIMARY KEY (`student_id`),
  CONSTRAINT `Students_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `Patrons` (`patron_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES ('S1','BS','Undergraduate'),('S2','BS','Undergraduate'),('S3','BS','Undergraduate'),('S4','MS','Graduate');
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teaches`
--

DROP TABLE IF EXISTS `Teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teaches` (
  `faculty_id` varchar(50) NOT NULL,
  `course_id` varchar(20) NOT NULL,
  PRIMARY KEY (`faculty_id`,`course_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `Teaches_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `Faculty` (`faculty_id`),
  CONSTRAINT `Teaches_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `Courses` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teaches`
--

LOCK TABLES `Teaches` WRITE;
/*!40000 ALTER TABLE `Teaches` DISABLE KEYS */;
INSERT INTO `Teaches` VALUES ('F1','CH101'),('F2','CH102'),('F3','CH103'),('F4','CH104');
/*!40000 ALTER TABLE `Teaches` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-23 18:58:24
