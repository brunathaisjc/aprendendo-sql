DROP DATABASE if EXISTS `clinica2021`;
CREATE DATABASE  IF NOT EXISTS `clinica2021`;
USE `clinica2021`;


--
-- Table structure for table `ambulatorios`
--

DROP TABLE IF EXISTS `ambulatorios`;
CREATE TABLE `ambulatorios` (
  `idambulatorios` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numero` varchar(45) NOT NULL,
  `andar` int(11) NOT NULL,
  `capacidade` int(11) NOT NULL,
  PRIMARY KEY (`idambulatorios`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;


--
-- Dumping data for table `ambulatorios`
--

LOCK TABLES `ambulatorios` WRITE;
ALTER TABLE `ambulatorios` DISABLE KEYS ;
INSERT INTO `ambulatorios` VALUES (1,'1',1,30),(2,'2',1,50),(3,'3',2,40),(4,'4',2,30),(5,'5',1,25),(6,'6',3,50),(7,'7',3,50),(8,'amb-01',1,200),(9,'ambulatorio 003',1,50),(10,'03-a',1,50),(11,'amb-02',2,100),(12,'amb-10',3,100),(13,'amb-11',1,30);
 ALTER TABLE `ambulatorios` ENABLE KEYS ;
UNLOCK TABLES;


--
-- Table structure for table `doencas`
--

DROP TABLE IF EXISTS `doencas`;

CREATE TABLE `doencas` (
  `iddoencas` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`iddoencas`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;


--
-- Dumping data for table `doencas`
--

LOCK TABLES `doencas` WRITE;
ALTER TABLE `doencas` DISABLE KEYS ;
INSERT INTO `doencas` VALUES (1,'Anemia'),(2,'Gripe'),(3,'Hepatite'),(4,'Gengivite'),(5,'Câncer'),(6,'Diarréia'),(7,'Sarampo'),(8,'Diabetes'),(9,'Faringite'),(10,'Herpes'),(11,'HPV'),(12,'Depressão'),(13,'Lesão Muscular'),(14,'Osso quebrado'),(15,'Depressão');
ALTER TABLE `doencas` ENABLE KEYS;
UNLOCK TABLES;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;

CREATE TABLE `especialidades` (
  `idespecialidades` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idespecialidades`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;


--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
 ALTER TABLE `especialidades` DISABLE KEYS ;
INSERT INTO `especialidades` VALUES (1,'Cardiologia'),(2,'Ortopedia'),(3,'Dermatologia'),(4,'Endoscopia'),(5,'Clínico Geral'),(6,'Imunologia'),(7,'Geriatria'),(8,'Pediatria'),(9,'Oftalmologia'),(10,'Pneumologia'),(11,'Psiquiatria'),(12,'Urologia'),(13,'Neurologia'),(14,'Infectologia');
ALTER TABLE `especialidades` ENABLE KEYS;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;

CREATE TABLE `funcionarios` (
  `idfuncionarios` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idambulatorios` int(10) unsigned NOT NULL,
  `nome` varchar(45) NOT NULL,
  `idade` int(11) NOT NULL,
  `sexo` char(1) NOT NULL,
  `salario` float NOT NULL,
  `cidade` varchar(45) NOT NULL,
  PRIMARY KEY (`idfuncionarios`),
  KEY `fkIdx_23` (`idambulatorios`),
  CONSTRAINT `FK_23` FOREIGN KEY (`idambulatorios`) REFERENCES `ambulatorios` (`idambulatorios`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;


--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
ALTER TABLE `funcionarios` DISABLE KEYS ;
INSERT INTO `funcionarios` VALUES (1,1,'Fernando Sac\'Anna',33,'m',2800,'Salvador'),(2,1,'Paul Miss Era',21,'m',1800,'Salvador'),(3,2,'Ringo Star',70,'m',2000,'Camaçari'),(4,2,'Mick Jegue',41,'m',3000,'Aratu'),(5,2,'André Robber',29,'m',2300,'Valença'),(6,3,'Márcia Betrayer',28,'f',3000,'Camaçari'),(7,3,'Alex Travel',19,'m',1800,'Aratu'),(8,2,'Monica Lev',29,'f',2100,'Salvador'),(9,2,'Cris Bonde',32,'f',3000,'Valença'),(10,2,'Anália Cam',23,'f',2500,'Lauro de Freitas'),(11,1,'Cláudia Never',27,'f',1955,'Itaparica'),(12,4,'Faby Tricky',41,'f',2600,'Amélia Rodrigues'),(13,4,'Camila Speed',18,'f',1500,'Salvador'),(14,5,'Jô Acapombo',33,'f',2400,'Aratu'),(15,7,'jorjao',40,'m',3000,'Salvador'),(17,7,'xaxi',60,'m',1200,'Feira'),(19,3,'kaio',40,'m',3000,'salvador');
 ALTER TABLE `funcionarios` ENABLE KEYS;
UNLOCK TABLES;


--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
CREATE TABLE `medicos` (
  `idmedicos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idambulatorios` int(10) unsigned NOT NULL,
  `nome` varchar(45) NOT NULL,
  `crm` varchar(45) NOT NULL,
  `salario` float NOT NULL,
  `idade` int(11) NOT NULL,
  `idespecialidades` int(5) unsigned NOT NULL,
  PRIMARY KEY (`idmedicos`,`idambulatorios`),
  KEY `fkIdx_37` (`idambulatorios`),
  CONSTRAINT `FK_37` FOREIGN KEY (`idambulatorios`) REFERENCES `ambulatorios` (`idambulatorios`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;


--
-- Dumping data for table `medicos`
--

LOCK TABLES `medicos` WRITE;
 ALTER TABLE `medicos` DISABLE KEYS;
INSERT INTO `medicos` VALUES (1,1,'João Souza','1234',6000,34,3),(2,1,'Paulo Cascata','2341',12000,62,2),(3,2,'Zico Mário','3344',9000,30,10),(4,2,'Nanda Ghost','6661',10000,33,4),(5,3,'Érica White','9991',4500,28,1),(6,2,'Márcio Mucky','1171',6000,26,1),(7,3,'Jorge Lafond','4477',7000,34,5),(8,3,'Miguel Black','7171',8800,50,2),(9,1,'Robin Scroque','0199',4000,32,2),(10,2,'Paula Tapioca','0178',4200,28,6),(11,2,'Bruce Simões','9171',3000,44,4),(12,1,'Liv Gossip','8987',3600,22,3),(13,3,'Ana Smith','8811',4800,31,4),(14,1,'marcus','123',24000,32,1);
 ALTER TABLE `medicos` ENABLE KEYS;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;

CREATE TABLE `pacientes` (
  `idpacientes` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `sexo` char(1) NOT NULL,
  `idade` int(11) NOT NULL,
  `doenca_inicial` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idpacientes`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;


--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
 ALTER TABLE `pacientes` DISABLE KEYS;
INSERT INTO `pacientes` VALUES (1,'Paty Franca','f',33,'gripe'),(2,'Roberto Sinc','m',18,'miopia'),(3,'Marc Iolan','m',24,'gonorréia'),(4,'Fê Pascal','f',19,'herpes'),(5,'John Greg','m',61,'pressão alta'),(6,'Livia Casta','f',15,''),(7,'Su Edden','f',30,'pneumonia'),(8,'Cássia Paula','f',40,''),(9,'Marcos das Antas','m',55,''),(10,'Aline Santos','f',22,''),(11,'Marcelo Ferreira','m',41,''),(12,'Paulo Paulada','m',29,''),(13,'Joana Dark','f',21,''),(14,'Paulo Peroba','m',8,''),(15,'Pâmela Zoeira','f',19,''),(16,'Juliana Pazes','f',28,''),(17,'João Knower','m',43,'cegueira'),(18,'Leandro Leonardo','m',13,'gripe'),(19,'Tiago da Gota','m',71,'cardiaco'),(20,'Rosa Flor','f',61,'diabetes'),(21,'Manoel Padeiro','m',37,''),(22,'Caroline Pinheiro','m',18,''),(23,'jore mis era','m',60,'gripe'),(24,'Ze gotinha','m',34,'raivaaaaaaaaaaaaaa'),(25,'jorge','m',200,'alergia'),(26,'Lucas o cara','f',23,'fofoqueiro'),(27,'Ze das leoas','m',40,'gripe'),(28,'nao faca isso','m',10,NULL),(29,'jorge misera','m',10,NULL),(30,'xuxuxa','f',20,NULL),(32,'joana darkkkk','f',30,NULL),(33,'jorge costa leite junior','m',30,NULL),(35,'Bahia minha vida','m',80,'torcida louca'),(36,'coisinho','m',20,'gripe'),(37,'coisinha da silva','f',30,'gripe'),(38,'Gilberto','m',33,NULL);
 ALTER TABLE `pacientes` ENABLE KEYS ;
UNLOCK TABLES;



--
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;

CREATE TABLE `consultas` (
  `idmedicos` int(10) unsigned NOT NULL,
  `idpacientes` int(10) unsigned NOT NULL,
  `idambulatorios` int(10) unsigned NOT NULL,
  `dia` date NOT NULL,
  `hora` time NOT NULL,
  `iddoencas` int(5) unsigned NOT NULL,
  KEY `fkIdx_53` (`idmedicos`),
  KEY `fkIdx_59` (`idpacientes`),
  CONSTRAINT `FK_53` FOREIGN KEY (`idmedicos`) REFERENCES `medicos` (`idmedicos`),
  CONSTRAINT `FK_59` FOREIGN KEY (`idpacientes`) REFERENCES `pacientes` (`idpacientes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consultas`
--

LOCK TABLES `consultas` WRITE;
 ALTER TABLE `consultas` DISABLE KEYS;
INSERT INTO `consultas` VALUES (6,12,5,'2017-06-03','08:30:00',4),(12,12,2,'2016-08-05','17:00:00',1),(12,12,1,'2016-11-11','16:00:00',3),(6,12,5,'2016-11-03','08:30:00',3),(12,12,2,'2016-04-02','17:00:00',4),(12,12,1,'2016-12-21','16:00:00',3),(7,11,1,'2017-05-15','09:00:00',3),(11,11,3,'2016-04-05','17:30:00',6),(11,11,2,'2016-02-12','16:30:00',9),(7,11,1,'2017-06-02','09:00:00',9),(11,11,3,'2017-10-09','17:30:00',9),(11,11,2,'2016-03-20','16:30:00',8),(12,10,5,'2017-01-01','13:00:00',2),(7,10,2,'2017-11-09','09:30:00',4),(10,10,1,'2017-05-25','08:30:00',7),(10,10,3,'2016-03-23','17:00:00',2),(12,10,5,'2017-06-29','13:00:00',7),(7,10,2,'2016-10-15','09:30:00',2),(10,10,1,'2016-12-15','08:30:00',7),(10,10,3,'2017-12-15','17:00:00',9),(9,9,4,'2017-03-17','12:30:00',5),(6,9,4,'2016-01-09','17:30:00',6),(9,9,1,'2016-02-18','16:30:00',4),(9,9,3,'2017-08-10','15:30:00',5),(9,9,4,'2017-07-24','12:30:00',4),(6,9,4,'2016-02-22','17:30:00',1),(9,9,1,'2016-05-19','16:30:00',7),(9,9,3,'2017-04-24','15:30:00',9),(5,8,3,'2016-09-18','17:00:00',5),(8,8,3,'2016-03-17','16:00:00',9),(8,8,2,'2016-02-16','15:00:00',9),(5,8,3,'2016-08-16','17:00:00',8),(8,8,3,'2017-02-18','16:00:00',5),(8,8,2,'2016-08-06','15:00:00',1),(7,7,2,'2017-02-11','11:30:00',8),(5,7,2,'2016-01-14','16:30:00',9),(7,7,2,'2016-03-05','15:30:00',1),(7,7,1,'2017-04-27','14:30:00',8),(7,7,2,'2016-04-02','11:30:00',6),(5,7,2,'2016-01-23','16:30:00',8),(7,7,2,'2017-12-04','15:30:00',0),(7,7,1,'2016-11-16','14:30:00',7),(6,6,1,'2016-01-03','11:00:00',6),(4,6,1,'2016-09-01','16:00:00',9),(6,6,1,'2017-10-05','15:00:00',8),(6,6,3,'2017-11-21','14:00:00',1),(6,6,1,'2016-10-20','11:00:00',1),(4,6,1,'2016-11-27','16:00:00',4),(6,6,1,'2017-10-25','15:00:00',6),(6,6,3,'2016-03-18','14:00:00',9),(5,5,5,'2016-11-13','10:30:00',7),(3,5,5,'2017-07-11','15:30:00',8),(9,5,1,'2016-07-21','12:00:00',0),(5,5,3,'2016-03-05','14:30:00',6),(5,5,3,'2016-01-08','11:00:00',7),(5,5,2,'2017-12-26','13:30:00',10),(5,5,2,'2017-08-20','10:00:00',6),(5,5,5,'2016-06-13','10:30:00',3),(3,5,5,'2017-07-20','15:30:00',5),(9,5,1,'2017-09-08','12:00:00',6),(5,5,3,'2017-12-05','14:30:00',5),(5,5,3,'2017-09-08','11:00:00',6),(5,5,2,'2016-09-28','13:30:00',7),(5,5,2,'2016-06-29','10:00:00',6),(4,4,4,'2017-03-27','10:00:00',9),(8,4,3,'2017-03-24','12:00:00',5),(2,4,4,'2016-09-08','15:00:00',1),(9,4,3,'2017-07-12','11:30:00',10),(4,4,2,'2017-03-20','14:00:00',4),(4,4,2,'2017-07-08','10:30:00',4),(4,4,1,'2017-01-08','13:00:00',5),(4,4,1,'2016-02-17','09:30:00',3),(4,4,4,'2017-11-22','10:00:00',1),(8,4,3,'2017-06-04','12:00:00',5),(2,4,4,'2017-02-28','15:00:00',4),(9,4,3,'2016-01-05','11:30:00',3),(4,4,2,'2017-07-04','14:00:00',4),(4,4,2,'2017-12-22','10:30:00',1),(4,4,1,'2017-04-22','13:00:00',4),(4,4,1,'2017-07-29','09:30:00',7),(3,3,3,'2016-07-22','09:30:00',2),(1,3,3,'2016-04-27','14:30:00',9),(8,3,2,'2017-05-13','11:00:00',9),(3,3,1,'2017-12-22','13:30:00',8),(3,3,1,'2016-09-15','10:00:00',4),(3,3,3,'2017-10-24','12:30:00',4),(3,3,3,'2017-01-20','09:00:00',1),(3,3,3,'2016-11-28','09:30:00',0),(1,3,3,'2017-09-06','14:30:00',9),(8,3,2,'2016-01-02','11:00:00',5),(3,3,1,'2017-10-25','13:30:00',7),(3,3,1,'2016-08-01','10:00:00',2),(3,3,3,'2017-03-15','12:30:00',6),(3,3,3,'2016-08-01','09:00:00',5),(2,2,2,'2017-03-24','09:00:00',6),(10,2,2,'2016-10-18','14:00:00',6),(8,2,1,'2016-01-19','10:30:00',0),(2,2,3,'2017-03-14','13:00:00',4),(2,2,3,'2017-06-25','09:30:00',8),(2,2,2,'2017-03-20','12:00:00',10),(2,2,2,'2017-12-07','08:30:00',3),(2,2,2,'2017-08-24','09:00:00',8),(10,2,2,'2016-07-26','14:00:00',9),(8,2,1,'2016-06-13','10:30:00',1),(2,2,3,'2017-04-26','13:00:00',8),(2,2,3,'2016-02-05','09:30:00',6),(2,2,2,'2016-06-13','12:00:00',7),(2,2,2,'2017-01-18','08:30:00',7),(1,1,1,'2016-03-21','08:30:00',5),(11,1,1,'2016-03-08','13:30:00',1),(8,1,3,'2017-07-07','10:00:00',3),(1,1,2,'2017-07-14','12:30:00',2),(1,1,2,'2017-02-12','09:00:00',2),(1,1,1,'2017-02-12','11:30:00',2),(1,1,1,'2016-06-01','17:30:00',6),(1,1,1,'2016-09-18','08:30:00',1),(11,1,1,'2016-06-03','13:30:00',9),(8,1,3,'2017-11-28','10:00:00',2),(1,1,2,'2017-03-29','12:30:00',2),(1,1,2,'2016-03-22','09:00:00',4),(1,1,1,'2016-03-13','11:30:00',6),(1,1,1,'2017-12-07','17:30:00',6),(1,1,1,'2019-10-10','08:00:00',1);
ALTER TABLE `consultas` ENABLE KEYS;
UNLOCK TABLES;
