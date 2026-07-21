SELECT
    c.customer_state,

    COUNT(DISTINCT c.customer_unique_id) AS customers,

    COUNT(DISTINCT o.order_id) AS orders,

    ROUND(SUM(oi.price),2) AS gmv,

    ROUND(SUM(oi.price) / COUNT(DISTINCT o.order_id),2) AS avg_order_value,

    COUNT(DISTINCT CASE
        WHEN customer_order_count.order_count > 1
        THEN c.customer_unique_id
    END) AS repeat_customers,

    ROUND(
        COUNT(DISTINCT CASE
            WHEN customer_order_count.order_count > 1
            THEN c.customer_unique_id
        END) * 100.0 /
        COUNT(DISTINCT c.customer_unique_id),
        2
    ) AS repeat_rate,

    ROUND(AVG(r.review_score),2) AS avg_review,

    ROUND(
        AVG(
            EXTRACT(
                DAY FROM (
                    o.order_delivered_customer_date -
                    o.order_purchase_timestamp
                )
            )
        ),
        2
    ) AS avg_delivery_days

FROM customers c

JOIN orders o
ON c.customer_id = o.customer_id

JOIN order_items oi
ON o.order_id = oi.order_id

LEFT JOIN order_reviews r
ON o.order_id = r.order_id

JOIN (
    SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS order_count
    FROM customers c
    JOIN orders o
    ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
) customer_order_count
ON c.customer_unique_id = customer_order_count.customer_unique_id

GROUP BY c.customer_state

ORDER BY gmv DESC;
