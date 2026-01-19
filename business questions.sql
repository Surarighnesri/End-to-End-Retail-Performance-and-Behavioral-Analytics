/* Business Questions */

/* 1. What is the total revenue generated in the last 12 months? */

select DATEFROMPARTS(year(getdate()),month(getdate()),1) as as_of_month,
sum(net_revenue) as last_12months_completed_revenue
from dbo.salesdata
where order_date >= dateadd(month,-12,datefromparts(year(getdate()),month(getdate()),1)) 
and order_date < datefromparts(year(getdate()),month(getdate()),1);

/* 2. Which are the top 5 best-selling products by quantity? */

With Productsales as
(
select 
p.product_name,
sum(s.quantity) as total_quantity_sold,
row_number() over(partition by sum(s.quantity) order by p.product_id) as rn
from dbo.salesdata s
join dbo.products p
on s.product_id=p.product_id
group by p.product_id,product_name
)
select top 5 product_name,
total_quantity_sold
from Productsales
where rn=1
order by total_quantity_sold desc;

/* 3. How many customers are from each region? */

select region,count(distinct customer_id) as customer_count from dbo.customers
group by region
order by customer_count desc;

/* 4. Which store has the highest profit in the past year? */

select top 1 st.store_name,sum(s.profit) as total_profit
from dbo.salesdata s join dbo.stores st on s.store_id=st.store_id
where s.order_date>= DATEADD(year,-1,DATEFROMPARTS(year(getdate()),month(getdate()),1))
group by st.store_name
order by total_profit desc;

/* 5. What is the return rate by product category? */

select p.category,(count(distinct r.order_id)*100.0/count(distinct s.order_id)) as return_rate
from dbo.salesdata s join dbo.products p
on s.product_id=p.product_id
left join dbo.returns r 
on s.order_id=r.order_id
group by p.category
order by return_rate desc;

/* 6. What is the average revenue per customer by age group? */

select age_group,
avg(customer_revenue) as avg_revenue_per_customer
from
(select s.customer_id,c.age_group,
sum(net_revenue) as customer_revenue
from dbo.salesdata s join dbo.customers c
on s.customer_id=c.customer_id
group by s.customer_id,c.age_group) t
group by age_group
order by avg_revenue_per_customer desc;

/* 7. Which sales channel (Online vs In-Store) is more profitable on average? */

select sales_channel,
avg(profit) as avg_profit_per_order
from dbo.salesdata
group by sales_channel
order by avg_profit_per_order desc;

/* 8. How has monthly profit changed over the last 2 years by region? */

select DATEFROMPARTS(year(s.order_date),month(s.order_date),1) as year_month,
c.region,sum(s.profit) as monthly_profit
from dbo.salesdata s join dbo.customers c
on s.customer_id=c.customer_id 
where order_date>= DATEADD(year,-2,datefromparts(year(getdate()),month(getdate()),1))
group by DATEFROMPARTS(year(s.order_date),month(s.order_date),1), c.region
order by year_month, c.region

/* 9. Identify the top 3 products with the highest return rate in each category.*/

select category,product_name,return_rate
from(
select p.category,p.product_name,
(count(distinct r.order_id)*1.0/nullif(count(distinct s.order_id),0)) as return_rate,
ROW_NUMBER() over(partition by p.category 
order by (count(distinct r.order_id)*1.0/nullif(count(distinct s.order_id),0)) desc) as rn
from dbo.salesdata s join dbo.products p
on s.product_id=p.product_id
left join dbo.returns r 
on s.order_id=r.order_id
group by p.category,p.product_name)t
where rn<=3

/* 10. Which 5 customers have contributed the most to total profit, and what is their 
tenure with the company? */

select top 5 c.customer_id,c.first_name,c.last_name,c.tenure_years,
sum(s.profit) as total_profit
from dbo.salesdata s join dbo.customers c 
on s.customer_id=c.customer_id
group by c.customer_id,c.first_name,c.last_name,c.tenure_years
order by total_profit desc;