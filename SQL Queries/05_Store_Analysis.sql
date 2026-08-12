/*========================================
COFFEE SHOP SALES ANALYSIS
STORE ANALYSIS
========================================*/

-- ---------------------------------------
-- REVENUE BY STORE 
-- ---------------------------------------
SELECT
	store_id AS Store_ID,
    store_location AS Store_Location,
    ROUND(SUM(transaction_id*unit_price), 2) AS Revenue
FROM coffee_shop_sales
GROUP BY store_id,
		 store_location
ORDER BY store_id;


-- ---------------------------------------
-- ORDERS BY STORE
-- ---------------------------------------
SELECT
	store_id AS Store_ID,
    store_location AS Store_Location,
    COUNT(DISTINCT transaction_id) AS Total_Orders
FROM coffee_shop_sales
GROUP BY store_id,
		 store_location
ORDER BY store_id;


-- ---------------------------------------
-- QUANTITY SOLD BY STORE
-- ---------------------------------------
SELECT
	store_id AS Store_ID,
    store_location AS Store_Location,
    SUM(transaction_qty) AS Total_Qty_Sold
FROM coffee_shop_sales
GROUP BY store_id,
		 store_location
ORDER BY store_id;


-- ---------------------------------------
-- STORE RANKING BY REVENUE
-- ---------------------------------------
SELECT
	store_id AS Store_ID,
    store_location AS Store_Location,
    ROUND(SUM(transaction_qty*unit_price), 2) AS Revenue,
    DENSE_RANK() OVER(
		ORDER BY ROUND(SUM(transaction_qty*unit_price), 2) DESC
        ) AS Store_Rank
FROM coffee_shop_sales
GROUP BY store_id,
		 store_location;
         

-- ---------------------------------------
-- STORE CONTRIBUTION BY REVENUE
-- ---------------------------------------
SELECT
	store_id AS Store_ID,
    store_location AS Store_Location,
    ROUND(SUM(transaction_qty*unit_price), 2) AS Revenue,
    CONCAT(ROUND(SUM(transaction_id*unit_price)/
				(SELECT 
					SUM(transaction_id*unit_price) 
				 FROM coffee_shop_sales) * 100, 
		    2), '%') AS Contribution_Percentage
FROM coffee_shop_sales
GROUP BY store_id,
		 store_location
ORDER BY Contribution_Percentage DESC;