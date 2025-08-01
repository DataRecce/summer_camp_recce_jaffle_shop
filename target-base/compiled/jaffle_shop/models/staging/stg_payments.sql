with source as (
    select * from "jaffle_shop"."prod"."raw_payments"

)

    select
        id as payment_id,
        order_id,
        payment_method,

        -- `amount` is currently stored in cents, so we convert it to dollars
        amount / 100 as amount

    from source