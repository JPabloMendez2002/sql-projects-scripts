create database bdProyecto
go

Use bdProyecto
go

/* Estudiantes: Jose Pablo Mendez Poveda 118480208
				Cristopher Leiton Duran  118400408
*/

create Table Estudiantes(
IdEstudiante int identity(1,1) primary key,
Cedula int not null,
Nombre varchar(200) not null,
Apellidos varchar(200) not null,
FechaIngreso date not null,
Correo varchar(100) not null,
Telefono varchar(20) not null,
Provincia varchar (20) not null check (Provincia in ('Cartago','San Jose','Heredia','Alajuela','Guanacaste', 'Limon', 'Puntarenas')),
Canton varchar(100) not null
)
go

create Table Profesores(
IdProfesor int identity(1,1) primary key,
Cedula int unique not null,
Nombre varchar(200) not null,
Apellidos varchar(200) not null,
GradoAcademico varchar(100) not null,
Direccion varchar(300) not null,
Provincia varchar (20) not null check (Provincia in ('Cartago','San Jose','Heredia','Alajuela','Guanacaste', 'Limon', 'Puntarenas')),
Canton varchar(100) not null,
Distrito varchar(100) not null,
Telefono varchar(20) not null,
FechaNacimiento date not null,
Especialidad varchar(100) not null
)
go

create Table Cursos(
IdCurso int identity(1,1) primary key,
NombreCurso varchar(200) not null,
Descripcion varchar(200) not null,
CantidadEstudiantesMax varchar(100) not null,
TipoAula  varchar (25) not null check (TipoAula in ('Salon','Laboratorio','Virtual')),
Precio money,
Estado varchar(20) not null check (Estado in ('Activo', 'Inactivo'))
)

create Table CursosDisponibles(
IdCursosDisponible int identity(1,1) primary key,
Anno date,
NumeroBimestre int not null,
Horario varchar (25) not null check (Horario in ('Dia','Tarde','Noche')),
Aula int not null,
NumGrupo int not null,
CodigoProfesor int not null foreign key references Profesores(IdProfesor),
CodigoCurso int not null foreign key references Cursos(IdCurso)
)
go

create Table Matricula(
IdMatricula int identity(1,1) primary key,
TipoPago varchar (25) not null check (TipoPago in ('Tarjeta','Efectivo','Paypal')),
Fecha date not null,
Nota decimal,
PrecioPagado money,
CodigoEstudiante int not null foreign key references Estudiantes(IdEstudiante),
CodigoCurso int not null foreign key references Cursos(IdCurso)
)
go

create Table Registros(
IdRegistro int identity(1,1) primary key,
Fecha date not null,
HoraIngreso time,
HoraSalida time,
CodigoProfesor int not null foreign key references Profesores(IdProfesor)
)
go

create Table Parametros(
IdParametro int identity(1,1) primary key,
Anno date not null,
NumBimestre int,
Academia varchar (100),
CedulaJuridica int unique,
Telefono varchar(25) not null,
Direccion varchar(200) not null
)
go

-------------------Registro Estudiantes
INSERT INTO Estudiantes(Cedula, Nombre, Apellidos, FechaIngreso, Correo, Telefono, Provincia, Canton)
VALUES
(118480209,'Juan','Mendez Lopez','20220110','lopez@cuc.cr','60988570','San Jose','Goicoechea'),
(112470706,'Pablo','Briceño Poveda','20220110','poveda@cuc.cr','70788579','San Jose','Escazu'),
(115460709,'Cristopher','Leiton Duran','20220110','duran@cuc.cr','80587568','San Jose','Escazu'),
(366490609,'Lucia','Guillen Benites','20220110','benites@cuc.cr','78978774','Cartago','Cartago'),
(343460105,'Silvia','Monge Barahona','20220110','barahona@cuc.cr','80978578','Cartago','El Guarco'),
(326450104,'Sofia','Sanabria Ugalde','20220110','ugalde@cuc.cr','70948579','Cartago','El Guarco'),
(551420902,'Daniel','Guiterrez Chacon','20220110','chacon@cuc.cr','88629972','Alajuela','Alajuela'),
(597440202,'Marianne','Oretga Alvarez','20220110','alvarez@cuc.cr','60678871','Alajuela','San Carlos'),
(562430301,'Ariel','Loria Pizarro','20220110','pizarro@cuc.cr','70679877','Alajuela','San Carlos'),
(484420402,'Gerardo','Escobar Brenes','20220110','brenes@cuc.cr','80728372','Heredia','Heredia'),
(425410503,'Sharon','Quiros Martinez','20220110','martinez@cuc.cr','60727378','Heredia','Heredia'),
(429470701,'Minor','Valverde Arias','20220110','arias@cuc.cr','81757875','Heredia','Las Flores'),
(752430803,'Carlos','Montes Jimenez','20220110','jimenez@cuc.cr','78428177','Puntarenas','Caldera')

