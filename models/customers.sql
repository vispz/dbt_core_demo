{{ config(materialized="table")}}

WITH customers AS (

    select * from {{ ref("stg_customers") }}

),

orders AS (

    select * from {{ ref("stg_orders") }}
),

customer_orders AS (
    SELECT
        C.customer_id,
        min(O.order_date) AS first_order_date,
        max(O.order_date) AS most_recent_order_date,
        count(O.order_id) AS number_of_orders
    FROM customers AS C
    INNER JOIN orders O USING(customer_id)
    GROUP BY 1
    ORDER BY 1
)

select * from customer_orders