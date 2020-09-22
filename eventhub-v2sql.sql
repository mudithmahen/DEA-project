/*
SQLyog Trial v13.0.1 (64 bit)
MySQL - 10.1.34-MariaDB : Database - eventhub
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`eventhub` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `eventhub`;

/*Table structure for table `eh_event` */

DROP TABLE IF EXISTS `eh_event`;

CREATE TABLE `eh_event` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `event_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `eh_event` */

/*Table structure for table `eh_event_calender` */

DROP TABLE IF EXISTS `eh_event_calender`;

CREATE TABLE `eh_event_calender` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(100) DEFAULT NULL,
  `envent_id` int(5) DEFAULT NULL,
  `uni_org_id` int(5) DEFAULT NULL,
  `event_datetime` varchar(60) NOT NULL,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `eh_event_calender` */

insert  into `eh_event_calender`(`id`,`event_name`,`envent_id`,`uni_org_id`,`event_datetime`,`comment`) values 
(1,'dsfdsfdsf',2,2,'2018-07-27','dsfdsfdsgfdghhgf gfhgf h'),
(2,'dsfdsfdsfdsf dsfdsf',3,2,'2018-07-28','dsfdsfdsfdsfdsf'),
(3,'Sport Meet',1,2,'2018-07-30','this is freshed sport meet'),
(4,'Gereen  Eve',3,2,'2018-07-26','Enjoy it..'),
(5,'UMO Sport Day',3,3,'2018-07-31','day fun');

/*Table structure for table `eh_event_interest` */

DROP TABLE IF EXISTS `eh_event_interest`;

CREATE TABLE `eh_event_interest` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `event_id` int(5) DEFAULT NULL,
  `interest_type` varchar(100) DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_user` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `eh_event_interest` */

/*Table structure for table `eh_event_news` */

DROP TABLE IF EXISTS `eh_event_news`;

CREATE TABLE `eh_event_news` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `description` text,
  `uni_org_id` int(5) DEFAULT NULL,
  `created_user` int(5) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `eh_event_news` */

/*Table structure for table `eh_event_news_faq` */

DROP TABLE IF EXISTS `eh_event_news_faq`;

CREATE TABLE `eh_event_news_faq` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `event_news_id` int(5) DEFAULT NULL,
  `question_ans` varchar(250) DEFAULT NULL,
  `creatd_user` int(5) DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `eh_event_news_faq` */

/*Table structure for table `eh_idea_hubidea_title` */

DROP TABLE IF EXISTS `eh_idea_hubidea_title`;

CREATE TABLE `eh_idea_hubidea_title` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `idea_title` varchar(200) DEFAULT NULL,
  `uni_org_id` int(5) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_user` int(5) DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_code` varchar(10) DEFAULT NULL,
  `agreed_to_sponsor` varchar(20) DEFAULT NULL,
  `agreed_by_org` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `eh_idea_hubidea_title` */

/*Table structure for table `eh_status` */

DROP TABLE IF EXISTS `eh_status`;

CREATE TABLE `eh_status` (
  `status_code` varchar(10) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `eh_status` */

/*Table structure for table `eh_uni_org` */

DROP TABLE IF EXISTS `eh_uni_org`;

CREATE TABLE `eh_uni_org` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `uni_org_name` varchar(100) DEFAULT NULL,
  `uni_org_type` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `status_code` varchar(10) DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_user` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `eh_uni_org` */

insert  into `eh_uni_org`(`id`,`uni_org_name`,`uni_org_type`,`email`,`address`,`telephone`,`status_code`,`created_datetime`,`created_user`) values 
(2,'msbm','UNIVERSITY','nsb@gmail.com','Colombo 21','011222','PENDING','2018-07-15 17:44:41',NULL),
(3,'Sliit','UNIVERSITY','sliit@g,mail.com','malabe','','PENDING','2018-07-24 14:20:31',NULL),
(4,'UMO','UNIVERSITY','umo@gmail.com','Moratuwa','011225544','PENDING','2018-07-24 23:18:31',NULL),
(5,'EHUB','EHUB','ehub@gmail.com','EHUB Head Office',NULL,'ACTIVE','2018-07-24 23:24:44',NULL);

/*Table structure for table `eh_user` */

DROP TABLE IF EXISTS `eh_user`;

CREATE TABLE `eh_user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `uni_org_name` varchar(200) DEFAULT NULL,
  `role_code` varchar(20) DEFAULT NULL,
  `email_address` varchar(200) DEFAULT NULL,
  `pword` text,
  `status_code` varchar(10) DEFAULT NULL,
  `uni_org_id` int(5) DEFAULT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_user` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `eh_user` */

insert  into `eh_user`(`id`,`uni_org_name`,`role_code`,`email_address`,`pword`,`status_code`,`uni_org_id`,`created_datetime`,`created_user`) values 
(7,'NSBM','UNIVERSITY','nsbm@gmail.com','123','ACTIVE',2,'2018-07-16 00:00:00',1),
(8,'UMO','UNIVERSITY','umo@gmail.com','123','ACTIVE',3,'2018-07-24 23:20:01',1),
(9,'Administrator','EHUBX','admin','123','ACTIVE',5,'2018-07-24 23:26:01',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
