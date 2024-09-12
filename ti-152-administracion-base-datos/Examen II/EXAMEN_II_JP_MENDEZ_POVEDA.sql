create database Examen_2OF
go
Use Examen_2OF
go



------------------------------------CREATES----------------------------------------------->
create Table TIPO_PRODUCTO(
Id_TipoProducto int not null primary key identity(1,1),
Descripcion varchar(200) null
)

create Table DISTRITO(
Id_Distrito int not null primary key identity(1,1),
Descripcion varchar(200) null
)

create Table PRODUCTO(
Id_Producto int not null primary key identity(1,1),
Descripcion varchar(200) null,
Precio varchar(200) null,
Stock_Actual varchar(200) null,
Stock_Minimo varchar(200) null,
Id_TipoProducto int not null foreign key references TIPO_PRODUCTO(Id_TipoProducto)
)

create Table CLIENTE(
Id_Cliente int not null primary key identity(1,1),
Direccion varchar(200) null,
Telefono varchar(200) null,
Correo varchar(200) null,
Web varchar(200) null,
Id_Distrito int not null foreign key references DISTRITO(Id_Distrito)
)

create Table CLIENTE_JURIDICO(
Id_Cliente int not null primary key references CLIENTE(Id_Cliente),
Razon_Social varchar(200) null,
Ruc varchar(200) null,
Contacto varchar(200) null,
Id_Cargo int null
)

create Table CLIENTE_NORMAL(
Id_Cliente int not null primary key references CLIENTE(Id_Cliente),
Nombres varchar(200) null,
Apellido_MA varchar(200) null,
Apellido_PA varchar(200) null
)

create Table EMPLEADO(
Id_Empleado int not null primary key identity(1,1),
Nombres varchar(200) null,
Apellido_MA varchar(200) null,
Apellido_PA varchar(200) null,
Fecha_Nacimiento date null,
Direccion varchar(200) null,
Telefono varchar(200) null,
Correo varchar(200) null,
Fecha_Ingreso date null,
Id_Supervisor int null,
Id_Distrito int not null foreign key references DISTRITO(Id_Distrito)
)

create Table BOLETA(
Id_Boleta int not null primary key identity(1,1),
Fecha_Boleta date null,
Estado_Boleta varchar(200) null,
Id_Empleado int not null foreign key references EMPLEADO(Id_Empleado),
Id_Cliente int not null foreign key references CLIENTE(Id_Cliente)
)

create Table DETALLE_BOLETA(
Id_Boleta int not null primary key references BOLETA(Id_Boleta),
Cantidad int null,
Precio_Venta varchar(200),
Id_Producto int not null foreign key references PRODUCTO(Id_Producto)
)

-------------------------------------------------INSERTS------------------------------------>
INSERT INTO TIPO_PRODUCTO VALUES
('LIMPIEZA'),
('CUIDADO PERSONAL')

INSERT INTO DISTRITO VALUES
('TEJAR'),
('TOBOSI'),
('BARRANCAS'),
('AGUA CALIENTE')

INSERT INTO PRODUCTO VALUES
('DESINFECTANTE', '1300', '550', '25', 1),
('ANTI GRASA', '1000', '750', '25', 1),
('JABON LIQUIDO', '700', '250', '25', 1),
('CLORO', '600', '550', '25', 1),
('DESHODRANTE', '2400', '1150', '25', 2),
('PLASTIGEL', '1200', '950', '25', 2),
('CREMA CORPORAL', '3000', '1650', '25', 2),
('TALCOS', '200', '2450', '25', 2)

INSERT INTO CLIENTE VALUES
('100M NORTE DEL BN EN TEJAR','87653211','juan@examen.com','JuanExamen.com',1),
('200M ESTE DE LA PLAZA DE DEPORTES','77546790','nuria@examen.com','NuriaExamen.com',2),
('500M SUR DE CERAMICAS LA ESPAÑOLA','67843211','pedro@examen.com','PedroExamen.com',3),
('50M OESTE DEL SUPER EL CAMPEON','66543211','mario@examen.com','MarioExamen.com',4)

INSERT INTO CLIENTE_JURIDICO VALUES 
(1,'SERVICIOS DE LIMPIEZA','100972621','87653211',1),
(2,'PRODUCTOS DE ASEO PERSONAL','2009484721','77546790',2)

INSERT INTO CLIENTE_NORMAL VALUES 
(3,'PEDRO ROBERTO','JIMENEZ','CHACON'),
(4,'MARIO ALBERTO','TORRES','VASQUEZ')

