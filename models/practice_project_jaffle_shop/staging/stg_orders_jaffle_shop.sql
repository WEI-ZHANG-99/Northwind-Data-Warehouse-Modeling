{{ config(database='RESULT_JAFFLE_SHOP', schema='jaffle_shop') }}

select
    id as order_id,
    user_id as customer_id,
    order_date,
    status
from {{ source('jaffle_shop', 'orders') }}