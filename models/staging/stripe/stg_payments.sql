with source as (

    select * from {{ source('stripe', 'payment') }}

),

renamed as (

    select
        id              as payment_id,
        orderid         as order_id,
        paymentmethod   as payment_method,
        status,
        amount          / 100.0     as amount,  -- stored in cents
        created         as created_date

    from source

)

select * from renamed