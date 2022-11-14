#ex 1
INSERT INTO `peliculas`.`GENERO` (`genero`) VALUES ('Miedo');
INSERT INTO `peliculas`.`GENERO` (`genero`) VALUES ('Comedia');
INSERT INTO `peliculas`.`GENERO` (`genero`) VALUES ('Ciencia Ficción');
INSERT INTO `peliculas`.`GENERO` (`genero`) VALUES ('Drama');

#ex2
INSERT INTO `peliculas`.`VOTO` (`media_votos`, `cantidad`) VALUES ('4', '5');
INSERT INTO `peliculas`.`VOTO` (`media_votos`, `cantidad`) VALUES ('3', '7');
INSERT INTO `peliculas`.`VOTO` (`media_votos`, `cantidad`) VALUES ('10', '34');
INSERT INTO `peliculas`.`VOTO` (`media_votos`, `cantidad`) VALUES ('7', '123');

#ex3 hay que añadir un voto porque la clave foranea lo necesita
INSERT INTO `peliculas`.`VOTO` (`media_votos`, `cantidad`) VALUES ('7.5', '243');

INSERT INTO `peliculas`.`PELICULA` (`titulo`, `nota`, `fecha`, `ID_voto`) VALUES ('La vida de Pi', '4', '23/07/2005', '1');
INSERT INTO `peliculas`.`PELICULA` (`titulo`, `nota`, `fecha`, `ID_voto`) VALUES ('Interestellar', '3', '24/07/2005', '2');
INSERT INTO `peliculas`.`PELICULA` (`titulo`, `nota`, `fecha`, `ID_voto`) VALUES ('Gran Torino', '10', '25/07/2005', '3');
INSERT INTO `peliculas`.`PELICULA` (`titulo`, `nota`, `fecha`, `ID_voto`) VALUES ('La naranja mecanica', '7', '26/07/2005', '4');
INSERT INTO `peliculas`.`PELICULA` (`titulo`, `nota`, `fecha`, `ID_voto`) VALUES ('La chaqueta metalica', '7.5', '27/07/2005', '5');

#ex4
INSERT INTO `peliculas`.`GASTO` (`gastos`, `ingresos`, `ID_pelicula`) VALUES ('300', '1000', '1');
INSERT INTO `peliculas`.`GASTO` (`gastos`, `ingresos`, `ID_pelicula`) VALUES ('60000', '300', '2');
INSERT INTO `peliculas`.`GASTO` (`gastos`, `ingresos`, `ID_pelicula`) VALUES ('343443', '1212', '3');

#ex5
UPDATE `peliculas`.`GASTO` SET `gastos` = '2', `ingresos` = '77' WHERE (`ID_GASTO` = '2');

#ex6 Hay que añadir mas votos para crear las peliculas las cuales seran secuelas
INSERT INTO `peliculas`.`VOTO` (`media_votos`, `cantidad`) VALUES ('5', '3000');
INSERT INTO `peliculas`.`VOTO` (`media_votos`, `cantidad`) VALUES ('6', '9090');

INSERT INTO `peliculas`.`PELICULA` (`titulo`, `nota`, `fecha`, `ID_voto`) VALUES ('Interestellar 2', '5', '28/07/2005', '6');
INSERT INTO `peliculas`.`PELICULA` (`titulo`, `nota`, `fecha`, `ID_voto`) VALUES ('Interestelar 3', '6', '29/07/2005', '7');

INSERT INTO `peliculas`.`SECUELAS` (`ID_secuela`, `ID_pelicula`) VALUES ('2', '8');
INSERT INTO `peliculas`.`SECUELAS` (`ID_secuela`, `ID_pelicula`) VALUES ('8', '9');
