-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: notice_board
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `catagories`
--

DROP TABLE IF EXISTS `catagories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catagories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catagories`
--

LOCK TABLES `catagories` WRITE;
/*!40000 ALTER TABLE `catagories` DISABLE KEYS */;
/*!40000 ALTER TABLE `catagories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expiry_date` date DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `priority` varchar(20) DEFAULT 'normal',
  `department` varchar(50) DEFAULT NULL,
  `class` varchar(20) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `notices_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
INSERT INTO `notices` VALUES (1,'Exam Schedule','Mid sem exam start from 24th march','exam','2026-03-18 14:27:25','2026-04-01',1,'normal',NULL,NULL,NULL,NULL),(2,'Tech fest','annual tech fest registration open','event','2026-03-18 14:27:25','2026-03-30',1,'normal',NULL,NULL,NULL,NULL),(3,'placement drive','TCS hiring drive this week','placement','2026-03-18 14:27:25','2026-03-25',1,'normal',NULL,NULL,NULL,NULL),(10,'holiday','holiday on ocassion of gudi padwa','holiday','2026-03-19 08:27:04','2026-03-20',1,'normal',NULL,NULL,NULL,NULL),(11,'exam ','exam on 23rd march','exam schedule','2026-03-21 08:09:01','2026-03-23',1,'normal',NULL,NULL,NULL,NULL),(12,'result','all subject results are declaired','exam','2026-03-22 15:40:31','2026-03-31',1,'urgent',NULL,NULL,NULL,NULL),(13,'time table','your time table is updated','class','2026-03-22 17:15:54','2026-03-29',1,'important',NULL,NULL,NULL,NULL),(14,'demo','demo','demp','2026-03-22 17:42:31','2026-03-27',1,'urgent','mba',NULL,NULL,NULL),(15,'demo1','demo1','demo1','2026-03-22 17:43:36','2026-03-31',1,'urgent','mba',NULL,NULL,NULL),(16,'event','vishwakarma university announcing an event called\"dikshabhui\" all students from mca and mba are invited ','event','2026-03-27 09:09:44','2026-03-31',1,'normal','mca','FY',NULL,NULL),(17,'demo1','demo11111','exam','2026-04-05 06:47:25','2026-04-30',1,'urgent',NULL,NULL,'1775371645_Untitled-1.pdf','http://google.com'),(18,'demo2','demo2','holiday','2026-04-05 07:00:06','2026-04-30',1,'normal',NULL,NULL,'1775372406_V2_A22.pdf','http://google.com'),(19,'demooo3','demooo3','holiday','2026-04-05 07:10:30','2026-04-28',1,'normal',NULL,NULL,'1775373030_V2_A22.pdf','http://google.com'),(20,'test','test notice','test','2026-04-20 06:40:49','2026-05-07',5,'urgent','MCA',NULL,'1776667249_V2_A2.pdf',''),(21,'test3','test3','test','2026-04-20 07:35:15','2026-04-30',1,'normal',NULL,NULL,NULL,''),(22,'demo notice','demo notice','exam','2026-04-23 06:00:25','2026-05-10',1,'urgent',NULL,NULL,'1776924025_Artboard_1.pdf',''),(23,'College Reopening Notice','College Reopening Notice\r\nAll students are hereby informed that the college will reopen from 10th June 2026 after summer vacation. Regular lectures will be conducted as per the timetable. Students are advised to maintain attendance and follow all academic guidelines.','College Reopening Notice','2026-04-23 19:30:10','2026-04-30',1,'normal',NULL,NULL,NULL,''),(24,'Semester Examination Schedule','The Semester End Examination will commence from 15th May 2026. Students must download their hall tickets from the student portal. Carrying ID cards is mandatory during exams. Any malpractice will lead to strict action.','Exam','2026-04-23 19:31:10','2026-04-30',1,'urgent',NULL,NULL,NULL,''),(25,'Annual Cultural Fest 2026','We are excited to announce our Annual Cultural Fest “Aarambh 2026” from 20th to 22nd April. Events include dance, drama, music, gaming, and more. Interested students can register through the college website before 15th April.','Event','2026-04-23 19:31:53','2026-04-30',1,'important',NULL,NULL,NULL,''),(26,'exam','exam is schedules on 6th may','exam','2026-04-24 06:55:33','2026-04-30',1,'important',NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','student') DEFAULT 'student',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `department` varchar(50) DEFAULT NULL,
  `class` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@gmail.com','admin123','admin','2026-03-18 08:43:02',NULL,NULL),(5,'rohan',NULL,'rohan123','student','2026-03-22 17:41:33','MCA',NULL),(6,'anurag',NULL,'anurag123','student','2026-03-23 07:44:03','MBA','SY'),(7,'abhishek',NULL,'abhishek','student','2026-04-23 06:05:02','MCA','FY');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-15 17:46:50
