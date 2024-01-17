create database pub;
use pub;
create table if not exists pub(
codpub varchar (5) not null,
nombre varchar(15) not null,
licenciafiscal  varchar(15) not null,
domicilio  varchar(30),
fechaapertura date not null,
horario varchar(15) not null CHECK(horario in ('HOR1','HOR2','HOR3')),
codlocalidad INT NOT NULL,
PRIMARY KEY(codpub));

create table if not exists titular(
dnititular varchar(9) NOT NULL,
nombre VARCHAR(15) NOT NULL ,
domicilio varchar(30),
codpub varchar(5) NOT NULL,
PRIMARY KEY(dnititular),
foreign key(codpub) references pub(codpub));


create table if not exists empleado(
dniempleado VARCHAR(9) NOT NULL,
nombre varchar(15) NOT NULL,
domicilioempl  varchar(30),
PRIMARY KEY(dniempleado));

create table if not exists exitencias(
codarticulo varchar(5) NOT NULL,
nombreex varchar(15) NOT NULL,
cantidad int NOT NULL,
precio double NOT NULL CHECK (precio>0),
codpub varchar(5) NOT NULL,
PRIMARY KEY(codarticulo),
foreign key(codpub) references pub(codpub));

create table if not exists localidad(
codlocalidad int NOT NULL,
nombreloc varchar(15) NOT NULL,
PRIMARY KEY(codlocalidad));

create table if not exists pubempleado(
codpub varchar(5) not null,
dniempleado varchar(9) not null,
funcion  varchar(15) not null check(funcion in ('camarero', 'seguridad','limpieza')),
PRIMARY KEY(codpub, dniempleado, funcion),
foreign key(codpub) references pub(codpub),
foreign key(dniempleado) references empleado(dniempleado));

