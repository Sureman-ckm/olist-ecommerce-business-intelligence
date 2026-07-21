WITH seller_gmv AS (

    SELECT
        oi.seller_id,
        ROUND(SUM(oi.price),2) AS gmv

    FROM order_items oi

    GROUP BY oi.seller_id

),

ranked AS (

    SELECT
        seller_id,
        gmv,

        DENSE_RANK() OVER (
            ORDER BY gmv DESC
        ) AS seller_rank,

        SUM(gmv) OVER (
            ORDER BY gmv DESC
        ) AS cumulative_gmv,

        SUM(gmv) OVER () AS total_gmv

    FROM seller_gmv

)

SELECT

    seller_rank,

    seller_id,

    gmv,

    cumulative_gmv,

    ROUND(
        cumulative_gmv * 100.0 / total_gmv,
        2
    ) AS cumulative_share

FROM ranked

ORDER BY seller_rank;
