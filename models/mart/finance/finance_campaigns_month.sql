 -- finance_campaigns_month.sql
SELECT
    date_trunc(c.date_date, MONTH) AS datemonth,
    SUM(operational_margin - ads_cost) AS ads_margin,
    SUM(average_basket) AS average_basket,
    SUM(operational_margin) AS operational_margin,
    SUM(ads_cost) AS ads_cost,
    SUM(ads_impression) AS ads_impression,
    SUM(ads_clicks) AS ads_clicks,
    SUM(quantity) AS quantity,
    SUM(revenue) AS revenue,
    SUM(purchase_cost) AS purchase_cost,
    SUM(margin) AS margin,
    SUM(shipping_fee) AS shipping_fee,
    SUM(log_cost) AS log_cost,
    SUM(ship_cost) AS ship_cost
FROM `le-wagon-2204`.`dbt_laltazin`.`int_campaigns_day` AS c
FULL OUTER JOIN `le-wagon-2204`.`dbt_laltazin_finance`.`finance_days` AS f
    ON DATE(c.date_date) = DATE(f.date_date)
GROUP BY datemonth
ORDER BY datemonth DESC
