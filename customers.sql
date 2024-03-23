select o.customer_id as customer_id
  , c.name as name
  , c.email as email
  , min(created_at) as first_order_at
  , count(o.customer_id) as number_of_orders

from `analytics-engineers-club.coffee_shop.customers` c
left join `analytics-engineers-club.coffee_shop.orders` o  
  on c.id = o.customer_id

group by 1,2,3
order by 4

limit 5;
