{{ config(database='RESULT_JAFFLE_SHOP', schema='jaffle_shop') }}

select 
    id as customer_id,
    first_name,
    last_name
from {{ source('jaffle_shop', 'customers') }}