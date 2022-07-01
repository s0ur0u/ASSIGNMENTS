Use AdventureWorks2019;

/*1-Write a query that retrieves the columns ProductID, Name,
Color and ListPrice from the Production.Product table, with no filter*/

Select ProductID, Name, Color, ListPrice
FROM Production.Product


/*2-Write a query that retrieves the columns ProductID, Name,
Color and ListPrice from the Production.Product table, excludes
the rows that ListPrice is 0.*/

Select ProductID, Name, Color, ListPrice
FROM Production.Product
WHERE ListPrice != 0 


/*3-Write a query that retrieves the columns ProductID, Name,
Color and ListPrice from the Production.Product table, the
rows that are NULL for the Color column.*/

Select ProductId, Name, Color, ListPrice
FROM Production.Product
WHERE Color IS NULL


/*4-Write a query that retrieves the columns ProductID, Name,
Color and ListPrice from the Production.Product table, the rows
that are not NULL for the Color column.*/

Select ProductId, Name, Color, ListPrice
FROM Production.Product
WHERE Color IS NOT NULL


/*5-Write a query that retrieves the columns ProductID, Name,
Color and ListPrice from the Production.Product table, the rows
that are not NULL for the column Color, and the column ListPrice
has a value greater than zero.*/

Select ProductId, Name, Color, ListPrice
FROM Production.Product
WHERE Color IS NOT NULL AND ListPrice >0


/*6-Write a query that concatenates the columns Name and Color
from the Production.Product table by excluding the rows that are
null for color.*/

Select Name+' '+Color [Concatenated Columns]
FROM Production.Product
WHERE Color IS NOT NULL

/*7-Write a query that generates the following result set  from
Production.Product*/

Select Name, Color
FROM Production.Product
WHERE Color IS NOT NULL
ORDER BY ProductId
    OFFSET 0 ROWS  
    FETCH NEXT 6 ROWS ONLY;  


/*8-Write a query to retrieve the to the columns ProductID and Name from
the Production.Product table filtered by ProductID from 400 to 500*/

Select ProductId, Name
FROM Production.Product
WHERE ProductId BETWEEN 400 AND 500


/*9-Write a query to retrieve the to the columns  ProductID, Name and color
from the Production.Product table restricted to the colors black and blue*/

Select ProductId, Name, Color
FROM Production.Product
WHERE Color in ('Black', 'Blue')


/*10-Write a query to get a result set on products that begins with the
letter S.*/

Select ProductId, Name, ListPrice
FROM Production.Product
WHERE Name LIKE 'S%'


/*11-Write a query that retrieves the columns Name and ListPrice from
the Production.Product table. Your result set should look something like
the following. Order the result set by the Name column. */

Select Name, ListPrice
FROM Production.Product
WHERE Name Like 'S[^P-T]%'
ORDER BY Name
	OFFSET 0 ROWS
	FETCH NEXT 6 ROWS ONLY


/*12-Write a query that retrieves the columns Name and ListPrice from the
Production.Product table. Your result set should look something like the
following. Order the result set by the Name column. The products name should
start with either 'A' or 'S'*/

Select Name, ListPrice
FROM Production.Product
WHERE Name Like 'A%' OR Name Like 'S%'
ORDER BY Name
	OFFSET 0 ROWS
	FETCH NEXT 5 ROWS ONLY


/*13-Write a query so you retrieve rows that have a Name that begins with
the letters SPO, but is then not followed by the letter K. After this zero
or more letters can exists. Order the result set by the Name column.*/

Select *
FROM Production.Product
WHERE Name Like 'Spo[^K]%'
ORDER BY Name


/*14-Write a query that retrieves unique colors from the table Production.
Product. Order the results  in descending  manner*/

Select DISTINCT Color
FROM Production.Product
WHERE Color IS NOT NULL
ORDER BY Color DESC


/*15-Write a query that retrieves the unique combination of columns
ProductSubcategoryID and Color from the Production.Product table.
Format and sort so the result set accordingly to the following.
We do not want any rows that are NULL.in any of the two columns in
the result.*/

Select ProductSubcategoryID, Color
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL AND Color IS NOT NULL