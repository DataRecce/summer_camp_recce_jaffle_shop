with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('raw_orders') }}

)

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status
    from source
    where status = 'completed'
    -- NEVER put something like this filter in a production environment
    -- It's a bad practice to do this type of filtering in the staging layer

