Create database NATURVIAJES;
USE NATURVIAJES;
CREATE table mundo(
codigo int auto_increment primary key,
TITULO CHAR(150),
RESUMEN MEDIUMTEXT,
IMAGEN CHAR(250),
FECHA TIMESTAMP default current_timestamp,
CATEGORIA enum('Mundo','Europa','España')
);
INSERT INTO MUNDO(TITULO,RESUMEN,IMAGEN) VALUES ('Punta Cana','Es una región conocida por sus 32 km de extensión de playas y aguas claras. ','puntacana1.png');
INSERT INTO MUNDO(TITULO,RESUMEN,IMAGEN) VALUES ('Guayaquil','Guayaquil es una ciudad portuaria de Ecuador, conocida como la puerta de acceso a las playas del Pacífico y a las Islas Galápagos. ','guayaquil1.png');
INSERT INTO MUNDO(TITULO,RESUMEN,IMAGEN) VALUES ('México','En la capital Ciudad de México, las elegantes tiendas, los famosos museos y los restaurantes gourmet son parte de la vida moderna.','CiudadMexico1.png');

CREATE table europa(
codigo int auto_increment primary key,
TITULO CHAR(150),
RESUMEN MEDIUMTEXT,
IMAGEN CHAR(250),
FECHA TIMESTAMP default current_timestamp,
CATEGORIA enum('Mundo','Europa','España')
);
INSERT INTO EUROPA(TITULO,RESUMEN,IMAGEN) VALUES ('Francia','Abarca ciudades medievales, villas alpinas y playas mediterráneas. París, su capital, es famosa por sus firmas de alta costura.','francia.png');
INSERT INTO EUROPA(TITULO,RESUMEN,IMAGEN) VALUES ('Italia','País europeo con una larga costa mediterránea, influyó considerablemente en la cultura y la cocina occidental. ','italia1.png');
INSERT INTO EUROPA(TITULO,RESUMEN,IMAGEN) VALUES ('Alemania','es un país de Europa occidental con un paisaje de bosques, ríos, cadenas montañosas y playas en el mar del Norte.','alemania1.png');
SELECT * FROM naturviajes.europa;
CREATE table españa(
codigo int auto_increment primary key,
TITULO CHAR(150),
RESUMEN MEDIUMTEXT,
IMAGEN CHAR(250),
FECHA TIMESTAMP default current_timestamp,
CATEGORIA enum('Mundo','Europa','España')
);
INSERT INTO ESPAÑA(TITULO,RESUMEN,IMAGEN) VALUES ('Murcia','Murcia es una ciudad universitaria en el sureste de España y la capital de la región también llamada Murcia. ','murcia1.png');
INSERT INTO ESPAÑA(TITULO,RESUMEN,IMAGEN) VALUES ('Valencia','Murcia es una ciudad universitaria en el sureste de España y la capital de la región también llamada Murcia. ','valencia1.png');
INSERT INTO ESPAÑA(TITULO,RESUMEN,IMAGEN) VALUES ('Madrid','Madrid es un municipio y una ciudad de España. La localidad, con categoría histórica de villa, ​ es la capital del Estado​ y de la Comunidad de Madrid.','madrid1.png');
SELECT * FROM naturviajes.contenido;