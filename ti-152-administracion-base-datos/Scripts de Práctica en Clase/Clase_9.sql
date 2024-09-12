use Northwind


---VERSION DE SQL
PRINT 'VERSION:' + @@VERSION
---LENGAUJE APLICATIVO
PRINT 'LENGUAJE:' + @@LANGUAGE
---NOMBRE DEL SERVIDOR 
PRINT 'SERVIDOR:' + @@SERVERNAME
---CANTIDAD DE CONEXIONES PERMITIDAS
PRINT 'CONEXIONES:' + STR(@@MAX_CONNECTIONS)


----SERVIDOR NOMBRE EL LOGIN NUMERO DE CONEXIONES EN CADA UNA DE LAS BASES QUE TENGO
SELECT @@SERVERNAME AS server,
NAME AS dbName, LOGINAME AS LoginName, COUNT(STATUS) AS number_of_connections, GETDATE() AS timestamp
FROM sys.databases sd LEFT JOIN sys.sysprocesses sp ON sd.database_id = sp.dbid
WHERE database_id NOT BETWEEN 1 AND 4 AND LOGINAME IS NOT NULL GROUP BY NAME,LOGINAME

DECLARE @Error int BEGIN TRANSACTION INSERT INTO [dbo].[Orders] ([CustomerID],[EmployeeID],[OrderDate],
[RequiredDate],[ShippedDate],[ShipVia],[Freight],[ShipName],[ShipAddress],[ShipCity],[ShipRegion],[ShipPostalCode],[ShipCountry])
VALUES ('VINET',5,GETDATE(),GETDATE(),GETDATE(),3,32.38,'Vins et alcools','59 rue de Ibbaye','Rems',NULL,'51100','France')
SET @Error=@@ERROR
IF (@Error <> 0) GOTO TratarError
SELECT @@IDENTITY AS  'Id';

INSERT INTO [dbo].[Order Details] ([OrderID],[ProductID],[UnitPrice],[Quantity],[Discount])
VALUES (@@IDENTITY, '11',14,12,0)
set @Error=@@ERROR

IF (@Error<>0) GOTO TratarError
COMMIT;
TratarError:
if @@ERROR <>0
BEGIN PRINT 'Hay Error, se cancelo';
ROLLBACK TRAN
END

SELECT * FROM Orders
SELECT * FROM [Order Details]