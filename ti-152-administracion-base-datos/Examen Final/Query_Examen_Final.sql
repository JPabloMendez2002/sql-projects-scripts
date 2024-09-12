create database ExamenFinal
go

use ExamenFinal
go

----------*JOSE PABLO MENDEZ POVEDA
----------*118480208
-----------------------------CREATES TABLES------------------------------------------->

CREATE TABLE CatalogoMarca(
IdCatalogoMarca int primary key identity(1,1),
Marca varchar(200) null,
)
GO

CREATE TABLE CatalogoColor(
IdCatalogoColor int primary key identity(1,1),
Color varchar(200) null,
)
GO

CREATE TABLE CatalogoCombustible(
IdCatalogoCombustible int primary key identity(1,1),
TipoCombustible varchar(200) null,
)
GO

CREATE TABLE CatalogoCliente(
IdCatalogoCliente int primary key identity(1,1),
TipoCliente varchar (20) not null check (TipoCliente in ('NACIONAL', 'EXTRANJERO')))
GO

CREATE TABLE CatalogoTransmision(
IdCatalogoTransmision int primary key identity(1,1),
Transmision varchar(200) null,)
GO

CREATE TABLE CatalogoCilindraje(
IdCatalogoCilindraje int primary key identity(1,1),
Cilindraje varchar (20) not null check (Cilindraje in ('1600CC', '1800CC','2000CC','2500CC','2800CC','3500CC','4500CC','8000CC','10000CC')))
GO

CREATE TABLE CatalogoModelo(
IdCatalogoModelo int primary key identity(1,1),
Modelo int null,)
GO

CREATE TABLE CatalogoTipoAuto(
IdCatalogoTipoAuto int primary key identity(1,1),
TipoAuto varchar(200) null,)
GO

CREATE TABLE Vehiculos(
IdVehiculo int primary key identity(1,1),
MarcaVehiculo int foreign key references CatalogoMarca(IdCatalogoMarca) ON UPDATE CASCADE ON DELETE CASCADE,
TipoVehiculo  int foreign key references CatalogoTipoAuto(IdCatalogoTipoAuto) ON UPDATE CASCADE ON DELETE CASCADE,
ColorVeiculo  int foreign key references CatalogoColor(IdCatalogoColor) ON UPDATE CASCADE ON DELETE CASCADE,
ModeloVehiculo  int foreign key references CatalogoModelo(IdCatalogoModelo) ON UPDATE CASCADE ON DELETE CASCADE,
TipoCombustible  int foreign key references CatalogoCombustible(IdCatalogoCombustible) ON UPDATE CASCADE ON DELETE CASCADE,
TipoTransmision  int foreign key references CatalogoTransmision(IdCatalogoTransmision) ON UPDATE CASCADE ON DELETE CASCADE,
CilindrajeVehiculo  int foreign key references CatalogoCilindraje(IdCatalogoCilindraje) ON UPDATE CASCADE ON DELETE CASCADE,
Precio_Alquiler money,
Estado varchar (20) not null check (Estado in ('DISPONIBLE', 'ALQUILADO'))
)
GO


CREATE TABLE Cliente(
IdCliente int primary key identity(1,1),
TipoCliente  int foreign key references CatalogoCliente(IdCatalogoCliente) ON UPDATE CASCADE ON DELETE CASCADE,
NombreCompleto varchar(200) null,
Identificacion int null,
Residencia varchar(200) null,
Direccion varchar(200) null,
TipoTarjeta  varchar (20) not null check (TipoTarjeta in ('CREDITO')),
EmisorTarjeta varchar (20) not null check (EmisorTarjeta in ('MASTER CARD','VISA','AMERICAN EXPRESS'))
)

CREATE TABLE Alquiler(
IdAlquiler int primary key identity(1,1),
CodigoCliente int foreign key references Cliente(IdCliente),
CodigoVehiculo int foreign key references Vehiculos(IdVehiculo),
Cantidad_Dias int null,
Fecha date null,
Monto_Total money null
)
---------------------------------------------------------------FIN CREATES-------------------------------->


---------------------------------------------------------------INSERTS-------------------------------->

INSERT INTO CatalogoMarca VALUES
('NISSAN'),
('TOYOTA'),
('MACK')

INSERT INTO CatalogoColor VALUES
('BLANCO'),
('ROJO'),
('GRIS'),
('AZUL'),
('NEGRO'),
('MARRON')

INSERT INTO CatalogoCombustible VALUES
('DIESEL'),
('REGULAR'),
('ELECTRICO'),
('GAZ')

INSERT INTO CatalogoTransmision VALUES
('AUTOMATICO'),
('MANUAL'),
('HYBRIDO')

