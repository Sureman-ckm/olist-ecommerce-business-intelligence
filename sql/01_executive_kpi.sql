-- KPI 1 Total GMV
SELECT ROUND(SUM(price),2) AS total_gmv
FROM order_items;

-- KPI 2 Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM orders;

-- KPI 3 Active Sellers
SELECT COUNT(DISTINCT seller_id) AS active_sellers
FROM sellers;

-- KPI 4 Active Customers
SELECT COUNT(DISTINCT customer_id) AS active_customers
FROM customers;

-- KPI 5 Average Order Value (AOV)
SELECT
ROUND(SUM(price)/COUNT(DISTINCT order_id),2) AS aov
FROM order_items;
