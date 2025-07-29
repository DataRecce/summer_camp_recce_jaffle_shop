
    
    

with all_values as (

    select
        status as value_field,
        count(*) as n_records

<<<<<<< HEAD
    from "jaffle_shop"."prod"."stg_orders"
=======
    from "jaffle_shop"."main"."stg_orders"
>>>>>>> main
    group by status

)

select *
from all_values
where value_field not in (
    'placed','shipped','completed','return_pending','returned'
)


