-- Usando la base de datos tienda, escribe consultas que permitan responder las siguientes preguntas.
USE tienda;

-- SESION 2, RETO 1 
-- 1. ¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT * FROM articulo WHERE nombre LIKE '%pasta%';

-- 2. ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT * FROM articulo WHERE nombre LIKE '%cannelloni%';

-- 3. ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT * FROM articulo WHERE nombre LIKE '% - %';

-- 4. ¿Qué puestos incluyen la palabra Designer?
SELECT * FROM puesto WHERE nombre LIKE "%designer%";

-- 5. ¿Qué puestos incluyen la palabra Developer?
SELECT * FROM puesto WHERE nombre LIKE "%developer%";


-- SESION 2, RETO 2
-- 1. ¿Cuál es el promedio de salario de los puestos?
SELECT avg(salario) FROM puesto;

-- 2. ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT count(*) FROM articulo WHERE nombre LIKE '%pasta%';

-- 3. ¿Cuál es el salario mínimo y máximo?
SELECT min(salario), max(salario) FROM puesto;

-- 4. ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT sum(salario) FROM puesto WHERE id_puesto > (SELECT max(id_puesto) - 5 FROM puesto);


-- SESION 2, RETO 3
-- 1. ¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre, count(*) FROM puesto GROUP BY nombre;

-- 2. ¿Cuánto dinero se paga en total por puesto?
SELECT nombre, sum(salario) FROM puesto GROUP BY nombre;

-- 3. ¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, count(clave) AS ventas FROM venta GROUP BY id_empleado;

-- 4. ¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, count(*) FROM venta GROUP BY id_articulo;


-- SESION 2, EJERCICIOS
-- 1. Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre empiece con a.
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE "a%";

-- 2. Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre termina con on.
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE "%on";

-- 3. Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre incluye la cadena on.
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE "%on%";

-- 4. Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyos nombres tienen tres letras e inician con T y finalizan con m.
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName LIKE "t_m";

-- 5. Dentro de la tabla employees, obten el número de empleado, apellido y nombre de todos los empleados cuyo nombre no inicia con B.
SELECT employeeNumber, lastName, firstName FROM employees WHERE firstName NOT LIKE "B%";

-- 6. Dentro de la tabla products, obten el código de producto y nombre de los productos cuyo código incluye la cadena _20.
SELECT productCode, productName FROM products WHERE productCode LIKE "%_20";

-- 7. Dentro de la tabla orderdetails, obten el total de cada orden.
SELECT orderNumber, (quantityOrdered * priceEach) AS Total FROM orderdetails;

-- 8. Dentro de la tabla orders obten el número de órdenes por año.
SELECT year(orderDate) AS Year, count(*) AS TotalOrders FROM orders GROUP BY YEAR(orderDate);

-- 9. Obten el apellido y nombre de los empleados cuya oficina está ubicada en USA.
SELECT lastName, firstName FROM employees WHERE officeCode IN(SELECT officeCode FROM offices WHERE country = "usa");

-- 10. Obten el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.
SELECT customerNumber, checkNumber, amount FROM payments order by amount DESC LIMIT 1;

-- 11. Obten el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio.
SELECT customerNumber, checkNumber, amount FROM payments WHERE amount > (SELECT AVG(amount) from payments);

-- 12. Obten el nombre de aquellos clientes que no han hecho ninguna orden.
SELECT customerName FROM customers WHERE customerNumber NOT IN(SELECT customerNumber FROM orders);

-- 13. Obten el máximo, mínimo y promedio del número de productos en las órdenes de venta.
SELECT max(quantityOrdered) AS Maximum, min(quantityOrdered) AS Miniumum, avg(quantityOrdered) AS Average FROM orderdetails;

-- 14. Dentro de la tabla orders, obten el número de órdenes que hay por cada estado.
SELECT status, count(status) FROM orders GROUP BY status;
