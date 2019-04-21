/*==================================================================================
1.  Retrieve customer details 
		Familiarize yourself with the Customer table by writing a Transact-SQL query 
		that retrieves all columns for all customers
====================================================================================*/

SELECT *
FROM SalesLT.Customer

/*==================================================================================
2.  Retrieve customer name data 
====================================================================================*/

SELECT Title, FirstName, MiddleName, LastName, Suffix
FROM SalesLT.Customer

/*==================================================================================
3.  Retrieve customer names and phone numbers 
====================================================================================*/

SELECT SalesPerson, Title + ' ' + LastName AS [Customer Name], Phone
FROM SalesLT.Customer

/*==================================================================================
4.	Retrieve a list of customer companies 
====================================================================================*/

SELECT (TRY_CAST(CustomerID AS VARCHAR)) + ' : ' + CompanyName AS [Customer Companies]
FROM SalesLT.Customer

/*==================================================================================
5.	Retrieve a list of sales order revisions 
====================================================================================*/

SELECT CAST(SalesOrderID AS VARCHAR) + ' (' + CAST(RevisionNumber AS VARCHAR) + ')' 
	   AS [Order/Revision], CONVERT(VARCHAR(30),OrderDate,102) AS OrderDate
FROM SalesLT.SalesOrderHeader

/*==================================================================================
6.  Retrieve customer contact names with middle names if known 
====================================================================================*/

SELECT FirstName + ISNULL(' ' + MiddleName,'') + ' ' + LastName AS [Customer Fullname]
FROM SalesLT.Customer

/*===================================================================================
7.  Retrieve primary contact details 
=====================================================================================*/

Select CustomerID, FirstName + ISNULL(' ' + MiddleName,'') + ' ' + LastName AS Customer, 
	   COALESCE(EmailAddress, Phone) AS Contact
FROM SalesLT.Customer

/*====================================================================================
3.  Retrieve shipping status
======================================================================================*/

SELECT SalesOrderID, OrderDate, 
	CASE
		WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
		ELSE 'Shipped'
	END AS [Shipping Status] 
FROM SalesLT.SalesOrderHeader

