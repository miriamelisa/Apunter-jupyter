create database coches;

use coches;

create table if not EXISTS clientes(
dni int,
nombre varchar(15),
apellido varchar (15),
ciudad varchar (25),
primary key(dni));
create table if not EXISTS coches(
codcoche int,
nombre varchar(15),
modelo varchar (15),
primary key(codcoche));

create table if not EXISTS concesionarios(
cifc int,
nombre varchar(15),
ciudad varchar (15),
primary key(cifc));


create table if not EXISTS marcas(
cifm int,
nombre varchar(15),
ciudad varchar (15));

alter table marcas add primary key(cifm);

create table if not EXISTS fabrica(
cifm int,
codcoche int,
primary key(cifm, codcoche));

alter table fabrica add foreign key(codcoche) references coches(codcoche);

create table if not EXISTS distribuyen(
codcoche int,
cifc int,
cantidad int unsigned,
primary key(cifc, codcoche),
foreign key(codcoche) references coches(codcoche));

create table if not EXISTS venden(
codcoche int,
cifc int,
dni int,
color varchar(10),
primary key(cifc,codcoche,dni),
foreign key(codcoche) references coches(codcoche),
foreign key(dni) references clientes(dni),
foreign key (cifc) references concesionarios(cifc));
