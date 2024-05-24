-- Task 1: Operational situation 
-- 1.1 total number of orders  
select year(create_info#created) as year
	, month(create_info#created) as month 
	, count(_id)  as number_id 
from fact_bill 
group by year(create_info#created), month(create_info#created)
order by year(create_info#created) asc,  month(create_info#created) asc

-- 1.2 Total number of days the order was generated 
select year(create_info#created) as year 
	, month(create_info#created) as month 
	, count(distinct day(create_info#created)*100 + month(create_info#created))  as number_id 
from fact_bill 
group by year(create_info#created), month(create_info#created)
order by year(create_info#created) asc,  month(create_info#created) asc

-- Task 2: Revenue   
select year(create_info#created) as year 
	, month(create_info#created) as month
	, sum([ summary#gran _total ]) as revenue_orders
	, avg ([ summary#gran _total ]) as avgrevenueperorders
	, sum([ summary#commission ]) as comission
from fact_bill 
group by year(create_info#created), month(create_info#created)
order by year(create_info#created) asc,  month(create_info#created) asc

-- Task 3: Customer's analyst 
-- 3.1 customer's demand
with temp1 as (
select b._id 
	, b.customer_id
	, o.name as occasion 
	, m.name as product 
	, g.relationship 
from fact_bill as b 
left join dim_occasion as o 
	on b.to_user#occasion_id = o._id
left join dim_master as m 
	on b.master_id = m._id
left join relationship as g 
	on b.to_user#relative_id = g._id
) 
select distinct occasion
	,count(occasion) over (partition by occasion) as number_occasion 
	, product 
	, count(product) over (partition by product) as number_product 
	, relationship 
	, count(relationship ) over (partition by relationship) as number_relationship
from temp1
 
-- 3.2 customer's return rate 
with temp1 as (
	select customer_id
		, create_info#created 
		, rank () over (partition by customer_id order by create_info#created) as date_rank
	from fact_bill
) 
, temp2 as (
	select *
	, case when date_rank = 1 then 'new'
		else 'returning' 
		end as customerstatus 
	from temp1
) 
select month(create_info#created) + year(create_info#created)*100 as date
	, customerstatus 
	,count( customer_id) as total_customer 
from temp2 
group by month(create_info#created) + year(create_info#created)*100, customerstatus
order by date 

-- 3.2.1 Product's demand when customers return
with temp1 as (
	select customer_id
		, _id
		, create_info#created 
		, rank () over (partition by customer_id order by create_info#created) as date_rank
		, master_id 
	from fact_bill
) 
 , temp2 as (
	select customer_id 
	, _id
	, create_info#created
	, case when date_rank = 1 then 'new'
		else 'existing' 
		end as customerstatus 
	, master_id 
	from temp1
)
, temp3 as (
	select temp2.*
		, name 
	from temp2 
	left join dim_master as m 
		on temp2.master_id = m._id
)
select distinct customerstatus, name
	, count(_id) over (partition by customerstatus, name order by customerstatus)
from temp3 

-- 3.2.2 Occasion's demand when customers return 
with temp1 as (
	select customer_id
		, _id
		, to_user#occasion_id
		, create_info#created 
		, rank () over (partition by customer_id order by create_info#created) as date_rank
	from fact_bill
) 
 , temp2 as (
	select customer_id 
	, _id
	, to_user#occasion_id
	, create_info#created
	, case when date_rank = 1 then 'new'
		else 'existing' 
		end as customerstatus 
	from temp1
)
, temp3 as (
	select temp2.*
		, m.name 
	from temp2 
	left join dim_occasion as m 
		on temp2.to_user#occasion_id = m._id
)
select distinct customerstatus, name
	, count(_id) over (partition by customerstatus, name order by customerstatus) 
from temp3
---