use AdventureWorks2014
go
----CLASE 11 VISTAS SQL

----NO SE UTILIZA UNION


SELECT * FROM HumanResources.vEmployee WHERE FirstName = 'Ken'

--------EMPELADOS QUE TENGAN MAS DE 20 HORAS DE VACACIONES
CREATE VIEW HumanResources.Vacation (nombre, apellidos, vacaciones) AS SELECT p.FirstName, p.LastName, e.VacationHours
FROM Person.Person p INNER JOIN HumanResources.Employee e ON p.BusinessEntityID = e.BusinessEntityID
WHERE e.VacationHours>20

UPDATE HumanResources.Vacation SET vacaciones =15 WHERE nombre = 'Ken'


CREATE VIEW HumanResources.Vacation2 AS SELECT p.FirstName, p.LastName, e.VacationHours
FROM Person.Person p INNER JOIN HumanResources.Employee e ON p.BusinessEntityID = e.BusinessEntityID
WHERE e.VacationHours>20

SELECT * FROM HumanResources.Vacation
SELECT * FROM HumanResources.Vacation2


--------------VISTA TOTAL DE EMPLEADOS POR DEPARTAMENTO
CREATE VIEW HumanResources.TotalEmployeeByDepartment (Department,Total) AS SELECT d.Name, COUNT(e.BusinessEntityID)
FROM HumanResources.Department d INNER JOIN HumanResources.EmployeeDepartmentHistory e ON 
d.DepartmentID = e.DepartmentID WHERE YEAR(e.StartDate)=2011 GROUP BY d.Name

SELECT * FROM HumanResources.TotalEmployeeByDepartment

CREATE VIEW HumanResources.EmployeeJobs (nombre, apellido, Trabajo, Fecha, Guia1,Guia2) AS SELECT
p.FirstName, p.LastName,e.JobTitle,d.StartDate, p.rowguid, e.rowguid
FROM Person.Person p INNER JOIN HumanResources.Employee e ON p.BusinessEntityID = e.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory d ON e.BusinessEntityID = d.BusinessEntityID

CREATE VIEW HumanResources.EmployeeJobs2 AS SELECT
p.FirstName, p.LastName,e.JobTitle,d.StartDate, p.rowguid, e.rowguid
FROM Person.Person p INNER JOIN HumanResources.Employee e ON p.BusinessEntityID = e.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory d ON e.BusinessEntityID = d.BusinessEntityID

SELECT * FROM HumanResources.EmployeeJobs


--------EMPELADOS QUE TENGAN MAS DE 20 HORAS DE VACACIONES CON CHECK POINT
CREATE VIEW HumanResources.Vacation3 (nombre, apellidos, vacaciones) AS SELECT p.FirstName, p.LastName, e.VacationHours
FROM Person.Person p INNER JOIN HumanResources.Employee e ON p.BusinessEntityID = e.BusinessEntityID
WHERE e.VacationHours>20 WITH CHECK OPTION

SELECT * FROM HumanResources.Vacation3



UPDATE HumanResources.Vacation3 SET vacaciones =15 WHERE nombre = 'Dylan'

SELECT * FROM HumanResources.Employee

UPDATE HumanResources.Employee SET VacationHours = 200 WHERE BusinessEntityID = 1