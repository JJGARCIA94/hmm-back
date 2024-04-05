/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.33-MariaDB : Database - hmm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hmm` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hmm`;

/*Table structure for table `courses_doctors` */

DROP TABLE IF EXISTS `courses_doctors`;

CREATE TABLE `courses_doctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idDoctor` int(11) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idDoctor` (`idDoctor`),
  CONSTRAINT `courses_doctors_ibfk_1` FOREIGN KEY (`idDoctor`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `courses_doctors` */

insert  into `courses_doctors`(`id`,`idDoctor`,`description`,`status`) values (1,2,'Diplomado en Salud Pública.',1),(2,2,'Diplomado en Administración de Hospitales.',1),(3,2,'Cursos en Comunicación Efectiva.',1),(4,2,'Cursos en Calidad de la Atención Médica.',1),(5,4,'Educación médica continua en plataformas internacionales.',1),(6,4,'Título de Experto Universitario en Cardiofisiología Fetal y Pediátrica.',1),(7,12,'Miembro Fundador Activo, Sociedad Mexicana de Cirugía de Cadera. marzo 2001.',1),(8,12,'AMECRA Cirugía articular. Desde marzo 2001.',1),(9,12,'AO/Internacional ASIF básico, avanzado y Master, para el manejo de la osteosíntesis.',1),(10,13,'2017 – 2022 – Certificación Vigente por el Consejo Mexicano de Cirugía General, A.C.',1),(11,13,'2014 – Instructor del Curso ATLS, Colegio Americano de Cirujanos.',1),(12,13,'2012-2017 – Certificación Vigente por el Consejo Mexicano de Cirugía General, A. C.',1),(13,13,'2007 – Mención Honorífica en Laparoscopía Básica y Avanzada, Escuela de Medicina del Tecnológico de Monterrey, Área de Postgrado.',1),(14,13,'2006-2007 – Jefe de Residentes del Programa de Cirugía General, Escuela de Medicina del Tecnológico de Monterrey.',1),(15,13,'2000 – Mención Honorífica Médico Cirujano, Escuela de Medicina del Tecnológico de Monterrey.',1);

/*Table structure for table `doctors` */

DROP TABLE IF EXISTS `doctors`;

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` int(11) NOT NULL,
  `names` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `secondSurname` varchar(100) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `phone2` varchar(10) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `about` text,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `doctors` */

insert  into `doctors`(`id`,`key`,`names`,`lastName`,`secondSurname`,`birthday`,`phone`,`phone2`,`code`,`image`,`about`,`status`) values (2,260,'Jesús Manuel','Santiago','Osuna',NULL,NULL,NULL,NULL,'dr-santiago.jpg','La elección de los Hospitales de especialidades y la Atención Médica, hoy en día es observando que se apliquen con garantía los procesos de salud, generando seguridad en los procedimientos de los pacientes.',1),(4,209,'Carlos Luis','Alcantar','Sánchez',NULL,'6691590844',NULL,NULL,'dr-alcantar.jpg','Médico especialista en bebés, niños y adolescentes. Egresado de la Universidad de Monterrey en medicina y del Tec de Monterrey y Secretaría de Salud de Nuevo\r\nLeón en pediatría. Mi misión es ofrecer un servicio de excelencia en la atención de la salud de mis pacientes.',1),(6,126,'Alejandro','Granados','Gonzalez',NULL,'6691160230',NULL,NULL,'dr-granados.jpg',NULL,1),(9,129,'José Yun','Chang','Lem',NULL,'6691299960',NULL,NULL,'dr-chang.jpg','Cirugía gastrointestinal: Centro Medico Nacional del Noroeste.\r\nColoproctología: Centro Medico Nacional “La Raza”\r\nCertificado por:\r\n-Consejo Mexicano de Cirugía General A. C.\r\n-Consejo Mexicano de Especialistas en Enfermedades del Colon y Recto A.C.',1),(10,365,'Jorge Alan','Lara','Arellano',NULL,'6695337960',NULL,NULL,'dr-lara.jpg',NULL,1),(11,439,'Iván De Jesús','Rojas','Rodríguez',NULL,'6691201517',NULL,NULL,'Dr-Ivan-Rojas.jpg','Para los profesionales de la salud, la búsqueda de la calidad en el servicio constituye todo un reto y aún más, una prioridad.',1),(12,157,'Jorge','Mojarro','Bañuelos',NULL,NULL,NULL,NULL,'dr-mojarro.jpg','Atención medica quirúrgica de alta especialidad en los padecimientos del sistema musculo-esquelético, con técnicas quirúrgicas a la vanguardia.',1),(13,343,'César Antonio','Gálvez','Hernández',NULL,NULL,NULL,NULL,'Dr.-Cesar-Galvez.jpg','Médico Cirujano, Escuela de Medicina “Ignacio A. Santos” del Tecnológico de Monterrey.\r\nCédula Profesional: 3579301.\r\nCirugía General y Laparoscopía, Escuela de Medicina del Tecnológico de Monterrey-Área de Postgrado.\r\nEspecialista: 5132026.',1);

