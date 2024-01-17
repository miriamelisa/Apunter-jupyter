create database JARDINERIA;
use JARDINERIA;
select *fromalumnosequiposestadisticaspartidoscontenido cliente;
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


/*numero de clientes por pais-- con el count sumamos los clientes por pais*/
select pais,count(*) from cliente group by pais;


/*clientes que tienen un credio mayor de 100 mil y menor de 70mil*/
select nombre_cliente, limite_credito from cliente where limite_credito>100000 or limite_credito<70000 order by limite_credito ASC;


/*clientes que tienen un credio mayor de 100 mil y menor de 70mil  qeu aparezca ciudad y de pais=españa  ademas añadimos pais USA   */
select nombre_cliente, limite_credito,pais,ciudad from cliente where (limite_credito>100000 or limite_credito<70000) and (pais="Spain" or pais="USA") order by limite_credito ASC;

/* MEDIA DE CREDITO POR PAIS*/   /* utilizamos la columna del pais y eñl limite de credito
pero como queremoos la media del credito por pais añadimos contador que es ROUND con la media que es AVG   despues le damos nombre
colocamos la columnA de donde sale que es cliente 
lo agrupamos por pais y ordenamos ola media en orden descente */
select pais, round(AVG(limite_credito)) as MEDIA_DE_CREDITO_POR_PAIS from cliente group by pais order by MEDIA_DE_CREDITO_POR_PAIS desc;


/* unimos la tabla cliente y la tabla empleados   codigo_empleado_rep_ventas */
select *from cliente; 
select *from empleado;
/* unimos las dos tablas con INNER JOIN en (codigo en el que coinciden) */
select*from cliente inner join empleado on codigo_empleado_rep_ventas = codigo_empleado;

/*  nombre de cliente, pais, la ciudad y el nombre del empelado y la oficina*/
select nombre_cliente,pais,ciudad,nombre,codigo_oficina 
from cliente inner join empleado on codigo_empleado_rep_ventas = codigo_empleado;

/*  nombre de cliente, pais, la ciudad y el nombre del empelado y la oficina    ademas cuantos clientes tengo por oficina*/
select nombre_cliente,pais,ciudad,nombre,codigo_oficina,count(nombre_cliente) as clientes_por_oficina 
from cliente inner join empleado on codigo_empleado_rep_ventas = codigo_empleado 
group by codigo_oficina having clientes_por_oficina>5
order by clientes_por_oficina;

/*  nombre de cliente, pais, la ciudad y el nombre del empelado y la oficina + de cinco oficina*/
select codigo_oficina,count(nombre_cliente) as numero 
from cliente inner join empleado on codigo_empleado_rep_ventas = codigo_empleado 
group by codigo_oficina having numero>5;

/*cuantos clientes por oficina hay en cada pais*/
select codigo_oficina,pais, count(nombre_cliente) as nclientesxoficina_pais
clientefrom cliente inner join empleado on codigo_empleado_rep_ventas = codigo_empleado 
group by pais;
select *from cliente; 
select *from empleado;
select *from oficina;
select*from cliente inner join empleado on codigo_empleado_rep_ventas = codigo_empleado inner join oficina on empleado.codigo_oficina = oficina.codigo_oficina;

/* ademas quiero que me salga pais de la tabla oficina + la ciudad de la tabla oficina + contar */
select oficina.pais,oficina.ciudad,count(*) as paisxciudad
from cliente inner join empleado on codigo_empleado_rep_ventas = codigo_empleado inner join oficina on empleado.codigo_oficina = oficina.codigo_oficina 
group by oficina.pais,oficina.ciudad;

update productos set categoria='utencilios';
update productos set categoria='silla' where categoria LIKE 'silla%';

insert into empleados values ('12345678' 'raquel', 'dias', 'gracia', 'infante', null,
'madrid', 'madrid', '23454','M', '10-11-1997');

insert into  emplado add salario decimal unique alter apellido2;
alter table empleaado add trabajo varchar (20) unique after salario,
DELETE from universidad where uni-cod,
alter table empleados modify nombrevarchart(10) null,
alter table empleados modify direc1 varchar(40);
alter table empleados drop primary key,
alter table empleados add primary key(nombre,apellido1, apelllido2);



