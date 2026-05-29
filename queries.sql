-- simple queries --

select * from products;

select prod_name, prod_price from products;
 
select * from customers;
 
select distinct prod_category from products;

select * from products limit 10;

-- CONDITIONAL QUERIES -- 

select * from products where prod_price > 50;

select * from customers where city = "Baku";

select * from products where prod_category = "electronics";

select * from orders where order_date > 2026-01-01;

select * from customers where email like "%@gmail.com";

select * from products where prod_price between 20 and 80;

select * from products where prod_category != "clothing";


-- AGGREGATE FUNCTIONS -- 

select count(*) from products;

select avg(prod_price) from products;

select count(*) from customers;

select sum(quantity) from order_items;

select customer_id, count(id) as total_orders from orders group by customer_id;

select max(prod_price) from products;

select prod_category,count(id) as count_product  from products group by prod_category;


-- JOIN QUERIES --

select orders.id, customers.first_name, customers.last_name, orders.order_date from orders join customers on orders.customer_id = customers.id;

select products.prod_name, order_items.quantity, orders.order_date 
from order_items 
join products on order_items.product_id=products.id 
join orders on order_items.order_id=orders.id;

-- simple queries --

select * from products;

select prod_name, prod_price from products;
 
select * from customers;
 
select distinct prod_category from products;

select * from products limit 10;

-- CONDITIONAL QUERIES -- 

select * from products where prod_price > 50;

select * from customers where city = "Baku";

select * from products where prod_category = "electronics";

select * from orders where order_date > 2026-01-01;

select * from customers where email like "%@gmail.com";

select * from products where prod_price between 20 and 80;

select * from products where prod_category != "clothing";


-- AGGREGATE FUNCTIONS -- 

select count(*) from products;

select avg(prod_price) from products;

select count(*) from customers;

select sum(quantity) from order_items;

select customer_id, count(id) as total_orders from orders group by customer_id;

select max(prod_price) from products;

select prod_category,count(id) as count_product  from products group by prod_category;


-- JOIN QUERIES --

select orders.id, customers.first_name, customers.last_name, orders.order_date from orders join customers on orders.customer_id = customers.id;

select products.prod_name, order_items.quantity, orders.order_date 
from order_items 
join products on order_items.product_id=products.id 
join orders on order_items.order_id=orders.id;

select customers.id,customers.first_name, customers.last_name, sum(order_items.quantity) 
from orders 
join customers on orders.customer_id=customers.id
join order_items on orders.id=order_items.order_id
group by customers.id,customers.first_name, customers.last_name;

select customers.id,customers.first_name, customers.last_name, sum(order_items.quantity) as total_quantity, products.prod_price, sum(order_items.quantity) * products.prod_price as total_amount 
from orders 
join customers on orders.customer_id=customers.id
join order_items on orders.id=order_items.order_id
join products on products.id=order_items.product_id
group by customers.id,customers.first_name, customers.last_name, products.prod_price;

select orders.id, orders.customer_id, orders.order_date, products.prod_name, products.prod_category, products.prod_price
from orders
join order_items on order_items.order_id=orders.id
join products on products.id= order_items.product_id 
where  orders.order_date between '2026-01-01' AND '2026-12-31';

select customers.id,customers.first_name, customers.last_name, sum(order_items.quantity) as total_quantity
from orders 
join customers on orders.customer_id=customers.id
join order_items on orders.id=order_items.order_id
group by customers.id,customers.first_name, customers.last_name
order by total_quantity desc
limit 5;
