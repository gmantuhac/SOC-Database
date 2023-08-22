-- MySQL dump 10.13  Distrib 8.1.0, for macos13 (x86_64)
--
-- Host: localhost    Database: first
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `building_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `code_name` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`building_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'Computer Science and Engineering Building','EBU3B'),(2,'Catalyst','CTL'),(3,'Applied Physics and Mathematics','APM'),(4,'Warren Lecture Hall','WLH'),(5,'Franklin Antonio Hall','FAH'),(6,'Pepper Canyon Hall','PCYNH'),(7,'Conrad Prebys Music Center','CPMC'),(8,'Mandeville Center','MANDE'),(9,'Price Center','PRICE'),(10,'Design and Innovation Building','DIB'),(11,'Center Hall','CENTR'),(12,'Mosaic','MOS'),(13,'Peterson Hall','PETER'),(14,'Ledden Auditorium','LEDDN');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `division` varchar(15) DEFAULT NULL,
  `dept_id` varchar(6) NOT NULL,
  `qtr_id` int DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `course_ibfk_1` (`dept_id`),
  KEY `course_ibfk_2` (`qtr_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE CASCADE,
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`qtr_id`) REFERENCES `quarter` (`qtr_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Data Science in Practice','COGS 108','Upper Division','000266',3),(2,'Fundementals of Music A','MUS 1A','Lower Division','000213',1),(3,'Intro to Programming 1','CSE 8A','Lower Division','000158',2),(4,'Developmental Psychology','PSYC 101','Upper Division','000222',2),(5,'Mathematical Reasoning','MATH 109','Upper Division','000212',2),(6,'Vector Calculus','MATH 20E','Lower Division','000212',1),(7,'Material and Energy Balances','CENG 100','Upper Division','000158',4);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` varchar(6) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('000158','Jacobs School of Engineering'),('000212','Mathematics'),('000213','Music'),('000222','Psychology'),('000266','Cognitive Science');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `final`
--

DROP TABLE IF EXISTS `final`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `final` (
  `final_id` int NOT NULL AUTO_INCREMENT,
  `days` varchar(2) NOT NULL,
  `time` varchar(15) NOT NULL,
  `building_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `final_date` date NOT NULL,
  PRIMARY KEY (`final_id`),
  KEY `final_ibfk_1` (`building_id`),
  KEY `final_ibfk_2` (`room_id`),
  CONSTRAINT `final_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`) ON DELETE SET NULL,
  CONSTRAINT `final_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `final`
--

LOCK TABLES `final` WRITE;
/*!40000 ALTER TABLE `final` DISABLE KEYS */;
INSERT INTO `final` VALUES (1,'Th','3:00p-5:59p',4,13,'2023-03-23'),(2,'M','3:00p-5:59p',5,18,'2023-03-20'),(3,'S','11:30a-2:29p',11,16,'2023-08-05'),(4,'Th','3:00p-5:59p',2,17,'2023-03-23'),(5,'Th','8:00a-10:59a',7,3,'2022-12-08'),(6,'M','8:00a-10:59a',9,4,'2023-06-12'),(7,'Th','11:30a-2:29p',12,6,'2022-12-08');
/*!40000 ALTER TABLE `final` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `instructor_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) DEFAULT NULL,
  `dept_id` varchar(6) NOT NULL,
  `email` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`instructor_id`),
  KEY `instructor_ibfk_1` (`dept_id`),
  CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1,'Opatkiewicz, Justin Paul','000158','jopatkiewicz@ucsd.edu'),(2,'Schneider, Berk Waldemar','000213','bwschneider@ucsd.edu'),(3,'Fleischer, Jason G','000266','jfleischer@ucsd.edu'),(4,'Kongsgaard, Daniel','000212','dakongsgaard@ucsd.edu'),(5,'Aliabadi Sr., Mohsen','000212','maliabadisr@ucsd.edu'),(6,'Elsherif, May Elhussein','000158','melsherif@ucsd.edu'),(7,'Walker, Caren Michelle','000222','cmwalker@ucsd.edu');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecture`
--

DROP TABLE IF EXISTS `lecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecture` (
  `lecture_id` int NOT NULL AUTO_INCREMENT,
  `days` varchar(10) DEFAULT NULL,
  `time` varchar(15) DEFAULT NULL,
  `course_id` int NOT NULL,
  `instructor_id` int DEFAULT NULL,
  `building_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `midterm_id` int DEFAULT NULL,
  `final_id` int DEFAULT NULL,
  PRIMARY KEY (`lecture_id`),
  KEY `lecture_ibfk_1` (`course_id`),
  KEY `lecture_ibfk_2` (`instructor_id`),
  KEY `lecture_ibfk_3` (`building_id`),
  KEY `lecture_ibfk_4` (`room_id`),
  KEY `lecture_ibfk_5` (`midterm_id`),
  KEY `lecture_ibfk_6` (`final_id`),
  CONSTRAINT `lecture_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE,
  CONSTRAINT `lecture_ibfk_2` FOREIGN KEY (`instructor_id`) REFERENCES `instructor` (`instructor_id`) ON DELETE SET NULL,
  CONSTRAINT `lecture_ibfk_3` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`) ON DELETE SET NULL,
  CONSTRAINT `lecture_ibfk_4` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE SET NULL,
  CONSTRAINT `lecture_ibfk_5` FOREIGN KEY (`midterm_id`) REFERENCES `midterm` (`midterm_id`) ON DELETE SET NULL,
  CONSTRAINT `lecture_ibfk_6` FOREIGN KEY (`final_id`) REFERENCES `final` (`final_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecture`
--

LOCK TABLES `lecture` WRITE;
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
INSERT INTO `lecture` VALUES (1,'TuTh','9:30a-10:50a',2,2,7,3,NULL,5),(2,'MWF','12:00p-12:50p',6,4,12,6,NULL,7),(3,'MTuWTh','12:30p-1:50p',7,1,11,16,NULL,3),(4,'TuTh','2:00p-3:20p',3,6,4,13,1,1),(5,'MWF','10:00a-10:50a',1,3,9,4,NULL,6),(6,'MWF','2:00p-2:50p',5,5,5,18,NULL,2),(7,'TuTh','2:00p-3:20p',4,7,2,17,NULL,4),(8,'F','11:00a-1:50p',7,1,11,16,NULL,3);
/*!40000 ALTER TABLE `lecture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `midterm`
--

DROP TABLE IF EXISTS `midterm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `midterm` (
  `midterm_id` int NOT NULL AUTO_INCREMENT,
  `days` varchar(2) NOT NULL,
  `time` varchar(15) NOT NULL,
  `building_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `midterm_date` date NOT NULL,
  PRIMARY KEY (`midterm_id`),
  KEY `midterm_ibfk_1` (`building_id`),
  KEY `midterm_ibfk_2` (`room_id`),
  CONSTRAINT `midterm_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`) ON DELETE SET NULL,
  CONSTRAINT `midterm_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `midterm`
--

LOCK TABLES `midterm` WRITE;
/*!40000 ALTER TABLE `midterm` DISABLE KEYS */;
INSERT INTO `midterm` VALUES (1,'F','10:00a-11:50a',14,15,'2023-02-10');
/*!40000 ALTER TABLE `midterm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quarter`
--

DROP TABLE IF EXISTS `quarter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quarter` (
  `qtr_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `year` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `instr_date` date DEFAULT NULL,
  PRIMARY KEY (`qtr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarter`
--

LOCK TABLES `quarter` WRITE;
/*!40000 ALTER TABLE `quarter` DISABLE KEYS */;
INSERT INTO `quarter` VALUES (1,'Fall Quarter',2022,'2022-09-19','2022-12-10','2022-09-22'),(2,'Winter Quarter',2023,'2023-01-04','2023-03-25','2023-01-09'),(3,'Spring Quarter',2023,'2023-03-29','2023-06-16','2023-04-03'),(4,'Summer Session 1',2023,NULL,'2023-08-05','2023-07-03');
/*!40000 ALTER TABLE `quarter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `room_num` varchar(5) NOT NULL,
  `building_id` int NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `room_ibfk_1` (`building_id`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'217A',11),(2,'2301',3),(3,'136',7),(4,'THTRE',9),(5,'5402',3),(6,'0114',12),(7,'B-150',8),(8,'121',6),(9,'122',10),(10,'103',13),(11,'2155',4),(12,'B250',1),(13,'2005',4),(14,'205',11),(15,'AUD',14),(16,'218',11),(17,'0125',2),(18,'1101',5),(19,'102',13),(20,'265',7);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `section_id` int NOT NULL,
  `section_name` varchar(3) NOT NULL,
  `meeting_type` varchar(2) NOT NULL,
  `days` varchar(5) DEFAULT NULL,
  `time` varchar(15) DEFAULT NULL,
  `lecture_id` int NOT NULL,
  `building_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `avail_seats` int DEFAULT '0',
  `total_seats` int DEFAULT '0',
  `waitlist_count` int DEFAULT '0',
  PRIMARY KEY (`section_id`,`section_name`),
  KEY `section_ibfk_1` (`lecture_id`),
  KEY `section_ibfk_2` (`building_id`),
  KEY `section_ibfk_3` (`room_id`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`lecture_id`) REFERENCES `lecture` (`lecture_id`) ON DELETE CASCADE,
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`) ON DELETE SET NULL,
  CONSTRAINT `section_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (89488,'B01','DI','F','4:00p-4:50p',2,11,14,1,30,0),(89489,'B02','DI','F','5:00p-5:50p',2,11,14,3,30,0),(89490,'B03','DI','F','6:00p-6:50p',2,11,14,0,30,0),(89491,'B04','DI','F','7:00p-7:50p',2,11,14,4,30,0),(89492,'B05','DI','F','4:00p-4:50p',2,11,1,1,30,0),(89493,'B06','DI','F','5:00p-5:50p',2,11,1,1,30,0),(89494,'B07','DI','F','6:00p-6:50p',2,11,1,0,30,0),(89495,'B08','DI','F','7:00p-7:50p',2,11,1,2,30,0),(90497,'A01','LA','MW','9:00a-9:50a',1,7,20,2,25,0),(90498,'A02','LA','MW','10:00a-10:50a',1,7,20,1,25,0),(90499,'A03','LA','WF','11:00a-11:50a',1,7,20,2,25,0),(90500,'A04','LA','WF','12:00p-12:50p',1,7,20,4,25,0),(90501,'A05','LA','MW','9:00a-9:50a',1,4,11,2,25,0),(90502,'A06','LA','WF','11:00a-11:50a',1,4,11,1,25,0),(97874,'D01','DI','W','4:00p-4:50p',6,3,2,1,34,0),(97875,'D02','DI','W','5:00p-5:50p',6,3,5,0,34,1),(101575,'A50','LA','W','9:00a-9:50a',4,1,12,0,49,6),(101578,'A51','LA','W','10:00a-10:50a',4,1,12,0,49,9),(101592,'A52','LA','W','11:00a-11:50a',4,1,12,0,49,7),(101600,'A53','LA','W','12:00p-12:50p',4,1,12,0,49,5),(124260,'A01','LA','W','5:00p-5:50p',5,13,10,0,60,5),(124397,'A02','LA','W','11:00a-11:50a',5,8,7,0,60,5),(124398,'A03','LA','M','1:00p-1:50p',5,10,9,0,60,8),(124409,'A04','LA','M','2:00p-2:50p',5,10,9,0,60,3),(124420,'A05','LA','W','2:00p-2:50p',5,6,8,0,60,1),(124471,'A06','LA','W','3:00p-3:50p',5,6,8,0,60,5),(124481,'A07','LA','W','4:00p-4:50p',5,13,19,0,60,5);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-21 20:31:38
