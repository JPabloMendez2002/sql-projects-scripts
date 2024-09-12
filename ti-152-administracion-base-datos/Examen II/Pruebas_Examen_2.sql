use Examen_2OF
go
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