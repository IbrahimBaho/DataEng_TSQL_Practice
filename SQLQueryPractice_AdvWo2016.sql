USE [AdventureWorks2016]
GO

SELECT [BusinessEntityID]
      ,[PersonType]
      ,[NameStyle]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
      ,[EmailPromotion]
  FROM [Person].[Person]
GO

DROP TABLE [PERSON].TAB1
DROP TABLE [PERSON].TAB2

SELECT TOP 10 * 
INTO PERSON.TAB1 
FROM PERSON.PERSON

SELECT TOP 10 * 
INTO PERSON.TAB2
FROM PERSON.PERSON
ORDER BY BusinessEntityID DESC

ALTER TABLE PERSON.TAB1
DROP COLUMN NameStyle, ADDITIONALCONTACTINFO, SUFFIX, TITLE, DEMOGRAPHICS, ROWGUID

ALTER TABLE PERSON.TAB2
DROP COLUMN NameStyle, ADDITIONALCONTACTINFO, SUFFIX, TITLE, DEMOGRAPHICS, ROWGUID

--DELETE ROWS IF MIDNAME IS NULL 
DELETE FROM PERSON.TAB1
WHERE MIDDLENAME IS NULL

DELETE FROM PERSON.TAB2
WHERE MIDDLENAME IS NULL

SELECT * FROM [PERSON].TAB1
SELECT * FROM [PERSON].TAB2

SELECT *
FROM PERSON.TAB1
UNION ALL
SELECT *
FROM PERSON.TAB2

select * from sales.SalesOrderHeader

--  Define the CTE expression name and column list.  
WITH Sales_CTE (SalesPersonID, SalesOrderID, SalesYear)  
AS  
 --Define the CTE query.  
(     SELECT SalesPersonID, SalesOrderID, YEAR(OrderDate) AS SalesYear  
      FROM Sales.SalesOrderHeader  
    WHERE SalesPersonID IS NOT NULL  )  
-- Define the outer query referencing the CTE name.  
SELECT SalesPersonID, COUNT(SalesOrderID) AS TotalSales, SalesYear  
FROM Sales_CTE  
GROUP BY SalesYear, SalesPersonID  
ORDER BY SalesPersonID, SalesYear;