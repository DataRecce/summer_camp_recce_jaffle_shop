
    
    

select
    order_id as unique_field,
    count(*) as n_records

<<<<<<< HEAD
from "jaffle_shop"."prod"."orders"
=======
from "jaffle_shop"."main"."orders"
>>>>>>> main
where order_id is not null
group by order_id
having count(*) > 1


