create database bdRestaurante
go

use bdRestaurante
go

create table Categoria
(
IdCategoria int identity(1,1) primary key,
NombrePlato varchar(100),
Categoria varchar(50),
DescripcionCategoria varchar(300),
NombreEncargado varchar(100),
)
go

create table Plato
(
IdPlato int identity(1,1) primary key,
Categoria varchar(50),
NombrePlato varchar(100),
Descripcion varchar(300),
NivelDificultad varchar(100),
Foto image,
PrecioFinal money,
IdCategoria int foreign key references Categoria (IdCategoria)
)

go
create table Recetas
(
IdRecetas int identity(1,1) primary key,
Descripcion varchar(300),
Ingrediente varchar (400),
CantidadRequerida varchar(300),
UnidadMedida varchar(200),
CantidadAlmacen int,
IdCategoria int foreign key references Categoria (IdCategoria)
)
go

create table Ingredientes
(
IdIngrediente int identity(1,1) primary key,
NombreIngrediente varchar(300),
Cantidad int,
IdCategoria int foreign key references Categoria (IdCategoria)
)
go