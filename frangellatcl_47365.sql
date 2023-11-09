Use comercio2;
 /*transaccion para la tabla producto*/
START TRANSACTION;

/*eliminar algunos registros en la tabla producto*/
DELETE FROM producto WHERE productoID IN ('1', '2', '3');


/*ROLLBACK;*/


/*COMMIT;*/

/*transaccion para la tabla producto*/
START TRANSACTION;

/*insertar registros en la tabla producto*/
INSERT INTO producto (productoID, nombre) VALUES
    ('11', 'pala'),
    ('12', 'martillo'),
    ('13', 'destornillador'),
    ('14', 'llave francesa'),
    ('15', 'pico'),
    ('16', 'soldadora'),
    ('17', 'maza'),
    ('18', 'pegamento');

/*agregar SAVEPOINT*/
SAVEPOINT savepoint_4;

/*insertar mas registros en la tabla producto*/
INSERT INTO producto (productoID, nombre) VALUES
    ('19', 'tornillo'),
    ('20', 'clavo'),
    ('21', 'espatula'),
    ('22', 'lija'),
    ('23', 'pincel'),
    ('24', 'brocha'),
    ('25', 'cortina'),
    ('26', 'tiner');

/*agregar SAVEPOINT despues de la insercion*/
SAVEPOINT savepoint_8;

/*sentencia para eliminar el SAVEPOINT de los primeros 4 registros insertados*/
/*RELEASE SAVEPOINT savepoint_4;*/


/*sentencia para eliminar el SAVEPOINT de los últimos 4 registros*/
/*RELEASE SAVEPOINT savepoint_8;*/

/*ROLLBACK;*/


/*COMMIT;*/