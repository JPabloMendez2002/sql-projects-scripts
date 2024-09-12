create database bdClase9
go

use bdClase9
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
Puesto varchar(100) not null,
IdDepto int not null foreign key references Departamentos (IdDepto),
IdJefe int null foreign key references Empleados(IdEmpleado)
)
go

insert into Departamentos(Nombre, Siglas, Edificio)
values
('Tecnologia de Información', 'TI', 'Principal'),
('Recursos Humanos', 'RH', 'Administrativo'),
('Contabilidad', 'CO', 'Administrativo'),
('Mantenimiento', 'MA', 'Administrativo'),
('Gerencia', 'GE', 'Administrativo')

insert into Empleados (Nombre, Cedula, Telefono, Provincia, Direccion, CorreoE, Salario, FechaNac,Puesto,IdDepto,IdJefe)
values 
('Andresa Solis','545463276171',null,'Cartago','Tejar','andreasoli@cuc.cr',1000000,'19850723', 'Gerente', 5,null),
('Juan Lopez','1184802098',null,'Cartago','Tejar','jaunlopez@cuc.cr',400000,'19980423','Jefe Informatica', 1,1),
('Laura Lopez','337437744','76454322','Heredia','Moravia','lauralopez@cuc.cr',350000,'20000912','Jefe Recursos Humanos',2,1),
('David Mendez','28287331','676845873','Heredia','Barva','davidmendez@cuc.cr',500000,'19901223','Jefe Contable',3,1),
('Carlos Gomez','56776422',null,'Cartago','Uvita','carlosgomez@cuc.cr',800000,'19980423','Oficinista',2,3),
('Emilia Poveda','767587522','99847422','Cartago','Guadalupe','emipoveda@cuc.cr',500000,'19880807', 'Programador',1,2),
('Mario Perez','67473873',null,'Heredia','Rossvelt','marioperez@cuc.cr',470000,'20010712','Oficinista',2,3)


insert into Empleados (Nombre, Cedula,Provincia, Direccion, CorreoE, Salario, FechaNac,Puesto, IdDepto, IdJefe, Telefono)
values 
('Ana Perez','857575754','Heredia','Talamanca','anaperez@cuc.cr',600000,'19801123','Contador',3,4,null)

insert into Empleados (Nombre, Cedula,Provincia, Direccion, CorreoE, Salario, FechaNac, Puesto, IdDepto, IdJefe)
values 
('Jorge Perez','32422111','Cartago','Tobosi','jorgeperez@cuc.cr',600000,'19870423','Oficinista',2,3)


insert into Empleados (Nombre, Cedula,Provincia, Direccion, CorreoE, Salario, FechaNac, Puesto, IdDepto, IdJefe)
values 
('Xinia Hernandez','545465675','San Jose','Desamparados','xiniaherna@cuc.cr',800000,'19760812', 'Programador',1,2)

/* SELECTS */
 Select * from Empleados
 go

  Select * from Departamentos
 go

---JOINS

----CON WHERE
Select e.Nombre, e.Cedula ,e.Puesto,d.Nombre,d.Siglas from Empleados e, Departamentos d where e.IdDepto = d.IdDepto
 
----CON JOIN
Select e.Nombre, e.Cedula ,e.Puesto,d.Nombre,d.Siglas from Empleados e join Departamentos d on (e.IdDepto = d.IdDepto)
 
----QUIEN ES JEFE DE QUIEN CONSULTA con LEFT AND RIGHT JOIN

Select  e.Nombre, e.Cedula ,e.Puesto, d.Nombre Departamento, j.Nombre Jefe from Empleados e right join Departamentos d on (e.IdDepto = d.IdDepto) left join Empleados j on (j.IdEmpleado = e.IdJefe)

Select d.Nombre, COUNT(*) cantidad from Empleados e join Departamentos d on (e.IdDepto = d.IdDepto) group by d.Nombre order by cantidad desc

Select d.Nombre, COUNT(*) cantidad from Empleados e join Departamentos d on (e.IdDepto = d.IdDepto) group by d.Nombre having count(*) > 2 order by cantidad desc