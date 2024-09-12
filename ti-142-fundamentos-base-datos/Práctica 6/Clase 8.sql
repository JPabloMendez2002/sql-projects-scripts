create database bdClase8
go

use bdClase8
go


create table Departamentos
(
IdDepto int identity (1,1) primary key,
Nombre varchar (100) not null,
Siglas varchar(20) not null,
Edificio varchar (100) not null,
)
go

create table Empleados
(
IdEmpleado int identity (1,1) primary key,
Nombre varchar (100) not null,
Cedula varchar(20) unique not null,
Telefono varchar(20) null,
Provincia varchar(20) not null,
Direccion varchar(300) not null,
CorreoE varchar(100) not null,
Salario money not null,
FechaNac date not null,
IdDepto int not null foreign key references Departamentos (IdDepto)
)
go


insert into Departamentos(Nombre, Siglas, Edificio)
values
('Tecnologia de Información', 'TI', 'Principal'),
('Recursos Humanos', 'RH', 'Administrativo'),
('Contabilidad', 'CO', 'Administrativo'),
('Mantenimiento', 'MA', 'Administrativo')

insert into Empleados (Nombre, Cedula, Telefono, Provincia, Direccion, CorreoE, Salario, FechaNac, IdDepto)
values 
('Juan Lopez','1184802098',null,'Cartago','Tejar','jaunlopez@cuc.cr',400000,'19980423', 1),
('Laura Lopez','337437744','76454322','Heredia','Moravia','lauralopez@cuc.cr',350000,'20000912',2),
('David Mendez','28287331','676845873','Heredia','Barva','davidmendez@cuc.cr',500000,'19901223',3),
('Carlos Gomez','56776422',null,'Cartago','Uvita','carlosgomez@cuc.cr',800000,'19980423',1),
('Emilia Poveda','767587522','99847422','Cartago','Guadalupe','emipoveda@cuc.cr',500000,'19880807',2),
('Mario Perez','67473873',null,'Heredia','Rossvelt','marioperez@cuc.cr',470000,'20010712',3)


insert into Empleados (Nombre, Cedula,Provincia, Direccion, CorreoE, Salario, FechaNac, IdDepto, Telefono)
values 
('Ana Perez','857575754','Heredia','Talamanca','anaperez@cuc.cr',600000,'19801123',1, null)

insert into Empleados (Nombre, Cedula,Provincia, Direccion, CorreoE, Salario, FechaNac, IdDepto)
values 
('Jorge Perez','32422111','Cartago','Tobosi','jorgeperez@cuc.cr',600000,'19870423',3)


insert into Empleados (Nombre, Cedula,Provincia, Direccion, CorreoE, Salario, FechaNac, IdDepto)
values 
('Xinia Hernandez','545465675','San Jose','Desamparados','xiniaherna@cuc.cr',800000,'19760812',1)

/* SELECTS */
 Select * from Empleados
 go

  Select * from Departamentos
 go


 --CONSULTAS POR GROUP BY 

 --ORDENA POR CANTIDAD DE EMPLEADOS EN CADA PROVINCIA
select Provincia, COUNT(*) from Empleados group by Provincia

--TOTAL QUE GANAN LOS QUE ESTAN EN PROVINCIA Y CON EL AS LE PONEMOS NOMBRE A LA COLUMNA
select Provincia, COUNT(*) as Cantidad, sum(Salario) as Suma from Empleados group by Provincia


--MINIMO MAXIMO Y PROMEDIO DE TODOS LOS SALARIOS
select Provincia, COUNT(*) as Cantidad, sum(Salario) 'Suma Salario',min(Salario) Minimo, MAX(Salario) Máximo, AVG(Salario) Promedio
from Empleados group by Provincia

--ORDENA POR NOMBRE ALFABETICO
select Nombre, Salario, Provincia from Empleados order by Nombre 

--SALARIO DE MAYOR A MENOR
select Nombre, Salario, Provincia from Empleados order by Salario desc

--SALARIO DE MENOR A MAYOR
select Nombre, Salario, Provincia from Empleados order by Salario asc

 --ORDENA POR PROVINCIA EN DESCENTE
select Provincia, COUNT(*) from Empleados group by Provincia order by Provincia desc

--USO DEL HAVING PARA VER SI HAY MENOS O MAS EMPLEADOS POR PROVINCIA
select Provincia, count(*) from Empleados group by Provincia having COUNT(*)< 2 
