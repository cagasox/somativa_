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
-- Table structure for table `tarefas`
--

DROP TABLE IF EXISTS `tarefas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefas` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nome_da_tarefa` varchar(100) DEFAULT NULL,
  `descriçao` varchar(500) DEFAULT NULL,
  `data_de_solicitacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `data_de_inicio` datetime DEFAULT NULL,
  `data_de_fim` datetime DEFAULT NULL,
  `prazo_execucao` datetime DEFAULT NULL,
  `localFK` bigint NOT NULL,
  `responsavelFK` bigint NOT NULL,
  `statusFK` bigint NOT NULL,
  `fotos_tarefasFK` bigint NOT NULL,
  `usuaririosFK` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `localFK` (`localFK`),
  KEY `responsavelFK` (`responsavelFK`),
  KEY `statusFK` (`statusFK`),
  KEY `fotos_tarefasFK` (`fotos_tarefasFK`),
  KEY `usuaririosFK` (`usuaririosFK`),
  CONSTRAINT `tarefas_ibfk_1` FOREIGN KEY (`localFK`) REFERENCES `locais` (`id`),
  CONSTRAINT `tarefas_ibfk_2` FOREIGN KEY (`responsavelFK`) REFERENCES `responsavel` (`id`),
  CONSTRAINT `tarefas_ibfk_3` FOREIGN KEY (`statusFK`) REFERENCES `status_tarefas` (`id`),
  CONSTRAINT `tarefas_ibfk_4` FOREIGN KEY (`fotos_tarefasFK`) REFERENCES `fotos_tarefas` (`id`),
  CONSTRAINT `tarefas_ibfk_5` FOREIGN KEY (`usuaririosFK`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefas`
--

LOCK TABLES `tarefas` WRITE;
/*!40000 ALTER TABLE `tarefas` DISABLE KEYS */;
INSERT INTO `tarefas` VALUES (1,'cabo de internet','cabo com mal contato','2023-06-03 10:19:45',NULL,NULL,'2023-06-03 19:09:42',1,1,1,1,1),(2,'monitor trincado','monitor com a tela trincada','2023-06-03 19:14:45',NULL,NULL,'2023-06-13 19:19:42',2,2,2,2,1),(3,'projetor','HDMI com mal conatato','2023-06-04 10:01:30','2023-06-05 10:21:32','2023-06-03 14:20:52','2025-06-13 19:19:42',1,1,3,3,1),(5,'cabo de internet','cabo com mal contato','2023-06-04 12:20:32',NULL,NULL,'2023-06-23 19:19:42',1,1,7,1,1),(7,'cadeira ','cadeira com a roda encoscando','2023-08-11 19:05:40','2023-08-11 19:15:40','2023-08-11 19:25:56','2025-09-13 00:00:00',1,2,5,5,2),(8,'projetor','HDMI com mal conatato','2025-06-14 10:01:30','2025-06-15 11:00:30','2025-06-16 09:01:30','2025-06-20 00:00:00',1,1,8,3,1);
/*!40000 ALTER TABLE `tarefas` ENABLE KEYS */;
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
