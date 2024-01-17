use apazon;
select * from clientes;
describe productos;
describe clientes;
insert into productos(DESCRIPCION,CATEGORIA,PRECIO,ORIGEN,FAMILIA) values
('MICROONDAS 900W','MEDIA',100.00,'NEPAL','ELECTRODOMESTICO'),
('FRIGORIFICO COMBI 2P','ALTA',1542.00,'TOMELLOSO','ELECTRODOMESTICO'),
('LAVADORA CARGA SUPERIOR','MEDIA',575.00,'NEPAL','ELECTRODOMESTICO'),
('FUENTE ENSALADA GR','BAJA',25.00,'ARANJUEZ','MENAJE');
delete from productos where categoria="MEDIA"; /*  NO SE PUEDE ELIMINAR PORQUE HAY DOS PREODUCTOS CON CATEGORIA MEDIA*/
use apazon;
DESCRIBE COMPRA;
INSERT INTO compra(CODCLI,CODPRO,CANTIDAD,TIENDA,VENDEDOR)VALUES
(1,4,2,'APAZON','MANOLITO'),
(3,1,1,'STORE','AZA'),
(4,2,3,'FRIGORIFICOS','DAVID'),
(5,3,1,'LAVADORAS','ROBERT');
select count(*)from productos; /*para que salgan todos los registros  */
select count(*) as NUM_PRODUCTOS FROM PRODUCTOS; /* NOMBRAMOS LA LISTA DE NUMERO DE PRODUCTOS*/
SELECT SUM(PRECIO)FROM PRODUCTOS; /* SUMA EL PRECIO DE LOS PRODUCTOS*/

SELECT FAMILIA, AVG(PRECIO) FROM PRODUCTOS GROUP BY FAMILIA; /*QUIUERO QUE ME SAQUE LA MEDIA DE EL GRUPO DE FAMILIA DE FAMILIA Y PRECIO*/
SELECT ORIGEN, AVG(PRECIO) FROM PRODUCTOS GROUP BY ORIGEN; /*YO QUIERO QUE ME AGRUPE LOS PRODUCTOS QUE SON DE ORIGEN COMUN POR EJEMPLO*/

select distinct(FAMILIA) FROM PRODUCTOS;/*QUIERO SABER CUANTAS FAMILIAS DE PRODUCTOS TENGO EN ESE CASO TENGO 2 Y SE VEN LOS NOMBRES QUE SON ELECTRODOMESTICOS Y MENAJE  */

SELECT COUNT(distinct(FAMILIA)) FROM PRODUCTOS;/*QUIERO SABER CUANTAS FAMILIAS DE PRODUCTOS TENGO EN ESE CASO TENGO 2  CUANDO AÑADIMOS EL COUNT CONTAMOS LAS FAMILIAS EN NUMERO*/

SELECT DESCRIPCION, CATEGORIA FROM PRODUCTOS order by DESCRIPCION ASC;/*QUIERO QUE ME SALGAN LOS PRODUCTOS Y LA CATEGORIA PERO QUE ME SALGA ORDENADO ASCENDENTE ME LO ORDENA ALFABETICAMNTE*/

SELECT DESCRIPCION, CATEGORIA FROM PRODUCTOS order by DESCRIPCION DESC;/*QUIERO QUE ME SALGAN LOS PRODUCTOS Y LA CATEGORIA PERO QUE ME SALGA ORDENADO DESCENDENTE ME LO ORDENA ALFABETICAMNTE*/

SELECT DESCRIPCION, CATEGORIA FROM PRODUCTOS order by DESCRIPCION ASC LIMIT 2; /* LIMITAMOS A 2*/

SELECT *FROM CLIENTES;
SELECT APELLIDOS1,APELLIDOS2,NOMBRE CONCAT(APELLIDO1,' ',APELLIDO2,' ',NOMBRE)AS EMPLEADO FROM CLIENTES ORDER BY EMPLEADO ASC;/* CREAMOS UN CAMPO SIN QUE EXISTA PARA CONCATENAR LO QUE QUEREMOS QUE REPRESENTE Y LUEGO LO ORDENAMOS PORORDEN ASCENDENTE */

SELECT*FROM PRODUCTOS;
SELECT DESCRIPCION,PRECIO AS PRECIO_UNI,(PRECIO*0.21) AS PRODUCTOS_CON_IVA,PRECIO*1,21 AS PVP FROM PRODUCTOS ORDER BY PVP;/* NOMBRAMOS COLUMNAS, SACAMOS IVA DEL 21 POR CIENTO*/





