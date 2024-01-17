create database if not exists departamentos;

use departamentos;

create table if not exists departamentos(
num int, 
localidad varchar(15),
nombre varchar(15),
PRIMARY KEY(num));

create table if not exists empleado(
numDpto int, 
dni varchar(9) unique,
nombre varchar(15) not null,
comision int default 0,
IdJefe int,
NumEmp int,
PRIMARY KEY(NumEmp),
foreign key(numDpto) references departamentos(num),
foreign key(IdJefe) references empleado(NumEmp));

alter table empleado add salario decimal;
insert into departamentos values (1, 'administración', ' Madrid'), (2, 'ventas', 'Barcelona');
insert into empleado values(1, '123456', 'Juan Perez', '10', null, 1,1000),(1, '23456', 'Juan Gomez', 5, 1, 2,800.55), (2,NULL,'Ana García', NULL, NULL, 3, 800.55),(2,NULL, NULL, NULL, NULL, 4, NULL),(2,'123456','Maria Alvares', NULL, NULL, 5, NULL),(3,NULL, 'Eva Diez', NULL, NULL, 6,NULL); 
update empleado set comision=6;
update departamento set localidad='toletdo';
update empleado set salario=900
where numEmp=1;
update empleado set salario=1000
where nombre='Ana Garcia';
update empleado set salario=800, comision=5
where nombre='Maria Alvarez';
DELETE FROM empleado where NumEmp=5;
DELETE FROM departamentos where nombre='ventas';
DELETE FROM empleado;

