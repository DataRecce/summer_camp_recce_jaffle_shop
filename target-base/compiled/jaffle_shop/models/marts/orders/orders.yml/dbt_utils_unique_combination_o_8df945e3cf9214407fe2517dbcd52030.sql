





with validation_errors as (

    select
        order_id, customer_id
<<<<<<< HEAD
    from "jaffle_shop"."prod"."orders"
=======
    from "jaffle_shop"."main"."orders"
>>>>>>> main
    group by order_id, customer_id
    having count(*) > 1

)

select *
from validation_errors


