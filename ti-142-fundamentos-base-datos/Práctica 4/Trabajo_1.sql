create database bdclase6
go

 use bdclase6
 go

 create table Departamentos
 (
 IdDepto int primary key identity(1,1),
 Nombre varchar (100) not null,
 Siglas varchar(10) not null,
 Edificio varchar(100) not null
 )
go

create table Empleados
 (
 idEmpleado int primary key identity(1,1),
 Nombre varchar (100) not null,
 Cedula varchar(20) not null unique,
 Telefono varchar(100) not null,
 Direccion varchar(300) not null,
 CorreoE varchar(100) not null,
 Salario money not null check(Salario >=0),
 FechaNaci date not null,
 IdDepto int not null foreign key references Departamentos(IdDepto)

 )
go

--Actualizacion de información 

insert	into Departamentos 
(Nombre, Siglas, Edificio)
values
('Tecnologias de la Información', 'TI', 'Administracion'),
('Recursos Humanos', 'RH', 'Administracion'),
('Contabilidad', 'CO', 'Anexo 1')


Select * FROM Departamentos

insert into Empleados
(Nombre, Cedula, Telefono, Direccion, CorreoE, Salario, FechaNaci, IdDepto)
values
('Carlos Salas','118438473','874653523','Tejar, Cartago','carlos@gmail.com',500000,'20001122',3),
('Laura Durán','3303321332','608383732','Tobosi, Cartago','laura@gmail.com',520000,'19910312',1),
('Karla Goméz','79846432','84746322' ,'Tres Rios, La Unión','karla@gmail.com',480000,'19870823',2)

Select * from Empleados --Para ver los datos

update Empleados
set Telefono = '123456' where idEmpleado = 1


delete from Departamentos where IdDepto = 1 --No va dejar Borrar Departamento por ser FK

delete from Empleados where idEmpleado = 3

insert into Empleados
(Nombre, Cedula, Telefono, Direccion, CorreoE, Salario, FechaNaci, IdDepto)
values
('Sofia Salas','83837353','6554444','Tejar, Cartago','sofia@gmail.com',500000,'20001122',3)


delete from Empleados -- Primero se borra los datos luego se ejecuta

DBCC checkident (Empleados, RESEED, 0)-- Reiniciar el Autoincrement