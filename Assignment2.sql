USE AdventureWorks2019

/*1-How many products can you find in the Production.Product table?*/
Select Count(*) [Number Of Product]
FROM Production.Product
/*There are 504 Products in the Production.Product table*/

/*2-Write a query that retrieves the number of products in the 
Production.Product table that are included in a subcategory.
The rows that have NULL in column ProductSubcategoryID are considered
to not be a part of any subcategory.*/
Select COUNT(ProductSubcategoryID) AS Subcategory
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL

/*3-How many Products reside in each SubCategory? Write a query to display
the results with the following titles. ProductSubcategoryID CountedProducts*/
Select ProductSubcategoryID, COUNT(ProductSubcategoryID) [CountedProducts]
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL
GROUP BY ProductSubcategoryID

/*4-How many products that do not have a product subcategory.*/
Select COUNT(Name) [No Subcategory]
FROM Production.Product
WHERE ProductSubcategoryID IS NULL
/*There are 209 Products with no subcategory*/

/*5-Write a query to list the sum of products quantity in the
Production.ProductInventory table*/
Select SUM(Quantity) [Sum of Products]
FROM Production.ProductInventory

/*6-Write a query to list the sum of products in the 
Production.ProductInventory table and LocationID set to 40 and limit the 
result to include just summarized quantities less than 100.*/
Select LocationID[ProductID], SUM(Quantity) AS TheSum
FROM Production.ProductInventory
WHERE LocationID = 40 AND Quantity<100
GROUP BY LocationID

/*7-Write a query to list the sum of products with the shelf information 
in the Production.ProductInventory table and LocationID set to 40 and limit 
the result to include just summarized quantities less than 100*/
Select Shelf, LocationID[ProductID], SUM(Quantity)[TheSum]
FROM Production.ProductInventory
WHERE LocationID = 40 AND Quantity<100
GROUP BY LocationID, Shelf

/*8-Write the query to list the average quantity for products where
column LocationID has the value of 10 from the table 
Production.ProductInventory table.*/
Select LocationID, AVG(Quantity)[TheAvg]
FROM Production.ProductInventory
WHERE LocationID = 10
GROUP BY LocationID

/*9-Write query  to see the average quantity  of  products by shelf  
from the table Production.ProductInventory*/
Select LocationID[ProductID],Shelf, AVG(Quantity) AS TheAvg
FROM Production.ProductInventory
GROUP BY LocationID, Shelf

/*10-Write query  to see the average quantity  of  products by shelf 
excluding rows that has the value of N/A in the column Shelf from the table 
Production.ProductInventory*/
Select LocationID[ProductID], Shelf, AVG(Quantity)[TheAvg]
FROM Production.ProductInventory
WHERE Shelf != 'N/A'
GROUP BY LocationID, Shelf

/*11-List the members (rows) and average list price in the 
Production.Product table. This should be grouped independently over the 
Color and the Class column. Exclude the rows where Color or Class are null.*/
Select Color, Class, COUNT(Color)[TheCount], AVG(ListPrice)[AvgPrice]
FROM Production.Product
WHERE Color IS NOT NULL AND Class IS NOT NULL
GROUP BY Color, Class

/*12-Write a query that lists the country and province names from person. 
CountryRegion and person. StateProvince tables. Join them and produce a 
result set similar to the following.*/
Select p.Name AS Country, c.Name AS Province
FROM person.CountryRegion c INNER JOIN person.StateProvince p ON
c.CountryRegionCode = p.CountryRegionCode

/*13-Write a query that lists the country and province names from 
person. CountryRegion and person. StateProvince tables and list the countries 
filter them by Germany and Canada. Join them and produce a result set 
similar to the following.*/
Select p.Name[Country], c.Name[Province]
FROM person.CountryRegion c INNER JOIN person.StateProvince p ON 
c.CountryRegionCode=p.CountryRegionCode
WHERE c.Name in ('Germany', 'Canada')



USE Northwind

/*14-List all Products that has been sold at least once in last 25 years.*/
Select d.ProductID,  SUM(d.Quantity)[Counts]
FROM Orders o INNER JOIN [Order Details] d ON
o.OrderID = d.OrderID
WHERE DATEDIFF(year, o.OrderDate, GETDATE())< 25
GROUP BY d.ProductID
ORDER BY ProductID