/*Table structure for table `hospitals` */

DROP TABLE IF EXISTS `hospitals`;

CREATE TABLE `hospitals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `hospitals` */

insert  into `hospitals`(`id`,`name`,`address`,`phone`,`status`) values (1,'Hospital Marina Mazatlán',NULL,NULL,1);

/*Table structure for table `procedures_doctors` */

DROP TABLE IF EXISTS `procedures_doctors`;

CREATE TABLE `procedures_doctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idDoctor` int(11) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idDoctor` (`idDoctor`),
  CONSTRAINT `procedures_doctors_ibfk_1` FOREIGN KEY (`idDoctor`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `procedures_doctors` */

insert  into `procedures_doctors`(`id`,`idDoctor`,`description`,`status`) values (1,2,'Planear el desempeño médico.',1),(2,2,'Diseño de estrategias.',1),(3,2,'Planificar y supervisión de la Atención Médica.',1),(4,2,'Dirigir los Servicios de Salud.',1),(5,4,'Diagnóstico y Tratamiento de las patologías asociadas a la Pediatría.',1),(6,4,'Amplia experiencia en manejo de patologías respiratorias, digestivas, alérgicas y dermatológicas.',1),(7,4,'Curaciones y suturas.',1),(8,4,'Aplicación de vacunas tanto de esquema nacional como internacional: varicela, hepatitis A, meningococo, etc.',1),(9,12,'Remplazo Articular de Cadera/Rodilla con técnica mínima-invasiva.',1),(10,12,'Cirugía Articular Artroscopia.',1),(11,12,'Atención y manejo quirúrgico en lesiones del deporte de alto rendimiento.',1),(12,12,'Atención en conjunto del paciente poli trauma en el servicio de urgencias HMM.',1),(13,12,'Atención y Manejo del servicio de traumatología HMM.',1),(14,13,'Planear el desempeño médico.',1),(15,13,'Diseño de estrategias.',1),(16,13,'Planificar y supervisión de la Atención Médica.',1),(17,13,'Dirigir los Servicios de Salud.',1);

/*Table structure for table `specialties` */

DROP TABLE IF EXISTS `specialties`;

CREATE TABLE `specialties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `derivation` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `specialties` */

insert  into `specialties`(`id`,`name`,`derivation`,`status`) values (5,'Dirección médica','Director médico',1),(6,'Pediatría','Pediatra',1),(7,'Radiología','Radiólogo',1),(8,'Proctología','Proctólogo',1),(9,'Médicina de urgencias','Médico de urgencias',1),(10,'Médicina integral','Médico integral',1),(11,'Ortopedia','Ortopedista',1),(12,'Traumatología','Traumatólogo',1),(13,'Cirugía general','Cirujano general',1),(14,'Laparoscópica avanzada','Cirujano laparoscópico',1),(15,'Bariátrica','Cirujano bariátrico',1);

/*Table structure for table `specialties_doctor` */

DROP TABLE IF EXISTS `specialties_doctor`;

CREATE TABLE `specialties_doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idDoctor` int(11) NOT NULL,
  `idSpecialty` int(11) NOT NULL,
  `idHospital` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idDoctor` (`idDoctor`),
  KEY `idSpeciality` (`idSpecialty`),
  KEY `idHospital` (`idHospital`),
  CONSTRAINT `specialties_doctor_ibfk_1` FOREIGN KEY (`idDoctor`) REFERENCES `doctors` (`id`),
  CONSTRAINT `specialties_doctor_ibfk_2` FOREIGN KEY (`idSpecialty`) REFERENCES `specialties` (`id`),
  CONSTRAINT `specialties_doctor_ibfk_3` FOREIGN KEY (`idHospital`) REFERENCES `hospitals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `specialties_doctor` */

insert  into `specialties_doctor`(`id`,`idDoctor`,`idSpecialty`,`idHospital`,`status`) values (1,2,5,1,1),(2,4,6,1,1),(3,6,7,1,1),(4,9,8,1,1),(5,10,9,1,1),(6,11,9,1,1),(7,11,10,1,1),(8,12,11,1,1),(9,12,12,1,1),(10,13,13,1,1),(11,13,14,1,1),(12,13,15,1,1);

/*Table structure for table `studies_doctors` */

DROP TABLE IF EXISTS `studies_doctors`;

CREATE TABLE `studies_doctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idDoctor` int(11) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idDoctor` (`idDoctor`),
  CONSTRAINT `studies_doctors_ibfk_1` FOREIGN KEY (`idDoctor`) REFERENCES `doctors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `studies_doctors` */

insert  into `studies_doctors`(`id`,`idDoctor`,`description`,`status`) values (1,2,'Médico Cirujano egresado de la Universidad Michoacana de San Nicolás de Hidalgo.',1),(2,2,'Epidemiología Básica y Avanzada de la UNAM.',1),(3,2,'Diplomado en Enfermedades Crónicas No Transmisibles y Geronto-Geriatría por el Instituto Nacional de Salud Pública.',1),(4,2,'Maestría en Instituciones de Salud, en la Universidad La Salle.',1),(5,4,'Médico Cirujano y Partero egresado de la Universidad de Monterrey.',1),(6,4,'Pediatría, egresado del Instituto Tecnològico y de Estudios Superiores de Monterrey.',1),(7,4,'Título de Experto Universitario de Cardiofisiología Fetal y Pediátrica, otorgado por la Universidad Cardenal Herrera.',1),(8,6,'Médico Cirujano y Partero – Universidad Autónoma de Sinaloa.',1),(9,6,'Radiología – Hospital Especialidades 5 de Mayo ISSSTEP Puebla.',1),(10,9,'UNIVERSIDAD AUTONOMA DE NAYARIT.',1),(11,9,'CIRUGIA GASTROINTESTINAL CENTRO MEDICO NACIONAL DEL NOROESTE.',1),(12,9,'COLOPROCTOLOGIA CENTRO MEDICO NACIONAL “LA RAZA”.',1),(13,12,'Médico Cirujano egresado de la Universidad de Guadalajara.',1),(14,12,'Ortopedia y Traumatología Centro medico Nacional de Occidente.',1),(15,12,'Sub-Especialidad en Cirugía Remplazo articular de Rodilla /Cadera.',1),(16,12,'Sub-Especialidad en Cirugía de cadera Ortopedia pediátrica.',1),(17,13,'Consejo Mexicano de Cirugía General, A.C.',1),(18,13,'Advanced Bariatric Life Support (ABLS) por la American Society of Metabolic and Bariatric Surgery.',1),(19,13,'Advanced Trauma Life Support (ATLS) por el American College of Surgeons.',1),(20,13,'Advanced Cardiac Life Support (ACLS) por la American Heart Association.',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
