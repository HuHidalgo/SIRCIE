-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sircie
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Temporary view structure for view `consultaauditoria`
--

DROP TABLE IF EXISTS `consultaauditoria`;
/*!50001 DROP VIEW IF EXISTS `consultaauditoria`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `consultaauditoria` AS SELECT 
 1 AS `idAuditoria`,
 1 AS `idTipoAuditoria`,
 1 AS `descripcionTipoAuditoria`,
 1 AS `idAccion`,
 1 AS `descripcionAccion`,
 1 AS `direccionIp`,
 1 AS `exito`,
 1 AS `comentario`,
 1 AS `nombreUsuario`,
 1 AS `fecha`,
 1 AS `hora`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `man_concepto`
--

DROP TABLE IF EXISTS `man_concepto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `man_concepto` (
  `nIdConcepto` int(4) NOT NULL AUTO_INCREMENT,
  `vNroConceptoEsp` varchar(3) NOT NULL,
  `vNomConceptoEsp` varchar(100) NOT NULL,
  `vDescConceptoEsp` varchar(255) DEFAULT NULL,
  `nImporte` decimal(6,2) NOT NULL,
  `vUsuarioAdicion` varchar(20) DEFAULT NULL,
  `dFechaAdicion` datetime DEFAULT NULL,
  `vUsuarioModificacion` varchar(20) DEFAULT NULL,
  `dFechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`nIdConcepto`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `man_concepto`
--

LOCK TABLES `man_concepto` WRITE;
/*!40000 ALTER TABLE `man_concepto` DISABLE KEYS */;
INSERT INTO `man_concepto` VALUES (7,'010','DERECHO DE MATRICULA: MAESTRÍA','PAGO POR CADA SEMESTRE',348.00,'miguel.puente','2018-03-15 14:08:51',NULL,NULL),(8,'010','DERECHO DE MATRICULA: DOCTORADO','PAGO POR CADA SEMESTRE',448.00,'miguel.puente','2018-03-15 14:10:52',NULL,NULL),(9,'004','RESERVA DE MATRICULA','PAGO POR CADA SEMESTRE',45.00,'miguel.puente','2018-03-15 14:11:37','miguel.puente','2018-03-17 22:41:58'),(10,'024','CURSO DE CAPACITACIÓN','CURSO DE CAPACITACIÓN',600.00,'miguel.puente','2018-03-15 14:33:28',NULL,NULL),(11,'020','MATRICULA AL CURSO DE CAPACITACIÓN','MATRICULA AL CURSO DE CAPACITACIÓN',50.00,'miguel.puente','2018-03-15 14:34:25',NULL,NULL),(12,'026','CURSO DE ACTUALIZACIÓN','CURSO DE ACTUALIZACIÓN',200.00,'miguel.puente','2018-03-15 14:35:14',NULL,NULL),(13,'001','MATRICULA INGRESANTE: PAGO ANUAL','PAGO PARA TODO EL AÑO',162.00,'miguel.puente','2018-03-15 14:36:49',NULL,NULL),(14,'002','MATRICULA INGRESANTE: PAGO SEMESTRAL','PAGO SOLO UN SEMESTRE',81.00,'miguel.puente','2018-03-15 14:37:46',NULL,NULL);
/*!40000 ALTER TABLE `man_concepto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `man_curso`
--

DROP TABLE IF EXISTS `man_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `man_curso` (
  `vCodigoCurso` varchar(10) NOT NULL,
  `vCodigoUnidad` varchar(10) NOT NULL,
  `nIdConcepto` int(11) NOT NULL,
  `vNombreCurso` varchar(255) DEFAULT NULL,
  `nNroSemestres` int(11) DEFAULT NULL,
  `vUsuarioAdicion` varchar(20) DEFAULT NULL,
  `dFechaAdicion` datetime DEFAULT NULL,
  `vUsuarioModificacion` varchar(20) DEFAULT NULL,
  `dFechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`vCodigoCurso`),
  KEY `fk_curso_unidad` (`vCodigoUnidad`),
  KEY `fk_curso_concepto` (`nIdConcepto`),
  CONSTRAINT `fk_curso_concepto` FOREIGN KEY (`nIdConcepto`) REFERENCES `man_unidad_concepto` (`nIdConcepto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_curso_unidad` FOREIGN KEY (`vCodigoUnidad`) REFERENCES `man_unidad_concepto` (`vCodigoUnidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `man_curso`
--

LOCK TABLES `man_curso` WRITE;
/*!40000 ALTER TABLE `man_curso` DISABLE KEYS */;
INSERT INTO `man_curso` VALUES ('10','F061110',12,'CONTABILIDAD',10,'HuHidalgo','2018-03-21 23:43:33','HuHidalgo','2018-03-22 12:32:22'),('12','F061110',10,'BUSINESS INTELLIGENCE',8,'HuHidalgo','2018-03-21 23:14:57','HuHidalgo','2018-03-26 12:18:04'),('20','F061110',10,'ERP',6,'HuHidalgo','2018-03-22 12:34:51',NULL,NULL),('3','F061107',7,'AUDITORIA FINANCIERA',5,'HuHidalgo','2018-03-21 23:32:28','HuHidalgo','2018-03-22 12:33:48'),('5','F061107',8,'ANÁLISIS FINANCIERO',8,'HuHidalgo','2018-03-25 22:17:04',NULL,NULL),('8','F061110',11,'SISTEMAS',4,'HuHidalgo','2018-03-21 23:44:26',NULL,NULL);
/*!40000 ALTER TABLE `man_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `man_meta`
--

DROP TABLE IF EXISTS `man_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `man_meta` (
  `nNroMeta` int(11) NOT NULL,
  `vNomMeta` varchar(255) DEFAULT NULL,
  `vDesMeta` varchar(255) DEFAULT NULL,
  `vUsuarioAdicion` varchar(20) DEFAULT NULL,
  `dFechaAdicion` datetime DEFAULT NULL,
  `vUsuarioModificacion` varchar(20) DEFAULT NULL,
  `dFechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`nNroMeta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `man_meta`
--

LOCK TABLES `man_meta` WRITE;
/*!40000 ALTER TABLE `man_meta` DISABLE KEYS */;
INSERT INTO `man_meta` VALUES (12,'GESTIÓN DEL PROGRAMA','GESTION DEL PROGRAMA','miguel.puente','2018-03-13 14:22:31',NULL,NULL),(13,'SEGUIMIENTO Y EVALUACIÓN','SEGUIMIENTO Y EVALUACIÓN','miguel.puente','2018-03-13 14:24:11','miguel.puente','2018-03-15 12:10:19'),(14,'ACREDITACIÓN DE CARRERAS PROFESIONALES','ACREDITACIÓN DE CARRERAS PROFESIONALES','miguel.puente','2018-03-15 12:09:24',NULL,NULL),(16,'SELECCIÓN DOCENTE','SELECCIÓN DOCENTE','miguel.puente','2018-03-15 12:10:05','miguel.puente','2018-03-15 12:25:19'),(17,'EJERCICIO DE LA DOCENCIA UNIVERSITARIA','EJERCICIO DE LA DOCENCIA UNIVERSITARIA','miguel.puente','2018-03-15 12:10:42',NULL,NULL),(18,'EVALUACIÓN DE DOCENTES','EVALUACIÓN DE DOCENTES','miguel.puente','2018-03-15 12:11:24',NULL,NULL),(28,'DESARROLLO DE ACTIVIDADES ACADEMICAS ESCUELA DE POST-GRADO','DESARROLLO DE ACTIVIDADES ACADEMICAS ESCUELA DE POST-GRADO','miguel.puente','2018-03-13 16:47:24',NULL,NULL);
/*!40000 ALTER TABLE `man_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `man_multitablacab`
--

DROP TABLE IF EXISTS `man_multitablacab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `man_multitablacab` (
  `nIdTabla` tinyint(4) NOT NULL AUTO_INCREMENT,
  `vDescripcion` varchar(50) DEFAULT NULL,
  `vUsuarioAdicion` varchar(20) DEFAULT NULL,
  `dFechaAdicion` datetime DEFAULT NULL,
  `vUsuarioModificacion` varchar(20) DEFAULT NULL,
  `dFechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`nIdTabla`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `man_multitablacab`
--

LOCK TABLES `man_multitablacab` WRITE;
/*!40000 ALTER TABLE `man_multitablacab` DISABLE KEYS */;
INSERT INTO `man_multitablacab` VALUES (1,'TIPO DE DOCUMENTO',NULL,NULL,NULL,NULL),(9,'ACCION',NULL,NULL,NULL,NULL),(16,'TIPO DE EXAMEN','miguel.puente','2018-02-06 19:04:59',NULL,NULL),(17,'TIPO DE MONEDA','miguel.puente','2018-03-09 23:32:38',NULL,NULL);
/*!40000 ALTER TABLE `man_multitablacab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `man_multitabladet`
--

DROP TABLE IF EXISTS `man_multitabladet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `man_multitabladet` (
  `nIdTabla` tinyint(4) NOT NULL,
  `vIdItem` varchar(4) NOT NULL,
  `vDescripcionItem` varchar(50) DEFAULT NULL,
  `vAbreviatura` varchar(10) DEFAULT NULL,
  `vUsuarioAdicion` varchar(20) DEFAULT NULL,
  `dFechaAdicion` datetime DEFAULT NULL,
  `vUsuarioModificacion` varchar(20) DEFAULT NULL,
  `dFechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`nIdTabla`,`vIdItem`),
  KEY `fk_MaeMultiTablaDet_MaeMultiTablaCab1_idx` (`nIdTabla`),
  CONSTRAINT `fk_MaeMultiTablaDet_MaeMultiTablaCab1` FOREIGN KEY (`nIdTabla`) REFERENCES `man_multitablacab` (`nIdTabla`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `man_multitabladet`
--

LOCK TABLES `man_multitabladet` WRITE;
/*!40000 ALTER TABLE `man_multitabladet` DISABLE KEYS */;
INSERT INTO `man_multitabladet` VALUES (1,'CEXT','CARNET DE EXTRANJERIA','CARNET EXT',NULL,NULL,NULL,NULL),(1,'DNI','DOCUMENTO NACIONAL DE IDENTIDAD','DNI',NULL,NULL,NULL,NULL),(1,'RUC','REGISTRO ÚNICO DE CONTRIBUYENTES','RUC','miguel.puente','2018-03-10 00:32:05',NULL,NULL),(9,'A','ACCESO',NULL,NULL,NULL,NULL,NULL),(9,'D','ELIMINACION',NULL,NULL,NULL,NULL,NULL),(9,'I','REGISTRO',NULL,NULL,NULL,NULL,NULL),(9,'R','REPORTE',NULL,NULL,NULL,NULL,NULL),(9,'S','CONSULTA',NULL,NULL,NULL,NULL,NULL),(9,'U','ACTUALIZACION',NULL,NULL,NULL,NULL,NULL),(9,'V','VISITA',NULL,NULL,NULL,NULL,NULL),(16,'L','LABORATORIO','','miguel.puente','2018-02-06 19:05:13',NULL,NULL),(16,'P','PSICOLOGICO','','miguel.puente','2018-02-06 19:05:37',NULL,NULL),(16,'R','RADIOLOGICO','','miguel.puente','2018-02-06 19:05:17',NULL,NULL),(17,'D','DOLARES','DOL','miguel.puente','2018-03-09 23:33:15',NULL,NULL),(17,'S','SOLES','SOL','miguel.puente','2018-03-09 23:33:03',NULL,NULL);
/*!40000 ALTER TABLE `man_multitabladet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `man_partida`
--

DROP TABLE IF EXISTS `man_partida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `man_partida` (
  `vClasificador` varchar(20) NOT NULL,
  `vDescripcion` varchar(45) DEFAULT NULL,
  `vDescDetallada` varchar(255) DEFAULT NULL,
  `vUsuarioAdicion` varchar(20) DEFAULT NULL,
  `dFechaAdicion` datetime DEFAULT NULL,
  `vUsuarioModificacion` varchar(20) DEFAULT NULL,
  `dFechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`vClasificador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `man_partida`
--

LOCK TABLES `man_partida` WRITE;
/*!40000 ALTER TABLE `man_partida` DISABLE KEYS */;
INSERT INTO `man_partida` VALUES ('2.1.11.299','OTRAS RETRIBUCIONES Y COMPLEMENTOS','GASTOS OTRAS RETRIBUCIONES Y COMPLEMENTOS','miguel.puente','2018-03-15 13:34:54',NULL,NULL),('2.3.11.11','ALIMENTOS Y BEBIDAS PARA CONSUMO HUMANO','GASTOS POR LA ADQUISICIÓN DE BEBIDAS EN SUS DIVERSAS FORMAS','miguel.puente','2018-03-15 13:29:34',NULL,NULL);
/*!40000 ALTER TABLE `man_partida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `man_persona`
--

DROP TABLE IF EXISTS `man_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `man_persona` (
  `vTipoDocumento` varchar(5) NOT NULL,
  `vNumeroDocumento` varchar(12) NOT NULL,
  `vNombres` varchar(100) DEFAULT NULL,
  `vApellidoPaterno` varchar(100) DEFAULT NULL,
  `vApellidoMaterno` varchar(100) DEFAULT NULL,
  `vUsuarioAdicion` varchar(20) DEFAULT NULL,
  `dFechaAdicion` datetime DEFAULT NULL,
  `vUsuarioModificacion` varchar(20) DEFAULT NULL,
  `dFechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`vTipoDocumento`,`vNumeroDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `man_persona`
--

LOCK TABLES `man_persona` WRITE;
/*!40000 ALTER TABLE `man_persona` DISABLE KEYS */;
INSERT INTO `man_persona` VALUES ('DNI','07474391','MIGUEL','PUENTE','ZALAZ','hanz.llanto','2018-02-05 03:53:13',NULL,NULL),('DNI','46341151','HUMBERTO','HIDALGO','IZQUIERDO','miguel.puente','2018-03-19 11:34:52',NULL,NULL),('DNI','77288852','HANZ JORDY','LLANTO','CCALLUCHI','miguel.puente','2018-02-08 03:05:12',NULL,NULL);
/*!40000 ALTER TABLE `man_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `man_tarea`
--

DROP TABLE IF EXISTS `man_tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `man_tarea` (
  `nCodigoTarea` int(11) NOT NULL,
  `vCodigoUnidad` varchar(10) NOT NULL,
  `nNroMeta` int(11) NOT NULL,
  `vNomTarea` varchar(255) DEFAULT NULL,
  `vUsuarioAdicion` varchar(20) DEFAULT NULL,
  `dFechaAdicion` datetime DEFAULT NULL,
  `vUsuarioModificacion` varchar(20) DEFAULT NULL,
  `dFechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`nCodigoTarea`),
  KEY `fk_tarea_unidad_idx` (`vCodigoUnidad`),
  KEY `fk_tarea_meta_idx` (`nNroMeta`),
  CONSTRAINT `fk_tarea_meta` FOREIGN KEY (`nNroMeta`) REFERENCES `man_meta` (`nNroMeta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tarea_unidad` FOREIGN KEY (`vCodigoUnidad`) REFERENCES `man_unidad` (`vCodigoUnidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `man_tarea`
--

LOCK TABLES `man_tarea` WRITE;
/*!40000 ALTER TABLE `man_tarea` DISABLE KEYS */;
INSERT INTO `man_tarea` VALUES (180390,'F061107',28,'REALIZAR EL PROCESO DE ADMISIÓN DE LOS ESTUDIOS DE POSGRADO','miguel.puente','2018-03-13 16:48:27','miguel.puente','2018-03-15 12:35:15'),(182350,'F061107',28,'BRINDAR PROGRAMAS DE INDUCCIÓN A LOS POSTULANTES A LAS MAESTRÍAS Y DOCTORADOS (PRE MAESTRÍA, CONFERENCIAS Y CHARLAS)','miguel.puente','2018-03-14 10:34:03','miguel.puente','2018-03-15 13:20:37'),(182358,'F061110',16,'ELABORAR EL INFORME PRESUPUESTAL PARA EL CONTROL DE LA EJECUCIÓN DEL PRESUPUESTO','miguel.puente','2018-03-13 17:26:42','HuHidalgo','2018-03-26 12:32:48'),(182359,'F0611',12,'REALIZAR LA EMISIÓN DE FACTURAS Y/O BOLETAS DE VENTAS POR LOS PAGOS EFECTUADOS POR LOS USUARIOS','miguel.puente','2018-03-13 15:30:21','HuHidalgo','2018-03-26 12:16:09'),(182371,'F0611',13,'VERIFICAR EL CUMPLIMIENTO DE LOS REQUERIMIENTOS PARA LA OBTENCIÓN DEL GRADO DE BACHILLER','miguel.puente','2018-03-13 16:06:54',NULL,NULL);
/*!40000 ALTER TABLE `man_tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `man_tarea_partida`
--

DROP TABLE IF EXISTS `man_tarea_partida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `man_tarea_partida` (
  `vClasificador` varchar(20) NOT NULL,
  `nCodigoTarea` int(11) NOT NULL,
  `vNomTarea` varchar(255) DEFAULT NULL,
  `vDescripcion` varchar(100) DEFAULT NULL,
  `vDescDetallada` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vClasificador`,`nCodigoTarea`),
  KEY `fk_tarea_idx` (`nCodigoTarea`),
  KEY `fk_partida_idx` (`vClasificador`),
  CONSTRAINT `fk_partida` FOREIGN KEY (`vClasificador`) REFERENCES `man_partida` (`vClasificador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tarea` FOREIGN KEY (`nCodigoTarea`) REFERENCES `man_tarea` (`nCodigoTarea`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `man_tarea_partida`
--

LOCK TABLES `man_tarea_partida` WRITE;
/*!40000 ALTER TABLE `man_tarea_partida` DISABLE KEYS */;
INSERT INTO `man_tarea_partida` VALUES ('2.1.11.299',182359,'REALIZAR LA EMISIÓN DE FACTURAS Y/O BOLETAS DE VENTAS POR LOS PAGOS EFECTUADOS POR LOS USUARIOS','OTRAS RETRIBUCIONES Y COMPLEMENTOS','GASTOS OTRAS RETRIBUCIONES Y COMPLEMENTOS'),('2.3.11.11',182350,'BRINDAR PROGRAMAS DE INDUCCIÓN A LOS POSTULANTES A LAS MAESTRÍAS Y DOCTORADOS (PRE MAESTRÍA, CONFERENCIAS Y CHARLAS)','ALIMENTOS Y BEBIDAS PARA CONSUMO HUMANO','GASTOS POR LA ADQUISICIÓN DE BEBIDAS EN SUS DIVERSAS FORMAS');
/*!40000 ALTER TABLE `man_tarea_partida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `man_unidad`
--

DROP TABLE IF EXISTS `man_unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `man_unidad` (
  `vCodigoUnidad` varchar(10) NOT NULL,
  `vNombreUnidad` varchar(100) NOT NULL,
  `vNroConcepto` varchar(3) NOT NULL,
  `vUsuarioAdicion` varchar(20) DEFAULT NULL,
  `dFechaAdicion` datetime DEFAULT NULL,
  `vUsuarioModificacion` varchar(20) DEFAULT NULL,
  `dFechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`vCodigoUnidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `man_unidad`
--

LOCK TABLES `man_unidad` WRITE;
/*!40000 ALTER TABLE `man_unidad` DISABLE KEYS */;
INSERT INTO `man_unidad` VALUES ('F0611','FACULTAD DE CIENCIAS CONTABLES','111','miguel.puente','2018-03-13 10:29:08',NULL,NULL),('F061107','POST-GRADO','112','miguel.puente','2018-03-09 23:52:14',NULL,NULL),('F061110','CERSEU','113','miguel.puente','2018-03-13 10:28:28',NULL,NULL);
/*!40000 ALTER TABLE `man_unidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `man_unidad_concepto`
--

DROP TABLE IF EXISTS `man_unidad_concepto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `man_unidad_concepto` (
  `vCodigoUnidad` varchar(10) NOT NULL,
  `nIdConcepto` int(11) NOT NULL,
  `vNombreUnidad` varchar(100) DEFAULT NULL,
  `vNroConceptoUnidad` varchar(3) DEFAULT NULL,
  `vNroConceptoEsp` varchar(3) DEFAULT NULL,
  `vNomConceptoEsp` varchar(100) DEFAULT NULL,
  `vDescConceptoEsp` varchar(255) DEFAULT NULL,
  `nImporte` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`nIdConcepto`,`vCodigoUnidad`),
  KEY `fk_concepto_idx` (`nIdConcepto`),
  KEY `fk_unidad_ idx` (`vCodigoUnidad`),
  CONSTRAINT `fk_concepto` FOREIGN KEY (`nIdConcepto`) REFERENCES `man_concepto` (`nIdConcepto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_unidad` FOREIGN KEY (`vCodigoUnidad`) REFERENCES `man_unidad` (`vCodigoUnidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `man_unidad_concepto`
--

LOCK TABLES `man_unidad_concepto` WRITE;
/*!40000 ALTER TABLE `man_unidad_concepto` DISABLE KEYS */;
INSERT INTO `man_unidad_concepto` VALUES ('F061107',7,'POST-GRADO','112','010','DERECHO DE MATRICULA: MAESTRÍA','PAGO POR CADA SEMESTRE',348.00),('F061107',8,'POST-GRADO','112','010','DERECHO DE MATRICULA: DOCTORADO','PAGO POR CADA SEMESTRE',448.00),('F061107',9,'POST-GRADO','112','004','RESERVA DE MATRICULA','PAGO POR CADA SEMESTRE',45.00),('F061110',10,'CERSEU','113','024','CURSO DE CAPACITACIÓN','CURSO DE CAPACITACIÓN',600.00),('F061110',11,'CERSEU','113','020','MATRICULA AL CURSO DE CAPACITACIÓN','MATRICULA AL CURSO DE CAPACITACIÓN',50.00),('F061110',12,'CERSEU','113','026','CURSO DE ACTUALIZACIÓN','CURSO DE ACTUALIZACIÓN',200.00),('F0611',13,'FACULTAD DE CIENCIAS CONTABLES','111','001','MATRICULA INGRESANTE: PAGO ANUAL','PAGO PARA TODO EL AÑO',162.00),('F0611',14,'FACULTAD DE CIENCIAS CONTABLES','111','002','MATRICULA INGRESANTE: PAGO SEMESTRAL','PAGO SOLO UN SEMESTRE',81.00);
/*!40000 ALTER TABLE `man_unidad_concepto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reg_cliente`
--

DROP TABLE IF EXISTS `reg_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reg_cliente` (
  `vNroDocCliente` varchar(15) NOT NULL,
  `vNombresCliente` varchar(45) DEFAULT NULL,
  `vApellidosCliente` varchar(45) DEFAULT NULL,
  `vTipoDocCliente` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`vNroDocCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_cliente`
--

LOCK TABLES `reg_cliente` WRITE;
/*!40000 ALTER TABLE `reg_cliente` DISABLE KEYS */;
INSERT INTO `reg_cliente` VALUES ('455226314','JUAN','LOPES1','DNI'),('455699698','CHET','BAKER','DNI'),('455699874','TOTO','AMERICA','DNI'),('4589969','LUIS','ALARCON','DNI'),('46341151','HUMBERTO','HIDALGO IZQUIERDO','DNI'),('526365878','DFSDFD','GHHGHG','DNI'),('563214121','RYO','FUKUY','DNI'),('5663254','CHET','BAKER','DNI');
/*!40000 ALTER TABLE `reg_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reg_ingreso`
--

DROP TABLE IF EXISTS `reg_ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reg_ingreso` (
  `nIdIngreso` int(11) NOT NULL AUTO_INCREMENT,
  `vCodigoUnidad` varchar(10) NOT NULL,
  `vNroDocCliente` varchar(15) NOT NULL,
  `nIdConcepto` int(11) DEFAULT NULL,
  `nDescuento` decimal(6,2) DEFAULT '0.00',
  `vDescDescuento` varchar(255) DEFAULT NULL,
  `nImporteDescontado` decimal(6,2) DEFAULT '0.00',
  `nImporteTotal` decimal(6,2) DEFAULT '0.00',
  `vCodigoCurso` varchar(10) DEFAULT NULL,
  `nNroCuota` int(11) DEFAULT NULL,
  `vTipoMoneda` varchar(10) DEFAULT NULL,
  `nTipoCambio` decimal(3,2) DEFAULT NULL,
  `vNroVoucher` varchar(15) DEFAULT NULL,
  `vNroFactura` varchar(15) DEFAULT NULL,
  `dFechaVF` date DEFAULT NULL,
  `vNroReciboIngreso` varchar(15) DEFAULT NULL,
  `dFechaRI` date DEFAULT NULL,
  `vUsuarioAdicion` varchar(20) DEFAULT NULL,
  `dFechaAdicion` datetime DEFAULT NULL,
  `vUsuarioModificacion` varchar(20) DEFAULT NULL,
  `dFechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`nIdIngreso`),
  KEY `fk_ingreso_unidad_idx` (`vCodigoUnidad`),
  KEY `fk_ingreso_cliente_idx` (`vNroDocCliente`),
  KEY `fk_ingreso_concepto_idx` (`nIdConcepto`),
  KEY `fk_ingreso_curdo_idx` (`vCodigoCurso`),
  CONSTRAINT `fk_ingreso_cliente` FOREIGN KEY (`vNroDocCliente`) REFERENCES `reg_cliente` (`vNroDocCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingreso_concepto` FOREIGN KEY (`nIdConcepto`) REFERENCES `man_concepto` (`nIdConcepto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingreso_curdo` FOREIGN KEY (`vCodigoCurso`) REFERENCES `man_curso` (`vCodigoCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingreso_unidad` FOREIGN KEY (`vCodigoUnidad`) REFERENCES `man_unidad_concepto` (`vCodigoUnidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_ingreso`
--

LOCK TABLES `reg_ingreso` WRITE;
/*!40000 ALTER TABLE `reg_ingreso` DISABLE KEYS */;
INSERT INTO `reg_ingreso` VALUES (1,'F061107','455699698',7,0.00,NULL,0.00,348.00,'3',0,'S',NULL,'12','131','2018-03-13',NULL,NULL,'HuHidalgo','2018-03-22 15:13:04',NULL,NULL),(2,'F061110','455226314',10,100.00,'nose',152.36,500.00,'20',0,'S',NULL,'1222','222','2018-03-20','2','2018-03-22','HuHidalgo','2018-03-22 15:15:10',NULL,NULL),(3,'F061107','455699874',7,0.00,NULL,0.00,348.00,'12',0,'S',NULL,'11111','45454','2018-03-21',NULL,NULL,'HuHidalgo','2018-03-22 15:52:24',NULL,NULL),(4,'F061110','5663254',12,0.00,NULL,0.00,200.00,'10',0,'S',NULL,'78787','12344','2018-03-22',NULL,NULL,'HuHidalgo','2018-03-22 15:55:33',NULL,NULL),(5,'F0611','563214121',13,0.00,NULL,0.00,162.00,NULL,0,'S',NULL,'7532','305033','2018-03-20',NULL,NULL,'HuHidalgo','2018-03-22 15:56:49',NULL,NULL),(6,'F061110','526365878',11,0.00,NULL,0.00,50.00,'8',0,'S',NULL,'23445454','66767676','2018-03-26',NULL,NULL,'HuHidalgo','2018-03-26 13:02:59',NULL,NULL);
/*!40000 ALTER TABLE `reg_ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_auditoria`
--

DROP TABLE IF EXISTS `seg_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_auditoria` (
  `nIdAuditoria` int(11) NOT NULL AUTO_INCREMENT,
  `vAccion` varchar(3) DEFAULT NULL,
  `nIdTipoAuditoria` smallint(6) NOT NULL,
  `vDireccionIp` varchar(15) DEFAULT NULL,
  `bExito` bit(1) DEFAULT NULL,
  `vComentario` varchar(400) DEFAULT NULL,
  `vUsuario` varchar(20) DEFAULT NULL,
  `dFecha` date DEFAULT NULL,
  `vHora` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`nIdAuditoria`),
  KEY `fk_tipo_auditoria_idx` (`nIdTipoAuditoria`),
  CONSTRAINT `fk_tipo_auditoria` FOREIGN KEY (`nIdTipoAuditoria`) REFERENCES `seg_tipoauditoria` (`nIdTipoAuditoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=923 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_auditoria`
--

LOCK TABLES `seg_auditoria` WRITE;
/*!40000 ALTER TABLE `seg_auditoria` DISABLE KEYS */;
INSERT INTO `seg_auditoria` VALUES (1,'A',2,'0:0:0:0:0:0:0:1','\0','El Usuario intenta acceder al sistema con un usuario no encontrado','MANT01','2018-02-02','20:06:30'),(2,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','hanz.llanto','2018-02-02','20:06:55'),(3,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','hanz.llanto','2018-02-02','20:07:53'),(4,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','hanz.llanto','2018-02-02','20:09:30'),(5,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','hanz.llanto','2018-02-02','22:11:51'),(6,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','hanz.llanto','2018-02-02','22:14:34'),(7,'S',1,'0:0:0:0:0:0:0:1','\0','Se intenta consultar todos los(as) datos de Persona','hanz.llanto','2018-02-02','22:14:36'),(8,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','hanz.llanto','2018-02-02','22:17:13'),(9,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','hanz.llanto','2018-02-02','22:17:19'),(10,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','hanz.llanto','2018-02-02','22:17:54'),(11,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','hanz.llanto','2018-02-02','22:17:56'),(12,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','hanz.llanto','2018-02-02','22:20:27'),(13,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','hanz.llanto','2018-02-02','22:20:29'),(14,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Persona [Tipo de Documento:DNI,Número de Documento:09392294,Apellido Paterno:LLANTO]','hanz.llanto','2018-02-02','22:21:26'),(15,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','hanz.llanto','2018-02-02','22:21:32'),(16,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','hanz.llanto','2018-02-02','22:21:33'),(17,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Persona con los datos [Tipo de Documento:DNI,Número de Documento:09392294,Apellido Paterno:LLANTOS]','hanz.llanto','2018-02-02','22:21:42'),(18,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-02','22:21:54'),(19,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-02','22:23:02'),(20,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-02','22:23:04'),(21,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-02','22:23:39'),(22,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-02','22:23:41'),(23,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-02','22:24:32'),(24,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-02','22:24:33'),(25,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-02','22:25:02'),(26,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-02','22:25:03'),(27,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Médico [Tipo de Documento:DNI,Número de Documento:77288852]','hanz.llanto','2018-02-02','22:25:36'),(28,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-02','22:26:10'),(29,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-02','22:26:12'),(30,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-02','22:26:35'),(31,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-02','22:27:16'),(32,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-02','22:27:18'),(33,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-02','22:27:49'),(34,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-02','22:27:50'),(35,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-02','22:28:29'),(36,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-02','22:28:30'),(37,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-02','22:29:14'),(38,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-02','22:29:16'),(39,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Médico con los datos [Tipo de Documento:DNI,Número de Documento:77288852]','hanz.llanto','2018-02-02','22:29:22'),(40,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-02','22:29:42'),(41,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-02','22:29:43'),(42,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-02','22:29:56'),(43,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-02','22:29:57'),(44,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-02','22:30:36'),(45,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-02','22:30:37'),(46,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-02','22:31:54'),(47,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-02','22:31:56'),(48,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Médico [Tipo de Documento:DNI,Número de Documento:77288852]','hanz.llanto','2018-02-02','22:32:02'),(49,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-02','22:33:27'),(50,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-02','22:33:31'),(51,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','22:33:34'),(52,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','22:40:02'),(53,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','22:40:46'),(54,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','22:41:03'),(55,'S',1,'0:0:0:0:0:0:0:1','\0','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-02','22:41:05'),(56,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','22:43:12'),(57,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-02','22:43:21'),(58,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','22:45:06'),(59,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-02','22:45:08'),(60,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','22:45:53'),(61,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-02','22:45:55'),(62,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','22:47:59'),(63,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-02','22:48:00'),(64,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','22:52:13'),(65,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-02','22:52:15'),(66,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','22:53:02'),(67,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-02','22:53:04'),(68,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','22:55:05'),(69,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-02','22:55:07'),(70,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','22:55:23'),(71,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-02','22:55:24'),(72,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','22:55:54'),(73,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-02','22:55:55'),(74,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','22:57:07'),(75,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-02','22:57:13'),(76,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:CEXT,Número de Documento:77288852]','hanz.llanto','2018-02-02','23:00:16'),(77,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:CEXT,Número de Documento:77288852]','hanz.llanto','2018-02-02','23:01:40'),(78,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Alumno [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:CEXT,Número de Documento:77288852]','hanz.llanto','2018-02-02','23:03:11'),(79,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','23:04:01'),(80,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','23:09:38'),(81,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','23:09:41'),(82,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-02','23:09:42'),(83,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','23:10:13'),(84,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','23:10:14'),(85,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-02','23:10:15'),(86,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Alumno [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:CEXT,Número de Documento:77288852]','hanz.llanto','2018-02-02','23:10:30'),(87,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','23:10:32'),(88,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-02','23:10:34'),(89,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-02','23:10:34'),(90,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','hanz.llanto','2018-02-02','23:13:37'),(91,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','hanz.llanto','2018-02-02','23:13:39'),(92,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','hanz.llanto','2018-02-02','23:13:44'),(93,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Tabla de Tablas [Id de Tabla:0,Descripción:MULTITABLA D PRUEA]','hanz.llanto','2018-02-02','23:14:59'),(94,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','hanz.llanto','2018-02-02','23:18:09'),(95,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','hanz.llanto','2018-02-02','23:18:10'),(96,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','hanz.llanto','2018-02-02','23:18:11'),(97,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Tabla de Tablas con los datos [Id de Tabla:13,Descripción:MULTITABLA D PRUEADDD]','hanz.llanto','2018-02-02','23:18:18'),(98,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Tabla de Tablas [Id de Tabla:13,Descripción:MULTITABLA D PRUEADDD]','hanz.llanto','2018-02-02','23:18:28'),(99,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','hanz.llanto','2018-02-02','23:18:30'),(100,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','hanz.llanto','2018-02-02','23:18:31'),(101,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','hanz.llanto','2018-02-02','23:18:32'),(102,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Tabla de Tablas [Id de Tabla:0,Descripción:DDDD]','hanz.llanto','2018-02-02','23:18:41'),(103,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Tabla de Tablas [Id de Tabla:14,Descripción:DDDD]','hanz.llanto','2018-02-02','23:18:44'),(104,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','hanz.llanto','2018-02-02','23:18:47'),(105,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Detalle de Tabla de Tablas con los datos [Id Detalle:C,Id Tabla:11,Descripción:CONCLUID]','hanz.llanto','2018-02-02','23:18:59'),(106,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Detalle de Tabla de Tablas con los datos [Id Detalle:C,Id Tabla:11,Descripción:CONCLUIDO]','hanz.llanto','2018-02-02','23:19:06'),(107,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','hanz.llanto','2018-02-02','23:19:09'),(108,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Tabla de Tablas con los datos [Id de Tabla:2,Descripción:DISCAPACIDADD]','hanz.llanto','2018-02-02','23:19:23'),(109,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Tabla de Tablas con los datos [Id de Tabla:2,Descripción:DISCAPACIDAD]','hanz.llanto','2018-02-02','23:19:26'),(110,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','hanz.llanto','2018-02-02','23:20:48'),(111,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','hanz.llanto','2018-02-02','23:20:49'),(112,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','hanz.llanto','2018-02-02','23:22:04'),(113,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','hanz.llanto','2018-02-02','23:22:06'),(114,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-02','23:22:24'),(115,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-02','23:22:25'),(116,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-02','23:34:31'),(117,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-02','23:34:36'),(118,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-03','01:09:30'),(119,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-03','01:09:34'),(120,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-03','01:11:15'),(121,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-03','01:11:16'),(122,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-03','01:15:07'),(123,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-03','01:15:09'),(124,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-03','01:15:36'),(125,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-03','01:15:38'),(126,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-03','01:16:51'),(127,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-03','01:18:02'),(128,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-03','01:18:02'),(129,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-03','01:20:38'),(130,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-03','01:20:40'),(131,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Campaña [Descripción:EXAMEN MEDICO REGULARE -2018,Tipo Certificado:R,Activo:true]','hanz.llanto','2018-02-03','01:21:04'),(132,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-03','01:21:49'),(133,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-03','01:21:51'),(134,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Campaña con los datos [Descripción:EXAMEN MEDICO REGULARE -2018,Tipo Certificado:R,Activo:false]','hanz.llanto','2018-02-03','01:21:58'),(135,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-03','01:22:29'),(136,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-03','01:22:30'),(137,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-03','01:22:31'),(138,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-03','01:22:32'),(139,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','hanz.llanto','2018-02-03','01:22:43'),(140,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','hanz.llanto','2018-02-03','01:22:43'),(141,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Persona [Tipo de Documento:DNI,Número de Documento:09392294,Apellido Paterno:LLANTOS]','hanz.llanto','2018-02-03','01:22:54'),(142,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-03','01:22:59'),(143,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-03','01:23:00'),(144,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Alumno [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:09392294]','hanz.llanto','2018-02-03','01:25:34'),(145,'U',1,'0:0:0:0:0:0:0:1','\0','Se intenta actualizar el(a) Alumno con los datos [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:09392294]','hanz.llanto','2018-02-03','01:26:11'),(146,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Alumno con los datos [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:09392294]','hanz.llanto','2018-02-03','01:26:57'),(147,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Alumno con los datos [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:09392294]','hanz.llanto','2018-02-03','01:27:21'),(148,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','hanz.llanto','2018-02-03','01:27:26'),(149,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','hanz.llanto','2018-02-03','01:27:27'),(150,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','hanz.llanto','2018-02-03','10:11:06'),(151,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-03','10:25:28'),(152,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-03','10:25:30'),(153,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-03','10:25:30'),(154,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','hanz.llanto','2018-02-03','10:57:22'),(155,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','hanz.llanto','2018-02-03','10:57:23'),(156,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','hanz.llanto','2018-02-03','10:57:27'),(157,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','hanz.llanto','2018-02-03','12:49:32'),(158,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','hanz.llanto','2018-02-03','12:49:43'),(159,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-03','15:10:08'),(160,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-03','15:10:11'),(161,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Alumno con los datos [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:09392294]','hanz.llanto','2018-02-03','15:10:36'),(162,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','hanz.llanto','2018-02-03','15:13:56'),(163,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','hanz.llanto','2018-02-03','15:14:13'),(164,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-03','15:18:37'),(165,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-03','15:18:39'),(166,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Campaña [Descripción:EXAMEN MEDICO DE INGREZANTE 2018 - 1,Tipo Certificado:I,Activo:true]','hanz.llanto','2018-02-03','15:20:11'),(167,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Campaña con los datos [Descripción:EXAMEN MEDICO REGULARE -2018,Tipo Certificado:R,Activo:false]','hanz.llanto','2018-02-03','15:20:54'),(168,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-03','15:22:44'),(169,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-03','15:22:45'),(170,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Alumno [Código de Alumno:13200024,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:12345678]','hanz.llanto','2018-02-03','15:25:42'),(171,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','hanz.llanto','2018-02-03','15:26:07'),(172,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','hanz.llanto','2018-02-03','15:26:08'),(173,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-03','15:26:15'),(174,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-03','15:26:16'),(175,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','hanz.llanto','2018-02-03','15:26:24'),(176,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','hanz.llanto','2018-02-03','15:26:24'),(177,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Persona [Tipo de Documento:DNI,Número de Documento:12345987,Apellido Paterno:LOMBARDI]','hanz.llanto','2018-02-03','15:26:49'),(178,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-03','15:26:52'),(179,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-03','15:26:53'),(180,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Médico [Tipo de Documento:DNI,Número de Documento:12345987]','hanz.llanto','2018-02-03','15:27:26'),(181,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','hanz.llanto','2018-02-03','15:27:49'),(182,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','hanz.llanto','2018-02-03','15:27:50'),(183,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','hanz.llanto','2018-02-03','15:31:45'),(184,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Detalle de Tabla de Tablas [Id Detalle:PARTIDA,Id Tabla:1,Descripción:PARTIDA DE NACIMIENTO]','hanz.llanto','2018-02-03','15:32:08'),(185,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Detalle de Tabla de Tablas [Id Detalle:PART,Id Tabla:1,Descripción:PARTIDA DE NACIMIENTO]','hanz.llanto','2018-02-03','15:32:25'),(186,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-03','15:43:49'),(187,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-03','15:43:50'),(188,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Campaña con los datos [Descripción:EXAMEN MEDICO DE INGREZANTE 2018 - 1,Tipo Certificado:I,Activo:false]','hanz.llanto','2018-02-03','15:43:56'),(189,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Campaña con los datos [Descripción:EXAMEN MEDICO REGULARE -2018,Tipo Certificado:R,Activo:true]','hanz.llanto','2018-02-03','15:44:10'),(190,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','hanz.llanto','2018-02-03','18:37:05'),(191,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','hanz.llanto','2018-02-03','18:38:02'),(192,'V',1,'0:0:0:0:0:0:0:1','\0','Se intenta visitar la página de Usuario','hanz.llanto','2018-02-03','19:07:06'),(193,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-03','19:07:10'),(194,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-03','19:07:10'),(195,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-03','19:07:52'),(196,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-03','19:07:53'),(197,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-03','19:08:38'),(198,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-03','19:08:39'),(199,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-03','19:09:12'),(200,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-03','19:09:13'),(201,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-03','19:11:47'),(202,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-03','19:11:48'),(203,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','hanz.llanto','2018-02-03','23:41:36'),(204,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','hanz.llanto','2018-02-04','00:34:31'),(205,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','hanz.llanto','2018-02-04','00:34:36'),(206,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-04','00:34:42'),(207,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-04','00:34:44'),(208,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:77288852]','hanz.llanto','2018-02-04','00:36:24'),(209,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Alumno [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:77288852]','hanz.llanto','2018-02-04','00:37:56'),(210,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','hanz.llanto','2018-02-04','00:38:00'),(211,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','hanz.llanto','2018-02-04','00:38:01'),(212,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','hanz.llanto','2018-02-04','00:38:04'),(213,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Detalle de Tabla de Tablas con los datos [Id Detalle:NO,Id Tabla:2,Descripción:NINGUNA]','hanz.llanto','2018-02-04','00:38:12'),(214,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-04','00:38:22'),(215,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-04','00:38:23'),(216,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Alumno con los datos [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:77288852]','hanz.llanto','2018-02-04','00:38:46'),(217,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Alumno con los datos [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:77288852]','hanz.llanto','2018-02-04','00:39:23'),(218,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-04','00:43:10'),(219,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-04','00:43:14'),(220,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-04','00:43:56'),(221,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-04','00:43:58'),(222,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-04','00:44:50'),(223,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-04','00:44:51'),(224,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Alumno con los datos [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:77288852]','hanz.llanto','2018-02-04','00:45:07'),(225,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-04','00:45:53'),(226,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-04','00:45:55'),(227,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-04','00:50:11'),(228,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-04','00:50:13'),(229,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Alumno con los datos [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:77288852]','hanz.llanto','2018-02-04','00:50:25'),(230,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-04','00:50:33'),(231,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-04','00:50:34'),(232,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-04','00:52:30'),(233,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-04','00:52:32'),(234,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Alumno con los datos [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:CEXT,Número de Documento:77288852]','hanz.llanto','2018-02-04','00:52:43'),(235,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Alumno con los datos [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:77288852]','hanz.llanto','2018-02-04','00:52:56'),(236,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','hanz.llanto','2018-02-04','00:53:00'),(237,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','hanz.llanto','2018-02-04','00:53:00'),(238,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','hanz.llanto','2018-02-04','00:53:01'),(239,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','hanz.llanto','2018-02-04','00:53:04'),(240,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Detalle de Tabla de Tablas [Id Detalle:PART,Id Tabla:1,Descripción:PARTIDA DE NACIMIENTO]','hanz.llanto','2018-02-04','00:53:11'),(241,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-04','00:53:18'),(242,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-04','00:53:19'),(243,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-04','01:27:07'),(244,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-04','01:27:08'),(245,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-04','01:28:49'),(246,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-04','01:28:50'),(247,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-04','01:33:50'),(248,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-04','01:33:51'),(249,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Campaña [Descripción:EXAMEN MEDICO DE INGREZANTE 2018 - 1,Tipo Certificado:I,Activo:false]','hanz.llanto','2018-02-04','01:34:05'),(250,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Campaña [Descripción:INGREA,Tipo Certificado:I,Activo:false]','hanz.llanto','2018-02-04','01:34:08'),(251,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-04','01:36:08'),(252,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-04','01:36:10'),(253,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-04','01:36:30'),(254,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-04','01:36:31'),(255,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-04','01:36:42'),(256,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-04','01:36:44'),(257,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-04','01:37:02'),(258,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-04','01:37:02'),(259,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-04','01:37:10'),(260,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-04','01:37:11'),(261,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-04','01:37:24'),(262,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-04','01:37:25'),(263,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','hanz.llanto','2018-02-04','02:59:19'),(264,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','hanz.llanto','2018-02-04','02:59:30'),(265,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Tabla de Tablas con los datos [Id de Tabla:6,Descripción:INDICADOR DE RPR]','hanz.llanto','2018-02-04','02:59:45'),(266,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Tabla de Tablas con los datos [Id de Tabla:7,Descripción:INDICADOR DE HEMOGRAMA]','hanz.llanto','2018-02-04','02:59:56'),(267,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Tabla de Tablas [Id de Tabla:0,Descripción:DILUCION]','hanz.llanto','2018-02-04','03:00:06'),(268,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','hanz.llanto','2018-02-04','03:00:09'),(269,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Detalle de Tabla de Tablas [Id Detalle:2,Id Tabla:15,Descripción:2]','hanz.llanto','2018-02-04','03:00:33'),(270,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Detalle de Tabla de Tablas [Id Detalle:4,Id Tabla:15,Descripción:4]','hanz.llanto','2018-02-04','03:00:38'),(271,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Detalle de Tabla de Tablas [Id Detalle:8,Id Tabla:15,Descripción:8]','hanz.llanto','2018-02-04','03:00:46'),(272,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Detalle de Tabla de Tablas [Id Detalle:16,Id Tabla:15,Descripción:16]','hanz.llanto','2018-02-04','03:00:51'),(273,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Detalle de Tabla de Tablas [Id Detalle:32,Id Tabla:15,Descripción:32]','hanz.llanto','2018-02-04','03:01:03'),(274,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Detalle de Tabla de Tablas [Id Detalle:64,Id Tabla:15,Descripción:64]','hanz.llanto','2018-02-04','03:01:10'),(275,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Detalle de Tabla de Tablas [Id Detalle:128,Id Tabla:15,Descripción:128]','hanz.llanto','2018-02-04','03:01:24'),(276,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Detalle de Tabla de Tablas [Id Detalle:256,Id Tabla:15,Descripción:256]','hanz.llanto','2018-02-04','03:01:37'),(277,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','hanz.llanto','2018-02-04','12:13:49'),(278,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-04','21:25:39'),(279,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-04','21:25:43'),(280,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-04','22:49:53'),(281,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-04','22:49:53'),(282,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-04','22:50:04'),(283,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','hanz.llanto','2018-02-05','00:05:51'),(284,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','hanz.llanto','2018-02-05','00:11:00'),(285,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-05','00:50:25'),(286,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-05','00:50:32'),(287,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-05','00:56:39'),(288,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-05','00:56:41'),(289,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Alumno [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:13200025]','hanz.llanto','2018-02-05','00:57:33'),(290,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-05','01:55:25'),(291,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-05','01:55:25'),(292,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-05','01:56:48'),(293,'V',1,'0:0:0:0:0:0:0:1','\0','Se intenta visitar la página de Usuario','hanz.llanto','2018-02-05','01:57:16'),(294,'V',1,'0:0:0:0:0:0:0:1','\0','Se intenta visitar la página de Usuario','hanz.llanto','2018-02-05','02:01:48'),(295,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','hanz.llanto','2018-02-05','02:02:34'),(296,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','hanz.llanto','2018-02-05','02:02:36'),(297,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','hanz.llanto','2018-02-05','02:05:50'),(298,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','hanz.llanto','2018-02-05','02:05:54'),(299,'U',1,'0:0:0:0:0:0:0:1','\0','Se intenta actualizar el(a) Usuario con los datos [Codigo de Usuario:hanz.llanto]','hanz.llanto','2018-02-05','02:06:12'),(300,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','hanz.llanto','2018-02-05','02:08:16'),(301,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','hanz.llanto','2018-02-05','02:08:20'),(302,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Usuario con los datos [Codigo de Usuario:hanz.llanto]','hanz.llanto','2018-02-05','02:08:34'),(303,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','hanz.llanto','2018-02-05','02:09:03'),(304,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','hanz.llanto','2018-02-05','02:09:04'),(305,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Usuario con los datos [Codigo de Usuario:hanz.llanto]','hanz.llanto','2018-02-05','02:09:11'),(306,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Usuario con los datos [Codigo de Usuario:hanz.llanto]','hanz.llanto','2018-02-05','02:09:17'),(307,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Usuario con los datos [Codigo de Usuario:hanz.llanto]','hanz.llanto','2018-02-05','02:09:23'),(308,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','hanz.llanto','2018-02-05','02:09:45'),(309,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','hanz.llanto','2018-02-05','02:09:47'),(310,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','hanz.llanto','2018-02-05','02:10:02'),(311,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','hanz.llanto','2018-02-05','02:10:03'),(312,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Usuario [Codigo de Usuario:rozario.lombardi]','hanz.llanto','2018-02-05','02:10:23'),(313,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','hanz.llanto','2018-02-05','02:12:58'),(314,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','hanz.llanto','2018-02-05','02:13:00'),(315,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Usuario [Codigo de Usuario:rozario.lombardi]','hanz.llanto','2018-02-05','02:13:09'),(316,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','hanz.llanto','2018-02-05','02:21:03'),(317,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','hanz.llanto','2018-02-05','02:21:06'),(318,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-05','02:27:47'),(319,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-05','02:27:48'),(320,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','hanz.llanto','2018-02-05','02:28:12'),(321,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','hanz.llanto','2018-02-05','02:28:13'),(322,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','hanz.llanto','2018-02-05','02:28:28'),(323,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','hanz.llanto','2018-02-05','02:28:28'),(324,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-05','02:31:28'),(325,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-05','02:31:29'),(326,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Alumno [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:77288852]','hanz.llanto','2018-02-05','02:32:55'),(327,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','hanz.llanto','2018-02-05','02:48:53'),(328,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','hanz.llanto','2018-02-05','02:48:58'),(329,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','hanz.llanto','2018-02-05','02:48:59'),(330,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','hanz.llanto','2018-02-05','02:49:02'),(331,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','hanz.llanto','2018-02-05','02:54:30'),(332,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','hanz.llanto','2018-02-05','02:54:31'),(333,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Usuario [Codigo de Usuario:rozario.lombardi]','hanz.llanto','2018-02-05','02:54:57'),(334,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','hanz.llanto','2018-02-05','02:55:07'),(335,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','rozario.lombardi','2018-02-05','02:55:18'),(336,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','rozario.lombardi','2018-02-05','02:55:41'),(337,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','hanz.llanto','2018-02-05','03:00:46'),(338,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','hanz.llanto','2018-02-05','03:00:56'),(339,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','hanz.llanto','2018-02-05','03:03:00'),(340,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','hanz.llanto','2018-02-05','03:03:05'),(341,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Usuario con los datos [Codigo de Usuario:rozario.lombardi]','hanz.llanto','2018-02-05','03:03:15'),(342,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','hanz.llanto','2018-02-05','03:03:19'),(343,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','rozario.lombardi','2018-02-05','03:03:25'),(344,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','rozario.lombardi','2018-02-05','03:03:49'),(345,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','hanz.llanto','2018-02-05','03:03:53'),(346,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','hanz.llanto','2018-02-05','03:07:23'),(347,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','hanz.llanto','2018-02-05','03:35:04'),(348,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','hanz.llanto','2018-02-05','03:35:23'),(349,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','hanz.llanto','2018-02-05','03:44:36'),(350,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','hanz.llanto','2018-02-05','03:44:41'),(351,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Usuario [Codigo de Usuario:rozario.lombardi]','hanz.llanto','2018-02-05','03:45:08'),(352,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','hanz.llanto','2018-02-05','03:45:19'),(353,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','hanz.llanto','2018-02-05','03:45:20'),(354,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Persona con los datos [Tipo de Documento:DNI,Número de Documento:12345678,Apellido Paterno:ROQUER]','hanz.llanto','2018-02-05','03:45:30'),(355,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Persona [Tipo de Documento:DNI,Número de Documento:12345678,Apellido Paterno:ROQUER]','hanz.llanto','2018-02-05','03:45:33'),(356,'D',1,'0:0:0:0:0:0:0:1','\0','Se intenta eliminar el(a) Persona [Tipo de Documento:DNI,Número de Documento:12345987,Apellido Paterno:LOMBARDI]','hanz.llanto','2018-02-05','03:45:44'),(357,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-05','03:46:01'),(358,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-05','03:46:04'),(359,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','hanz.llanto','2018-02-05','03:48:22'),(360,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','hanz.llanto','2018-02-05','03:48:24'),(361,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Médico [Tipo de Documento:DNI,Número de Documento:12345987]','hanz.llanto','2018-02-05','03:48:29'),(362,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','hanz.llanto','2018-02-05','03:48:41'),(363,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','hanz.llanto','2018-02-05','03:48:42'),(364,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Persona [Tipo de Documento:DNI,Número de Documento:12345987,Apellido Paterno:LOMBARDI]','hanz.llanto','2018-02-05','03:48:47'),(365,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Persona [Tipo de Documento:DNI,Número de Documento:09392294,Apellido Paterno:LLANTO]','hanz.llanto','2018-02-05','03:48:52'),(366,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Persona [Tipo de Documento:DNI,Número de Documento:07474391,Apellido Paterno:PUENTE]','hanz.llanto','2018-02-05','03:53:13'),(367,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','hanz.llanto','2018-02-05','03:53:21'),(368,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','hanz.llanto','2018-02-05','03:53:21'),(369,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Usuario [Codigo de Usuario:miguel.puenta]','hanz.llanto','2018-02-05','03:53:38'),(370,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Usuario [Codigo de Usuario:miguel.puenta]','hanz.llanto','2018-02-05','03:54:06'),(371,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Usuario [Codigo de Usuario:miguel.puente]','hanz.llanto','2018-02-05','03:54:20'),(372,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','hanz.llanto','2018-02-05','03:54:28'),(373,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-05','03:54:36'),(374,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-02-05','03:54:44'),(375,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-02-05','03:54:44'),(376,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Usuario [Codigo de Usuario:hanz.llanto]','miguel.puente','2018-02-05','03:54:48'),(377,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','miguel.puente','2018-02-05','03:54:51'),(378,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','miguel.puente','2018-02-05','03:54:51'),(379,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Persona [Tipo de Documento:DNI,Número de Documento:77288852,Apellido Paterno:LLANTO]','miguel.puente','2018-02-05','03:54:57'),(380,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','miguel.puente','2018-02-05','03:57:58'),(381,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','miguel.puente','2018-02-05','03:57:59'),(382,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','miguel.puente','2018-02-05','04:11:32'),(383,'A',2,'0:0:0:0:0:0:0:1','\0','El Usuario intenta acceder al sistema con un usuario no encontrado','hanz.llanto','2018-02-05','11:09:30'),(384,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-05','11:09:52'),(385,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-02-05','13:33:45'),(386,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-02-05','13:33:48'),(387,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','miguel.puente','2018-02-05','14:30:05'),(388,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','miguel.puente','2018-02-05','14:30:06'),(389,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','miguel.puente','2018-02-05','14:30:14'),(390,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Detalle de Tabla de Tablas [Id Detalle:I,Id Tabla:11,Descripción:INCOMPLETO]','miguel.puente','2018-02-05','14:30:23'),(391,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','miguel.puente','2018-02-05','14:41:39'),(392,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','miguel.puente','2018-02-05','14:41:43'),(393,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','miguel.puente','2018-02-05','14:49:17'),(394,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','miguel.puente','2018-02-05','14:49:20'),(395,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-06','09:44:10'),(396,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-06','11:52:15'),(397,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-06','12:33:57'),(398,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-06','12:33:58'),(399,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Campaña [Descripción:EXAMEN MEDICO REGULARE 2019,Tipo Certificado:R,Activo:true]','miguel.puente','2018-02-06','12:34:30'),(400,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-06','12:37:47'),(401,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-06','12:37:48'),(402,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Campaña con los datos [Descripción:EXAMEN MEDICO REGULARE 2019,Tipo Certificado:R,Activo:false]','miguel.puente','2018-02-06','12:37:51'),(403,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-06','13:52:20'),(404,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-02-06','13:56:45'),(405,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-02-06','13:56:46'),(406,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-06','15:33:04'),(407,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-06','17:58:01'),(408,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','miguel.puente','2018-02-06','18:14:50'),(409,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','miguel.puente','2018-02-06','18:14:52'),(410,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','miguel.puente','2018-02-06','18:14:55'),(411,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Detalle de Tabla de Tablas [Id Detalle:C,Id Tabla:4,Descripción:TBC CICATRICIAL]','miguel.puente','2018-02-06','18:15:19'),(412,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-06','19:04:28'),(413,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','miguel.puente','2018-02-06','19:04:33'),(414,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','miguel.puente','2018-02-06','19:04:33'),(415,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Tabla de Tablas [Id de Tabla:0,Descripción:TIPO DE EXAMEN]','miguel.puente','2018-02-06','19:04:59'),(416,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','miguel.puente','2018-02-06','19:05:07'),(417,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Detalle de Tabla de Tablas [Id Detalle:L,Id Tabla:16,Descripción:LABORATORIO]','miguel.puente','2018-02-06','19:05:13'),(418,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Detalle de Tabla de Tablas [Id Detalle:R,Id Tabla:16,Descripción:RADIOLOGICO]','miguel.puente','2018-02-06','19:05:18'),(419,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Detalle de Tabla de Tablas [Id Detalle:P,Id Tabla:16,Descripción:PSICOLOGICO]','miguel.puente','2018-02-06','19:05:37'),(420,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-07','11:00:51'),(421,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-07','11:04:31'),(422,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-07','11:04:33'),(423,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','miguel.puente','2018-02-07','11:05:03'),(424,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','miguel.puente','2018-02-07','11:05:06'),(425,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-07','11:12:46'),(426,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-07','11:12:48'),(427,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Campaña con los datos [Descripción:EXAMEN MEDICO REGULARE -2018,Tipo Certificado:R,Activo:false]','miguel.puente','2018-02-07','11:12:54'),(428,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Campaña con los datos [Descripción:EXAMEN MEDICO REGULARE 2019,Tipo Certificado:R,Activo:true]','miguel.puente','2018-02-07','11:12:57'),(429,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Campaña con los datos [Descripción:EXAMEN MEDICO REGULARE -2018,Tipo Certificado:R,Activo:true]','miguel.puente','2018-02-07','11:13:29'),(430,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Campaña con los datos [Descripción:EXAMEN MEDICO REGULARE 2019,Tipo Certificado:R,Activo:false]','miguel.puente','2018-02-07','11:13:33'),(431,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-07','12:52:16'),(432,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-07','17:09:46'),(433,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-07','17:35:18'),(434,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-07','17:45:06'),(435,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','miguel.puente','2018-02-07','17:45:59'),(436,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-07','17:46:06'),(437,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-08','01:16:49'),(438,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-02-08','03:04:39'),(439,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-02-08','03:04:39'),(440,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-02-08','03:04:40'),(441,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-02-08','03:04:40'),(442,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','miguel.puente','2018-02-08','03:04:50'),(443,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','miguel.puente','2018-02-08','03:04:51'),(444,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Persona [Tipo de Documento:DNI,Número de Documento:77288852,Apellido Paterno:LLANTO]','miguel.puente','2018-02-08','03:05:12'),(445,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-02-08','03:05:21'),(446,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-02-08','03:05:22'),(447,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Usuario [Codigo de Usuario:hanz.llanto]','miguel.puente','2018-02-08','03:05:44'),(448,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','miguel.puente','2018-02-08','03:05:48'),(449,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','hanz.llanto','2018-02-08','03:05:59'),(450,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','hanz.llanto','2018-02-08','03:09:28'),(451,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-08','03:09:36'),(452,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-02-08','03:10:16'),(453,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-02-08','03:10:16'),(454,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Usuario con los datos [Codigo de Usuario:hanz.llanto]','miguel.puente','2018-02-08','03:10:22'),(455,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','miguel.puente','2018-02-08','03:10:26'),(456,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','hanz.llanto','2018-02-08','03:10:29'),(457,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','hanz.llanto','2018-02-08','03:10:45'),(458,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-08','03:10:49'),(459,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-02-08','03:10:56'),(460,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-02-08','03:10:57'),(461,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Usuario con los datos [Codigo de Usuario:hanz.llanto]','miguel.puente','2018-02-08','03:11:03'),(462,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','miguel.puente','2018-02-08','03:11:07'),(463,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','hanz.llanto','2018-02-08','03:11:11'),(464,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','hanz.llanto','2018-02-08','11:03:47'),(465,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','hanz.llanto','2018-02-08','11:03:58'),(466,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-08','11:04:04'),(467,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:04:11'),(468,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','miguel.puente','2018-02-08','11:04:22'),(469,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Código de Alumno:\'\',Número de Documento:\'\']','miguel.puente','2018-02-08','11:06:28'),(470,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:06:51'),(471,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Código de Alumno:\'\',Número de Documento:\'\']','miguel.puente','2018-02-08','11:07:06'),(472,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:13:03'),(473,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:13:07'),(474,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','miguel.puente','2018-02-08','11:13:14'),(475,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Código de Alumno:\'\',Número de Documento:\'\']','miguel.puente','2018-02-08','11:14:18'),(476,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Código de Alumno:\'\',Número de Documento:\'\']','miguel.puente','2018-02-08','11:14:59'),(477,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Código de Alumno:\'\',Número de Documento:\'\']','miguel.puente','2018-02-08','11:15:10'),(478,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:17:05'),(479,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:17:08'),(480,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','miguel.puente','2018-02-08','11:17:11'),(481,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:18:49'),(482,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:18:51'),(483,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','miguel.puente','2018-02-08','11:18:54'),(484,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno ]','miguel.puente','2018-02-08','11:19:57'),(485,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno ]','miguel.puente','2018-02-08','11:23:34'),(486,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:37:42'),(487,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:37:48'),(488,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','miguel.puente','2018-02-08','11:37:52'),(489,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno ]','miguel.puente','2018-02-08','11:38:34'),(490,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:41:36'),(491,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:41:42'),(492,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','miguel.puente','2018-02-08','11:41:46'),(493,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno ]','miguel.puente','2018-02-08','11:42:37'),(494,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-08','11:45:46'),(495,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:45:59'),(496,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:46:01'),(497,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','miguel.puente','2018-02-08','11:46:04'),(498,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno ]','miguel.puente','2018-02-08','11:46:45'),(499,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:49:20'),(500,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:49:22'),(501,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','miguel.puente','2018-02-08','11:49:25'),(502,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno ]','miguel.puente','2018-02-08','11:51:57'),(503,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:52:36'),(504,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:52:37'),(505,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','miguel.puente','2018-02-08','11:52:40'),(506,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno ]','miguel.puente','2018-02-08','11:53:13'),(507,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:55:09'),(508,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:55:10'),(509,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','miguel.puente','2018-02-08','11:55:13'),(510,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno ]','miguel.puente','2018-02-08','11:56:33'),(511,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:58:44'),(512,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','11:58:45'),(513,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','miguel.puente','2018-02-08','11:58:48'),(514,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Número de Documento:DD]','miguel.puente','2018-02-08','12:00:33'),(515,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','12:01:38'),(516,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','12:01:41'),(517,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','miguel.puente','2018-02-08','12:01:43'),(518,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','12:04:34'),(519,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','12:04:38'),(520,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','miguel.puente','2018-02-08','12:04:44'),(521,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Número de Documento:FF]','miguel.puente','2018-02-08','12:05:38'),(522,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Número de Documento:FF]','miguel.puente','2018-02-08','12:06:31'),(523,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Número de Documento:FFFFFFF]','miguel.puente','2018-02-08','12:06:37'),(524,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Tipo de Documento:OTRO,Número de Documento:FFFFFFF]','miguel.puente','2018-02-08','12:07:06'),(525,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Tipo de Documento:OTRO,Número de Documento:FFFFFFF]','miguel.puente','2018-02-08','12:07:13'),(526,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Tipo de Documento:OTRO,Número de Documento:FFFFFFF]','miguel.puente','2018-02-08','12:08:01'),(527,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:OTRO,Número de Documento:FFFFFFF]','miguel.puente','2018-02-08','12:08:18'),(528,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:OTRO,Número de Documento:FFFFFFF]','miguel.puente','2018-02-08','12:08:28'),(529,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','12:13:53'),(530,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','12:13:58'),(531,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','miguel.puente','2018-02-08','12:14:04'),(532,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:122334]','miguel.puente','2018-02-08','12:15:42'),(533,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:122334]','miguel.puente','2018-02-08','12:21:16'),(534,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Alumno [Código de Alumno:13200000,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:122334]','miguel.puente','2018-02-08','12:21:28'),(535,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Alumno con los datos [Código de Alumno:13200000,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:122334]','miguel.puente','2018-02-08','12:21:51'),(536,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Alumno [Código de Alumno:13200000,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:122334]','miguel.puente','2018-02-08','12:22:03'),(537,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-08','13:23:10'),(538,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','miguel.puente','2018-02-08','13:23:19'),(539,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','miguel.puente','2018-02-08','13:23:21'),(540,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Persona [Tipo de Documento:CEXT,Número de Documento:07474391,Apellido Paterno:AAAA]','miguel.puente','2018-02-08','13:23:44'),(541,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Persona [Tipo de Documento:CEXT,Número de Documento:07474391,Apellido Paterno:AAAA]','miguel.puente','2018-02-08','13:23:51'),(542,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Persona [Tipo de Documento:DNI,Número de Documento:07474391,Apellido Paterno:AAA]','miguel.puente','2018-02-08','13:24:12'),(543,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Persona [Tipo de Documento:DNI,Número de Documento:07474392,Apellido Paterno:AAA]','miguel.puente','2018-02-08','13:24:20'),(544,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Persona [Tipo de Documento:DNI,Número de Documento:07474392,Apellido Paterno:AAA]','miguel.puente','2018-02-08','13:24:24'),(545,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-08','13:49:24'),(546,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-02-08','13:51:04'),(547,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Alumno','miguel.puente','2018-02-08','13:51:11'),(548,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Alumno con los datos [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:77288852]','miguel.puente','2018-02-08','13:52:45'),(549,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Alumno con los datos [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:77288852]','miguel.puente','2018-02-08','13:53:05'),(550,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Alumno con los datos [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:CEXT,Número de Documento:77288852]','miguel.puente','2018-02-08','13:53:27'),(551,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Alumno con los datos [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:77288852]','miguel.puente','2018-02-08','13:53:53'),(552,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:9876546]','miguel.puente','2018-02-08','13:56:20'),(553,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Alumno [Código de Alumno:13200025,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:9876546]','miguel.puente','2018-02-08','13:56:42'),(554,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Alumno [Código de Alumno:13200026,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:9876546]','miguel.puente','2018-02-08','13:56:52'),(555,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Alumno [Código de Alumno:13200026,Tipo de Alumno:R,Tipo de Documento:DNI,Número de Documento:9876546]','miguel.puente','2018-02-08','13:57:07'),(556,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-08','13:57:15'),(557,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-08','13:57:16'),(558,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Campaña [Descripción:EXAMEN MEDICO REGULARE 2019,Tipo Certificado:R,Activo:false]','miguel.puente','2018-02-08','13:57:21'),(559,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','miguel.puente','2018-02-08','14:00:55'),(560,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','miguel.puente','2018-02-08','14:00:56'),(561,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-08','16:54:06'),(562,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-09','11:13:17'),(563,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-09','11:13:35'),(564,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-09','11:13:38'),(565,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','miguel.puente','2018-02-09','11:26:36'),(566,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','miguel.puente','2018-02-09','11:26:40'),(567,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-15','21:12:32'),(568,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-15','21:13:06'),(569,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-15','21:13:09'),(570,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','miguel.puente','2018-02-15','21:15:29'),(571,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-18','19:20:04'),(572,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','miguel.puente','2018-02-18','19:26:28'),(573,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','miguel.puente','2018-02-18','19:26:30'),(574,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-02-18','19:26:43'),(575,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-02-18','19:26:44'),(576,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-18','22:55:23'),(577,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-02-18','22:55:54'),(578,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-02-18','22:55:57'),(579,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','miguel.puente','2018-02-18','23:03:22'),(580,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','miguel.puente','2018-02-18','23:03:24'),(581,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-02-18','23:03:40'),(582,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-02-18','23:03:41'),(583,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','miguel.puente','2018-02-18','23:05:19'),(584,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','miguel.puente','2018-02-18','23:05:20'),(585,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-02-18','23:07:21'),(586,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-02-18','23:07:22'),(587,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-22','21:28:39'),(588,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-22','21:29:08'),(589,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-22','21:29:12'),(590,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-22','21:31:40'),(591,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-22','21:31:41'),(592,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Campaña [Descripción:EXAMEN MEDICO REGULAR - 2019,Tipo Certificado:R,Activo:true]','miguel.puente','2018-02-22','21:33:20'),(593,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Campaña con los datos [Descripción:EXAMEN MEDICO REGULAR - 2019,Tipo Certificado:R,Activo:true]','miguel.puente','2018-02-22','21:33:51'),(594,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-22','21:37:59'),(595,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-22','21:38:00'),(596,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-24','13:10:25'),(597,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-24','18:49:37'),(598,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-24','18:50:35'),(599,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-24','18:50:37'),(600,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-24','22:03:05'),(601,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-24','22:03:29'),(602,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-24','22:13:32'),(603,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-24','22:13:35'),(604,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-24','23:24:43'),(605,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-24','23:24:45'),(606,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-24','23:24:51'),(607,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-24','23:24:53'),(608,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-24','23:48:04'),(609,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-24','23:48:06'),(610,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-24','23:48:14'),(611,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-24','23:48:15'),(612,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-25','00:19:21'),(613,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-25','11:59:32'),(614,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-25','12:23:47'),(615,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-25','12:23:57'),(616,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-25','12:24:33'),(617,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-25','12:24:35'),(618,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-25','12:31:26'),(619,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-25','12:31:27'),(620,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-25','12:32:28'),(621,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-25','12:32:34'),(622,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-25','12:32:35'),(623,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-25','12:36:46'),(624,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-25','12:37:14'),(625,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-25','12:37:16'),(626,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-25','22:36:51'),(627,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-25','22:37:12'),(628,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-25','22:37:14'),(629,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-26','22:34:06'),(630,'S',1,'0:0:0:0:0:0:0:1','\0','Se intenta consultar todos los(as) datos de Ingresos','miguel.puente','2018-02-26','22:35:01'),(631,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-26','22:44:40'),(632,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-26','22:44:56'),(633,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Ingresos','miguel.puente','2018-02-26','22:51:13'),(634,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Ingresos','miguel.puente','2018-02-26','22:52:52'),(635,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Ingresos','miguel.puente','2018-02-26','22:53:40'),(636,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Ingresos [Nombre de Alumno:WEWEWEW,Concepto:EWEWEW]','miguel.puente','2018-02-26','22:54:41'),(637,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-27','21:44:38'),(638,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Ingresos','miguel.puente','2018-02-27','21:44:59'),(639,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Ingresos [Nombre de Alumno:HUMBERTO,Concepto:125-632]','miguel.puente','2018-02-27','21:45:15'),(640,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-27','23:08:10'),(641,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-27','23:08:20'),(642,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-27','23:08:22'),(643,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Ingresos','miguel.puente','2018-02-27','23:08:27'),(644,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Ingresos','miguel.puente','2018-02-27','23:08:29'),(645,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Ingresos [Nombre de Alumno:HUMBERTO,Concepto:159-987]','miguel.puente','2018-02-27','23:08:42'),(646,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Ingresos','miguel.puente','2018-02-27','23:18:11'),(647,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Ingresos','miguel.puente','2018-02-27','23:18:12'),(648,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Ingresos [Nombre de Alumno:HUMBERTO,Concepto:SDSDSDS]','miguel.puente','2018-02-27','23:18:26'),(649,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-27','23:27:02'),(650,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-27','23:27:03'),(651,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Ingresos','miguel.puente','2018-02-27','23:27:21'),(652,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Ingresos','miguel.puente','2018-02-27','23:27:22'),(653,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Ingresos [Nombre de Alumno:HUMBERTO,Concepto:45DDSDSDS]','miguel.puente','2018-02-27','23:27:33'),(654,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Ingresos','miguel.puente','2018-02-27','23:28:20'),(655,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Ingresos','miguel.puente','2018-02-27','23:28:21'),(656,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Ingresos [Nombre de Alumno:HIDALGO,Concepto:DSDSDSDSFFFFFFF]','miguel.puente','2018-02-27','23:28:39'),(657,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Ingresos [Nombre de Alumno:YYYYYYYYYYYYYYYYY,Concepto:123-876]','miguel.puente','2018-02-27','23:28:59'),(658,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-02-28','20:02:42'),(659,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-28','20:30:47'),(660,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-28','20:30:49'),(661,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Campaña [Descripción:EXAMEN MEDICO REGULAR - 2019,Tipo Certificado:R,Activo:true]','miguel.puente','2018-02-28','20:34:56'),(662,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-28','20:55:10'),(663,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-28','20:55:12'),(664,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Campaña [Descripción:EXAMEN8,Tipo Certificado:R,Activo:false]','miguel.puente','2018-02-28','20:55:33'),(665,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Campaña con los datos [Descripción:EXAMEN8,Tipo Certificado:R,Activo:true]','miguel.puente','2018-02-28','20:58:37'),(666,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Campaña [Descripción:EXAMEN8,Tipo Certificado:R,Activo:true]','miguel.puente','2018-02-28','20:58:41'),(667,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-28','21:05:04'),(668,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-28','21:05:05'),(669,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-28','21:14:17'),(670,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-28','21:14:19'),(671,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-02-28','21:54:10'),(672,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-02-28','21:54:12'),(673,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-01','22:57:30'),(674,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-01','23:25:51'),(675,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-01','23:26:07'),(676,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-01','23:39:15'),(677,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-01','23:39:24'),(678,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-02','22:21:59'),(679,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-05','19:38:10'),(680,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','miguel.puente','2018-03-05','19:40:44'),(681,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','miguel.puente','2018-03-05','19:40:49'),(682,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-05','20:34:44'),(683,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-05','20:44:14'),(684,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-05','20:44:17'),(685,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','miguel.puente','2018-03-05','20:54:50'),(686,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','miguel.puente','2018-03-05','20:54:52'),(687,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','miguel.puente','2018-03-05','21:12:37'),(688,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-05','21:13:41'),(689,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','miguel.puente','2018-03-05','21:14:00'),(690,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-05','22:15:00'),(691,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','miguel.puente','2018-03-05','22:15:17'),(692,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-05','22:44:47'),(693,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','miguel.puente','2018-03-05','22:45:06'),(694,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-05','22:59:36'),(695,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-07','00:28:48'),(696,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','miguel.puente','2018-03-07','00:29:31'),(697,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-07','19:49:44'),(698,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-08','21:23:42'),(699,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-08','22:12:04'),(700,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-08','22:33:14'),(701,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-08','22:39:50'),(702,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-08','22:39:51'),(703,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-08','22:44:51'),(704,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-08','22:44:52'),(705,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-09','23:16:29'),(706,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','miguel.puente','2018-03-09','23:23:04'),(707,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','miguel.puente','2018-03-09','23:23:06'),(708,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','miguel.puente','2018-03-09','23:28:58'),(709,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','miguel.puente','2018-03-09','23:28:59'),(710,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Tabla de Tablas [Id de Tabla:3,Descripción:SEXO]','miguel.puente','2018-03-09','23:29:08'),(711,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Tabla de Tablas [Id de Tabla:6,Descripción:INDICADOR DE RPR]','miguel.puente','2018-03-09','23:29:16'),(712,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Tabla de Tablas [Id de Tabla:2,Descripción:DISCAPACIDAD]','miguel.puente','2018-03-09','23:29:48'),(713,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Tabla de Tablas [Id de Tabla:4,Descripción:RESULTADO RADIOLOGICO]','miguel.puente','2018-03-09','23:29:52'),(714,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Tabla de Tablas [Id de Tabla:5,Descripción:RESULTADO PSICOLOGICO]','miguel.puente','2018-03-09','23:29:57'),(715,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Tabla de Tablas [Id de Tabla:7,Descripción:INDICADOR DE HEMOGRAMA]','miguel.puente','2018-03-09','23:30:01'),(716,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Tabla de Tablas [Id de Tabla:8,Descripción:CERTIFICADO MEDICO]','miguel.puente','2018-03-09','23:30:05'),(717,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','miguel.puente','2018-03-09','23:30:10'),(718,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Tabla de Tablas [Id de Tabla:10,Descripción:TIPO ALUMNO]','miguel.puente','2018-03-09','23:30:17'),(719,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','miguel.puente','2018-03-09','23:30:19'),(720,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Tabla de Tablas [Id de Tabla:15,Descripción:DILUCION]','miguel.puente','2018-03-09','23:30:26'),(721,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','miguel.puente','2018-03-09','23:30:30'),(722,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Tabla de Tablas [Id de Tabla:11,Descripción:ESTADO DE EXAMEN MEDICO]','miguel.puente','2018-03-09','23:30:36'),(723,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','miguel.puente','2018-03-09','23:30:51'),(724,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','miguel.puente','2018-03-09','23:32:21'),(725,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Tabla de Tablas [Id de Tabla:0,Descripción:TIPO DE MONEDA]','miguel.puente','2018-03-09','23:32:39'),(726,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','miguel.puente','2018-03-09','23:32:41'),(727,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Detalle de Tabla de Tablas [Id Detalle:S,Id Tabla:17,Descripción:SOLES]','miguel.puente','2018-03-09','23:33:03'),(728,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Detalle de Tabla de Tablas [Id Detalle:D,Id Tabla:17,Descripción:DOLARES]','miguel.puente','2018-03-09','23:33:15'),(729,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','miguel.puente','2018-03-09','23:33:32'),(730,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','miguel.puente','2018-03-09','23:35:33'),(731,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','miguel.puente','2018-03-09','23:35:34'),(732,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','miguel.puente','2018-03-09','23:35:37'),(733,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-09','23:51:40'),(734,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','miguel.puente','2018-03-10','00:30:47'),(735,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','miguel.puente','2018-03-10','00:30:50'),(736,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar los(as) datos de Detalle de Tabla de Tablas','miguel.puente','2018-03-10','00:30:52'),(737,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Detalle de Tabla de Tablas [Id Detalle:OTRO,Id Tabla:1,Descripción:OTROS]','miguel.puente','2018-03-10','00:31:01'),(738,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Detalle de Tabla de Tablas [Id Detalle:PAS,Id Tabla:1,Descripción:PASAPORTE]','miguel.puente','2018-03-10','00:31:09'),(739,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Detalle de Tabla de Tablas [Id Detalle:RUC,Id Tabla:1,Descripción:REGISTRO ÚNICO DE CONTRIBUYENTES]','miguel.puente','2018-03-10','00:32:05'),(740,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-11','17:59:21'),(741,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-11','18:10:25'),(742,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-11','18:10:27'),(743,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-11','18:10:38'),(744,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-11','18:10:39'),(745,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-11','18:13:55'),(746,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-11','18:13:56'),(747,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-11','19:52:13'),(748,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-11','19:52:13'),(749,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-11','19:52:29'),(750,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-11','19:52:42'),(751,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-11','19:53:04'),(752,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-11','19:53:05'),(753,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-11','22:53:50'),(754,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-12','10:44:35'),(755,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-12','11:13:35'),(756,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-12','11:13:37'),(757,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','miguel.puente','2018-03-12','11:13:42'),(758,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','miguel.puente','2018-03-12','11:13:44'),(759,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Médico','miguel.puente','2018-03-12','11:34:06'),(760,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Médico','miguel.puente','2018-03-12','11:34:08'),(761,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','miguel.puente','2018-03-12','11:34:12'),(762,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','miguel.puente','2018-03-12','11:34:13'),(763,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-12','12:35:36'),(764,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-12','12:35:44'),(765,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','miguel.puente','2018-03-12','13:03:22'),(766,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','miguel.puente','2018-03-12','13:03:24'),(767,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','miguel.puente','2018-03-12','13:03:33'),(768,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','miguel.puente','2018-03-12','13:03:36'),(769,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-03-12','13:03:51'),(770,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-03-12','13:03:53'),(771,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-12','16:53:23'),(772,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-13','10:15:34'),(773,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-13','10:27:05'),(774,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-13','10:29:52'),(775,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-13','10:29:54'),(776,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-13','12:37:21'),(777,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-13','14:39:35'),(778,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-13','17:04:59'),(779,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-13','17:05:03'),(780,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','miguel.puente','2018-03-13','17:05:30'),(781,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','miguel.puente','2018-03-13','17:05:32'),(782,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-03-13','17:05:42'),(783,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-03-13','17:05:44'),(784,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','miguel.puente','2018-03-13','17:12:07'),(785,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','miguel.puente','2018-03-13','17:12:10'),(786,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-03-13','17:12:25'),(787,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-03-13','17:12:27'),(788,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-14','10:07:02'),(789,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-03-14','11:22:03'),(790,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-03-14','11:22:17'),(791,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-14','15:09:24'),(792,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-15','10:05:12'),(793,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-15','14:25:36'),(794,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-15','16:59:04'),(795,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-15','17:29:35'),(796,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-15','17:29:35'),(797,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-16','09:06:45'),(798,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-16','10:29:23'),(799,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-16','11:25:05'),(800,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-16','12:24:17'),(801,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-16','18:56:32'),(802,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-16','23:52:23'),(803,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-17','14:14:00'),(804,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-17','14:14:13'),(805,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-17','20:32:03'),(806,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-03-17','20:32:18'),(807,'S',1,'0:0:0:0:0:0:0:1','\0','Se intenta consultar todos los(as) datos de Alumno','miguel.puente','2018-03-17','20:32:21'),(808,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','miguel.puente','2018-03-17','21:57:20'),(809,'S',1,'0:0:0:0:0:0:0:1','\0','Se intenta consultar todos los(as) datos de Alumno','miguel.puente','2018-03-17','21:57:22'),(810,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-17','22:04:10'),(811,'S',1,'0:0:0:0:0:0:0:1','\0','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-17','22:04:11'),(812,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-17','22:05:59'),(813,'S',1,'0:0:0:0:0:0:0:1','\0','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-17','22:06:00'),(814,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-17','22:08:21'),(815,'S',1,'0:0:0:0:0:0:0:1','\0','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-17','22:08:23'),(816,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-17','22:09:45'),(817,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-17','22:09:47'),(818,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-17','22:16:49'),(819,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-17','22:16:50'),(820,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-17','22:19:06'),(821,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-17','22:19:12'),(822,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-17','22:20:10'),(823,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-17','22:20:13'),(824,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Campaña [Descripción:EXAMEN,Activo:true]','miguel.puente','2018-03-17','22:20:40'),(825,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Campaña','miguel.puente','2018-03-17','22:20:51'),(826,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Campaña','miguel.puente','2018-03-17','22:20:52'),(827,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-18','17:17:50'),(828,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-18','22:08:54'),(829,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-19','10:09:50'),(830,'V',1,'0:0:0:0:0:0:0:1','\0','Se intenta visitar la página de Usuario','miguel.puente','2018-03-19','10:30:59'),(831,'V',1,'0:0:0:0:0:0:0:1','\0','Se intenta visitar la página de Usuario','miguel.puente','2018-03-19','10:34:34'),(832,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-03-19','10:36:33'),(833,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-03-19','10:36:36'),(834,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','miguel.puente','2018-03-19','10:39:09'),(835,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','miguel.puente','2018-03-19','10:39:11'),(836,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-03-19','10:40:43'),(837,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-03-19','10:40:44'),(838,'V',1,'0:0:0:0:0:0:0:1','\0','Se intenta visitar la página de Usuario','miguel.puente','2018-03-19','11:03:00'),(839,'V',1,'0:0:0:0:0:0:0:1','\0','Se intenta visitar la página de Usuario','miguel.puente','2018-03-19','11:04:19'),(840,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-19','11:11:47'),(841,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-03-19','11:11:58'),(842,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-03-19','11:12:02'),(843,'D',1,'0:0:0:0:0:0:0:1','','Se intenta eliminar el(a) Usuario [Codigo de Usuario:hanz.llanto]','miguel.puente','2018-03-19','11:12:14'),(844,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-03-19','11:12:17'),(845,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-03-19','11:12:19'),(846,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','miguel.puente','2018-03-19','11:12:28'),(847,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','miguel.puente','2018-03-19','11:12:29'),(848,'D',1,'0:0:0:0:0:0:0:1','\0','Se intenta eliminar el(a) Persona [Tipo de Documento:DNI,Número de Documento:77288852,Apellido Paterno:LLANTO]','miguel.puente','2018-03-19','11:12:49'),(849,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Persona','miguel.puente','2018-03-19','11:20:31'),(850,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Persona','miguel.puente','2018-03-19','11:20:36'),(851,'D',1,'0:0:0:0:0:0:0:1','\0','Se intenta eliminar el(a) Persona [Tipo de Documento:DNI,Número de Documento:77288852,Apellido Paterno:LLANTO]','miguel.puente','2018-03-19','11:21:00'),(852,'U',1,'0:0:0:0:0:0:0:1','\0','Se intenta actualizar el(a) Persona con los datos [Tipo de Documento:DNI,Número de Documento:77288852,Apellido Paterno:HIDALGO]','miguel.puente','2018-03-19','11:25:12'),(853,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Persona [Tipo de Documento:DNI,Número de Documento:46341151,Apellido Paterno:HIDALGO]','miguel.puente','2018-03-19','11:26:32'),(854,'I',1,'0:0:0:0:0:0:0:1','\0','Se intenta registrar el(a) Persona [Tipo de Documento:DNI,Número de Documento:46341151,Apellido Paterno:HIDALGO]','miguel.puente','2018-03-19','11:30:28'),(855,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Persona [Tipo de Documento:DNI,Número de Documento:46341151,Apellido Paterno:HIDALGO]','miguel.puente','2018-03-19','11:34:52'),(856,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','miguel.puente','2018-03-19','11:35:19'),(857,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','miguel.puente','2018-03-19','11:35:24'),(858,'I',1,'0:0:0:0:0:0:0:1','','Se intenta registrar el(a) Usuario [Codigo de Usuario:HuHidalgo]','miguel.puente','2018-03-19','11:36:08'),(859,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Usuario con los datos [Codigo de Usuario:miguel.puente]','miguel.puente','2018-03-19','11:39:46'),(860,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','miguel.puente','2018-03-19','11:39:56'),(861,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-19','11:40:13'),(862,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','HuHidalgo','2018-03-19','11:41:29'),(863,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','HuHidalgo','2018-03-19','11:41:31'),(864,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','HuHidalgo','2018-03-19','11:41:42'),(865,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-19','11:41:59'),(866,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','miguel.puente','2018-03-19','11:42:18'),(867,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-19','11:42:26'),(868,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','HuHidalgo','2018-03-19','11:42:34'),(869,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','HuHidalgo','2018-03-19','11:42:36'),(870,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Usuario con los datos [Codigo de Usuario:miguel.puente]','HuHidalgo','2018-03-19','11:42:43'),(871,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','HuHidalgo','2018-03-19','11:42:48'),(872,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','HuHidalgo','2018-03-19','11:42:49'),(873,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-19','13:59:21'),(874,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-19','14:41:00'),(875,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-19','14:59:36'),(876,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-19','15:48:12'),(877,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-19','20:00:04'),(878,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','HuHidalgo','2018-03-19','20:00:14'),(879,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','HuHidalgo','2018-03-19','20:00:17'),(880,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-19','21:37:58'),(881,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-20','10:39:07'),(882,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Tabla de Tablas','HuHidalgo','2018-03-20','10:42:59'),(883,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Tabla de Tablas','HuHidalgo','2018-03-20','10:43:01'),(884,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-20','11:13:43'),(885,'A',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','HuHidalgo','2018-03-20','11:17:06'),(886,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-20','11:22:39'),(887,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-20','14:51:41'),(888,'V',1,'0:0:0:0:0:0:0:1','\0','Se intenta visitar la página de Usuario','HuHidalgo','2018-03-20','14:52:27'),(889,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-20','15:34:15'),(890,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-20','23:04:05'),(891,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-21','09:48:58'),(892,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-21','11:15:03'),(893,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','HuHidalgo','2018-03-21','11:59:58'),(894,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','HuHidalgo','2018-03-21','12:00:02'),(895,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','HuHidalgo','2018-03-21','12:04:31'),(896,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','HuHidalgo','2018-03-21','12:04:32'),(897,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','HuHidalgo','2018-03-21','12:05:41'),(898,'S',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','HuHidalgo','2018-03-21','12:05:43'),(899,'U',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Usuario con los datos [Codigo de Usuario:HuHidalgo]','HuHidalgo','2018-03-21','12:07:02'),(900,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-21','15:51:30'),(901,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-21','22:23:23'),(902,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-22','10:08:19'),(903,'V',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Alumno','HuHidalgo','2018-03-22','12:24:00'),(904,'S',1,'0:0:0:0:0:0:0:1','\0','Se intenta consultar todos los(as) datos de Alumno','HuHidalgo','2018-03-22','12:24:15'),(905,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-23','10:10:06'),(906,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-23','14:21:05'),(907,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-24','20:02:20'),(908,'A',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-24','23:51:33'),(909,'Acc',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-25','18:47:42'),(910,'Acc',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-25','20:44:56'),(911,'Vis',1,'0:0:0:0:0:0:0:1','','Se intenta visitar la página de Usuario','HuHidalgo','2018-03-25','21:16:05'),(912,'Con',1,'0:0:0:0:0:0:0:1','','Se intenta consultar todos los(as) datos de Usuario','HuHidalgo','2018-03-25','21:16:09'),(913,'Act',1,'0:0:0:0:0:0:0:1','','Se intenta actualizar el(a) Usuario con los datos [Codigo de Usuario:miguel.puente]','HuHidalgo','2018-03-25','21:16:21'),(914,'Acc',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','HuHidalgo','2018-03-25','21:16:28'),(915,'Acc',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-25','21:16:36'),(916,'Acc',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','miguel.puente','2018-03-25','21:16:45'),(917,'Acc',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','miguel.puente','2018-03-25','21:16:51'),(918,'Acc',3,'0:0:0:0:0:0:0:1','','El usuario ha salido del sistema','miguel.puente','2018-03-25','21:16:57'),(919,'Acc',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-25','21:17:04'),(920,'Acc',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-26','10:16:22'),(921,'Acc',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-26','10:48:25'),(922,'Acc',2,'0:0:0:0:0:0:0:1','','El Usuario ha accedido al sistema exitosamente','HuHidalgo','2018-03-26','11:30:17');
/*!40000 ALTER TABLE `seg_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_perfil`
--

DROP TABLE IF EXISTS `seg_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_perfil` (
  `nIdPerfil` tinyint(4) NOT NULL AUTO_INCREMENT,
  `vDescripcion` varchar(50) DEFAULT NULL,
  `vNombre` varchar(40) DEFAULT NULL,
  `vUsuarioModificacion` varchar(20) DEFAULT NULL,
  `dFechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`nIdPerfil`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_perfil`
--

LOCK TABLES `seg_perfil` WRITE;
/*!40000 ALTER TABLE `seg_perfil` DISABLE KEYS */;
INSERT INTO `seg_perfil` VALUES (1,'ADMINISTRADOR','ADMINISTRADOR','HuHidalgo','2018-03-21 12:03:39'),(2,'ECONOMIA','ECONOMIA','HuHidalgo','2018-03-21 12:03:55'),(3,'PLANIFICACIÓN','PLANIFICACIÓN','HuHidalgo','2018-03-21 12:04:12'),(4,'USGOM','USGOM','HuHidalgo','2018-03-21 12:04:25'),(5,'DIRECCIÓN','DIRECCIÓN','HuHidalgo','2018-03-21 12:07:35');
/*!40000 ALTER TABLE `seg_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_tipoauditoria`
--

DROP TABLE IF EXISTS `seg_tipoauditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_tipoauditoria` (
  `nIdTipoAuditoria` smallint(6) NOT NULL AUTO_INCREMENT,
  `vDescripcion` varchar(50) DEFAULT NULL,
  `vCodigoAuditoria` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`nIdTipoAuditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_tipoauditoria`
--

LOCK TABLES `seg_tipoauditoria` WRITE;
/*!40000 ALTER TABLE `seg_tipoauditoria` DISABLE KEYS */;
INSERT INTO `seg_tipoauditoria` VALUES (1,'NO ENCONTRADO','N'),(2,'ACCESO AL SISTEMA','LOGIN'),(3,'SALIDA AL SISTEMA','LOGOUT');
/*!40000 ALTER TABLE `seg_tipoauditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_usuario`
--

DROP TABLE IF EXISTS `seg_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_usuario` (
  `vIdUsuario` varchar(20) NOT NULL,
  `vTipoDocumento` varchar(5) NOT NULL,
  `vNumeroDocumento` varchar(12) NOT NULL,
  `vContrasenia` varchar(70) DEFAULT NULL,
  `bActivo` bit(1) DEFAULT NULL,
  `nIdPerfil` tinyint(4) DEFAULT NULL,
  `vUsuarioAdicion` varchar(20) DEFAULT NULL,
  `dFechaAdicion` datetime DEFAULT NULL,
  `vUsuarioModificacion` varchar(20) DEFAULT NULL,
  `dFechaModificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`vIdUsuario`),
  KEY `fk_SecUsuario_MaePersona1_idx` (`vTipoDocumento`,`vNumeroDocumento`),
  KEY `fk_PERFIL_idx` (`nIdPerfil`),
  CONSTRAINT `fk_PERFIL` FOREIGN KEY (`nIdPerfil`) REFERENCES `seg_perfil` (`nIdPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SecUsuario_MaePersona1` FOREIGN KEY (`vTipoDocumento`, `vNumeroDocumento`) REFERENCES `man_persona` (`vTipoDocumento`, `vNumeroDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_usuario`
--

LOCK TABLES `seg_usuario` WRITE;
/*!40000 ALTER TABLE `seg_usuario` DISABLE KEYS */;
INSERT INTO `seg_usuario` VALUES ('HuHidalgo','DNI','46341151','$2a$10$NqCzRIFCZ.tcLsREYPk04Os2lBBbC8CGPR10niW8uv5m8mJNkUdrG','',1,'miguel.puente','2018-03-19 11:36:08','HuHidalgo','2018-03-21 12:07:02'),('miguel.puente','DNI','07474391','$2a$10$rgB/gQNBIPls5TH1/CDlhuq2XyYrgM4QY30E.61PwuznKK4k9zuLa','',2,'hanz.llanto','2018-02-05 03:54:20','HuHidalgo','2018-03-25 21:16:20');
/*!40000 ALTER TABLE `seg_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sircie'
--
/*!50003 DROP PROCEDURE IF EXISTS `MANT_AUDITORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANT_AUDITORIA`(
	 IN pVERBO				VARCHAR(10)
    ,IN pACCION 			VARCHAR(3)
    ,IN pCODIGO_AUDITORIA 	VARCHAR(30)
    ,IN pDIRECCION_IP 		VARCHAR(15)
    ,IN pEXITO 				BIT
    ,IN pCOMENTARIO 		VARCHAR(400)
    ,IN pUSUARIO 			VARCHAR(20)
    ,IN pFECHA 				DATE
    ,IN pHORA 				VARCHAR(8)
)
BEGIN

	IF pVERBO = 'INSERT' THEN    
        SELECT 	@ID_AUDIT := tipoAuditoria.nIdTipoAuditoria
		FROM	seg_tipoauditoria tipoAuditoria 
		WHERE 	vCodigoAuditoria = pCODIGO_AUDITORIA;
        
		INSERT INTO seg_auditoria
        (
          vAccion
         ,nIdTipoAuditoria
         ,vDireccionIp
         ,bExito
         ,vComentario
         ,vUsuario
         ,dFecha
         ,vHora
        ) VALUES
        (
		  pACCION
         ,IFNULL(@ID_AUDIT, 1)
         ,pDIRECCION_IP
         ,pEXITO
         ,pCOMENTARIO
         ,pUSUARIO
         ,pFECHA
         ,pHORA
        );
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANT_CONCEPTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANT_CONCEPTOS`(
	IN pVERBO 				VARCHAR(10)
    ,IN ID_CONCEPTO			INTEGER
    ,IN ID_UNIDAD			VARCHAR(10)
    ,IN NRO_CONCEPTO_ESP	VARCHAR(3)
    ,IN NOM_CONCEPTO_ESP	VARCHAR(100)
    ,IN DESC_CONCEPTO_ESP	VARCHAR(255)
    ,IN nImporte_CONCEPTO    DECIMAL(6,2)
	,IN pUSUARIO			VARCHAR(20)
)
BEGIN
	DECLARE nom_unidad VARCHAR(100);
    DECLARE nro_concepto_uni VARCHAR(3);

	IF pVERBO = 'GET_UNI' THEN
		SELECT	nIdConcepto			AS idConcepto, 
				vNroConceptoEsp		AS nroConceptoEsp, 
                vNomConceptoEsp		AS nomConceptoEsp, 
                nImporte			AS importe
		FROM 	man_unidad_concepto
        WHERE 	vCodigoUnidad = ID_UNIDAD;
	END IF;
    
	IF pVERBO = 'GETS' THEN
		SELECT	vCodigoUnidad		AS codigoUnidad, 
				nIdConcepto			AS idConcepto,
                vNombreUnidad		AS nombreUnidad, 
                vNroConceptoUnidad	AS nroConceptoUnidad, 
				vNroConceptoEsp		AS nroConceptoEsp, 
                vNomConceptoEsp		AS nomConceptoEsp, 
                vDescConceptoEsp	AS descConceptoEsp, 
                nImporte			AS importe
		FROM man_unidad_concepto;
	END IF;
    
    IF pVERBO = 'GET' THEN
		SELECT	vCodigoUnidad		AS codigoUnidad, 
				nIdConcepto			AS idConcepto,
                vNombreUnidad		AS nombreUnidad, 
                vNroConceptoUnidad	AS nroConceptoUnidad, 
				vNroConceptoEsp		AS nroConceptoEsp, 
                vNomConceptoEsp		AS nomConceptoEsp, 
                vDescConceptoEsp	AS descConceptoEsp, 
                nImporte			AS importe
		FROM	man_unidad_concepto
		WHERE 	vCodigoUnidad = ID_UNIDAD AND 
				nIdConcepto = ID_CONCEPTO;
    END IF;
      
    IF pVERBO = 'INSERT' THEN
		
		SELECT vNombreUnidad, vNroConcepto 
        INTO nom_unidad, nro_concepto_uni
        FROM man_unidad
        WHERE vCodigoUnidad = ID_UNIDAD;
        
		INSERT INTO man_concepto (vNroConceptoEsp, vNomConceptoEsp, vDescConceptoEsp, nImporte, vUsuarioAdicion, dFechaAdicion)
				VALUES (NRO_CONCEPTO_ESP, NOM_CONCEPTO_ESP, DESC_CONCEPTO_ESP, nImporte_CONCEPTO, pUSUARIO, NOW());        
                
		INSERT INTO man_unidad_concepto (vCodigoUnidad, nIdConcepto, vNombreUnidad, vNroConceptoUnidad, vNroConceptoEsp, 
										vNomConceptoEsp, vDescConceptoEsp, nImporte)
				VALUES (ID_UNIDAD, (select max(nIdConcepto) as nIdConcepto from man_concepto), 
						nom_unidad, nro_concepto_uni, NRO_CONCEPTO_ESP, NOM_CONCEPTO_ESP, 
						DESC_CONCEPTO_ESP, nImporte_CONCEPTO); 
		select max(nIdConcepto) as nIdConcepto from man_concepto;
	END IF;
    
    IF pVERBO = 'UPDATE' THEN
		UPDATE man_concepto
		SET		vNroConceptoEsp		= NRO_CONCEPTO_ESP
                ,vNomConceptoEsp	= NOM_CONCEPTO_ESP
                ,vDescConceptoEsp	= DESC_CONCEPTO_ESP
                ,nImporte			= nImporte_CONCEPTO
                ,vUsuarioModificacion=pUSUARIO
                ,dFechaModificacion	= NOW()
		WHERE 	nIdConcepto 			= ID_CONCEPTO;
        
        UPDATE man_unidad_concepto
		SET		vNroConceptoEsp		= NRO_CONCEPTO_ESP
                ,vNomConceptoEsp	= NOM_CONCEPTO_ESP
                ,vDescConceptoEsp	= DESC_CONCEPTO_ESP
                ,nImporte			= nImporte_CONCEPTO
		WHERE 	nIdConcepto 			= ID_CONCEPTO;

	END IF;
    
    IF pVERBO = 'REMOVE' THEN
		DELETE 
        FROM 	man_concepto
		WHERE 	nIdConcepto = ID_CONCEPTO;
        
        DELETE 
        FROM 	man_unidad_concepto
        WHERE	nIdConcepto = ID_CONCEPTO;
	
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANT_CURSOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANT_CURSOS`(
	IN pVerbo 				VARCHAR(10),
    IN pIdCurso 			VARCHAR(10),
    IN ID_UNIDAD 			VARCHAR(10),
	IN pConcepto_nIdConcepto INTEGER,
	IN pNomCurso 			VARCHAR(255),
	IN pNroSemestres 		INTEGER,
    IN pUSUARIO				VARCHAR(20)
)
BEGIN
	DECLARE valor Double;
	
	IF pVerbo = 'GET_CUR' THEN
		
        SELECT distinct(concepto.nImporte)
        INTO valor
        FROM man_curso curso
				INNER JOIN man_concepto concepto ON curso.nIdConcepto = concepto.nIdConcepto
			WHERE curso.nIdConcepto = pConcepto_nIdConcepto;
            
        IF valor IS NULL THEN
			SELECT nImporte
            FROM man_concepto
            WHERE nIdConcepto = pConcepto_nIdConcepto;
        ELSE
			SELECT 	curso.vCodigoCurso 	as codigoCurso, 
					curso.vNombreCurso 	as nombreCurso,
					concepto.nImporte	as importe
			FROM man_curso curso
				INNER JOIN man_concepto concepto ON curso.nIdConcepto = concepto.nIdConcepto
			WHERE curso.nIdConcepto = pConcepto_nIdConcepto;
        END IF;
        
    END IF;

	IF pVerbo = 'GETS' THEN
		SELECT curso.vCodigoCurso 					as codigoCurso,
			   curso.vNombreCurso 					as nombreCurso,
               curso.nNroSemestres 					as nroSemestres,
			   unidad_concepto.vNroConceptoEsp 		as nroConceptoEsp,
               unidad_concepto.vNomConceptoEsp 		as nomConceptoEsp,
               unidad_concepto.nIdConcepto 			as idConcepto,
               unidad_concepto.vCodigoUnidad		as codigoUnidad,
               unidad_concepto.vNombreUnidad		as nombreUnidad,
               unidad_concepto.vNroConceptoUnidad	as nroConceptoUnidad
        FROM man_curso curso
			INNER JOIN man_unidad_concepto unidad_concepto on unidad_concepto.nIdConcepto = curso.nIdConcepto
														AND unidad_concepto.vCodigoUnidad = curso.vCodigoUnidad;     
    END IF;
    
    IF pVerbo = 'GET' THEN
		SELECT curso.vCodigoCurso 					as codigoCurso,
			   curso.vNombreCurso 					as nombreCurso,
               curso.nNroSemestres 					as nroSemestres,
			   unidad_concepto.vNroConceptoEsp 		as nroConceptoEsp,
               unidad_concepto.vNomConceptoEsp 		as nomConceptoEsp,
               unidad_concepto.nIdConcepto 			as idConcepto,
               unidad_concepto.vCodigoUnidad		as codigoUnidad,
               unidad_concepto.vNombreUnidad		as nombreUnidad,
               unidad_concepto.vNroConceptoUnidad	as nroConceptoUnidad
        FROM man_curso curso
			INNER JOIN man_unidad_concepto unidad_concepto on unidad_concepto.nIdConcepto = curso.nIdConcepto
														AND unidad_concepto.vCodigoUnidad = curso.vCodigoUnidad
		WHERE curso.nIdConcepto = pConcepto_nIdConcepto AND
				curso.vCodigoCurso = pIdCurso AND
                curso.vCodigoUnidad = ID_UNIDAD;   
    END IF;
           
    IF pVerbo = 'INSERT' THEN
		INSERT INTO man_curso(vCodigoCurso, vCodigoUnidad, nIdConcepto, vNombreCurso, nNroSemestres, vUsuarioAdicion, dFechaAdicion) 
					values (pIdCurso, ID_UNIDAD, pConcepto_nIdConcepto, pNomCurso, pNroSemestres, pUSUARIO, NOW());	
    END IF;
    
	IF pVerbo = 'UPDATE' THEN
		UPDATE man_curso 
        SET  vNombreCurso = pNomCurso, 
			 vCodigoUnidad = ID_UNIDAD,
			 nNroSemestres = pNroSemestres, 
			 nIdConcepto = pConcepto_nIdConcepto, 
			 vUsuarioModificacion = pUSUARIO,
			 dFechaModificacion	= NOW() 
			WHERE vCodigoCurso = pIdCurso;
    END IF;
    
    IF pVerbo = 'REMOVE' THEN
		DELETE 
        FROM man_curso 
        WHERE vCodigoCurso = pIdCurso;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANT_INGRESOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANT_INGRESOS`(
	IN pVERBO 			VARCHAR(15),
	IN ID_INGRESO		INT,
    IN COD_UNIDAD		VARCHAR(10),
    IN NRO_DOC_CLIENTE	VARCHAR(45),
    IN NOM_CLIENTE		VARCHAR(45),
    IN APE_CLIENTE		VARCHAR(45),
    IN TIPO_DOC_CLIENTE	VARCHAR(4),
    IN ID_CONCEPTO		INT,
    IN IMP_CONCEPTO		DECIMAL(6,2),
    IN IMP_DESCONTADO	DECIMAL(6,2),
    IN DESC_nDescuento	VARCHAR(255),
    IN ID_CURSO			VARCHAR(10),
    IN NRO_CUOTA		INT,
    IN TIPO_MONEDA		VARCHAR(10),
    IN TIPO_CAMBIO		DECIMAL(3,2),
    IN NRO_VOUCHER		VARCHAR(15),
    IN NRO_FACTURA		VARCHAR(15),
    IN FECHA_VF			DATE,
    IN NRO_RECIBO_ING	VARCHAR(15),
    IN FECHA_RI			DATE,
    IN pUSUARIO 		VARCHAR(20)
)
BEGIN
	DECLARE dnDescuento DOUBLE;
    DECLARE IMP_TOTAL DOUBLE;

	IF pVERBO = 'GETS' THEN
		SELECT 	ingresos.nIdIngreso 				as idIngreso, 
				ingresos.nDescuento		 			as descuento, 
				ingresos.vDescDescuento 			as descDescuento, 
                ingresos.nImporteTotal 				as importeTotal, 
                ingresos.nImporteDescontado			as importeDescontado,
                ingresos.dFechaVF 					as fechaVF,
                ingresos.dFechaRI					as fechaRI,
                ingresos.vTipoMoneda				as tipoMoneda,
                ingresos.vTipoCambio				as tipoCambio,
                ingresos.vNroVoucher				as nroVoucher,
                ingresos.vNroFactura				as nroFactura,
                ingresos.vNroReciboIngreso			as nroReciboIngreso,
                unidad_concepto.vCodigoUnidad 		as codigoUnidad,
                unidad_concepto.nIdConcepto 		as idConcepto,
                unidad_concepto.vNombreUnidad 		as nombreUnidad,
                unidad_concepto.vNroConceptoUnidad 	as nroConceptoUnidad,
                unidad_concepto.vNroConceptoEsp 	as nroConceptoEsp,
                unidad_concepto.vNomConceptoEsp 	as nomConceptoEsp,
                unidad_concepto.nImporte			as importe,
                curso.vCodigoCurso					as codigoCurso,
                curso.vNombreCurso					as nombreCurso,
                cliente.vNroDocCliente				as nroDocCliente,
                cliente.vNombresCliente				as nombresCliente,
                cliente.vApellidosCliente			as apellidosCliente,
                cliente.vTipoDocCliente				as tipoDocCliente
		FROM reg_ingreso ingresos
			INNER JOIN man_cliente cliente ON cliente.vNroDocCliente = ingresos.vNroDocCliente
			INNER JOIN man_unidad_concepto unidad_concepto ON ingresos.vCodigoUnidad = unidad_concepto.vCodigoUnidad 
												AND ingresos.nIdConcepto = unidad_concepto.nIdConcepto
			INNER JOIN man_curso curso ON curso.vCodigoCurso = ingresos.vCodigoCurso
            
		UNION
            
		SELECT 	ingresos.nIdIngreso 				as idIngreso, 
				ingresos.nDescuento		 			as descuento, 
				ingresos.vDescDescuento 			as descDescuento, 
                ingresos.nImporteTotal 				as importeTotal, 
                ingresos.nImporteDescontado			as importeDescontado,
                ingresos.dFechaVF 					as fechaVF,
                ingresos.dFechaRI					as fechaRI,
                ingresos.vTipoMoneda				as tipoMoneda,
                ingresos.vTipoCambio				as tipoCambio,
                ingresos.vNroVoucher				as nroVoucher,
                ingresos.vNroFactura				as nroFactura,
                ingresos.vNroReciboIngreso			as nroReciboIngreso,
                unidad_concepto.vCodigoUnidad 		as codigoUnidad,
                unidad_concepto.nIdConcepto 		as idConcepto,
                unidad_concepto.vNombreUnidad 		as nombreUnidad,
                unidad_concepto.vNroConceptoUnidad 	as nroConceptoUnidad,
                unidad_concepto.vNroConceptoEsp 	as nroConceptoEsp,
                unidad_concepto.vNomConceptoEsp 	as nomConceptoEsp,
                unidad_concepto.nImporte			as importe,
                NULL,
                NULL,
                cliente.vNroDocCliente				as nroDocCliente,
                cliente.vNombresCliente				as nombresCliente,
                cliente.vApellidosCliente			as apellidosCliente,
                cliente.vTipoDocCliente				as tipoDocCliente
		FROM reg_ingreso ingresos
			INNER JOIN man_cliente cliente ON cliente.vNroDocCliente = ingresos.vNroDocCliente
			INNER JOIN man_unidad_concepto unidad_concepto ON ingresos.vCodigoUnidad = unidad_concepto.vCodigoUnidad 
												AND ingresos.nIdConcepto = unidad_concepto.nIdConcepto
		WHERE ingresos.vCodigoCurso is null;
    END IF;
    
    IF pVERBO = 'GET' THEN
		IF (SELECT vCodigoCurso FROM reg_ingreso WHERE nIdIngreso = ID_INGRESO) IS NOT NULL THEN
        
			SELECT 	ingresos.nIdIngreso 				as idIngreso, 
				ingresos.nDescuento		 			as descuento, 
				ingresos.vDescDescuento 			as descDescuento, 
                ingresos.nImporteTotal 				as importeTotal, 
                ingresos.nImporteDescontado			as importeDescontado,
                ingresos.dFechaVF 					as fechaVF,
                ingresos.dFechaRI					as fechaRI,
                ingresos.vNroVoucher				as nroVoucher,
                ingresos.vNroFactura				as nroFactura,
                unidad_concepto.vCodigoUnidad 		as codigoUnidad,
                unidad_concepto.nIdConcepto 		as idConcepto,
                unidad_concepto.vNombreUnidad 		as nombreUnidad,
                unidad_concepto.vNroConceptoUnidad 	as nroConceptoUnidad,
                unidad_concepto.vNroConceptoEsp 	as nroConceptoEsp,
                unidad_concepto.vNomConceptoEsp 	as nomConceptoEsp,
                unidad_concepto.nImporte			as importe,
                curso.vCodigoCurso					as codigoCurso,
                curso.vNombreCurso					as nombreCurso,
                cliente.vNroDocCliente				as nroDocCliente,
                cliente.vNombresCliente				as nombresCliente,
                cliente.vApellidosCliente			as apellidosCliente,
                cliente.vTipoDocCliente				as tipoDocCliente
			FROM reg_ingreso ingresos
				INNER JOIN man_cliente cliente ON cliente.vNroDocCliente = ingresos.vNroDocCliente
				INNER JOIN man_unidad_concepto unidad_concepto ON ingresos.vCodigoUnidad = unidad_concepto.vCodigoUnidad 
													AND ingresos.nIdConcepto = unidad_concepto.nIdConcepto
				INNER JOIN man_curso curso ON curso.vCodigoCurso = ingresos.vCodigoCurso		
			WHERE ingresos.nIdIngreso = ID_INGRESO;
		ELSE
			SELECT 	ingresos.nIdIngreso 				as idIngreso, 
				ingresos.nDescuento		 			as descuento, 
				ingresos.vDescDescuento 			as descDescuento, 
                ingresos.nImporteTotal 				as importeTotal, 
                ingresos.nImporteDescontado			as importeDescontado,
                ingresos.dFechaVF 					as fechaVF,
                ingresos.dFechaRI					as fechaRI,
                ingresos.vNroVoucher				as nroVoucher,
                ingresos.vNroFactura				as nroFactura,
                unidad_concepto.vCodigoUnidad 		as codigoUnidad,
                unidad_concepto.nIdConcepto 		as idConcepto,
                unidad_concepto.vNombreUnidad 		as nombreUnidad,
                unidad_concepto.vNroConceptoUnidad 	as nroConceptoUnidad,
                unidad_concepto.vNroConceptoEsp 	as nroConceptoEsp,
                unidad_concepto.vNomConceptoEsp 	as nomConceptoEsp,
                unidad_concepto.nImporte			as importe,
                curso.vCodigoCurso					as codigoCurso,
                curso.vNombreCurso					as nombreCurso,
                cliente.vNroDocCliente				as nroDocCliente,
                cliente.vNombresCliente				as nombresCliente,
                cliente.vApellidosCliente			as apellidosCliente,
                cliente.vTipoDocCliente				as tipoDocCliente
			FROM reg_ingreso ingresos
				INNER JOIN man_cliente cliente ON cliente.vNroDocCliente = ingresos.vNroDocCliente
				INNER JOIN man_unidad_concepto unidad_concepto ON ingresos.vCodigoUnidad = unidad_concepto.vCodigoUnidad 
													AND ingresos.nIdConcepto = unidad_concepto.nIdConcepto
			WHERE ingresos.nIdIngreso = ID_INGRESO;
		END IF;
    END IF;
       
    IF pVERBO = 'INSERT' THEN
    
		IF IMP_DESCONTADO IS NULL THEN
			SET dnDescuento = 0.00;
            SET IMP_DESCONTADO = 0.00;
            SET IMP_TOTAL = IMP_CONCEPTO;
		ELSE
			SET dnDescuento = IMP_CONCEPTO-IMP_DESCONTADO;
            SET IMP_TOTAL = IMP_DESCONTADO;
        END IF;        
    
		INSERT INTO reg_ingreso (vCodigoUnidad, vNroDocCliente, nIdConcepto, nDescuento, vDescDescuento, nImporteDescontado,
					nImporteTotal, vCodigoCurso, nNroCuota, vTipoMoneda, vTipoCambio, vNroVoucher, vNroFactura, dFechaVF, 
                    vNroReciboIngreso, dFechaRI, vUsuarioAdicion, dFechaAdicion) 
				VALUES (COD_UNIDAD, NRO_DOC_CLIENTE, ID_CONCEPTO, dnDescuento, DESC_nDescuento, IMP_DESCONTADO, IMP_TOTAL, 
						ID_CURSO, NRO_CUOTA, TIPO_MONEDA, TIPO_CAMBIO, NRO_VOUCHER, NRO_FACTURA, 
                        FECHA_VF, NRO_RECIBO_ING, FECHA_RI, pUSUARIO, NOW());
                    
		INSERT INTO man_cliente (vNroDocCliente, vNombresCliente, vApellidosCliente, vTipoDocCliente)
				VALUES (NRO_DOC_CLIENTE, NOM_CLIENTE, APE_CLIENTE, TIPO_DOC_CLIENTE);
        
        select max(nIdIngreso) as idIngreso
        from reg_ingreso;
	
	END IF;
    
    IF pVERBO = 'UPDATE' THEN
		UPDATE reg_ingreso
        SET nDescuento		 	= (IMP_CONCEPTO-IMP_DESCONTADO),
			vDescDescuento 		= DESC_nDescuento,
            nImporteTotal		= IMP_DESCONTADO,
            vCodigoCurso		= ID_CURSO,
            nNroCuota			= NRO_CUOTA,
            vTipoCambio			= TIPO_CAMBIO,
            vNroVoucher			= NRO_VOUCHER,
            vNroFactura			= NRO_fACTURA,
            vNroReciboIngreso	= NRO_RECIBO_ING,
            dFechaRI			= FECHA_RI
		WHERE nIdIngreso = ID_INGRESO;
		
        UPDATE man_cliente
        SET vNombresCliente 	= NOM_CLIENTE,
			vApellidosCliente 	= APE_CLIENTE
		WHERE vNroDocCliente = NRO_DOC_CLIENTE;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANT_METAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANT_METAS`(
	IN pVerbo 		VARCHAR(10),
    IN pNroMeta 	INTEGER,
    IN pNomMeta 	VARCHAR(255),
    IN pDesMeta 	VARCHAR(255),
    IN pUSUARIO		VARCHAR(20)
)
BEGIN
	IF pVerbo = 'GETS' THEN
		SELECT nroMeta, nomMeta, desMeta
        FROM sie_meta;       
    END IF;
    
    IF pVerbo = 'GET' THEN
		SELECT 	nroMeta, nomMeta, desMeta
        FROM 	sie_meta 
        where 	nroMeta = pNroMeta;    
    END IF;
    
    IF pVerbo = 'EXIST' THEN
		SELECT nroMeta, nomMeta, desMeta
        FROM sie_meta 
        where nroMeta = pNroMeta;    
    END IF;
    /*
    IF pVerbo = 'CARGAR' THEN
		SELECT	@CONTADOR := COUNT(1) FROM	sie_meta;
		IF @CONTADOR = 0 THEN
			INSERT INTO sie_meta(nroMeta, nomMeta, desMeta) values (pNroMeta, pNomMeta,pDesMeta);			
        ELSE
			UPDATE sie_meta SET nomMeta = pNomMeta, desMeta = pDesMeta WHERE nroMeta = pNroMeta;
        END IF;
    END IF;
    */
    IF pVerbo = 'INSERT' THEN
		INSERT INTO sie_meta(nroMeta, nomMeta, desMeta, usuarioAdicion, fechaAdicion) 
				values (pNroMeta, pNomMeta, pDesMeta, pUSUARIO, NOW());
    END IF;
    
	IF pVerbo = 'UPDATE' THEN
		UPDATE sie_meta 
        SET nomMeta 			= pNomMeta, 
			desMeta 			= pDesMeta,
            usuarioModificacion = pUSUARIO,
            fechaModificacion	= NOW()
        WHERE nroMeta = pNroMeta;
    END IF;
    
    IF pVerbo = 'REMOVE' THEN
		DELETE 
        FROM sie_meta 
        WHERE nroMeta = pNroMeta;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANT_MULTI_TAB_CAB` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANT_MULTI_TAB_CAB`(
	 IN pVERBO 			VARCHAR(10)
    ,IN pID_TABLA		TINYINT
    ,IN pDESCRIPCION	VARCHAR(50)
	,IN pUSUARIO		VARCHAR(20)
)
BEGIN
	
    IF pVERBO = 'GET' THEN
		SELECT	nIdTabla		AS idTabla,  
				vDescripcion	AS descripcion
		FROM sie_multitablacab
		WHERE 
			nIdTabla = pID_TABLA;
	END IF;
    
     IF pVERBO = 'GETS' THEN
		SELECT	nIdTabla		AS idTabla,  
				vDescripcion	AS descripcion
		FROM sie_multitablacab
        ORDER BY nIdTabla;
	END IF;
    
    IF pVERBO = 'INSERT' THEN
    
		INSERT INTO sie_multitablacab (vDescripcion, vUsuarioAdicion, dFechaAdicion)
				VALUES (pDESCRIPCION, pUSUARIO, NOW());
            
		SELECT 	MAX(nIdTabla) AS idTabla 
        FROM 	sie_multitablacab;
        
	END IF;
    
    IF pVERBO = 'UPDATE' THEN
		UPDATE sie_multitablacab
		SET 
			vDescripcion 			= pDESCRIPCION,
			vUsuarioModificacion	= pUSUARIO,
			dFechaModificacion		= NOW()
		WHERE
			nIdTabla = pID_TABLA;
	END IF;
    
    IF pVERBO = 'REMOVE' THEN
		DELETE 
        FROM sie_multitabladet
		WHERE nIdTabla = pID_TABLA;
            
		DELETE 
        FROM 	sie_multitablacab
		WHERE 	nIdTabla = pID_TABLA;
	END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANT_MULTI_TAB_DET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANT_MULTI_TAB_DET`(
	 IN pVERBO 				VARCHAR(10)
    ,IN pID_TABLA			TINYINT
    ,IN pID_ITEM			VARCHAR(4)
    ,IN pDESCRIPCION_ITEM	VARCHAR(50)
    ,IN pABREVIATURA		VARCHAR(10)
	,IN pUSUARIO			VARCHAR(20)
)
BEGIN

	IF pVERBO = 'GET' THEN
		SELECT nIdTabla			AS idTabla,  
			   vIdItem			AS idItem,
			   vDescripcionItem AS descripcionItem,
			   vAbreviatura		AS abreviatura
		FROM sie_multitabladet
		WHERE 
			nIdTabla = pID_TABLA
		ORDER BY vIdItem;
	END IF;
    
	IF pVERBO = 'GET_T' THEN
		SELECT nIdTabla			AS idTabla,  
			   vIdItem			AS idItem,
			   vDescripcionItem AS descripcionItem,
			   vAbreviatura		AS abreviatura
		FROM sie_multitabladet
		ORDER BY nIdTabla, vIdItem;
	END IF;
    
	IF pVERBO = 'GETS' THEN
		SELECT nIdTabla			AS idTabla,  
			   vIdItem			AS idItem,
			   vDescripcionItem AS descripcionItem,
			   vAbreviatura		AS abreviatura
		FROM sie_multitabladet
		WHERE  nIdTabla	= pID_TABLA AND vIdItem	= pID_ITEM;
	END IF;
    
	IF pVERBO = 'INSERT' THEN
		INSERT INTO sie_multitabladet (nIdTabla, vIdItem, vDescripcionItem, vAbreviatura, vUsuarioAdicion, dFechaAdicion)
				VALUES (pID_TABLA, pID_ITEM, pDESCRIPCION_ITEM, pABREVIATURA, pUSUARIO, NOW());
	END IF;
    
	IF pVERBO = 'UPDATE' THEN
		UPDATE sie_multitabladet
		SET 
			vDescripcionItem = pDESCRIPCION_ITEM,
			vAbreviatura = pABREVIATURA,
			vUsuarioModificacion = pUSUARIO,
			dFechaModificacion = NOW()
		WHERE nIdTabla = pID_TABLA AND 
				vIdItem = pID_ITEM;
	END IF;
    
	IF pVERBO = 'REMOVE' THEN
		DELETE 
        FROM sie_multitabladet
		WHERE nIdTabla = pID_TABLA AND 
				vIdItem = 	pID_ITEM;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANT_PARTIDAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANT_PARTIDAS`(
	IN pVerbo 			VARCHAR(10),
    IN pClasificador 	VARCHAR(20),
    IN pDescripcion 	VARCHAR(100),
    IN pDescDetallada 	VARCHAR(255),
    IN pCodigoTarea 	INTEGER,
    IN pUSUARIO			VARCHAR(20)
)
BEGIN
	DECLARE NOM_TAREA VARCHAR(255);

	IF pVerbo = 'GETS' THEN
		SELECT *
        FROM sie_tarea_partida;       
    END IF;
    
    IF pVerbo = 'GET' THEN
		SELECT *
        FROM sie_tarea_partida
        WHERE codigoTarea = pCodigoTarea;     
    END IF;
    
    IF pVerbo = 'EXIST' THEN
		SELECT partida.clasificador as clasificador,
			   partida.descripcion as descripcion,
			   tarea.nomTarea as nombreTarea
        FROM sie_partida partida
			INNER JOIN sie_tarea_partida thp on thp.Partida_clasificador = partida.clasificador
			INNER JOIN sie_tarea on tarea.CodigoTarea = thp.Tarea_CodigoTarea;      
    END IF;
        
    IF pVerbo = 'INSERT' THEN
		SELECT nomTarea
        INTO NOM_TAREA
        FROM sie_tarea
        WHERE codigoTarea = pCodigoTarea;
        
		INSERT INTO sie_partida(clasificador, descripcion, descDetallada, usuarioAdicion, fechaAdicion) 
						values (pClasificador, pDescripcion, pDescDetallada, pUSUARIO, NOW());
                        
        INSERT INTO sie_tarea_partida(clasificador, codigoTarea, nomTarea, descripcion, descDetallada) 
								values (pClasificador, pCodigoTarea, NOM_TAREA, pDescripcion, pDescDetallada);
    END IF;
    
	IF pVerbo = 'UPDATE' THEN
		UPDATE sie_partida 
        SET descripcion = pDescripcion, 
			descDetallada = pDescDetallada 
		WHERE pClasificador = clasificador;
        
        UPDATE sie_tarea_partida 
        SET descripcion		 	= pDescripcion, 
			descDetallada 	 	= pDescDetallada
		WHERE pClasificador = clasificador;
    END IF;
    
    IF pVerbo = 'REMOVE' THEN
		DELETE 
        FROM sie_partida 
        WHERE pClasificador = clasificador;
        
        DELETE 
        FROM sie_tarea_partida 
        WHERE clasificador = pClasificador;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANT_PERFILES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANT_PERFILES`(
	 IN pVERBO 			VARCHAR(10)
    ,IN pID_PERFIL 		TINYINT
    ,IN pDESCRIPCION	VARCHAR(50)
    ,IN pNOMBRE			VARCHAR(40)
    ,IN pUSUARIO		VARCHAR(20)
)
BEGIN

	IF pVERBO = 'GETS' THEN
		SELECT 	nIdPerfil		AS idPerfil,
				vDescripcion 	AS descripcion,
				vNombre			AS nombrePerfil
        FROM seg_perfil;
    END IF;
    
    IF pVERBO = 'GET' THEN
		SELECT	nIdPerfil		AS idPerfil,
				vDescripcion 	AS descripcion,
				vNombre			AS nombrePerfil
		FROM	seg_perfil  			
		WHERE 		nIdPerfil 		= pID_PERFIL;
				
    END IF;
    
    IF pVERBO = 'EXIST' THEN
		SELECT	nIdPerfil		AS idPerfil				
		FROM	seg_perfil  			
        WHERE 		nIdPerfil 		= pID_PERFIL;				
    END IF;
    
    IF pVERBO = 'INSERT' THEN
		INSERT INTO seg_perfil (nIdPerfil, vDescripcion,vNombre,usuarioModificacion,fechaModificacion) 
				VALUES (pID_PERFIL, pDESCRIPCION, pNOMBRE, pUSUARIO,
						NOW());
	END IF;
    
    IF pVERBO = 'UPDATE' THEN
		UPDATE  seg_perfil
        SET		 vDescripcion			= 	pDESCRIPCION
                ,vNombre		= 	pNOMBRE
                ,UsuarioModificacion	=  	pUSUARIO
                ,fechaModificacion		=	NOW()
		WHERE 		nIdPerfil 		= pID_PERFIL;	
    END IF;
    
    IF pVERBO = 'REMOVE' THEN
		DELETE FROM seg_perfil
		WHERE 		nIdPerfil 		= pID_PERFIL;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANT_PERSONAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANT_PERSONAS`(
	 IN pVERBO 	 			VARCHAR(10)
    ,IN pTIPO_DOCUMENTO 	VARCHAR(5)
	,IN pNUMERO_DOCUMENTO  	VARCHAR(12)
    ,IN pNOMBRES  			VARCHAR(100)
    ,IN pAPELLIDO_PATERNO  	VARCHAR(100)
    ,IN pAPELLIDO_MATERNO  	VARCHAR(100)
    ,IN pUSUARIO 			VARCHAR(20)
)
BEGIN

	IF pVERBO = 'GETS' THEN
		SELECT	persona.vTipoDocumento			AS idTipoDocumento,
                tipoDocumento.vDescripcionItem	AS descripcionTipoDocumento,
                persona.vNumeroDocumento		AS numeroDocumento,
                persona.vNombres 				AS nombres,
                persona.vApellidoPaterno		AS apellidoPaterno,
                persona.vApellidoMaterno		AS apellidoMaterno
		FROM	sie_persona persona 			
				INNER JOIN sie_multitabladet tipoDocumento ON (persona.vTipoDocumento = tipoDocumento.vIdItem 
																	AND tipoDocumento.nIdTabla = 1);
    END IF;
    
    IF pVERBO = 'GET' THEN
		SELECT	persona.vTipoDocumento			AS idTipoDocumento,
                tipoDocumento.vDescripcionItem	AS descripcionTipoDocumento,
                persona.vNumeroDocumento		AS numeroDocumento,
                persona.vNombres 				AS nombres,
                persona.vApellidoPaterno		AS apellidoPaterno,
                persona.vApellidoMaterno		AS apellidoMaterno
		FROM	sie_persona persona 			
				INNER JOIN sie_multitabladet tipoDocumento		ON	(persona.vTipoDocumento = tipoDocumento.vIdItem 
																	AND tipoDocumento.nIdTabla = 1)
		WHERE 		persona.vTipoDocumento 		= pTIPO_DOCUMENTO
				AND persona.vNumeroDocumento 	= pNUMERO_DOCUMENTO;
    END IF;
    
    IF pVERBO = 'EXIST' THEN
		SELECT	vTipoDocumento			AS idTipoDocumento,
                vNumeroDocumento		AS numeroDocumento
		FROM	sie_persona
        WHERE 		vTipoDocumento 		= pTIPO_DOCUMENTO
				AND vNumeroDocumento 	= pNUMERO_DOCUMENTO;
    END IF;
    
    IF pVERBO = 'INSERT' THEN
		INSERT INTO sie_persona (vTipoDocumento, vNumeroDocumento, vNombres, vApellidoPaterno, vApellidoMaterno,
								vUsuarioAdicion, dFechaAdicion) 
				VALUES (pTIPO_DOCUMENTO, pNUMERO_DOCUMENTO, pNOMBRES, pAPELLIDO_PATERNO, pAPELLIDO_MATERNO, pUSUARIO,
						NOW());
	END IF;
    
    IF pVERBO = 'UPDATE' THEN
		UPDATE  sie_persona
        SET		 vNombres				= 	pNOMBRES
                ,vApellidoPaterno		= 	pAPELLIDO_PATERNO
                ,vApellidoMaterno		=  	pAPELLIDO_MATERNO
                ,vUsuarioModificacion	=  	pUSUARIO
                ,dFechaModificacion		=	NOW()
		WHERE 		vTipoDocumento 		= 	pTIPO_DOCUMENTO
				AND vNumeroDocumento 	= 	pNUMERO_DOCUMENTO;
    END IF;
    
    IF pVERBO = 'REMOVE' THEN
		DELETE FROM sie_persona
		WHERE 		vTipoDocumento 		= pTIPO_DOCUMENTO
				AND vNumeroDocumento 	= pNUMERO_DOCUMENTO;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANT_TAREAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANT_TAREAS`(
	IN pVerbo 			VARCHAR(10),
    IN pCodigoTarea 	INTEGER,
    IN pUnidad_idUnidad VARCHAR(10),
    IN pMeta_nroMeta 	INTEGER, 
    IN pNomTarea 		VARCHAR(255),
    IN pUSUARIO			VARCHAR(20)
)
BEGIN

	IF pVerbo = 'GETS' THEN
		SELECT tarea.codigoTarea as codigoTarea,
			   tarea.nomTarea as nomTarea,
               unidad.codigoUnidad as codigoUnidad,
               unidad.nombreUnidad as nombreUnidad, 
               meta.nroMeta as nroMeta,
               meta.nomMeta as nomMeta
        FROM sie_tarea tarea 
			INNER JOIN sie_unidad unidad ON tarea.codigoUnidad = unidad.codigoUnidad
            INNER JOIN sie_meta meta ON tarea.nroMeta = meta.nroMeta;       
    END IF;
    
    IF pVerbo = 'GET' THEN
		SELECT tarea.codigoTarea as codigoTarea,
			   tarea.nomTarea as nomTarea,
               unidad.codigoUnidad as codigoUnidad,
               unidad.nombreUnidad as nombreUnidad, 
               meta.nroMeta as nroMeta,
               meta.nomMeta as nomMeta
        FROM sie_tarea tarea 
			INNER JOIN sie_unidad unidad ON tarea.codigoUnidad = unidad.codigoUnidad
            INNER JOIN sie_meta meta ON tarea.nroMeta = meta.nroMeta 
        WHERE unidad.codigoUnidad = pUnidad_idUnidad AND 
				meta.nroMeta = pMeta_nroMeta AND
                tarea.codigoTarea = pCodigoTarea;    
    END IF;
    
    IF pVerbo = 'EXIST' THEN
		SELECT tarea.CodigoTarea as codigoTarea,
			   tarea.nomTarea as nombreTarea,
               unidad.nombreUnidad as nombreUnidad
        FROM sie_tarea tarea INNER JOIN sie_unidad unidad ON tarea.Unidad_idUnidad = unidad.idUnidad
        where pCodigoTarea = tarea.CodigoTarea; 
    END IF;
    
    IF pVerbo = 'INSERT' THEN
		INSERT INTO sie_tarea(codigoTarea, codigoUnidad, nroMeta, nomTarea, usuarioAdicion, fechaAdicion) 
				values (pCodigoTarea, pUnidad_idUnidad, pMeta_nroMeta, pNomTarea, pUSUARIO, NOW());
    END IF;
    
	IF pVerbo = 'UPDATE' THEN
		UPDATE sie_tarea_partida
        SET 	nomTarea = pNomTarea
		WHERE codigoTarea = pCodigoTarea;
        
		UPDATE sie_tarea 
        SET nomTarea 			= pNomTarea, 
			codigoUnidad 		= pUnidad_idUnidad, 
			nroMeta 			= pMeta_nroMeta,
            usuarioModificacion	= pUSUARIO,
            fechaModificacion	= NOW()
		WHERE codigoTarea = pCodigoTarea;
        
    END IF;
    
    IF pVerbo = 'REMOVE' THEN
		DELETE 
        FROM sie_tarea 
        WHERE codigoTarea = pCodigoTarea;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANT_UNIDADES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANT_UNIDADES`(
	IN pVERBO 			VARCHAR(10)
    ,IN ID_UNIDAD		VARCHAR(10)
    ,IN NOM_UNIDAD		VARCHAR(100)
    ,IN NRO_CONCEPTO	VARCHAR(3)
	,IN pUSUARIO		VARCHAR(20)
)
BEGIN
	IF pVERBO = 'GETS' THEN
		SELECT	codigoUnidad, nroConcepto, nombreUnidad
		FROM sie_unidad;
	END IF;
    
	IF pVERBO = 'GETS_UNI' THEN
		SELECT	codigoUnidad,  nombreUnidad, nroConcepto
		FROM sie_unidad;
	END IF;
    
    IF pVERBO = 'INSERT' THEN
    
		INSERT INTO sie_unidad (codigoUnidad, nombreUnidad, nroConcepto, usuarioAdicion, fechaAdicion)
						VALUES (ID_UNIDAD, NOM_UNIDAD, NRO_CONCEPTO, pUSUARIO, NOW());        
	END IF;
    
    IF pVERBO = 'UPDATE' THEN
		UPDATE sie_unidad
		SET		codigoUnidad		= ID_UNIDAD
                ,nombreUnidad		= NOM_UNIDAD
                ,nroConcepto		= NRO_CONCEPTO
                ,usuarioModificacion=pUSUARIO
                ,fechaModificacion	= NOW()
		WHERE 	codigoUnidad		= ID_UNIDAD;
        
        UPDATE sie_unidad_concepto
		SET		nombreUnidad		= NOM_UNIDAD
                ,nroConceptoUnidad	= NRO_CONCEPTO
		WHERE 	codigoUnidad		= ID_UNIDAD;

	END IF;
    
    IF pVERBO = 'REMOVE' THEN
		
        DELETE 
        FROM 	sie_unidad
        WHERE	codigoUnidad = ID_UNIDAD;
        
        DELETE 
        FROM 	sie_unidad_concepto
        WHERE	codigoUnidad = ID_UNIDAD;
        
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MANT_USUARIOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MANT_USUARIOS`(
  IN pVERBO 	 		VARCHAR(10)
 ,IN pID_USUARIO 		VARCHAR(20)
 ,IN pCONTRASENIA		VARCHAR(70)
 ,IN pACTIVO			BIT
 ,IN pTIPO_DOCUMENTO 	VARCHAR(5)
 ,IN pNUMERO_DOCUMENTO  VARCHAR(12)
 ,IN pID_PERFIL 		TINYINT
 ,IN pUSUARIO 			VARCHAR(20)
)
BEGIN
	IF pVERBO = 'LOGIN' THEN
		SELECT	vIdUsuario		AS idUsuario,  
				vContrasenia	AS contrasenia,
				bActivo			AS activo,
                nIdPerfil		AS idPerfil
		FROM	seg_usuario
		WHERE 	vIdUsuario = pID_USUARIO;
    END IF;
    
    IF pVERBO = 'GETS' THEN
		SELECT	usuario.vIdUsuario				AS idUsuario, 
				usuario.bActivo					AS activo,
                usuario.vTipoDocumento			AS idTipoDocumento,
                tipoDocumento.vDescripcionItem	AS descripcionTipoDocumento,
                usuario.vNumeroDocumento		AS numeroDocumento,
                persona.vNombres 				AS nombres,
                persona.vApellidoPaterno		AS apellidoPaterno,
                persona.vApellidoMaterno		AS apellidoMaterno,
                usuario.nIdPerfil				AS idPerfil,
                perfil.vNombre				AS nombrePerfil
		FROM	seg_usuario usuario 
				INNER JOIN sie_persona persona 					ON (usuario.vTipoDocumento = persona.vTipoDocumento
																	AND usuario.vNumeroDocumento = persona.vNumeroDocumento)
				INNER JOIN sie_multitabladet tipoDocumento		ON	(usuario.vTipoDocumento = tipoDocumento.vIdItem 
																	AND tipoDocumento.nIdTabla = 1)
				INNER JOIN seg_perfil perfil 					ON (usuario.nIdPerfil = perfil.nIdPerfil);
    END IF;
    
    IF pVERBO = 'GET' THEN
		SELECT	usuario.vIdUsuario				AS idUsuario,  
				usuario.bActivo					AS activo,
                usuario.vTipoDocumento			AS idTipoDocumento,
                tipoDocumento.vDescripcionItem	AS descripcionTipoDocumento,
                usuario.vNumeroDocumento		AS numeroDocumento,
                persona.vNombres 				AS nombres,
                persona.vApellidoPaterno		AS apellidoPaterno,
                persona.vApellidoMaterno		AS apellidoMaterno,
                usuario.nIdPerfil				AS idPerfil,
                perfil.vNombre				AS nombrePerfil
		FROM	seg_usuario usuario 
				INNER JOIN sie_persona persona 					ON (usuario.vTipoDocumento = persona.vTipoDocumento
																	AND usuario.vNumeroDocumento = persona.vNumeroDocumento)
				INNER JOIN sie_multitabladet tipoDocumento		ON	(usuario.vTipoDocumento = tipoDocumento.vIdItem 
																	AND tipoDocumento.nIdTabla = 1)
				INNER JOIN seg_perfil perfil 					ON (usuario.nIdPerfil = perfil.nIdPerfil)
		WHERE 	usuario.vIdUsuario = pID_USUARIO;
    END IF;
    
    IF pVERBO = 'EXIST' THEN
		SELECT	vIdUsuario		AS idUsuario
		FROM	seg_usuario
        WHERE 	vIdUsuario = pID_USUARIO;
    END IF;
    
    IF pVERBO = 'INSERT' THEN
		INSERT INTO seg_usuario (vIdUsuario, vTipoDocumento, vNumeroDocumento, vContrasenia, bActivo, nIdPerfil,
								vUsuarioAdicion, dFechaAdicion) 
				VALUES (pID_USUARIO, pTIPO_DOCUMENTO, pNUMERO_DOCUMENTO, pCONTRASENIA, pACTIVO, pID_PERFIL, pUSUARIO,
						NOW());
    END IF;
    
    IF pVERBO = 'UPDATE' THEN
		UPDATE  seg_usuario
        SET		 vTipoDocumento 		= 	pTIPO_DOCUMENTO
				,vNumeroDocumento 		=	pNUMERO_DOCUMENTO
                ,bActivo				= 	pACTIVO
                ,nIdPerfil				=	pID_PERFIL
                ,vUsuarioModificacion	=  	pUSUARIO
                ,dFechaModificacion		=	NOW()
		WHERE 	vIdUsuario = pID_USUARIO;
    END IF;
    
    IF pVERBO = 'UPDATE_CONT' THEN
		UPDATE  seg_usuario
        SET		 vContrasenia			=  	pCONTRASENIA	
                ,vUsuarioModificacion	=  	pUSUARIO
                ,dFechaModificacion		=	NOW()
		WHERE 	vIdUsuario = pID_USUARIO;
    END IF;
    
    IF pVERBO = 'REMOVE' THEN
		DELETE 
        FROM  	seg_usuario
		WHERE 	vIdUsuario = pID_USUARIO;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REPORTE_INGRESOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORTE_INGRESOS`(
	IN pVERBO 			VARCHAR(10)
    ,IN pFECHA_INICIO	DATE
    ,IN pFECHA_FIN 		DATE
    ,IN ID_UNIDAD		VARCHAR(10)
    ,IN ID_CONCEPTO		INTEGER
    ,IN ID_CURSO		INTEGER
    ,IN ID_CLIENTE		VARCHAR(15)
)
BEGIN

	IF pVERBO = 'UNIDADES' THEN
		SELECT	unidad.nombreUnidad 			as nombreUnidad, 
				unidad.nroConcepto				as nroConceptoUnidad,
				SUM(ingresos.importeTotal)		as ingresoTotal
		FROM	sie_ingresos ingresos
			INNER JOIN sie_unidad unidad ON ingresos.codigoUnidad = unidad.codigoUnidad
		WHERE ingresos.fechaVF BETWEEN pFECHA_INICIO AND pFECHA_FIN
        GROUP BY unidad.nombreUnidad
        ORDER BY unidad.nroConcepto;
    END IF;
    
	IF pVERBO = 'CONCEPTOS' THEN
		SELECT	ingresos.fechaVF 					as fechaVF,
				unidad_concepto.nombreUnidad 		as nombreUnidad, 
				unidad_concepto.nroConceptoUnidad	as nroConceptoUnidad,
                unidad_concepto.idConcepto			as idConcepto,
                unidad_concepto.nroConceptoEsp		as nroConceptoEsp,
                unidad_concepto.nomConceptoEsp		as nomConceptoEsp,
                curso.codigoCurso					as codigoCurso,
                curso.nombreCurso					as nombreCurso,
				SUM(ingresos.importeTotal)			as ingresoTotal
		FROM	sie_ingresos ingresos
			INNER JOIN sie_unidad_concepto unidad_concepto ON ingresos.codigoUnidad = unidad_concepto.codigoUnidad
											AND ingresos.idConcepto = unidad_concepto.idConcepto
			INNER JOIN sie_curso curso ON curso.codigoCurso = ingresos.codigoCurso
		WHERE ingresos.fechaVF BETWEEN pFECHA_INICIO AND pFECHA_FIN
        GROUP BY curso.codigoCurso
        ORDER BY ingresos.fechaVF;
    END IF;
	    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REPORT_ATENCION_DIARIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `REPORT_ATENCION_DIARIA`(
	 IN pVERBO 			VARCHAR(10)
    ,IN pFECHA_INICIO	DATE
    ,IN pFECHA_FIN 		DATE
    ,IN pID_CAMPANIA	TINYINT
)
BEGIN
	
    IF pVERBO = 'L_DETALLE' THEN
		SELECT 	laboratorio.nNumeroRegistro							AS numeroRegistro,
				laboratorio.dFechaGeneracionNumeroRegistro			AS fechaGeneracionNumeroRegistro,
				DATE(laboratorio.dFechaGeneracionNumeroRegistro)	AS soloFechaGeneracionNumeroRegistro,
				alumno.vCodigoAlumno								AS codigoAlumno,
				alumno.vTipoAlumno									AS tipoAlumno,
				tipoAlumno.vDescripcionItem							AS descripcionTipoAlumno,
				alumno.vApellidoPaterno								AS apellidoPaterno,
				alumno.vApellidoMaterno								AS apellidoMaterno,
				alumno.vNombres										AS nombres,
                alumno.nCodigoFacultad								AS codigoFacultad,
                facultad.vDescripcion								AS descripcionFacultad,
				escuela.vDescripcion								AS descripcionEscuela,
				laboratorio.nIdCampania								AS idCampania
		FROM 	movexamenmedicolaboratorio laboratorio
				INNER JOIN maealumno alumno 			ON (laboratorio.vCodigoAlumno = alumno.vCodigoAlumno
															AND laboratorio.vTipoAlumno = alumno.vTipoAlumno)
				INNER JOIN maeescuela escuela 			ON (alumno.nCodigoEscuela = escuela.nCodigoEscuela
															AND alumno.nCodigoFacultad = escuela.nCodigoFacultad)
				INNER JOIN maefacultad	facultad		ON (escuela.nCodigoFacultad = facultad.nCodigoFacultad)
				INNER JOIN maemultitabladet tipoAlumno	ON	(alumno.vTipoAlumno = tipoAlumno.vIdItem 
															AND tipoAlumno.nIdTabla = 10)
		WHERE		DATE(laboratorio.dFechaGeneracionNumeroRegistro) BETWEEN pFECHA_INICIO AND pFECHA_FIN

				AND laboratorio.nIdCampania = pID_CAMPANIA
		ORDER BY 1 ASC;
	END IF;
    
    IF pVERBO = 'L_GENERAL' THEN 
		SELECT 	
				DATE(laboratorio.dFechaGeneracionNumeroRegistro)	AS soloFechaGeneracionNumeroRegistro,
                alumno.nCodigoFacultad								AS codigoFacultad,                
                facultad.vDescripcion								AS descripcionFacultad,
				laboratorio.nIdCampania								AS idCampania,
                count(1) 											AS cantidad
		FROM 	movexamenmedicolaboratorio laboratorio
				INNER JOIN maealumno alumno 			ON (laboratorio.vCodigoAlumno = alumno.vCodigoAlumno
															AND laboratorio.vTipoAlumno = alumno.vTipoAlumno)
				INNER JOIN maeescuela escuela 			ON (alumno.nCodigoEscuela = escuela.nCodigoEscuela
															AND alumno.nCodigoFacultad = escuela.nCodigoFacultad)
				INNER JOIN maefacultad	facultad		ON (escuela.nCodigoFacultad = facultad.nCodigoFacultad)
		WHERE		DATE(laboratorio.dFechaGeneracionNumeroRegistro) BETWEEN pFECHA_INICIO AND pFECHA_FIN
				AND laboratorio.nIdCampania = pID_CAMPANIA
		GROUP BY 
				 DATE(laboratorio.dFechaGeneracionNumeroRegistro)
				,alumno.nCodigoFacultad
                ,facultad.vDescripcion
                ,laboratorio.nIdCampania
		ORDER BY 1 ASC;
    END IF;
    
    IF pVERBO = 'R_DETALLE' THEN
		SELECT 	radiologico.nNumeroRegistro							AS numeroRegistro,
				radiologico.dFechaGeneracionNumeroRegistro			AS fechaGeneracionNumeroRegistro,
				DATE(radiologico.dFechaGeneracionNumeroRegistro)	AS soloFechaGeneracionNumeroRegistro,
				radiologico.vCodigoAlumno							AS codigoAlumno,
				radiologico.vTipoAlumno								AS tipoAlumno,
				tipoAlumno.vDescripcionItem							AS descripcionTipoAlumno,
				alumno.vApellidoPaterno								AS apellidoPaterno,
				alumno.vApellidoMaterno								AS apellidoMaterno,
				alumno.vNombres										AS nombres,
				escuela.vDescripcion								AS descripcionEscuela,
				radiologico.nIdCampania								AS idCampania
		FROM 	movexamenmedicoradiologico radiologico
				INNER JOIN maealumno alumno 			ON (radiologico.vCodigoAlumno = alumno.vCodigoAlumno
															AND radiologico.vTipoAlumno = alumno.vTipoAlumno)
				INNER JOIN maeescuela escuela 			ON (alumno.nCodigoEscuela = escuela.nCodigoEscuela
															AND alumno.nCodigoFacultad = escuela.nCodigoFacultad)
				INNER JOIN maemultitabladet tipoAlumno	ON	(alumno.vTipoAlumno = tipoAlumno.vIdItem 
															AND tipoAlumno.nIdTabla = 10)
		WHERE		DATE(radiologico.dFechaGeneracionNumeroRegistro) BETWEEN pFECHA_INICIO AND pFECHA_FIN
				AND radiologico.nIdCampania = pID_CAMPANIA
		ORDER BY 1 ASC;
    END IF;
    
    IF pVERBO = 'R_GENERAL' THEN
		SELECT 	
				DATE(radiologico.dFechaGeneracionNumeroRegistro)	AS soloFechaGeneracionNumeroRegistro,
                alumno.nCodigoFacultad								AS codigoFacultad,                
                facultad.vDescripcion								AS descripcionFacultad,
				radiologico.nIdCampania								AS idCampania,
                count(1) 											AS cantidad
		FROM 	movexamenmedicoradiologico radiologico
				INNER JOIN maealumno alumno 			ON (radiologico.vCodigoAlumno = alumno.vCodigoAlumno
															AND radiologico.vTipoAlumno = alumno.vTipoAlumno)
				INNER JOIN maeescuela escuela 			ON (alumno.nCodigoEscuela = escuela.nCodigoEscuela
															AND alumno.nCodigoFacultad = escuela.nCodigoFacultad)
				INNER JOIN maefacultad	facultad		ON (escuela.nCodigoFacultad = facultad.nCodigoFacultad)
		WHERE		DATE(radiologico.dFechaGeneracionNumeroRegistro) BETWEEN pFECHA_INICIO AND pFECHA_FIN
				AND radiologico.nIdCampania = pID_CAMPANIA
		GROUP BY 
				 DATE(radiologico.dFechaGeneracionNumeroRegistro)
				,alumno.nCodigoFacultad
                ,facultad.vDescripcion
                ,radiologico.nIdCampania
		ORDER BY 1 ASC;
    END IF;
    
    IF pVERBO = 'P_DETALLE' THEN
		SELECT 	psicologico.nNumeroRegistro							AS numeroRegistro,
				psicologico.dFechaAdicion							AS fechaGeneracionNumeroRegistro,
				DATE(psicologico.dFechaAdicion)						AS soloFechaGeneracionNumeroRegistro,
				psicologico.vCodigoAlumno							AS codigoAlumno,
				psicologico.vTipoAlumno								AS tipoAlumno,
				tipoAlumno.vDescripcionItem							AS descripcionTipoAlumno,
				alumno.vApellidoPaterno								AS apellidoPaterno,
				alumno.vApellidoMaterno								AS apellidoMaterno,
				alumno.vNombres										AS nombres,
				escuela.vDescripcion								AS descripcionEscuela,
				psicologico.nIdCampania								AS idCampania
		FROM 	movexamenmedicopsicologico psicologico
				INNER JOIN maealumno alumno 			ON (psicologico.vCodigoAlumno = alumno.vCodigoAlumno
															AND psicologico.vTipoAlumno = alumno.vTipoAlumno)
				INNER JOIN maeescuela escuela 			ON (alumno.nCodigoEscuela = escuela.nCodigoEscuela
															AND alumno.nCodigoFacultad = escuela.nCodigoFacultad)
				INNER JOIN maemultitabladet tipoAlumno	ON	(alumno.vTipoAlumno = tipoAlumno.vIdItem 
															AND tipoAlumno.nIdTabla = 10)
		WHERE		DATE(psicologico.dFechaAdicion) BETWEEN pFECHA_INICIO AND pFECHA_FIN
				AND psicologico.nIdCampania = pID_CAMPANIA
		ORDER BY 1 ASC;
    END IF;
    
    IF pVERBO = 'P_GENERAL' THEN
		SELECT 	
				DATE(psicologico.dFechaAdicion)						AS soloFechaGeneracionNumeroRegistro,
                alumno.nCodigoFacultad								AS codigoFacultad,                
                facultad.vDescripcion								AS descripcionFacultad,
				psicologico.nIdCampania								AS idCampania,
                count(1) 											AS cantidad
		FROM 	movexamenmedicopsicologico psicologico
				INNER JOIN maealumno alumno 			ON (psicologico.vCodigoAlumno = alumno.vCodigoAlumno
															AND psicologico.vTipoAlumno = alumno.vTipoAlumno)
				INNER JOIN maeescuela escuela 			ON (alumno.nCodigoEscuela = escuela.nCodigoEscuela
															AND alumno.nCodigoFacultad = escuela.nCodigoFacultad)
				INNER JOIN maefacultad	facultad		ON (escuela.nCodigoFacultad = facultad.nCodigoFacultad)
		WHERE		DATE(psicologico.dFechaAdicion) BETWEEN pFECHA_INICIO AND pFECHA_FIN
				AND psicologico.nIdCampania = pID_CAMPANIA
		GROUP BY 
				 DATE(psicologico.dFechaAdicion)
				,alumno.nCodigoFacultad
                ,facultad.vDescripcion
                ,psicologico.nIdCampania
		ORDER BY 1 ASC;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `consultaauditoria`
--

/*!50001 DROP VIEW IF EXISTS `consultaauditoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consultaauditoria` AS select `auditoria`.`nIdAuditoria` AS `idAuditoria`,`auditoria`.`nIdTipoAuditoria` AS `idTipoAuditoria`,`tipoauditoria`.`vDescripcion` AS `descripcionTipoAuditoria`,`auditoria`.`vAccion` AS `idAccion`,`accion`.`vDescripcionItem` AS `descripcionAccion`,`auditoria`.`vDireccionIp` AS `direccionIp`,`auditoria`.`bExito` AS `exito`,`auditoria`.`vComentario` AS `comentario`,`auditoria`.`vUsuario` AS `nombreUsuario`,`auditoria`.`dFecha` AS `fecha`,`auditoria`.`vHora` AS `hora` from ((`seg_auditoria` `auditoria` join `seg_tipoauditoria` `tipoauditoria` on((`auditoria`.`nIdTipoAuditoria` = `tipoauditoria`.`nIdTipoAuditoria`))) join `man_multitabladet` `accion` on(((`accion`.`vIdItem` = `auditoria`.`vAccion`) and (`accion`.`nIdTabla` = 9)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-27 10:43:19
