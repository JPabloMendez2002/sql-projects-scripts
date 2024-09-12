-----CLASE 6

-----MOSTRAR LAS CATEGORIAS
SELECT CategoryName FROM Categories WHERE EXISTS (SELECT * FROM Products
WHERE Products.CategoryID  = Categories.CategoryID)


-----MOSTRAR LAS CATEGORIAS QUE NO ESTAN VACIAS
SELECT CategoryName FROM Categories WHERE NOT EXISTS (SELECT * FROM Products
WHERE Products.CategoryID  = Categories.CategoryID)


---- CONSULTA CON IN-> NOMBRES DE CLIENTES CUYO CUSTOMER ID ESTE EN LAS COMPRAS DE ESE AÑÓ
Select Customers.CompanyName FROM Customers
WHERE Customers.CustomerID IN (SELECT Orders.CustomerID FROM Orders
WHERE YEAR(Orders.OrderDate)=1996)

----- CONSULTA CON NOT IN
Select Customers.CompanyName FROM Customers
WHERE Customers.CustomerID NOT IN (SELECT Orders.CustomerID FROM Orders
WHERE YEAR(Orders.OrderDate)=1996)


----- CONSULTA CON LIKE -> BUSCAR CARACTERES ESPECIFICOS EN ESTE CASO CON A -> a%a
SELECT Customers.CompanyName FROM Customers WHERE Customers.CompanyName LIKE'a%'

----- CONSULTA CON LIKE -> EMPIEZE CON L Y TENGA 6 LETRAS
SELECT Customers.CompanyName, Customers.City FROM Customers WHERE Customers.City LIKE'L_____'

------CONSULTA CON IS NULL -> AVERIGUAR SI NO ES NULL CASO CONTRARIO LOS QUE NO TIENEN NULL
SELECT Customers.CompanyName, Customers.ContactName,
Customers.Address FROM Customers WHERE Customers.Address IS NULL

SELECT Customers.CompanyName, Customers.ContactName,
Customers.Address FROM Customers WHERE Customers.Address IS NOT NULL


--- CONSULTA CON INTERSECT SE USAN DOS SELECTS CON DATOS QUE COINCIDEN
SELECT Employees.City, Employees.Country FROM Employees
INTERSECT
SELECT Customers.City, Customers.Country FROM Customers

----- CONSULTA CON EXCEPT PARA ECONTRAR DIFERENCIAS O HAY EMPLEADOS O CLIENTES PERO NO LOS DOS
SELECT Employees.City, Employees.Country FROM Employees
EXCEPT 
SELECT Customers.City, Customers.Country FROM Customers

---CONSULTAS CON ALL ANY Y SOME
---ALL---> NO CUMPLE CON LA CONDICION DE LO CONTRARIO SI LO MUESTRA
SELECT Products.ProductName FROM Products WHERE Products.ProductID =
ALL(SELECT [Order Details].ProductID from [Order Details]
WHERE [Order Details].Quantity=10)
---ANY---SIRVE IGUAL QUE EL SOME
SELECT Products.ProductName FROM Products WHERE Products.ProductID =
ANY(SELECT [Order Details].ProductID from [Order Details]
WHERE [Order Details].Quantity=10)
----SOME--- SIRVE IGUAL QUE EL ANY
SELECT Products.ProductName FROM Products WHERE Products.ProductID =
SOME(SELECT [Order Details].ProductID from [Order Details]
WHERE [Order Details].Quantity=10)


