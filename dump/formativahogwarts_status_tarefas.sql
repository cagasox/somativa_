-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: formativahogwarts
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `status_tarefas`
--

DROP TABLE IF EXISTS `status_tarefas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_tarefas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `etapa` tinyint(1) DEFAULT NULL,
  `atualizacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `descricao` varchar(300) DEFAULT NULL,
  `fotostatus` varchar(150) DEFAULT NULL,
  `progressoFK` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `progressoFK` (`progressoFK`),
  CONSTRAINT `status_tarefas_ibfk_1` FOREIGN KEY (`progressoFK`) REFERENCES `pogresso` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_tarefas`
--

LOCK TABLES `status_tarefas` WRITE;
/*!40000 ALTER TABLE `status_tarefas` DISABLE KEYS */;
INSERT INTO `status_tarefas` VALUES (1,1,'2023-04-05 19:05:40','foto cabo','foto 1',1),(2,1,'2023-01-03 08:05:40','foto monitor ','foto 2',1),(3,1,'2023-06-05 10:21:32','foto projetor','foto 3',2),(4,1,'2023-06-10 19:05:40','foto maçaneta','foto 4',2),(5,1,'2023-08-11 19:05:40','foto cadeira','foto 5',4),(6,1,'2023-06-03 10:20:32','foto teclado','foto 6',4),(7,0,'2023-06-04 12:20:32','foto cabo','foto7',1),(8,1,'2023-05-11 19:05:40','projetor','foto8',4);
/*!40000 ALTER TABLE `status_tarefas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-04  1:58:14
