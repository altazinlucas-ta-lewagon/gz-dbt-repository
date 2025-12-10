with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        --shipping_fee_1, 2.2 answer remove
        logCost as log_cost,  
        CAST(ship_cost AS INT64) AS ship_cost -- 2.2 answer cast float 64

    from source

)

select * from renamed