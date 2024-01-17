USE PRUEBAS;
/*   CREAR UNA TABLA PRODUCTOS(CODIGO,NOMBRE,PVP*/
CREATE TABLE PRODUCTOS(
COD INT primary key auto_increment,
NOMBRE CHAR (50),
PVP double
);
/*#####commandos tcl que controlan las transacciones de datos######*/
set sql_safe_updates=0;/*permite SI SON VARIOS*/
set sql_safe_updates=1;/*no permite  BORRADO Y ACTULIZACION*/ 
SET AUTOCOMMIT=0;/*AHORA QUIERO QUE ESTES ATENTO, aun no se guarda*/
SET AUTOCOMMIT=1;/*esta ahciendo todo de verdad*/
sTART tRANSACTION;
BEGIN;/*CON ESTO LAS ESTRUCTURAS O LO QUE HAGAS E TE GRABA DE VERDDAD*/
/* COMANDO*/ SAVEPOINT INSERCION; /*PUNTO DE GRABACION DE LOS ACTUALIZADOS PONER TODOS LOS QUE QUEIRAS GUARDAR PUNTO*/
rollback;/*VOLVER atras hast aantes del ultimo commit*/
rollback to savepoint insercion; /*volver añl ultimo punto de grabacion*/
/*####################*/

/* INSERTAR 5 PRODUCTOS */
INSERT INTO PRODUCTOS(NOMBRE,PVP) VALUES ("manzana","3.20"),("pera","2.10"),("mandarina","4.30"),("platano","2.60"),("kiwi","4.50");
SELECT*FROM PRODUCTOS;
/*  CREAR UN SET POINT QUE SE LLAMARA INSERCION*/
SET AUTOCOMMIT=0;
SAVEPOINT NUEVOSPRODUCTOS;
/*  AÑADIMOS CINCO MAS 5*/
INSERT INTO PRODUCTOS(NOMBRE,PVP) VALUES ("BERENGENA","3.90"),("PIMIENTO","3.10"),("PATATAS","1.90"),("CALABACIN","3.60"),("TOMATE","9.50");
SELECT*FROM PRODUCTOS;
/*   ACTUALIZAMOS EL PVP QUE TENGAN UNA A EN el nombre*/
set sql_safe_updates=0;
update productos set pvp =500 where nombre like '%a%';
SELECT*FROM PRODUCTOS;
/* crear savepoint actualizacion */
SAVEPOINT CAMBIOSPRECIO;
/* crear un fichero separdo por puntos y comas en D que se llamara actualizado*/
select*from productos INTO outfile'D:/PRODUCTOSACTUALIZADOS.txt'
fields terminated BY ';'
lines terminated by '/n'; /* ME ESTOY DESCARGANDSO LA TABLA ACTUALIZADOS EN UN TXT EN EL ORDENADOR*/
/* crear un fichero separado por puntos y comas en D que se llamara insertados ROLBAG*/
rollback to savepoint NUEVOSPRODUCTOS;
select*from productos INTO outfile'D:/INSERTADOSROLLBAG.txt'
fields terminated BY ';';
/*  DEJA LA TABLA BACIA SIN BORRAR REGISTROS*/


