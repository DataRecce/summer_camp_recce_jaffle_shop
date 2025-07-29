
    
    

select
    payment_id as unique_field,
    count(*) as n_records

<<<<<<< HEAD
from "jaffle_shop"."prod"."stg_payments"
=======
from "jaffle_shop"."main"."stg_payments"
>>>>>>> main
where payment_id is not null
group by payment_id
having count(*) > 1


