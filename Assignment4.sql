USE Northwind

/*1-Create a view named “view_product_order_[your_last_name]”, 
list all products and total ordered quantity for that product.*/
CREATE VIEW view_product_order_Gael
AS
Select p.ProductName, p.ProductID, SUM(Quantity)[TotalOrders]
FROM Products p INNER JOIN [Order Details] d ON
	p.ProductID = d.ProductID
GROUP BY p.ProductName, p.ProductID
Select* 
FROM view_product_order_Gael
ORDER BY ProductID

/*2-Create a stored procedure “sp_product_order_quantity_[your_last_name]”
that accept product id as an input and total quantities of order as 
output parameter.*/
CREATE PROC sp_product_order_quantity_Gael
@product_id int
AS
BEGIN
	Select SUM(Quantity)[Total]
	FROM [Order Details]
	WHERE ProductID = @product_id
END
EXEC sp_product_order_quantity_Gael 2

/*3-Create a stored procedure “sp_product_order_city_[your_last_name]” 
that accept product name as an input and top 5 cities that ordered most 
that product combined with the total quantity of that product ordered 
from that city as output.*/
CREATE PROC sp_product_order_city_Gael
@product varchar(20)
AS
BEGIN
	Select o.ShipCity, SUM(d.Quantity)[TotalQuantity]
	FROM Products p INNER JOIN [Order Details] d ON p.ProductID = d.ProductID
		INNER JOIN Orders o ON o.OrderID = d.OrderID
	WHERE p.ProductName = @product
	GROUP BY o.ShipCity
	ORDER BY TotalQuantity DESC
	OFFSET 0 ROWS
	FETCH NEXT 5 ROWS ONLY
END
EXEC sp_product_order_city_Gael Chang

/*4-Create 2 new tables “people_your_last_name” “city_your_last_name”. 
City table has two records: {Id:1, City: Seattle}, {Id:2, City: Green Bay}. 
People has three records: {id:1, Name: Aaron Rodgers, City: 2}, 
{id:2, Name: Russell Wilson, City:1}, {Id: 3, Name: Jody Nelson, City:2}. 
Remove city of Seattle. If there was anyone from Seattle, put them into 
a new city “Madison”. Create a view “Packers_your_name” lists all people 
from Green Bay. If any error occurred, no changes should be made to DB. 
(after test) Drop both tables and view.*/
CREATE TABLE city_Gael(
	Id int IDENTITY(1,1)PRIMARY KEY,
	City varchar(20)
)
CREATE TABLE people_Gael(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Name varchar(20),
	City int FOREIGN KEY REFERENCES city_Gael(Id) ON DELETE SET DEFAULT
)

INSERT INTO city_Gael VALUES('Seattle'),
('Green Bay')
INSERT INTO people_Gael VALUES('Aaron Rodgers',2),
('Russel Wilson',1),
('Jody Nelson',2)

DELETE FROM city_Gael WHERE City='Seattle'

INSERT INTO city_Gael VALUES('Madison')

UPDATE people_Gael SET City=3 WHERE City IS NULL

CREATE VIEW Packers_Gael
AS
	Select p.Name, c.City
	FROM people_Gael p INNER JOIN city_Gael c ON 
		p.City = c.Id
	WHERE c.city = 'Green Bay'

Select* FROM Packers_Gael
Select*FROM city_Gael
Select*FROM people_Gael

DROP TABLE city_Gael
DROP TABLE people_Gael
DROP VIEW Packers_Gael

/*5-Create a stored procedure “sp_birthday_employees_[you_last_name]” 
that creates a new table “birthday_employees_your_last_name” and fill 
it with all employees that have a birthday on Feb. (Make a screen shot) 
drop the table. Employee table should not be affected.*/
CREATE PROC sp_birthday_employees_Gael
AS
BEGIN
	Select TitleOfCourtesy, LastName+' '+FirstName[FullName], BirthDate
	FROM Employees
	WHERE BirthDate like '%[1-9]%-02-%[1-9]%'
END
EXEC sp_birthday_employees_Gael
DROP PROC sp_birthday_employees_Gael

/*6-To make sure that two tables have the same data, we apply the INNER JOIN 
operator on both tables*/