-------------------Registro Profesores
INSERT INTO Profesores(Cedula, Nombre, Apellidos, GradoAcademico, Direccion, Provincia,
Canton, Distrito, Telefono, FechaNacimiento, Especialidad)
VALUES
(116460707,'Alejandro','Duran Leiton','Doctorado','250M Norte del Price Mart','San Jose','Escazu','Escazu','67453211','19980321','Informática'),
(115460602,'Sofia','Leiva Brenes','Maestría','300M Norte del IMAS','San Jose','Goicoechea','Moravia','87473216','19920513','Informática'),
(113460604,'Sebastian','Mena Rodriguez','Bachillerato','75M Oeste Frente a Panaderia Super Pan','San Jose','Goicoechea','Guadalupe','78483212','19990116','Informática'),
(306460208,'Jorge','Poveda Guillen','Bachillerato','150M Sur del Super Dragón','Cartago','Cartago','El Carmen','76452215','19940726','Idiomas'),
(306460308,'Adriana','Benites Monge','Licenciatura','50M Este del Parque','Cartago','El Guarco','Tejar','67782112','19900920','Idiomas')

-------------------Registro Cursos 
INSERT INTO Cursos(NombreCurso, Descripcion, CantidadEstudiantesMax, TipoAula, Precio, Estado)
VALUES
('Ingles Básico', 'Principios del Idioma Ingles','20','Salon',370000,'Activo'),
('Ingles Intermedio', 'Fortaleciendo el Idioma Ingles','15','Laboratorio',570000,'Activo'),
('Ingles Avanzado', 'Expertos del Idioma Ingles','10','Virtual',870000,'Inactivo'),
('Excel Básico', 'Principios de Excel','20','Salon',370000,'Activo'),
('Excel Intermedio', 'Fundamentos de Excel','15','Laboratorio',570000,'Activo'),
('Excel Avanzado', 'Expertos en Excel','10','Virtual',970000,'Activo'),
('Excel Financiero', 'Manejo de Finanzas en Excel','12','Virtual',920000,'Activo'),
('Macros en Excel', 'Manejo de Macros en Excel','8','Virtual',720000,'Activo'),
('Tablas Dinámicas en Excel', 'Manejo de Tablas en Excel','6','Virtual',820000,'Inactivo'),
('Power BI Básico', 'Fundamentos de Power BI','24','Salon',420000,'Activo'),
('Power BI Intermedio', 'Introduccion a Mineria de Datos','14','Laboratorio',820000,'Activo'),
('Power BI Avanzado', 'Dashboards y Reportes en Power BI','10','Virtual',980000,'Inactivo')

-------------------Registro Cursos Disponibles
INSERT INTO CursosDisponibles(Anno, NumeroBimestre, Horario, Aula, NumGrupo, CodigoProfesor, CodigoCurso)
VALUES
---INGLES
('20220120', 1,'Noche',6,2,4,1),
('20220320', 2,'Noche',8,3,5,2),
---EXCEL
('20220720', 4,'Dia',12,2,1,4),
('20220920', 5,'Tarde',13,3,2,5),
('20221120', 6,'Noche',14,5,3,6),
('20220120', 1,'Tarde',10,7,3,7),
('20220320', 2,'Noche',9,6,2,8),
---POWER BI
('20220320', 2,'Noche',3,3,1,10),
('20220520', 3,'Dia',7,1,2,11)

