-- ============================================
-- Superstore Data Analysis - Athena SQL Queries
-- Database: sales_db
-- Table: ayush_superstore_data_2026
-- Author: Ayush
-- Date: 28-06-2026
-- ============================================


-- Query 01: Total Sales and Profit by Region
-- Result: query_01_sales_by_region.csv
SELECT region,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit
FROM ayush_superstore_data_2026
GROUP BY region
ORDER BY total_sales DESC;


-- Query 02: Top 10 Most Profitable Cities
-- Result: query_02_top_profitable_cities.csv
SELECT city, state,
       ROUND(SUM(profit), 2) AS total_profit
FROM ayush_superstore_data_2026
GROUP BY city, state
ORDER BY total_profit DESC
LIMIT 10;


-- Query 03: Top 10 States with Highest Loss
-- Result: query_03_top_loss_states.csv
SELECT state,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_loss,
       COUNT(*) AS total_orders
FROM ayush_superstore_data_2026
WHERE profit < 0
GROUP BY state
ORDER BY total_loss ASC
LIMIT 10;


-- Query 04: Impact of Discount on Profit
-- Result: query_04_discount_impact_on_profit.csv
SELECT 
    CASE 
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.2 THEN 'Low (0-20%)'
        WHEN discount <= 0.4 THEN 'Medium (20-40%)'
        ELSE 'High (40%+)'
    END AS discount_range,
    ROUND(AVG(profit), 2) AS avg_profit,
    COUNT(*) AS total_orders
FROM ayush_superstore_data_2026
GROUP BY 
    CASE 
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.2 THEN 'Low (0-20%)'
        WHEN discount <= 0.4 THEN 'Medium (20-40%)'
        ELSE 'High (40%+)'
    END
ORDER BY avg_profit DESC;


-- Query 05: Sales by Customer Segment
-- Result: query_05_sales_by_segment.csv
SELECT segment,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit,
       COUNT(*) AS total_orders
FROM ayush_superstore_data_2026
GROUP BY segment
ORDER BY total_sales DESC;


-- Query 06: Average Sales and Profit per Order by Segment
-- Result: query_06_avg_sales_per_segment.csv
SELECT segment,
       COUNT(*) AS total_orders,
       ROUND(AVG(sales), 2) AS avg_sales_per_order,
       ROUND(AVG(profit), 2) AS avg_profit_per_order,
       ROUND(AVG(quantity), 2) AS avg_quantity_per_order
FROM ayush_superstore_data_2026
GROUP BY segment
ORDER BY avg_sales_per_order DESC;


-- Query 07: Profit Margin by Category
-- Result: query_07_profit_margin_by_category.csv
SELECT category,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit,
       ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM ayush_superstore_data_2026
GROUP BY category
ORDER BY profit_margin_pct DESC;


-- Query 08: Sales and Profit by Region and Category
-- Result: query_08_sales_by_region_category.csv
SELECT region,
       category,
       ROUND(SUM(sales), 2) AS total_sales,
       ROUND(SUM(profit), 2) AS total_profit
FROM ayush_superstore_data_2026
GROUP BY region, category
ORDER BY region, total_sales DESC;


-- Query 09: Top 5 States by Sales with Rank
-- Result: query_09_top5_states_by_sales.csv
SELECT state, total_sales,
       RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM (
    SELECT state,
           ROUND(SUM(sales), 2) AS total_sales
    FROM ayush_superstore_data_2026
    GROUP BY state
) ranked_states
LIMIT 5;


-- Query 10: Region-wise Profit Contribution %
-- Result: query_10_region_profit_contribution.csv
SELECT region,
       ROUND(SUM(profit), 2) AS total_profit,
       ROUND(SUM(profit) * 100.0 / SUM(SUM(profit)) OVER (), 2) AS profit_contribution_pct
FROM ayush_superstore_data_2026
GROUP BY region
ORDER BY profit_contribution_pct DESC;
