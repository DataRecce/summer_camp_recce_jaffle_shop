with source as (
<<<<<<< HEAD
    select * from "jaffle_shop"."prod"."raw_customers"
=======
    select * from "jaffle_shop"."main"."raw_customers"
>>>>>>> main

),

renamed as (

    select
        id as customer_id,
        first_name,
        last_name

    from source

)

select * from renamed