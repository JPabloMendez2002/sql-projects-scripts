create database bdOrdenes
go

use bdOrdenes
go

create table Clientes
(
idCliente int identity(1,1) primary key,
Nombre varchar(100),
Estado varchar(100),
)
go

create table Articulos
(
idArticulo  int identity(1,1) primary key,
Nombre varchar(100),
Cantidad varchar(300),
Precio money,
)
go

create table Ordenes
(
idOrden  int identity(1,1) primary key,
Fecha date,
idCliente int foreign key references Clientes(idCliente),
idArticulo int foreign key references Articulos(idArticulo)
)
go
