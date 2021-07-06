
create view	WVusers
as

select U.NombreUsuario,D.Nombre,D.Apellido,D.Email,D.Direccion,D.Telefono from Usuarios U inner join DatosPersonales D on D.Idusuario=U.Id

select NombreUsuario,Nombre,Apellido,Email,Direccion,Telefono from WVusers


