-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: cfif31.ru    Database: ISPr25-21_TimofeevKO_dema_26
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
-- Table structure for table `Tupe_uslov`
--

DROP TABLE IF EXISTS `Tupe_uslov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tupe_uslov` (
  `idTupe_uslov` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idTupe_uslov`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tupe_uslov`
--

LOCK TABLES `Tupe_uslov` WRITE;
/*!40000 ALTER TABLE `Tupe_uslov` DISABLE KEYS */;
INSERT INTO `Tupe_uslov` VALUES (1,'Налоговый вычет'),(2,'Стимулирующая выплата'),(3,'Премия'),(4,'Штраф');
/*!40000 ALTER TABLE `Tupe_uslov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dop_uslovie`
--

DROP TABLE IF EXISTS `dop_uslovie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dop_uslovie` (
  `iddop_uslovie` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `id_type` int NOT NULL,
  `summa` decimal(10,2) NOT NULL,
  PRIMARY KEY (`iddop_uslovie`),
  KEY `id_type_idx` (`id_type`),
  CONSTRAINT `id_type` FOREIGN KEY (`id_type`) REFERENCES `Tupe_uslov` (`idTupe_uslov`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dop_uslovie`
--

LOCK TABLES `dop_uslovie` WRITE;
/*!40000 ALTER TABLE `dop_uslovie` DISABLE KEYS */;
INSERT INTO `dop_uslovie` VALUES (1,'НДС',1,0.13),(2,'Выполнение нормы',2,1000.00),(3,'Выработка 130 часов в месяц',3,5000.00),(4,'Молодой эксперт',2,1400.00),(5,'Нетрезвый вид',4,3800.00),(6,'Новогодняя премия',3,3000.00),(7,'Обслуживание банкета',2,720.00),(8,'Опоздание на смену',4,2.00),(9,'Отрицательный отзыв',4,50.00),(10,'Премия \"Приведи друга\"',3,1800.00),(11,'Премия надежности',3,3000.00),(12,'Разбитая посуда',4,150.00),(13,'Сверхнагрузка',2,350.00),(14,'Хорошие отзывы',2,620.00);
/*!40000 ALTER TABLE `dop_uslovie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `idjob` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idjob`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'Гардеробщик'),(2,'Директор'),(3,'Техник'),(4,'Хостес'),(5,'Официант'),(6,'Повар'),(7,'Бармен'),(8,'Грузчик'),(9,'Директор зала'),(10,'Уборщик'),(11,'Посудомойщик'),(12,'Директор зала'),(13,'Музыкант');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `name_stavka`
--

DROP TABLE IF EXISTS `name_stavka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `name_stavka` (
  `idname_stavka` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idname_stavka`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `name_stavka`
--

LOCK TABLES `name_stavka` WRITE;
/*!40000 ALTER TABLE `name_stavka` DISABLE KEYS */;
INSERT INTO `name_stavka` VALUES (1,'Почасовая'),(2,'Оклад');
/*!40000 ALTER TABLE `name_stavka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `idpayments` int NOT NULL AUTO_INCREMENT,
  `id_fio` int NOT NULL,
  `date_now` date NOT NULL,
  `date_end` date NOT NULL,
  `ccc` decimal(10,2) NOT NULL,
  `conditions` varchar(200) NOT NULL,
  `procent` varchar(45) NOT NULL,
  `paymentscol` int NOT NULL,
  PRIMARY KEY (`idpayments`),
  KEY `sdd_idx` (`id_fio`),
  KEY `idfe_idx` (`paymentscol`),
  CONSTRAINT `idfe` FOREIGN KEY (`paymentscol`) REFERENCES `dop_uslovie` (`iddop_uslovie`),
  CONSTRAINT `sdd` FOREIGN KEY (`id_fio`) REFERENCES `sotrudnik` (`idsotrudnik`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,3,'2023-06-26','2023-07-11',42037.00,'Стимулирующие выплаты: Сверхнагрузка, Выполнение нормы','40%',1),(2,5,'2023-06-26','2023-07-11',42374.00,'Стимулирующие выплаты: Молодой эксперт, Выполнение нормы Премия: Премия надежности Штраф: Разбитая посуда 2','50%',2),(3,3,'2023-06-26','2023-07-11',32286.00,'Премия: Премия \"Приведи друга\"','50%',3),(4,5,'2023-06-26','2023-07-11',34821.00,'Стимулирующие выплаты: Молодой эксперт, Выполнение нормы Премия: Премия надежности','50%',4),(5,2,'2023-06-26','2023-07-11',24378.00,'Стимулирующие выплаты: Молодой эксперт, обслуживание банкета Премия: Премия надежности','40%',5),(6,3,'2023-06-26','2023-07-11',64000.00,'Стимулирующие выплаты: Хорошие отзывы Штраф: Отрицательный отзыв 1','40%',6),(7,7,'2023-06-26','2023-07-11',42173.00,'Премия: Выработка 130 часов в месяц Штраф: Нетрезвый вид 1','40%',7),(8,12,'2023-06-26','2023-07-11',31199.00,'Премия: Выработка 130 часов в месяц Штраф: Опоздание на смену 3','40%',8);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_data`
--

DROP TABLE IF EXISTS `personal_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_data` (
  `id_personal_data` int NOT NULL AUTO_INCREMENT,
  `indificate` int NOT NULL,
  `fio` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `nomer` bigint NOT NULL,
  `sanitar` bigint NOT NULL,
  PRIMARY KEY (`id_personal_data`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_data`
--

LOCK TABLES `personal_data` WRITE;
/*!40000 ALTER TABLE `personal_data` DISABLE KEYS */;
INSERT INTO `personal_data` VALUES (1,138,'Корчагина Ольга Семёновна','1997-02-18',79277766654,88375594),(2,139,'Исаев Захар Константинович','1998-07-16',79279365662,44615013),(3,140,'Лапшина Валерия Константиновна','1997-01-11',79278218474,68194452),(4,142,'Козлов Макар Артёмович','1998-02-21',79271380604,15583310),(5,143,'Зайцев Константин Васильевич','1996-02-05',79277103747,60475936),(6,144,'Некрасова Вероника Ивановна','1994-03-24',79277423049,38829400),(7,145,'Волков Николай Кириллович','1996-04-26',79277171812,55666124),(8,147,'Снегирев Даниил Иванович','1993-02-22',79274001055,66662700),(9,149,'Гуров Владимир Никитич','2000-07-29',79276524091,93046838),(10,152,'Литвинов Олег Артёмович','1999-05-05',79273414913,89824391),(11,153,'Пименова Дарья Григорьевна','1996-06-24',79272081101,45460136),(12,156,'Калугин Артемий Демидович','1997-12-03',79271282830,74346741),(13,157,'Савельева Анна Алексеевна','1993-10-20',79279399207,25204286),(14,158,'Богданов Фёдор Александрович','1999-07-19',79275904041,25826373),(15,160,'Соколов Владимир Мирославович','2000-03-28',79274956072,96037771),(16,165,'Соловьев Михаил Максимович','2000-05-03',79270138443,55698128),(17,166,'Демина Аделя Дмитриевна','1993-08-12',79277230307,57229811),(18,167,'Дружинина Алёна Давидовна','1996-06-26',79279830244,49988581),(19,170,'Фролова Виктория Давидовна','1997-12-10',79274024756,69505065),(20,171,'Куликов Владислав Михайлович','1999-04-12',79276050594,87742475),(21,174,'Бочарова Арина Ярославовна','1998-10-08',79271734803,56511509),(22,175,'Руднева Виктория Михайловна','2000-10-13',79278690136,68594555),(23,177,'Костина Юлия Олеговна','1994-08-11',79274901479,52651325),(24,178,'Николаева Варвара Дмитриевна','1999-01-25',79277512465,72118879),(25,180,'Анисимов Владимир Дмитриевич','2000-12-13',79273902940,20966726),(26,181,'Ильин Даниэль Артёмович','1998-01-18',79271982358,81787052),(27,183,'Еремин Фёдор Михайлович','1995-12-07',79274998689,85752074),(28,184,'Марков Олег Сергеевич','1995-03-20',79273077723,52855842),(29,185,'Герасимова Елизавета Дмитриевна','2000-08-09',79271331839,14142221),(30,187,'Тимофеева Алиса Александровна','1996-11-08',79273727204,26245710),(31,189,'Ефремов Владимир Львович','1996-03-10',79270356251,17403788),(32,193,'Коротков Владислав Константинович','1996-01-06',79276823064,73424939),(33,195,'Федотов Лев Степанович','1993-11-02',79279748137,61363087),(34,196,'Воробьев Владимир Даниилович','1997-02-23',79271923961,59660401),(35,198,'Смирнова Кира Савельевна','1994-02-13',79270662278,80607959),(36,201,'Ананьев Григорий Максимович','1995-02-23',79276017759,43369496),(37,202,'Павлова Аглая Яковлевна','1994-01-07',79273455720,94650516),(38,207,'Малышев Леонид Маркович','1999-06-10',79271221931,67745706),(39,211,'Горшков Тимофей Максимович','1993-01-24',79270822601,15446982),(40,214,'Макаров Матвей Платонович','1994-07-17',79271298895,32512988),(41,215,'Глушкова Валерия Николаевна','1998-05-31',79273161370,49706480),(42,218,'Горшкова Валерия Артуровна','1994-07-14',79279268688,61711976),(43,219,'Андреев Марк Артёмович','1996-07-15',79277104216,64857109),(44,221,'Громова Вера Львовна','2000-03-28',79273622683,81042172),(45,222,'Дьяконова Мария Семёновна','1996-03-09',79279013718,21837919),(46,223,'Лосева Анастасия Тимофеевна','1999-06-15',79274561358,66634148),(47,224,'Виноградов Александр Ильич','1996-07-20',79276858012,59999710),(48,225,'Белоусов Никита Евгеньевич','1993-04-05',79278454395,38210394),(49,227,'Павлов Пётр Даниэльевич','1998-05-09',79270668845,85195861),(50,228,'Кузнецова Екатерина Кирилловна','1995-07-21',79279253744,76072961),(51,230,'Климова Ксения Артёмовна','1997-09-27',79273923147,43936767),(52,231,'Золотова Вера Ярославовна','1998-05-27',79279342295,62165835),(53,236,'Чернова Варвара Владимировна','1998-07-18',79276225679,11629237),(54,237,'Воробьева Кристина Романовна','1995-11-15',79270487921,23728012),(55,239,'Сорокин Степан Владиславович','1993-01-04',79272353733,88479090),(56,240,'Смирнова Таисия Денисовна','1998-06-30',79276808862,84125388),(57,243,'Попова София Саввична','1998-01-02',79278404209,11064436),(58,249,'Иванов Владислав Иванович','1998-01-31',79274804116,37406343),(59,252,'Кольцов Даниил Тихонович','1997-10-26',79274262599,53322744),(60,254,'Ковалева Полина Александровна','2000-12-01',79277906530,73004201),(61,257,'Никифоров Савелий Артёмович','2000-04-12',79277180172,45379119),(62,259,'Родионова Ника Артёмовна','1996-03-08',79276207470,44179501),(63,261,'Аксенов Роман Матвеевич','1999-01-16',79279605606,75293504),(64,274,'Большаков Данила Ярославович','1999-06-25',79279705018,34109736),(65,276,'Калинин Кирилл Матвеевич','1997-04-15',79273684411,48523940),(66,281,'Павловский Вячеслав Фёдорович','1998-07-28',79274188987,18875608),(67,282,'Вешнякова Полина Максимовна','1993-03-27',79275732706,68462982),(68,289,'Кочетов Тимофей Альбертович','1995-09-30',79278629817,55520473),(69,290,'Шульгин Давид Олегович','1999-07-23',79278662774,77868986),(70,291,'Семенова Дарина Ярославовна','1996-10-15',79279208177,56552409),(71,293,'Колесова Арина Максимовна','1997-03-28',79275182240,98884446),(72,297,'Гончарова Юлия Кирилловна','1994-01-30',79271290371,94871568),(73,298,'Новиков Тимофей Иванович','1995-02-19',79273850592,56022688),(74,299,'Кузнецова Мария Георгиевна','1993-03-31',79271332019,28998887),(75,300,'Цветкова Василиса Никитична','1998-07-07',79272784285,21971358);
/*!40000 ALTER TABLE `personal_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sotrudnik`
--

DROP TABLE IF EXISTS `sotrudnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sotrudnik` (
  `idsotrudnik` int NOT NULL AUTO_INCREMENT,
  `fio` int NOT NULL,
  `id_job` int NOT NULL,
  `id_zona` int NOT NULL,
  `smena` varchar(45) NOT NULL,
  `id_type` int NOT NULL,
  `staff` decimal(10,2) NOT NULL,
  PRIMARY KEY (`idsotrudnik`),
  KEY `jobid_idx` (`id_job`),
  KEY `id_zone_idx` (`id_zona`),
  KEY `tup_id_idx` (`id_type`),
  KEY `fii_idx` (`fio`),
  CONSTRAINT `fii` FOREIGN KEY (`fio`) REFERENCES `personal_data` (`id_personal_data`),
  CONSTRAINT `id_zone` FOREIGN KEY (`id_zona`) REFERENCES `zona_activ` (`idzona_activ`),
  CONSTRAINT `jobid` FOREIGN KEY (`id_job`) REFERENCES `job` (`idjob`),
  CONSTRAINT `tup_id` FOREIGN KEY (`id_type`) REFERENCES `name_stavka` (`idname_stavka`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sotrudnik`
--

LOCK TABLES `sotrudnik` WRITE;
/*!40000 ALTER TABLE `sotrudnik` DISABLE KEYS */;
INSERT INTO `sotrudnik` VALUES (1,1,1,1,'1 Смена 8:00-12:00',1,177.00),(2,2,2,2,'8:00-20:00',2,75000.00),(3,3,3,3,'2 Смена',1,151.00),(4,4,4,4,'12:00-16:00',1,221.00),(5,5,5,4,'2 Смена 12:00-16:00',1,179.00),(6,6,6,5,'2 Смена 12:00-16:00',1,155.00),(7,7,7,4,'1 Смена 8:00-12:00',1,167.00),(8,8,8,6,'1 Смена 8:00-12:00',1,145.00),(9,9,9,4,'8:00-20:00',2,64000.00),(10,10,5,4,'8:00-12:00',1,154.00),(11,11,5,4,'8:00-12:00',1,204.00),(12,12,1,1,'1 Смена',1,189.00),(13,13,3,3,'2 Смена',1,223.00),(14,14,6,7,'2 Смена 12:00-16:00',1,263.00),(15,15,5,4,'2 Смена 12:00-16:00',1,250.00),(16,16,5,4,'2 Смена 12:00-16:00',1,202.00),(17,17,5,4,'2 Смена',1,152.00),(18,18,10,4,'1 Смена 8:00-12:00',1,223.00),(19,19,6,8,'12:00-16:00',1,198.00),(20,20,11,9,'2 Смена',1,267.00),(21,21,9,4,'8:00-20:00',2,64000.00),(22,22,1,1,'2 Смена 12:00-16:00',1,212.00),(23,23,12,4,'12:00-16:00',1,160.00),(24,24,7,4,'12:00-16:00',1,224.00),(25,25,13,2,'Понедельник, среда, пятница, воскресенье',2,42000.00),(26,26,11,9,'2 Смена 12:00-16:00',1,135.00),(27,27,6,10,'1 Смена 8:00-12:00',1,152.00),(28,28,12,4,'3 Смена 16:00-20:00',1,252.00),(29,29,3,3,'3 Смена',1,242.00),(30,30,13,2,'Вторник, четверг, суббота',2,39000.00),(31,31,6,11,'16:00-20:00',1,133.00),(32,32,12,4,'16:00-20:00',1,240.00),(33,33,5,4,'3 Смена',1,213.00),(34,34,5,4,'8:00-12:00',1,204.00),(35,35,6,11,'3 Смена',1,158.00),(36,36,8,6,'2 Смена',1,175.00),(37,37,11,9,'2 Смена 12:00-16:00',1,144.00),(38,38,6,5,'2 Смена 12:00-16:00',1,163.00),(39,39,5,4,'12:00-16:00',1,240.00),(40,40,5,4,'12:00-16:00',1,196.00),(41,41,6,5,'3 Смена',1,245.00),(42,42,4,4,'3 Смена 16:00-20:00',1,144.00),(43,43,8,6,'8:00-12:00',1,174.00),(44,44,1,1,'2 Смена',1,215.00),(45,45,12,4,'12:00-16:00',1,186.00),(46,46,7,4,'12:00-16:00',1,209.00),(47,47,12,4,'2 Смена 12:00-16:00',1,206.00),(48,48,5,4,'2 Смена 12:00-16:00',1,171.00),(49,49,12,4,'2 Смена',1,144.00),(50,50,6,11,'8:00-12:00',1,206.00),(51,51,12,4,'3 Смена',1,257.00),(52,52,3,3,'3 Смена 16:00-20:00',1,238.00),(53,53,6,11,'3 Смена 16:00-20:00',1,256.00),(54,54,6,5,'16:00-20:00',1,194.00),(55,55,12,4,'1 Смена',1,172.00),(56,56,6,11,'3 Смена',1,228.00),(57,57,3,3,'3 Смена',1,192.00),(58,58,1,1,'1 Смена',1,206.00),(59,59,6,8,'3 Смена 16:00-20:00',1,168.00),(60,60,1,1,'8:00-12:00',1,133.00),(61,61,5,4,'8:00-12:00',1,233.00),(62,62,5,4,'2 Смена',1,232.00),(63,63,5,4,'2 Смена',1,270.00),(64,64,12,4,'2 Смена',1,147.00),(65,65,5,4,'2 Смена',1,250.00),(66,66,8,6,'8:00-12:00',1,135.00),(67,67,5,4,'16:00-20:00',1,241.00),(68,68,5,4,'2 Смена',1,144.00),(69,69,6,7,'2 Смена',1,167.00),(70,70,6,8,'2 Смена 12:00-16:00',1,198.00),(71,71,6,5,'2 Смена',1,262.00),(72,72,6,8,'2 Смена 12:00-16:00',1,215.00),(73,73,6,7,'2 Смена',1,226.00),(74,74,12,4,'3 Смена',1,213.00),(75,75,1,1,'3 Смена 16:00-20:00',1,248.00);
/*!40000 ALTER TABLE `sotrudnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zona_activ`
--

DROP TABLE IF EXISTS `zona_activ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zona_activ` (
  `idzona_activ` int NOT NULL AUTO_INCREMENT,
  `name_zone` varchar(45) NOT NULL,
  PRIMARY KEY (`idzona_activ`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zona_activ`
--

LOCK TABLES `zona_activ` WRITE;
/*!40000 ALTER TABLE `zona_activ` DISABLE KEYS */;
INSERT INTO `zona_activ` VALUES (1,'Гардероб'),(2,'Ресторан'),(3,'Кабинет тех. эксперта'),(4,'Зал'),(5,'Холодный цех'),(6,'Склад'),(7,'Рыбный цех'),(8,'Мясной цех'),(9,'Кухня'),(10,'Цех по заготовкам'),(11,'Кондитерский цех');
/*!40000 ALTER TABLE `zona_activ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ISPr25-21_TimofeevKO_dema_26'
--

--
-- Dumping routines for database 'ISPr25-21_TimofeevKO_dema_26'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-26 16:44:59
