SELECT
    o.order_status,

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
    ) AS delivery_days,

    ROUND(
        AVG(
            EXTRACT(
                DAY FROM (
                    o.order_estimated_delivery_date -
                    o.order_delivered_customer_date
                )
            )
        ),
        2
    ) AS delay_days,

    ROUND(AVG(r.review_score),2) AS avg_review_score,

    ROUND(AVG(oi.freight_value),2) AS avg_freight,

    ROUND(AVG(oi.price),2) AS avg_price,

    COUNT(DISTINCT o.order_id) AS orders

FROM orders o

JOIN order_items oi
ON o.order_id = oi.order_id

LEFT JOIN order_reviews r
ON o.order_id = r.order_id

WHERE o.order_delivered_customer_date IS NOT NULL

GROUP BY
    o.order_status

ORDER BY
    orders DESC;
