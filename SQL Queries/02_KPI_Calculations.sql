/*========================================
COFFEE SHOP SALES ANALYSIS
KPI CALCULATIONS
========================================*/

-- --------------------------------------
-- TOTAL REVENUE
-- --------------------------------------
SELECT ROUND(SUM(transaction_qty*unit_price), 2) AS Total_Revenue
FROM coffee_shop_sales;


-- --------------------------------------
-- TOTAL ORDERS
-- --------------------------------------
SELECT COUNT(DISTINCT transaction_id) AS Total_Orders
FROM coffee_shop_sales;


-- --------------------------------------
-- TOTAL QUANTITY SOLD
-- --------------------------------------
SELECT SUM(transaction_qty) AS Total_Qty_Sold
FROM coffee_shop_sales;


-- --------------------------------------
-- AVERAGE ORDER VALUE
-- --------------------------------------
SELECT ROUND(AVG(Order_Value),2) AS Avg_Order_Value
FROM
(
    SELECT
        transaction_id,
        SUM(transaction_qty * unit_price) AS Order_Value
    FROM coffee_shop_sales
    GROUP BY transaction_id
) AS Orders;

-- --------------------------------------
-- AVERAGE ITEMS PER ORDER
-- --------------------------------------
SELECT ROUND(AVG(items_per_order), 2) AS Avg_Items_Per_Order
FROM (
	  SELECT
		transaction_id, 
        SUM(transaction_qty) AS items_per_order
	  FROM coffee_shop_sales
	  GROUP BY transaction_id
) AS Orders;


-- --------------------------------------
-- AVERAGE SELLING PRICE
-- --------------------------------------
SELECT ROUND(AVG(unit_price), 2) AS Avg_Selling_Price
FROM coffee_shop_sales;


-- -------------------------------------
-- TOTAL PRODUCTS SOLD
-- -------------------------------------
SELECT SUM(transaction_qty) AS Total_Products_Sold
FROM coffee_shop_sales;