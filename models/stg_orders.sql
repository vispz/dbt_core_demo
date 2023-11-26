SELECT
    O.id AS order_id,
    O.user_id AS customer_id,
    O.order_date,
    O.status
FROM `dbt-tutorial`.jaffle_shop.orders AS O