INSERT INTO EMPLEADO VALUES
('JUAN CARLOS', 'LOPEZ','UGALDE','19780102', 'CARTAGO, TEJAR 100M NORTE DE LA ESCUELA', '87654322', 'juanca@examen.com', '20040203',NULL,1),
('MAYKOL ESTEBAN', 'MARTINEZ','MENDEZ','19750712', 'CARTAGO, TOBOSI 150M NORTE DE LA IGLESIA', '67890543', 'maykoleste@examen.com', '20020809',NULL,2),
('JEFREY', 'SERRANO','SEQUEIRA','19701008', 'CARTAGO, BARRANCAS 200M SUR DE BAR EL PILON', '78654721', 'jeffreyse@examen.com', '20050716',NULL,3),
('ADRIANA', 'MORALES','TORRES','19720102', 'CARTAGO, AGUA CALIENTE FRENTE A LA MUCAP', '66789055', 'adrimora@examen.com', '20051121',NULL,4),
('PAOLA SOFIA', 'SUJEY','MORA','19690706', 'CARTAGO, AGUA CALIENTE COSTADO ESTE DEL SPORT CENTER', '77883322', 'paosofi@examen.com', '20010121',NULL,4)

-----2007
INSERT INTO BOLETA VALUES
('20070101','CANCELADA',1,1),
('20070201','CANCELADA',2,1),
('20070301','CANCELADA',3,1),
('20070501','CANCELADA',1,1),
('20070601','CANCELADA',2,1),
('20070801','CANCELADA',3,1),
('20070901','CANCELADA',2,1),
('20071101','CANCELADA',1,1),
('20071201','CANCELADA',3,1)
------2008
INSERT INTO BOLETA VALUES
('20080101','CANCELADA',1,2),
('20080201','CANCELADA',2,2),
('20080301','CANCELADA',3,2),
('20080501','CANCELADA',1,2),
('20080601','CANCELADA',2,2),
('20080801','CANCELADA',3,2),
('20080901','CANCELADA',2,2),
('20081101','CANCELADA',1,2),
('20081201','CANCELADA',3,2)
------2009
INSERT INTO BOLETA VALUES
('20090101','CANCELADA',1,3),
('20090201','CANCELADA',2,3),
('20090301','CANCELADA',3,3),
('20090501','CANCELADA',1,3),
('20090601','CANCELADA',2,3),
('20090801','CANCELADA',3,3),
('20090901','CANCELADA',2,3),
('20091101','CANCELADA',1,3),
('20091201','CANCELADA',3,3)
------2011
INSERT INTO BOLETA VALUES
('20110101','CANCELADA',1,1),
('20110201','CANCELADA',2,2),
('20110301','CANCELADA',3,3),
('20110501','CANCELADA',1,4),
('20110601','CANCELADA',2,1),
('20110801','CANCELADA',3,1),
('20110901','CANCELADA',2,2),
('20111101','CANCELADA',1,2),
('20111201','CANCELADA',3,4)
------2012
INSERT INTO BOLETA VALUES
('20120101','CANCELADA',1,4),
('20120201','CANCELADA',2,4),
('20120301','CANCELADA',3,4),
('20120501','CANCELADA',1,4),
('20120601','CANCELADA',2,4),
('20120801','CANCELADA',3,4),
('20120901','CANCELADA',2,3),
('20121101','CANCELADA',1,2),
('20121201','CANCELADA',3,1)

-------0-10
INSERT INTO DETALLE_BOLETA VALUES
(1,100,'1300',1),
(2,500,'1000',2),
(3,450,'700',3),
(4,200,'1300',1),
(5,100,'2400',5),
(6,500,'1200',6),
(7,450,'3000',7),
(8,200,'2400',5),
(9,50,'1200',6),
(10,500,'1200',6)
-------11-20
INSERT INTO DETALLE_BOLETA VALUES
(11,350,'2400',5),
(12,700,'3000',7),
(13,50,'1300',1),
(14,500,'1000',2),
(15,350,'2400',5),
(16,200,'3000',7),
(17,500,'1200',6),
(18,350,'2400',5),
(19,700,'3000',7),
(20,50,'1300',1)
-------21-30
INSERT INTO DETALLE_BOLETA VALUES
(21,500,'1000',2),
(22,350,'2400',5),
(23,200,'3000',7),
(24,500,'1000',2),
(25,350,'2400',5),
(26,200,'3000',7),
(27,500,'1000',2),
(28,350,'2400',5),
(29,200,'3000',7),
(30,200,'3000',7)
-------31-40-45
INSERT INTO DETALLE_BOLETA VALUES
(31,500,'1300',1),
(32,350,'2400',5),
(33,200,'1200',6),
(34,500,'1000',2),
(35,350,'2400',5),
(36,200,'3000',7),
(37,500,'1000',2),
(38,350,'2400',5),
(39,200,'1300',1),
(40,200,'700',3),
(41,500,'1000',2),
(42,350,'2400',5),
(43,200,'3000',7),
(44,200,'1300',1),
(45,200,'700',3)

