drop database if exists ventas;

create database if not EXISTS ventas CHARACTER SET latin1;
use ventas;

 create table if not exists cliente(
id int unsigned auto_increment,
nombre varchar(25),
primerApellido VARCHAR(15) not null,
ciudad varchar(100),
categoria int unsigned,
PRIMARY KEY(id));


create table if not exists comercial(
id int unsigned auto_increment,
nombre varchar(100) not null,
primerApellido VARCHAR(100) not null,
segundoApellido VARCHAR(100),
ciudad varchar(100),
comision decimal,
PRIMARY KEY(id));

alter database ventas CHARACTER SET utf8mb4;

ALTER TABLE cliente MODIFY nombre varCHAR (100) NOT NULL;
alter table cliente add apellido2 varchar(100) AFTER primerApellido;
show tables;
alter table cliente rename column primerApellido to ape1;
ALTER TABLE cliente MODIFY ape1 varCHAR (100) NOT NULL;
alter table cliente drop column categoria;
ALTER TABLE comercial MODIFY comision decimal default 10;