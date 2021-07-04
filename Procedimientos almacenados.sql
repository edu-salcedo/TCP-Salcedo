

  --*********************************************************************************
--                  procedimiento lamacenado para insertar datos
--*********************************************************************************

  create procedure SPinsertDatos
  @iduser int,
  @nombre varchar(20),
  @apellido varchar(20),
  @dni int,
  @telefono int,
  @direccion varchar(50),
  @mail varchar(100)
  as
  begin 
  begin try
     insert into DatosPersonales(Idusuario,Nombre,Apellido,DNI,Telefono,Direccion,Email )values (@iduser,@nombre,@apellido,@dni,@telefono,@direccion,@mail)
	 end try
	 begin catch
	       raiserror('el usuario no existe',16,1) 
	 end catch
  end 
   --  Idusuario,Nombre,Apellido,DNI,Telefono,Direccion,Email 
    --*********************************************************************************
--                  procedimiento lamacenado para insertar  usuarios 
--*********************************************************************************
go
 create procedure SPInsertUsuario
  @Username varchar(20),
  @contrasena varchar(20),
  @idtipo int,
  @nombre varchar(20),
  @apellido varchar(20),
  @dni int,
  @telefono int,
  @mail varchar(100),
  @direccion varchar(50)
  as 
  declare @iduser int
  if @Username not in(select NombreUsuario from Usuarios)
    begin 
	insert into Usuarios(NombreUsuario,Contraseña,IdTipoUsuario)values (@Username,@contrasena,@idtipo)
    select @iduser = (select max(id) from Usuarios)
    exec SPinsertDatos @iduser,@nombre,@apellido,@dni,@telefono,@direccion,@mail  --procedimiento almacenado anidado
	end              
  else 
     raiserror('el usuario ya existe',16,1)

	 exec SPInsertUsuario 'edu',123,1,'edu','salcedo',12345678,1222222,'edu@gmail.com','quintana 3155'


	 select *from DatosPersonales