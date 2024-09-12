/*
Nombre:Cristopher Leiton Duran
Cedula:118400418
*/

create database Examen2
go

use Examen2
go

create table Empleados(
idEmpleado int identity(1,1) primary key,
Nombre varchar(200) not null,
Cedula varchar(20) not null,
Puesto varchar(200) not null,
FechaNacimiento date,
Direccion varchar(100) not null,
Correo varchar(20) not null,
Telefono int not null
)
go

create table Facturas(
IdFactura int identity(1,1)  primary key,
NombreCliente varchar(100) not null,
Correo varchar(20) not null,
IdEmpleado int not null foreign  key references Empleados (idEmpleado),
FechaFactura date not null,
FechaEntrega date not null
)

create table Categorias(
IdCategoria int identity(1,1)  primary key,
Nombre varchar(100) not null
)

create table Articulos(
IdArticulo int identity(1,1)  primary key,
Nombre varchar(100) not null,
CantidadInventario int not null,
Precio money not null,
IdCategoria int not null foreign  key references Categorias (IdCategoria)
)

create table DetalleFactura(
IdDetalle int identity(1,1)  primary key,
IdFactura int not null foreign  key references Facturas (IdFactura),
IdArticulo int not null foreign key references Articulos (IdArticulo),
CantidadSolicitada int not null
)

--Categorias
INSERT INTO Categorias VALUES ('Ferreteria')
INSERT INTO Categorias VALUES ('Materiales')
INSERT INTO Categorias VALUES ('Linea Blanca')
INSERT INTO Categorias VALUES ('Muebles')

--Articulos
INSERT INTO Articulos VALUES ('LLaves Francesas',12,3000,1)
INSERT INTO Articulos VALUES ('Madera',200,20000,2)
INSERT INTO Articulos VALUES ('Refrigeradoras',3,40000,3)
INSERT INTO Articulos VALUES ('Roperos',20,50000,4)

--Empleados
INSERT INTO Empleados VALUES ('Carlos Steven', '12345678', 'Vendedor','20000110', 'Curridabat','Carlos@gmail.com',123)
INSERT INTO Empleados VALUES ('Jose Perez', '22345678', 'Gerente','20000210', 'Heredia','Jose@gmail.com',456)
INSERT INTO Empleados VALUES ('Oscar Duran', '32345678', 'Supervisor','20000210', 'Limon','Oscar@gmail.com',789)
INSERT INTO Empleados VALUES ('Luis Quiros', '42345678', 'Jefe','20000310', 'Curridabat','Luis@gmail.com',012)
INSERT INTO Empleados VALUES ('Maria Beltran', '52345678', 'Vendedor','20000410', 'San Jose','Maria@gmail.com',345)
INSERT INTO Empleados VALUES ('Sara Houdson', '62345678', 'Analista','20000510', 'Alajuela','Sara@gmail.com',678)
INSERT INTO Empleados VALUES ('Pedro Gomez', '72345678', 'Vendedor','20000610', 'Alajuela','Pedro@gmail.com',901)

--Facturas
INSERT INTO Facturas VALUES ('Carlos Steven','Carlos@gmail.com',1,'20000120','20000125')
INSERT INTO Facturas VALUES ('Jose Perez','Jose@gmail.com',2,'20000130','20000205')
INSERT INTO Facturas VALUES ('Oscar Duran','Oscar@gmail.com',3,'20000410','20000415')
INSERT INTO Facturas VALUES ('Luis Quiros','Luis@gmail.com',4,'20000620','20000625')
INSERT INTO Facturas VALUES ('Maria Beltran','Maria@gmail.com',5,'20000920','20000925')
INSERT INTO Facturas VALUES ('Sara Houdson','Sara@gmail.com',6,'20001120','20001125')

--Detalle Facturas
INSERT INTO DetalleFactura VALUES (1,1,2)
INSERT INTO DetalleFactura VALUES (2,2,50)
INSERT INTO DetalleFactura VALUES (3,3,1)
INSERT INTO DetalleFactura VALUES (4,4,2)


--SELECTS*
SELECT * FROM Categorias
SELECT * FROM Articulos
SELECT * FROM Empleados
SELECT * FROM Facturas
SELECT * FROM DetalleFactura

--Punto1
SELECT Cedula,Nombre FROM Empleados WHERE Nombre LIKE 'L%'

--Punto2
SELECT Nombre FROM Empleados WHERE Puesto='Vendedor' AND Nombre LIKE 'Carlos%'

--Punto3
SELECT Cedula,Nombre FROM Empleados ORDER BY Nombre desc

--Punto4
SELECT Cedula,Nombre FROM Empleados WHERE (FechaNacimiento>'2000')

--Punto5
SELECT Nombre,Direccion,Cedula FROM Empleados WHERE Direccion='Curridabat'

--Punto6
SELECT * FROM Articulos WHERE (Precio<=4000)

--Punto7
SELECT Nombre,SUM(Precio) AS SumaPrecios FROM Articulos WHERE (CantidadInventario<15) GROUP BY Nombre

--Punto8
SELECT SUM(Precio) AS SumaPrecios, c.Nombre FROM Articulos a JOIN Categorias c ON (a.IdArticulo = c.IdCategoria) GROUP BY c.Nombre

--Punto9
SELECT Puesto, COUNT(*) CantidadEmpleados FROM Empleados GROUP BY Puesto HAVING COUNT(*) > 2

--Punto10
SELECT MIN(Precio) AS PrecioMinimo,c.Nombre FROM Articulos a JOIN Categorias c ON (a.IdArticulo = c.IdCategoria) WHERE c.Nombre = 'Muebles' GROUP BY c.Nombre

