-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 91.222.238.6    Database: dem03.03.26
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.22.04.1

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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `idauthors` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idauthors`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'А.С. Пушкин'),(2,'М.Ю. Лермонтов'),(3,'Н.В. Гоголь');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `idbooks` int NOT NULL AUTO_INCREMENT,
  `name_book` varchar(45) NOT NULL,
  `author_id` int NOT NULL,
  `price_book` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idbooks`),
  KEY `author_idx` (`author_id`),
  CONSTRAINT `author` FOREIGN KEY (`author_id`) REFERENCES `authors` (`idauthors`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Бородино',2,199.00),(2,'Дубровский',1,149.00),(3,'Капитанская дочь',1,139.00),(4,'Медный всадник',1,99.00),(5,'Мертвые души',3,199.00),(6,'Мцыри',2,199.00),(7,'Пикова дама',1,149.00),(8,'Портрет',3,249.00),(9,'Смерть поэта',2,99.00),(10,'Тарас бульба',3,149.00);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libraries`
--

DROP TABLE IF EXISTS `libraries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libraries` (
  `id_library` int NOT NULL AUTO_INCREMENT,
  `surname` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `secname` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id_library`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libraries`
--

LOCK TABLES `libraries` WRITE;
/*!40000 ALTER TABLE `libraries` DISABLE KEYS */;
INSERT INTO `libraries` VALUES (1,'Иванова','Олеся','Алексеевна','lesy','lesya_1999'),(2,'Самойлова','Ирина','Анатольевна','irina','irina_2000'),(3,'Соловьев','Артем','Николаевич','artem','irina_2001');
/*!40000 ALTER TABLE `libraries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relised_books`
--

DROP TABLE IF EXISTS `relised_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relised_books` (
  `idrelised_books` int NOT NULL AUTO_INCREMENT,
  `code_book` int NOT NULL,
  `code_library` int NOT NULL,
  `code_student` int NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`idrelised_books`),
  KEY `code_book_idx` (`code_book`),
  KEY `code_library_idx` (`code_library`),
  KEY `code_student_idx` (`code_student`),
  CONSTRAINT `code_book` FOREIGN KEY (`code_book`) REFERENCES `books` (`idbooks`),
  CONSTRAINT `code_library` FOREIGN KEY (`code_library`) REFERENCES `libraries` (`id_library`),
  CONSTRAINT `code_student` FOREIGN KEY (`code_student`) REFERENCES `students` (`id_students`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relised_books`
--

LOCK TABLES `relised_books` WRITE;
/*!40000 ALTER TABLE `relised_books` DISABLE KEYS */;
INSERT INTO `relised_books` VALUES (1,1,1,1,'2020-05-07'),(2,4,1,2,'2020-05-08'),(3,7,1,3,'2020-05-09'),(4,9,2,4,'2020-05-10'),(5,3,2,5,'2020-05-11'),(6,6,2,6,'2020-05-12'),(7,8,3,7,'2020-05-13'),(8,5,3,8,'2020-05-14'),(9,10,3,9,'2020-05-15'),(10,2,3,10,'2020-05-16');
/*!40000 ALTER TABLE `relised_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id_students` int NOT NULL AUTO_INCREMENT,
  `surname` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `secname` varchar(45) NOT NULL,
  `class` varchar(45) NOT NULL,
  `number` bigint NOT NULL,
  PRIMARY KEY (`id_students`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Кузьмин','Дмитрий','Александрович','4-А',79879991122),(2,'Лысов','Валерий','Олегович','5-Б',79879991133),(3,'Самарина','София','Васильевна','7-А',79279991124),(4,'Щербаков','Никита','Алексеевич','8-Б',79879991125),(5,'Шумская','Ангелина','Владиславовна','6-А',79872341124),(6,'Ильясова','Юлия','Ренатовна','5-А',79279991124),(7,'Кацимон','Татьяна','Павловна','6-Б',79871231124),(8,'Бойкова','Кристина','Андреевна','8-А',79379991126),(9,'Аристархова','Наталья','Валерьевна','10-А',79999991127),(10,'Данилова','Диана','Александровна','5-Б',79879991123);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dem03.03.26'
--

--
-- Dumping routines for database 'dem03.03.26'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-03 12:40:56
