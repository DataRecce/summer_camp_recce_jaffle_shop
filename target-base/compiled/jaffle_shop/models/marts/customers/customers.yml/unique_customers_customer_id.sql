
    
    

select
    customer_id as unique_field,
    count(*) as n_records

<<<<<<< HEAD
from "jaffle_shop"."prod"."customers"
=======
from "jaffle_shop"."main"."customers"
>>>>>>> main
where customer_id is not null
group by customer_id
having count(*) > 1


