/*
insert into tipos_sangre (sangre) values ('E+');

SELECT *FROM tipos_sangre;
select *from estudiantes;



select id_tipo_sangre as id, sangre from tipos_sangre;

INSERT INTO estudiantes (carnet,nombres,apellidos,direccion,telefono,correo_electronico,id_tipo_sangre,fecha_nacimiento) VALUES (?,?,?,?,?,?,?,?);
select e.id_estudiante as id, e.carnet,e.nombres,e.apellidos,e.direccion,e.telefono,e.correo_electronico,s.sangre,e.fecha_nacimiento from estudiantes as e inner join tipos_sangre as s on e.id_tipo_sangre = s.id_tipo_sangre;

update estudiantes set carnet=?, nombres=?,apellidos=?,direccion=?,telefono=?,correo_electronico=?,id_tipo_sangre=?,fecha_nacimiento=? where id_estudiante=?;
delete from estudiantes where id_estudiante =?;
select e.id_estudiante as id, e.carnet,e.nombres,e.apellidos,e.direccion,e.telefono,e.correo_electronico,e.fecha_nacimiento,s.sangre,e.id_tipo_sangre from estudiantes as e inner join tipos_sangre as s on e.id_tipo_sangre = s.id_tipo_sangre order by id_estudiante;
select *from productos;

select *from marcas;

insert into clientes (nombres, apellidos, nit,genero,telefono,correo_electronico,fechaingreso) values('Sergio','Sol','8888888',0,'47777','soyunapreuba@gmail.com','2022-10-05 12-00-30');

insert into empleados (nombres,apellidos,direccion,telefono,dpi,genero,fecha_nacimiento,idpuesto,fecha_inicio_labores,fechaingreso)
values ('Agusto','Valle','Pastores','55555','199999',1,'2002-03-01',1,'1999-03-01','2022-03-01');

insert into puestos (puesto) values ('Techology Engineer');

insert into marcas (marca) values ('LaSabrosona');

insert productos (producto,idmarca,descripcion,imagen,precio_costo,precio_venta,existencia,fecha_ingreso)
values ('guitarra',1,'buena para tocar','0','100.00','120.20',90,'2022-03-01');

insert into proveedores (proveedor,nit,direccion,telefono) values ('AlchileSA','99999','ciudad de guatemala','999999999');

insert into puestos (puesto) values ('mantenimientor');
select idPuesto as id, puesto from puestos;
update puestos set puesto='gerente mantenimiento' where idPuesto = 4;

insert into empleados (nombres,apellidos,direccion,telefono,dpi,genero,fecha_nacimiento,idpuesto,fecha_inicio_labores,fechaingreso) values ('jose','manuel','ciudad','88888','8888888',1,'2002-03-01',4,'2022-03-01','2022-03-01');
*/

select e.idempleado as id,e.nombres,e.apellidos,e.direccion,e.telefono,e.dpi,case when e.genero = 0 then 'FEMENINO' when e.genero = 1 then 'MASCULINO' else 'Unknown' end as sexo,p.puesto,e.fecha_nacimiento,e.fecha_inicio_labores,e.fechaingreso,e.genero,e.idpuesto from empleados as e inner join puestos as p on e.idpuesto = p.idPuesto order by idempleado;






select *from empleados;








	
    
