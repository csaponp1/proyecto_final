/*

insert into empleados (nombres,apellidos,direccion,telefono,dpi,genero,fecha_nacimiento,idpuesto,fecha_inicio_labores,fechaingreso) values ('jose','manuel','ciudad','88888','8888888',1,'2002-03-01',4,'2022-03-01','2022-03-01');
select e.idempleado as id,e.nombres,e.apellidos,e.direccion,e.telefono,e.dpi,case when e.genero = 0 then 'FEMENINO' when e.genero = 1 then 'MASCULINO' else 'Unknown' end as sexo,p.puesto,e.fecha_nacimiento,e.fecha_inicio_labores,e.fechaingreso,e.genero,e.idpuesto from empleados as e inner join puestos as p on e.idpuesto = p.idPuesto order by idempleado;
SELECT p.idproductos AS id,p.producto,p.descripcion,p.imagen,p.precio_costo,p.precio_venta,p.existencia,cast(fecha_ingreso as Date) as fecha_ingreso,m.marca,m.idmarca FROM productos AS p INNER JOIN marcas AS m ON p.idmarca = m.idmarca;
select e.idempleado as id,e.nombres,e.apellidos,e.direccion,e.telefono,e.dpi,case when e.genero = 0 then 'FEMENINO' when e.genero = 1 then 'MASCULINO' else 'Unknown' end as sexo,p.puesto,e.fecha_nacimiento,e.fecha_inicio_labores,cast(fechaingreso as Date) as fechaingreso,e.genero,e.idpuesto from empleados as e inner join puestos as p on e.idpuesto = p.idPuesto order by idempleado;
select *from clientes;

insert into puestos (puesto) values (?);
update puestos set puesto = ? where idPuesto = ?;
delete from puestos where idPuesto = ?;
select p.idPuesto as id, p.puesto from puestos as p;
*/


