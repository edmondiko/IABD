#Part 1

# 1
SELECT * FROM PISOS.piso;
#2
SELECT direccion,fecha_construccion FROM PISOS.piso;
#3
SELECT * FROM PISOS.piso where precio <300000;
#4
SELECT direccion,precio FROM PISOS.piso where garaje=1;
#5
SELECT * FROM PISOS.piso where year(fecha_construccion) between 1970 and 1980;
#6
SELECT * FROM PISOS.piso where (year(fecha_construccion) between 2001 and 2100 ) and precio < 350000 ;
#7
SELECT * FROM PISOS.piso where ascensor = 1 and garaje =1 and metros_2 > 80;
#8
SELECT * FROM PISOS.piso where poblacion not in ("Barcelona","Badalona","Castelldefels") and precio < 250000 order by poblacion
#9
SELECT * FROM PISOS.piso where year(fecha_construccion) > 2016
#10
SELECT * FROM PISOS.piso where poblacion not in ("Barcelona","Madrid","Vic")
#11
SELECT direccion,(precio*0.1) as precio FROM PISOS.piso where poblacion ="Barcelona"
#12
select distinct poblacion from PISOS.piso
#13
#select * from PISOS.piso where direccion like '%rambla%'17
#14
select  * from PISOS.piso order by precio desc limit 5
#15
delete from PISOS.piso where numero_habitaciones <= 3
#16
DELETE FROM PISOS.piso ;
#17
DROP TABLE PISOS.piso ;
#18
DROP DATABASE PISOS;

#Exerici 2
#Los primeros estan hechos con selectsdentro de selects porque pensaba que era obligatorio hacerlo asi, lo siento, se que se pueden hacer la mayoria coninner joins o sus respectivos pero me parece mas comodo asi sobretodo los ultimos ejercicios
#1
select * from `PROVEEDOR` where idproveedor in (select idproveedor from `PROVEEN` where idproducto in (select idproducto from `PRODUCTOS` where nombre like 'condensador'))
#2
select * from PRODUCTOS where idproducto in (select idproducto from PROVEEN where idproveedor in (select idproveedor from PROVEEDOR where nombre like 'Electrònica Vivas'))
#3
select * from CLIENTES where idcliente in (select idcliente from FACTURA as a where (select MAX(fechaalta)from FACTURA as b where a.idcliente = b.idcliente) < '2012-07-01')
#4
select distinct * from `CLIENTES` where idcliente in (select idcliente from `FACTURA` where idfactura in (select idfactura from `LINEASFRA` where idproducto in (select idproducto from PRODUCTOS where nombre like '%Resistència%')))
#5
select * from `CLIENTES` where idcliente in (select idcliente from `FACTURA` where idfactura in (select idfactura from `LINEASFRA` where idproducto in (select idproducto from PRODUCTOS where nombre like '%Díode%') and idunidades>1))
#6
select c.nombre ,sum(l.idunidades) as suma from CLIENTES c
inner join FACTURA f on f.idcliente = c.idcliente
inner join LINEASFRA l on l.idfactura = f.idfactura
group by c.nombre
#7
select sum(l.idunidades) suma  from LINEASFRA l
inner join FACTURA f on f.idfactura = l.idfactura
where f.fechaalta > '2012-01-07' and f.fechaalta < '2012-10-01'
#8
select p.nombre from PRODUCTOS p
inner join COMPONENTES c on p.idproducto=c.idcomponente
where c.idproducto=(Select idproducto from PRODUCTOS where nombre ="Transistor")
#9
select p.nombre from PRODUCTOS p
inner join COMPONENTES c on p.idproducto=c.idproducto
where c.idcomponente=(Select idproducto from PRODUCTOS where nombre ="Condensador")
#10
select p.nombre, Descuento d from PRODUCTOS p, DESCUENTOS d
where p.precio between d.PrecioMin and d.PrecioMax
#11
select f.idfactura, sum(((p.precio*l.idunidades)*d.Impuesto)*p.precio*l.idunidades) as precio_final from PRODUCTOS p, DESCUENTOS d, FACTURA f,LINEASFRA l
where p.precio between d.PrecioMin and d.PrecioMax and l.idfactura=f.idfactura and l.idproducto=p.idproducto
group by f.idfactura
#12
select * from PRODUCTOS
where (select avg(precio) from PRODUCTOS)<precio
#13
select c.nombre,sum(l.idunidades) as cantidad_productos from CLIENTES c,LINEASFRA l, FACTURA f
where f.fechaalta between '2012-06-01' and '2012-12-31' and c.idcliente=f.idcliente and l.idfactura=f.idfactura
group by c.idcliente
having cantidad_productos > 40
#14
select distinct c.nombre,p.nombre,j.nombre from CLIENTES c, PRODUCTOS p, FACTURA f, LINEASFRA l, PROVEEDOR j, PROVEEN n
where c.idcliente = f.idcliente and f.idfactura=l.idfactura and l.idproducto= n.idproducto and n.idproveedor = j.idproveedor and p.idproducto = n.idproducto