
{{ config(materialized='table') }}

with aggregated_data as (
  select s.subscription_id,
    s.total_orders,
    v.longest_duration_call,
    v.shortest_duration_call,
    m.total_uplink_volume,
    m.total_downlink_volume
    from {{ ref('sms_record') }} as s
    left join 
    {{ ref('voice_call_record') }} as v
    on s.subscription_id = v.subscription_id
    left join
    {{ ref('mobile_data_activity') }} as m
    on s.subscription_id = m.subscription_id
)
select * from aggregated_data