/*use database_name;

/*to show table data*/
select * from sales;

select SaleDate, Amount, Customers from sales;

/*find amount of each box*/
select SaleDate, Amount,Boxes, Amount/Boxes 'Amount per box' from sales;

/* or you can use below query to guve column a name 
select SaleDate, Amount,Boxes, Amount/Boxes as 'Amount per box' from sales;
*/

/* filtering using where clause */
select * from sales 
where Amount>10000
/* using order by to see the result in ascending order.by default ascending*/
order by Amount;

select * from sales 
where Amount>10000
/* using order by to see the result in ascending order.by default ascending*/
order by Amount desc;

select * from sales
where GeoID='G1'
order by PID , Amount desc;

select * from sales
where Amount>10000 and SaleDate>='2022-01-01';

select SaleDate, Amount from sales
where Amount>10000 and year(SaleDate)=2022
order by Amount desc;

/* use between*/
select * from sales
where Boxes between 0 and 50;

/* show sales on friday*/
select SaleDate,Amount,Boxes, weekday(SaleDate) as 'Day of Week' from sales
where weekday(SaleDate)=4;

select * from people;

select * from people
where Team='Jucies' or team='Delish';

/*using IN clause*/
select * from people
where team in ('Jucies','Delish');

/* Pattern Matching*/
select * from People
where Salesperson like 'B%';

/* Use case operator */
select SaleDate,Amount,
	case	when Amount>1000 then 'Under 1k'
			when Amount>5000 then 'Under 5k'
            when Amount>10000 then 'Under 10k'
		else '10k or more'
	end as 'Amount Category'
from Sales;

/* performing inner join*/
select s.SaleDate,s.Amount,p.Salesperson,s.SPID,p.SPID from Sales s
join people p on p.SPID=s.SPID;

/*left join*/
select s.SaleDate,s.Amount,pr.product from Sales s
left join products pr on pr.PID=s.pid;

/* join multiple table*/
select s.SaleDate, s.Amount,pr.product,p.SalesPerson,p.team, g.geo from sales s
join products pr on pr.pid=s.pid
join people p on p.spid=s.spid
join geo g on g.GeoID=s.GeoID
order by SaleDate;

/* group by & aggregate function*/
select g.geo,sum(Amount),avg(Amount) from sales s
join geo g on g.GeoID=s.GeoID
group by g.geo;

select p.Team,pr.category, sum(boxes),sum(amount)
from Sales s
join products pr on pr.PID=s.PID
join people p on p.SPID=s.SPID
group by p.Team,pr.category
order by p.Team,pr.category;

/* find top 10 products by total amount using limit*/
select product,sum(Amount) from Sales s
join products p on p.PID=s.PID
group by product
order by sum(Amount) desc
limit 10;

