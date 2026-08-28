with source as (

    select * from {{ source('stripe', 'payments') }}

),

renamed as (

    select
        id              as payment_id,
        orderid         as order_id,
        paymentmethod   as payment_method,
        status          as payment_status,
        -- amount is stored in cents, convert it to dollars
        {{ cents_to_dollars('amount', 2) }} as payament_amount,
        created         as payment_created

    from source

)

select * from renamed