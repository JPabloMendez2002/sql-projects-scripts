/*
Nombre:Jose Pablo Mendez Poveda
Cedula: 118480208
*/
create database bdExamenCaso1
go

Use bdExamenCaso1

Create table Salas
(
IdSala int primary key identity(1,1),
Sala varchar (20) not null check (Sala in ('Sala Baile', 'Sala Multiusos')),
)
go

Create table Actividades 
(
IdActvidad  int primary key identity(1,1),
CodActividad int not null unique,
NombreActividad varchar(300) not null,
Fecha date not null,
HoraIni time not null,
HoraFin time not null,
IdSala int not null foreign key references Salas(IdSala)
)
go

Create table Instructores 
(
IdInstructor  int primary key identity(1,1),
CedulaInstructor int not null unique,
NombreInstructor varchar(50) not null,
IdActvidad int not null foreign key references Actividades(IdActvidad)
)
go