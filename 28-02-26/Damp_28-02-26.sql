-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: cfif31.ru    Database: ISPr25-21_TimofeevKO_28/02/26
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

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
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `id_tovar` int NOT NULL,
  `date_order` date NOT NULL,
  `date_end` date NOT NULL,
  `id_punkt` int NOT NULL,
  `fio` int DEFAULT NULL,
  `kod` bigint NOT NULL,
  `id_status` int NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_status_idx` (`id_status`),
  KEY `id_tovar_idx` (`id_tovar`),
  KEY `id_aa_idx` (`id_punkt`),
  KEY `id_fio_idx` (`fio`),
  CONSTRAINT `id_aa` FOREIGN KEY (`id_punkt`) REFERENCES `address` (`idaddress`),
  CONSTRAINT `id_fio` FOREIGN KEY (`fio`) REFERENCES `user` (`iduser`),
  CONSTRAINT `id_status` FOREIGN KEY (`id_status`) REFERENCES `status_order` (`idstatus_order`),
  CONSTRAINT `id_tovar` FOREIGN KEY (`id_tovar`) REFERENCES `Tovar` (`idTovar`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
INSERT INTO `Order` VALUES (1,5,'2022-05-10','2022-05-16',27,7,811,1),(2,9,'2022-05-11','2022-05-17',5,NULL,812,1),(3,8,'2022-05-12','2022-05-18',29,NULL,813,1),(4,1,'2022-05-13','2022-05-19',10,NULL,814,1),(5,2,'2022-05-14','2022-05-20',31,8,815,1),(6,1,'2022-05-15','2022-05-21',32,NULL,816,1),(7,5,'2022-05-16','2022-05-22',20,NULL,817,1),(8,3,'2022-05-17','2022-05-23',34,1,818,2),(9,3,'2022-05-18','2022-05-24',35,10,819,1),(10,7,'2022-05-19','2022-05-25',36,NULL,820,2);
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Role` (
  `idRole` int NOT NULL AUTO_INCREMENT,
  `name_role` varchar(45) NOT NULL,
  PRIMARY KEY (`idRole`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'Администратор'),(2,'Менеджер'),(3,'Клиент');
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tovar`
--

DROP TABLE IF EXISTS `Tovar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tovar` (
  `idTovar` int NOT NULL AUTO_INCREMENT,
  `id_supplier` int NOT NULL,
  `id_categories` int NOT NULL,
  `discount` int NOT NULL,
  `warehouse` int NOT NULL,
  `description` varchar(200) NOT NULL,
  `image` blob NOT NULL,
  PRIMARY KEY (`idTovar`),
  KEY `id_supplier_idx` (`id_supplier`),
  KEY `id_category_idx` (`id_categories`),
  CONSTRAINT `id_category` FOREIGN KEY (`id_categories`) REFERENCES `category` (`idcategory`),
  CONSTRAINT `id_supplier` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`idsupplier`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tovar`
--

LOCK TABLES `Tovar` WRITE;
/*!40000 ALTER TABLE `Tovar` DISABLE KEYS */;
INSERT INTO `Tovar` VALUES (1,1,1,4,6,'Поплин «Розовый жемчуг» шириной 220 см с изображением на ткани — крупные цветы, чайная роза; цветовая гамма: бледно-розовая.',_binary 'B111C5.JPEG'),(2,3,2,3,13,'Муслин «Bej» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: кофе с молоком.',_binary 'E112C6.JPG'),(3,3,2,2,12,'Муслин «Gri» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: серая.',_binary 'T238C7.JPG'),(4,1,2,2,14,'Бязь детская «Совята» шириной 150 см с изображением на ткани — совы; цветовая гамма: бордо, желтая, салатовая.',_binary 'M112C8.JPG'),(5,1,3,2,1,'Полотно вафельное «8 марта» шириной 50 см с изображением на ткани — белые розы; цветовая гамма: розовая.',_binary 'M294G9.JPG'),(6,1,1,3,7,'Сатин «Миндальный» однотонный шириной 250 см с изображением на ткани цветовая гамма: миндаль. ',_binary 'N283K3.JPG'),(7,1,2,3,2,'Плюш розовый гладкий шириной 180 см с изображением на ткани — однотонный; цветовая гамма: однотонная, розовая.',_binary 'L293S9.JPG'),(8,2,1,2,6,'Поплин Мокко 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: коричневая, кофе, шоколад.',_binary 'M398S9.JPG'),(9,2,3,4,2,'Фланель черная оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: черная.',_binary 'S384K2.JPG'),(10,2,2,2,3,'Плюш белый в клетку шириной 180 см с изображением на ткани — клетка, однотонный; цветовая гамма: белая, однотонная.',_binary 'K839K3.JPG'),(11,2,3,4,10,'Фланель однотонная светлая оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: голубая, желтая, розовая, сирень, фисташка.',_binary 'E574V5.JPG'),(12,2,1,2,6,'Поплин Морская волна 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: аквамарин, бирюзовая.',_binary 'Q857B4.JPG'),(13,1,1,3,4,'Сатин «Дымчатая роза» однотонный шириной 250 см с изображением на ткани цветовая гамма: розовый зефир.',_binary 'T845M4.PNG'),(14,1,3,2,5,'Фланель рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.',''),(15,2,1,3,9,'Ткань поплин «Натурель» шириной 220 см с изображением на ткани — мелкие цветы; цветовая гамма: пепельная, розовая. ',''),(16,1,1,2,15,'Поплин Голубой 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: голубая.',''),(17,1,3,4,7,'Фланель арт 535 рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.',''),(18,3,2,2,18,'Фланель детская 21212-2 шириной 90 см с изображением на ткани — россыпь звездочек; цветовая гамма: баклажан, оранжевый, розовая.',''),(19,3,3,3,9,'Ткань для скатертей под рогожку «рис 18825» шириной 150 см с изображением на ткани — ромашки, россыпь цветов; цветовая гамма: красная, синяя.','');
/*!40000 ALTER TABLE `Tovar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `idaddress` int NOT NULL AUTO_INCREMENT,
  `index` bigint NOT NULL,
  `city` varchar(45) NOT NULL,
  `streat` varchar(45) NOT NULL,
  `nomer_house` int NOT NULL,
  PRIMARY KEY (`idaddress`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,344288,'г. Кропоткин','ул. Чехова',1),(2,614164,'г.Кропоткин','  ул. Степная',30),(3,394242,'г. Кропоткин','ул. Коммунистическая',43),(4,660540,'г. Кропоткин','ул. Солнечная',25),(5,125837,'г. Кропоткин','ул. Шоссейная',40),(6,125703,'г. Кропоткин','ул. Партизанская',49),(7,625283,'г. Кропоткин','ул. Победы',46),(8,614611,'г. Кропоткин','ул. Молодежная',50),(9,454311,'г.Кропоткин','ул. Новая',19),(10,660007,'г.Кропоткин','ул. Октябрьская',19),(11,603036,'г. Кропоткин','ул. Садовая',4),(12,450983,'г.Кропоткин','ул. Комсомольская',26),(13,394782,'г. Кропоткин','ул. Чехова',3),(14,603002,'г. Кропоткин','ул. Дзержинского',28),(15,450558,'г. Кропоткин','ул. Набережная',30),(16,394060,'г.Кропоткин','ул. Фрунзе',43),(17,410661,'г. Кропоткин','ул. Школьная',50),(18,625590,'г. Кропоткин','ул. Коммунистическая',20),(19,625683,'г. Кропоткин','ул. 8 Марта',2),(20,400562,'г. Кропоткин','ул. Зеленая',32),(21,614510,'г. Кропоткин','ул. Маяковского',47),(22,410542,'г. Кропоткин','ул. Светлая',46),(23,620839,'г. Кропоткин','ул. Цветочная',8),(24,443890,'г. Кропоткин','ул. Коммунистическая',1),(25,603379,'г. Кропоткин','ул. Спортивная',46),(26,603721,'г. Кропоткин','ул. Гоголя',41),(27,410172,'г. Кропоткин','ул. Северная',13),(28,420151,'г. Кропоткин','ул. Вишневая',32),(29,125061,'г. Кропоткин','ул. Подгорная',8),(30,630370,'г. Кропоткин','ул. Шоссейная',24),(31,614753,'г. Кропоткин','ул. Полевая',35),(32,426030,'г. Кропоткин','ул. Маяковского',44),(33,450375,'г. Кропоткин ул. Клубная','ул. Маяковского',44),(34,625560,'г. Кропоткин','ул. Некрасова',12),(35,630201,'г. Кропоткин','ул. Комсомольская',17),(36,190949,'г. Кропоткин','ул. Мичурина',26);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `idcategory` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategory`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Постельные ткани'),(2,'Детские ткани'),(3,'Ткани для изделий');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_order`
--

DROP TABLE IF EXISTS `status_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_order` (
  `idstatus_order` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idstatus_order`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_order`
--

LOCK TABLES `status_order` WRITE;
/*!40000 ALTER TABLE `status_order` DISABLE KEYS */;
INSERT INTO `status_order` VALUES (1,'Новый'),(2,'Завершен');
/*!40000 ALTER TABLE `status_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `idsupplier` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idsupplier`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Раута'),(2,'ООО Афо-Тек'),(3,'ГК Петров');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `id_role` int NOT NULL,
  `fio` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`iduser`),
  KEY `id_role_idx` (`id_role`),
  CONSTRAINT `id_role` FOREIGN KEY (`id_role`) REFERENCES `Role` (`idRole`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'Лавров Богдан Львович','8lf0g@yandex.ru','2L6KZG'),(2,1,'Смирнова Полина Фёдоровна','1zx8@yandex.ru','uzWC67'),(3,1,'Полякова София Данииловна','x@mail.ru','8ntwUp'),(4,2,'Чеботарева Марина Данииловна','34d@gmail.com','YOyhfR'),(5,2,'Ермолов Адам Иванович','pxacl@mail.ru','RSbvHv'),(6,2,'Васильев Андрей Кириллович','7o1@gmail.com','rwVDh9'),(7,3,'Маслов Максим Иванович','1@gmail.com','LdNyos'),(8,3,'Симонов Михаил Тимурович','iut@gmail.com','gynQMT'),(9,3,'Павлова Ксения Михайловна','e3t@outlook.com','AtnDjr'),(10,3,'Трифонов Григорий Юрьевич','41clb6o2g@yandex.ru','JlFRCZ');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ISPr25-21_TimofeevKO_28/02/26'
--

--
-- Dumping routines for database 'ISPr25-21_TimofeevKO_28/02/26'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-28 10:25:57
