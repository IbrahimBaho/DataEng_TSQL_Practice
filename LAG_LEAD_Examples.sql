USE AdventureWorks2016
GO
SELECT s.SalesOrderID,s.SalesOrderDetailID,s.OrderQty,
LEAD(SalesOrderDetailID) OVER (ORDER BY SalesOrderDetailID
) LeadValue,
LAG(SalesOrderDetailID) OVER (ORDER BY SalesOrderDetailID
) LagValue
FROM Sales.SalesOrderDetail s
WHERE SalesOrderID IN (43670, 43669, 43667, 43663)
ORDER BY s.SalesOrderID,s.SalesOrderDetailID,s.OrderQty
GO

--SQL Server 2012 introduces new analytical function LEAD() and LAG(). These functions accesses data from a subsequent row (for lead) 
--and previous row (for lag) in the same result set without the use of a self-join 


--LEAD and LAG function accesses the row with offset of 2
SELECT s.SalesOrderID,s.SalesOrderDetailID,s.OrderQty,
LEAD(SalesOrderDetailID,2) OVER (ORDER BY SalesOrderDetailID
) LeadValue,
LAG(SalesOrderDetailID,2) OVER (ORDER BY SalesOrderDetailID
) LagValue
FROM Sales.SalesOrderDetail s
WHERE SalesOrderID IN (43670, 43669, 43667, 43663)
ORDER BY s.SalesOrderID,s.SalesOrderDetailID,s.OrderQty
GO

--You can see the LEAD and LAG functions  now have interval of  rows when they are returning results.
-- As there is interval of two rows the first two rows in LEAD function and last two rows in LAG function will return NULL value. 
--You can easily replace this NULL Value with any other default value by passing third parameter in LEAD and LAG function.

SELECT s.SalesOrderID,s.SalesOrderDetailID,s.OrderQty,
LEAD(SalesOrderDetailID,2,0) OVER (ORDER BY SalesOrderDetailID
) LeadValue,
LAG(SalesOrderDetailID,2,0) OVER (ORDER BY SalesOrderDetailID
) LagValue
FROM Sales.SalesOrderDetail s
WHERE SalesOrderID IN (43670, 43669, 43667, 43663)
ORDER BY s.SalesOrderID,s.SalesOrderDetailID,s.OrderQty
GO

--use of PARTITION BY in this clause.

SELECT s.SalesOrderID,s.SalesOrderDetailID,s.OrderQty,
LEAD(SalesOrderDetailID) OVER (PARTITION BY SalesOrderID
ORDER BY SalesOrderDetailID
) LeadValue,
LAG(SalesOrderDetailID) OVER (PARTITION BY SalesOrderID
ORDER BY SalesOrderDetailID
) LagValue
FROM Sales.SalesOrderDetail s
WHERE SalesOrderID IN (43670, 43669, 43667, 43663)
ORDER BY s.SalesOrderID,s.SalesOrderDetailID,s.OrderQty
GO
