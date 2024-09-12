create database bdPracticaSem6
go

Use bdPracticaSem6
go


create table Clientes
(
IdCliente int primary key identity(1,1),
Nombre varchar (100) not null,
Apellidos varchar(100) not null,
Direccion varchar(300) not null,
Telefono varchar(100) not null,
)
go

create table Planes
(
IdPlan int primary key identity(1,1),
Nombre varchar (100) not null,
FechaInicio date not null,
Costo money not null,
)
go

create table Canales
(
IdCanal int primary key identity(1,1),
Nombre varchar(100) not null,
NumCanala varchar (20) not null
)
go

create table PlanClienteInstalacion
(
IdPlanClienteInstalacion int primary key identity(1,1),
FechaInstala date not null,
FechaDesinsta date not null,
IdPlan int not null foreign key references Planes(IdPlan),
IdCliente int not null foreign key references Clientes(IdCliente)
)
go

create table PlanCanales
(
IdPlanClanal int primary key identity(1,1),
FechaCreacion date not null,
IdPlan int not null foreign key references Planes(IdPlan),
IdCanal int not null foreign key references Canales(IdCanal)
)
go


create table PlanClienteMensual
(
IdPlanCliente int primary key identity(1,1),
FechaInicio date not null,
FechaFin date not null,
Subtotal money not null,
Impuesto money not null,
Total money not null,
IdPlan int not null foreign key references Planes(IdPlan),
IdCliente int not null foreign key references Clientes(IdCliente)
)
go

-- PASO 2
insert	into Canales 
(Nombre, NumCanala)
values
('Xpert TV', '42'),
('Telenoticias', '07'),
('Multimedios', '08')

--CONSULTA DEL PASO 2 
Select * FROM Canales

--PASO 3
insert into Clientes
(Nombre, Apellidos, Direccion, Telefono)
values
('Carlos','Salas Mena','Tejar, Cartago','874653523'),
('Sofia','Aguilera Brenes','Escazu, San Jose','6083837633'),
('Juan','Mendez Lopez','Guadalupe, Cartago','704847442')

--CONSULTA DEL PASO 3
Select * FROM Clientes


--PASO 4
insert into Planes
(Nombre, FechaInicio, Costo)
values
('Carlos Salas Mena','20220324',30000),
('Sofia Aguilera Brenes','20220628',40000)

--CONSULTA DEL PASO 4
Select * FROM Planes

--PASO 5
insert into PlanCanales
(IdPlan, IdCanal, FechaCreacion)
values
(1,2,'20220421')

--CONSULTA DEL PASO 5
Select * FROM PlanCanales


--PASO 6
update Clientes
set Telefono = '123456' where IdCliente = 1
--CONSULTA DEL PASO 6
Select * FROM Clientes

--PASO 7
delete from Clientes where IdCliente = 3
--CONSULTA DEL PASO 7
Select * FROM Clientes