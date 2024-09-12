Create database bdPracticaSem7
go
use bdPracticaSem7
go

create table Empleados
(
Idempleado int identity (1,1) primary key,
Nombre varchar (100) not null,
Edad int not null,
Oficio varchar(40) not null,
Provincia varchar(30) not null,
FechaIngreso date not null,
Salario money not null,
Comision money not null,
NomDepto varchar(100)
)
go

insert into Empleados (Nombre, Edad, Oficio, Provincia, FechaIngreso, Salario, Comision, NomDepto)
values 
('Donald Chandra', 28, 'Vendedor','Cartago','20001025',300000, 0 ,'Ventas'),


('Dale Shen', 28, 'Analista','San Jose','19920303',250000, 25000,'Informatica'),
('Preston Rodriguez',25,'Director','Cartago','20011028',5800000,30000,'Recursos Humanos'),
('Christian A Thomas',35,'Vendedor','Heredia','19900123',450000,0,'Ventas'),
('Jose J Hall',22,'Vendedor','San Jose','19950102',259000,0,'Ventas'),
('Darrell Goel',36,'Presidente','Alajuela','20000102',850000,15000,'Gerencia'),
('Niccole J Williams',32,'Oficinista','Cartago','20020506',350000,0,'Contabilidad')

Select * From Empleados

Select Idempleado, Nombre from Empleados


Select Idempleado, Nombre, Oficio from Empleados Where Oficio = 'Vendedor'


Select Nombre, Oficio from Empleados where Nombre like '%Jose%'

Select Nombre, Salario from Empleados where (Salario >= 200000 and Salario <= 350000)

Select Nombre, Edad from Empleados where (Edad < 30)

Select Idempleado, Nombre, Salario, Comision from Empleados Where (Comision > 0 and Oficio = 'Analista')


Select Nombre, Salario, Comision from Empleados Where (Salario > 400000 and Comision > 0)