INSERT INTO CatalogoTipoAuto VALUES
('SEDAN'),
('PICK UPT'),
('4X4'),
('4X2'),
('VAN'),
('CARGA PESADA'),
('CAMIÓN 16 EJES')

INSERT INTO CatalogoModelo VALUES
(2022),
(2021),
(2020),
(2019),
(2015),
(2014),
(2012),
(2010)

INSERT INTO CatalogoCilindraje VALUES
('1600CC'),
('1800CC'),
('2000CC'),
('2500CC'),
('2800CC'),
('3500CC'),
('4500CC'),
('8000CC'),
('10000CC')

INSERT INTO CatalogoCliente VALUES
('NACIONAL'),
('EXTRANJERO')

INSERT INTO Cliente VALUES
(1,'JOSE PABLO MENDEZ',118480208,'CARTAGO EL GUARCO TEJAR','100M NORTE DEL BN EN TEJAR','CREDITO','VISA'),
(2,'MAYKOL JAMES',49292734,'HOTEL EL GUARCO','FRENTE A MEGASUPER CARRETRA LIMA','CREDITO','MASTER CARD'),
(1,'JUAN BRENES',70884213,'CARTAGO AGUA CALIENTE','250M SUR DEL SPORT CENTER','CREDITO','AMERICAN EXPRESS'),
(2,'FRANKLIN BROKE',302218183,'HOTEL HOLIDAYIN','FRENTE A PARQUE MORAZÁN','CREDITO','MASTER CARD')

--------NISSAN
INSERT INTO Vehiculos VALUES
(1,1,4,6,1,3,2,25000,'DISPONIBLE'),
(1,2,3,2,2,2,3,35000,'DISPONIBLE'),
(1,4,2,3,3,1,1,45000,'ALQUILADO'),
(1,2,4,1,4,2,3,35000,'DISPONIBLE'),
(1,4,2,3,3,1,1,45000,'ALQUILADO'),
(1,2,3,2,2,2,3,35000,'DISPONIBLE'),
(1,4,2,3,3,1,1,45000,'ALQUILADO')
--------TOYOTA
INSERT INTO Vehiculos VALUES
(2,4,3,2,1,2,4,50000,'ALQUILADO'),
(2,5,4,4,2,2,3,35000,'DISPONIBLE'),
(2,1,5,2,3,2,4,50000,'ALQUILADO'),
(2,2,6,4,4,2,3,35000,'DISPONIBLE'),
(2,2,2,1,1,2,6,75000,'DISPONIBLE'),
(2,3,5,2,2,2,4,50000,'ALQUILADO'),
(2,1,6,4,4,2,3,35000,'DISPONIBLE')
--------MACK
INSERT INTO Vehiculos VALUES
(5,6,3,8,1,2,8,180000,'ALQUILADO'),
(5,7,2,5,1,2,9,350000,'DISPONIBLE'),
(5,6,1,8,1,2,8,180000,'ALQUILADO'),
(5,7,4,5,1,2,9,350000,'DISPONIBLE'),
(5,6,5,7,1,2,8,150000,'DISPONIBLE'),
(5,7,6,8,1,2,8,180000,'ALQUILADO'),
(5,7,5,5,1,2,9,350000,'DISPONIBLE')

---------------------------------------------------------------FIN INSERTS-------------------------------->


----------VISTA PARA CONSULTAR VEHICULOS ALQUILADOS
CREATE VIEW ConsultarAlquilados AS 
 SELECT CM.Marca,CC.Color,CMM.Modelo ,CTA.TipoAuto,CT.Transmision,CG.TipoCombustible,
 CCC.Cilindraje,VH.Precio_Alquiler,VH.Estado FROM Vehiculos VH
 JOIN CatalogoMarca CM ON (VH.MarcaVehiculo = CM.IdCatalogoMarca) 
 JOIN CatalogoColor CC ON (VH.ColorVeiculo = CC.IdCatalogoColor)
 JOIN CatalogoModelo CMM ON (VH.ModeloVehiculo = CMM.IdCatalogoModelo)
 JOIN CatalogoTipoAuto CTA ON (VH.TipoVehiculo = CTA.IdCatalogoTipoAuto)
 JOIN CatalogoTransmision CT ON (VH.TipoTransmision = CT.IdCatalogoTransmision) 
 JOIN CatalogoCombustible CG ON (VH.TipoCombustible = CG.IdCatalogoCombustible)
 JOIN CatalogoCilindraje CCC ON (VH.CilindrajeVehiculo = CCC.IdCatalogoCilindraje)
 WHERE VH.Estado = 'ALQUILADO'
 GO
 ----------VISTA PARA CONSULTAR VEHICULOS DISPONIBLES
