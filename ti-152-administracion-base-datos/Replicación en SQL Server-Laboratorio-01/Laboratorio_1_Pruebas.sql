use bdLab1
go

----INSERT PRUEBA
INSERT INTO Vehiculos(Marca, Modelo, Anno)
VALUES
('PRUEBA','INSERT','2022')

----UPDATE PRUEBA
UPDATE Vehiculos SET Marca = 'UPDATE'


---- DELETE PRUEBA
DELETE FROM Vehiculos WHERE IdVehiculo = (8)
SELECT * FROM Vehiculos