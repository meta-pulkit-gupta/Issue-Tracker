-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: issue_tracker
-- ------------------------------------------------------
-- Server version	5.5.23

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_comments_issues1` (`issue_id`),
  CONSTRAINT `fk_comments_issues1` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  `dept_head` int(11) DEFAULT NULL,
  PRIMARY KEY (`dept_id`),
  KEY `fk_department_user_details` (`dept_head`),
  CONSTRAINT `fk_department_user_details` FOREIGN KEY (`dept_head`) REFERENCES `user_details` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_attachment`
--

DROP TABLE IF EXISTS `issue_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_attachment` (
  `attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) NOT NULL,
  `attachment_url` varchar(400) NOT NULL,
  PRIMARY KEY (`attachment_id`),
  KEY `fk_issue_attachment_issues1` (`issue_id`),
  CONSTRAINT `fk_issue_attachment_issues1` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_attachment`
--

LOCK TABLES `issue_attachment` WRITE;
/*!40000 ALTER TABLE `issue_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_resolvers`
--

DROP TABLE IF EXISTS `issue_resolvers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_resolvers` (
  `issue_id` int(11) NOT NULL,
  `resolver_id` int(11) NOT NULL,
  PRIMARY KEY (`issue_id`,`resolver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_resolvers`
--

LOCK TABLES `issue_resolvers` WRITE;
/*!40000 ALTER TABLE `issue_resolvers` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_resolvers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_status`
--

DROP TABLE IF EXISTS `issue_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_status` (
  `issue_id` int(11) NOT NULL,
  `status` enum('received','approved','assigned','resolved','closed','rejected','conflict') NOT NULL DEFAULT 'received',
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`issue_id`,`status`),
  KEY `fk_issue_status_issues1` (`issue_id`),
  CONSTRAINT `fk_issue_status_issues1` FOREIGN KEY (`issue_id`) REFERENCES `issues` (`issue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_status`
--

LOCK TABLES `issue_status` WRITE;
/*!40000 ALTER TABLE `issue_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_tags`
--

DROP TABLE IF EXISTS `issue_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_tags` (
  `issue_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`issue_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_tags`
--

LOCK TABLES `issue_tags` WRITE;
/*!40000 ALTER TABLE `issue_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dept_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `body` blob NOT NULL,
  `priority` enum('low','medium','high') DEFAULT 'low',
  `target_resolution_date` timestamp NULL DEFAULT NULL,
  `actual_resolution_date` timestamp NULL DEFAULT NULL,
  `current_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `fk_issues_user_details` (`created_by`),
  KEY `fk_issues_department1` (`dept_id`),
  CONSTRAINT `fk_issues_department1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_issues_user_details` FOREIGN KEY (`created_by`) REFERENCES `user_details` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL,
  `tag_title` varchar(45) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `google_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('general','dept-head','admin','resolver') DEFAULT 'general',
  `dept_id` int(11) DEFAULT '0',
  `profile_pic_url` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `google_id_UNIQUE` (`google_id`),
  KEY `fk_user_details_department` (`dept_id`),
  CONSTRAINT `fk_user_details_department` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (4,'109787325126113718726','Pulkit Gupta','pulkit.gupta@metacube.com','general',NULL,'https://lh6.googleusercontent.com/-fIsSEq06kgg/AAAAAAAAAAI/AAAAAAAAACc/LkvNMFlCdaw/s96-c/photo.jpg');
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-14 14:55:58
