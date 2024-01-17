create database GESTION;
use GESTION;

create table alumnos(
codigo int auto_increment primary key,
nombre char(50),
ciudad char(100),
fnacimiento date not null,
nota1 double,
nota2 double,
nota3 double,
media double,
edad double);
insert into alumnos(nombre,ciudad,fnacimiento,nota1,nota2,nota3)
values
("Adrian","mostoles","2003/08/13",6.2,8.4,4.5);
insert into alumnos(nombre,ciudad,fnacimiento,nota1,nota2,nota3)
values
("Marquitos","madrid","2004/04/10",5.0,5.0,6.5);
insert into alumnos(nombre,ciudad,fnacimiento,nota1,nota2,nota3)
values
("Agus","carabanchel","2002/06/25",4.0,3.0,6.0);
select *from alumnos;

/*#####

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar`()
BEGIN
	DECLARE EDADES DOUBLE;
	DECLARE CONTADOR INTEGER;
	DECLARE REGISTROS INTEGER;
	DECLARE CALMEDIA DOUBLE;

	SET CONTADOR=1;
	SET REGISTROS=(select MAX(CODIGO) FROM ALUMNOS);
	WHILE CONTADOR<=REGISTROS DO
		SET EDADES=(SELECT round(datediff(NOW(),fnacimiento)/365,2)from alumnos where codigo=contador);
		
		
		SET CALMEDIA=(SELECT round(SUM((nota1+nota2+nota3))/3,2) from alumnos where codigo=contador);
		update alumnos set media=calmedia,edad=edades
        where codigo=contador;


	SET CONTADOR=CONTADOR+1;
	END WHILE;
end

######*/

CALL ACTUALIZAR(); /*  PARA ACTUALIZAR */