use COMERCIO2;
/*vista para los productos y su precio vigente*/
CREATE VIEW vista_productos_precios AS
SELECT p.productoID, p.nombre, precio.precio, precio.vigencia
FROM producto p
JOIN precio ON p.productoID = precio.productoID;


/* vista ventas empleados*/
CREATE VIEW vista_ventas_empleados AS
SELECT ev.empleadoID, e.nombre, e.apellido, SUM(ev.plata_ventas) AS total_ventas
FROM empleados_ventas ev
JOIN empleados e ON ev.empleadoID = e.empleadoID
GROUP BY ev.empleadoID, e.nombre, e.apellido;

/*vista compras clientes*/
CREATE VIEW vista_compras_clientes AS
SELECT c.clienteID, cl.nombre, cl.apellido, p.nombre AS producto, c.fecha
FROM compras c
JOIN producto p ON c.productoID = p.productoID
JOIN clientes cl ON c.clienteID = cl.clienteID;

/*vista para proveedoresy productos*/
CREATE VIEW vista_productos_proveedores AS
SELECT pp.productoID, p.nombre AS producto, pr.nombre AS proveedor, pp.precio, pp.cantidad
FROM proveedor_producto pp
JOIN producto p ON pp.productoID = p.productoID
JOIN proveedor pr ON pp.proveedorID = pr.proveedorID;

/*visto stock total*/
CREATE VIEW vista_stock_total AS
SELECT p.productoID, p.nombre, COALESCE(s.stock, 0) AS stock_actual
FROM producto p
LEFT JOIN (
    SELECT productoID, SUM(stock) AS stock
    FROM stock
    GROUP BY productoID
) s ON p.productoID = s.productoID;
