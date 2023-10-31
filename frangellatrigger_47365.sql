use comercio2;
/*tabla de registro de operaciones*/
CREATE TABLE producto_insert_log (
    logID INT AUTO_INCREMENT PRIMARY KEY,
    accion VARCHAR(10) NOT NULL,  
    usuario VARCHAR(50) NOT NULL, 
    fecha DATE NOT NULL,          
    hora TIME NOT NULL,           
    productoID VARCHAR(15)        
);

/*trigger before en la tabla producto*/
DELIMITER //
CREATE TRIGGER producto_before_insert
BEFORE INSERT ON producto
FOR EACH ROW
BEGIN
    /*Registro de accion previa a la insercion,
	registrara el usuario, la fecha y hora antes de la insercion*/
    INSERT INTO producto_insert_log (accion, usuario, fecha, hora)
    VALUES ('Insert', USER(), CURDATE(), CURTIME());
END;
//
DELIMITER ;

/*triggers de after en la tabla producto*/
DELIMITER //
CREATE TRIGGER producto_after_insert
AFTER INSERT ON producto
FOR EACH ROW
BEGIN
    /*registro de accion posterior a la insercion,
    registrara el usuario, la fecha, la hora y el ID del producto insertado*/
    INSERT INTO producto_insert_log (accion, usuario, fecha, hora, productoID)
    VALUES ('Insert', USER(), CURDATE(), CURTIME(), NEW.productoID);
END;
//
DELIMITER ;
