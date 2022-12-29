-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: ledger
-- ------------------------------------------------------
-- Server version	5.7.39-log

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'user1@gmail.com',0,1,8);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user`
--

DROP TABLE IF EXISTS `accounts_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_email_b2644a56_uniq` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user`
--

LOCK TABLES `accounts_user` WRITE;
/*!40000 ALTER TABLE `accounts_user` DISABLE KEYS */;
INSERT INTO `accounts_user` VALUES (1,'pbkdf2_sha256$260000$pFjAswDcZTrhioGR8UJHpS$I+ebxUix5tbiFz6Jx64dzKVdRGCLkX/gvsxRS8D19UU=','2022-12-28 09:29:47.286264','',1,0),(2,'pbkdf2_sha256$260000$wERjkmf6XRaZBC9bMAoYmq$6lLxnL28uurtoddluI+ZVlYD07gObf6W5seh8IBZ2yo=','2022-12-28 09:54:57.417355','user@gmail.com',1,0),(3,'pbkdf2_sha256$260000$PBmXfdoVnET8froY2UpeYF$iPTZbLiXI2ql6z582gEr1rwy+Zz9iesSeH5mJiQleBo=',NULL,'admin@user.com',1,0),(4,'pbkdf2_sha256$260000$SKJbKxNWcX37erg4vSyiXU$krGIgp3qoPNElhbITSnQ7kBv+U8JmHYDkOy36FEpaXQ=',NULL,'admin@admin.com',1,0),(5,'pbkdf2_sha256$260000$J9BMagUA0ItRjtCT3aS36W$BQJBn9ggvrKD2IjWr437bKGI0I0tuT4/seW5V8KJeps=',NULL,'admin2@admin.com',1,0),(6,'pbkdf2_sha256$260000$cBk6IQAjHufZgyii2W8m30$OTBF5WrgwgbWzQ4Q1qiMbYC58gXVy5OQeZcmMaAqqCc=',NULL,'admin3@admin.com',1,1),(7,'pbkdf2_sha256$260000$ZGFb3ibTtkJJs4sUkLDBex$swKgigU5QiXEfSgCVLIfoHMqiUNzMTH54UxMDBhkg1o=','2022-12-28 10:08:16.101896','admin4@admin.com',1,1),(8,'pbkdf2_sha256$260000$uFiiEblJVuotXIJF2nx547$y5ibmcbhKhU8fDMJZ+TRM+CwCd8wajmdbDaabgJ/1BE=','2022-12-30 00:28:45.388393','user1@gmail.com',1,0),(9,'pbkdf2_sha256$260000$MD27L6K7cbG8p7hCKbay87$shZj2QLFKEYZTp7BSsGVhmUzuitom0fi+qxxwyYQ3Fo=','2022-12-30 00:28:20.297160','admin@gmail.com',1,1);
/*!40000 ALTER TABLE `accounts_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add ledgers',7,'add_ledgers'),(26,'Can change ledgers',7,'change_ledgers'),(27,'Can delete ledgers',7,'delete_ledgers'),(28,'Can view ledgers',7,'view_ledgers'),(29,'Can add blacklisted token',8,'add_blacklistedtoken'),(30,'Can change blacklisted token',8,'change_blacklistedtoken'),(31,'Can delete blacklisted token',8,'delete_blacklistedtoken'),(32,'Can view blacklisted token',8,'view_blacklistedtoken'),(33,'Can add outstanding token',9,'add_outstandingtoken'),(34,'Can change outstanding token',9,'change_outstandingtoken'),(35,'Can delete outstanding token',9,'delete_outstandingtoken'),(36,'Can view outstanding token',9,'view_outstandingtoken'),(37,'Can add Token',10,'add_token'),(38,'Can change Token',10,'change_token'),(39,'Can delete Token',10,'delete_token'),(40,'Can view Token',10,'view_token'),(41,'Can add token',11,'add_tokenproxy'),(42,'Can change token',11,'change_tokenproxy'),(43,'Can delete token',11,'delete_tokenproxy'),(44,'Can view token',11,'view_tokenproxy'),(45,'Can add email address',12,'add_emailaddress'),(46,'Can change email address',12,'change_emailaddress'),(47,'Can delete email address',12,'delete_emailaddress'),(48,'Can view email address',12,'view_emailaddress'),(49,'Can add email confirmation',13,'add_emailconfirmation'),(50,'Can change email confirmation',13,'change_emailconfirmation'),(51,'Can delete email confirmation',13,'delete_emailconfirmation'),(52,'Can view email confirmation',13,'view_emailconfirmation'),(53,'Can add social account',14,'add_socialaccount'),(54,'Can change social account',14,'change_socialaccount'),(55,'Can delete social account',14,'delete_socialaccount'),(56,'Can view social account',14,'view_socialaccount'),(57,'Can add social application',15,'add_socialapp'),(58,'Can change social application',15,'change_socialapp'),(59,'Can delete social application',15,'delete_socialapp'),(60,'Can view social application',15,'view_socialapp'),(61,'Can add social application token',16,'add_socialtoken'),(62,'Can change social application token',16,'change_socialtoken'),(63,'Can delete social application token',16,'delete_socialtoken'),(64,'Can view social application token',16,'view_socialtoken'),(65,'Can add site',17,'add_site'),(66,'Can change site',17,'change_site'),(67,'Can delete site',17,'delete_site'),(68,'Can view site',17,'view_site'),(69,'Can add url',18,'add_url'),(70,'Can change url',18,'change_url'),(71,'Can delete url',18,'delete_url'),(72,'Can view url',18,'view_url');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-12-29 23:47:43.324678','5','Url object (5)',3,'',18,9),(2,'2022-12-29 23:47:43.326673','4','Url object (4)',3,'',18,9),(3,'2022-12-29 23:47:43.327671','3','Url object (3)',3,'',18,9),(4,'2022-12-29 23:47:43.330661','2','Url object (2)',3,'',18,9),(5,'2022-12-29 23:47:43.331659','1','Url object (1)',3,'',18,9),(6,'2022-12-30 00:28:26.074377','13','Url object (13)',3,'',18,9),(7,'2022-12-30 00:28:26.076382','12','Url object (12)',3,'',18,9),(8,'2022-12-30 00:28:26.077369','11','Url object (11)',3,'',18,9),(9,'2022-12-30 00:28:26.079364','10','Url object (10)',3,'',18,9),(10,'2022-12-30 00:28:26.080362','9','Url object (9)',3,'',18,9),(11,'2022-12-30 00:28:26.082357','8','Url object (8)',3,'',18,9),(12,'2022-12-30 00:28:26.084350','7','Url object (7)',3,'',18,9),(13,'2022-12-30 00:28:26.085348','6','Url object (6)',3,'',18,9);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (12,'account','emailaddress'),(13,'account','emailconfirmation'),(6,'accounts','user'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(10,'authtoken','token'),(11,'authtoken','tokenproxy'),(4,'contenttypes','contenttype'),(7,'ledgers','ledgers'),(5,'sessions','session'),(18,'shortener','url'),(17,'sites','site'),(14,'socialaccount','socialaccount'),(15,'socialaccount','socialapp'),(16,'socialaccount','socialtoken'),(8,'token_blacklist','blacklistedtoken'),(9,'token_blacklist','outstandingtoken');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-12-28 09:03:24.073825'),(2,'contenttypes','0002_remove_content_type_name','2022-12-28 09:03:24.162697'),(3,'auth','0001_initial','2022-12-28 09:03:24.414292'),(4,'auth','0002_alter_permission_name_max_length','2022-12-28 09:03:24.430273'),(5,'auth','0003_alter_user_email_max_length','2022-12-28 09:03:24.435923'),(6,'auth','0004_alter_user_username_opts','2022-12-28 09:03:24.440877'),(7,'auth','0005_alter_user_last_login_null','2022-12-28 09:03:24.446874'),(8,'auth','0006_require_contenttypes_0002','2022-12-28 09:03:24.448870'),(9,'auth','0007_alter_validators_add_error_messages','2022-12-28 09:03:24.455850'),(10,'auth','0008_alter_user_username_max_length','2022-12-28 09:03:24.464005'),(11,'auth','0009_alter_user_last_name_max_length','2022-12-28 09:03:24.468969'),(12,'auth','0010_alter_group_name_max_length','2022-12-28 09:03:24.484925'),(13,'auth','0011_update_proxy_permissions','2022-12-28 09:03:24.491907'),(14,'auth','0012_alter_user_first_name_max_length','2022-12-28 09:03:24.496924'),(15,'accounts','0001_initial','2022-12-28 09:03:24.768760'),(16,'account','0001_initial','2022-12-28 09:03:24.944445'),(17,'account','0002_email_max_length','2022-12-28 09:03:24.981344'),(18,'admin','0001_initial','2022-12-28 09:03:25.106043'),(19,'admin','0002_logentry_remove_auto_add','2022-12-28 09:03:25.114987'),(20,'admin','0003_logentry_add_action_flag_choices','2022-12-28 09:03:25.123962'),(21,'authtoken','0001_initial','2022-12-28 09:03:25.200783'),(22,'authtoken','0002_auto_20160226_1747','2022-12-28 09:03:25.233673'),(23,'authtoken','0003_tokenproxy','2022-12-28 09:03:25.238662'),(24,'ledgers','0001_initial','2022-12-28 09:03:25.322869'),(25,'sessions','0001_initial','2022-12-28 09:03:25.361720'),(26,'sites','0001_initial','2022-12-28 09:03:25.394183'),(27,'sites','0002_alter_domain_unique','2022-12-28 09:03:25.411132'),(28,'socialaccount','0001_initial','2022-12-28 09:03:25.835017'),(29,'socialaccount','0002_token_max_lengths','2022-12-28 09:03:25.911812'),(30,'socialaccount','0003_extra_data_default_dict','2022-12-28 09:03:25.922784'),(31,'token_blacklist','0001_initial','2022-12-28 09:03:26.077268'),(32,'token_blacklist','0002_outstandingtoken_jti_hex','2022-12-28 09:03:26.121190'),(33,'token_blacklist','0003_auto_20171017_2007','2022-12-28 09:03:26.137180'),(34,'token_blacklist','0004_auto_20171017_2013','2022-12-28 09:03:26.194865'),(35,'token_blacklist','0005_remove_outstandingtoken_jti','2022-12-28 09:03:26.263876'),(36,'token_blacklist','0006_auto_20171017_2113','2022-12-28 09:03:26.283799'),(37,'token_blacklist','0007_auto_20171017_2214','2022-12-28 09:03:26.416823'),(38,'token_blacklist','0008_migrate_to_bigautofield','2022-12-28 09:03:26.614444'),(39,'token_blacklist','0010_fix_migrate_to_bigautofield','2022-12-28 09:03:26.630475'),(40,'token_blacklist','0011_linearizes_history','2022-12-28 09:03:26.634000'),(41,'token_blacklist','0012_alter_outstandingtoken_user','2022-12-28 09:03:26.646993'),(42,'accounts','0002_auto_20221228_1854','2022-12-28 09:54:44.060288'),(43,'accounts','0003_auto_20221228_1900','2022-12-28 10:00:21.188671'),(44,'accounts','0004_remove_user_is_admin','2022-12-28 10:03:19.408760'),(45,'accounts','0005_rename_is_staff_user_is_admin','2022-12-28 10:04:43.278174'),(46,'accounts','0006_rename_is_admin_user_is_staff','2022-12-28 10:07:34.735900'),(47,'shortener','0001_initial','2022-12-29 13:34:22.246632');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('05yet56c1197d5n9pj25fnin6h4mp4uh','.eJxVjEEOwiAQRe_C2pBCOzB16b5nIDMMStVAUtqV8e7apAvd_vfef6lA25rD1tISZlFnher0uzHFRyo7kDuVW9WxlnWZWe-KPmjTU5X0vBzu30Gmlr-1Tb0M0CE4FOQrcUoI4smQSM-EYw-CbhwicOcscgRkb42w8d5Zg-r9AfkIN-Y:1pAWTa:afgehHKLkvlpvIC4Uh4hG_lIg2LmCPg7WPp_RVUwP_c','2023-01-11 13:28:10.311164'),('55wt1ykto0cj1sw44t4gj8txdkoiauiw','.eJxVjEEOwiAQRe_C2pBCOzB16b5nIDMMStVAUtqV8e7apAvd_vfef6lA25rD1tISZlFnher0uzHFRyo7kDuVW9WxlnWZWe-KPmjTU5X0vBzu30Gmlr-1Tb0M0CE4FOQrcUoI4smQSM-EYw-CbhwicOcscgRkb42w8d5Zg-r9AfkIN-Y:1pAWU5:8grD6F6kD_3b0ZJsZJ3_3DodC2UIgDHcXboFNg6thWU','2023-01-11 13:28:41.082168'),('8jfhj7e8a96g85si70r9qyyp6a0uzav4','.eJxVjEEOwiAQRe_C2pBCOzB16b5nIDMMStVAUtqV8e7apAvd_vfef6lA25rD1tISZlFnher0uzHFRyo7kDuVW9WxlnWZWe-KPmjTU5X0vBzu30Gmlr-1Tb0M0CE4FOQrcUoI4smQSM-EYw-CbhwicOcscgRkb42w8d5Zg-r9AfkIN-Y:1pAWUM:IGWkoi9iakH6Rf4T2Y3Mf22SAQ2bAedPhg0xY_StY7U','2023-01-11 13:28:58.478778'),('fy4caxdz19rzxrcwy4jovbcw1y1db3ii','.eJxVjEEOwiAQRe_C2pBCOzB16b5nIDMMStVAUtqV8e7apAvd_vfef6lA25rD1tISZlFnher0uzHFRyo7kDuVW9WxlnWZWe-KPmjTU5X0vBzu30Gmlr-1Tb0M0CE4FOQrcUoI4smQSM-EYw-CbhwicOcscgRkb42w8d5Zg-r9AfkIN-Y:1pAWZC:yYANgMAWf_PlfBpw7TpoxCHuJeSNbxKQLLPCaAZJzRY','2023-01-11 13:33:58.391277'),('gh5fy4tfjaxibo4q6yitot2b3vcmpfis','.eJxVjEEOwiAQRe_C2pBCOzB16b5nIDMMStVAUtqV8e7apAvd_vfef6lA25rD1tISZlFnher0uzHFRyo7kDuVW9WxlnWZWe-KPmjTU5X0vBzu30Gmlr-1Tb0M0CE4FOQrcUoI4smQSM-EYw-CbhwicOcscgRkb42w8d5Zg-r9AfkIN-Y:1pAVTh:819CyVDmx17zx2JHBUWIXNYtRMCV64nu9e62JsAXoik','2023-01-11 12:24:13.086437'),('i6tq0d98d7wavtlprxeb09ly8vjejhb7','.eJxVjEEOwiAQRe_C2pBCOzB16b5nIDMMStVAUtqV8e7apAvd_vfef6lA25rD1tISZlFnher0uzHFRyo7kDuVW9WxlnWZWe-KPmjTU5X0vBzu30Gmlr-1Tb0M0CE4FOQrcUoI4smQSM-EYw-CbhwicOcscgRkb42w8d5Zg-r9AfkIN-Y:1pAVRa:JhHJ0v1Wx1z21xvBavYqY4A-wfr4ClJc2cX_ZtBf6l4','2023-01-11 12:22:02.479620'),('kk3qwopp3u8nooz6c90dg2yiu33cgmql','.eJxVjEEOwiAQRe_C2pBCOzB16b5nIDMMStVAUtqV8e7apAvd_vfef6lA25rD1tISZlFnher0uzHFRyo7kDuVW9WxlnWZWe-KPmjTU5X0vBzu30Gmlr-1Tb0M0CE4FOQrcUoI4smQSM-EYw-CbhwicOcscgRkb42w8d5Zg-r9AfkIN-Y:1pAupp:KF5VR8LiQRvXwzBE4t_wN9usDKh6atf1LXeRUrbLO9k','2023-01-13 00:28:45.409336'),('qntfc98nj41k2kjjuzabtfllbnue7yud','.eJxVjEEOwiAQRe_C2pBCOzB16b5nIDMMStVAUtqV8e7apAvd_vfef6lA25rD1tISZlFnher0uzHFRyo7kDuVW9WxlnWZWe-KPmjTU5X0vBzu30Gmlr-1Tb0M0CE4FOQrcUoI4smQSM-EYw-CbhwicOcscgRkb42w8d5Zg-r9AfkIN-Y:1pAWNo:t3c3m0Kc8V3xKANKy1R5Q3i5KdSb_SBTVPFl26s2LlE','2023-01-11 13:22:12.298759'),('v6gbnqumkbqpp1nv0ak7wkz1rvt4mzfk','.eJxVjEEOwiAQRe_C2pBCOzB16b5nIDMMStVAUtqV8e7apAvd_vfef6lA25rD1tISZlFnher0uzHFRyo7kDuVW9WxlnWZWe-KPmjTU5X0vBzu30Gmlr-1Tb0M0CE4FOQrcUoI4smQSM-EYw-CbhwicOcscgRkb42w8d5Zg-r9AfkIN-Y:1pAW5E:kzmU9gj5vnE09F-QWzlYgcUqdmMswwDTSIRHSeHxU-U','2023-01-11 13:03:00.652317'),('y5qeq6lbefrmgv30n4npk6ce310ytyfh','.eJxVjEEOwiAQRe_C2pBCOzB16b5nIDMMStVAUtqV8e7apAvd_vfef6lA25rD1tISZlFnher0uzHFRyo7kDuVW9WxlnWZWe-KPmjTU5X0vBzu30Gmlr-1Tb0M0CE4FOQrcUoI4smQSM-EYw-CbhwicOcscgRkb42w8d5Zg-r9AfkIN-Y:1pAVTH:V9w-dQtixsSQfGOoelWNN9EQ91RJCy1kX58OzRQJt3E','2023-01-11 12:23:47.543289');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ledgers_ledgers`
--

DROP TABLE IF EXISTS `ledgers_ledgers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ledgers_ledgers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `categories` varchar(10) NOT NULL,
  `title` varchar(80) NOT NULL,
  `content` longtext NOT NULL,
  `paymoney` varchar(20) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `paid_at` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ledgers_ledgers_user_id_353aee0a_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `ledgers_ledgers_user_id_353aee0a_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledgers_ledgers`
--

LOCK TABLES `ledgers_ledgers` WRITE;
/*!40000 ALTER TABLE `ledgers_ledgers` DISABLE KEYS */;
INSERT INTO `ledgers_ledgers` VALUES (1,'금융','적금','적금 월 500,000','500000','2022-12-29 08:42:53.815949','2022-12-31 14:59:00.000000',8),(2,'외식','외식','소고기 100,000','100000','2022-12-29 14:04:46.371588','2022-12-30 07:04:00.000000',8),(3,'외식','외식','소고기 100,000','100000','2022-12-30 00:40:00.526621','2022-12-30 07:04:00.000000',8),(4,'금융','적금','적금 월 500,000','500000','2022-12-30 00:40:10.990249','2022-12-31 14:59:00.000000',8),(5,'금융','적금','적금 월 500,000','500000','2022-12-30 00:40:16.110269','2022-12-31 14:59:00.000000',8);
/*!40000 ALTER TABLE `ledgers_ledgers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shortener_url`
--

DROP TABLE IF EXISTS `shortener_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shortener_url` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `link` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_link` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shortener_url`
--

LOCK TABLES `shortener_url` WRITE;
/*!40000 ALTER TABLE `shortener_url` DISABLE KEYS */;
INSERT INTO `shortener_url` VALUES (14,'http://localhost:8000/ledgers/2/detail','localhost:8000/trTE9qfM','2023-01-06 00:29:13.768392'),(15,'http://localhost:8000/ledgers/1/detail','localhost:8000/RKriwZev','2022-12-30 00:35:38.905955');
/*!40000 ALTER TABLE `shortener_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

DROP TABLE IF EXISTS `token_blacklist_blacklistedtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

LOCK TABLES `token_blacklist_blacklistedtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

DROP TABLE IF EXISTS `token_blacklist_outstandingtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `jti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  KEY `token_blacklist_outs_user_id_83bc629a_fk_accounts_` (`user_id`),
  CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_outstandingtoken` VALUES (1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzc1ODI1MCwiaWF0IjoxNjcyMjIyMjUwLCJqdGkiOiI3MGViOGZlZGU3ZDQ0MTc1YmQyOWQ0NWQ3YzNiYWFiYyIsInVzZXJfaWQiOjh9.YwAHoqEbFVRhb1ZnKpl__gzeny9Xhwf_YD7_Phzg1Yg','2022-12-28 10:10:50.097952','2023-12-28 10:10:50.000000',8,'70eb8fede7d44175bd29d45d7c3baabc'),(2,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzc1ODM3NSwiaWF0IjoxNjcyMjIyMzc1LCJqdGkiOiI2MDgyOTJlMWVhZDA0NjBmODllYTRkMTNlMDcyYzIxMiIsInVzZXJfaWQiOjh9.7HScErz50O6LXXv-LLhHx8Z8t3ThvGBu9K2fxSJBudE','2022-12-28 10:12:55.420605','2023-12-28 10:12:55.000000',8,'608292e1ead0460f89ea4d13e072c212'),(3,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzc2MTE0OSwiaWF0IjoxNjcyMjI1MTQ5LCJqdGkiOiI2NzAyMGRlZDAzODM0MDM2OTE2YWNhNGQ4Nzc2MTIzOCIsInVzZXJfaWQiOjh9.3s75a-UneqAZ1JOWN6QTT1PmQt5oipAb5_Dq6C87wTo','2022-12-28 10:59:09.462792','2023-12-28 10:59:09.000000',8,'67020ded03834036916aca4d87761238'),(4,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzc2MjM5NiwiaWF0IjoxNjcyMjI2Mzk2LCJqdGkiOiJiMDM5ZjcxZTgyZTc0NmU1OTY2YTRhYjIzMTZmM2IzMCIsInVzZXJfaWQiOjh9.4SAvKBpkY-a9jBVJfZrU3SRPffgd3-cV21wZ1LsyNVI','2022-12-28 11:19:56.148687','2023-12-28 11:19:56.000000',8,'b039f71e82e746e5966a4ab2316f3b30'),(5,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzc2NDA0OSwiaWF0IjoxNjcyMjI4MDQ5LCJqdGkiOiIxYjg5M2E5NWI4ODA0MjQ3OTMwMTQzNTJiMzRhNDU4NiIsInVzZXJfaWQiOjh9.hzMoQmaU7RAuulzXGgO136jOyh3XQiFRHpVart82qHY','2022-12-28 11:47:29.914483','2023-12-28 11:47:29.000000',8,'1b893a95b880424793014352b34a4586'),(6,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzc2NTY1OSwiaWF0IjoxNjcyMjI5NjU5LCJqdGkiOiIxOTRkNGIyYWYzYzk0OWNjODhmZTE4ZDkyYTRhZDQzZSIsInVzZXJfaWQiOjh9.3Zg8prnWTNQHc5lrBMwLWLFpOB0DPVqLZrf-W8zUcJE','2022-12-28 12:14:19.303807','2023-12-28 12:14:19.000000',8,'194d4b2af3c949cc88fe18d92a4ad43e'),(7,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzc2NTY5OSwiaWF0IjoxNjcyMjI5Njk5LCJqdGkiOiI1ZjZmNjY5YzA1NGQ0MmE4YjM5YjA1ZjczMTcxMDJjMCIsInVzZXJfaWQiOjh9.t1QsAPBsagOV8rIUGQWGNiEGtturuZ_p_ZI89oLWO0s','2022-12-28 12:14:59.918786','2023-12-28 12:14:59.000000',8,'5f6f669c054d42a8b39b05f7317102c0'),(8,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzc2NjEyMiwiaWF0IjoxNjcyMjMwMTIyLCJqdGkiOiJhMDExY2RjY2Q4NTg0ODVlYmI0ZjUxZDA0Y2I4MGVlYiIsInVzZXJfaWQiOjh9.-jjyxYfsdS8HWBiz7ENV0oo_T_1IgP_amD8kE1SdLoE','2022-12-28 12:22:02.434993','2023-12-28 12:22:02.000000',8,'a011cdccd858485ebb4f51d04cb80eeb'),(9,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzc2NjIyNywiaWF0IjoxNjcyMjMwMjI3LCJqdGkiOiI2NTI3NGU2YzBiNzg0NDUzYTM5MmZiMDJjZTUzMDE2NyIsInVzZXJfaWQiOjh9.ZD0j7yjTC1ErppK08FhZpDPnU3tMHlAgGnEydPHp5Zo','2022-12-28 12:23:47.534164','2023-12-28 12:23:47.000000',8,'65274e6c0b784453a392fb02ce530167'),(10,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzc2NjI1MywiaWF0IjoxNjcyMjMwMjUzLCJqdGkiOiI1M2M4YTY3NjFhN2M0MzY3YWQyNDk2NjY2YmY0YmM5OCIsInVzZXJfaWQiOjh9.mo4-HZuWVrZ6aI66rPYUhFWju9VaiU496xSQCMznzBk','2022-12-28 12:24:13.077461','2023-12-28 12:24:13.000000',8,'53c8a6761a7c4367ad2496666bf4bc98'),(11,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzc2ODQxMSwiaWF0IjoxNjcyMjMyNDExLCJqdGkiOiI4MWY4NjQzZTkwMDk0NDc3OTRhZGVlMGZlMWUwNjJjNSIsInVzZXJfaWQiOjh9.mk2MbWQp3k8o8Sush2MjG0uMkvbTObkr6st54h4K1aI','2022-12-28 13:00:11.220264','2023-12-28 13:00:11.000000',8,'81f8643e9009447794adee0fe1e062c5'),(12,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzc2ODU4MCwiaWF0IjoxNjcyMjMyNTgwLCJqdGkiOiI2MjU4Y2JlZWVkMzM0ZTcyYmJlNzZiNTc0OWJhMTg5MCIsInVzZXJfaWQiOjh9.bTh7o6PEJrsv9kJqwBg6ivDhPq7T56fzYzc8IJ_6X1Q','2022-12-28 13:03:00.643313','2023-12-28 13:03:00.000000',8,'6258cbeeed334e72bbe76b5749ba1890'),(13,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzc2OTczMiwiaWF0IjoxNjcyMjMzNzMyLCJqdGkiOiJiZmJlOTA0MjlkNzE0MjEwODIzZGEzYjMxNjU4ZGU2NiIsInVzZXJfaWQiOjh9.2kSgiVz0xjtv8tE9IDGEvgcCnirgQnfcIMvEPe0NJsg','2022-12-28 13:22:12.231938','2023-12-28 13:22:12.000000',8,'bfbe90429d714210823da3b31658de66'),(14,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzc2OTg4NSwiaWF0IjoxNjcyMjMzODg1LCJqdGkiOiI3MmI3YjJhZDA1ZTE0ZTJjYjRhMWM0ZjI0OTg1NjM5MyIsInVzZXJfaWQiOjh9.Q2-uwgC0qPUeUeWvcXggoqWrl9oHqCKL4QDPO4z3ZtM','2022-12-28 13:24:45.786384','2023-12-28 13:24:45.000000',8,'72b7b2ad05e14e2cb4a1c4f249856393'),(15,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzc3MDA5MCwiaWF0IjoxNjcyMjM0MDkwLCJqdGkiOiI2N2ZiZWJlMGU3NGQ0YzI3OThmOGExMTE0ZWQwZDk3NyIsInVzZXJfaWQiOjh9.hdbBHAtGc9evTyWewHjGHTQVxRjcvDJAkrBI_XWQjr0','2022-12-28 13:28:10.299193','2023-12-28 13:28:10.000000',8,'67fbebe0e74d4c2798f8a1114ed0d977'),(16,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzc3MDEyMSwiaWF0IjoxNjcyMjM0MTIxLCJqdGkiOiI5YWM0MWM4YWU0NDI0Y2JjYjgzM2FjMDY4NDQ5MjZiZSIsInVzZXJfaWQiOjh9.7ioxdmxduEwoeckUo0fGaHq1iC3zwkrHVp82de9c_lk','2022-12-28 13:28:41.058231','2023-12-28 13:28:41.000000',8,'9ac41c8ae4424cbcb833ac06844926be'),(17,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzc3MDEzOCwiaWF0IjoxNjcyMjM0MTM4LCJqdGkiOiJjNTJmY2FiYjE5Njg0NThjYjFlMjJiZjRkM2U3ZDVlOSIsInVzZXJfaWQiOjh9.j2Le99ld_oL-nnFVEC0rYub5FIuj4VPGnbgCKqvUs3A','2022-12-28 13:28:58.455811','2023-12-28 13:28:58.000000',8,'c52fcabb1968458cb1e22bf4d3e7d5e9'),(18,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzc3MDQzOCwiaWF0IjoxNjcyMjM0NDM4LCJqdGkiOiI3NWM0YTFjYzM4ODQ0MjNhODU2ODBlYjdhYTlkOGJiYiIsInVzZXJfaWQiOjh9.PsIgLG7NtK4RpAc6Fi_ETgNLKxvxmFYba5E-yRIybIg','2022-12-28 13:33:58.370042','2023-12-28 13:33:58.000000',8,'75c4a1cc3884423a85680eb7aa9d8bbb'),(19,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzg2MTYyNiwiaWF0IjoxNjcyMzI1NjI2LCJqdGkiOiJiMWEzZmE1NjA4ZTk0OWFlOWJiNmQxMDJkZjE4YWQ2MCIsInVzZXJfaWQiOjh9.wgZbBVG7K0c0m149bA1pIjWGcmKGCYJohjpGAyXUOaQ','2022-12-29 14:53:46.734599','2023-12-29 14:53:46.000000',8,'b1a3fa5608e949ae9bb6d102df18ad60'),(20,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMzg2MzcyNSwiaWF0IjoxNjcyMzI3NzI1LCJqdGkiOiI2NDc1OTE5ZmZhMjI0MzliOWUwMGU1MjE4NDEwODE2ZiIsInVzZXJfaWQiOjh9.mF42_eWpnDnIoP-0HnfbW_Hf7KH0Ssg5Z47fvKhkeEM','2022-12-29 15:28:45.353486','2023-12-29 15:28:45.000000',8,'6475919ffa22439b9e00e5218410816f');
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-30  0:41:22
