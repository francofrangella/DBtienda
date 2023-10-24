use comercio2;

/*funcion para calcular el precio promedio*/
DELIMITER //
CREATE FUNCTION calcularPrecioPromedio(productoID VARCHAR(15)) RETURNS FLOAT DETERMINISTIC
BEGIN
    DECLARE avg_price FLOAT;
    SELECT AVG(precio) INTO avg_price
    FROM precio
    WHERE productoID = productoID;
    RETURN avg_price;
END;
//
DELIMITER ;

/* funcion para obtener stock*/
DELIMITER //
CREATE FUNCTION obtenerStock(productoID VARCHAR(15)) RETURNS TINYINT DETERMINISTIC
BEGIN
    DECLARE stock_actual TINYINT;
    SELECT COALESCE(stock, 0) INTO stock_actual
    FROM stock
    WHERE productoID = productoID;
    RETURN stock_actual;
END;
//
DELIMITER ;

