
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from "jaffle_shop"."prod"."customer_order_pattern"
where customer_id is not null
group by customer_id
having count(*) > 1


