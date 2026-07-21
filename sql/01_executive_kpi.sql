SELECT COUNT(*) AS total_orders
FROM orders;

SELECT
ROUND(SUM(price),2) AS total_gmv
FROM order_items;

SELECT
ROUND(SUM(price)/COUNT(DISTINCT order_id),2) AS average_order_value
FROM order_items;

SELECT COUNT(DISTINCT seller_id)
FROM sellers;

SELECT COUNT(*)
FROM products;

SELECT
seller_id,
SUM(price) AS gmv
FROM order_items
GROUP BY seller_id
ORDER BY gmv DESC
LIMIT 10;


