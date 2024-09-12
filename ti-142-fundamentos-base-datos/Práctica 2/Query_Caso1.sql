create database bdLibros
go

use bdLibros
go

create table Libros
(
idLibro int identity(1,1) primary key,
NombreLibro varchar(100),
AutorLibro varchar(100),
EditorialLibro varchar(100),
)
go

create table Lectores
(
idNombreLector  int identity(1,1) primary key,
FechaDevolucion date,
idLibro int foreign key references Libros(idLibro)
)
go