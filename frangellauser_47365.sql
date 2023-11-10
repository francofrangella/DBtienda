USE comercio2;
/*usuario con permisos de solo lectura*/
CREATE USER 'pepito'@'localhost' IDENTIFIED BY 'contraseña123';

/*permisos de solo lectura*/
GRANT SELECT ON COMERCIO2.* TO 'pepito'@'localhost';

/*usuario con permisos de lectura, insercion y modificacion*/
CREATE USER 'pepita'@'localhost' IDENTIFIED BY 'contraseña321';

/*permisos de lectura, inserción y modificación*/
GRANT SELECT, INSERT, UPDATE ON COMERCIO2.* TO 'pepita'@'localhost';

