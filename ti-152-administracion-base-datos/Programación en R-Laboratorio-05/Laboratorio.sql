SELECT TOP 4 COUNT(O.EmployeeID) AS Ventas, E.FirstName FROM [Northwind].[dbo].[Orders] O JOIN
[Northwind].[dbo].[Employees] E ON (O.EmployeeID=E.EmployeeID) GROUP BY E.FirstName
HAVING COUNT(O.EmployeeID)>100 ORDER BY Ventas DESC

SELECT TOP 4 COUNT(O.ProductID) AS 'Cantidad Vendida', P.ProductName FROM [Northwind].dbo.[Order Details] O JOIN [Northwind].dbo.[Products] P ON (O.ProductID = P.ProductID)
GROUP BY P.ProductName, O.ProductID HAVING COUNT(*)>1  ORDER BY 'Cantidad Vendida' DESC

SELECT TOP 10 C.Country, SUM(OD.Quantity * OD.UnitPrice) AS 'Total Vendido' FROM [Northwind].dbo.[Customers] C JOIN [Northwind].dbo.[Orders] O ON (C.CustomerID = O.CustomerID)
JOIN [Northwind].dbo.[Order Details] OD ON (O.OrderID = OD.OrderID)
GROUP BY C.Country ORDER BY 'Total Vendido' DESC


SELECT * FROM Products
SELECT * FROM Orders
SELECT * FROM [Order Details]
SELECT * FROM Customers