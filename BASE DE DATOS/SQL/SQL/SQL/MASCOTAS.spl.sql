create database mascotas;
use mascotas;
create table cliente(
dni varchar(9) unique,
nombre varchar(25),
direccioncli  varchar(50),
telefono int,
PRIMARY KEY(dni));

create table mascotas(
Nhistoria int,
nombremasc varchar(25),
raza varchar(25),
fechanaci date,
amo int,
PRIMARY KEY(Nhistoria));

create table vacunas(
fecha date,
hora datetime,
animal int,
PRIMARY KEY(fecha, hora),
foreign key (animal) References mascotas(Nhistoria));

insert into cliente values ('1234', 'Ana', ' Madrid', 6698745123),('2345', 'Benito', ' Madrid', 9145635782),('3456', 'Carlos', 'Barcelona', NULL),('4567', 'Ana', ' Madrid', 698745123),('5678', null, ' Madrid', NULL);
insert into mascotas values (1, 'Pancho', 'Perro', '1/1/2000', 1234), (2, 'King', ' Gorila', null, 2345),(3, 'Rex', 'Perro', '3/3/2003', 1234),(4, 'Silvestre', 'Gato', null, 4567 ),(5, 'Piolin', 'Canario', null, 5678);
insert into vacunas values ('1/1/2000', '17:00', 1), ('2/2/2000', '18:00', 3),('2/2/2000', '20:00', 4),('3/3/2000', '17:00', 4),('4/4/2000', '17:00', 1);

DELETE FROM cliente where nombre='Ana';
DELETE FROM mascota where raza='perro';


create table persona(
dni varchar(9),
Nombre varchar(20),
Dirección varchar(35),
Edad int unsigned not null check (edad>=18),
primary key(dni));



create table familiar(
dni varchar(9),
dni_familiar varchar(9),
Ocupación varchar(15),
primary key(dni,dni_familiar),
foreign key(dni_familiar) references persona(dni)
on delete cascade);




delete from persona where Nombre like '%a%';
update from persona set edad=18 where Nombre like '_______'; -- 7 barras bajas
update from persona set edad=18 where Nombre = 'Pedro';
