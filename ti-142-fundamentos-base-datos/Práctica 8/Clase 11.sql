create database bdClase11
go

use bdClase11
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

insert into Empleados (Nombre, Cedula, Telefono, Provincia, Direccion, CorreoE, Salario, FechaNac,IdDepto)
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


--CREAR PROCESOS
create proc IngresarDepartamento
@Nombre varchar(100),
@Siglas varchar(5),
@Edificio varchar(100)
as begin
if (@Nombre is not null and @Siglas is not null and @Edificio is not null)
	begin
		INSERT INTO Departamentos (Nombre, Siglas, Edificio) VALUES (@Nombre,@Siglas,@Edificio)
		return 0-----EXITO
	end
	else 
		return 1----ERROR
end
go

declare @Retorno int 
exec IngresarDepartamento 'Finanzas', 'FI', 'Administrativo'

if @Retorno = 0
	begin
		SELECT * from Departamentos
	end
else
	SELECT 'ERROR'

create proc ConsultaEmpleado
@Consulta varchar(100)
as begin
	if @Consulta is null
		SELECT Cedula,Nombre, Telefono, Direccion from Empleados
	else
		SELECT Cedula,Nombre, Telefono, Direccion from Empleados WHERE Nombre like '%'+@Consulta+'%' or  Cedula like '%'+@Consulta+'%'
		or  Direccion like '%'+@Consulta+'%'

end

exec ConsultaEmpleado '3'

Alter proc ConsultaEmpleado
@Consulta varchar(100)
as begin
	if @Consulta is null
		SELECT Cedula,Nombre, Telefono, Direccion, CorreoE from Empleados
	else
		SELECT Cedula,Nombre, Telefono, Direccion, CorreoE from Empleados WHERE Nombre like '%'+@Consulta+'%' or  Cedula like '%'+@Consulta+'%'
		or  Direccion like '%'+@Consulta+'%'

end

cast(Cedula as varchar(100))

exec ConsultaEmpleado '3'


create proc ConsultaRangoSalario
@MontoIni money,
@MontoFin money,
as
begin
	if (@MontoIni <= @MontoFin)
		begin
			SELECT Cedula,Nombre, Salario from Empleados WHERE Salario between @MontoIni and @MontoFin
			return 0
	end
	else 
		return 1
	end
exec ConsultaRangoSalario 400000, 500000


create proc CalcularIncremento
@Porcentaje float
as
if @Porcentaje > 0
 begin
    SELECT Nombre, Cedula, Salario, salario * (1+@Porcentaje/100) Incremento from Empleados
	end

