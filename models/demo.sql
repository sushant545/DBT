{{config(materialized = "table")}}

with SALES as
(SELECT
  *
  , QUANTITY * UNIT_PRICE AS ORDER_AMOUNT
FROM
  {{source('DEMO_DBT','SALES_DATA')}}
)  

   select 
     PRODUCT_LINE
     , sum(QUANTITY) as QUANTITY 
     , ROUND(AVG(RATING),2) AS AVERAGE_RATING
     , SUM(ORDER_AMOUNT) AS SALES 
    FROM SALES 
    GROUP BY PRODUCT_LINE
    ORDER BY SUM(ORDER_AMOUNT) DESC

