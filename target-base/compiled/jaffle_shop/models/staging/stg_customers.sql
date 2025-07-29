with source as (
    select * from "jaffle_shop"."prod"."raw_customers"

)


    select
        id as customer_id,
        first_name,
        last_name

    from source