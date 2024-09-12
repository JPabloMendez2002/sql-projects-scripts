create database bdClase12
go
Use bdClase12

declare @Fecha datetime
set @Fecha = '20020713'

-----DATE ADD AÑÁDIR AÑOS A LA FECHA
SELECT @Fecha, DATEADD(YEAR,10, @Fecha)
-----DATE DIFF CUANTO HA PASADO DESDE HASTA HOY YEAR/MONTH/DAY
SELECT DATEDIFF(YEAR,@Fecha,GETDATE()) AÑOS
---- DATENAME NOMBRE DEL MES
SELECT DATENAME(MONTH,@Fecha) MES, DATENAME(YEAR,@Fecha) AÑO
SELECT MONTH(@Fecha) NUMERO_MES

declare @Mensaje varchar (500)
set @Mensaje = 'El dia esta lluvioso y es de noche'
------SACAR 10 PRIMEROS CARCTERES HACIA LA IZQUIERDA 
SELECT LEFT(@Mensaje, 10), RIGHT (@Mensaje, 10)
------CANTIDAD DE CARACTERES + MINUS MAYUSC
SELECT LEN(@Mensaje), LOWER(@Mensaje), UPPER(@Mensaje)
--EXTRAER SUBCADENA DE LA CADENA
SELECT SUBSTRING(@Mensaje, 10,15)

create table Departamentos
(IdDepto int identity(1,1)  primary key,
Nombre varchar(100) not null,
Siglas varchar(10) not null,
Edificio varchar(100) not null
)


create table Empleados
(
idEmpleado int identity(1,1) primary key,
Nombre varchar(100) not null,
Cedula varchar(20) not null unique,
Telefono varchar(20) null,
Provincia varchar(20) not null,
Direccion varchar(300) not null,
CorreoE varchar(100) not null,
Salario money not null,
FechaNac date not null,
Puesto varchar(100) not null,
IdDepto int not null foreign  key references Departamentos (IdDepto),
IdJefe int null foreign key references Empleados(IdEmpleado)
)
go

insert into Departamentos (Nombre, Siglas, Edificio)
values
('Tecnologias de Informacion','TI','Principal'),
('Recursos Humanos', 'RH','Administrativo'),
('Contabilidad','CO','Administrativo'),
('Mantenimiento','MA','Administrativo'),
('Gerencia','GE','Administrativo')





insert into Empleados (Nombre, Cedula,Telefono ,Provincia ,
Direccion,CorreoE,Salario,FechaNac,Puesto, IdDepto, idJefe )
values
('Andrea Solis', '54545458', null, 'Cartago',
'Tejar', 'andrea@gmial.com', 1000000, '19850505','Gerente',5,null),
('David Ramirez', '1234567', null,'Cartago',
'San Rafael', 'david@gmail.com',500000,'19890205','Jefe Informatica',1,1),
('Laura Gomez', '7654321', '5544555','Cartago',
'Paraiso', 'laura@gmail.com',520000,'19850505','Jefe Recursos',2,1),
('Rita Rojas', '3521533', null,'Heredia',
'Flores', 'rita@gmail.com',600000,'19800810','Jefe Contabilidad',3,1),
('Carlos Gomes', '98546667','9888888', 'Heredia',
'San Joaquin', 'carlos@gmail.com',420000,'19951005','Oficinista',2,3),
('Luis Vargas', '8885555', '9898989','Cartago',
'Tejar', 'luis@gmail.com',530000,'19850910','Programador',1,2),
('Rita Salas', '9999955', '25545454','Heredia',
'San Rafael', 'ritas@gmail.com',450000,'19951020','Oficinista',2,3)
go

insert into Empleados (Nombre, Cedula,Provincia ,
Direccion,CorreoE,Salario,FechaNac,Puesto,IdDepto,IdJefe, Telefono  )
values
('Ana Gomez', '6554555', 'Heredia',
'San Rafael', 'ana@gmail.com',620000,'19951120','Contador',3,4,null)

insert into Empleados (Nombre, Cedula,Provincia ,
Direccion,CorreoE,Salario,FechaNac,Puesto,IdDepto, IdJefe)
values
('Jorge Castro', '5544555', 'Cartago',
'San Rafael', 'jorge@gmail.com',550000,'19951010','Oficinista',2,3)


/* Selects */


select * from Empleados

select * from Departamentos