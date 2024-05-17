-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: protocols
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `protocol`
--

DROP TABLE IF EXISTS `protocol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `protocol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protocol`
--

LOCK TABLES `protocol` WRITE;
/*!40000 ALTER TABLE `protocol` DISABLE KEYS */;
INSERT INTO `protocol` VALUES (21,'Протокол №1 от 17.05.24','2024-05-17 10:02:22','2024-05-17 13:02:22'),(30,'Тестовый протокол без доп. слайдов','2024-05-17 10:26:29','2024-05-17 13:26:29'),(31,'Тестовый протокол от 13.04.2024','2024-05-17 10:53:06','2024-05-17 13:53:06'),(32,'Проверка удалений слайдов ','2024-05-17 11:02:43','2024-05-17 14:02:43');
/*!40000 ALTER TABLE `protocol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slides` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order` int unsigned NOT NULL,
  `presentation_id` int DEFAULT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `presentation_idx` (`presentation_id`),
  CONSTRAINT `presentation` FOREIGN KEY (`presentation_id`) REFERENCES `protocol` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
INSERT INTO `slides` VALUES (5,0,21,'<p>Это тестовый протокол</p>'),(6,1,21,'<h1 style=\"text-align: justify\">Это первый из дополнительных слайдов тестового протокола</h1>'),(7,2,21,'<ul><li><p>Это второй из дополнительных слайдов тестового протокола</p></li><li><p style=\"text-align: right\">Это подпункт второго слайда</p></li></ul>'),(8,3,21,'<blockquote><p>Это третий из дополнительных слайдов тестового протокола</p><p>выделенный как цитата</p></blockquote>'),(30,0,30,'<p><u>Проверка ввода основного слайда</u></p>'),(31,0,31,'<h1>Тестовый протокол</h1><p>Основной слайд тестового протокола</p><p><br>Тут проверяются длинные текста</p>'),(32,1,31,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc fringilla ullamcorper rhoncus. Nulla venenatis porttitor nibh et vulputate. Nulla feugiat leo eget purus feugiat, ut porta est pulvinar. Sed dictum nulla ac nisl sodales, vel porttitor ligula congue. Nunc orci nibh, finibus non risus id, pretium tincidunt purus. Praesent bibendum libero auctor, auctor leo vitae, imperdiet velit. In est turpis, vestibulum vitae nisl ac, laoreet malesuada enim. Sed eget diam sit amet sem tincidunt pretium. Nam a enim metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis egestas congue hendrerit. Pellentesque a est eleifend, malesuada dui quis, viverra lectus. Integer nec convallis nibh. Vivamus porta tellus at enim semper imperdiet.</p><p>Quisque laoreet lacus et dolor fermentum sagittis. Proin vel urna volutpat, pretium lorem ac, mollis leo. Maecenas dolor dui, pretium vitae ante sit amet, pulvinar maximus libero. Praesent lobortis, lorem congue euismod aliquam, dui nisi tincidunt dolor, vel commodo neque purus et eros. Aenean in sodales turpis. Maecenas vitae dolor lorem. Nulla lacinia bibendum euismod. Morbi sed dolor ligula. Mauris lacinia iaculis quam, a volutpat nibh vestibulum quis. Sed et erat lectus. Nullam consequat risus vel orci volutpat sagittis. Quisque nec consequat sapien, sit amet suscipit velit. Quisque faucibus velit nec dolor faucibus, eget ornare lacus bibendum. Nulla aliquam aliquam sapien, ut fringilla orci rhoncus ut.</p><p>Cras ornare vehicula suscipit. Ut convallis metus lorem, in ullamcorper neque imperdiet ac. Proin quis mauris turpis. Donec ornare dolor ut sem laoreet, sed mollis elit convallis. Maecenas pharetra metus quis odio iaculis malesuada. Etiam semper feugiat finibus. Sed venenatis rutrum elit, at fermentum mauris consectetur nec. Proin tincidunt vestibulum rutrum. Donec in dapibus nibh. Cras rutrum nisl quis magna viverra porttitor. Maecenas consectetur id arcu ac ultrices. Donec sagittis id neque ac gravida. Morbi viverra ullamcorper tortor, nec bibendum ligula viverra ac. Mauris tincidunt neque tortor. Suspendisse porta augue sed velit mollis, sollicitudin commodo ante tincidunt.</p><p>Sed nec augue ac lacus faucibus aliquam eget a odio. Donec hendrerit ornare ornare. Nam nulla ex, tincidunt id accumsan ut, euismod non ex. Pellentesque varius sapien ut purus porttitor, quis mollis enim mollis. Aenean sed gravida libero, sodales pulvinar elit. Maecenas accumsan lacinia mauris non blandit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In hac habitasse platea dictumst. Nam sit amet molestie quam. In non ultricies ex. Vivamus vel turpis sodales, gravida lacus a, mattis turpis. Mauris tempor blandit metus. Donec sed est sagittis, dignissim purus ut, varius odio.</p><p>Aliquam eu tincidunt felis, vitae congue nisi. Ut feugiat dolor ac velit lacinia pellentesque. Suspendisse tempus nulla vel mi feugiat pellentesque. Cras aliquam fermentum nisi, ut convallis purus egestas sed. Sed malesuada cursus magna, ac consectetur massa ultricies ornare. Nam mi ex, condimentum sit amet tincidunt ut, facilisis quis sem. Etiam vulputate, erat sit amet eleifend consectetur, lorem ex scelerisque felis, nec pellentesque nunc lectus eu libero. Cras sed pretium tellus. Donec non dui egestas, iaculis sapien a, eleifend risus. Morbi euismod commodo felis quis laoreet. Praesent laoreet tempor orci, sed venenatis massa sollicitudin dapibus.</p><p>Vivamus sit amet nulla sit amet ligula accumsan feugiat ornare vel est. Sed vitae lorem sed lectus dignissim bibendum id ac massa. Nulla nunc nulla, pellentesque hendrerit enim a, cursus accumsan elit. Curabitur aliquet mollis magna sed euismod. Integer suscipit, elit sed porttitor maximus, urna lorem rhoncus quam, a auctor sapien lorem porttitor erat. Aenean lobortis dolor ligula, et dictum nibh aliquam quis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer vulputate aliquam odio, ut hendrerit massa semper eget. Ut feugiat velit eget vestibulum faucibus.</p><p>Etiam risus elit, aliquet non est a, ultricies maximus justo. Quisque mollis eleifend ex. Donec bibendum sem eget diam semper faucibus. Fusce sit amet gravida tellus. Duis molestie erat dolor, sit amet interdum est pretium vitae. Donec commodo libero ut quam luctus, quis vestibulum nisi viverra. Nunc ac massa in velit cursus pharetra.</p><p>Nam varius ullamcorper ultrices. Donec consequat tortor dui, in suscipit est ultricies nec. Suspendisse potenti. Ut blandit, ligula ut egestas commodo, lectus ligula venenatis mauris, dignissim eleifend nisi urna in eros. Duis posuere ullamcorper libero, non pretium enim ultricies vel. Curabitur mollis sed risus eget pharetra. Vivamus massa ipsum, sodales eu imperdiet eu, dictum vel tortor. Vivamus vehicula egestas ligula. Nam pharetra blandit ligula id ultricies. Sed feugiat, metus sit amet malesuada rhoncus, nunc ipsum interdum mauris, id dignissim libero odio a nulla. Morbi pharetra luctus dolor id mattis. Suspendisse facilisis at nunc ac vehicula. Nullam aliquam tristique facilisis. Pellentesque finibus hendrerit orci, ut consequat erat pulvinar et.</p><p>Quisque eu blandit nunc. Praesent aliquet in leo in facilisis. Nunc facilisis pellentesque nibh, in varius orci porttitor ut. Vestibulum at nibh sed lectus dapibus consectetur. Aenean sit amet purus sem. Suspendisse purus nulla, rhoncus non tincidunt venenatis, auctor non massa. Proin semper, ante at cursus auctor, ipsum ante gravida risus, nec posuere magna nibh vitae sem. Nam lectus justo, molestie vitae metus non, vehicula volutpat nisl. Integer in scelerisque dolor, sit amet accumsan elit. Vivamus venenatis enim tellus, et dapibus odio rhoncus a.</p><p>Mauris orci enim, interdum ut sapien ac, semper finibus nulla. Morbi facilisis leo nec rutrum tempus. Sed eget nisi et neque semper mattis ut sed diam. Morbi nec elementum est. Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent dictum purus nec pharetra rhoncus. Integer id felis id orci hendrerit feugiat. Donec vel sodales nibh, molestie hendrerit libero. Quisque laoreet neque et dolor varius, eu feugiat nisl pretium. Donec eu maximus ex, imperdiet dignissim massa. Suspendisse at rhoncus tortor. Aliquam vel blandit magna. Pellentesque consequat libero metus, in rhoncus metus porta et. Vestibulum placerat nunc tortor, sit amet tempor nisi maximus quis.</p>'),(33,2,31,'<h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc fringilla ullamcorper rhoncus. Nulla venenatis porttitor nibh et vulputate. Nulla feugiat leo eget purus feugiat, ut porta est pulvinar. Sed dictum nulla ac nisl sodales, vel porttitor ligula congue. Nunc orci nibh, finibus non risus id, pretium tincidunt purus. Praesent bibendum libero auctor, auctor leo vitae, imperdiet velit. In est turpis, vestibulum vitae nisl ac, laoreet malesuada enim. Sed eget diam sit amet sem tincidunt pretium. Nam a enim metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis egestas congue hendrerit. Pellentesque a est eleifend, malesuada dui quis, viverra lectus. Integer nec convallis nibh. Vivamus porta tellus at enim semper imperdiet.</h2><h2>Quisque laoreet lacus et dolor fermentum sagittis. Proin vel urna volutpat, pretium lorem ac, mollis leo. Maecenas dolor dui, pretium vitae ante sit amet, pulvinar maximus libero. Praesent lobortis, lorem congue euismod aliquam, dui nisi tincidunt dolor, vel commodo neque purus et eros. Aenean in sodales turpis. Maecenas vitae dolor lorem. Nulla lacinia bibendum euismod. Morbi sed dolor ligula. Mauris lacinia iaculis quam, a volutpat nibh vestibulum quis. Sed et erat lectus. Nullam consequat risus vel orci volutpat sagittis. Quisque nec consequat sapien, sit amet suscipit velit. Quisque faucibus velit nec dolor faucibus, eget ornare lacus bibendum. Nulla aliquam aliquam sapien, ut fringilla orci rhoncus ut.</h2><h2>Cras ornare vehicula suscipit. Ut convallis metus lorem, in ullamcorper neque imperdiet ac. Proin quis mauris turpis. Donec ornare dolor ut sem laoreet, sed mollis elit convallis. Maecenas pharetra metus quis odio iaculis malesuada. Etiam semper feugiat finibus. Sed venenatis rutrum elit, at fermentum mauris consectetur nec. Proin tincidunt vestibulum rutrum. Donec in dapibus nibh. Cras rutrum nisl quis magna viverra porttitor. Maecenas consectetur id arcu ac ultrices. Donec sagittis id neque ac gravida. Morbi viverra ullamcorper tortor, nec bibendum ligula viverra ac. Mauris tincidunt neque tortor. Suspendisse porta augue sed velit mollis, sollicitudin commodo ante tincidunt.</h2><h2>Sed nec augue ac lacus faucibus aliquam eget a odio. Donec hendrerit ornare ornare. Nam nulla ex, tincidunt id accumsan ut, euismod non ex. Pellentesque varius sapien ut purus porttitor, quis mollis enim mollis. Aenean sed gravida libero, sodales pulvinar elit. Maecenas accumsan lacinia mauris non blandit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In hac habitasse platea dictumst. Nam sit amet molestie quam. In non ultricies ex. Vivamus vel turpis sodales, gravida lacus a, mattis turpis. Mauris tempor blandit metus. Donec sed est sagittis, dignissim purus ut, varius odio.</h2><h2>Aliquam eu tincidunt felis, vitae congue nisi. Ut feugiat dolor ac velit lacinia pellentesque. Suspendisse tempus nulla vel mi feugiat pellentesque. Cras aliquam fermentum nisi, ut convallis purus egestas sed. Sed malesuada cursus magna, ac consectetur massa ultricies ornare. Nam mi ex, condimentum sit amet tincidunt ut, facilisis quis sem. Etiam vulputate, erat sit amet eleifend consectetur, lorem ex scelerisque felis, nec pellentesque nunc lectus eu libero. Cras sed pretium tellus. Donec non dui egestas, iaculis sapien a, eleifend risus. Morbi euismod commodo felis quis laoreet. Praesent laoreet tempor orci, sed venenatis massa sollicitudin dapibus.</h2><h2>Vivamus sit amet nulla sit amet ligula accumsan feugiat ornare vel est. Sed vitae lorem sed lectus dignissim bibendum id ac massa. Nulla nunc nulla, pellentesque hendrerit enim a, cursus accumsan elit. Curabitur aliquet mollis magna sed euismod. Integer suscipit, elit sed porttitor maximus, urna lorem rhoncus quam, a auctor sapien lorem porttitor erat. Aenean lobortis dolor ligula, et dictum nibh aliquam quis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Integer vulputate aliquam odio, ut hendrerit massa semper eget. Ut feugiat velit eget vestibulum faucibus.</h2><h2>Etiam risus elit, aliquet non est a, ultricies maximus justo. Quisque mollis eleifend ex. Donec bibendum sem eget diam semper faucibus. Fusce sit amet gravida tellus. Duis molestie erat dolor, sit amet interdum est pretium vitae. Donec commodo libero ut quam luctus, quis vestibulum nisi viverra. Nunc ac massa in velit cursus pharetra.</h2><h2>Nam varius ullamcorper ultrices. Donec consequat tortor dui, in suscipit est ultricies nec. Suspendisse potenti. Ut blandit, ligula ut egestas commodo, lectus ligula venenatis mauris, dignissim eleifend nisi urna in eros. Duis posuere ullamcorper libero, non pretium enim ultricies vel. Curabitur mollis sed risus eget pharetra. Vivamus massa ipsum, sodales eu imperdiet eu, dictum vel tortor. Vivamus vehicula egestas ligula. Nam pharetra blandit ligula id ultricies. Sed feugiat, metus sit amet malesuada rhoncus, nunc ipsum interdum mauris, id dignissim libero odio a nulla. Morbi pharetra luctus dolor id mattis. Suspendisse facilisis at nunc ac vehicula. Nullam aliquam tristique facilisis. Pellentesque finibus hendrerit orci, ut consequat erat pulvinar et.</h2><h2>Quisque eu blandit nunc. Praesent aliquet in leo in facilisis. Nunc facilisis pellentesque nibh, in varius orci porttitor ut. Vestibulum at nibh sed lectus dapibus consectetur. Aenean sit amet purus sem. Suspendisse purus nulla, rhoncus non tincidunt venenatis, auctor non massa. Proin semper, ante at cursus auctor, ipsum ante gravida risus, nec posuere magna nibh vitae sem. Nam lectus justo, molestie vitae metus non, vehicula volutpat nisl. Integer in scelerisque dolor, sit amet accumsan elit. Vivamus venenatis enim tellus, et dapibus odio rhoncus a.</h2><h2>Mauris orci enim, interdum ut sapien ac, semper finibus nulla. Morbi facilisis leo nec rutrum tempus. Sed eget nisi et neque semper mattis ut sed diam. Morbi nec elementum est. Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent dictum purus nec pharetra rhoncus. Integer id felis id orci hendrerit feugiat. Donec vel sodales nibh, molestie hendrerit libero. Quisque laoreet neque et dolor varius, eu feugiat nisl pretium. Donec eu maximus ex, imperdiet dignissim massa. Suspendisse at rhoncus tortor. Aliquam vel blandit magna. Pellentesque consequat libero metus, in rhoncus metus porta et. Vestibulum placerat nunc tortor, sit amet tempor nisi maximus quis.</h2>'),(34,0,32,'<p>Тестовый текст</p>'),(35,1,32,'<p>Новый слайд</p>');
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'protocols'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-17 14:04:51
