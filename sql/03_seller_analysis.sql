SELECT
    oi.seller_id,
    s.seller_city,
    s.seller_state,

    ROUND(SUM(oi.price),2) AS gmv,

    COUNT(DISTINCT oi.order_id) AS orders,

    COUNT(DISTINCT oi.product_id) AS products,

    ROUND(AVG(oi.price),2) AS avg_order_value,

    ROUND(AVG(r.review_score),2) AS avg_review_score,

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
    ) AS avg_delivery_days,

    ROUND(
        SUM(oi.price) * 100.0 /
        SUM(SUM(oi.price)) OVER (),
        2
    ) AS gmv_share,

    DENSE_RANK() OVER (
        ORDER BY SUM(oi.price) DESC
    ) AS seller_rank

FROM order_items oi

JOIN sellers s
ON oi.seller_id = s.seller_id

JOIN orders o
ON oi.order_id = o.order_id

LEFT JOIN order_reviews r
ON oi.order_id = r.order_id

GROUP BY
    oi.seller_id,
    s.seller_city,
    s.seller_state

ORDER BY gmv DESC;
