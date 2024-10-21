
{{ config(materialized='table') }}

with source_data as (
    select * from {{ source('dw_exer_stg_views', 'voice_call_record') }}
)

select
    subscription_id,
    actual_duration
from source_data
