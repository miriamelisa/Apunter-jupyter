describe clientes;
INSERT INTO CLIENTES (NOMBRE, APELLIDOS1, APELLIDOS2, FECHANACIMIENTO, TLF,EMAIL,NIF,DIRECCION,CODIGOPOSTAL) VALUES
("MIRI","COLLAGUAZO", "GUANOLEMA", "1978/10/10", "603385235", "miriam.guanolema1@gmail.com", "1719021", "C/MIRLO 12 3B", 28021),
("ELISA","NARVAEZ", "LOPEZ", "19756/08/05", "60336666", "NARVAEZ11@gmail.com", "1718234", "C/SANCHEZ 56 5B", 28022),
("LUIS","BELTRE", "CARMONA", "1998/06/05", "60555555", "ANGLEBELTRE@gmail.com", "1189421", "C/LOPEZ 60 2B", 23021),
("FER","EVANGELISTA", "ARANDA", "1996/05/01", "60111111", "SANCRISFERNANDO@gmail.com", "1455631", "C/PUERTO RICO 17 3L", 24018),
("NICOLE","SOLEDISPA", "IÑIGA", "1968/03/10", "603385665", "NICOLESOLEDISPA@gmail.com", "173546", "C/MIRLO 12 3B", 230554)
;
SELECT * FROM CLIENTES; /*    despliega la tabBLA CON LOS VALUES*/
DELETE FROM CLIENTES WHERE CODC="2";/* BORRAR REGISTRO CON CODIGO   DELETE TRUNCATE DROP */
UPDATE CLIENTES /*  SELECCIONO LA TABLA QUE QUIERO CAMBIAR*/
 SET NOMBRE="ANGEL" /* QUIERO PONER ANGEL */
 WHERE CODC=4;/*ACTULIZAR CAMBIAR EL NOMBRE DE EL CLIENTE CON ELÑ CCOGIDO 4 */
 
 UPDATE CLIENTES
 SET APELLIDOS1="SATAN"
 WHERE CODC=5;
 
 SELECT VERSION();/* TE APARECE LA VERSION CON LA QUE ESTAS TRABAJANDO MARIADB */
 
 SELECT NOW();/* APARECE LA HORA Y FECHA DE AHORA MISMO*/
 
 SELECT CONCAT(APELLIDOS1," ", APELLIDOS2," ", NOMBRE) FROM CLIENTES; /* TE MUESTRA LOS DATOS COMO QUIERES QUE LOS MUESTRE EN EL ORDEN QUE QUIERAS*/
 SELECT DATE_ADD("2023-02-10", INTERVAL 5 YEAR); /* TE APARECE LA FECHA QUE VA A SER DESPUES DE 5 AÑOS 5 MESES  */
 
 SELECT concat("HOY ES:",NOW(), "VENGA QUE QUEDA POCO");  /*  COMNCATENAMOS UNA CADENAD DE TEXTO CON EL RESDULTADO DE UNA FUNCIOMN FUNCIONES*/
 
 SELECT CONCAT(LEFT(NOMBRE,1),"-",LEFT(APELLIDOS1,1),"-",LEFT(APELLIDOS2,1)) FROM CLIENTES;
 
SELECT LCASE(CONCAT(LEFT(NOMBRE,1),"-",LEFT(APELLIDOS1,1),"-",LEFT(APELLIDOS2,1))) FROM CLIENTES;

SELECT LCASE(CONCAT(LEFT(NOMBRE,1),NOW(),"-",LEFT(APELLIDOS1,1),NOW(),"-",LEFT(APELLIDOS2,1),NOW())) FROM CLIENTES;

select datediff(now(),"1997/11/10");
 /*  */
/*  */
