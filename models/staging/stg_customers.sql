with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('raw_customers') }}

)


    select
        id as customer_id,
        first_name,
        last_name

    from source


