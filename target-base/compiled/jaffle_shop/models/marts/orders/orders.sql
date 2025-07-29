-- Model: orders
-- Description: Contains denomarlized information about orders and payments.
-- Date Last Modified: 7/28
-- Last Modified by: Dori
-- Notes: 

-- this creates a variable that can be used in the query to run "for" loops in sql 
-- personally i think this is overkill for this simple example, but it's the default in jaffle_shop


with orders as (

    select 
        order_id,
        customer_id,
        order_date,
        status
    from "jaffle_shop"."prod"."stg_orders"

),

payments as (

    select 
        order_id,
        amount,
        payment_method
    from "jaffle_shop"."prod"."stg_payments"

),

order_payments as (

    select
        order_id,
        -- this is a list comprehension, it will iterate over the payment_methods list and create a new column for each payment method
        -- you could also do this with a case statement, but this is more flexible if you add payment methods in the future
        sum(case when payment_method = 'credit_card' then amount else 0 end) as credit_card_amount,
        sum(case when payment_method = 'coupon' then amount else 0 end) as coupon_amount,
        sum(case when payment_method = 'bank_transfer' then amount else 0 end) as bank_transfer_amount,
        sum(case when payment_method = 'gift_card' then amount else 0 end) as gift_card_amount,
        sum(amount) as total_amount

    from payments

    group by order_id

),

final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        orders.status,
        -- this is a list comprehension, it will iterate over the payment_methods list and create a new column for each payment method
        -- you could also do this with a case statement, but this is more flexible if you add payment methods in the future
        order_payments.credit_card_amount,

        order_payments.coupon_amount,

        order_payments.bank_transfer_amount,

        order_payments.gift_card_amount,

        order_payments.total_amount as amount

    from orders


    left join order_payments
        on orders.order_id = order_payments.order_id

)

select 
    order_id,
    customer_id,
    order_date,
    status,
    credit_card_amount,
    coupon_amount,
    bank_transfer_amount,
    gift_card_amount,
    amount
from final