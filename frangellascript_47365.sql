USE COMERCIO2;

INSERT INTO producto (productoID, nombre)
VALUES
    ('1', 'Puerta de madera'),
    ('2', 'Ventana de aluminio'),
    ('3', 'Ventiluz de vidrio'),
    ('4', 'Mosquitero de plástico'),
    ('5', 'Tornillo de acero'),
    ('6', 'Grifería cromada'),
    ('7', 'Portón de hierro'),
    ('8', 'Chapa de acero inoxidable'),
    ('9', 'Espejo de cristal'),
    ('10', 'Mesada de granito');
    

INSERT INTO precio (productoID, precio, vigencia)
VALUES
    ('1', 150.00, '2023-05-01'),
    ('2', 75.00, '2023-10-25'),
    ('3', 50.00, '2023-02-12'),
    ('4', 10.00, '2023-04-01'),
    ('5', 0.50, '2023-03-21'),
    ('6', 90.00, '2023-06-18'),
    ('7', 200.00, '2023-07-21'),
    ('8', 80.00, '2023-04-04'),
    ('9', 120.00, '2023-09-11'),
    ('10', 250.00, '2023-01-25');
    

INSERT INTO stock (productoID, fecha_ingreso, fecha_egreso, stock)
VALUES
    ('1', '2023-01-01', '2023-01-10', 100),
    ('2', '2023-01-01', '2023-01-15', 200),
    ('3', '2023-01-01', '2023-01-05', 150),
    ('4', '2023-01-01', '2023-01-20', 300),
    ('5', '2023-01-01', '2023-01-25', 5000),
    ('6', '2023-01-01', '2023-01-30', 100),
    ('7', '2023-01-01', '2023-02-05', 50),
    ('8', '2023-01-01', '2023-02-10', 200),
    ('9', '2023-01-01', '2023-02-15', 300),
    ('10', '2023-01-01', '2023-02-20', 80);
    
INSERT INTO empleados (empleadoID, nombre, apellido, email)
VALUES
    ('1001', 'Juan', 'Perez', 'juan@gmail.com'),
    ('1002', 'María', 'Gomez', 'maria@gmail.com'),
    ('1003', 'Carlos', 'Lopez', 'carlos@gmail.com'),
    ('1004', 'Laura', 'Martinez', 'laura@gmail.com'),
    ('1005', 'Pedro', 'Rodriguez', 'pedro@gmail.com'),
    ('1006', 'Ana', 'Sanchez', 'ana@gmail.com'),
    ('1007', 'Luis', 'Fernandez', 'luis@gmail.com'),
    ('1008', 'Eva', 'Garcia', 'eva@gmail.com'),
    ('1009', 'Miguel', 'Diaz', 'miguel@gmail.com'),
    ('1010', 'Carmen', 'Torres', 'carmen@gmail.com');


INSERT INTO empleados_ventas (empleadoID, productoID, plata_ventas, cantidad_ventas)
VALUES
    ('1001', '1', 1500.00, 10),
    ('1002', '2', 750.00, 5),
    ('1003', '3', 500.00, 7),
    ('1004', '4', 100.00, 20),
    ('1005', '5', 5.00, 100),
    ('1006', '6', 900.00, 8),
    ('1007', '7', 2000.00, 2),
    ('1008', '8', 800.00, 10),
    ('1009', '9', 1200.00, 6),
    ('1010', '10', 2500.00, 4);
    

INSERT INTO clientes (clienteID, nombre, apellido, direccion)
VALUES
    ('2001', 'Luis', 'Gonzalez', 'Bermejo 1232'),
    ('2002', 'Maria', 'Sanchez', 'Casacuberta 435'),
    ('2003', 'Pedro', 'Martinez', 'Pehuajo 4574'),
    ('2004', 'Laura', 'Fernandez', 'Panama 798'),
    ('2005', 'Carlos', 'Lopez', 'Quindio 980'),
    ('2006', 'Ana', 'Torres', 'Lamadrid 23525'),
    ('2007', 'Juan', 'Diaz', 'Linares 14445'),
    ('2008', 'Eva', 'Garcia', 'Fragio 223'),
    ('2009', 'Miguel', 'Soto', 'Uruguay 580'),
    ('2010', 'Carmen', 'Rivera', 'Timoteo 43');
    

INSERT INTO compras (productoID, empleadoID, clienteID, fecha)
VALUES
    ('1', '1001', '2001', '2023-01-10 08:15:30'),
    ('2', '1002', '2002', '2023-01-15 14:30:45'),
    ('3', '1003', '2003', '2023-01-20 12:00:00'),
    ('4', '1004', '2004', '2023-01-25 10:45:30'),
    ('5', '1005', '2005', '2023-02-01 16:20:15'),
    ('6', '1006', '2006', '2023-02-05 09:30:00'),
    ('7', '1007', '2007', '2023-02-10 11:55:30'),
    ('8', '1008', '2008', '2023-02-15 14:45:15'),
    ('9', '1009', '2009', '2023-02-20 17:10:45'),
    ('10', '1010', '2010', '2023-02-25 08:30:30');
    
  
INSERT INTO envio (productoID, clienteID, fecha_salida, fecha_llegada)
VALUES
    ('1', '2001', '2023-01-12 10:00:00', '2023-01-14 15:30:00'),
    ('2', '2002', '2023-01-16 09:45:00', '2023-01-19 12:15:00'),
    ('3', '2003', '2023-01-21 11:30:00', '2023-01-24 16:00:00'),
    ('4', '2004', '2023-01-26 14:45:00', '2023-01-29 09:30:00'),
    ('5', '2005', '2023-02-02 12:30:00', '2023-02-04 17:45:00'),
    ('6', '2006', '2023-02-06 10:15:00', '2023-02-09 15:00:00'),
    ('7', '2007', '2023-02-11 13:30:00', '2023-02-13 10:15:00'),
    ('8', '2008', '2023-02-16 15:45:00', '2023-02-19 09:00:00'),
    ('9', '2009', '2023-02-21 09:30:00', '2023-02-23 14:45:00'),
    ('10', '2010', '2023-02-26 11:15:00', '2023-02-28 16:30:00');
    
    

INSERT INTO proveedor (proveedorID, nombre, detalles)
VALUES
    ('3001', 'Libermet SRL', 'Proveedor de materiales de construcción'),
    ('3002', 'Don Pepe SA', 'Proveedor de equipos y herramientas'),
    ('3003', 'Nino SRL', 'Proveedor de muebles y decoración'),
    ('3004', 'Alvaro SRL', 'Proveedor de iluminación'),
    ('3005', 'Quijote SA', 'Proveedor de metales'),
    ('3006', 'Valo SRL', 'Proveedor de electrónica'),
    ('3007', 'Fernandez HNOS', 'Proveedor de materiales eléctricos'),
    ('3008', 'Mujica SA', 'Proveedor de mecanica'),
    ('3009', 'Cacho INC', 'Proveedor de madera'),
    ('3010', 'Juanito SRL', 'Proveedor de productos químicos');



INSERT INTO proveedor_producto (proveedorID, productoID, precio, cantidad)
VALUES
    ('3001', '1', 1450.00, 100),
    ('3002', '2', 7000.00, 150),
    ('3003', '3', 4800.00, 200),
    ('3004', '4', 800.00, 300),
    ('3005', '5', 1200.00, 5000),
    ('3006', '6', 850.00, 250),
    ('3007', '7', 1900.00, 80),
    ('3008', '8', 750.00, 120),
    ('3009', '9', 1100.00, 180),
    ('3010', '10', 2400.00, 50);
    






