
    
    

with child as (
    select customer_id as from_field
<<<<<<< HEAD
    from "jaffle_shop"."prod"."orders"
=======
    from "jaffle_shop"."main"."orders"
>>>>>>> main
    where customer_id is not null
),

parent as (
    select customer_id as to_field
<<<<<<< HEAD
    from "jaffle_shop"."prod"."customers"
=======
    from "jaffle_shop"."main"."customers"
>>>>>>> main
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


