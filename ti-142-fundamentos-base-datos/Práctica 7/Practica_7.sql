create database bdPracticaSem9
go

use bdPracticaSem9
go

----PASO 1

create table Departamentos(
IdDepto int identity (1,1) primary key,
Departamento varchar (50) not null,
Edificio varchar (10) not null
)
go

create table Empleados(
IdEmpleado int identity (1,1) primary key,
Nombre varchar(200) not null,
Edad int not null,
Oficio varchar (50) not null,
Provincia varchar(50) not null,
FechaIngreso date not null,
Salario money not null,
Comision money not null,
IdDepto int not null foreign key references Departamentos(IdDepto) 
)
go

insert into Departamentos(Departamento, Edificio)
values
('Ventas', 'A'),
('Informática', 'B'),
('Recursos Humanos', 'B'),
('Gerencia', 'A'),
('Contabilidad', 'B')

insert into Empleados (Nombre, Edad, Oficio, Provincia, FechaIngreso, Salario, Comision, IdDepto)
values 
('Donald Chandra', 28, 'Vendedor','Cartago','20001025',300000, 25000 ,1),
('Dale Shen', 28, 'Analista','San Jose','19920303',250000, 0,2),
('Preston Rodriguez', 25, 'Director','Cartago','20011028',580000, 30000,3),
('Christian A Thomas',35,'Vendedor','Heredia','19900123',450000,0,1),
('Jose J Hall',22,'Vendedor','San Jose','19950102',259000,0,1),
('Darrell Goel',36,'Presidente','Alajuela','20000102',850000,15000,4),
('Niccole J Williams',32,'Oficinista','Cartago','20020506',350000,0,5),
('Carlos Steven',25,'Oficinista','Cartago','20020206',400000,0,5)

----PASO 2 ---*
Select e.Nombre,e.Oficio,e.Provincia, d.Departamento from Empleados e join Departamentos d on (e.IdDepto = d.IdDepto) where d.Departamento = 'Ventas' order by e.Nombre

----PASO 3
Select Nombre, Salario, Provincia from Empleados WHERE (Salario >= 300000 and Salario <= 500000) order by Salario asc

----PASO 4
Select d.Departamento, COUNT(*) Cantidad from Empleados e join Departamentos d on (e.IdDepto = d.IdDepto) group by d.Departamento having count(*) >= 2 order by cantidad 

----PASO 5
Select e.Nombre, d.Departamento from Empleados e join Departamentos d on (e.IdDepto = d.IdDepto) where d.Departamento = 'Contabilidad' order by e.Nombre

----PASO 6
Select min(e.Salario) Salario_Menor, d.Departamento from Empleados e join Departamentos d on (e.IdDepto = d.IdDepto) where d.Departamento = 'Ventas' group by d.Departamento

----PASO 7
Select AVG(e.Salario) Promedio_Salario,d.Departamento from Empleados e join Departamentos d on (e.IdDepto = d.IdDepto) where d.Departamento = 'Contabilidad'  group by d.Departamento 

----PASO 8
Select d.Departamento, COUNT(*) Cantidad from Empleados e join Departamentos d on (e.IdDepto = d.IdDepto) where d.Departamento = 'Ventas' group by d.Departamento

----PASO 9
Select d.Departamento, COUNT(*) Cantidad_Empleados from Empleados e join Departamentos d on (e.IdDepto = d.IdDepto) group by d.Departamento order by Cantidad_Empleados asc
