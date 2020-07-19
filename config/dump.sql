-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: node_api
-- ------------------------------------------------------
-- Server version	8.0.20-0ubuntu0.20.04.1

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
-- Current Database: `node_api`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `node_api` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `node_api`;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pseudonimo` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contrasenia` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pseudonimo` (`pseudonimo`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'facu','facu@mail.com','12341234'),(2,'juan','juan@mail.com','abcabc'),(3,'carlos','carlos@mail.com','abc123'),(6,'ignacio','ignacion@mail.com','12341234'),(12,'jose','jose@mail.com','12341234'),(14,'lucia','lucia@mail.com','12341234'),(15,'sofia','sofia@mail.com','sofia1234'),(16,'sojosefina','sojosefina@mail.com','josefina1234'),(17,'miguel','miguel@mail.com','migue1234'),(18,'elias','elias@mail.com','elias1234'),(19,'german','german@mail.com','german1234'),(20,'elena','elena@mail.com','elena1234'),(21,'victor','victor@mail.com','victor1234');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicaciones`
--

DROP TABLE IF EXISTS `publicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicaciones` (
  `publicacion_id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `contenido` varchar(300) NOT NULL,
  `resumen` varchar(60) DEFAULT NULL,
  `autor_id` int NOT NULL,
  PRIMARY KEY (`publicacion_id`),
  KEY `autor_id` (`autor_id`),
  CONSTRAINT `publicaciones_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `autores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicaciones`
--

LOCK TABLES `publicaciones` WRITE;
/*!40000 ALTER TABLE `publicaciones` DISABLE KEYS */;
INSERT INTO `publicaciones` VALUES (1,'Primer Publicacion','Esta es mi primer publicacion con la api NodeJS!','Primer Publicacion NodeJS',1),(5,'titulosadd','contenidoasdf','resumenasddf',6),(6,'tiasdgasdgtulosadd','contenidoasdasfadsf','resumenagfasddf',12),(7,'tiasdgasdgtulosadd','El contenido','resumenagfasddf',12),(8,'tiasdgasdgtulosadd','contenidoasdasfadsf','resumenagfasddf',19),(9,'tiasdgasdgtulosadd','contenidoasdasfadsf','resumenagfasddf',20),(10,'Titulo','Contenido','Resumen',15),(11,'Titulo','Contenido','Resumen',17),(12,'Titulo','Contenido','Resumen',18),(13,'Titulo','Contenido','Resumen',20),(16,'Titulo','Contenido','Resumen',2),(17,'Titulo','Contenido','Resumen',3);
/*!40000 ALTER TABLE `publicaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-19  4:38:46
