create database bdMedicina
go

use bdMedicina



create table Pacientes
(
idPaciente int identity (1,1) primary key,
Cedula varchar(20),
NombrePaciente varchar(155),
Direccion varchar (155)
)
go



create table Hospitales
(
idHospital int identity (1,1) primary key,
Nombre varchar(100),

)
go

create table Especialidades
(
idEspecialidad int identity (1,1) primary key,
Nombre varchar(100),
Telefono varchar(155),
Direccion varchar (155),
)
go

create table Medicos
(
idMedico int identity (1,1) primary key,
NoMedico int,
NombreMedico varchar(155),
idEspecialidad int foreign key references Especialidades (idEspecialidad),
idHospital int foreign key references Hospitales (idHospital)
)
go

create table MedicoPaciente
(
idMedicoPaciente int identity (1,1) primary key,
idMedico int foreign key references Medicos (idMedico),
idPaciente int foreign key references Pacientes (idPaciente)
)
go