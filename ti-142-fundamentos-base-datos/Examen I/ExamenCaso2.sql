/*
Nombre:Jose Pablo Mendez Poveda
Cedula: 118480208
*/
create database bdExamenCaso2
go

Use bdExamenCaso2


Create Table Pacientes
(
IdPaciente int primary key identity(1,1),
Nombre varchar(30) not null,
Apellidos varchar (60) not null,
Direccion varchar (200) not null,
Provincia varchar (20) not null check (Provincia in ('Cartago','San Jose','Heredia','Alajuela','Guanacaste', 'Limon', 'Puntarenas')),
CorreoElectronico varchar (100) not null unique,
Telefono varchar (20) not null,
FechaNacimiento date not null
)
go

Create Table Ingresos
(
IdIngreso int primary key identity(1,1),
IdPaciente int not null foreign key references Pacientes(IdPaciente),
FechaIngreso date not null,
NumHabitacion int not null check (NumHabitacion <= 40),
NumCama int not null check (NumCama <= 15),
FechaSalida date not null
)
go


Create Table Medicos
(
IdMedico int primary key identity(1,1),
Nombre varchar(30) not null,
Apellidos varchar (60) not null,
Telefono varchar (20) not null,
CorreoElectronico varchar (100) not null unique,
Especialidad varchar (100) not null,
IdIngreso int not null foreign key references Ingresos(IdIngreso)
)
go

Create table IngresoPaciente 
(
IdIngresoPaciente int primary key identity(1,1),
IdMedico int not null unique foreign key references Medicos(IdMedico)
)
