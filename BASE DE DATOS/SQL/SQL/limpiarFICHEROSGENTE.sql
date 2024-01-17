create database Pruebas;
use Pruebas;
truncate table Gente;

create table Gente(
nombre char (50),
edad integer,
vacaciones integer,
ciudad char (25));

load data infile
'D:\Gentes.txt'
into table Gente
fields terminated by';';

select * from Gente;

LOAD DATA INFILE
'D:\BECADOS.txt'
into table Gente
fields terminated by';' /*   LO QUE HAY DESPUES DE CADA PALABRA SI HAY ESPACIOS TENEMOS QUE ELIMINARLOS CON UN TABULATOR \t*/
lines terminated by '-- ' /*  LA FILA A INTRODUCIR TERMINA EN -- ESPACIO */
starting by '-' /*LA LINEA EMPIEZA CON UN GUION - */
enclosed by'"'
LOAD DATa INFILE
'D:\pringuis.txt'
into table Gente
fields terminated by'"*"' 
lines terminated by'*--'
starting by '\t';
/*   */

