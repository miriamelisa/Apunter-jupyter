use JARDINERIA;
select *from cliente;

SELECT distinct(pais)FROM cliente;
select count(*) from cliente;

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
from cliente inner join empleado on codigo_empleado_rep_ventas = codigo_empleado 
group by pais;
select *from cliente; 
select *from empleado;
select *from oficina;
select*from cliente inner join empleado on codigo_empleado_rep_ventas = codigo_empleado inner join oficina on empleado.codigo_oficina = oficina.codigo_oficina;

/* ademas quiero que me salga pais de la tabla oficina + la ciudad de la tabla oficina + contar */
select oficina.pais,oficina.ciudad,count(*) as paisxciudad
from cliente inner join empleado on codigo_empleado_rep_ventas = codigo_empleado inner join oficina on empleado.codigo_oficina = oficina.codigo_oficina 
group by oficina.pais,oficina.ciudad;


/*  */


/*  */

/*  */





