-- finance_campaigns_day.sql

SELECT
    DATE(c.date_date) AS date_date,
    operational_margin - ads_cost AS ads_margin,
    ROUND(average_basket,2) AS average_basket,
    operational_margin,
    ads_cost,
    ads_impression,
    ads_clicks,
    quantity,
    revenue,
    purchase_cost,
    margin,
    shipping_fee,
    log_cost,
    ship_cost
FROM {{ ref("int_campaigns_day") }} c
FULL OUTER JOIN {{ ref("finance_days") }} f
    ON DATE(c.date_date) = DATE(f.date_date)
ORDER BY date_date DESC
