/*========================================
COFFEE SHOP SALES ANALYSIS
BUSINESS INSIGHTS
========================================*/

-- ------------------------------------------
-- WHICH STORE GENERATED THE HIGHEST REVENUE?
-- ------------------------------------------
SELECT
	store_id AS Store_ID,
    store_location AS Store_Location,
    ROUND(SUM(transaction_id*unit_price), 2) AS Revenue
FROM coffee_shop_sales
GROUP BY store_id,
		 store_location
ORDER BY Revenue DESC
LIMIT 1;


-- ------------------------------------------
-- WHICH HOUR GENERATED THE HIGHEST REVENUE?
-- ------------------------------------------
SELECT
	HOUR(transaction_time) AS Hour,
    ROUND(SUM(transaction_id*unit_price), 2) AS Revenue
FROM coffee_shop_sales
GROUP BY HOUR(transaction_time)
ORDER BY Revenue DESC
LIMIT 1;


-- ------------------------------------------
-- WHICH WEEKDAY PERFORMS BEST BY REVENUE?
-- ------------------------------------------
SELECT
    DAYNAME(transaction_date) AS Day,
    ROUND(SUM(transaction_id*unit_price), 2) AS Revenue
FROM coffee_shop_sales
WHERE WEEKDAY(transaction_date) < 5
GROUP BY DAYNAME(transaction_date)
ORDER BY Revenue DESC
LIMIT 1;


-- ------------------------------------------
-- WHICH MONTH HAD THE HIGHEST REVENUE?
-- ------------------------------------------
SELECT
    MONTH(transaction_date) AS Month_no,
    MONTHNAME(transaction_date) AS Month,
    ROUND(SUM(transaction_id*unit_price), 2) AS Revenue
FROM coffee_shop_sales
GROUP BY MONTH(transaction_date),
		 MONTHNAME(transaction_date)
ORDER BY Revenue DESC
LIMIT 1;


-- --------------------------------------------
-- WHICH CATEGORY CONTRIBUTES THE MOST REVENUE?
-- --------------------------------------------
SELECT
    product_category AS Product_Category,
    ROUND(SUM(transaction_id*unit_price), 2) AS Revenue
FROM coffee_shop_sales
GROUP BY product_category
ORDER BY Revenue DESC
LIMIT 1;


-- ------------------------------------------------
-- WHICH PRODUCTS SHOULD BE PROMOTED BASED ON SALES 
-- ------------------------------------------------
SELECT
    product_type AS Product,
    ROUND(SUM(transaction_id*unit_price), 2) AS Revenue
FROM coffee_shop_sales
GROUP BY product_type
ORDER BY Revenue DESC
LIMIT 5;