SELECT
    COALESCE(t.product_category_name_english, p.product_category_name) AS category,
    ROUND(SUM(oi.price),2) AS gmv,
    COUNT(DISTINCT oi.order_id) AS orders,
    ROUND(AVG(oi.price),2) AS avg_price,
    ROUND(
        SUM(oi.price) * 100.0 /
        SUM(SUM(oi.price)) OVER (),
        2
    ) AS gmv_share
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
LEFT JOIN product_category_translation t
    ON p.product_category_name = t.product_category_name
GROUP BY
    COALESCE(t.product_category_name_english, p.product_category_name)
ORDER BY gmv DESC;