CREATE VIEW ConsultarDisponibles AS  
SELECT CM.Marca,CC.Color,CMM.Modelo ,CTA.TipoAuto,CT.Transmision,CG.TipoCombustible,
 CCC.Cilindraje,VH.Precio_Alquiler,VH.Estado FROM Vehiculos VH
 JOIN CatalogoMarca CM ON (VH.MarcaVehiculo = CM.IdCatalogoMarca) 
 JOIN CatalogoColor CC ON (VH.ColorVeiculo = CC.IdCatalogoColor)
 JOIN CatalogoModelo CMM ON (VH.ModeloVehiculo = CMM.IdCatalogoModelo)
 JOIN CatalogoTipoAuto CTA ON (VH.TipoVehiculo = CTA.IdCatalogoTipoAuto)
 JOIN CatalogoTransmision CT ON (VH.TipoTransmision = CT.IdCatalogoTransmision) 
 JOIN CatalogoCombustible CG ON (VH.TipoCombustible = CG.IdCatalogoCombustible)
 JOIN CatalogoCilindraje CCC ON (VH.CilindrajeVehiculo = CCC.IdCatalogoCilindraje)
 WHERE VH.Estado = 'DISPONIBLE'
 
 GO

 ---------------PROCEDIMIENTO ALMACENADO PARA REGISTRAR AQLUILER
 CREATE PROCEDURE AlquilarVehiculo
@CodCliente int,
@CodVehi int,
@Dias int,
@Fecha date 
AS
 Declare @Monto money,
 @Total money,
 @Estado varchar(50)
SET @Monto = (SELECT VH.Precio_Alquiler FROM Vehiculos VH WHERE VH.IdVehiculo = @CodVehi)
SET @Total = @Monto * @Dias
SET @Estado = (SELECT  VH.Estado FROM Vehiculos VH WHERE VH.IdVehiculo = @CodVehi)

IF (@Estado = 'ALQUILADO')
print'Error!, Este vehiculo ya esta alquilado.'
ELSE
INSERT INTO Alquiler VALUES(@CodCliente,@CodVehi,@Dias,@Fecha,@Total)
UPDATE Vehiculos SET Estado = 'ALQUILADO'  WHERE IdVehiculo = @CodVehi
GO
 ---------------PROCEDIMIENTO ALMACENADO PARA DEVOLVER AQLUILER
 CREATE PROCEDURE DevolverVehiculo
@CodVehi int
AS
 DECLARE
 @Estado varchar(50)

SET @Estado = (SELECT  VH.Estado FROM Vehiculos VH WHERE VH.IdVehiculo = @CodVehi)

IF (@Estado = 'ALQUILADO')
UPDATE Vehiculos SET Estado = 'DISPONIBLE'  WHERE IdVehiculo = @CodVehi
ELSE
print'Error!, Este vehiculo ya esta disponible.'
GO
----------------PROCEDIMIENTO ALMACENADO PARA VER LO RECAUDADO EN EL DIA
CREATE PROCEDURE MontoRecaudadoDia
@Fecha date
AS
SELECT COUNT(CodigoVehiculo) AS Cantidad_Vehiculos_Alquilados, 
SUM(Monto_Total) AS Total_Del_Dia FROM Alquiler WHERE Fecha = @Fecha
GO
 ------------------EJECUCIÓN DE VISTAS
SELECT * FROM ConsultarDisponibles
SELECT * FROM ConsultarAlquilados

 ------------------EJECUCIÓN DE PROCEDIMIENTOS ALMACENADOS

-----RECIBE 4 PARAMETROS @CODIGO CLIENTE, @CODIGO VEHICULO Y @DIAS, EL CALCULO EL UPDATE DE ESTADO SE HACEN SOLOS
EXEC AlquilarVehiculo 1,1,6,'20221209'

-----RECIBE 1 PARAMETRO @CODIGO VEHICULO PARA ACTUALIZAR EL ESTADO
EXEC DevolverVehiculo 2

-------RECIBE 1 PARAMETRO @FECHA DEL DIA
 EXEC MontoRecaudadoDia '20221208'

----------SELECTS 
SELECT * FROM CatalogoMarca
SELECT * FROM CatalogoColor
SELECT * FROM CatalogoTipoAuto
SELECT * FROM CatalogoCombustible
SELECT * FROM CatalogoModelo
SELECT * FROM CatalogoTransmision
SELECT * FROM CatalogoCilindraje
SELECT * FROM CatalogoCliente
SELECT * FROM Vehiculos
SELECT * FROM Cliente
SELECT * FROM Alquiler
 

