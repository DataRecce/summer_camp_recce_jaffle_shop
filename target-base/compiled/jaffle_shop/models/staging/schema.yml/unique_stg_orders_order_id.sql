
    
    

select
    order_id as unique_field,
    count(*) as n_records

<<<<<<< HEAD
from "jaffle_shop"."prod"."stg_orders"
=======
from "jaffle_shop"."main"."stg_orders"
>>>>>>> main
where order_id is not null
group by order_id
having count(*) > 1


