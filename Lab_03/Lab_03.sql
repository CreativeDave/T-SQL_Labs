/*====================================================================================
1. Retrieve customer orders
======================================================================================*/

SELECT CompanyName, SalesOrderID, TotalDue
FROM SalesLT.Customer c
JOIN SalesLT.SalesOrderHeader soh
ON c.CustomerID = soh.CustomerID;

/*====================================================================================
2. Retrieve customer orders with addresses 
======================================================================================*/

SELECT CompanyName, SalesOrderID, TotalDue, AddressLine1 + ISNULL(', ' + AddressLine2, '')
		+ ', ' + City + ', ' + StateProvince + ', ' + CountryRegion + ', ' + PostalCode
		AS [Customer Address]
FROM SalesLT.Customer c
JOIN SalesLT.SalesOrderHeader soh 
ON c.CustomerID = soh.CustomerID
JOIN SalesLT.CustomerAddress ca 
ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address a 
ON ca.AddressID = a.AddressID;

/*====================================================================================
3. Retrieve a list of all customers and their orders
======================================================================================*/
SELECT DISTINCT CompanyName, FirstName + ' ' + LastName AS [Contact Name],
		SalesOrderID, TotalDue
FROM SalesLT.Customer c
LEFT JOIN SalesLT.SalesOrderHeader soh 
ON c.CustomerID = soh.CustomerID
ORDER BY TotalDue DESC, CompanyName

/*====================================================================================
4. Retrieve a list of customers with no address
======================================================================================*/

SELECT c.CustomerID, CompanyName, FirstName + ' ' + LastName AS [Contact Name], Phone
FROM SalesLT.Customer c
LEFT JOIN SalesLT.CustomerAddress ca 
ON c.CustomerID = ca.CustomerID
WHERE ca.AddressID IS NULL

/*====================================================================================
5. Retrieve a list of customers and products without orders
======================================================================================*/

SELECT c.CustomerID, p.ProductID
FROM SalesLT.Customer c
LEFT JOIN SalesLT.SalesOrderHeader soh
ON c.CustomerID = soh.CustomerID
LEFT JOIN SalesLT.SalesOrderDetail sod
ON soh.SalesOrderID = sod.SalesOrderID
FULL OUTER JOIN SalesLT.Product p
ON sod.ProductID = p.ProductID
WHERE soh.SalesOrderID IS NULL


