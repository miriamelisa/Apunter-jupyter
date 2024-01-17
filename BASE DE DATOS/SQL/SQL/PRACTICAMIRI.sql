create database videoclub;
use videoclub;
create table usuarios(
cod int auto_increment primary key,
nombre char(30) not null,
apel1 char(50) not null,
apel2 char(50),
fnacimiento date,
telefono char(30) not null,
direccion char(60),
codigopostal char(10));
create table peliculas(
codigo int auto_increment primary key,
titulo char(100) not null,
director char(50) not null,
anioestreno int (8) not null,
duracion int (5) not null);
create table prestamos(
codUsuario int not null,
codPelicula int not null,
fechaPrestamo date not null,
fehcaDevolucion date,
diasretraso int(10),
sacionpagada double,
foreign key (codUsuario) references usuarios(cod),
foreign key (codPelicula) references peliculas(codigo));

load data infile 'D:\USUARIOS.txt'
into table usuarios
fields terminated by ';'
lines terminated by'\n';

select*from usuarios;
set sql_safe_updates=0;
delete from usuarios where nombre like 'El%';
load data infile 'D:\PELICULAS.txt'
into table peliculas
fields terminated by ';'
lines terminated by'\n';

select*from peliculas;

insert into prestamos (codUsuario,codPelicula,fechaPrestamo,fehcaDevolucion,diasRetraso,sacionpagada)
values
(5,2,"2023/03/16",null,null,null),
(5,3,"2023/03/17",null,null,null),
(1,4,"2023/02/16",null,null,5),
(1,5,"2023/02/16",null,null,5),
(6,5,"2023/01/16",null,null,15),
(6,5,"2023/01/16",null,null,15);
select*from prestamos;

select distinct(director)from peliculas;

update peliculas set director= 'PETER JACKSON';
select distinct(director)from peliculas;

select distinct(codPelicula) from prestamos;

select distinct(codPelicula),peliculas.titulo from prestamos inner join peliculas on codPelicula = codigo;

select count(distinct(codPelicula)) as 'Peliculas Diferentes' from prestamos;

select codUsuario,codPelicula from prestamos;

select nombre,titulo from prestamos inner join usuarios on codUsuario=usuarios.cod
inner join peliculas on codPelicula=peliculas.codigo;

select sum(sacionpagada),nombre from prestamos inner join usuarios on codUsuario=cod 
where sacionPagada is not null group by codUsuario;

select count(*) as usuarios,codigopostal from usuarios group by codigopostal;

select titulo from peliculas where titulo like '%ANILLOS%';

select nombre, right(direccion,2) as PISO from usuarios where direccion like '%B';

select sum(duracion) as 'SUMA DE DURACION' from peliculas where titulo like 'EL HOBBIT%'; 

select nombre,apel1,apel2,telefono,titulo,director from prestamos
inner join usuarios on codUsuario=usuarios.cod
inner join peliculas on codPelicula=peliculas.codigo
into outfile 'D:\ALQUILERES.txt'
fields terminated by ';';

select codUsuario,codPelicula,diaSemana(fechaPrestamo) from prestamos;

create user MIRI identified by '1234';

grant select(nombre,apel1,apel2,telefono) on usuarios to MIRI;
grant select(titulo,director) on peliculas to MIRI;
show grants for MIRI;