---------------------------------------------SELECTS-------------------->
SELECT * FROM TIPO_PRODUCTO
SELECT * FROM DISTRITO
SELECT * FROM PRODUCTO
SELECT * FROM CLIENTE
SELECT * FROM CLIENTE_JURIDICO
SELECT * FROM CLIENTE_NORMAL
SELECT * FROM EMPLEADO
SELECT * FROM BOLETA
SELECT * FROM DETALLE_BOLETA

-----------------------------------------------------------DESAROLLO DEL EXAMEN--------------->
----PARTE 1
SELECT BO.Fecha_Boleta, BO.Estado_Boleta, DT.Id_Producto, DT.Cantidad, 
DT.Precio_Venta FROM BOLETA AS BO JOIN DETALLE_BOLETA AS DT ON (BO.Id_Boleta = DT.Id_Boleta)
WHERE BO.Fecha_Boleta BETWEEN '20070101' AND '20091231'

----PARTE 2
SELECT CL.Id_Cliente, CL.Correo,CLN.Nombres 
,CLN.Apellido_PA, CLN.Apellido_MA
FROM CLIENTE AS CL JOIN CLIENTE_NORMAL CLN ON (CL.Id_Cliente = CLN.Id_Cliente)
ORDER BY CLN.Apellido_PA, CLN.Apellido_MA

----PARTE 3
SELECT EM.Nombres, EM.Apellido_PA
FROM EMPLEADO AS EM LEFT JOIN BOLETA AS BO ON (EM.Id_Empleado = BO.Id_Empleado) 
GROUP BY EM.Apellido_PA, EM.Nombres HAVING COUNT(BO.Id_Empleado) = 0

----PARTE 4
SELECT PD.Descripcion FROM DETALLE_BOLETA AS DT RIGHT JOIN PRODUCTO AS PD ON (PD.Id_Producto = DT.Id_Producto)
WHERE PD.Id_Producto NOT IN (SELECT DT.Id_Producto FROM DETALLE_BOLETA AS DT)
GROUP BY PD.Descripcion

---PARTE 5
SELECT BO.Id_Boleta, BO.Estado_Boleta, BO.Fecha_Boleta, BO.Id_Cliente, BO.Id_Empleado, PD.Descripcion FROM 
BOLETA AS BO JOIN DETALLE_BOLETA  AS DT ON (BO.Id_Boleta = DT.Id_Boleta) 
JOIN PRODUCTO AS PD ON (PD.Id_Producto = DT.Id_Producto) 
WHERE BO.Fecha_Boleta BETWEEN '20120101' AND '20120301' ORDER BY BO.Id_Cliente ASC

----PARTE 6
SELECT EM.Nombres, EM.Apellido_PA FROM EMPLEADO AS EM JOIN BOLETA AS BO ON 
(EM.Id_Empleado = BO.Id_Empleado) WHERE NOT BO.Fecha_Boleta BETWEEN '20120401' AND '20120601'

----PARTE 7
SELECT PD.Descripcion FROM PRODUCTO AS PD JOIN DETALLE_BOLETA AS DT ON (PD.Id_Producto = DT.Id_Producto)
JOIN BOLETA AS BO ON (DT.Id_Boleta = BO.Id_Boleta) WHERE BO.Fecha_Boleta <> '20111201'

----PARTE 8
SELECT EM.Nombres, EM.Apellido_PA, EM.Apellido_MA, EM.Fecha_Nacimiento,
MAX(EM.Fecha_Ingreso) AS Mayor_Fecha, MIN(EM.Fecha_Ingreso) AS Menor_Fecha
FROM EMPLEADO AS EM LEFT JOIN BOLETA AS BO ON (EM.Id_Empleado = BO.Id_Empleado) 
GROUP BY EM.Apellido_PA, EM.Nombres, EM.Apellido_MA, EM.Fecha_Nacimiento
HAVING COUNT(BO.Id_Empleado) = 0 

----PARTE 9
SELECT BO.Fecha_Boleta, PD.Descripcion, DT.Cantidad FROM BOLETA AS BO
JOIN DETALLE_BOLETA AS DT ON (BO.Id_Boleta = DT.Id_Boleta) JOIN PRODUCTO AS PD ON 
(DT.Id_Producto = PD.Id_Producto) 
 WHERE PD.Descripcion LIKE '[A-F]%' AND  BO.Fecha_Boleta BETWEEN '20110101' AND '20111231'

----PARTE 10 ---CAMBIE P POR J 
SELECT BO.Fecha_Boleta, PD.Descripcion, DT.Cantidad FROM BOLETA AS BO
JOIN DETALLE_BOLETA AS DT ON (BO.Id_Boleta = DT.Id_Boleta) JOIN PRODUCTO AS PD ON 
(DT.Id_Producto = PD.Id_Producto) 
 WHERE PD.Descripcion LIKE 'J%' AND PD.Descripcion LIKE '_ASA' OR
 BO.Fecha_Boleta BETWEEN '20120401' AND '20120601'