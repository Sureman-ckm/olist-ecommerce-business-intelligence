SELECT

    ROUND(SUM(oi.price), 2) AS total_gmv,

    COUNT(DISTINCT o.order_id) AS total_orders,

    COUNT(DISTINCT oi.seller_id) AS active_sellers,

    COUNT(DISTINCT c.customer_unique_id) AS active_customers,

    COUNT(DISTINCT oi.product_id) AS total_products,

    ROUND(
        SUM(oi.price) / COUNT(DISTINCT o.order_id),
        2
    ) AS avg_order_value,

    ROUND(
        COUNT(*) * 1.0 / COUNT(DISTINCT o.order_id),
        2
    ) AS avg_items_per_order,

    ROUND(
        AVG(oi.freight_value),
        2
    ) AS avg_shipping_fee

FROM orders o

JOIN order_items oi
ON o.order_id = oi.order_id

JOIN customers c
ON o.customer_id = c.customer_id

WHERE o.order_status = 'delivered';
