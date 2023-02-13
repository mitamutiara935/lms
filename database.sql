-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: LMS
-- ------------------------------------------------------
-- Server version	10.5.18-MariaDB

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
-- Table structure for table `ChatRoom`
--

DROP TABLE IF EXISTS `ChatRoom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChatRoom` (
							`Id` int(11) NOT NULL AUTO_INCREMENT,
							`Name` longtext NOT NULL,
							`Description` longtext DEFAULT NULL,
							`ImagePath` longtext DEFAULT NULL,
							`IsPublic` tinyint(1) NOT NULL,
							`IsDisabled` tinyint(1) NOT NULL,
							`DateCreated` datetime(6) NOT NULL,
							`DateModified` datetime(6) NOT NULL,
							PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChatRoom`
--

LOCK TABLES `ChatRoom` WRITE;
/*!40000 ALTER TABLE `ChatRoom` DISABLE KEYS */;
/*!40000 ALTER TABLE `ChatRoom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Choice`
--

DROP TABLE IF EXISTS `Choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Choice` (
						  `Id` int(11) NOT NULL AUTO_INCREMENT,
						  `Text` longtext NOT NULL,
						  `IsCorrect` tinyint(1) NOT NULL,
						  `DateCreated` datetime(6) NOT NULL,
						  `DateModified` datetime(6) NOT NULL,
						  `QuizId` int(11) DEFAULT NULL,
						  PRIMARY KEY (`Id`),
						  KEY `IX_Choice_QuizId` (`QuizId`),
						  CONSTRAINT `FK_Choice_Quiz_QuizId` FOREIGN KEY (`QuizId`) REFERENCES `Quiz` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Choice`
--

LOCK TABLES `Choice` WRITE;
/*!40000 ALTER TABLE `Choice` DISABLE KEYS */;
/*!40000 ALTER TABLE `Choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Courses`
--

DROP TABLE IF EXISTS `Courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Courses` (
						   `Id` int(11) NOT NULL AUTO_INCREMENT,
						   `Name` longtext NOT NULL,
						   `Description` longtext NOT NULL,
						   `AttachmentPath` longtext DEFAULT NULL,
						   `Category` longtext NOT NULL,
						   `DateCreated` datetime(6) NOT NULL,
						   `DateModified` datetime(6) NOT NULL,
						   PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courses`
--

LOCK TABLES `Courses` WRITE;
/*!40000 ALTER TABLE `Courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `Courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lessons`
--

DROP TABLE IF EXISTS `Lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lessons` (
						   `Id` int(11) NOT NULL AUTO_INCREMENT,
						   `Name` longtext NOT NULL,
						   `Description` longtext NOT NULL,
						   `VideoPath` longtext DEFAULT NULL,
						   `ChatRoomId` int(11) DEFAULT NULL,
						   `DateCreated` datetime(6) NOT NULL,
						   `DateModified` datetime(6) NOT NULL,
						   `CoursesId` int(11) DEFAULT NULL,
						   PRIMARY KEY (`Id`),
						   KEY `IX_Lessons_ChatRoomId` (`ChatRoomId`),
						   KEY `IX_Lessons_CoursesId` (`CoursesId`),
						   CONSTRAINT `FK_Lessons_ChatRoom_ChatRoomId` FOREIGN KEY (`ChatRoomId`) REFERENCES `ChatRoom` (`Id`),
						   CONSTRAINT `FK_Lessons_Courses_CoursesId` FOREIGN KEY (`CoursesId`) REFERENCES `Courses` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lessons`
--

LOCK TABLES `Lessons` WRITE;
/*!40000 ALTER TABLE `Lessons` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Message` (
						   `Id` int(11) NOT NULL AUTO_INCREMENT,
						   `Text` longtext NOT NULL,
						   `AttachmentPath` longtext NOT NULL,
						   `UserId` int(11) NOT NULL,
						   `DateCreated` datetime(6) NOT NULL,
						   `DateModified` datetime(6) NOT NULL,
						   `ChatRoomId` int(11) DEFAULT NULL,
						   `MessageId` int(11) DEFAULT NULL,
						   PRIMARY KEY (`Id`),
						   KEY `IX_Message_ChatRoomId` (`ChatRoomId`),
						   KEY `IX_Message_MessageId` (`MessageId`),
						   KEY `IX_Message_UserId` (`UserId`),
						   CONSTRAINT `FK_Message_ChatRoom_ChatRoomId` FOREIGN KEY (`ChatRoomId`) REFERENCES `ChatRoom` (`Id`),
						   CONSTRAINT `FK_Message_Message_MessageId` FOREIGN KEY (`MessageId`) REFERENCES `Message` (`Id`),
						   CONSTRAINT `FK_Message_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Message`
--

LOCK TABLES `Message` WRITE;
/*!40000 ALTER TABLE `Message` DISABLE KEYS */;
/*!40000 ALTER TABLE `Message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Quiz`
--

DROP TABLE IF EXISTS `Quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Quiz` (
						`Id` int(11) NOT NULL AUTO_INCREMENT,
						`Name` longtext NOT NULL,
						`Question` longtext NOT NULL,
						`IsMultipleChoice` tinyint(1) NOT NULL,
						`IsTrueFalse` tinyint(1) NOT NULL,
						`IsFillInTheBlank` tinyint(1) NOT NULL,
						`Answer` longtext DEFAULT NULL,
						`DateCreated` datetime(6) NOT NULL,
						`DateModified` datetime(6) NOT NULL,
						`LessonId` int(11) DEFAULT NULL,
						PRIMARY KEY (`Id`),
						KEY `IX_Quiz_LessonId` (`LessonId`),
						CONSTRAINT `FK_Quiz_Lessons_LessonId` FOREIGN KEY (`LessonId`) REFERENCES `Lessons` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Quiz`
--

LOCK TABLES `Quiz` WRITE;
/*!40000 ALTER TABLE `Quiz` DISABLE KEYS */;
/*!40000 ALTER TABLE `Quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
						 `Id` int(11) NOT NULL AUTO_INCREMENT,
						 `Name` longtext NOT NULL,
						 `Email` longtext NOT NULL,
						 `Password` longtext NOT NULL,
						 `IsAdmin` tinyint(1) NOT NULL,
						 `IsTeacher` tinyint(1) NOT NULL,
						 `IsStudent` tinyint(1) NOT NULL,
						 `DateCreated` datetime(6) NOT NULL,
						 `DateModified` datetime(6) NOT NULL,
						 `ChatRoomId` int(11) DEFAULT NULL,
						 PRIMARY KEY (`Id`),
						 KEY `IX_Users_ChatRoomId` (`ChatRoomId`),
						 CONSTRAINT `FK_Users_ChatRoom_ChatRoomId` FOREIGN KEY (`ChatRoomId`) REFERENCES `ChatRoom` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `__EFMigrationsHistory`
--

DROP TABLE IF EXISTS `__EFMigrationsHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__EFMigrationsHistory` (
										 `MigrationId` varchar(150) NOT NULL,
										 `ProductVersion` varchar(32) NOT NULL,
										 PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__EFMigrationsHistory`
--

LOCK TABLES `__EFMigrationsHistory` WRITE;
/*!40000 ALTER TABLE `__EFMigrationsHistory` DISABLE KEYS */;
INSERT INTO `__EFMigrationsHistory` VALUES ('20230209054302_InitialCreate','7.0.2');
/*!40000 ALTER TABLE `__EFMigrationsHistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-09 13:24:58
