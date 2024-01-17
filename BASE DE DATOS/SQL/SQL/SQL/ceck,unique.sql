drop database iF exists Empleados;
create database Empleados character set direc1;
use Empleados;

create table if not exists empleados(
dni varchar(8),
nombre varchar(10) not null unique,
apellido1 varchar(15) not null,
apellido2 varchar(15),
direcc1 varchar(25),
direcc2 varchar(25),
ciudad varchar(20),
provincia varchar(20),
cod_postal varchar(5),
sexo varchar(1) check(sexo in (h, m)),
fecha_nac date,
valoracion int unsigned defaul
PRIMARY KEY (dni)
);

create table if not exists departamentos(
dpto_cod varchar(5),
nombre_dpto varchar(30) not null unique,
dpto_padre varchar(5),
presupuesto double,
pres_actual double,
PRIMARY KEY(dpto_cod),
foreign key(dpto_padre) references departamentos(dpto_cod)
);



create table if not exists universidades(
univ_cod varchar(5),
nombre_univ varchar(25) not null,
ciudad varchar(20),
municipio varchar(2),
cod_postal varchar(5),
PRIMARY KEY(univ_cod)
);

create table if not exists trabajos(
trabajo_cod varchar(5),
nombre_trab varchar(20) not null,
salario_min double not null,
salario_max double not null,
PRIMARY KEY(trabajo_cod)
);

create table if not exists estudios(
empleado_dni varchar(8),
universidad varchar(5),
año year,
grado varchar(3),
especialidad varchar(20),
PRIMARY KEY(empleado_dni, grado),
foreign key(empleado_dni) references empleados(dni),
foreign key(universidad) references universidades(univ_cod)
ON DELETE SET NULL);


create table if not exists historial_laboral(
empleado_dni varchar(8),
trabajo_cod varchar(5),
fecha_inicio date,
fecha_fin date,
dpto_cod varchar(5),
supervisor_dni varchar(8),
PRIMARY KEY(empleado_dni, trabajo_cod),
foreign key(empleado_dni) references empleados(dni),
foreign key(trabajo_cod) references trabajos(trabajo_cod),
foreign key(dpto_cod) references departamentos(dpto_cod),
foreign key(supervisor_dni) references empleados(dni)
);

create table if not exists historial_salarial(
empleado_dni varchar(8),
salario double not null,
fecha_comienzo date,
fecha_fin date,
PRIMARY KEY(empleado_dni, salario),
foreign key(empleado_dni) references empleados(dni));
insert into empleados values ('12345678' 'raquel', 'dias', 'gracia', 'infante', null,
'madrid', 'madrid', '23454','M', '10-11-1997');

insert into  emplado add salario decimal unique alter apellido2;
alter table empleaado add trabajo varchar (20) unique after salario,
DELETE from universidad where uni-cod,
alter table empleados modify nombrevarchart(10) null,
alter table empleados modify direc1 varchar(40);
alter table empleados drop primary key,
alter table empleados add primary key(nombre,apellido1, apelllido2);


;



