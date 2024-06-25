select * from orders;
select * from people;
select * from returns;

--list all the columns of orders
SELECT column_name
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'orders';


--To fetch the products which were bought by the city Houston in the year 2014

select product_id,product_name,city from orders where city ='Houston' and year(order_date)=2014;



--To select count of Products which were bought in between the year 2014 to 2016 by various states
select state, YEAR(order_date) AS order_year, COUNT(product_id) AS product_count
FROM orders 
WHERE YEAR(order_date) BETWEEN 2014 AND 2016 
GROUP BY state, YEAR(order_date);



--Fetch the top 5 sum of sales by state and categories in the year 2014 and 2015
select top 5 year(order_date) as year_of_order,state,category,sum(sales) as sum_of_sales 
from orders 
where year(order_date) in (2014,2015) 
group by year(order_date),state,category
order by sum(sales) desc;
--To fetch the number of orders coming from the various regions-- 
select region,count(order_id) as number_of_orders from orders group by region;

--List the Order_id , Product_id and Customer Names who has returned the orders from the New York State--
select r.order_id, o.product_id, o.customer_name 
from orders o left outer join returns r
on o.order_id=r.order_id 
where r.returned='Yes'
and o.state='New York';








































