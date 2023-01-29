

SELECT producto.nombre FROM tienda.producto;
SELECT producto.nombre, producto.precio FROM tienda.producto;
SELECT * FROM tienda.producto;
SELECT producto.nombre, producto.precio, producto.precio*1.09 FROM tienda.producto;
SELECT producto.nombre AS "Nombre de producto", producto.precio AS "Precio en Euros", producto.precio*1.09 AS "Precio en USD" FROM tienda.producto;
SELECT UPPER(producto.nombre), producto.precio FROM tienda.producto;
SELECT LOWER(producto.nombre), producto.precio FROM tienda.producto;
SELECT fabricante.nombre, UPPER(LEFT(fabricante.nombre, 2)) FROM tienda.fabricante;
SELECT producto.nombre, ROUND(producto.precio) AS "Precio redondeado" FROM tienda.producto;
SELECT producto.nombre, FLOOR(producto.precio) AS "Precio truncado" FROM tienda.producto;
SELECT producto.codigo_fabricante FROM tienda.producto;
SELECT DISTINCT producto.codigo_fabricante FROM tienda.producto;
SELECT fabricante.nombre FROM tienda.fabricante ORDER BY fabricante.nombre ASC;
SELECT fabricante.nombre FROM tienda.fabricante ORDER BY fabricante.nombre DESC;
SELECT producto.nombre FROM tienda.producto ORDER BY producto.nombre ASC, producto.precio DESC;
SELECT * FROM tienda.fabricante LIMIT 5;
SELECT * FROM tienda.fabricante LIMIT 3, 2;
SELECT producto.nombre, producto.precio FROM tienda.producto ORDER BY producto.precio ASC LIMIT 1;
SELECT producto.nombre, producto.precio FROM tienda.producto ORDER BY producto.precio DESC LIMIT 1;
SELECT producto.nombre FROM tienda.producto WHERE producto.codigo_fabricante = 2;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM tienda.producto RIGHT JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, producto.nombre, producto.precio, fabricante.nombre FROM tienda.producto RIGHT JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.nombre IS NOT NULL ORDER BY fabricante.nombre ASC;
SELECT producto.codigo AS "Código producto", producto.nombre AS "Nombre producto", fabricante.codigo AS "Código fabricante", fabricante.nombre AS "Nombre fabricante" FROM tienda.producto RIGHT JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo ;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM tienda.producto RIGHT JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio DESC LIMIT 1;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM tienda.producto RIGHT JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio IS NOT NULL ORDER BY producto.precio ASC LIMIT 1;
SELECT producto.* FROM tienda.producto WHERE producto.codigo_fabricante IN ( SELECT fabricante.codigo FROM tienda.fabricante WHERE fabricante.nombre = "Lenovo");
SELECT producto.* FROM tienda.producto WHERE producto.codigo_fabricante IN ( SELECT fabricante.codigo FROM tienda.fabricante WHERE fabricante.nombre = "Crucial") AND producto.precio > 200;
SELECT producto.nombre, producto.precio, fabricante.nombre FROM tienda.producto RIGHT JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = "Asus" OR fabricante.nombre = "Seagate" OR fabricante.nombre = "Hewlett-Packard";
SELECT producto.* FROM tienda.producto WHERE producto.codigo_fabricante IN ( SELECT fabricante.codigo FROM tienda.fabricante WHERE fabricante.nombre = "Asus" OR fabricante.nombre = "Seagate" OR fabricante.nombre = "Hewlett-Packard");
SELECT producto.nombre, producto.precio FROM tienda.producto WHERE producto.codigo_fabricante IN ( SELECT fabricante.codigo FROM tienda.fabricante WHERE fabricante.nombre LIKE "%e");
SELECT producto.nombre, producto.precio FROM tienda.producto WHERE producto.codigo_fabricante IN ( SELECT fabricante.codigo FROM tienda.fabricante WHERE fabricante.nombre LIKE "%w%");
SELECT producto.nombre, producto.precio, fabricante.nombre FROM tienda.producto RIGHT JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio > 100 ORDER BY producto.precio DESC, producto.nombre ASC;
SELECT fabricante.nombre, fabricante.codigo FROM tienda.fabricante WHERE fabricante.codigo IN (SELECT producto.codigo_fabricante FROM tienda.producto);
SELECT fabricante.nombre, producto.nombre, producto.precio FROM tienda.producto RIGHT JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT fabricante.nombre, producto.nombre, producto.precio FROM tienda.producto RIGHT JOIN tienda.fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.codigo IS NULL;
SELECT producto.* FROM tienda.producto WHERE producto.codigo_fabricante IN ( SELECT fabricante.codigo FROM tienda.fabricante WHERE fabricante.nombre = "Lenovo");
SELECT producto.* FROM tienda.producto WHERE producto.precio IN (SELECT MAX(producto.precio) FROM tienda.producto WHERE producto.codigo_fabricante IN (SELECT fabricante.codigo FROM tienda.fabricante WHERE nombre="Lenovo"));
SELECT producto.nombre FROM tienda.producto WHERE producto.precio IN (SELECT MAX(producto.precio) FROM tienda.producto WHERE producto.codigo_fabricante IN (SELECT fabricante.codigo FROM tienda.fabricante WHERE nombre="Lenovo"));
SELECT producto.nombre FROM tienda.producto WHERE producto.precio IN (SELECT MIN(producto.precio) FROM tienda.producto WHERE producto.codigo_fabricante IN (SELECT fabricante.codigo FROM tienda.fabricante WHERE nombre="Hewlett-Packard"));
SELECT producto.* FROM tienda.producto WHERE producto.precio > (SELECT MAX(producto.precio) FROM tienda.producto WHERE producto.codigo_fabricante IN (SELECT fabricante.codigo FROM tienda.fabricante WHERE nombre="Lenovo"));


SELECT * FROM tienda.fabricante;
SELECT * FROM tienda.producto; 