-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: somativaviniboy
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
-- Table structure for table `tarefa`
--

DROP TABLE IF EXISTS `tarefa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `descrisao` varchar(500) NOT NULL,
  `usuarioFk` bigint NOT NULL,
  `responsavel_fk` bigint NOT NULL,
  `prazo` date NOT NULL,
  `locais_FK` bigint NOT NULL,
  `imagens` mediumtext,
  PRIMARY KEY (`id`),
  KEY `usuarioFk` (`usuarioFk`),
  KEY `responsavel_fk` (`responsavel_fk`),
  KEY `locais_FK` (`locais_FK`),
  CONSTRAINT `tarefa_ibfk_1` FOREIGN KEY (`usuarioFk`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `tarefa_ibfk_2` FOREIGN KEY (`responsavel_fk`) REFERENCES `responsavel` (`id`),
  CONSTRAINT `tarefa_ibfk_3` FOREIGN KEY (`locais_FK`) REFERENCES `locais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefa`
--

LOCK TABLES `tarefa` WRITE;
/*!40000 ALTER TABLE `tarefa` DISABLE KEYS */;
INSERT INTO `tarefa` VALUES (1,'pc','placa-mãe',4,3,'2023-07-31',1,'placaMãeImg'),(2,'tablet','fio-carregador',4,3,'2023-06-10',2,'fioCarregadorRombidoImg'),(3,'ipad','fonte',4,3,'2023-10-20',3,'FonteCarregadorIpad'),(4,'lampada','cabo',5,3,'2023-08-20',4,'BocalLampImg'),(5,'ar-condicionado','filtro',2,3,'2023-07-20',5,'arImg'),(6,'PC3','quebrado',2,1,'2023-01-01',1,'QuebradoPcIMG'),(7,'impressora','cartucho',2,5,'2023-02-10',2,'cartuchoImg'),(8,'Roteador','falhando',4,6,'2023-05-01',5,'RoterImg2'),(9,'monitor','nao-liga',4,2,'2023-05-01',4,'MonitorImg'),(10,'teclado','cabo-usb',3,1,'2023-05-01',2,'FioUsbImg');
/*!40000 ALTER TABLE `tarefa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-03 18:24:21
