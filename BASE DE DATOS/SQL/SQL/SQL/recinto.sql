drop database iF exists ESPECTACULOS;
create database ESPECTACULOS character set latina1;
use EXPECTACULOS;
create table if not exists recinto(
codrecinto int primary key,
nombrerecinto varchar (15),
direccion varchar (35),
ciudad varchar (15),
telefono int,
horario int);

create table if not exists espectaculos(
codespectaculo int unsigned,
nombre varchar (10),
tipo varchar (10),
fechainicial date,
fechafinal date,
interprete varchar(10),
codrecinto int,
primary key (codespectaculo),
foreign key (codrecinto) references rescinto(codrecinto));


create table if not exists precioespectaculos(
codespectaculo int,
codrecinto int,
zona varchar (10),
precio double,
primary key(codespectaculo,codrecinto),
foreign key(codespectaculo) references espectaculos(codespectaculo),
foreign key(codrecinto) references recinto(codrecinto));

create table if not exists zonasrecintos(
codrecinto int primary key,
zona varchar (10),
capacidad varchar (10),
primary key(codrecinto),
foreign key(codrecinto) references recinto(codrecinto));

create table if not exists asientos(
codrecinto int,
zona varchar (10),
fila int,
numero int primary key,
foreign key(codrecinto) references recinto(codrecinto));

create table if not exists representaciones (
codespectaculo int primary key,
fecha date, 
hora time,
foreign key(codrespectaculo) references recinto(codespectaculo));

create table if not exists espectadores(
dnicliente int primary key,
nombre varchar (10),
direccion varchar (30),
telefono int,
ciudad varchar (10),
ntarjeta varchar(16),
foreign key(codrecinto) references recinto(codrecinto));

create table if not exists entradas(
codespectaculo int primary key,
fecha date, 
hora time,
codrecinto int,
fila int,
numero int,
zona varchar(10),
dnicliente int,
foreign key(codrecinto) references recinto(codrecinto),
foreign key(codrespectaculo) references recinto(codespectaculo),
foreign key(dnicliente) references espectadores(dnicliente));












