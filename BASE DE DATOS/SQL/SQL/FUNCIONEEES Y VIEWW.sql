use nba;
/*CREAMOS UNA FUNCION LLAMADA TRIANGULO EN FUNCIONES*/
/*CREATE DEFINER=`root`@`localhost` FUNCTION `triangulo`(base double, altura double) RETURNS double
BEGIN
declare area double;
set area=base*altura/2;
RETURN area;
END*/
select triangulo(3.5,5);/*llamar a la funcion que hemos creado*/


/*CREAMOS UNA FUNCION LLAMADA cuadrado EN FUNCIONES*/
/*CREATE FUNCTION CUADRADO(L INT)
RETURNS INTEGER
BEGIN
declare areaC double;
set areaC=L*L;
RETURN areaC;
END

CREATE DEFINER=`root`@`localhost` FUNCTION `CUADRADO`(L INT) RETURNS int(11)
BEGIN
declare areaC double;
set areaC=L*L;
RETURN areaC;
END*/
select CUADRADO(5);/*LLAMAMOS A LA FUNCION CUADRADO*/


/*CREAMOS UN VIEW VER TABLA*/
/*
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `nba`.`vertabla` AS
    SELECT 
        `nba`.`equipos`.`Nombre` AS `Nombre`,
        `nba`.`equipos`.`Ciudad` AS `Ciudad`,
        `nba`.`equipos`.`Conferencia` AS `Conferencia`,
        `nba`.`equipos`.`Division` AS `Division`
    FROM
        `nba`.`equipos`*/
SELECT * FROM nba.vertabla;/*ESTAMOS LLAMANDO A LA VIEW TABLA

/*CREAMOS OTRA FUNCION saludo*/
/*CREATE DEFINER=`root`@`localhost` FUNCTION `saludo`(nombre char(50)) RETURNS char(100) CHARSET utf8mb4
BEGIN

RETURN concat ('Hola bonit@',nombre);
END*/
SELECT saludo('miri');


/*HACER UNA FUNCION INICIALES (UPER) QUE META PARAMETROS NOMBRE,PRIMER APELLIDO,SEGUNDO APELLIDO, 
EL RESULTADO SERA LAS PRIMERAS INICIALES(LEFT) EN MAYUSCULA

CREATE DEFINER=`root`@`localhost` FUNCTION `iniciales`(nombre char(50),ape1 char(50),ape2 char(50)) RETURNS char(5) CHARSET utf8mb4
BEGIN
declare resultado char(3);/*declaramos la variable que queremos que retorne que es resultado de tres char puede ser menor que el retur pero no mas 
set resultado=ucase(concat(left(nombre,1),left(ape1,1),left(ape2,1)));/* EN SET establecemos la funcion 
RETURN resultado;/* retornamos las funcion  
END */
SELECT INICIALES('miri','colla','guano');

/*FUNCION QUE TE RETORNE LA SEMANA DE UNA FECHA
CREATE DEFINER=`root`@`localhost` FUNCTION `DIASEMANA`(FECHA date) RETURNS char(50) CHARSET utf8mb4
BEGIN
declare DIA INT;
DECLARE resultado char(50);
set dia=weekday(fecha);
case dia
	when 0 then set resultado='lunes';
	when 1 then set resultado='martes';
	when 2 then set resultado='miercoles';
	when 3 then set resultado='jueves';
	when 4 then set resultado='viernes';
	when 5 then set resultado='sabado';
	when 6 then set resultado='domingo';
else set resultado ='dia de la semana erroneo';
end case; 
RETURN resultado;
END
*/
SELECT DIASEMANA('2022/04/10');


/* funcion que te diga si es hHOMBRE O MUJER
CREATE DEFINER=`root`@`localhost` FUNCTION `genero`(denominacion char (50)) RETURNS char(50) CHARSET utf8mb4
BEGIN
declare resultado char(20);
if denominacion='H' then 
set resultado='HOMBRE';
ELSE 
set resultado='MUJER';
END IF;
RETURN resultado;
END
*/
SELECT genero('H');



