create database bdClase7
go

use bdClase7
go

create table Empleados
(
Idempleado int identity (1,1) primary key,
Nombre varchar (100) not null,
Cedula varchar(20) unique not null,
Telefono varchar(20) null,
Provincia varchar(20) not null,
Direccion varchar(300) not null,
CorreoE varchar(100) not null,
Salario money not null,
FechaNac date not null,
NomDepto varchar(100)
)
go

insert into Empleados (Nombre, Cedula, Telefono, Provincia, Direccion, CorreoE, Salario, FechaNac, NomDepto)
values 
('Juan Lopez','1184802098',null,'Cartago','Tejar','jaunlopez@cuc.cr',400000,'19980423','Soporte TI'),
('Laura Lopez','337437744','76454322','San Jose','Moravia','lauralopez@cuc.cr',350000,'20000912','Contabilidad'),
('David Mendez','28287331','676845873','Heredia','Barva','davidmendez@cuc.cr',500000,'19901223','Recursos Humanos'),
('Carlos Gomez','56776422',null,'Puntarenas','Uvita','carlosgomez@cuc.cr',800000,'19980423','Soporte TI'),
('Emilia Poveda','767587522','99847422','Cartago','Guadalupe','emipoveda@cuc.cr',500000,'19880807','Recursos Humanos'),
('Mario Perez','67473873',null,'Limon','Rossvelt','marioperez@cuc.cr',470000,'20010712','Contabilidad')

insert into Empleados (Nombre, Cedula,Provincia, Direccion, CorreoE, Salario, FechaNac, NomDepto, Telefono)
values 
('Ana Perez','857575754','Guanacaste','Talamanca','anaperez@cuc.cr',600000,'19801123','Gerencia', null)

--Asume que es NULL si no esta en la lista
insert into Empleados (Nombre, Cedula,Provincia, Direccion, CorreoE, Salario, FechaNac, NomDepto)
values 
('Jorge Perez','32422111','Cartago','Tobosi','jorgeperez@cuc.cr',600000,'19870423','Gerencia')


/* SELECTS */
 Select * from Empleados
 go

--Cambiar Nombre de la Tabla  --Para nombres solo no es necesario las ''
Select Nombre, Cedula, Salario, Fechanac as 'Fecha Nacimiento' from Empleados

--Para Filtrar por rangos entre las variables de la tabla
Select Nombre, Cedula, Salario from Empleados where Salario between 450000 and 600000

--Filtrar Strings
Select Nombre, Cedula, Salario, Provincia, Direccion from Empleados Where Direccion in ('Tejar','Moravia')

--Distinct Filtra las provincias y si hay repetidas muestra solo 1
Select distinct Direccion from Empleados 
Select distinct Provincia from Empleados 

--Comodin % Para filtrar por variable busqueda de patrones
Select Nombre, Provincia, CorreoE from Empleados where Nombre like '%Perez'

Select Nombre, Provincia, CorreoE from Empleados where Nombre like '%ez%'

Select Nombre, Provincia, CorreoE from Empleados where Nombre like '%_ua%'

Select Nombre, Direccion, Telefono from Empleados where Telefono is null

--Muestre nombre direccion y telefono de los empleados que no registraron numero de telefono
Select Nombre, Direccion, Telefono from Empleados where Telefono is not null


--Muestra estadisticas con condiciones ya en 2 casos 
Select Nombre, Direccion, Salario, Provincia from Empleados where (Salario > 500000 and Provincia = 'Cartago')
or Salario < 600000
