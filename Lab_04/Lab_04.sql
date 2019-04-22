/*====================================================================================
1. Retrieve billing addresses 
======================================================================================*/

SELECT CompanyName, AddressLine1, City,	'Billing' AS AddressType 
FROM SalesLT.Customer c
JOIN SalesLT.CustomerAddress ca
ON c.CustomerID = ca.customerID
JOIN SalesLT.Address a 
ON a.AddressID = ca.AddressID
WHERE ca.AddressType = 'Main Office' 

/*====================================================================================
2. Retrieve shipping addresses 
======================================================================================*/

SELECT CompanyName, AddressLine1, City,	AddressType 
FROM SalesLT.Customer c
JOIN SalesLT.CustomerAddress ca
ON c.CustomerID = ca.customerID
JOIN SalesLT.Address a 
ON a.AddressID = ca.AddressID
WHERE ca.AddressType = 'Shipping'

/*====================================================================================
3. Combine billing and shipping addresse
======================================================================================*/

SELECT CompanyName, AddressLine1, City,	'Billing' AS AddressType 
FROM SalesLT.Customer c
JOIN SalesLT.CustomerAddress ca
ON c.CustomerID = ca.customerID
JOIN SalesLT.Address a 
ON a.AddressID = ca.AddressID
WHERE ca.AddressType = 'Main Office'
UNION
SELECT CompanyName, AddressLine1, City,	AddressType 
FROM SalesLT.Customer c
JOIN SalesLT.CustomerAddress ca
ON c.CustomerID = ca.customerID
JOIN SalesLT.Address a 
ON a.AddressID = ca.AddressID
WHERE ca.AddressType = 'Shipping'

/*====================================================================================
4. Retrieve customers with only a main office address 
======================================================================================*/

SELECT CompanyName, AddressLine1, City,	'Billing' AS AddressType 
FROM SalesLT.Customer c
JOIN SalesLT.CustomerAddress ca
ON c.CustomerID = ca.customerID
JOIN SalesLT.Address a 
ON a.AddressID = ca.AddressID
WHERE ca.AddressType = 'Main Office'
EXCEPT
SELECT CompanyName, AddressLine1, City,	AddressType 
FROM SalesLT.Customer c
JOIN SalesLT.CustomerAddress ca
ON c.CustomerID = ca.customerID
JOIN SalesLT.Address a 
ON a.AddressID = ca.AddressID
WHERE ca.AddressType = 'Shipping'

/*====================================================================================
2. Retrieve shipping addresses 
======================================================================================*/

SELECT CompanyName, AddressLine1, City,	'Billing' AS AddressType 
FROM SalesLT.Customer c
JOIN SalesLT.CustomerAddress ca
ON c.CustomerID = ca.customerID
JOIN SalesLT.Address a 
ON a.AddressID = ca.AddressID
WHERE ca.AddressType = 'Main Office'
INTERSECT
SELECT CompanyName, AddressLine1, City,	AddressType 
FROM SalesLT.Customer c
JOIN SalesLT.CustomerAddress ca
ON c.CustomerID = ca.customerID
JOIN SalesLT.Address a 
ON a.AddressID = ca.AddressID
WHERE ca.AddressType = 'Shipping'