with sms_record as (
  select
    subscription_id,
    count(network_id) as total_orders
  from {{ ref('stg_sms_record') }}
  group by subscription_id
)

select * from sms_record