-- Model: orders
-- Description: Contains denomarlized information about orders and payments.
-- Date Last Modified: 7/28
-- Last Modified by: Dori
-- Notes: 

-- this creates a variable that can be used in the query to run "for" loops in sql 
-- personally i think this is overkill for this simple example, but it's the default in jaffle_shop
{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}

with orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

),

order_payments as (

    select
        order_id,
        -- this is a list comprehension, it will iterate over the payment_methods list and create a new column for each payment method
        -- you could also do this with a case statement, but this is more flexible if you add payment methods in the future
        {% for payment_method in payment_methods -%}
        sum(case when payment_method = '{{ payment_method }}' then amount else 0 end) as {{ payment_method }}_amount,
        {% endfor -%}

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
        {% for payment_method in payment_methods -%}

        order_payments.{{ payment_method }}_amount,

        {% endfor -%}

        order_payments.total_amount as amount

    from orders


    left join order_payments
        on orders.order_id = order_payments.order_id

)

select * from final
