
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

  SELECT * FROM [PC_SALES].[dbo].[pc_data];


-- BASIC QUESTIONS

-- 1. Count the total number of sales records.

SELECT 
    COUNT (*) AS Total_number_of_sales_records
FROM [PC_SALES].[dbo].[pc_data];

-- 2. Count the number of sales per Continent.

SELECT Continent,
    COUNT (*) AS Sales_per_Continent
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY Continent
ORDER BY Sales_per_Continent DESC;

-- 3. Count the number of sales per Country or State.

SELECT Country_or_State,
    COUNT (*) AS Sales_per_Country_or_State
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY Country_or_State
ORDER BY Sales_per_Country_or_State DESC;

-- 4. List all distinct Shop Name values.

SELECT DISTINCT Shop_Name 
FROM [PC_SALES].[dbo].[pc_data];

-- 5. Find the average Sale Price.

SELECT 
    AVG(Sale_Price) AS Average_Sale_Price
FROM [PC_SALES].[dbo].[pc_data];

-- 6. Find the highest and lowest Sale Price.

SELECT 
    MAX(Sale_Price) AS Highest_Sale_Price,
    MIN(Sale_Price) AS Lowest_Sale_Price
FROM [PC_SALES].[dbo].[pc_data];

-- 7. Count the number of sales by Payment Method.

SELECT Payment_Method,
    COUNT(*) AS Sales_by_Payment_Method
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY Payment_Method
ORDER BY Sales_by_Payment_Method DESC;

-- 8. Count the number of sales by Channel (Online vs Offline).

SELECT Channel,
    COUNT(*) AS Sales_by_Channel
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY Channel
ORDER BY Sales_by_Channel DESC;

-- 9. Count the number of sales by Priority level.

SELECT Priority,
    COUNT(*) AS Sales_by_Priority_Level
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY Priority
ORDER BY Sales_by_Priority_Level DESC;

-- 10. Count the number of distinct PC Make values.

SELECT DISTINCT PC_Make,
    COUNT(*) AS Distinct_PC_Make_Values
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY PC_Make
ORDER BY Distinct_PC_Make_Values DESC;


-- INTERMEDIATE QUESTIONS

-- 11. Calculate total revenue (SUM of Sale Price).

SELECT 
    SUM(Sale_Price) AS Total_revenue
FROM [PC_SALES].[dbo].[pc_data];

-- 12. Calculate total profit (SUM of Sale Price - Cost Price).

SELECT
    SUM(Sale_Price - Cost_Price) AS Total_Profit
FROM [PC_SALES].[dbo].[pc_data];

-- 13. Find the average Discount Amount.

SELECT
    AVG(Discount_Amount) AS Average_discount_amount
FROM [PC_SALES].[dbo].[pc_data];

-- 14. Calculate total Finance Amount issued.

SELECT
    SUM(CAST(Finance_Amount AS DECIMAL(10,2))) AS Total_Finance_Issued
FROM [PC_SALES].[dbo].[pc_data];

-- 15. Find total revenue per PC Make.

SELECT PC_Make,
    SUM(CAST(Sale_Price - Discount_Amount AS bigint) * Total_Sales_per_Employee ) AS Total_revenue
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY PC_Make;

-- 16. Find average Sale Price per Storage Type.

SELECT Storage_Type,
    AVG(Sale_Price) AS Average_Sale_Price
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY Storage_Type;

-- 17. Calculate total revenue per Shop Name.

SELECT Shop_Name,
    SUM(CAST(Sale_Price - Discount_Amount AS bigint) * Total_Sales_per_Employee ) AS Total_revenue
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY Shop_Name;

-- 18. Calculate total revenue per Sales Person Name.

SELECT Sales_Person_Name,
    SUM(CAST(Sale_Price - Discount_Amount AS bigint) * Total_Sales_per_Employee ) AS Total_revenue
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY Sales_Person_Name;

-- 19. Find average Credit Score per Payment Method.

SELECT Payment_Method,
    AVG(Credit_Score) AS Average_Credit_score
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY Payment_Method;

-- 20. Calculate total Cost of Repairs per Sales Person Department.

SELECT Sales_Person_Department,
    SUM(CAST(Cost_of_Repairs AS DECIMAL (10,2))) AS Total_Cost_of_Repairs
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY Sales_Person_Department;

-- ADVANCED QUESTIONS

-- 21. Calculate profit per Shop Name.
-- 22. Calculate profit margin per sale ((Sale Price - Cost Price) / Sale Price).
-- 23. Determine which Continent has the highest total revenue.
-- 24. Calculate average Sale Price per RAM size.
-- 25. Find the PC Model with the highest Sale Price.
-- 26. Calculate the average number of days between Purchase Date and Ship Date.
-- 27. Determine which Sales Person Department generates the highest revenue.
-- 28. Calculate total revenue per Storage Capacity.
-- 29. Identify sales where Sale Price is lower than PC Market Price.
-- 30. Rank Sales Person Name by Total Sales per Employee using a window function.

