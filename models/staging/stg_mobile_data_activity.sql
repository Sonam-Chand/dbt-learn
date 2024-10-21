
{{ config(materialized='table') }}

with source_data as (
    select * from {{ source('dw_exer_stg_views', 'mobile_data_activity') }}
)

select
    subscription_id,
    coalesce(safe_cast(uplink_volume as int64),0) as uplink_volume_int,
    coalesce(safe_cast(downlink_volume as int64),0) as downlink_volume_int,
    
from source_data
