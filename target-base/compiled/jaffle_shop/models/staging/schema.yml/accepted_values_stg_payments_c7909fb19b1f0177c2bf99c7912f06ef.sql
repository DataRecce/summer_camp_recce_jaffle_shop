
    
    

with all_values as (

    select
        payment_method as value_field,
        count(*) as n_records

<<<<<<< HEAD
    from "jaffle_shop"."prod"."stg_payments"
=======
    from "jaffle_shop"."main"."stg_payments"
>>>>>>> main
    group by payment_method

)

select *
from all_values
where value_field not in (
    'credit_card','coupon','bank_transfer','gift_card'
)


