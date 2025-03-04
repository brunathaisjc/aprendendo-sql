DROP DATAbase if EXISTS `bancotimes` ;
CREATE DATABASE  IF NOT EXISTS `bancotimes` ;
USE `bancotimes`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bancotimes
-- ------------------------------------------------------
-- Server version	8.0.11

--
-- Table structure for table `times`
--

DROP TABLE IF EXISTS `times`;

CREATE TABLE `times` (
  `idtimes` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `valor` double DEFAULT NULL,
  `anodefundacao` int(4) DEFAULT NULL,
  PRIMARY KEY (`idtimes`)
)  AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `times`
--

LOCK TABLES `times` WRITE;
ALTER TABLE `times` DISABLE KEYS ;
INSERT INTO `times` VALUES (1,'Bahia',2000000,1931),(2,'Flamengo',400000000,1890),(3,'Botafogo',10000000,1907),(4,'Juventus',5000000,1920);
 ALTER TABLE `times` ENABLE KEYS ;
UNLOCK TABLES;



-- Dump completed on 2020-07-24 22:13:26

--
-- Table structure for table `jogadores`
--

DROP TABLE IF EXISTS `jogadores`;

CREATE TABLE `jogadores` (
  `idjogadores` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `salario` double DEFAULT NULL,
  `datanascimento` date DEFAULT NULL,
  `idtimes` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idjogadores`),
  KEY `idtimes` (`idtimes`),
  CONSTRAINT `jogadores_ibfk_1` FOREIGN KEY (`idtimes`) REFERENCES `times` (`idtimes`)
)  AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;


--
-- Dumping data for table `jogadores`
--

LOCK TABLES `jogadores` WRITE;
 ALTER TABLE `jogadores` DISABLE KEYS ;
INSERT INTO `jogadores` VALUES (1,'Jorge',4000,'2000-01-01',1),(2,'Alex',2000,'2004-01-04',1),(3,'Paulo',3000,'1999-04-01',1),(4,'Luiz',4000,'1980-01-01',2),(5,'Tico',3000,'2002-01-04',2),(6,'Caio',3000,'1999-04-01',2),(7,'Kaka',4000,'1982-01-01',3),(8,'Xaxa',1500,'2002-01-04',3),(9,'Sandro',3000,'1999-04-11',3),(10,'James',5000,'1981-01-01',4),(11,'Zezé',1500,'2001-01-04',4),(12,'Tico',2300,'1980-04-11',4);
 ALTER TABLE `jogadores` ENABLE KEYS ;
UNLOCK TABLES;

