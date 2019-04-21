/*====================================================================================
1. Retrieve a list of cities 
======================================================================================*/

SELECT DISTINCT City, StateProvince 
FROM SalesLT.Address 
ORDER BY City;

/*====================================================================================
2. Retrieve the heaviest products
======================================================================================*/

SELECT TOP 10 PERCENT Weight, Name 
FROM SalesLT.Product
ORDER BY Weight Desc;

/*====================================================================================
3. Retrieve the heaviest 100 products not including the heaviest ten
======================================================================================*/

SELECT Weight, Name
FROM SalesLT.Product
ORDER BY Weight DESC OFFSET 10 ROWS FETCH NEXT 100 ROWS ONLY;

/*====================================================================================
4. Retrieve product details for product model 1 
======================================================================================*/

SELECT ProductModelID, Name, Color, Size
FROM SalesLT.Product 
Where ProductModelID = 1;

/*====================================================================================
5. Filter products by color and size 
======================================================================================*/

SELECT ProductNumber, Name, Color, Size
FROM SalesLT.Product
WHERE Color in ('black', 'red', 'white') AND Size in ('S', 'M');

/*====================================================================================
6. Filter products by product number  
======================================================================================*/

SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK%';

/*====================================================================================
7. Retrieve specific products by product number 
======================================================================================*/

SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';