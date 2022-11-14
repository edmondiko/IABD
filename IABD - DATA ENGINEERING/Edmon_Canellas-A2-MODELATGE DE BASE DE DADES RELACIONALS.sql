CREATE database peliculas;

use peliculas;

CREATE table VOTO (
primary key (ID_voto),
media_votos float not null, 
cantidad int not null,
ID_voto int auto_increment
);

CREATE table PELICULA (
ID int auto_increment, 
titulo varchar(255) Not null, 
nota float, 
fecha varchar(255) not null,
ID_voto int,
Primary key(ID),
foreign key (ID_voto) REFERENCES VOTO(ID_voto),
CHECK (nota>=0 and nota <= 10)
);

CREATE table GASTO (
ID_GASTO int auto_increment unique,
gastos float, 
ingresos float, 
ID_pelicula int,
Primary Key(ID_GASTO), 
foreign key (ID_pelicula) REFERENCES PELICULA(ID));

CREATE table GENERO (
ID_genero int auto_increment,
genero varchar(255) DEFAULT 'Sin Especificar',
primary key(ID_genero));

CREATE table GENERO_PELICULA(
ID_pelicula int,
ID_genero int,
primary key (ID_pelicula, ID_genero),
foreign key (ID_pelicula) references PELICULA(ID),
foreign key (ID_genero) references GENERO(ID_genero));

Create table SECUELAS (
ID_secuela int auto_increment,
ID_pelicula int,
primary key(ID_secuela),
foreign key(ID_pelicula) references PELICULA(ID));