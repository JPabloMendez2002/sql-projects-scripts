create database bdProyectos
go

Use bdProyectos

create Table Clientes 
(
idCliente int primary key identity(1,1),
NombreCliente varchar (200) not null,
Cedula varchar (20) not null unique,
Direccion varchar (300) not null,
Provincia varchar (20) not null check (Provincia in ('Cartago','San Jose','Heredia','Alajuela','Guanacaste', 'Limon', 'Puntarenas')),								         
Correo varchar (200) not null,
Telefono varchar (30) not null,
)

go
create Table Departamentos 
(
idDepto int primary key identity(1,1),
NombreDepto varchar (300) not null,
Ciudad varchar (200) not null,
Telefono varchar (30) not null,
)
go


create Table Proyectos 
(
idProyecto int primary key identity(1,1),
NombreProyecto varchar (300) not null,
Precio money not null check (Precio >=0),
FechaInicio date not null,
FechaPreAviso date not null,
FechaFin date not null,
idCliente int not null foreign key references Clientes (idCliente)
)
go

create Table Empleados 
(
idEmpleado int primary key identity(1,1),
NombreEmpleado varchar (300) not null,
ApellidoEmpleado varchar (200) not null,
Salario money not null check (Salario >=0),
idDepto int not null foreign key references Departamentos (idDepto),
idProyecto int not null foreign key references Proyectos (idProyecto),
)
go