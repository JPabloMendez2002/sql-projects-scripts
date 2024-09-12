create database bdPracticaSem13;

use bdPracticaSem13;



create table Departamentos(
IdDepto int auto_increment primary key,
Departamento varchar (50) not null,
Edificio varchar (10) not null
);

create table Empleados(
IdEmpleado int auto_increment primary key,
Nombre varchar(200) not null,
Edad int not null,
Oficio varchar (50) not null,
Provincia varchar(50) not null,
FechaIngreso date not null,
Salario decimal not null,
Comision decimal not null,
IdDepto int null,
foreign key (IdDepto) references Departamentos(IdDepto)
);

insert into Departamentos(Departamento, Edificio)
values
('Ventas', 'A'),
('Informática', 'B'),
('Recursos Humanos', 'B'),
('Gerencia', 'A'),
('Contabilidad', 'B');

insert into Empleados (Nombre, Edad, Oficio, Provincia, FechaIngreso, Salario, Comision, IdDepto)
values 
('Donald Chandra', 28, 'Vendedor','Cartago','20001025',300000, 25000 ,1),
('Dale Shen', 28, 'Analista','San Jose','19920303',250000, 0,2),
('Preston Rodriguez', 25, 'Director','Cartago','20011028',580000, 30000,3),
('Christian A Thomas',35,'Vendedor','Heredia','19900123',450000,0,1),
('Jose J Hall',22,'Vendedor','San Jose','19950102',259000,0,1),
('Darrell Goel',36,'Presidente','Alajuela','20000102',850000,15000,4),
('Niccole J Williams',32,'Oficinista','Cartago','20020506',350000,0,5),
('Carlos Steven',25,'Oficinista','Cartago','20020206',400000,0,5);

/*----PUNTO 3------*/
delimiter $$
create procedure Punto3()
	select e.Nombre, e.Oficio, e.Provincia, d.Departamento  FROM Empleados e join Departamentos d on (e.IdDepto = d.IdDepto) where d.Departamento = 'Ventas';
delimiter;

/*----PUNTO 4------*/
delimiter $$
create procedure Punto4()
	select Nombre, Salario, Provincia  FROM Empleados WHERE (Salario <= 300000) and (Salario >= 200000);
delimiter;

/*----PUNTO 5------*/
delimiter $$
create procedure Punto5()
	select e.Nombre, e.Oficio, e.Provincia, d.Departamento  FROM Empleados e join Departamentos d on (e.IdDepto = d.IdDepto) where d.Departamento = 'Contabilidad' order by e.Nombre;
delimiter;

/*----PUNTO 6------*/
delimiter $$
create procedure Punto6()
	select e.Nombre, e.Salario, e.Provincia, d.Departamento  FROM Empleados e join Departamentos d on (e.IdDepto = d.IdDepto) where d.Departamento = 'Ventas' order by e.Salario ASC;
delimiter;

/*----PUNTO 7------*/
delimiter $$
create procedure Punto7()
	select d.Departamento, count(*) Cantidad_Empleados  FROM Empleados e join Departamentos d on (e.IdDepto = d.IdDepto) where d.Departamento = 'Ventas' group by d.Departamento;
delimiter;


/*----------------PROCESOS---------------*/
CALL Punto3;
CALL Punto4;
CALL Punto5;
CALL Punto6;
CALL Punto7;
/*---------SELECTS---------*/
SELECT * FROM Empleados;
SELECT * FROM Departamentos;


