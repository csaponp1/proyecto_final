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
select p.idproductos as id,p.producto, m.marca, p.descripcion, p.existencia, p.fecha_ingreso,p.precio_costo from prod	uctos as p inner join marcas as m on p.idmarca=m.idmarca;
*/

select *from proveedores;
select idproveedores as id, proveedor from proveedores order by id;
SELECT * FROM proveedores where idproveedores ='5';
select *from productos;
SELECT `ventas_detalle`.`idventas_detalle`,
    `ventas_detalle`.`idventa`,
    `ventas_detalle`.`idproducto`,
    `ventas_detalle`.`cantidad`,
    `ventas_detalle`.`precio_unitario`
FROM `bd_final_csapon`.`ventas_detalle`;

select *from ventas;

SELECT (max(nofactura) + 1) as nofactura FROM ventas;





