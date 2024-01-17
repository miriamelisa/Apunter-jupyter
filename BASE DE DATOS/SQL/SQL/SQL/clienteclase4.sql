DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas character set utf8mb4;
USE ventas;
CREATE TABLE cliente (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(25),  
primer_apellido VARCHAR(15) NOT NULL,
ciudad VARCHAR(100),  
categoria INT UNSIGNED);
CREATE TABLE comercial (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
ciudad VARCHAR(100),
comision FLOAT);

alter table cliente modify nombre varchar(100) not null;
select*from cliente;
alter table cliente rename column primer_apellido to apellido1 varchar(100) not null;
alter table cliente add apellido2 varchar(100) after apellido1;
alter table cliente drop column caterogia;

