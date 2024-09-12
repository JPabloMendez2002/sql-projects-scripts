create database bdquiz
go
use bdquiz
go

create table empleados(
IdEmpleado int primary key identity(1,1),
nombre varchar (200),
IdJefe int foreign key references empleados(IdEmpleado)
)

INSERT INTO empleados(nombre, IdJefe)
VALUES
('JUAN',null),
('MARIA', null),
('MIGUEL', 1),
('SONIA', 2),
('ANA', 2)

DECLARE @temp TABLE(IdTemp int, nombre varchar(100), IdJefe int)


