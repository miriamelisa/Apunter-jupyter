CREATE DATABASE BIBLIOTECA;
USE BIBLIOTECA;

CREATE TABLE USUARIOS(
CODUSU INT PRIMARY KEY auto_increment,
NOMBRE CHAR(50) NOT NULL,
APELLIDO1 CHAR(50) NOT NULL,
APELLIDO2 CHAR(50) NULL,
FNACI DATE NOT NULL,
NIF CHAR(15) UNIQUE NOT NULL,
DIRECCION CHAR(100) NOT NULL,
CP CHAR(5) NOT NULL,
PROVINCIA CHAR(30),
TLF CHAR(25) NOT NULL,
FOTO CHAR(60),
SEXO SET ("H","M"),
OBSERVACION MEDIUMTEXT
);
INSERT INTO USUARIOS(NOMBRE,APELLIDO1,APELLIDO2,FNACI,NIF,DIRECCION,CP,PROVINCIA,TLF,SEXO) VALUES
("MIRIAM","COLLAGUAZO","GUANOLEMA","1997/11/10","03482287R","CALLE/CLAUDIO SANCHEZ ALBORNOZ","28021","MADRID","603385235","M"),
("LUIS","BELTRE","CARMONA","1997/10/17","10482287R","CALLE/MOATOLES","28021","MADRID","603385235","M");


CREATE TABLE AUTOR(
CODAUTOR INT PRIMARY KEY auto_increment,
NOMBRE CHAR(60) NOT NULL,
AÑONACI DATE NOT NULL,
NACIONALIDAD CHAR(20) NULL,
SEXO SET ("H","M"),
RECONOCIMIENTOS MEDIUMTEXT
);
INSERT INTO AUTOR(NOMBRE,AÑONACI,NACIONALIDAD,SEXO) VALUES
("CAMILI JOSE CELA","1996/10/11","ESPAÑOLA","H");

CREATE TABLE EDITORIAL(
CODEDI INT PRIMARY KEY auto_increment,
DENOMINACION CHAR(90)NOT NULL,
PAIS CHAR(50) NOT NULL,
EMAIL CHAR(100)
);
INSERT INTO EDITORIAL(DENOMINACION,PAIS,EMAIL) VALUES
("ALFAGUARA","ESPAÑA","alfaguara@gmail.com");

CREATE TABLE LIBROS(
CODLIBRO INT PRIMARY KEY auto_increment,
TITULO CHAR (100) NOT NULL,
ARGUMENTO MEDIUMTEXT,
PUBLICACION INT NOT NULL comment "AÑO PUBLICACION ",
NUMPAGINAS INT NOT NULL,
GENERO CHAR(50) NOT NULL,
AUTOR INT NOT NULL,
EDITORIAL INT NOT NULL,
ISBN CHAR(30) UNIQUE NOT NULL,
PORTADA CHAR(60) NULL,
PREMIOS INT,
FOREIGN KEY (AUTOR) REFERENCES AUTOR(CODAUTOR)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (EDITORIAL) REFERENCES EDITORIAL(CODEDI)
ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO LIBROS(TITULO,ARGUMENTO,PUBLICACION,NUMPAGINAS,GENERO,AUTOR,EDITORIAL,ISBN,PREMIOS) VALUES
("LA COLMENA","EN MADRID HAY MUCHO LIO",1950,243,"NOVELA",1,1,"9782334344",5);
CREATE TABLE PRESTAMOS(
CODPRES INT PRIMARY KEY auto_increment,
CODU INT NOT NULL,
CODL INT NOT NULL,
FPRES TIMESTAMP default current_timestamp,
FENTREGA DATE,
FDEVOLUCION DATE,
PENALIZACION INT,
OBSERVACIONES mediumtext,
FOREIGN KEY (CODU) REFERENCES USUARIOS(CODUSU)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (CODL) REFERENCES LIBROS(CODLIBRO)
ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO PRESTAMOS(CODU,CODL) VALUES
(1,1);
SELECT *FROM PRESTAMOS;
