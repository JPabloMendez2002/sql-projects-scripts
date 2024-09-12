create database bdEmpresa
go


use bdEmpresa
go

create table Departamentos
(
idDepto int identity (1,1) primary key,
Nombre varchar(100),
)
go

create table Empleados
(
idEmpleado int identity (1,1) primary key,
Nombre varchar(200),
Salario  money,
FechaIngreso date,
idDepto int foreign key references Departamentos (idDepto)
)
go
