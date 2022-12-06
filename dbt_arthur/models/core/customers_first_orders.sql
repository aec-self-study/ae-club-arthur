select 
    o.customer_id, 
    c.name, 
    c.email, 
    min(o.created_at) as first_order_at, 
    count(o.id) as count
from 
    {{ source('coffee_shop', 'orders') }} as o
    left join {{ source('coffee_shop', 'customers') }} as c 
    on o.customer_id = c.id
group by 1,2,3