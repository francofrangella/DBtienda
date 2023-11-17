CREATE DATABASE  IF NOT EXISTS `comercio2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `comercio2`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: comercio2
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `clienteID` varchar(9) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`clienteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('2001','Luis','Gonzalez','Bermejo 1232'),('2002','Maria','Sanchez','Casacuberta 435'),('2003','Pedro','Martinez','Pehuajo 4574'),('2004','Laura','Fernandez','Panama 798'),('2005','Carlos','Lopez','Quindio 980'),('2006','Ana','Torres','Lamadrid 23525'),('2007','Juan','Diaz','Linares 14445'),('2008','Eva','Garcia','Fragio 223'),('2009','Miguel','Soto','Uruguay 580'),('2010','Carmen','Rivera','Timoteo 43');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `productoID` varchar(15) NOT NULL,
  `empleadoID` varchar(9) NOT NULL,
  `clienteID` varchar(9) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`productoID`,`empleadoID`,`clienteID`),
  KEY `empleadoID` (`empleadoID`),
  KEY `clienteID` (`clienteID`),
  CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`productoID`) REFERENCES `producto` (`productoID`),
  CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`empleadoID`) REFERENCES `empleados` (`empleadoID`),
  CONSTRAINT `compras_ibfk_3` FOREIGN KEY (`clienteID`) REFERENCES `clientes` (`clienteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES ('1','1001','2001','2023-01-10 08:15:30'),('10','1010','2010','2023-02-25 08:30:30'),('2','1002','2002','2023-01-15 14:30:45'),('3','1003','2003','2023-01-20 12:00:00'),('4','1004','2004','2023-01-25 10:45:30'),('5','1005','2005','2023-02-01 16:20:15'),('6','1006','2006','2023-02-05 09:30:00'),('7','1007','2007','2023-02-10 11:55:30'),('8','1008','2008','2023-02-15 14:45:15'),('9','1009','2009','2023-02-20 17:10:45');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `empleadoID` varchar(9) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(120) NOT NULL,
  PRIMARY KEY (`empleadoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES ('1001','Juan','Perez','juan@gmail.com'),('1002','María','Gomez','maria@gmail.com'),('1003','Carlos','Lopez','carlos@gmail.com'),('1004','Laura','Martinez','laura@gmail.com'),('1005','Pedro','Rodriguez','pedro@gmail.com'),('1006','Ana','Sanchez','ana@gmail.com'),('1007','Luis','Fernandez','luis@gmail.com'),('1008','Eva','Garcia','eva@gmail.com'),('1009','Miguel','Diaz','miguel@gmail.com'),('1010','Carmen','Torres','carmen@gmail.com');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados_ventas`
--

DROP TABLE IF EXISTS `empleados_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados_ventas` (
  `empleadoID` varchar(9) NOT NULL,
  `productoID` varchar(15) NOT NULL,
  `plata_ventas` float DEFAULT NULL,
  `cantidad_ventas` int DEFAULT NULL,
  PRIMARY KEY (`empleadoID`,`productoID`),
  KEY `productoID` (`productoID`),
  CONSTRAINT `empleados_ventas_ibfk_1` FOREIGN KEY (`empleadoID`) REFERENCES `empleados` (`empleadoID`),
  CONSTRAINT `empleados_ventas_ibfk_2` FOREIGN KEY (`productoID`) REFERENCES `producto` (`productoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados_ventas`
--

LOCK TABLES `empleados_ventas` WRITE;
/*!40000 ALTER TABLE `empleados_ventas` DISABLE KEYS */;
INSERT INTO `empleados_ventas` VALUES ('1001','1',1500,10),('1002','2',750,5),('1003','3',500,7),('1004','4',100,20),('1005','5',5,100),('1006','6',900,8),('1007','7',2000,2),('1008','8',800,10),('1009','9',1200,6),('1010','10',2500,4);
/*!40000 ALTER TABLE `empleados_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envio`
--

DROP TABLE IF EXISTS `envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio` (
  `productoID` varchar(15) NOT NULL,
  `clienteID` varchar(9) NOT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `fecha_llegada` datetime DEFAULT NULL,
  PRIMARY KEY (`productoID`,`clienteID`),
  KEY `clienteID` (`clienteID`),
  CONSTRAINT `envio_ibfk_1` FOREIGN KEY (`productoID`) REFERENCES `producto` (`productoID`),
  CONSTRAINT `envio_ibfk_2` FOREIGN KEY (`clienteID`) REFERENCES `clientes` (`clienteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envio`
--

LOCK TABLES `envio` WRITE;
/*!40000 ALTER TABLE `envio` DISABLE KEYS */;
INSERT INTO `envio` VALUES ('1','2001','2023-01-12 10:00:00','2023-01-14 15:30:00'),('10','2010','2023-02-26 11:15:00','2023-02-28 16:30:00'),('2','2002','2023-01-16 09:45:00','2023-01-19 12:15:00'),('3','2003','2023-01-21 11:30:00','2023-01-24 16:00:00'),('4','2004','2023-01-26 14:45:00','2023-01-29 09:30:00'),('5','2005','2023-02-02 12:30:00','2023-02-04 17:45:00'),('6','2006','2023-02-06 10:15:00','2023-02-09 15:00:00'),('7','2007','2023-02-11 13:30:00','2023-02-13 10:15:00'),('8','2008','2023-02-16 15:45:00','2023-02-19 09:00:00'),('9','2009','2023-02-21 09:30:00','2023-02-23 14:45:00');
/*!40000 ALTER TABLE `envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precio`
--

DROP TABLE IF EXISTS `precio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precio` (
  `productoID` varchar(15) NOT NULL,
  `precio` float NOT NULL,
  `vigencia` date DEFAULT NULL,
  PRIMARY KEY (`productoID`),
  CONSTRAINT `precio_ibfk_1` FOREIGN KEY (`productoID`) REFERENCES `producto` (`productoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precio`
--

LOCK TABLES `precio` WRITE;
/*!40000 ALTER TABLE `precio` DISABLE KEYS */;
INSERT INTO `precio` VALUES ('1',150,'2023-05-01'),('10',250,'2023-01-25'),('2',75,'2023-10-25'),('3',50,'2023-02-12'),('4',10,'2023-04-01'),('5',0.5,'2023-03-21'),('6',90,'2023-06-18'),('7',200,'2023-07-21'),('8',80,'2023-04-04'),('9',120,'2023-09-11');
/*!40000 ALTER TABLE `precio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `productoID` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`productoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('1','Puerta de madera'),('10','Mesada de granito'),('2','Ventana de aluminio'),('3','Ventiluz de vidrio'),('4','Mosquitero de plástico'),('5','Tornillo de acero'),('6','Grifería cromada'),('7','Portón de hierro'),('8','Chapa de acero inoxidable'),('9','Espejo de cristal');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `producto_before_insert` BEFORE INSERT ON `producto` FOR EACH ROW BEGIN
    /*Registro de accion previa a la insercion,
	registrara el usuario, la fecha y hora antes de la insercion*/
    INSERT INTO producto_insert_log (accion, usuario, fecha, hora)
    VALUES ('Insert', USER(), CURDATE(), CURTIME());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `producto_after_insert` AFTER INSERT ON `producto` FOR EACH ROW BEGIN
    /*registro de accion posterior a la insercion,
    registrara el usuario, la fecha, la hora y el ID del producto insertado*/
    INSERT INTO producto_insert_log (accion, usuario, fecha, hora, productoID)
    VALUES ('Insert', USER(), CURDATE(), CURTIME(), NEW.productoID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `producto_insert_log`
--

DROP TABLE IF EXISTS `producto_insert_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_insert_log` (
  `logID` int NOT NULL AUTO_INCREMENT,
  `accion` varchar(10) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `productoID` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`logID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_insert_log`
--

LOCK TABLES `producto_insert_log` WRITE;
/*!40000 ALTER TABLE `producto_insert_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_insert_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `proveedorID` varchar(9) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `detalles` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`proveedorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES ('3001','Libermet SRL','Proveedor de materiales de construcción'),('3002','Don Pepe SA','Proveedor de equipos y herramientas'),('3003','Nino SRL','Proveedor de muebles y decoración'),('3004','Alvaro SRL','Proveedor de iluminación'),('3005','Quijote SA','Proveedor de metales'),('3006','Valo SRL','Proveedor de electrónica'),('3007','Fernandez HNOS','Proveedor de materiales eléctricos'),('3008','Mujica SA','Proveedor de mecanica'),('3009','Cacho INC','Proveedor de madera'),('3010','Juanito SRL','Proveedor de productos químicos');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor_producto`
--

DROP TABLE IF EXISTS `proveedor_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor_producto` (
  `proveedorID` varchar(9) NOT NULL,
  `productoID` varchar(15) NOT NULL,
  `precio` float NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`proveedorID`,`productoID`),
  KEY `productoID` (`productoID`),
  CONSTRAINT `proveedor_producto_ibfk_1` FOREIGN KEY (`proveedorID`) REFERENCES `proveedor` (`proveedorID`),
  CONSTRAINT `proveedor_producto_ibfk_2` FOREIGN KEY (`productoID`) REFERENCES `producto` (`productoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor_producto`
--

LOCK TABLES `proveedor_producto` WRITE;
/*!40000 ALTER TABLE `proveedor_producto` DISABLE KEYS */;
INSERT INTO `proveedor_producto` VALUES ('3001','1',1450,100),('3002','2',7000,150),('3003','3',4800,200),('3004','4',800,300),('3005','5',1200,5000),('3006','6',850,250),('3007','7',1900,80),('3008','8',750,120),('3009','9',1100,180),('3010','10',2400,50);
/*!40000 ALTER TABLE `proveedor_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `productoID` varchar(15) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_egreso` date NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`productoID`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`productoID`) REFERENCES `producto` (`productoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES ('1','2023-01-01','2023-01-10',100),('10','2023-01-01','2023-02-20',80),('2','2023-01-01','2023-01-15',200),('3','2023-01-01','2023-01-05',150),('4','2023-01-01','2023-01-20',300),('5','2023-01-01','2023-01-25',5000),('6','2023-01-01','2023-01-30',100),('7','2023-01-01','2023-02-05',50),('8','2023-01-01','2023-02-10',200),('9','2023-01-01','2023-02-15',300);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_compras_clientes`
--

DROP TABLE IF EXISTS `vista_compras_clientes`;
/*!50001 DROP VIEW IF EXISTS `vista_compras_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_compras_clientes` AS SELECT 
 1 AS `clienteID`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `producto`,
 1 AS `fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_productos_precios`
--

DROP TABLE IF EXISTS `vista_productos_precios`;
/*!50001 DROP VIEW IF EXISTS `vista_productos_precios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_productos_precios` AS SELECT 
 1 AS `productoID`,
 1 AS `nombre`,
 1 AS `precio`,
 1 AS `vigencia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_productos_proveedores`
--

DROP TABLE IF EXISTS `vista_productos_proveedores`;
/*!50001 DROP VIEW IF EXISTS `vista_productos_proveedores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_productos_proveedores` AS SELECT 
 1 AS `productoID`,
 1 AS `producto`,
 1 AS `proveedor`,
 1 AS `precio`,
 1 AS `cantidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_stock_total`
--

DROP TABLE IF EXISTS `vista_stock_total`;
/*!50001 DROP VIEW IF EXISTS `vista_stock_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_stock_total` AS SELECT 
 1 AS `productoID`,
 1 AS `nombre`,
 1 AS `stock_actual`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ventas_empleados`
--

DROP TABLE IF EXISTS `vista_ventas_empleados`;
/*!50001 DROP VIEW IF EXISTS `vista_ventas_empleados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ventas_empleados` AS SELECT 
 1 AS `empleadoID`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `total_ventas`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'comercio2'
--

--
-- Dumping routines for database 'comercio2'
--
/*!50003 DROP FUNCTION IF EXISTS `calcularPrecioPromedio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `calcularPrecioPromedio`(productoID VARCHAR(15)) RETURNS float
    DETERMINISTIC
BEGIN
    DECLARE avg_price FLOAT;
    SELECT AVG(precio) INTO avg_price
    FROM precio
    WHERE productoID = productoID;
    RETURN avg_price;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obtenerStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obtenerStock`(productoID VARCHAR(15)) RETURNS tinyint
    DETERMINISTIC
BEGIN
    DECLARE stock_actual TINYINT;
    SELECT COALESCE(stock, 0) INTO stock_actual
    FROM stock
    WHERE productoID = productoID;
    RETURN stock_actual;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ConsultaOrdenada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ConsultaOrdenada`(IN tablaNombre VARCHAR(255), IN campoOrden VARCHAR(255), IN ordenDireccion VARCHAR(4))
BEGIN
    SET @query = CONCAT('SELECT * FROM ', tablaNombre, ' ORDER BY ', campoOrden, ' ', ordenDireccion);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarEliminarRegistro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEliminarRegistro`(IN tablaNombre VARCHAR(255), IN accion VARCHAR(7), IN registroID VARCHAR(15))
BEGIN
 IF accion = 'INSERT' THEN
        /*Insertar un nuevo registro*/
        INSERT INTO tablaNombre (productoID) VALUES (registroID);
        SELECT 'Registro insertado en la tabla ', tablaNombre;
    ELSEIF accion = 'DELETE' THEN
        -- Eliminar un registro existente
        DELETE FROM tablaNombre WHERE productoID = registroID;
        SELECT 'Registro eliminado de la tabla ', tablaNombre;
    ELSE
        SELECT 'Acción no válida. Use "INSERT" o "DELETE".';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_compras_clientes`
--

/*!50001 DROP VIEW IF EXISTS `vista_compras_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_compras_clientes` AS select `c`.`clienteID` AS `clienteID`,`cl`.`nombre` AS `nombre`,`cl`.`apellido` AS `apellido`,`p`.`nombre` AS `producto`,`c`.`fecha` AS `fecha` from ((`compras` `c` join `producto` `p` on((`c`.`productoID` = `p`.`productoID`))) join `clientes` `cl` on((`c`.`clienteID` = `cl`.`clienteID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_productos_precios`
--

/*!50001 DROP VIEW IF EXISTS `vista_productos_precios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_productos_precios` AS select `p`.`productoID` AS `productoID`,`p`.`nombre` AS `nombre`,`precio`.`precio` AS `precio`,`precio`.`vigencia` AS `vigencia` from (`producto` `p` join `precio` on((`p`.`productoID` = `precio`.`productoID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_productos_proveedores`
--

/*!50001 DROP VIEW IF EXISTS `vista_productos_proveedores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_productos_proveedores` AS select `pp`.`productoID` AS `productoID`,`p`.`nombre` AS `producto`,`pr`.`nombre` AS `proveedor`,`pp`.`precio` AS `precio`,`pp`.`cantidad` AS `cantidad` from ((`proveedor_producto` `pp` join `producto` `p` on((`pp`.`productoID` = `p`.`productoID`))) join `proveedor` `pr` on((`pp`.`proveedorID` = `pr`.`proveedorID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_stock_total`
--

/*!50001 DROP VIEW IF EXISTS `vista_stock_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_stock_total` AS select `p`.`productoID` AS `productoID`,`p`.`nombre` AS `nombre`,coalesce(`s`.`stock`,0) AS `stock_actual` from (`producto` `p` left join (select `stock`.`productoID` AS `productoID`,sum(`stock`.`stock`) AS `stock` from `stock` group by `stock`.`productoID`) `s` on((`p`.`productoID` = `s`.`productoID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ventas_empleados`
--

/*!50001 DROP VIEW IF EXISTS `vista_ventas_empleados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ventas_empleados` AS select `ev`.`empleadoID` AS `empleadoID`,`e`.`nombre` AS `nombre`,`e`.`apellido` AS `apellido`,sum(`ev`.`plata_ventas`) AS `total_ventas` from (`empleados_ventas` `ev` join `empleados` `e` on((`ev`.`empleadoID` = `e`.`empleadoID`))) group by `ev`.`empleadoID`,`e`.`nombre`,`e`.`apellido` */;
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

-- Dump completed on 2023-11-17 10:07:14
