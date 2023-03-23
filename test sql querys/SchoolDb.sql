/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 10.1.35-MariaDB : Database - mis3053schooldb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mis3053schooldb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mis3053schooldb`;

/*Table structure for table `classrooms` */

DROP TABLE IF EXISTS `classrooms`;

CREATE TABLE `classrooms` (
  `cl_id` varchar(10) NOT NULL DEFAULT '',
  `capacity` int(3) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `classrooms` */

insert  into `classrooms`(`cl_id`,`capacity`,`location`) values 
('CM117',50,'Chapman Hall'),
('HELM101',40,'Helmerich Hall'),
('HELM213',40,'Helmerich Hall'),
('HELM316',16,'Helmerich Hall'),
('HELM5000',10,'HELM Hall'),
('KEP306',18,'Keplinger Hall'),
('KEPM6',40,'Keplinger Hall'),
('KEPM8',20,'Keplinger Hall'),
('KEPU4',30,'Keplinger Hall'),
('OH316',20,'Oliphant Hall');

/*Table structure for table `courses` */

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `c_id` varchar(8) NOT NULL DEFAULT '',
  `c_name` varchar(40) DEFAULT NULL,
  `num_credits` int(11) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `courses` */

insert  into `courses`(`c_id`,`c_name`,`num_credits`) values 
('ACCT2113','Concepts in Acct Info I',3),
('CIS4033','Business Programming 3',3),
('CS1043','Intro to Programming Problem Solving',3),
('ES2023','Dynamics',3),
('GEOL4063','Petroleum Geology',3),
('HIST2553','War and American Society',3),
('MATH2014','Calculus I',4),
('MGMT3003','Principles of Management',3),
('MIS3053','Database Design and Applications',3),
('PSY1001','Psych 101',NULL),
('PSY3063','Developmental Psychology',3);

/*Table structure for table `grades` */

DROP TABLE IF EXISTS `grades`;

CREATE TABLE `grades` (
  `st_id` char(2) NOT NULL DEFAULT '',
  `c_id` varchar(8) NOT NULL DEFAULT '',
  `s_id` varchar(11) NOT NULL DEFAULT '',
  `grade` char(1) DEFAULT NULL,
  PRIMARY KEY (`st_id`,`c_id`,`s_id`),
  KEY `grades_FK2` (`c_id`,`s_id`),
  CONSTRAINT `grades_FK1` FOREIGN KEY (`st_id`) REFERENCES `students` (`st_id`),
  CONSTRAINT `grades_FK2` FOREIGN KEY (`c_id`, `s_id`) REFERENCES `sections` (`c_id`, `s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `grades` */

insert  into `grades`(`st_id`,`c_id`,`s_id`,`grade`) values 
('S1','CS1043','SPRING2010A','A'),
('S1','MATH2014','SPRING2010B','A'),
('S1','MGMT3003','SPRING2010B','A'),
('S1','MIS3053','Fall2014A','B'),
('S1','MIS3053','SPRING2010A','A'),
('S2','ACCT2113','SPRING2010B','A'),
('S2','HIST2553','SPRING2010B','B'),
('S2','MGMT3003','SPRING2010B','B'),
('S2','MIS3053','Fall2014A','A'),
('S2','PSY3063','SPRING2010A','B'),
('S3','CS1043','SPRING2010A','C'),
('S3','ES2023','SPRING2010A','B'),
('S3','GEOL4063','SPRING2010A','B'),
('S3','MATH2014','SPRING2010B','B'),
('S3','MIS3053','Fall2014A','B'),
('S4','ACCT2113','SPRING2010B','D'),
('S4','HIST2553','SPRING2010B','D'),
('S4','MATH2014','SPRING2010B','D'),
('S4','MIS3053','Fall2014A','C'),
('S4','MIS3053','SPRING2010A','D'),
('S5','ACCT2113','SPRING2010B','A'),
('S5','CS1043','SPRING2010A','B'),
('S5','GEOL4063','SPRING2010A','A'),
('S5','PSY3063','SPRING2010A','A'),
('S6','CS1043','SPRING2010A','A'),
('S6','ES2023','SPRING2010A','A'),
('S6','GEOL4063','SPRING2010A','B'),
('S6','PSY3063','SPRING2010A','A'),
('S7','HIST2553','SPRING2010B','A'),
('S7','MATH2014','SPRING2010B','A'),
('S7','PSY3063','SPRING2010A','A'),
('S8','CS1043','SPRING2010A','B'),
('S8','MGMT3003','SPRING2010B','B'),
('S8','MIS3053','SPRING2010A','F'),
('S9','CS1043','SPRING2010A','B'),
('S9','GEOL4063','SPRING2010A','D'),
('S9','HIST2553','SPRING2010B','C'),
('S9','PSY3063','SPRING2010A','A');

/*Table structure for table `professors` */

DROP TABLE IF EXISTS `professors`;

