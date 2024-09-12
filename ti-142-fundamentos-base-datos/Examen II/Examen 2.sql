/* NOMBRE: JOSE PABLO MENDEZ POVEDA
   CEDULA: 118480208
*/

create database bdExamen2
go

Use bdExamen2
go

Create table CategoriaSalario(
IdCategoriaSalario int primary key not null identity(1,1),
Nombre varchar(200) not null,
SalarioBase money
)
go


Create table Capacitaciones(
IdCapacitacion int primary key not null identity(1,1),
Nombre varchar(200) not null,
FechaInicio date,
FechaFin date
)
go

Create table Puestos(
IdPuesto int primary key not null identity(1,1),
Nombre varchar(200) not null,
IdCategoriaSalario int not null foreign key references CategoriaSalario(IdCategoriaSalario)
)
go

Create table Empleados(
IdEmpleado int primary key not null identity(1,1),
Nombre varchar(200) not null,
Apellido varchar(200) not null,
Cedula int not null,
Direccion varchar (250) not null,
Telefono varchar (40) not null,
Correo varchar (50) not null,
IdPuesto int not null foreign key references Puestos(IdPuesto)
)
go

Create table EmpleadoCapacitacion(
IdEmpleadoCapacitacion int primary key not null identity(1,1),
IdCapacitacion int not null foreign key references Capacitaciones(IdCapacitacion),
IdEmpleado int not null foreign key references Empleados(IdEmpleado)
)
go

insert into CategoriaSalario(Nombre, SalarioBase)
VALUES
('Jefatura', 750000),
('Técnico', 650000),
('Profesional', 8500000)


insert into Capacitaciones(Nombre, FechaInicio, FechaFin)
VALUES
('Expresion Oral', '20220501', '20220701'),
('Project', '20220601', '20220801'),
('Power BI', '20220901', '20221101'),
('Python', '20221001', '20221201')

insert into Puestos(Nombre, IdCategoriaSalario)
VALUES
('Jefe',1),
('Programador',3),
('Operario', 2),
('Oficinista',2)

insert into Empleados(Nombre, Apellido, Cedula, Direccion, Telefono, Correo, IdPuesto)
VALUES
('HENRY','MENDOZA',303340876,'PARAISO','78906544','rojas@examen2.com',1),
('JULIO','PEREZ',301230456,'TEJAR','65342211','perez@examen2.com',2),
('DANIEL','MENESES',304560231,'PARAISO','66906534','monge@examen2.com',3),
('SEBASTIAN','PEREIRA',304560987,'OREAMUNO','69906744','pereira@examen2.com',3),
('ANA','PEREZOZA',302440896,'TEJAR','87095644','brenes@examen2.com',4),
('CARLOS','MENDEZ',302540553,'OREAMUNO','64547832','mendez@examen2.com',4)

insert into EmpleadoCapacitacion(IdCapacitacion, IdEmpleado)
VALUES
(1,3),
(1,4),
(3,2),
(4,2),
(2,5),
(2,6)

---PARTE 2 DE CONSULTAS

---PASO 1 CAMBIE 'FO' POR 'ME'
Select Cedula, Nombre, Apellido from Empleados WHERE Apellido like '%ME%'

---PASO 2
Select Cedula, Nombre, Apellido from Empleados order by Apellido desc

---PASO 3 
Select e.Nombre, e.Apellido, d.Nombre Puesto from Empleados e join Puestos d on (e.IdPuesto = d.IdPuesto) where d.Nombre = 'Oficinista' and e.Nombre = 'Carlos'

---PASO 4
Select Nombre, Apellido, Direccion, Cedula from Empleados WHERE Direccion = 'OREAMUNO'

---PASO 5
Select e.Cedula,e.Nombre, e.Apellido, d.Nombre Puesto from Empleados e join Puestos d on (e.IdPuesto = d.IdPuesto) where d.Nombre = 'Oficinista' 

---PASO 6
 Select  d.Nombre Puesto, e.Nombre, e.Direccion from Empleados e join Puestos d on (e.IdPuesto = d.IdPuesto) where e.Direccion = 'TEJAR' OR  e.Direccion = 'PARAISO' OR e.Direccion = 'OREAMUNO'

---PASO 7 CAMBIE EL AÑO 2022, POR MES MAYOR A 08 (AGOSTO)
Select Nombre, FechaInicio from Capacitaciones where (FechaInicio > '20220801')

---PASO 8
Select Nombre, SalarioBase from CategoriaSalario order by SalarioBase asc

---PASO 9
Select  e.Nombre, e.Cedula ,e.Apellido, d.Nombre Puesto, j.SalarioBase Salario from Empleados e right join 
Puestos d on (e.IdPuesto = d.IdPuesto) left join CategoriaSalario j on (j.IdCategoriaSalario = d.IdCategoriaSalario)
order by Apellido asc
