
create view	WVusers
as
select U.NombreUsuario,D.Nombre,D.Apellido,D.Email,D.Direccion,D.Telefono,U.Id from Usuarios U inner join DatosPersonales D on D.Idusuario=U.Id




--esta vista se usa para listar los usuarion en la web

select NombreUsuario,Nombre,Apellido,Email,Direccion,Telefono from WVusers


