-- ======================================================
-- SQL PROJECT ANSWERS
-- Dataset: PC Sales
-- ======================================================
--Create a database

 CREATE DATABASE PC_SALES
 GO;

 --Load the table with the dataset

 SELECT [Continent]
      ,[Country_or_State]
      ,[Province_or_City]
      ,[Shop_Name]
      ,[Shop_Age]
      ,[PC_Make]
      ,[PC_Model]
      ,[Storage_Type]
      ,[Customer_Name]
      ,[Customer_Surname]
      ,[Customer_Contact_Number]
      ,[Customer_Email_Address]
      ,[Sales_Person_Name]
      ,[Sales_Person_Department]
      ,[Cost_Price]
      ,[Sale_Price]
      ,[Payment_Method]
      ,[Discount_Amount]
      ,[Purchase_Date]
      ,[Ship_Date]
      ,[Finance_Amount]
      ,[RAM]
      ,[Credit_Score]
      ,[Channel]
      ,[Priority]
      ,[Cost_of_Repairs]
      ,[Total_Sales_per_Employee]
      ,[PC_Market_Price]
      ,[Storage_Capacity]
  FROM [PC_SALES].[dbo].[pc_data];

  SELECT * FROM [PC_SALES].[dbo].[pc_data]

-- ADVANCED QUESTIONS

-- 21. Calculate profit per Shop Name.

SELECT Shop_Name,
    SUM(Sale_Price - Cost_Price - Discount_Amount) AS Total_Profit
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY Shop_Name;

-- 22. Calculate profit margin per sale ((Sale Price - Cost Price) / Sale Price).

SELECT *,
    ROUND((Sale_Price - Cost_Price - Discount_Amount/Sale_Price) * 100,2) AS Profit_Margin
FROM [PC_SALES].[dbo].[pc_data];

-- 23. Determine which Continent has the highest total revenue.

SELECT TOP 1 Continent,
    SUM(CAST(Sale_Price - Discount_Amount AS BIGINT)) AS Total_revenue
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY Continent;

-- 24. Calculate average Sale Price per RAM size.

SELECT RAM,
    AVG(Sale_Price) AS Average_Sale_Price
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY RAM;

-- 25. Find the PC Model with the highest Sale Price.

SELECT TOP 1 PC_Model,
             MAX(Sale_Price) AS Highest_sale_price
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY PC_Model;

-- 26. Calculate the average number of days between Purchase Date and Ship Date.

SELECT
    AVG(Ship_Date - Purchase_Date) AS Average_days
FROM [PC_SALES].[dbo].[pc_data]
WHERE Purchase_Date IS NOT NULL
    AND Ship_Date IS NOT NULL;

SELECT AVG(DATEDIFF(DAY, 
    Try_Cast(Purchase_Date AS datetime), 
    Try_Cast(Ship_Date AS datetime))) AS Days_between_PD_SD
FROM [PC_SALES].[dbo].[pc_data]
WHERE Purchase_Date is not Null and Ship_Date is not Null


-- 27. Determine which Sales Person Department generates the highest revenue.

SELECT Sales_Person_Department,
    SUM(CAST(Sale_Price - Discount_Amount AS BIGINT)) AS Total_revenue
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY Sales_Person_Department
ORDER BY Total_revenue ;

-- 28. Calculate total revenue per Storage Capacity.

SELECT Storage_Capacity,
    SUM(CAST(Sale_Price - Discount_Amount AS BIGINT)) AS Total_revenue
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY Storage_Capacity
ORDER BY Total_revenue DESC;

-- 29. Identify sales where Sale Price is lower than PC Market Price.

SELECT Sale_Price,
       PC_Market_Price
FROM [PC_SALES].[dbo].[pc_data]
WHERE Sale_Price < PC_Market_Price;

-- 30. Rank Sales Person Name by Total Sales per Employee using a window function.

SELECT Sales_Person_Name, Total_Sales_per_Employee,
    RANK () OVER ( Order by Total_Sales_Per_Employee Desc) Sales_Rank
FROM [PC_SALES].[dbo].[pc_data]