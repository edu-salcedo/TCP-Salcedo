--drop database Ecommerce
use master
create database Ecommerce
go 
use Ecommerce
go
create table Marca
(
   Id int not null primary Key identity (1,1),
   Nombre varchar(50) not Null
)
go
create table Categoria
(
  Id int not null primary Key identity (1,1),
  Nombre varchar(50) not Null,
  Imagen varchar(100)
)

go
create table TipoUsuario (
Id int not null primary Key identity (1,1),
Nombre varchar(50) not Null
)
go

create table Usuarios (
  Id int not null primary Key identity (1,1),
  NombreUsuario varchar(15) not Null unique,
  Contraseña varchar (200) not null,
  IdTipoUsuario int not null foreign key references TipoUsuario(Id),
)

go

create table DatosPersonales (
   Idusuario int not null primary Key,
   Nombre varchar(100) not Null,
   Apellido varchar(100) not Null,
   DNI int not null,
   Telefono int not null,
   Direccion varchar(100) not null,
   Email varchar (100) not null
)

go
alter table DatosPersonales
add constraint FK_DatosPersonales_IdUsuario foreign key (IdUsuario)references Usuarios (Id)
go


create table Producto (
   Id int not null primary Key identity (1,1),
   UrlImagen varchar (2000),
   Nombre varchar(50) not Null,
   Descripcion varchar (100) not null,
   idMarca int not null foreign key references Marca(id),
   idCategoria int not null foreign key references Categoria(id),
   Estado bit not null default (1),
   Precio money not  null check (Precio >0),
   Stock int not null
)
go

create table Venta (
  Id int not null primary Key identity (1,1),
  IdUsuario int not null foreign key references  Usuarios (Id),
  Fecha datetime not null,
  Importe money not null check (Importe >0),
  Tipopago int not null foreign key references TipoPago(id),
  IdEstado int not null foreign key references Estado(id)
)

go
create table Estado(
   id int not null primary key identity(1,1),
   Nombre varchar(30) not Null
)
select *from producto inner join estado on Producto.Estado=Estado.id

go
create table DetalleVenta (
   IdProducto int not null foreign key references Producto (Id),
   IdVenta int not null foreign key references Venta(Id),
   Precio money not  null check (Precio >0), 
   Cantidad int not null check (cantidad >0),
   primary key (IdProducto, IdVenta)
)

go
create table TipoPago (
Id int not null primary Key identity (1,1),
Nombre varchar(50) not Null
)

insert into TipoUsuario(Nombre) values('administrador')
insert into TipoUsuario(Nombre) values('cliente')

insert into Marca(Nombre) values('samsumg')
insert into Marca(Nombre) values('Aple')
insert into Marca(Nombre) values('Motorola')
insert into Marca(Nombre) values('Lenovo')


insert into Categoria(Nombre,Imagen) values('Celulares','https://images.fravega.com/s250/d0d1523c0007261e84635068a4bbad63.png')
insert into Categoria(Nombre,Imagen) values('Televisores','https://images.fravega.com/s250/e1845d91c77f353b58d9af2c87af4b39.png')
insert into Categoria(Nombre,Imagen) values('Notebooks','https://images.fravega.com/s250/1105c40ac70e0f390d16e9fc821a8518.png.webp')

insert into Producto(UrlImagen, Nombre,Descripcion,idMarca,idCategoria,Estado, Precio,Stock)
values('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4CdjHZImy48ZeevAMy_Und7ZXOQulacqJWw&usqp=CAU','Moto Edge','Nueva generacion',3,1,1,69000,4)

insert into Producto(UrlImagen, Nombre,Descripcion,idMarca,idCategoria,Estado, Precio,Stock)
values('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQeRtPB5Sm6Pti862alKeZJjI7RbQkV64nSCDby41ZfcNb-1w1asVnrWfNAQmMebyF3YS_6aLY&usqp=CAc','Samsung Series 7 UN55TU7000GCZB','LED 4K 55" 220V - 240V',1,2,1,80000,3)

insert into Producto(UrlImagen, Nombre,Descripcion,idMarca,idCategoria,Estado, Precio,Stock)
values('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJJ5ZPUCrK2cGI-YY5lBfOYUSHcfsKVPGQpg&usqp=CAU','Lenovo IdeaPad 14IIL05','Intel Core i5 1035G1 8GB de RAM 512GB SSD',4,3,1,99000,3)

insert into Producto(UrlImagen, Nombre,Descripcion,idMarca,idCategoria,Estado, Precio,Stock)
values('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6P4sCvvlXGFN5YagsifYwYaveqaazzEiTRA&usqp=CAU','iPhone XR 64 GB','Reconocimiento facial para mayor seguridad',2,2,1,110000,5)


insert into TipoPago (Nombre)values('MercadoPago')
insert into TipoPago (Nombre)values('Targeta de credito')
insert into TipoPago (Nombre)values('Targeta de Debito')
insert into TipoPago (Nombre)values('Rapipago')



insert into Estado(Nombre)values('En preparacion')
insert into Estado(Nombre)values('En Camino')
insert into Estado(Nombre)values('Entregado')
insert into Estado (Nombre)values('Cancelado')



