select 
  orders.customer_id as customer_id,
  customers.name as name,
  customers.email as email,
  min(created_at) as first_order_at,
  count(orders.customer_id) as number_of_orders

from `analytics-engineers-club.coffee_shop.customers` customers
left join `analytics-engineers-club.coffee_shop.orders` orders 
  on customers.id = orders.customer_id -- primary_key = foreign_key --> one-to-man --> fanout

group by 1,2,3
order by 4;