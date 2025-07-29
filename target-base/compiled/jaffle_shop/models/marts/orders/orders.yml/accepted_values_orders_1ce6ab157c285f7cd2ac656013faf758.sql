
    
    

with all_values as (

    select
        status as value_field,
        count(*) as n_records

<<<<<<< HEAD
    from "jaffle_shop"."prod"."orders"
=======
    from "jaffle_shop"."main"."orders"
>>>>>>> main
    group by status

)

select *
from all_values
where value_field not in (
    'placed','shipped','completed','return_pending','returned'
)


