





with validation_errors as (

    select
        order_id, customer_id
    from "jaffle_shop"."main"."orders"
    group by order_id, customer_id
    having count(*) > 1

)

select *
from validation_errors


