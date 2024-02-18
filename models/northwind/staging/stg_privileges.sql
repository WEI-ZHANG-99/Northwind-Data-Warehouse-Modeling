{{ config(schema='stg_northwind') }}

with source as (

    select * from {{ source('dl_northwind', 'privileges') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source