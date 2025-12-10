 -- int_campaigns_day.sql

 SELECT
     DATE(date_date) AS date_date,
     SUM(ad_cost) as ads_cost,
     SUM(impression) as ads_impression,
     SUM(click) as ads_clicks
 FROM {{ ref("int_campaigns") }}
 GROUP BY DATE(date_date)
 ORDER BY date_date DESC