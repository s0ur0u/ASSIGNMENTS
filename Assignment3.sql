USE Northwind

/*1-List all cities that have both Employees and Customers.*/
Select DISTINCT e.City
FROM Employees e JOIN Customers c ON 
	e.City = c.City

/*2-List all cities that have Customers but no Employee.*/
	/*a-Use sub-query*/
Select DISTINCT City
FROM Customers c
WHERE City NOT IN (Select City FROM Employees )

	/*b-Do not use sub-query*/
Select DISTINCT c.City
FROM Employees e INNER JOIN Orders o ON 
	o.EmployeeID = e.EmployeeID INNER JOIN Customers c ON
	c.CustomerID = o.CustomerID
WHERE c.City != e.City

/*3-List all products and their total order quantities throughout all orders.*/
Select d.ProductID, p.ProductName, SUM(d.Quantity)[TotalCount]
FROM Products p INNER JOIN [Order Details] d ON
	p.ProductID = d.ProductID
GROUP BY d.ProductID, p.ProductName
ORDER BY d.ProductID

/*4-List all Customer Cities and total products ordered by that city.*/
Select c.City, SUM(d.Quantity)[TotalProducts]
FROM Customers c INNER JOIN(Orders o INNER JOIN [Order Details] d ON
	o.OrderID = d.OrderID) ON 
	c.CustomerID = o.CustomerID
GROUP BY c.City
ORDER BY c.City

/*5-List all Customer Cities that have at least two customers.*/
	/*a- Use union*/
WITH Totals
AS(
	Select City, CustomerID
	FROM Customers
	UNION
	Select ShipCity, CustomerID
	FROM Orders
)
Select City, COUNT(CustomerId) 
FROM Totals
GROUP BY City
HAVING COUNT(CustomerID)>2
ORDER BY City

	/*b-Use sub-query and no union*/
Select City, COUNT(CustomerID)[NumberOfCustomers]
FROM Customers
GROUP BY City
HAVING COUNT(CustomerID)>2
ORDER BY City

/*6-List all Customer Cities that have ordered at least two different kinds 
of products.*/
WITH OtherTable
AS(
Select c.City, d.ProductID, COUNT(d.ProductID)[Total Orders]
FROM Customers c INNER JOIN(Orders o INNER JOIN [Order Details] d ON
	o.OrderID = d.OrderID) ON
	c.CustomerID = o.CustomerID
GROUP BY c.City, d.ProductID
)
Select DISTINCT City FROM OtherTable

/*7-List all Customers who have ordered products, but have the ‘ship city’ 
on the order different from their own customer cities*/
Select DISTINCT c.CustomerID, c.City, o.ShipCity
FROM Customers c INNER JOIN Orders o ON
	c.CustomerID = o.CustomerID
WHERE c.City != o.ShipCity
ORDER BY c.CustomerID

/*8-List 5 most popular products, their average price, and the customer city 
that ordered most quantity of it.*/
Select d.ProductID, p.ProductName, SUM(d.Quantity)[TotalOrders], 
	AVG(d.Quantity)[AvgQuantity], o.ShipCity
FROM Orders o INNER JOIN (Products p INNER JOIN [Order Details] d ON 
	p.ProductID = d.ProductID)  ON
	o.OrderID = d.OrderID
GROUP BY d.ProductID, o.ShipCity, p.ProductName
ORDER BY TotalOrders DESC
OFFSET 0 ROWS
FETCH NEXT 5 ROWS ONLY

/*9-List all cities that have never ordered something but we have employees there.*/
	/*a-Use sub-query*/
Select DISTINCT City
FROM Employees
WHERE City  NOT IN (
	Select ShipCity
	FROM Orders
)

	/*b-Do not use sub-query*/
Select DISTINCT e.City, e.Country
FROM Employees e LEFT JOIN Orders o ON
	e.EmployeeID = o.EmployeeID
WHERE e.City != o.ShipCity

/*10-List one city, if exists, that is the city from where the employee sold 
most orders (not the product quantity) is, and also the city of most total 
quantity of products ordered from.*/
Select o.ShipCity, COUNT(d.ProductID)[MostOrders], SUM(d.Quantity)[TotalProducts]
FROM Orders o INNER JOIN [Order Details] d ON
	o.OrderID = d.OrderID
GROUP BY o.ShipCity
ORDER BY TotalProducts DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROW ONLY

/*11-You remove the duplicate record of a table by using the UNION operation.
You can also use the DISTINCT operator*/
