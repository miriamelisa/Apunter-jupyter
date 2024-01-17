select user;
CREATE USER blochi1 identified by "1234";
grant all privileges on nba.* to blochi1; /* para darle todos los privilegios de la tabla nba*/
select*from mysql.user;/*MIRAR CUANTOS USUARIOS HAY EN MI BASE DE DATOS EJEMPLO CADA UNO PUEDE CONECTARSE A LA BASE DE DATOS NBAr*/
drop user blochi1;/*para borrar a el usuario blochi1*/

use jardineria;
create user  eli identified by '1234';
grant all privileges on jardineria.* to eli;
show grants for eli;/*para ver que permisos tiene un usuario*/
flush privileges;/* refrescar los privilegios*/
grant SELECT, UPDATE, DELETE on jardineria.* to eli;/* PERMISO SOLO PÀRA leer actualizar y borrAR*/

CREATE USER ANITA identified BY '1234';
grant SELECT(nombre_cliente,telefono,ciudad) ON cliente TO ANITA;/*SOLO LE DAMOS PRIVILEGIOS PARA QUE VEA ESOS TRES CAMPOS*/
revoke all privileges, grant option from eli;/*para quitarle los privilegios*/
