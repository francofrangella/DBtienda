CREATE SCHEMA comercio;
USE comercio;
CREATE TABLE producto(
productoID VARCHAR(15) NOT NULL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

CREATE TABLE precio(
productoID VARCHAR(15) NOT NULL,
precio FLOAT NOT NULL,
vigencia DATE, 

PRIMARY KEY (productoID),
FOREIGN KEY (productoID) REFERENCES producto (productoID)
);

CREATE TABLE stock(
productoID VARCHAR(15) NOT NULL,
fecha_ingreso DATE NOT NULL,
fecha_egreso DATE NOT NULL,
stock TINYINT NOT NULL,

PRIMARY KEY (productoID),
FOREIGN KEY (productoID) REFERENCES producto (productoID)
);

CREATE TABLE empleados(
empleadoID VARCHAR(9) NOT NULL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellido VARCHAR(50) NOT NULL,
email VARCHAR(120) NOT NULL

);

CREATE TABLE empleados_ventas(
empleadoID VARCHAR(9) NOT NULL,
productoID VARCHAR(15) NOT NULL,
plata_ventas FLOAT NULL,
cantidad_ventas INT NULL,

PRIMARY KEY (empleadoID, productoID),
FOREIGN KEY (empleadoID) REFERENCES empleados (empleadoID),
FOREIGN KEY (productoID) REFERENCES producto (productoID)
);

CREATE TABLE clientes(
clienteID VARCHAR(9) NOT NULL PRIMARY KEY,
nombre VARCHAR (50) NOT NULL,
apellido VARCHAR (50) NOT NULL,
direccion VARCHAR (100) NOT NULL
);

CREATE TABLE compras(
productoID VARCHAR(15) NOT NULL,
empleadoID VARCHAR(9) NOT NULL,
clienteID VARCHAR(9) NOT NULL,
fecha DATETIME,

PRIMARY KEY(productoID, empleadoID, clienteID),
FOREIGN KEY (productoID) REFERENCES producto (productoID),
FOREIGN KEY (empleadoID) REFERENCES empleados (empleadoID),
FOREIGN KEY (clienteID) REFERENCES clientes (clienteID)
);

CREATE TABLE envio(
productoID VARCHAR(15) NOT NULL,
clienteID VARCHAR(9) NOT NULL,
fecha_salida DATETIME,
fecha_llegada DATETIME,

PRIMARY KEY(productoID, clienteID),
FOREIGN KEY (productoID) REFERENCES producto (productoID),
FOREIGN KEY (clienteID) REFERENCES clientes (clienteID)
);

CREATE TABLE proveedor(
proveedorID VARCHAR(9) NOT NULL PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
detalles VARCHAR(250) NULL
);

CREATE TABLE proveedor_producto(
proveedorID VARCHAR (9) NOT NULL,
productoID VARCHAR(15) NOT NULL,
precio FLOAT NOT NULL,
cantidad INT NOT NULL,

PRIMARY KEY (proveedorID, productoID),
FOREIGN KEY (proveedorID) REFERENCES proveedor (proveedorID),
FOREIGN KEY (productoID) REFERENCES producto (productoID)
);
