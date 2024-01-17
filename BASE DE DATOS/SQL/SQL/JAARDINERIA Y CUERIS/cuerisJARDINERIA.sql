create database JARDINERIA;
use JARDINERIA;
select *from cliente;
select *from empleado;
describe empleado;
/* 2 PRIMERAS LETRAS DEL NOMBRE, EXTENSIO,3 PRIMERAS LETRAS DE OFICICNA Y LLAMAELO CODIGO ACCESO */
select concat (LEFT(NOMBRE,3),(EXTENSION),LEFT(CODIGO_OFICINA,3)) as CODIGO_ACCESO FROM EMPLEADO;

/*NUEVO CORREO: NOMBRE.PRIMERAPELLIDO@BOSQUESHUMEDOS.COM SE LLAMA NUEVO CORREO */
select lcase(CONCAT(NOMBRE,".",APELLIDO1,"@BOSQUESHUMEDOS.COM")) as NUEVO_CORREO FROM EMPLEADO;

/*NOMBRE Y LA EXTENSION DE LOS REPRESENTANTES DE VENTAS */
select nombre,extension from empleado WHERE PUESTO="Representante ventas";

/*NOMBRE Y LA EXTENSION DE LOS REPRESENTANTES DE VENTAS y director de oficinas */
select nombre,extension from empleado WHERE PUESTO="Representante ventas" or puesto="Director Oficina";

/* cuantos representantes de venta tengo*/
SELECT puesto,COUNT(*) AS NUMERO_EMPLEADO from empleado WHERE PUESTO="Representante ventas";

/*CUANTOS HAY DE CADA PUESTO*/
SELECT distinct(PUESTO)FROM EMPLEADO;/* FORMA DE SABER LOS VALORES UNICOS 	UE HAY EN UN CAMPO CON EL DISTINCT: VALORES DISTINTOS QUE HAY EN ESTE CAMPO*/
SELECT PUESTO,COUNT(*) AS NUMERO FROM EMPLEADO group by PUESTO;

/* QUIERO FILTRAR Y QUE ME SALGA LOS GRUPOS QUE SEAN MAYORES DE 1      HAVING ES EL FILTRO DE GROPU BY ENTONCES COLOCAMOS EL NOMBRE DE LA TABLA A SELECCIONAR PARA QUE SEA MAYOR QUE UNO*/
SELECT PUESTO,COUNT(*) AS NUMERO FROM EMPLEADO group by PUESTO having NUMERO>1;

/*APELLIDO1, APELLIDO2, DE TODOS LOS REPRESETNATES DE VENTAAS DE MADRID*/
select codigo_oficina, count(*) as numero from empleado where(codigo_oficina="MAD-ES" OR codigo_oficina="bcn-es") and PUESTO="Representante ventas" group by codigo_oficina order by codigo_oficina desc limit 1;



select *from producto;
/*nombre del producto, (candidad por precio) y mirar cuanto hay en stock*/
select nombre,(cantidad_en_stock*precio_venta) from producto order by cantidad_en_stock;

/*Aprecio medio de proveedoor por gama con dos decimales*/
select gama,round(avg(precio_proveedor),2) from producto group by gamaautoreditorial;

/*cuantos productos hay por gama*/
SELECT gama,count(*) from producto group by gama;

/*cuantas gamas hay*/
SELECT distinct(gama) from producto;

/*suma total del valor de stock*/
select SUM(cantidad_en_stock*precio_venta)FROM PRODUCTO;




