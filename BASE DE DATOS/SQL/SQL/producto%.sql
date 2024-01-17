create database productosej4;
use productosej4;
create table if not exists producto(
codigo int auto_increment primary key,
nombre varchar (15),
precio double,
fecha date);
insert into producto values (cama, '12.50', '2010-11-09')(cama, '13.50', '2000-11-10')(cama, '14.50', '1997-11-10');
alter table producto add categoria varchar (15);
update productos set categoria='utencilios';
update productos set categoria='silla' where categoria LIKE 'silla%';