/*15-List top 5 locations (Zip Code) where the products sold most.*/
Select TOP 5 o.ShipPostalCode, SUM(d.Quantity)[SumOfProducts]
FROM Orders o INNER JOIN [Order Details] d ON
o.OrderID = d.OrderID
WHERE ShipPostalCode IS NOT NULL
GROUP BY o.ShipPostalCode
ORDER BY SumOfProducts DESC

/*16-List top 5 locations (Zip Code) where the products sold most in 
last 25 years.*/
Select TOP 5 o.ShipPostalCode, SUM(d.Quantity)[SumOfProducts]
FROM Orders o INNER JOIN [Order Details] d ON
o.OrderID = d.OrderID
WHERE o.ShipPostalCode IS NOT NULL AND 
	DATEDIFF(YEAR, o.OrderDate, GETDATE())<25
GROUP BY o.ShipPostalCode
ORDER BY SumOfProducts DESC

/*17-List all city names and number of customers in that city.*/
Select City, COUNT(CompanyName)[NumberOfCustomers]
FROM Customers
GROUP BY City

/*18-List city names which have more than 2 customers, and number of 
customers in that city*/
Select City, COUNT(CustomerID)[NumberOfCustomers]
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID)>2
ORDER BY NumberOfCustomers DESC

/*19-List the names of customers who placed orders after 1/1/98 with order date.*/
Select c.CompanyName, o.OrderDate
FROM Customers c JOIN Orders o ON 
c.CustomerID = o.CustomerID
WHERE o.OrderDate BETWEEN'1998-01-01'AND GETDATE()

/*20-List the names of all customers with most recent order dates*/
Select DISTINCT o.OrderDate,c.CompanyName
FROM Customers c JOIN Orders o ON
c.CustomerID = o.CustomerID
ORDER BY CompanyName

/*21-Display the names of all customers  along with the  count of 
products they bought*/
Select c.CompanyName, SUM(d.Quantity)[TotalProducts]
FROM Customers c INNER JOIN (Orders o INNER JOIN [Order Details] d 
	ON o.OrderID = d.OrderID)
	ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName
ORDER BY TotalProducts

/*22-Display the customer ids who bought more than 100 Products with 
count of products.*/
Select c.CustomerID, SUM(d.Quantity)[TotalProducts]
FROM Customers c INNER JOIN ([Order Details] d INNER JOIN Orders o 
	ON d.OrderID = o.OrderID)
	ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
HAVING SUM(d.Quantity)>100
ORDER BY TotalProducts DESC

/*23-List all of the possible ways that suppliers can ship their products. 
Display the results as below*/
Select DISTINCT s.CompanyName[Supplier Company Name], ss.CompanyName[Shipping Company Name]
FROM Suppliers s INNER JOIN(Products p INNER JOIN( [Order Details]d INNER JOIN (Orders o
	INNER JOIN Shippers ss
	ON ss.ShipperID = o.ShipVia)
	ON o.OrderID = d.OrderID)
	ON d.ProductID = p.ProductID)
	ON p.SupplierID = s.SupplierID
ORDER BY [Supplier Company Name]

/*24-Display the products order each day. Show Order date and Product Name.*/
Select o.OrderDate, p.ProductName, d.OrderID, d.ProductID
FROM Orders o  INNER JOIN( [Order Details] d INNER JOIN Products p
	ON d.ProductID = p.ProductID)
	ON o.OrderID = d.OrderID
ORDER BY o.OrderDate

/*25-Displays pairs of employees who have the same job title.*/
Select FirstName+' '+LastName[FullName], Title
FROM Employees
WHERE Title IN (
	Select Title
	FROM Employees
	GROUP BY Title
	HAVING COUNT(Title)>2
)
ORDER BY FullName

/*26-Display all the Managers who have more than 2 employees reporting to them.*/
With Bosses
AS(
	Select FirstName, ReportsTo, EmployeeID
	FROM Employees
	WHERE ReportsTo IS NULL
	UNION ALL
	Select  e.FirstName, e.ReportsTo, e.EmployeeID
	FROM Employees e INNER JOIN Bosses cte ON e.ReportsTo = cte.EmployeeID
	)
Select FirstName, ReportsTo
FROM Bosses
GROUP BY FirstName, ReportsTo
HAVING COUNT(ReportsTo)>0

/*27-Display the customers and suppliers by city. The results should have the
following columns*/
Select City, CompanyName[Name], ContactName,Relationship[Type(Customer or Supplier)]
FROM [Customer and Suppliers by City]