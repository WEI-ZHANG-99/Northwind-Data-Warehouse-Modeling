{{ config(schema='dwh_northwind' , materialized='view')}}

SELECT
    TO_CHAR(d, 'YYYY-MM-DD') AS id,
    d AS full_date,
    EXTRACT(YEAR FROM d) AS year,
    EXTRACT(WEEK FROM d) AS year_week,
    EXTRACT(DAY FROM d) AS year_day,
    EXTRACT(YEAR FROM d) AS fiscal_year,
    -- Snowflake没有直接的函数来获取fiscal quarter，可能需要自定义逻辑
    EXTRACT(MONTH FROM d) AS month,
    TO_CHAR(d, 'MMMM') AS month_name,
    EXTRACT(DAYOFWEEK FROM d) AS week_day,
    TO_CHAR(d, 'Day') AS day_name,
    CASE WHEN TO_CHAR(d, 'Day') IN ('Sunday', 'Saturday') THEN 0 ELSE 1 END AS day_is_weekday
FROM (
    SELECT 
        DATEADD(day, seq4(), '2014-01-01'::date) AS d
    FROM 
        TABLE(GENERATOR(ROWCOUNT => 365 * (2050 - 2014))) -- 生成从2014到2050年的日期
) 