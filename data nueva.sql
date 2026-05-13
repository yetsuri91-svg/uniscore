CREATE DATABASE  IF NOT EXISTS `academia_rendimiento` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `academia_rendimiento`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: academia_rendimiento
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
-- Table structure for table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_objetivo` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `porcentaje` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_objetivo` (`id_objetivo`),
  CONSTRAINT `actividad_ibfk_1` FOREIGN KEY (`id_objetivo`) REFERENCES `objetivo_aprendizaje` (`id_obj`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad`
--

LOCK TABLES `actividad` WRITE;
/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` VALUES (1,21,'tggg',20.00),(2,21,'hgnfnfjn',5.00),(3,22,'Nueva Actividadhhh',5.00),(4,22,'ffff',5.00),(5,22,'Nueva Actividad',10.00),(6,22,'Nueva Actividad',5.00),(7,23,'Nueva Actividad',20.00),(8,23,'Nueva Actividad2',5.00),(9,24,'taller',25.00),(10,25,'taller',25.00),(11,26,'taller',25.00),(12,27,'Nueva Actividad',25.00),(13,28,'taller',25.00);
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificacion`
--

DROP TABLE IF EXISTS `calificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estudiante_id` int NOT NULL,
  `corte1` decimal(4,2) DEFAULT '0.00',
  `corte2` decimal(4,2) DEFAULT '0.00',
  `corte3` decimal(4,2) DEFAULT '0.00',
  `corte4` decimal(4,2) DEFAULT '0.00',
  `promedio_final` decimal(4,2) DEFAULT '0.00',
  `materia` varchar(100) DEFAULT NULL,
  `id_objetivo` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_calif_materia` (`materia`),
  KEY `fk_calif_est` (`estudiante_id`),
  KEY `fk_objetivo_cal` (`id_objetivo`),
  CONSTRAINT `fk_calif_est` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_calif_materia` FOREIGN KEY (`materia`) REFERENCES `materias` (`nombre_materia`) ON DELETE RESTRICT,
  CONSTRAINT `fk_objetivo_cal` FOREIGN KEY (`id_objetivo`) REFERENCES `objetivo_aprendizaje` (`id_obj`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion`
--

LOCK TABLES `calificacion` WRITE;
/*!40000 ALTER TABLE `calificacion` DISABLE KEYS */;
INSERT INTO `calificacion` VALUES (165,214,25.00,9.50,25.00,25.00,16.90,'ffvv',NULL),(166,215,5.80,3.80,0.00,0.00,1.92,'ffvv',NULL),(167,216,5.00,5.00,0.00,0.00,2.00,'ffvv',NULL),(168,217,8.00,3.00,0.00,18.80,5.96,'ffvv',NULL),(169,218,9.80,4.80,0.00,25.00,7.92,'ffvv',NULL),(170,219,3.50,3.50,0.00,0.00,1.40,'ffvv',NULL),(171,220,4.30,4.30,0.00,0.00,1.72,'ffvv',NULL),(172,221,2.50,2.50,0.00,0.00,1.00,'ffvv',NULL),(173,222,4.00,4.00,0.00,0.00,1.60,'ffvv',NULL),(174,223,5.00,5.00,0.00,0.00,2.00,'ffvv',NULL),(175,224,25.00,25.00,12.50,6.30,13.76,'matematica',NULL);
/*!40000 ALTER TABLE `calificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profesor_id` int DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `materia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_estudiante_materia` (`cedula`,`materia`,`profesor_id`),
  KEY `profesor_id` (`profesor_id`),
  KEY `idx_estudiante_nombre` (`nombre`),
  KEY `idx_est_materia_prof` (`materia`,`profesor_id`),
  CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`profesor_id`) REFERENCES `profesor` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_est_materia` FOREIGN KEY (`materia`, `profesor_id`) REFERENCES `materias` (`nombre_materia`, `profesor_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (214,7,'Ana Torres','10123456','ana.torres@gmail.com','04141234567','2026-04-29 00:24:17','ffvv'),(215,7,'Luis Pérez','10234567','luis.perez@gmail.com','04145556677','2026-04-29 00:24:17','ffvv'),(216,7,'María Gómez','10345678','maria.gomez@gmail.com','04146667788','2026-04-29 00:24:18','ffvv'),(217,7,'Carlos Rivas','10456789','carlos.rivas@gmail.com','04147778899','2026-04-29 00:24:18','ffvv'),(218,7,'Daniela Ruiz','10567890','daniela.ruiz@gmail.com','04148889900','2026-04-29 00:24:18','ffvv'),(219,7,'José Martínez','10678901','jose.martinez@gmail.com','04149990011','2026-04-29 00:24:18','ffvv'),(220,7,'Laura Sánchez','10789012','laura.sanchez@gmail.com','04141112233','2026-04-29 00:24:18','ffvv'),(221,7,'Pedro López','10890123','pedro.lopez@gmail.com','04142223344','2026-04-29 00:24:19','ffvv'),(222,7,'Sofía Herrera','10901234','sofia.herrera@gmail.com','04143334455','2026-04-29 00:24:19','ffvv'),(223,7,'Miguel Castro','11012345','miguel.castro@gmail.com','04144445566','2026-04-29 00:24:19','ffvv'),(224,7,'jose','22','tt@gmail.com','04','2026-05-03 14:16:23','matematica');
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias` (
  `id_materia` int NOT NULL AUTO_INCREMENT,
  `nombre_materia` varchar(100) NOT NULL,
  `profesor_id` int DEFAULT NULL,
  PRIMARY KEY (`id_materia`),
  UNIQUE KEY `unique_materia_profesor` (`nombre_materia`,`profesor_id`),
  KEY `id_profesor` (`profesor_id`),
  CONSTRAINT `materias_ibfk_1` FOREIGN KEY (`profesor_id`) REFERENCES `profesor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (32,'ffvv',7),(33,'matematica',7);
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_actividad`
--

DROP TABLE IF EXISTS `nota_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nota_actividad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `actividad_id` int NOT NULL,
  `estudiante_id` int NOT NULL,
  `nota` decimal(4,2) DEFAULT '0.00',
  `nota_ponderada` decimal(4,1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_act_est` (`actividad_id`,`estudiante_id`),
  KEY `estudiante_id` (`estudiante_id`),
  CONSTRAINT `nota_actividad_ibfk_1` FOREIGN KEY (`actividad_id`) REFERENCES `actividad` (`id`) ON DELETE CASCADE,
  CONSTRAINT `nota_actividad_ibfk_2` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_actividad`
--

LOCK TABLES `nota_actividad` WRITE;
/*!40000 ALTER TABLE `nota_actividad` DISABLE KEYS */;
INSERT INTO `nota_actividad` VALUES (144,2,214,20.00,5.0),(145,2,215,15.00,3.8),(146,2,216,20.00,5.0),(147,2,217,12.00,3.0),(148,2,218,19.00,4.8),(149,2,219,14.00,3.5),(150,2,220,17.00,4.3),(151,2,221,10.00,2.5),(152,2,222,16.00,4.0),(153,2,223,20.00,5.0),(154,9,214,20.00,25.0),(155,4,214,18.00,4.5),(156,4,215,15.00,3.8),(157,4,216,20.00,5.0),(158,4,217,12.00,3.0),(159,4,218,19.00,4.8),(160,4,219,14.00,3.5),(161,4,220,17.00,4.3),(162,4,221,10.00,2.5),(163,4,222,16.00,4.0),(164,4,223,20.00,5.0),(165,9,217,15.00,18.8),(166,9,218,20.00,25.0),(167,9,219,0.00,0.0),(168,9,220,0.00,0.0),(169,9,215,0.00,0.0),(170,9,216,0.00,0.0),(171,9,223,0.00,0.0),(172,9,221,0.00,0.0),(173,9,222,0.00,0.0),(174,1,214,20.00,20.0),(175,1,217,5.00,5.0),(176,1,218,5.00,5.0),(177,1,219,0.00,0.0),(178,1,220,0.00,0.0),(179,1,215,2.00,2.0),(180,1,216,0.00,0.0),(181,1,223,0.00,0.0),(182,1,221,0.00,0.0),(183,1,222,0.00,0.0),(184,3,214,20.00,5.0),(185,3,217,0.00,0.0),(186,3,218,0.00,0.0),(187,3,219,0.00,0.0),(188,3,220,0.00,0.0),(189,3,215,0.00,0.0),(190,3,216,0.00,0.0),(191,3,223,0.00,0.0),(192,3,221,0.00,0.0),(193,3,222,0.00,0.0),(194,7,214,20.00,20.0),(195,7,217,0.00,0.0),(196,7,218,0.00,0.0),(197,7,219,0.00,0.0),(198,7,220,0.00,0.0),(199,7,215,0.00,0.0),(200,7,216,0.00,0.0),(201,7,223,0.00,0.0),(202,7,221,0.00,0.0),(203,7,222,0.00,0.0),(204,8,214,20.00,5.0),(205,8,217,0.00,0.0),(206,8,218,0.00,0.0),(207,8,219,0.00,0.0),(208,8,220,0.00,0.0),(209,8,215,0.00,0.0),(210,8,216,0.00,0.0),(211,8,223,0.00,0.0),(212,8,221,0.00,0.0),(213,8,222,0.00,0.0),(214,10,224,20.00,25.0),(215,12,224,20.00,25.0),(216,11,224,10.00,12.5),(217,13,224,5.00,6.3);
/*!40000 ALTER TABLE `nota_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetivo_aprendizaje`
--

DROP TABLE IF EXISTS `objetivo_aprendizaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objetivo_aprendizaje` (
  `id_obj` int NOT NULL AUTO_INCREMENT,
  `materia` varchar(100) DEFAULT NULL,
  `num_corte` int DEFAULT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `descripcion` text,
  `ponderacion` int DEFAULT '25',
  `profesor_id` int DEFAULT NULL,
  PRIMARY KEY (`id_obj`),
  KEY `idx_obj_materia` (`materia`),
  KEY `idx_obj_prof` (`profesor_id`),
  CONSTRAINT `fk_obj_materia` FOREIGN KEY (`materia`) REFERENCES `materias` (`nombre_materia`) ON DELETE RESTRICT,
  CONSTRAINT `fk_obj_prof` FOREIGN KEY (`profesor_id`) REFERENCES `profesor` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetivo_aprendizaje`
--

LOCK TABLES `objetivo_aprendizaje` WRITE;
/*!40000 ALTER TABLE `objetivo_aprendizaje` DISABLE KEYS */;
INSERT INTO `objetivo_aprendizaje` VALUES (21,'ffvv',1,'gggg','gfgfhgh',25,7),(22,'ffvv',2,'ftyty','yyuj',25,7),(23,'ffvv',3,'hola','qur tal',25,7),(24,'ffvv',4,'hbhh','hh',25,7),(25,'matematica',1,'qu','ddddd',25,7),(26,'matematica',3,'fdfff','fgg',25,7),(27,'matematica',2,'gfgg','gggg',25,7),(28,'matematica',4,'ggg','gggg',25,7);
/*!40000 ALTER TABLE `objetivo_aprendizaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_profe_login` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (7,'julio perez','c@gmail.com','12345','perro','2026-04-28 20:13:03'),(8,'juan gomez','g@gmail.com','1234','gg','2026-04-28 20:30:31');
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-03 20:09:17
