-- actores(codigo, nombre, fecha,nacionalidad)
create database starTrek;

use starTrek;

create table actores(
codigo int, 
nombre varchar(50), 
fecha date,
nacionalidad varchar(20),
PRIMARY KEY(codigo));

-- personajes(codigo, nombre,raza, grado,codigoActor,codigoSuperior)
create table personajes(
codigo int, 
nombre varchar(50), 
raza varchar(20),
grado varchar(20),
codigoActor int,
codigoSuperior int,
PRIMARY KEY(codigo),
foreign key(codigoActor) references actores(codigo),
foreign key(codigoSuperior) references personajes(codigo)
);
-- planetas(codigo,galexia,nombre)
create table planetas(
codigo int,
galexia varchar(50),
nombre varchar(50),
PRIMARY KEY(codigo));
-- capitulos(temporada, orden,titulo,fecha)
create table capitulos(
temporada int,
orden int,
titulo varchar(50),
fecha date,
PRIMARY KEY (temporada,orden));
-- peliculas(codigho,tuitulo, director, año)
create table peliculas(
codigo int,
titulo varchar(50),
director varchar(50),
año year,
PRIMARY KEY(codigo));
-- personajescapitulos (Codigopersonaje, temporada, orden)
create table personajescapìtulos(
codigPersonajeo int,
temporada int unsigned,
orden int unsigned,
PRIMARY KEY(codigoPersonaje,temporada,orden),
foreign key(codigoPersonaje) references personajes(codigo),
foreign key(temporada) references capitulos(temporada),
foreign key(orden) references capitulos(orden));
-- personajespeliculas(codigopersonaje,codigopelicula)alter
create table personajespelicula(
codigPersonaje int,
temporada int unsigned,
orden int unsigned,
-- visitas(codigoNave, codigoPlaneta,temporada, orden)
--  Naves(Codigo, Nºtripulantes, nombre)
