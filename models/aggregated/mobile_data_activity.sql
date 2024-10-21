with mobile_data_activity as (
  select
    subscription_id,
    sum(uplink_volume_int) as total_uplink_volume,
    sum(downlink_volume_int) as total_downlink_volume
  from {{ ref('stg_mobile_data_activity') }}
  group by subscription_id
)

select * from mobile_data_activity