-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: simpletodo
-- ------------------------------------------------------
-- Server version	5.7.19

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

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_11_09_122329_create_table_todo_items',1),(4,'2018_11_09_122811_create_table_todo_history',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todo_histories`
--

DROP TABLE IF EXISTS `todo_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todo_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `todo_item_id` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todo_histories`
--

LOCK TABLES `todo_histories` WRITE;
/*!40000 ALTER TABLE `todo_histories` DISABLE KEYS */;
INSERT INTO `todo_histories` VALUES (1,3,'create','2018-11-09 05:47:11','2018-11-09 05:47:11',NULL),(2,4,'create','2018-11-09 05:47:48','2018-11-09 05:47:48',NULL),(3,5,'create','2018-11-09 05:48:05','2018-11-09 05:48:05',NULL),(4,6,'create','2018-11-09 05:48:27','2018-11-09 05:48:27',NULL),(5,7,'create','2018-11-09 05:49:04','2018-11-09 05:49:04',NULL),(6,8,'create','2018-11-09 05:49:30','2018-11-09 05:49:30',NULL),(7,1,'delete','2018-11-09 05:53:45','2018-11-09 05:53:45',NULL),(8,8,'delete','2018-11-09 05:57:02','2018-11-09 05:57:02',NULL),(9,6,'delete','2018-11-09 05:57:06','2018-11-09 05:57:06',NULL),(10,2,'delete','2018-11-09 05:59:05','2018-11-09 05:59:05',NULL),(11,3,'update','2018-11-09 06:08:48','2018-11-09 06:08:48',NULL),(12,9,'create','2018-11-09 06:10:57','2018-11-09 06:10:57',NULL),(13,9,'update','2018-11-09 06:11:06','2018-11-09 06:11:06',NULL),(14,9,'update','2018-11-09 06:11:17','2018-11-09 06:11:17',NULL),(15,4,'update','2018-11-09 06:18:55','2018-11-09 06:18:55',NULL),(16,4,'update','2018-11-09 06:18:57','2018-11-09 06:18:57',NULL),(17,3,'update','2018-11-09 06:19:16','2018-11-09 06:19:16',NULL),(18,3,'update','2018-11-09 06:19:20','2018-11-09 06:19:20',NULL),(19,3,'update','2018-11-09 06:19:25','2018-11-09 06:19:25',NULL),(20,4,'update','2018-11-09 06:19:28','2018-11-09 06:19:28',NULL),(21,5,'update','2018-11-09 06:19:30','2018-11-09 06:19:30',NULL),(22,5,'update','2018-11-09 06:19:32','2018-11-09 06:19:32',NULL),(23,4,'update','2018-11-09 06:19:33','2018-11-09 06:19:33',NULL),(24,3,'update','2018-11-09 06:19:35','2018-11-09 06:19:35',NULL),(25,3,'update','2018-11-09 06:19:36','2018-11-09 06:19:36',NULL),(26,3,'update','2018-11-09 06:19:41','2018-11-09 06:19:41',NULL),(27,3,'delete','2018-11-09 06:19:43','2018-11-09 06:19:43',NULL),(28,7,'update','2018-11-09 06:19:44','2018-11-09 06:19:44',NULL),(29,9,'update','2018-11-09 06:19:44','2018-11-09 06:19:44',NULL),(30,9,'marked','2018-11-09 06:34:43','2018-11-09 06:34:43',NULL),(31,7,'marked','2018-11-09 06:36:56','2018-11-09 06:36:56',NULL),(32,5,'marked','2018-11-09 06:41:47','2018-11-09 06:41:47',NULL),(33,5,'marked','2018-11-09 06:41:50','2018-11-09 06:41:50',NULL),(34,7,'marked','2018-11-09 06:42:39','2018-11-09 06:42:39',NULL),(35,9,'marked','2018-11-09 06:43:24','2018-11-09 06:43:24',NULL),(36,5,'marked','2018-11-09 06:44:02','2018-11-09 06:44:02',NULL),(37,7,'marked','2018-11-09 06:44:06','2018-11-09 06:44:06',NULL),(38,5,'unmarked','2018-11-09 06:44:09','2018-11-09 06:44:09',NULL),(39,4,'marked','2018-11-09 06:44:37','2018-11-09 06:44:37',NULL),(40,9,'marked','2018-11-09 06:44:40','2018-11-09 06:44:40',NULL),(41,7,'unmarked','2018-11-09 06:44:44','2018-11-09 06:44:44',NULL),(42,4,'delete','2018-11-09 06:47:50','2018-11-09 06:47:50',NULL),(43,9,'marked','2018-11-09 06:47:51','2018-11-09 06:47:51',NULL),(44,5,'unmarked','2018-11-09 06:47:51','2018-11-09 06:47:51',NULL),(45,5,'marked','2018-11-09 06:48:00','2018-11-09 06:48:00',NULL),(46,5,'unmarked','2018-11-09 06:48:03','2018-11-09 06:48:03',NULL),(47,5,'delete','2018-11-09 06:48:06','2018-11-09 06:48:06',NULL),(48,9,'marked','2018-11-09 06:48:07','2018-11-09 06:48:07',NULL),(49,7,'delete','2018-11-09 06:49:18','2018-11-09 06:49:18',NULL),(50,9,'marked','2018-11-09 06:49:19','2018-11-09 06:49:19',NULL),(51,10,'create','2018-11-09 06:50:07','2018-11-09 06:50:07',NULL),(52,10,'delete','2018-11-09 06:50:10','2018-11-09 06:50:10',NULL),(53,11,'create','2018-11-09 06:50:14','2018-11-09 06:50:14',NULL),(54,12,'create','2018-11-09 06:50:16','2018-11-09 06:50:16',NULL),(55,13,'create','2018-11-09 06:50:18','2018-11-09 06:50:18',NULL),(56,9,'delete','2018-11-09 06:50:22','2018-11-09 06:50:22',NULL),(57,14,'create','2018-11-09 06:50:56','2018-11-09 06:50:56',NULL),(58,11,'marked','2018-11-09 06:50:59','2018-11-09 06:50:59',NULL),(59,11,'delete','2018-11-09 06:51:04','2018-11-09 06:51:04',NULL),(60,12,'marked','2018-11-09 06:52:57','2018-11-09 06:52:57',NULL),(61,12,'delete','2018-11-09 06:53:01','2018-11-09 06:53:01',NULL),(62,13,'marked','2018-11-09 06:53:30','2018-11-09 06:53:30',NULL),(63,13,'unmarked','2018-11-09 06:53:32','2018-11-09 06:53:32',NULL),(64,13,'delete','2018-11-09 06:53:35','2018-11-09 06:53:35',NULL),(65,15,'create','2018-11-09 06:57:19','2018-11-09 06:57:19',NULL),(66,15,'marked','2018-11-09 06:57:21','2018-11-09 06:57:21',NULL),(67,16,'create','2018-11-09 07:00:30','2018-11-09 07:00:30',NULL);
/*!40000 ALTER TABLE `todo_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `todo_items`
--

DROP TABLE IF EXISTS `todo_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `todo_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `done` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todo_items`
--

LOCK TABLES `todo_items` WRITE;
/*!40000 ALTER TABLE `todo_items` DISABLE KEYS */;
INSERT INTO `todo_items` VALUES (2,'asdasd',0,'2018-11-09 05:46:48','2018-11-09 05:59:06','2018-11-09 05:59:06'),(3,'5675 456 78 89',0,'2018-11-09 05:47:11','2018-11-09 06:19:43','2018-11-09 06:19:43'),(4,'5464 67',1,'2018-11-09 05:47:48','2018-11-09 06:47:51','2018-11-09 06:47:51'),(5,'5464 67',0,'2018-11-09 05:48:04','2018-11-09 06:48:06','2018-11-09 06:48:06'),(7,'545',0,'2018-11-09 05:49:03','2018-11-09 06:49:19','2018-11-09 06:49:19'),(9,'545',1,'2018-11-09 06:10:57','2018-11-09 06:50:22','2018-11-09 06:50:22'),(10,'asdads',0,'2018-11-09 06:50:07','2018-11-09 06:50:10','2018-11-09 06:50:10'),(11,'545',1,'2018-11-09 06:50:14','2018-11-09 06:51:04','2018-11-09 06:51:04'),(12,'dfhgfgh',1,'2018-11-09 06:50:16','2018-11-09 06:53:02','2018-11-09 06:53:02'),(13,'asdsa',0,'2018-11-09 06:50:18','2018-11-09 06:53:36','2018-11-09 06:53:36'),(14,'asdas',0,'2018-11-09 06:50:56','2018-11-09 06:50:56',NULL),(15,'asd',1,'2018-11-09 06:57:18','2018-11-09 06:57:20',NULL),(16,'asdas',0,'2018-11-09 07:00:30','2018-11-09 07:00:30',NULL);
/*!40000 ALTER TABLE `todo_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2018-11-09 23:03:46
