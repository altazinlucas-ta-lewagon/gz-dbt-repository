with 

source as (

    select * from {{ source('raw', 'criteo') }}

),

renamed as (

    select
        date_date,
        paid_source,
        campaign_key,
        campgn_name as campaign_name,
        Cast (ads_cost as float64 ) as  ad_cost,
        impression,
        click

    from source

)

select * from renamed