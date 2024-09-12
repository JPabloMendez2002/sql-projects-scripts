create database bdPracticaSem12
go

use bdPracticaSem12
go


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


create table SalarioMensual(
IdSalario int identity (1,1) primary key,
Anno int,
Mes varchar(30),
SalarioBase money,
Comision money,
Deducciones money,
SalarioMensual money,
IdEmpleado int not null foreign key references Empleados(IdEmpleado) 
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

