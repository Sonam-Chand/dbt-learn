with voice_call_record as (
  select
    subscription_id,
    max(actual_duration) as longest_duration_call,
    min(actual_duration) as shortest_duration_call,
  from {{ ref('stg_voice_call_record') }}
  group by subscription_id
)

select * from voice_call_record