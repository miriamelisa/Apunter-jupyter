
SELECT*FROM jugadores;
use nba;
CREATE TABLE PLAYERS AS (SELECT*FROM jugadores);
SELECT*FROM players;
set sql_safe_updates=0;
update players set Peso = Peso*0.453592;
update players set altura =
((left(altura,1))*0.3048)+(ABS(right(altura,2))*0.0254);

/*PUNTOS POR PARTIDO DE LEBRON JAMES DE LA TEMPORADA 03/04 A LA 05/06*/
SELECT*FROM jugadores; /*Nombre y codigo de jugador
select*estadisticas; puintpos por partido y codigo de jugador, temporada 03/04 - 05/06*/
select nombre,Puntos_por_partido,temporada from jugadores inner join estadisticas on codigo = jugador where (nombre='LeBron James') and (temporada<03/04 or temporada>05/06);

/*REBOTES POR PARTIDO DE CADA JUGADOR DE LOS ÁNGELES. MEDIA DEL EQUIPO*/ 
select estadisticas.jugador, estadisticas.Rebotes_por_partido,partidos.codigo, jugadores.nombre, jugadores.procedencia from jugadores inner join estadisticas on jugadores.codigo = estadisticas.jugador 
inner join partidos on estadisticas.temporada =partidos.temporada where Procedencia='Los Angeles';

/*CUANTAS LETRAS TIENE EL NOMBRE DE CADA JUGADOR DE LOS GRIZZLIES*/
select Nombre from jugadores where count(length(Nombre));

/*NÚMERO DE BASES ‘G’ QUE TIENE CADA EQUIPO DE LA CONFERENCIA ESTE*/
select posicion,conferencia, equipos.Nombre from jugadores inner join equipos on equipos.Nombre = Nombre_equipo where conferencia like 'east' and  posicion like'G';

/*PESO MEDIO EN KILOS DE LOS JUGADORES DE LA CONFERENCIA ESTE*/
select count(peso)/2,jugadores.Nombre from jugadores inner join equipos on equipos.Nombre = Nombre_equipo where conferencia like 'east';

/*ASISTENCIAS POR PARTIDO DE JOSE CALDERÓN Y PAU GASOL EN LA TEMPORADA 07/08*/
select estadisticas.Asistencias_por_partido,jugadores.nombre,estadisticas.temporada from estadisticas inner join jugadores on estadisticas.jugador = jugadores.codigo where (jugadores.nombre like 'Jose Calderon' or jugadores.nombre like 'Pau Gasol') and estadisticas.temporada like '07/08';
/*EQUIPOS DONDE EL NOMBRE DE EQUIPO EMPIECE POR A*/
select nombre from equipos WHERE length(nombre)>7;
select nombre from equipos WHERE NOMBRE LIKE'%a%';
select nombre from equipos WHERE NOMBRE LIKE'____';
select nombre,Division from equipos WHERE NOMBRE LIKE '%a%' and Division Like '%t';
select nombre,division from equipos where division like '_e%' or division like  '_o%' order by division asc;
/*equipos que tienen mas de 7 letras*/
select nombre from equipos where nombre like '_____+';
/*nombres de los equipos que la ciudad donde estan no sea ninguna ngeles sacramaneto boston nueva york*/
select nombre,division from equipos where ciudad not in ('miami','los angeles') order by ciudad; 
/* todos los jugadroes de procedencia servia y su posicion no sea G*/
select nombre,procedencia,posicion from jugadores where procedencia like 'serbia' and posicion not in ('G');

