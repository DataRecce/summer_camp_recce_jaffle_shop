with source as (
<<<<<<< HEAD
    select * from "jaffle_shop"."prod"."raw_orders"
=======
    select * from "jaffle_shop"."main"."raw_orders"
>>>>>>> main

),

renamed as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from source

)

select * from renamed