------------------Registro Matriculas
INSERT INTO Matricula(TipoPago, Fecha, Nota, PrecioPagado, CodigoEstudiante, CodigoCurso)
VALUES
-----BIMESTRE 1
('Tarjeta','20220110',90.0,370000,1,1),
('Efectivo','20220110',80.0,920000,2,7),
('Tarjeta','20220110',80.0,920000,3,7),
('Efectivo','20220110',77.0,370000,4,1),
('Efectivo','20220110',72.0,370000,5,1),
('Paypal','20220110',79.0,920000,6,7),
('Tarjeta','20220110',78.0,920000,7,7),
('Paypal','20220110',73.0,920000,8,7),
--------BIMESTRE 2
('Paypal','20220310',79.0,570000,9,2),
('Tarjeta','20220310',82.0,570000,10,2),
('Efectivo','20220310',86.0,570000,11,2),
('Tarjeta','20220310',83.0,720000,12,8),
('Paypal','20220310',89.0,720000,13,8),
('Tarjeta','20220310',91.0,720000,1,8),
('Paypal','20220310',96.0,420000,2,10),
('Efectivo','20220310',81.0,420000,3,10),
('Tarjeta','20220310',71.0,420000,4,10),
------BIMESTRE 3
('Paypal','20220510',81.0,980000,5,11),
('Efectivo','20220510',85.0,980000,6,11),
('Tarjeta','20220510',88.0,980000,7,11),
('Efectivo','20220510',75.0,980000,8,11),
('Tarjeta','20220510',73.0,980000,9,11),
('Efectivo','20220510',90.0,980000,10,11),
('Paypal','20220510',97.0,980000,11,11),
('Tarjeta','20220510',83.0,980000,12,11),
('Efectivo','20220510',93.0,980000,13,11),
------BIMESTRE 4
('Paypal','20220710',82.0,370000,1,4),
('Efectivo','20220710',87.0,370000,2,4),
('Tarjeta','20220710',85.0,370000,3,4),
('Efectivo','20220710',79.0,370000,4,4),
('Tarjeta','20220710',74.0,370000,5,4),
('Efectivo','20220710',94.0,370000,6,4),
('Paypal','20220710',99.0,370000,7,4),
('Tarjeta','20220710',81.0,370000,8,4),
('Efectivo','20220710',93.0,370000,9,4),
------BIMESTRE 5
('Paypal','20220910',71.0,370000,10,5),
('Efectivo','20220910',87.0,570000,11,5),
('Tarjeta','20220910',78.0,570000,12,5),
('Efectivo','20220910',85.0,570000,13,5),
('Tarjeta','20220910',83.0,570000,1,5),
('Efectivo','20220910',80.0,570000,2,5),
('Paypal','20220910',77.0,570000,3,5),
('Tarjeta','20220910',93.0,570000,4,5),
('Efectivo','20220910',97.0,570000,5,5),
------BIMESTRE 6
('Paypal','20221110',71.0,970000,6,6),
('Efectivo','20221110',77.0,970000,7,6),
('Tarjeta','20221110',72.0,970000,8,6),
('Efectivo','20221110',81.0,970000,9,6),
('Tarjeta','20221110',86.0,970000,10,6),
('Efectivo','20221110',82.0,970000,11,6),
('Paypal','20221110',72.0,970000,12,6),
('Tarjeta','20221110',73.0,970000,13,6),
('Efectivo','20221110',87.0,970000,1,6)

------------------Registro Entradas
INSERT INTO Registros(Fecha, HoraIngreso, HoraSalida, CodigoProfesor)
VALUES
-------------NOCHE
('20220221','18:00','21:00',4),
('20220421','18:00','21:00',5),
('20221211','18:00','21:00',3),
('20220403','18:00','21:00',1),
('20220409','18:00','21:00',2),
('20220214','18:00','21:00',4),
('20220418','18:00','21:00',5),
('20221227','18:00','21:00',3),
('20220423','18:00','21:00',1),
('20220405','18:00','21:00',2),

-------------TARDE
('20221021','13:00','17:00',2),
('20220227','13:00','17:00',3),
('20221028','13:00','17:00',2),
('20220304','13:00','17:00',3),
('20221104','13:00','17:00',2),
('20220311','13:00','17:00',3),
('20221111','13:00','17:00',2),
('20220318','13:00','17:00',3),
('20221118','13:00','17:00',2),
('20220325','13:00','17:00',3),

-------------DIA
('20220821','08:00','12:00',1),
('20220527','08:00','12:00',2),
('20220828','08:00','12:00',1),
('20220604','08:00','12:00',2),
('20220904','08:00','12:00',1),
('20220611','08:00','12:00',2),
('20220911','08:00','12:00',1),
('20220618','08:00','12:00',2),
('20220918','08:00','12:00',1),
('20220625','08:00','12:00',2)

