/*========================================
COFFEE SHOP SALES ANALYSIS
DATA CLEANING
========================================*/

-- -----------------------------------------
-- VIEW THE RAW DATA 
-- -----------------------------------------
SELECT *
FROM coffee_shop_sales;


-- -----------------------------------------
-- CHECK ROW COUNT
-- -----------------------------------------
SELECT COUNT(*)
FROM coffee_shop_sales;


-- ------------------------------------------
-- CHECK FOR NULL VALUES
-- ------------------------------------------
SELECT *
FROM coffee_shop_sales
WHERE transaction_id IS NULL
   OR transaction_date IS NULL
   OR unit_price IS NULL;


-- ------------------------------------------
-- CHECK FOR DUPLICATE RECORDS
-- ------------------------------------------
SELECT transaction_id, COUNT(*)
FROM coffee_shop_sales
GROUP BY transaction_id 
HAVING COUNT(*) > 1;


-- ------------------------------------------
-- CONVERT DATE FORMAT
-- ------------------------------------------
-- CONVERT EXISTING TEXT VALUES INTO VALID DATES
UPDATE coffee_shop_sales
SET transaction_date = STR_TO_DATE(transaction_date, '%m/%d/%Y');

-- CHANGE THE COLUMN'S DATA TYPE
ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_date DATE;


-- -----------------------------------------
-- CONVERT TIME FORMAT 
-- -----------------------------------------
-- CONVERT EXISTING TEXT VALUES INTO VALID TIME
UPDATE coffee_shop_sales
SET transaction_time = STR_TO_DATE (transaction_time, '%H:%i:%s');

-- CHANGE THE COLUMN'S DATA TYPE
ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_time TIME;


-- -----------------------------------------
-- VERIFY CLEANED DATA 
-- -----------------------------------------
SELECT * FROM coffee_shop_sales LIMIT 10;
DESCRIBE coffee_shop_sales;
