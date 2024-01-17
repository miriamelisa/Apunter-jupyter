SET SQL_SAFE_UPDATE=0;
create database if not exists gdp35CLIENTE;
create database if not exists gdb35deportista;
drop database if exists gdb35deportista;

drop database iF exists gdp35CLIENTE;
create database gdp35CLIENTE character set direc1;
use gdp35CLIENTE;
create table if not exists 	CLIENTES(
idcliente int primary key,
nombrec varchar(40) not null,
apellidoc varchar(60) not null,
codpostal int,
tlf varchar (9));
create table if not exists ARTICULOS(
idart int primary key,
Tnombrea varchar (40),
descripcion blob);

alter table CLIENTES add column direccion varchar (40) after tlf;
alter table CLIENTES add fechanacimiento date after direccion;
alter table ARTICULOS add clientenum int;
alter table ARTICULOS add foreign key(clientenum) reference CLIENTES(dcliente)
on delete set null on update cascade;
drop table articulos;
alter table clientes drop fechanacimiento;

insert into CLIENTES values
(1,'ana','fernan',28012,'123456','calle'),
(2,'blas','garcia',28012,'654789','avda'),
(3,'carla','hernan',28111,'258963','carretera'),
(4,'daniel','loèz',28111,'369852',null),
(5,'eva','martin',08000,null,'palaza');
update CLIENTES set codpostal=28222 where idcliente=5;
delete from CLIENTES where codpostal= '28111';


