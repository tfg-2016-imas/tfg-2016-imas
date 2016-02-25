# ************************************************************
# Sequel Pro SQL dump
# Versión 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.12)
# Base de datos: ideas
# Tiempo de Generación: 2014-05-07 08:38:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla Confirmation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Confirmation`;

CREATE TABLE `Confirmation` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `confirmationCode` varchar(255) DEFAULT NULL,
  `confirmationDate` datetime DEFAULT NULL,
  `registrationDate` datetime DEFAULT NULL,
  `researcher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `researcher_id` (`researcher_id`),
  UNIQUE KEY `confirmationCode` (`confirmationCode`),
  KEY `FK86E9E05535D39501` (`researcher_id`),
  CONSTRAINT `FK86E9E05535D39501` FOREIGN KEY (`researcher_id`) REFERENCES `Researcher` (`id`)
   	ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Volcado de tabla Experiment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Experiment`;

CREATE TABLE `Experiment` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `experimentId` varchar(255) DEFAULT NULL,
  `experimentName` varchar(255) DEFAULT NULL,
  `publicExperiment` tinyint(1) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK71BBB81D7956A1F6` (`owner_id`),
  CONSTRAINT `FK71BBB81D7956A1F6` FOREIGN KEY (`owner_id`) REFERENCES `Researcher` (`id`)
   	ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Volcado de tabla hibernate_sequences
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hibernate_sequences`;

CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;

INSERT INTO `hibernate_sequences` (`sequence_name`, `sequence_next_hi_value`)
VALUES
	('DomainEntity',10);

/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla Researcher
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Researcher`;

CREATE TABLE `Researcher` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3C2B9D5FFC733F2f37dafa8` (`userAccount_id`),
  CONSTRAINT `FK3C2B9D5FFC733F2f37dafa8` FOREIGN KEY (`userAccount_id`) REFERENCES `UserAccount` (`id`)
 	ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `Researcher` WRITE;
/*!40000 ALTER TABLE `Researcher` DISABLE KEYS */;

INSERT INTO `Researcher` (`id`, `version`, `address`, `email`, `name`, `phone`, `userAccount_id`)
VALUES
	(1,1,'unknown','iamaguest@us.es','Guest','000',21),
	(2,1,'unknown','demomaser@us.es','DemoMaster','000',22),
	(3,1,'unknown','autotester@us.es','AutoTester','000',23);

/*!40000 ALTER TABLE `Researcher` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla SocialNetworkAccount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SocialNetworkAccount`;

CREATE TABLE `SocialNetworkAccount` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `accessToken` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `expireTime` bigint(20) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `profileUrl` varchar(255) DEFAULT NULL,
  `providerId` varchar(255) DEFAULT NULL,
  `providerUserId` varchar(255) DEFAULT NULL,
  `rank` int(11) NOT NULL,
  `refreshToken` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId` (`userId`,`providerId`,`rank`),
  UNIQUE KEY `userId_2` (`userId`,`providerId`,`providerUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Volcado de tabla SocialNetworkConfiguration
# ------------------------------------------------------------

DROP TABLE IF EXISTS `SocialNetworkConfiguration`;

CREATE TABLE `SocialNetworkConfiguration` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `notifyWhenExperimentExecutionFinished` tinyint(1) NOT NULL,
  `publishExistingExperimentMadePublic` tinyint(1) NOT NULL,
  `publishNewExperimentExecutionFinished` tinyint(1) NOT NULL,
  `publishNewPublicExperimentCreated` tinyint(1) NOT NULL,
  `publishNewPublicExperimentExecutionStarted` tinyint(1) NOT NULL,
  `service` varchar(255) DEFAULT NULL,
  `actor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3B9FB495B3D38B74` (`actor_id`),
  CONSTRAINT `FK3B9FB495B3D38B74` FOREIGN KEY (`actor_id`) REFERENCES `Researcher` (`id`)
   	ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Volcado de tabla UserAccount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UserAccount`;

CREATE TABLE `UserAccount` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `UserAccount` WRITE;
/*!40000 ALTER TABLE `UserAccount` DISABLE KEYS */;

INSERT INTO `UserAccount` (`id`, `version`, `password`, `username`)
VALUES
	(21,1,'084e0343a0486ff05530df6c705c8bb4','guest'),
	(22,1,'1d11608a12a5a8347ae8e3577a26e001','DemoMaster'),
	(23,1,'cfe0613e4ccf4e08bf75e712f8597f55','AutoTester');

/*!40000 ALTER TABLE `UserAccount` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla UserAccount_authorities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UserAccount_authorities`;

CREATE TABLE `UserAccount_authorities` (
  `UserAccount_id` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FKA380F224FFC733F2` (`UserAccount_id`),
  CONSTRAINT `FKA380F224FFC733F2` FOREIGN KEY (`UserAccount_id`) REFERENCES `UserAccount` (`id`)
   	ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `UserAccount_authorities` WRITE;
/*!40000 ALTER TABLE `UserAccount_authorities` DISABLE KEYS */;

INSERT INTO `UserAccount_authorities` (`UserAccount_id`, `authority`)
VALUES
	(21,'RESEARCHER'),
	(22,'RESEARCHER'),
	(23,'RESEARCHER');

/*!40000 ALTER TABLE `UserAccount_authorities` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla UserConnection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UserConnection`;

CREATE TABLE `UserConnection` (
  `providerId` varchar(255) NOT NULL,
  `providerUserId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `accessToken` varchar(255) DEFAULT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `expireTime` bigint(20) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `profileUrl` varchar(255) DEFAULT NULL,
  `rank` int(11) NOT NULL,
  `refreshToken` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`providerId`,`providerUserId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
