create database bdGimmnasio
go

use bdGimmnasio
go

create table Socio
(
IdSocio int identity(1,1) primary key,
Nombre varchar(100),
Apellidos varchar(50),
Telefono varchar(30),
Direccion varchar(300),
Profesion varchar(200),
)
go

create table Sala
(
IdSala int identity (1,1) primary key,
MetrosCuadrados int,
Ubicacion varchar(100),
TipoSala varchar(100)
)
go

create table  Monitor
(
IdMonitor int identity (1,1) primary key,
Cedula varchar(10),
Nombre varchar(100),
Telefono varchar(20),
Titulacion varchar(300),
Experencia varchar (400)
)
go


create table Aparato
(
IdAparato int identity (1,1) primary key,
Descripcion varchar(300),
EstadoConservasion varchar(400),
IdSala int foreign key references Sala (IdSala)
)
go

create table Clase
(
IdClase int identity (1,1) primary key,
Descripcion varchar(300),
Dia int,
Hora int,
IdMonitor int foreign key references Monitor (IdMonitor),
IdSala int foreign key references Sala (IdSala)
)
go

create table Inscripcion
(
IdInscripcion int identity (1,1) primary key,
FechaInscripcion date,
IdClase int foreign key references Clase (IdClase),
IdSocio int foreign key references Socio (IdSocio)
)
go
