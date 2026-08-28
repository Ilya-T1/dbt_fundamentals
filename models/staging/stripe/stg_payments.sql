with source as (

    select * from {{ source('stripe', 'payment') }}

),

renamed as (

    select
        id              as payment_id,
        orderid         as order_id,
        paymentmethod   as payment_method,
        status,
        {{ cents_to_dollars('amount') }} as amount,
        created         as created_date

    from source

)

select * from renamed