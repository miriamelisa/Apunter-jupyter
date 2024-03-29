create database APAZON;
use APAZON;
 /*VAMOS A CREAR UNA MINI BASE DE DATOS QUE GUARDE RELACION ENTRE SI SIMILAR A AMAZON*/
create table CLIENTES(
CODC INT primary KEY auto_increment,
NOMBRE CHAR(60) NOT NULL COMMENT "NOMBRE COMPLETO DEL CLIENTE", 
APELLIDOS1 CHAR(60) NOT NULL, 
APELLIDOS2 CHAR(60),
FECHANACIMIENTO DATE NOT NULL,
TLF CHAR(60),
EMAIL CHAR(200) NOT NULL,
NIF CHAR(15) unique NOT NULL,
FOTO CHAR(100), 
DIRECCION CHAR(200) NOT NULL, 
CODIGOPOSTAL CHAR(5) NOT NULL, 
COMENTARIOS mediumtext  /*Tipo de campo varchar pero mas grande*/
);
create table PRODUCTOS(
CODP INT PRIMARY KEY AUTO_INCREMENT,
DESCRIPCION CHAR(100) NOT NULL, 
FOTO CHAR(100) COMMENT"COLOCAR FOTO",
CATEGORIA SET("BAJA", "MEDIA", "ALTA") NOT NULL,
PRECIO DOUBLE NOT NULL,
ORIGEN CHAR(100) NOT NULL,
FAMILIA ENUM("ELECTRODOMESTICO", "MENAJE"),
DETALLE mediumtext 
);

create table COMPRA(
CODCLI INT NOT NULL,
CODPRO INT NOT NULL,
FECHACOMPRA TIMESTAMP DEFAULT current_timestamp,   /*se coloca la fecha actual automaticamente*/
CANTIDAD INT NOT NULL,
TIENDA CHAR(50) NOT NULL,
VENDEDOR CHAR(50) NOT NULL,
TARJETADEPAGO CHAR(80) NOT NULL,
FENTREGA DATE,
FOREIGN KEY (CODCLI) REFERENCES CLIENTES (CODC),
FOREIGN KEY (CODPRO) REFERENCES PRODUCTOS (CODP)
);
use APAZON;



