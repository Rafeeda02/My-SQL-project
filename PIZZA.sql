create database PIZZA;
use PIZZA;
-- read data
select * from pizza_sales;

-- SUM OF ALL PIZZA ORDERS REVENUE
select round(sum(total_price),2) as Total_revenue from pizza_sales;

-- AVERAGE ORDER VALUE
select round(sum(total_price)/count(distinct order_id),6) as Avg_order_value from pizza_sales;

-- TOTAL PIZZAS SOLD
select sum(quantity) as Total_pizza_sold from pizza_sales;

-- TOTAL ORDER
select count(distinct order_id) as Total_orders from pizza_sales;

-- AVERAGE PIZZAS PER ORDER
select round(cast(sum(quantity) as decimal(10,2)) /cast(count(distinct order_id) as decimal(10,2)), 2) as Avg_per_order from pizza_sales;

-- HOURLY TREND FOR PIZZA SOLD
select hour(order_time) as order_hour ,sum(quantity) as total_sold from pizza_sales group by order_hour order by order_hour asc;

-- WEEKLY TREND FOR orders
select week(order_date) as order_week,year(order_date) as order_year ,
count(distinct order_id) as total_hours from pizza_sales
group by order_week,order_year order by order_week,order_year asc;

-- %  OF SALES BY PIZZA CATEGORY
select pizza_category,sum(total_price) as Total_price,sum(total_price)*100/(select sum(total_price) from pizza_sales) as PCT 
from pizza_sales 
group by pizza_category order by PCT desc;

-- % OF SALES BY PIZZA SIZE
select pizza_size,cast(sum(total_price) as decimal(10,2)) as Total_price ,
cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT
from pizza_sales group by pizza_size order by PCT desc;

-- TOTAL PIZZAS BY PIZZA CATEGORY
select pizza_size,count(pizza_size) as total_pizza from pizza_sales group by pizza_size order by total_pizza desc;

-- TOP 5 PIZZA
select pizza_name,sum(total_price) as total_revenue from pizza_sales group by pizza_name order by total_revenue desc limit 5;

-- TOP 5 ON QUANTITY
select pizza_name,sum(quantity) as total_quantity from pizza_sales group by pizza_name order by total_quantity desc limit 5;

-- BOTTOM 5 PIZZA
select pizza_name,sum(total_price) as total_revenue from pizza_sales group by pizza_name order by total_revenue asc limit 5;

-- TOP 5 ORDERS
select pizza_name,count(distinct order_id) as total_orders from pizza_sales group by pizza_name order by total_orders desc limit 5;


