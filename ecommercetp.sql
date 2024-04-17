-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ecommercetp
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ecommercetp`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ecommercetp` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ecommercetp`;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Électroménager'),(2,'Mode et vêtements'),(3,'Maison et jardin'),(4,'Sports et loisirs'),(5,'Alimentation et boissons'),(6,'Boulangerie'),(7,'Medicaments'),(8,'TEST');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `o_quantity` int(11) NOT NULL,
  `o_date` varchar(450) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (25,3,1,3,'2021-05-15',0),(29,6,2,1,'2024-03-18',NULL),(31,4,1,1,'2024-03-25',NULL),(32,6,1,1,'2024-03-25',NULL),(33,6,1,1,'2024-03-25',NULL),(34,6,1,1,'2024-03-25',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(450) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(450) DEFAULT NULL,
  `idcategory` int(11) DEFAULT NULL,
  `quantite` int(11) NOT NULL,
  `promotion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foreign_key_name` (`idcategory`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`idcategory`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Machine a laver',1200,'machinealaver.jpeg',1,5,0),(2,'Refrigérateur',7000,'refregerateur.jpeg',1,10,1),(3,'Aspirateur',300,'aspirateur.jpeg',1,8,0),(4,'Micro-ondes',600,'microonde.jpeg',1,20,1),(5,'Chemise',310,'chemise.jpeg',2,30,0),(6,'Robe',200,'robe.jpeg',2,20,1),(7,'Chaussures de sport',59.99,'chaussure.jpeg',2,13,0),(8,'Table de jardin',129.99,'table.jpeg',3,3,1),(9,'Ensemble de patio',299.99,'patio.jpeg',3,4,0),(10,'Tondeuse à gazon',199.99,'gazon.jpeg',3,14,1),(11,'Raquette de tennis',49.99,'tennis.jpeg',4,15,0),(12,'Tapis de yoga',29.99,'yoga.jpeg',4,20,1),(13,'Ballon de football',19.99,'ballon.jpeg',4,14,0),(14,'Café arabica',9.99,'caffe.jpeg',5,50,1),(15,'Thé vert',7.99,'the.jpeg',5,50,0),(16,'Tomate',24.99,'tomate.jpeg',5,5,1),(17,'Lait',24.99,'lait.jpeg',5,2,0),(19,'A',12,NULL,8,2,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'maryem','maryem@gmail.com','0000'),(2,'ahmed','ahmed@gmail.com','0000');
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

-- Dump completed on 2024-04-17 19:15:41
