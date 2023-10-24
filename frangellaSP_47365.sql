use comercio2;
    /* Este procedimiento te permite consultar una tabla especificada de forma ordenada.
tablaNombre: El nombre de la tabla que deseas consultar.
campoOrden: El nombre del campo por el cual deseas ordenar los resultados.
ordenDireccion: La direccion del ordenamiento ('ASC' para ascendente, 'DESC' para descendente)*/
DELIMITER //
CREATE PROCEDURE ConsultaOrdenada(IN tablaNombre VARCHAR(255), IN campoOrden VARCHAR(255), IN ordenDireccion VARCHAR(4))
BEGIN
    SET @query = CONCAT('SELECT * FROM ', tablaNombre, ' ORDER BY ', campoOrden, ' ', ordenDireccion);
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END;
//
DELIMITER ;

    /*Este procedimiento te permite insertar o eliminar un registro especifico en una tabla.
tablaNombre: El nombre de la tabla en la que deseas realizar la accion.
accion: La accion a realizar ('INSERT' para insertar, 'DELETE' para eliminar).
registroID: El ID del registro que deseas insertar o eliminar*/
DELIMITER //
CREATE PROCEDURE InsertarEliminarRegistro(IN tablaNombre VARCHAR(255), IN accion VARCHAR(7), IN registroID VARCHAR(15))
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
END;
//
DELIMITER ;

/*Ejemplo de consulta ordenada ascendente en la tabla producto*/
CALL ConsultaOrdenada('producto', 'productoID', 'ASC');

/*Ejemplo de consulta ordenada (descendente) en la tabla empleados*/
CALL ConsultaOrdenada('empleados', 'nombre', 'DESC');

/*Ejemplo de insercion de un registro en la tabla stock*/
CALL InsertarEliminarRegistro('stock', 'INSERT', '11');

/*Ejemplo de eliminación de un registro en la tabla clientes*/
CALL InsertarEliminarRegistro('clientes', 'DELETE', '2003');


