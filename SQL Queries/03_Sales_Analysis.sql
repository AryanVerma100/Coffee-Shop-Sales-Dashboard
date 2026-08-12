/*========================================
COFFEE SHOP SALES ANALYSIS
SALES ANALYSIS
========================================*/

-- -------------------------------------------
-- MONTHLY REVENUE, ORDERS, AND QUANTITY SOLD
-- -------------------------------------------
SELECT 
	MONTH(transaction_date) AS Month_no,
    MONTHNAME(transaction_date) AS Month_Name,
    ROUND(SUM(transaction_qty*unit_price), 2) AS Total_Revenue,
    COUNT(DISTINCT transaction_id) AS Total_Orders,
    SUM(transaction_qty) AS Total_Qty_Sold
FROM coffee_shop_sales
GROUP BY MONTH(transaction_date),
		 MONTHNAME(transaction_date)
ORDER BY Month_no;


-- ------------------------------------------
-- DAILY REVENUE, ORDERS, AND QUANTITY SOLD 
-- ------------------------------------------
SELECT
	DAY(transaction_date) AS Day_no,
    DAYNAME(transaction_date) AS Day_Name,
    ROUND(SUM(transaction_qty*unit_price), 2) AS Total_Revenue,
    COUNT(DISTINCT transaction_id) AS Total_Orders,
    SUM(transaction_qty) AS Total_Qty_Sold
FROM coffee_shop_sales
GROUP BY DAY(transaction_date),
		 DAYNAME(transaction_date)
ORDER BY Day_no;


-- ------------------------------------------
-- HOURLY REVENUE, ORDERS, AND QUANTITY SOLD 
-- ------------------------------------------
SELECT
	HOUR(transaction_time) AS Hour_no,
    ROUND(SUM(transaction_qty*unit_price), 2) AS Total_Revenue,
    COUNT(DISTINCT transaction_id) AS Total_Orders,
    SUM(transaction_qty) AS Total_Qty_Sold
FROM coffee_shop_sales
GROUP BY HOUR(transaction_time)
ORDER BY Hour_no;


-- ----------------------------------------------
-- REVENUE, ORDERS, AND QUANTITY SOLD IN WEEKDAYS
-- ----------------------------------------------
SELECT
    DAYNAME(transaction_date) AS Day_Name,
    ROUND(SUM(transaction_qty*unit_price), 2) AS Total_Revenue,
    COUNT(DISTINCT transaction_id) AS Total_Orders,
    SUM(transaction_qty) AS Total_Qty_Sold
FROM coffee_shop_sales
WHERE DAYNAME(transaction_date) NOT IN ('Saturday', 'Sunday')
GROUP BY DAYOFWEEK(transaction_date),
         DAYNAME(transaction_date)
ORDER BY DAYOFWEEK(transaction_date);


-- ------------------------------------------------------
-- WEEKDAYS VS WEEKEND REVENUE, ORDERS, AND QUANTITY SOLD
-- ------------------------------------------------------
SELECT 
	'Weekdays' AS Days,
    ROUND(SUM(transaction_qty*unit_price), 2) AS Total_Revenue,
    COUNT(DISTINCT transaction_id) AS Total_Orders,
    SUM(transaction_qty) AS Total_Qty_Sold
FROM coffee_shop_sales
WHERE WEEKDAY(transaction_date) < 5
UNION 
SELECT
	'Weekend' AS Days,
	ROUND(SUM(transaction_qty*unit_price), 2) AS Total_Revenue,
    COUNT(DISTINCT transaction_id) AS Total_Orders,
    SUM(transaction_qty) AS Total_Qty_Sold
FROM coffee_shop_sales
WHERE WEEKDAY(transaction_date) >= 5;


-- ------------------------------------------
-- REVENUE, ORDERS, AND QUANTITY SOLD BY DATE
-- ------------------------------------------
SELECT
	transaction_date AS Date,
    ROUND(SUM(transaction_qty*unit_price), 2) AS Total_Revenue,
    COUNT(DISTINCT transaction_id) AS Total_Orders,
    SUM(transaction_qty) AS Total_Qty_Sold
FROM coffee_shop_sales
GROUP BY transaction_date
ORDER BY transaction_date;


