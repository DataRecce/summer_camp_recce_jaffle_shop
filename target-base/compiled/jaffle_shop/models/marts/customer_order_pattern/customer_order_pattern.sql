-- Model: customers_order_pattern
-- Description: Analyzes order patterns for customers.
-- Date Last Modified: 7/28
-- Last Modified by: Dori
-- Notes: 

with customers as (

    select 
        customer_id,
        first_order,
        most_recent_order,
        number_of_orders
    from "jaffle_shop"."prod"."customers"

)

select
    customer_id,
    first_order,
    most_recent_order,
    number_of_orders,
    DATEDIFF('day', first_order, most_recent_order) AS days_active,
    DATEDIFF('day', first_order, most_recent_order) / NULLIF(number_of_orders - 1, 0) AS avg_days_between_orders
from customers