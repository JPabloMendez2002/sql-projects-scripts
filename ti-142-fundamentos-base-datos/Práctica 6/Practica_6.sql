create database bdPracticaSem8
go

use bdPracticaSem8
go

----PASO 1
create table Empleados(
IdEmpleado int identity (1,1) primary key,
Nombre varchar(200) not null,
Edad int not null,
Oficio varchar (50) not null,
Provincia varchar(50) not null,
FechaIngreso date not null,
Salario money not null,
Comision money not null,
Departamento varchar (100)
)
go
----PASO 2
insert into Empleados (Nombre, Edad, Oficio, Provincia, FechaIngreso, Salario, Comision, Departamento)
values 
('Donald Chandra', 28, 'Vendedor','Cartago','20001025',300000, 0 ,'Ventas'),
('Dale Shen', 28, 'Analista','San Jose','19920303',250000, 25000,'Informatica'),
('Preston Rodriguez', 25, 'Director','Cartago','20011028',580000, 30000,'Recursos Humanos'),
('Christian A Thomas',35,'Vendedor','Heredia','19900123',450000,0,'Ventas'),
('Jose J Hall',22,'Vendedor','San Jose','19950102',259000,0,'Ventas'),
('Darrell Goel',36,'Presidente','Alajuela','20000102',850000,15000,'Gerencia'),
('Niccole J Williams',32,'Oficinista','Cartago','20020506',350000,0,'Contabilidad')

----PASO 3
insert into Empleados (Nombre, Edad, Oficio, Provincia, FechaIngreso, Salario, Comision, Departamento)
values 
('Jose Pablo Mendez', 25, 'Analista','Cartago','20020813',350000, 75000 ,'Informatica'),
('Juan Lopez', 39, 'Analista','Alajuela','19991002',550000, 95000 ,'Informatica'),
('Silvia Leiva', 28, 'Vendedor','San Jose','19980803',450000, 0,'Ventas'),
('Christian Brenes',35,'Vendedor','Heredia','19950929',23000,0,'Ventas'),
('Xinia Leiton',40,'Vendedor','Heredia','19930621',340000,0,'Ventas'),
('Bryan Obando',32,'Oficinista','Cartago','20001106',390000,0,'Contabilidad'),
('Priscilla Hernandez',31,'Oficinista','San Jose','20031201',300000,0,'Contabilidad'),
('Sebastian Perez',38,'Presidente','Heredia','20010402',650000,15000,'Gerencia')

----PASO 4
Select Oficio, AVG(Salario) Promedio_Oficio, COUNT(*) Empleados from Empleados group by Oficio
 
----PASO 5
Select Provincia, COUNT(*) as Empleados, sum(Salario) as Total from Empleados group by Provincia

----PASO 6
Select Oficio, COUNT(*) as Empleados, sum(Salario) as Total ,sum(Comision) as Comision from Empleados group by Oficio

----PASO 7
Select Oficio,AVG(Salario) as Promedio_Salario from Empleados WHERE (Salario >= 300000) group by Oficio

----PASO 8
Select Provincia,AVG(Comision) as Promedio_Comision from Empleados WHERE (Comision >= 20000) group by Provincia

----PASO 9
Select Nombre, Edad, Oficio from Empleados order by Oficio

----PASO 10
Select Oficio, COUNT(*) as Cantidad_Empleados from Empleados group by Oficio having COUNT(*)>=1

----PASO 11
Select Provincia, COUNT(*) as Cantidad_Empleados from Empleados group by Provincia having COUNT(*)>=2

----PASO 12
Select Oficio, AVG(Salario) as Promedio from Empleados WHERE Oficio = 'Vendedor' group by Oficio

---PASO 13 
Select Oficio, AVG(Edad) as Promedio_Edad from Empleados WHERE (Salario >= 350000) group by Oficio