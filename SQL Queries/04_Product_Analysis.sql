/*========================================
COFFEE SHOP SALES ANALYSIS
PRODUCT ANALYSIS
========================================*/

-- ---------------------------------------
-- REVENUE BY PRODUCT
-- ---------------------------------------
SELECT 
	product_id AS Product_ID,
    product_type AS Product_Name,
    ROUND(SUM(transaction_qty*unit_price), 2) AS Revenue
FROM coffee_shop_sales
GROUP BY product_id, 
		 product_type
ORDER BY product_id;


-- ---------------------------------------
-- REVENUE BY CATEGORY
-- ---------------------------------------
SELECT
	product_category AS Product_Category,
    ROUND(SUM(transaction_qty*unit_price), 2) AS Total_Revenue
FROM coffee_shop_sales
GROUP BY product_category
ORDER BY product_category;


-- --------------------------------------
-- TOP 10 PRODUCTS
-- --------------------------------------
SELECT
	product_type AS Product_Name,
    ROUND(SUM(transaction_qty*unit_price), 2) AS Revenue
FROM coffee_shop_sales
GROUP BY product_type 
ORDER BY ROUND(SUM(transaction_qty*unit_price), 2) DESC
LIMIT 10;


-- ---------------------------------------
-- BOTTOM 10 PRODUCTS
-- ---------------------------------------
SELECT
	product_type AS Product_Name,
    ROUND(SUM(transaction_qty*unit_price), 2) AS Revenue
FROM coffee_shop_sales
GROUP BY product_type 
ORDER BY ROUND(SUM(transaction_qty*unit_price), 2) ASC
LIMIT 10;
    
    
-- ---------------------------------------
-- PRODUCT RANKING BY REVENUE
-- ---------------------------------------
SELECT
    product_detail AS Product_Rank,
    ROUND(SUM(transaction_qty*unit_price),2) AS Revenue,
    DENSE_RANK() OVER(
        ORDER BY SUM(transaction_qty*unit_price) DESC
    ) AS Product_Rank
FROM coffee_shop_sales
GROUP BY product_detail;


-- ----------------------------------------
-- PRODUCT CATEGORY CONTRIBUTION IN REVENUE
-- ----------------------------------------
SELECT
    product_category AS Product_Category,
    ROUND(SUM(transaction_qty * unit_price),2) AS Revenue,
    CONCAT(ROUND(
        SUM(transaction_qty * unit_price) /
        (
            SELECT SUM(transaction_qty * unit_price)
            FROM coffee_shop_sales
        ) * 100,
        2
    ), '%')  AS Revenue_Percentage
FROM coffee_shop_sales
GROUP BY product_category
ORDER BY Revenue DESC;