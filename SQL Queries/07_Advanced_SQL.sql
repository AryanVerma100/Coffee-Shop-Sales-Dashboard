/*========================================
COFFEE SHOP SALES ANALYSIS
ADVANCED SQL
========================================*/

-- -------------------------------------------------
-- CATEGORIZE EACH TRANSACTION USING CASE STATEMENTS
-- -------------------------------------------------
SELECT
    transaction_id,
    ROUND(transaction_qty * unit_price, 2) AS Order_Value,
    CASE
        WHEN transaction_qty * unit_price < 5 THEN 'Low'
        WHEN transaction_qty * unit_price BETWEEN 5 AND 10 THEN 'Medium'
        ELSE 'High'
    END AS Sales_Category
FROM coffee_shop_sales;


-- -------------------------------------
-- RANK PRODUCTS BY REVENUE USING RANK()
-- -------------------------------------
SELECT
    product_detail,
    ROUND(SUM(transaction_qty * unit_price),2) AS Revenue,
    RANK() OVER(
        ORDER BY SUM(transaction_qty * unit_price) DESC
    ) AS Product_Rank
FROM coffee_shop_sales
GROUP BY product_detail;


-- -------------------------------------------
-- RANK PRODUCTS BY REVENUE USING DENSE_RANK()
-- -------------------------------------------
SELECT
    product_detail,
    ROUND(SUM(transaction_qty * unit_price),2) AS Revenue,
    DENSE_RANK() OVER(
        ORDER BY SUM(transaction_qty * unit_price) DESC
    ) AS Product_Rank
FROM coffee_shop_sales
GROUP BY product_detail;


-- ---------------------------------------
-- RETRIEVE THE TOP 5 PRODUCTS USING A CTE
-- ---------------------------------------
WITH ProductRevenue AS
(
    SELECT
        product_detail,
        ROUND(SUM(transaction_qty * unit_price),2) AS Revenue
    FROM coffee_shop_sales
    GROUP BY product_detail
)

SELECT *
FROM ProductRevenue
ORDER BY Revenue DESC
LIMIT 5;


-- ------------------------------------
-- CREATE A REUSABLE MONTHLY SALES VIEW
-- ------------------------------------
CREATE VIEW Monthly_Sales AS

SELECT
    MONTHNAME(transaction_date) AS Month,
    ROUND(SUM(transaction_qty * unit_price),2) AS Revenue
FROM coffee_shop_sales
GROUP BY
    MONTH(transaction_date),
    MONTHNAME(transaction_date);
    
    -- OPEN MONTHLY SALES VIEW
    SELECT * 
    FROM Monthly_Sales;
    
    
--     -----------------------------------------------------
--     CALCULATE MONTH-OVER-MONTH REVENUE GROWTH USING LAG()
--     -----------------------------------------------------
WITH MonthlyRevenue AS (
    SELECT
        MONTH(transaction_date) AS Month_No,
        MONTHNAME(transaction_date) AS Month_Name,
        ROUND(SUM(transaction_qty * unit_price),2) AS Revenue
    FROM coffee_shop_sales
    GROUP BY
        MONTH(transaction_date),
        MONTHNAME(transaction_date)
)

SELECT
    Month_Name,
    Revenue,
    LAG(Revenue) OVER (ORDER BY Month_No) AS Previous_Month_Revenue,
    ROUND(
        Revenue - LAG(Revenue) OVER (ORDER BY Month_No),
        2
    ) AS Revenue_Change
FROM MonthlyRevenue;