-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: friend
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `custmer01`
--

DROP TABLE IF EXISTS `custmer01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custmer01` (
  `id` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(10) NOT NULL,
  `age` varchar(3) DEFAULT NULL,
  `job` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custmer01`
--

LOCK TABLES `custmer01` WRITE;
/*!40000 ALTER TABLE `custmer01` DISABLE KEYS */;
INSERT INTO `custmer01` VALUES ('1','1','홍길동','33','목수'),('2','2','김유신','2','목수'),('3','3','김감수','22','무직'),('4','4','테스트','3','무직');
/*!40000 ALTER TABLE `custmer01` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `content` varchar(100) NOT NULL,
  `writer` varchar(15) NOT NULL,
  `date` datetime NOT NULL,
  `hits` int NOT NULL DEFAULT '0',
  `recommend` int NOT NULL DEFAULT '0',
  `pw` varchar(20) NOT NULL,
  `replyNum` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (9,'test','tset','홍길동','2022-12-27 11:27:22',85,0,'',2),(10,'tset','test','홍길동','2022-12-27 11:29:08',63,0,'',0),(11,'hi','hi','a','2022-12-27 11:39:51',16,0,'',0),(12,'11','11','홍길동','2022-12-27 12:25:21',121,0,'',5),(13,'dd','dd','홍길동','2022-12-27 12:26:01',106,0,'',0),(14,'tset','ste','홍길동','2022-12-27 12:27:54',5,0,'',0),(16,'3','ㅁㅁ','홍길동','2022-12-27 16:54:16',1,0,'',0),(17,'asdf','abce','홍길동','2022-12-28 14:18:48',0,0,'',0),(18,'테스트','테스트','홍길동','2022-12-28 16:18:29',12,0,'',0),(19,'dd','zz','ㅇㅇ','2022-12-29 15:07:23',1,0,'dddd',0),(20,'dd','test','ㅇㅇ','2022-12-29 15:30:54',1,0,'1',0);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `replyindex` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) NOT NULL,
  `contents` varchar(100) NOT NULL,
  `post_idx` int NOT NULL,
  `date` varchar(30) NOT NULL,
  PRIMARY KEY (`replyindex`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (19,'b','bbb',12,'12.29 15:54:07'),(20,'c','ccc',12,'12.29 15:56:29'),(21,'c','ccc',12,'12.29 16:06:23'),(22,'c','ccc',12,'12.29 16:07:30'),(23,'홍길동','ㅎㅎ',12,'12.29 17:09:48');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-29 17:26:46
