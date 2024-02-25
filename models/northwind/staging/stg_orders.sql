{{ config(database='Result_Northwind', schema='stg_northwind') }}


with source as (

    select * from {{ source('dl_northwind', 'orders') }}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from source