CREATE TABLE `professors` (
  `f_id` char(2) NOT NULL DEFAULT '',
  `f_name` varchar(30) DEFAULT NULL,
  `f_address` varchar(70) DEFAULT NULL,
  `f_specialty` varchar(50) DEFAULT NULL,
  `highest_degree` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `professors` */

insert  into `professors`(`f_id`,`f_name`,`f_address`,`f_specialty`,`highest_degree`) values 
('F1','Lisa Myers','702 N Main St, Tulsa, OK 74133','MIS','Ph.D'),
('F2','Shelly Weaver','543 S Harvard Ave, Tulsa, OK, 74137','Psychology','Ph.D'),
('F3','Richard Bartley','8646 E 61st St, Tulsa, OK, 74132','History','Ph.D'),
('F4','Geoffrey Johnson','PO Box 254, Owasso, OK, 74020','Geology','Ph.D'),
('F5','Susan Sanders','9023 S 78th E Ave #364, Tulsa, OK, 74138','Math','Masters'),
('F6','Roger Hightower','9798 S Aspen Ave, Broken Arrow, OK, 74012','Computer Science','Ph.D'),
('F7','Laura Jones','6543 E 121st St, Bixby, OK, 74112','Mechanical Engineering','Ph.D'),
('F8','George Daniels','2984 S Toledo Ave, Tulsa, OK, 74138','Management','Ph.D'),
('F9','Grant Russell','74133 S Memorial Ave, Tulsa, OK, 75009','Accounting','Ph.D'),
('G1','A B','ddf','MIS','PHD'),
('H1','susan sanders','asdasd','MIS','PHd'),
('K1','dsdf','sdfsdf','MIS','Masters'),
('L1','dsdf','dcsdf','MIS','MAsters'),
('M1','Laura Jones','dfd','Databases','Ph.D');

/*Table structure for table `sections` */

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `c_id` varchar(8) NOT NULL DEFAULT '',
  `s_id` varchar(11) NOT NULL DEFAULT '',
  `time_held` time DEFAULT NULL,
  `week_days_held` varchar(6) DEFAULT NULL,
  `date_began` date DEFAULT NULL,
  `date_ended` date DEFAULT NULL,
  `cl_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`c_id`,`s_id`),
  KEY `sections_FK2` (`cl_id`),
  CONSTRAINT `sections_FK1` FOREIGN KEY (`c_id`) REFERENCES `courses` (`c_id`),
  CONSTRAINT `sections_FK2` FOREIGN KEY (`cl_id`) REFERENCES `classrooms` (`cl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sections` */

insert  into `sections`(`c_id`,`s_id`,`time_held`,`week_days_held`,`date_began`,`date_ended`,`cl_id`) values 
('ACCT2113','SPRING2010B','14:00:00','MWF','2010-01-11','2010-05-06','HELM213'),
('CIS4033','Spring2019A','10:45:00','Tu Th','2019-01-08','2019-05-02','HELM316'),
('CS1043','SPRING2010A','13:00:00','MWF','2010-01-11','2010-05-06','KEPU4'),
('ES2023','SPRING2010A','11:00:00','MWF','2010-01-11','2010-05-06','KEP306'),
('GEOL4063','Fall2018A','00:00:00','TTh','2018-11-12','2018-11-23','HELM213'),
('GEOL4063','SPRING2010A','08:00:00','TTH','2010-01-11','2010-05-06','KEPM8'),
('HIST2553','SPRING2010B','15:15:00','TTH','2010-01-11','2010-05-06','KEP306'),
('MATH2014','SPRING2010B','09:30:00','TTH','2010-01-11','2010-05-06','KEPM6'),
('MGMT3003','SPRING2010B','11:00:00','MWF','2010-01-11','2010-05-06','HELM213'),
('MIS3053','Fall2014A','10:00:00','MWF','2010-01-11','2010-01-11','HELM316'),
('MIS3053','Fall2018A','00:00:00','TuTH','2018-08-22','2018-12-13','HELM213'),
('MIS3053','SPRING2010A','12:30:00','TTH','2010-01-11','2010-05-06','HELM316'),
('PSY3063','SPRING2010A','18:00:00','M','2010-01-11','2010-05-06','OH316');

/*Table structure for table `students` */

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `st_id` char(2) NOT NULL DEFAULT '',
  `st_name` varchar(30) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `st_gpa` double DEFAULT NULL,
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `students` */

insert  into `students`(`st_id`,`st_name`,`gender`,`st_gpa`) values 
('S1','Brianna Davis','M',3.9),
('S2','Johnny Smith','M',3.2),
('S3','Elizabeth Johnson','F',2.8),
('S4','Matthew Martin','M',2),
('S5','Jennifer Samson','F',3.6),
('S6','Morgan Case','F',3.5),
('S7','Lisa Myers','F',4),
('S8','Sara Humphrey','F',2),
('S9','Steve Jones','M',NULL),
('T1','Matthew Martin','M',4);

/*Table structure for table `teach` */

DROP TABLE IF EXISTS `teach`;

CREATE TABLE `teach` (
  `f_id` char(2) NOT NULL DEFAULT '',
  `c_id` varchar(8) NOT NULL DEFAULT '',
  `s_id` varchar(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`f_id`,`c_id`,`s_id`),
  KEY `teach_FK2` (`c_id`,`s_id`),
  CONSTRAINT `teach_FK1` FOREIGN KEY (`f_id`) REFERENCES `professors` (`f_id`),
  CONSTRAINT `teach_FK2` FOREIGN KEY (`c_id`, `s_id`) REFERENCES `sections` (`c_id`, `s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teach` */

insert  into `teach`(`f_id`,`c_id`,`s_id`) values 
('F1','MIS3053','Fall2014A'),
('F1','MIS3053','SPRING2010A'),
('F2','MIS3053','Fall2014A'),
('F2','PSY3063','SPRING2010A'),
('F3','HIST2553','SPRING2010B'),
('F4','GEOL4063','SPRING2010A'),
('F5','MATH2014','SPRING2010B'),
('F6','CS1043','SPRING2010A'),
('F7','ES2023','SPRING2010A'),
('F8','MGMT3003','SPRING2010B'),
('F9','ACCT2113','SPRING2010B');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
