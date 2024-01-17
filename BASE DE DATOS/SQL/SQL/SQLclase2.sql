create database banco;
use banco;
create table empleado(
id int, 
nombre varchar(25), 
fecha_nacimiento date,
salario decimal(8,2),
Peso int unsigned,
numerotlf varchar(9), 
PRIMARY KEY(id));

create table cliente(
idC int,
dni varchar(9) unique,
nombre varchar(25),
direccioncli  varchar(50),
PRIMARY KEY(idC));

create table sucursal(
numsuc float,
direccion varchar(50),
provincia varchar(15) default'Madrid',
PRIMARY KEY(numsuc));

create table cuenta(
numcuenta int,
saldo decimal(15,2),
PRIMARY KEY(numcuenta));

create table transacción(
numtran int,
fecha date,
cantidad decimal(15,2) check(cantidad<3000 AND cantidad>2000),
numcuenta int,
PRIMARY KEY(numtran),
foreign key(numcuenta) references cuenta(numcuenta)
ON DELETE CASCADE);


create table clientecuenta(
cliente INT, 
numsuc int not null,
numcuenta int,
PRIMARY KEY(numcuenta, cliente),
foreign key (numcuenta) References cuena(numcuenta),
foreign key(cliente) references cliente(idC));




