use Northwind
go

--CONSULTA 1
SELECT orders.OrderID, Customers.CompanyName, orders.OrderDate
FROM orders LEFT JOIN Customers on orders.CustomerID = Customers.CustomerID

--CONSULTA 2
SELECT orders.OrderID, Customers.CompanyName, orders.OrderDate
FROM orders RIGHT JOIN Customers on orders.CustomerID = Customers.CustomerID

--CONSULTA 3
SELECT orders.OrderID, Customers.CompanyName, orders.OrderDate
FROM orders FULL JOIN Customers on orders.CustomerID = Customers.CustomerID

--CONSULTA 4
SELECT orders.OrderID, Customers.CompanyName, orders.OrderDate
FROM orders INNER JOIN Customers on orders.CustomerID = Customers.CustomerID

--CONSULTA 5
SELECT SUM([Order Details].Quantity) FROM [Order Details]

---GRUPO POR AÑO
SELECT Customers.CompanyName, SUM([Order Details].Quantity*[Order Details].UnitPrice) AS VALOR FROM [Order Details] 
INNER JOIN orders on [Order Details].OrderID =Orders.OrderID INNER JOIN Customers on Customers.CustomerID = Orders.CustomerID WHERE YEAR
(Orders.OrderDate)= 1996 GROUP BY Customers.CompanyName

---GRUPO POR MES
SELECT Customers.CompanyName, SUM([Order Details].Quantity*[Order Details].UnitPrice) AS VALOR FROM [Order Details] 
INNER JOIN orders on [Order Details].OrderID =Orders.OrderID INNER JOIN Customers on Customers.CustomerID = Orders.CustomerID WHERE MONTH
(Orders.OrderDate)= 12 GROUP BY Customers.CompanyName

---GRUPO POR DÍA
SELECT Customers.CompanyName, SUM([Order Details].Quantity*[Order Details].UnitPrice) AS VALOR FROM [Order Details] 
INNER JOIN orders on [Order Details].OrderID =Orders.OrderID INNER JOIN Customers on Customers.CustomerID = Orders.CustomerID WHERE DAY
(Orders.OrderDate)= 31 GROUP BY Customers.CompanyName

---GRUPO POR AÑO CON ORDENES MENORES A 200
SELECT Customers.CompanyName, SUM([Order Details].Quantity*[Order Details].UnitPrice) AS VALOR FROM [Order Details] 
INNER JOIN orders on [Order Details].OrderID =Orders.OrderID INNER JOIN Customers on Customers.CustomerID = Orders.CustomerID WHERE YEAR
(Orders.OrderDate)= 1996 GROUP BY Customers.CompanyName HAVING SUM([Order Details].Quantity + [Order Details].UnitPrice)>200