-----------------Registro Parametro
INSERT INTO Parametros(Anno,NumBimestre, Academia, CedulaJuridica, Telefono, Direccion)
VALUES
('20220120',4,'Spes Technical',1184802082,'2552-7890','Cartago Tejar Costado Norte del Parque')

/*Creacion de Procedimientos*/

--Punto 3
CREATE PROC Punto3
AS
	BEGIN
		SELECT Cedula,Nombre,Apellidos,FechaIngreso, Correo FROM Estudiantes
	END
GO

--Punto4
CREATE PROC Punto4
AS
	BEGIN
		SELECT Cedula, Nombre, Apellidos, GradoAcademico FROM Profesores
	END
GO

--Punto5
CREATE PROC Punto5
@Estudiante varchar(120)

AS
	BEGIN
		IF (@Estudiante IS NOT NULL)
			BEGIN
				SELECT e.Nombre, c.NombreCurso FROM Estudiantes e JOIN Matricula m ON (e.IdEstudiante = m.CodigoEstudiante) JOIN Cursos c ON (m.CodigoCurso = c.IdCurso) WHERE e.Nombre = @Estudiante
				RETURN 0
			END
		ELSE
			RETURN 1
	END
GO

--Punto6
CREATE PROC Punto6
@Estudiante varchar(120)

AS
	BEGIN
		IF (@Estudiante IS NOT NULL)
			BEGIN
				SELECT e.Nombre, SUM(m.PrecioPagado) AS Total_Pagado FROM Estudiantes e JOIN Matricula m ON (e.IdEstudiante = m.CodigoEstudiante) WHERE e.Nombre = @Estudiante GROUP BY e.Nombre
				RETURN 0
			END
		ELSE
			RETURN 1
	END
GO

--Punto7
CREATE PROC Punto7
@Mes varchar(20)

AS
	BEGIN
		IF (@Mes IS NOT NULL)
			BEGIN
				SELECT Fecha, SUM(PrecioPagado) AS Total_Pagado_Mes FROM Matricula WHERE Fecha LIKE '%'+@Mes+'%' GROUP BY Fecha

				RETURN 0
			END
		ELSE
			RETURN 1
	END
GO

--Punto 8
CREATE PROC Punto8
@Bimestre int,
@Annio varchar(20)

AS
	BEGIN
		IF (@Bimestre IS NOT NULL AND @Annio IS NOT NULL)
			BEGIN
				SELECT e.Nombre AS Estudiante, c.NombreCurso, m.Nota, cd.NumeroBimestre AS Bimestre FROM Estudiantes e JOIN Matricula m ON (e.IdEstudiante = m.CodigoEstudiante) JOIN Cursos c ON (m.CodigoCurso = c.IdCurso) JOIN CursosDisponibles cd ON (cd.CodigoCurso = m.CodigoCurso) WHERE cd.NumeroBimestre = @Bimestre AND m.Fecha like '%'+@Annio+'%' 
				RETURN 0
			END
		ELSE
			RETURN 1
	END
GO

--Punto9
CREATE PROC Punto9
@Estudiante varchar(120)

AS
	BEGIN
		IF (@Estudiante IS NOT NULL)
			BEGIN
				SELECT e.Nombre, c.NombreCurso FROM Estudiantes e JOIN Matricula m ON (e.IdEstudiante = m.CodigoEstudiante) JOIN Cursos c ON (m.CodigoCurso = c.IdCurso) WHERE e.Nombre = @Estudiante
				RETURN 0
			END
		ELSE
			RETURN 1
	END
GO
-------------EJECUCUION DE PROCESOS
EXEC Punto3
EXEC Punto4
EXEC Punto5 'Sofia'
EXEC Punto6 'Lucia'
EXEC Punto7 '07'
EXEC Punto8 2 ,'2022'
EXEC Punto9 'Pablo'

-------------CONSULTAS
SELECT * FROM Estudiantes
SELECT * FROM Profesores
SELECT * FROM Cursos
SELECT * FROM CursosDisponibles
SELECT * FROM Matricula
SELECT * FROM Registros
SELECT * FROM Parametros
