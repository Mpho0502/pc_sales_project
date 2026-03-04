
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
ORDER BY Sales_per_Continent;

-- 3. Count the number of sales per Country or State.

SELECT Country_or_State,
COUNT (*) AS Sales_per_Country_or_State
FROM [PC_SALES].[dbo].[pc_data]
GROUP BY Country_or_State
ORDER BY Sales_per_Country_or_State;

-- 4. List all distinct Shop Name values.

SELECT DISTINCT Shop_Name 
FROM [PC_SALES].[dbo].[pc_data];

-- 5. Find the average Sale Price.



-- 6. Find the highest and lowest Sale Price.
-- 7. Count the number of sales by Payment Method.
-- 8. Count the number of sales by Channel (Online vs Offline).
-- 9. Count the number of sales by Priority level.
-- 10. Count the number of distinct PC Make values.

-- INTERMEDIATE QUESTIONS

-- 11. Calculate total revenue (SUM of Sale Price).
-- 12. Calculate total profit (SUM of Sale Price - Cost Price).
-- 13. Find the average Discount Amount.
-- 14. Calculate total Finance Amount issued.
-- 15. Find total revenue per PC Make.
-- 16. Find average Sale Price per Storage Type.
-- 17. Calculate total revenue per Shop Name.
-- 18. Calculate total revenue per Sales Person Name.
-- 19. Find average Credit Score per Payment Method.
-- 20. Calculate total Cost of Repairs per Sales Person Department.

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

