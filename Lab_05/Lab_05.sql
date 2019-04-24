/*==================================================================================
1. Retrieve the name and approximate weight of each product 
====================================================================================*/

SELECT CONCAT(ProductID ,' ', UPPER(Name)) AS Product, ROUND(Weight, -1) AS Weight
FROM SalesLT.Product

/*==================================================================================
2. Retrieve the year and month in which products were first sold
====================================================================================*/

SELECT CONCAT(ProductID ,' ', UPPER(Name)) AS Product, ROUND(Weight, -1) AS Weight,
		YEAR(SellStartDate) as SellStartYear, DATENAME(mm, SellStartDate) AS SellStartMonth
FROM SalesLT.Product

/*==================================================================================
3. Extract product types from product numbers
====================================================================================*/

SELECT CONCAT(ProductID ,' ', UPPER(Name)) AS Product, ROUND(Weight, -1) AS Weight,
		YEAR(SellStartDate) as SellStartYear, DATENAME(mm, SellStartDate) AS SellStartMonth,
		LEFT(ProductNUmber, 2) AS ProductType
FROM SalesLT.Product

/*==================================================================================
4. Retrieve only products with a numeric size
====================================================================================*/

SELECT CONCAT(ProductID ,' ', UPPER(Name)) AS Product, ROUND(Weight, -1) AS Weight,
		YEAR(SellStartDate) as SellStartYear, DATENAME(mm, SellStartDate) AS SellStartMonth,
		LEFT(ProductNUmber, 2) AS ProductType, Size AS NumericSize
FROM SalesLT.Product
WHERE ISNUMERIC(Size) = 1

/*==================================================================================
1. Retrieve companies ranked by sales totals 
====================================================================================*/

SELECT CompanyName, RANK() OVER(ORDER BY TotalDue DESC) AS [Highest Total Dues]
FROM SalesLT.Customer c
JOIN SalesLT.SalesOrderHeader soh
ON c.CustomerID = soh.CustomerID

/*==================================================================================
1. Retrieve total sales by product
====================================================================================*/

SELECT Name, SUM(LineTotal) AS TotalRevenue
FROM SalesLT.Product p
JOIN SalesLT.SalesOrderDetail soh 
ON p.ProductID = soh.ProductID
GROUP BY p.Name
Order BY TotalRevenue Desc

/*==================================================================================
2. Filter the product sales list to include only products that cost over $1,000 
====================================================================================*/

SELECT Name, SUM(LineTotal) AS TotalRevenue
FROM SalesLT.Product p
JOIN SalesLT.SalesOrderDetail soh 
ON p.ProductID = soh.ProductID
WHERE p.ListPrice > 1000
GROUP BY p.Name
Order BY TotalRevenue Desc

/*==================================================================================
3. Filter the product sales groups to include only total sales over $20,000 
====================================================================================*/

SELECT Name, SUM(LineTotal) AS TotalRevenue
FROM SalesLT.Product p
JOIN SalesLT.SalesOrderDetail soh 
ON p.ProductID = soh.ProductID
GROUP BY p.Name
HAVING SUM(LineTotal) > 20000
Order BY TotalRevenue Desc