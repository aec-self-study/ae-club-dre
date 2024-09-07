{{ config(
    materialized='table'
 ) }}

select distinct c.id as customer_id
     , c.name
     , c.email
     , min(o.created_at) as first_order_at
     , count(o.id)      as number_of_orders
  from {{ source('coffee_shop','customers') }} c
  join {{ source('coffee_shop','orders') }} o on o.customer_id = c.id
group by c.id
     , c.name
     , c.email
order by first_order_at