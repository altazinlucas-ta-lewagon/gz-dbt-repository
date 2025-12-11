-- models/mart/finance/finance_campaigns_day.sql

WITH campaigns AS (
  SELECT *
  FROM {{ ref('int_campaigns_day') }}
),
finance AS (
  SELECT *
  FROM {{ ref('finance_days') }}
)

SELECT
  DATE(c.date_date) AS date_date,

  -- marge liée aux ads (finance - ads)
  (f.operational_margin - c.ads_cost) AS ads_margin,

  -- métriques finance (par jour)
  f.nb_transactions,
  f.average_basket,
  f.operational_margin,
  f.quantity,
  f.revenue,
  f.purchase_cost,
  f.margin,
  f.shipping_fee,
  f.log_cost,
  f.ship_cost,

  -- métriques campagnes (par jour)
  c.ads_cost,
  c.ads_impression,
  c.ads_clicks

FROM campaigns c
FULL OUTER JOIN finance f
  ON DATE(c.date_date) = f.date_date
ORDER BY date_date DESC
