-- Model: customers
-- Description: Contains summary information about customers and their orders.
-- Date Last Modified: 7/28
-- Last Modified by: Dori
-- Notes: 



with customers as (

    select 
        customer_id,
        first_name,
        last_name
    from {{ ref('stg_customers') }}

),

orders as (

    select 
        order_id,
        customer_id,
        order_date,
        status
    from {{ ref('stg_orders') }}

),

payments as (

    select 
        order_id,
        amount,
        payment_method
    from {{ ref('stg_payments') }}

),

customer_orders as (

        select
        customer_id,

        min(order_date) as first_order,
        max(order_date) as most_recent_order,
        count(order_id) as number_of_orders
    from orders

    group by customer_id

),

customer_payments as (

    select
        orders.customer_id,
        sum(amount) as total_amount

    from payments

    left join orders on
         payments.order_id = orders.order_id

    group by orders.customer_id

),

final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order,
        customer_orders.most_recent_order,
        customer_orders.number_of_orders,
        customer_payments.total_amount as customer_lifetime_value

    from customers

    left join customer_orders
        on customers.customer_id = customer_orders.customer_id

    left join customer_payments
        on  customers.customer_id = customer_payments.customer_id

)

select 
    customer_id,
    first_name,
    last_name,
    first_order,
    most_recent_order,
    number_of_orders,
    customer_lifetime_value
from final
