CREATE DATABASE  IF NOT EXISTS `gif_app` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gif_app`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gif_app
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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id_comment` int NOT NULL,
  `id_publication` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `comment_text` varchar(200) DEFAULT NULL,
  `comment_date` date DEFAULT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `fk_comments_users_idx` (`id_user`),
  KEY `fk_comments_publications_idx` (`id_publication`),
  CONSTRAINT `fk_comments_publications` FOREIGN KEY (`id_publication`) REFERENCES `publications` (`id_publication`),
  CONSTRAINT `fk_comments_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,4,'Милый котик','2026-10-05');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gif_animations`
--

DROP TABLE IF EXISTS `gif_animations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gif_animations` (
  `id_gif` int NOT NULL,
  `name_gif` text,
  `description_gif` text,
  `creation_date` date DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `frame_count` int DEFAULT NULL,
  `playback_speed` float DEFAULT NULL,
  `gif_path` text,
  PRIMARY KEY (`id_gif`),
  KEY `fk_gifs_users_idx` (`id_user`),
  CONSTRAINT `fk_gifs_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gif_animations`
--

LOCK TABLES `gif_animations` WRITE;
/*!40000 ALTER TABLE `gif_animations` DISABLE KEYS */;
INSERT INTO `gif_animations` VALUES (1,'Кот идёт','Анимация кота','2026-10-05',1,5,10,'/gif/cat.gif');
/*!40000 ALTER TABLE `gif_animations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publications` (
  `id_publication` int NOT NULL,
  `id_gif` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `publication_date` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id_publication`),
  KEY `fk_publications_users_idx` (`id_user`),
  KEY `fk_publications_gifs_idx` (`id_gif`),
  CONSTRAINT `fk_publications_gifs` FOREIGN KEY (`id_gif`) REFERENCES `gif_animations` (`id_gif`),
  CONSTRAINT `fk_publications_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (1,1,1,'2026-10-05 00:00:00.000');
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reactions`
--

DROP TABLE IF EXISTS `reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reactions` (
  `id_reaction` int NOT NULL,
  `id_publication` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  `id_type_reaction` int DEFAULT NULL,
  `reaction_date` date DEFAULT NULL,
  PRIMARY KEY (`id_reaction`),
  KEY `fk_reactions_rype_reactions_idx` (`id_type_reaction`),
  KEY `fk_reactions_users_idx` (`id_user`),
  KEY `fk_reactions_publications_idx` (`id_publication`),
  CONSTRAINT `fk_reactions_publications` FOREIGN KEY (`id_publication`) REFERENCES `publications` (`id_publication`),
  CONSTRAINT `fk_reactions_rype_reactions` FOREIGN KEY (`id_type_reaction`) REFERENCES `type_reactions` (`id_type_reaction`),
  CONSTRAINT `fk_reactions_users` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reactions`
--

LOCK TABLES `reactions` WRITE;
/*!40000 ALTER TABLE `reactions` DISABLE KEYS */;
INSERT INTO `reactions` VALUES (1,1,1,2,'2026-10-05');
/*!40000 ALTER TABLE `reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_role` int NOT NULL,
  `role_name` text,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id_status` int NOT NULL,
  `status` text,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'is_active'),(2,'is_banned');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_reactions`
--

DROP TABLE IF EXISTS `type_reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_reactions` (
  `id_type_reaction` int NOT NULL,
  `name_type_reaction` text,
  PRIMARY KEY (`id_type_reaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_reactions`
--

LOCK TABLES `type_reactions` WRITE;
/*!40000 ALTER TABLE `type_reactions` DISABLE KEYS */;
INSERT INTO `type_reactions` VALUES (1,'Дизлайк'),(2,'Лайк');
/*!40000 ALTER TABLE `type_reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `id_role` int DEFAULT NULL,
  `user_name` text,
  `user_email` text,
  `user_password` varchar(8) DEFAULT NULL,
  `id_status` int DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `fk_users_roles_idx` (`id_role`),
  KEY `fk_users_statuses_idx` (`id_status`),
  CONSTRAINT `fk_users_roles` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`),
  CONSTRAINT `fk_users_statuses` FOREIGN KEY (`id_status`) REFERENCES `statuses` (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,2,'Chto_nibud','Chto_nibud@gmail.com','Ilnara',1),(2,2,'Ivanov','Ivanov@gmail.com','password',2),(3,2,'Pola_rity','Pola_rity@gmail.com','123456rt',1),(4,1,'Polina_the_best','polinathebest@gmail.com','best1234',1),(5,2,'Robin','Robin_Good@gmail.com','qwe12345',1);
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

-- Dump completed on 2026-10-06  8:54:51
