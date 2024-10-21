
{{ config(materialized='table') }}

{% set table_name = 'sms_record' %}

with source_data as (
    select * from {{ source('dw_exer_stg_views', table_name).render() }}
)

select
    subscription_id,
    network_activity_type_code  as network_id
from source_data