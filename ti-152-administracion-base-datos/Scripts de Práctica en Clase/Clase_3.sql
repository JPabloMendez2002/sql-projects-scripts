use Northwind
go

-----UNION, SELECCIONA EL MAYOR Y EL MENOR ENTRE LOS PRODUCTOS PRECIOS
SELECT DISTINCT Products.ProductName,[Order Details].UnitPrice FROM [Order Details]
INNER JOIN Products on [Order Details].ProductID = Products.ProductID 
WHERE [Order Details].UnitPrice
=(SELECT MAX(a.UnitPrice) FROM [Order Details]a)

UNION

SELECT DISTINCT Products.ProductName,[Order Details].UnitPrice
FROM [Order Details] INNER JOIN Products oN [Order Details].ProductID = Products.ProductID
WHERE [Order Details].UnitPrice=(SELECT MIN(a.UnitPrice) FROM [Order Details] a)


-------CUBE, SACA POR AÑO Y EL SUBTOTAL DE VENTAS TAMBIEN POR MES LOS NULL SON LOS SUBTOTALES EN LA LISTA
SELECT Customers.CompanyName, YEAR(Orders.OrderDate) as Anno, MONTH(Orders.OrderDate) as Mes,SUM([Order Details].UnitPrice 
* [Order Details].Quantity) as Subtotal FROM [Order Details] INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID
INNER JOIN Customers on Orders.CustomerID = Customers.CustomerID
GROUP BY CUBE(Customers.CompanyName,YEAR(Orders.OrderDate),  MONTH(Orders.OrderDate))

-----ROLL UP, GENERA CONJUNTO DE SUBTOTALES EN ESTE CASO POR AÑOS
SELECT Customers.CompanyName, YEAR(Orders.OrderDate) as Anno,SUM([Order Details].UnitPrice 
* [Order Details].Quantity) as Subtotal FROM [Order Details] INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID
INNER JOIN Customers on Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CompanyName, YEAR(Orders.OrderDate) WITH ROLLUP

-----ROLL UP, GENERA CONJUNTO DE SUBTOTALES EN ESTE CASO POR AÑOS Y MES
SELECT Customers.CompanyName, YEAR(Orders.OrderDate) as Anno,MONTH(Orders.OrderDate) as Mes,SUM([Order Details].UnitPrice 
* [Order Details].Quantity) as Subtotal FROM [Order Details] INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID
INNER JOIN Customers on Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CompanyName, YEAR(Orders.OrderDate), MONTH(Orders.OrderDate) WITH ROLLUP

