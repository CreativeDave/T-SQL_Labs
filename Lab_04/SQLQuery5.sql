/*====================================================================================
1. Retrieve the name and approximate weight of each product
======================================================================================*/

SELECT CONCAT(ProductID, ' ', Name ) AS Product, ROUND(Weight, -1) AS ApproxWeight
FROM SalesLT.Product

/*====================================================================================
2. Retrieve the year and month in which products were first sold 
======================================================================================*/

SELECT CONCAT(ProductID, ' ', Name ) AS Product, ROUND(Weight, -1) AS ApproxWeight,
		YEAR(SellStartDate) AS SellStartYear, DATENAME(mm,SellStartDate) AS SellStartMonth
FROM SalesLT.Product

/*====================================================================================
3. Extract product types from product numbers 
======================================================================================*/

SELECT CONCAT(ProductID, ' ', Name ) AS Product, ROUND(Weight, -1) AS ApproxWeight,
		YEAR(SellStartDate) AS SellStartYear, DATENAME(mm,SellStartDate) AS SellStartMonth,
		LEFT(ProductNumber, 2) AS ProductType
FROM SalesLT.Product

/*====================================================================================
4. Retrieve only products with a numeric size 
======================================================================================*/

SELECT CONCAT(ProductID, ' ', Name) AS Product, ROUND(Weight, -1) AS ApproxWeight,
		YEAR(SellStartDate) AS SellStartYear, DATENAME(mm,SellStartDate) AS SellStartMonth,
		LEFT(ProductNumber, 2) AS ProductType, Size
FROM SalesLT.Product
WHERE ISNUMERIC(Size) = 1

/*====================================================================================
5. Retrieve companies ranked by sales totals 
======================================================================================*/

SELECT CompanyName, RANK() OVER(ORDER BY TotalDue DESC)
FROM SalesLT.Customer c
JOIN SalesLT.SalesOrderHeader soh
ON c.CustomerID = soh.CustomerID
