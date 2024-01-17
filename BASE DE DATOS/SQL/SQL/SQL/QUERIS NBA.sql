CREATE DATABASE NBA;
USE NBA;


select Nombre,Procedencia from jugadores where codigo in (select jugador from estadisticas where 
(Rebotes_por_partido>0 and (temporada = "04/05" or temporada = "05/06")));

/* media por peso en cada conferencia 
peso dividirlo entre 2.2jugadores*/

select Peso/2.2 from jugadores inner join equipos on jugadores.Nombre_equipo=equipos.Nombre 
where procedencia='Spain'and procedencia='France';

SELECT round(AVG(Puntos_por_partido),2) FROM estadisticas inner join jugadores on codigo=jugador inner join equipos on nombre_equipo = equipos nombre where procedencua= 'Spain' and conferencia='west';

/*total de puntos por partido 
en cada temporada 
del equipo Los Angeles Lakers en la base de datos NBA.
primero filtro hasta angeles lakers y luego agrupo*/
estadistica  Puntos_por_partido
estadistica   temporada
JUGADORES NOMBRE
JUGADORES nombnre_equipo

select count(Puntos_por_partido),estadisticas.temporada,jugadores.Nombre,jugadores.Nombre_equipo 
from estadisticas inner join jugadores on  estadisticas.jugador = jugadores.nombre where nombre_equipo= 'Lakers';




