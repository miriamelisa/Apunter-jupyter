Create database PRUEBA;
USE PRUEBA;
CREATE table CONTENIDO(
TITULO CHAR(150),
ENTRADA CHAR(50),
TEXTO mediumtext,
IMAGEN CHAR(250)
);
INSERT INTO CONTENIDO(TITULO,ENTRADA,TEXTO,IMAGEN) VALUES ('GOKU SUPER SAYAN, EL PODER','LOS SUPER GUERREROS SON LA CASTA MAS PODEROSA DE LA GALAXIA','FDHJSKGJBDFKGJBDFKGJBDKFJBGH G', 'GOKU.JPG');
INSERT INTO CONTENIDO(TITULO,ENTRADA,TEXTO,IMAGEN) VALUES ('VEGETA','EXTERMINADOR DE MUNDOS','FDeL GUERERO DEL ESPACIO ES KFJGDÑFLGHXC,NVFKNGCVCG', 'GOKU.JPG');
set sql_safe_updates=0;/* PERMISO PARA BORRAR*/
DELETE FROM CONTENIDO WHERE IMAGEN='VEGETA.JPG';
select*from contenido;
DELETE FROM CONTENIDO WHERE TITULO='VEGETA';
DELETE FROM CONTENIDO WHERE 2;
INSERT INTO CONTENIDO(TITULO,ENTRADA,TEXTO,IMAGEN) VALUES ('VEGETA','PRINCIPE vEGETA','reconocido como el Príncipe Vegeta ', 'VEGETA.JPG');
INSERT INTO CONTENIDO(TITULO,ENTRADA,TEXTO,IMAGEN) VALUES ('Bardock Xeno','Guerrero Negro','Más tarde, renunció a su propio nombre y pasado al entrar a formar parte de los Guerreros de Negro y aliarse con Æos, la precursora a Chronoa en el título de Kaioshin del Tiempo, como el Guerrero de Negro en la búsqueda de una única y verdadera línea', 'BROLI.JPG');
SELECT * FROM prueba.contenido;

truncate contenido;

Create database NATURVIAJES;
USE NATURVIAJES;
CREATE table CONTENIDO(
codigo int auto_increment primary key,
TITULO CHAR(150),
RESUMEN MEDIUMTEXT,
IMAGEN CHAR(250),
FECHA TIMESTAMP default current_timestamp,
CATEGORIA enum('Mundo','Europa','España')
);
SELECT * FROM naturviajes.contenido;