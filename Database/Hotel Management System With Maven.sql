/*
SQLyog Community v9.30 
MySQL - 5.6.25-log : Database - hotelmgtsys
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hotelmgtsys` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hotelmgtsys`;

/*Table structure for table `h_bookhotel` */

DROP TABLE IF EXISTS `h_bookhotel`;

CREATE TABLE `h_bookhotel` (
  `ID` bigint(20) NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `userName` varchar(225) DEFAULT NULL,
  `HotelId` bigint(20) DEFAULT NULL,
  `hotelName` varchar(225) DEFAULT NULL,
  `bookDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `toDate` varchar(225) DEFAULT NULL,
  `fromDate` varchar(225) DEFAULT NULL,
  `noOfPerson` varchar(225) DEFAULT NULL,
  `createdBy` varchar(225) DEFAULT NULL,
  `modifiedBy` varchar(225) DEFAULT NULL,
  `createdDatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modifiedDatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `h_bookhotel` */

insert  into `h_bookhotel`(`ID`,`userId`,`userName`,`HotelId`,`hotelName`,`bookDate`,`toDate`,`fromDate`,`noOfPerson`,`createdBy`,`modifiedBy`,`createdDatetime`,`modifiedDatetime`) values (1,1,'Hariom Mukati',1,'KEsar Hotel','2019-04-17 16:47:22','18/01/2019','20/01/2019','5','Hariom@gmail.com','Hariom@gmail.com','2019-04-17 16:47:22','2019-04-17 16:47:22'),(2,1,'Hariom Mukati',2,'Radition','2019-04-18 09:45:20','18/01/2019','20/01/2019','4','Hariom@gmail.com','Hariom@gmail.com','2019-04-18 09:45:20','2019-04-18 09:45:20');

/*Table structure for table `h_hotel` */

DROP TABLE IF EXISTS `h_hotel`;

CREATE TABLE `h_hotel` (
  `ID` bigint(20) NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `city` varchar(225) DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  `description` varbinary(225) DEFAULT NULL,
  `contect` varchar(225) DEFAULT NULL,
  `rating` varchar(225) DEFAULT NULL,
  `createdBy` varchar(225) DEFAULT NULL,
  `modifiedBy` varchar(225) DEFAULT NULL,
  `createdDatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedDatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `h_hotel` */

insert  into `h_hotel`(`ID`,`name`,`city`,`address`,`description`,`contect`,`rating`,`createdBy`,`modifiedBy`,`createdDatetime`,`modifiedDatetime`) values (1,'KEsar Hotel','Indore','ffffffffffffff','FHabywrgv0bweyrt whifgata9wyer hwiefibc','9165415565','4','Hariom@gmail.com','Hariom@gmail.com','2019-04-17 12:24:51','2019-04-17 17:34:18'),(2,'Radition','Indore','BDGIGIGD','D efwi7iq ggOQEDWR HEDVCG8GRFGW GIGE9DYQBEYF9OQB2RC GEWF8Q6T8O7TR EQ7D78OQRGOWRHFIR IWGEFI7W7F IWEGFIGWI AGFIGWI','6542544522','5','Hariom@gmail.com','Hariom@gmail.com','2019-04-17 15:21:22','2019-04-17 15:21:22');

/*Table structure for table `h_user` */

DROP TABLE IF EXISTS `h_user`;

CREATE TABLE `h_user` (
  `ID` bigint(20) NOT NULL,
  `firstName` varchar(225) DEFAULT NULL,
  `lastName` varchar(225) DEFAULT NULL,
  `login` varchar(225) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL,
  `mobileNo` varchar(225) DEFAULT NULL,
  `roleId` bigint(20) DEFAULT NULL,
  `createdBy` varchar(225) DEFAULT NULL,
  `modifiedBy` varchar(225) DEFAULT NULL,
  `createdDatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifiedDatetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `h_user` */

insert  into `h_user`(`ID`,`firstName`,`lastName`,`login`,`password`,`mobileNo`,`roleId`,`createdBy`,`modifiedBy`,`createdDatetime`,`modifiedDatetime`) values (1,'Hariom','Mukati','Hariom@gmail.com','321','9165415599',1,'root','root','2019-04-18 10:59:58','2019-04-16 10:13:05');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
