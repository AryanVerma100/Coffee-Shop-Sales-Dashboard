# ☕ Coffee Shop Sales Analysis | SQL + Power BI

An end-to-end sales analytics project using **MySQL and Power BI** to analyze 149K+ coffee shop transactions, identify sales trends and product/store performance, and build an interactive business intelligence dashboard.

---

## 📌 Project Overview

The objective of this project was to transform raw coffee shop transaction data into meaningful business insights that can help answer questions such as:

- When are sales highest?
- Which products and categories generate the most revenue?
- Which store locations perform best?
- How do sales differ between weekdays and weekends?
- What are the peak sales hours?
- How does sales performance change month over month?
- Which products are the strongest and weakest performers?

The project combines **SQL-based data cleaning and analysis** with an interactive **Power BI dashboard** to provide both detailed analysis and high-level business insights.

---

## 📊 Dataset

The dataset contains **149,116 transaction records** across **11 columns**.

### Columns

| Column | Description |
|---|---|
| `transaction_id` | Unique transaction identifier |
| `transaction_date` | Date of the transaction |
| `transaction_time` | Time of the transaction |
| `transaction_qty` | Quantity purchased |
| `store_id` | Store identifier |
| `store_location` | Store location |
| `product_id` | Product identifier |
| `unit_price` | Price per unit |
| `product_category` | Broad product category |
| `product_type` | Product type |
| `product_detail` | Specific product description |

---

## 🛠️ Tools & Technologies

- **MySQL** – Data cleaning, transformation, KPI calculations and SQL analysis
- **Power BI** – Interactive dashboard and data visualization
- **Power Query** – Data transformation and preparation
- **DAX** – Measures and dashboard calculations
- **Excel / CSV** – Source dataset

---

## 🧹 SQL Data Cleaning

The raw dataset was loaded into MySQL and cleaned before analysis.

The cleaning process included:

- Inspecting the raw dataset
- Checking row counts
- Checking for NULL values
- Checking duplicate records
- Converting transaction dates into the correct `DATE` format
- Converting transaction times into the correct `TIME` format
- Validating the cleaned data and data types

The SQL work is organized into separate scripts for better readability and maintainability.

---

## 📁 SQL Analysis Structure

The project contains **7 SQL scripts** with approximately **45+ SQL queries**.

```text
01_Data_Cleaning.sql
02_KPI_Calculations.sql
03_Sales_Analysis.sql
04_Product_Analysis.sql
05_Store_Analysis.sql
06_Business_Insights.sql
07_Advanced_SQL.sql
