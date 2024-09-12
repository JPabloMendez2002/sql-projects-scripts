CREATE Table Usuarios(
IdUser int primary key identity(1,1),
Nombre varchar (200),
create database bdLab2
go

use bdLab2
go

CREATE Table Usuarios(
IdUser int primary key identity(1,1),
Nombre varchar (200),
Cedula int,
Usuario varchar(20),
Contrasena varchar(200)
)


INSERT INTO Usuarios(Nombre,Cedula,Usuario, Contrasena)
VALUES
('PABLO',118480208,'PABLO_CUC','1214$'),
('JUAN',313480553,'JUAN_CUC','1245$'),
('SOFIA',718305032,'SOFIA_CUC','1236$'),
('SYLVIA',618470908,'SYLVIA_CUC','1247$'),
('ROGER',518456209,'ROGER_CUC','1258$')


SELECT * FROM Usuarios