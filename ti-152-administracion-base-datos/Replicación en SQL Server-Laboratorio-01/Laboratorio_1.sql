create database bdLaboratorio1
go

use bdLaboratorio1
go

create Table Vehiculos(
IdVehiculo int primary key identity(1,1),
Marca varchar (100) not null,
Modelo varchar (200) not null,
Anno int
)

INSERT INTO Vehiculos(Marca, Modelo, Anno)
VALUES
('TOYOTA','RAV4','2022'),
('TOYOTA','YARIS','2021'),
('TOYOTA','CORROLLA','2017'),
('HONDA','CRV','2020'),
('HONDA','ACCORD','2021'),
('HONDA','CIVIC','2018'),
('NISSAN','VERSA','2022')

SELECT * FROM Vehiculos