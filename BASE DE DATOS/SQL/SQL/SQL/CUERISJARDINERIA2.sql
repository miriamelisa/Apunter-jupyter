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
select *from detalle_pedido;
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


/* DISTINTOS ESTADOS por los QUE PUEDE PASAR DE UN PEDIDO */
select *from detalle_pedido;
select *from pedido;
select distinct(estado) from pedido;
select estado from pedido group by estado;

/*LISTADO DE TODOS LOS PEDIDOS REALIZADOS EN 2009  */
select codigo_pedido,fecha_pedido from pedido where year(fecha_pedido)='2009';
select codigo_pedido,year(fecha_pedido),estado from pedido where year(fecha_pedido)='2009' and estado='Rechazado';

/* PAGOS EN EL 2008 MENDIANTE PAYPAL ORDENADRLO D EMAYOR A MENOR*/
select *from pago;
select codigo_cliente,id_transaccion,forma_pago,fecha_pago from pago where year(fecha_pago)='2008' and forma_pago='PayPal';

/* NOMBRE DEL CLIENTE, + NOMBRE Y APOELLIDO DE SU REPRESENTANTE DE VENTAS*/
select *from cliente;
select *from empleado;
select nombre_cliente,nombre,apellido1,puesto from cliente inner join empleado on codigo_empleado_rep_ventas = codigo_empleado
 where puesto='Representante Ventas';
/* LISTA DE OFICINAS QUE TENGAN CLIENtES EN FUENLABRADA*/
select *from oficina; codigo_oficina,ciudad
select *from empleado;
select *from cliente; ciudad

select cliente.ciudad,oficina.linea_direccion1,oficina.ciudad
from cliente inner join empleado on codigo_empleado_rep_ventas = codigo_empleado
inner join oficina on oficina.codigo_oficina=empleado.codigo_oficina
where cliente.ciudad='Fuenlabrada';

/*LISTADO DEL NOMBRE DE LOS CLIENTES A LOS QUE NO SE LES HAYA ENTREGADO A TIEMPO UN PEDIDO*/
select*from pedido;
select *from cliente;
select nombre_cliente,pedido.codigo_cliente,fecha_esperada,fecha_entrega,estado from pedido inner join cliente on pedido.codigo_cliente=cliente.codigo_cliente 
where fecha_esperada<fecha_entrega and estado='Entregado';


/*LISTADO QUE MUESTRE LOS CLIENTES QUE NO HAN REALIZADO NINGUN PAGO*/
select*from pago;
select*from pedido;
select codigo_cliente,estado from pago;

select nombre_cliente,codigo_cliente from cliente where codigo_cliente 
not in (select codigo_cliente from pago);

select nombre_cliente,pedido.codigo_cliente,estado,codigo_pedido from cliente inner join pedido on cliente.codigo_cliente=pedido.codigo_cliente where cliente.codigo_cliente 
not in (select codigo_cliente from pago);
/*LISTA QUE MUIESTRE LOS CLIENTES QUE NO HAN REALIZADO NINGUN PEDIDO*/

select*from pedido;
select *from cliente;

select codigo_cliente,nombre_cliente from cliente where codigo_cliente 
not in (select codigo_cliente from pedido);


/*CUANTOS EMPLEADOS HAY EN LA COMPAÑIA*/

select count(*)from empleado;

/* PRECIO DEL PRODUCTO MAS CARO Y MAS BARATO EN LA MISMA LISTA*/
select*from producto order by precio_venta asc;

select nombre, max(precio_venta), min(precio_venta) from producto;

select nombre, min(precio_venta) from producto
union
select nombre, max(precio_venta) from producto;

create table HERRAMIENTAS AS (SELECT * FROM producto where gama='Herramientas');

select*from HERRAMIENTAS INTO outfile'D:/herramientas.txt'
fields terminated BY ';'
lines terminated by '/n'; /*YO ME ESTOY DESCARGANDSO HERRRAMIENTAS EN UN TXT EN EL ORDENADOR*/

/*EL NOMBRE DE EMPLEADO Y EL CODIGO DE su JEFE */
select *from empleado;


SELECT nombre,codigo_jefe,puesto from empleado where codigo_jefe
in (select nombre from empleado);

