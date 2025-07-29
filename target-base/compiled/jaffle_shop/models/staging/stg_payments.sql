with source as (
<<<<<<< HEAD
    select * from "jaffle_shop"."prod"."raw_payments"

),

renamed as (
=======
    select * from "jaffle_shop"."main"."raw_payments"

)
>>>>>>> main

    select
        id as payment_id,
        order_id,
        payment_method,

        -- `amount` is currently stored in cents, so we convert it to dollars
        amount / 100 as amount

<<<<<<< HEAD
    from source

)

select * from renamed
=======
    from source
>>>>>>> main
