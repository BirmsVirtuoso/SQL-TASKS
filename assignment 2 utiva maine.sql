SECTION A - Q1
select "BRANDS", SUM("PROFIT") 
from "brewery_data"
where "YEARS" in ('2017','2018','2019') and "COUNTRIES" in ('Ghana','Nigeria','Togo','Benin','Senegal')
group by "BRANDS";

SECTION A -Q2
select (SumProfit) Anglophone_Profit, (TotalProfit) Francophone_Profit 
from
(select sum ("PROFIT") SumProfit
from "brewery_data"
where "YEARS" in (2017,2018,2019) and "COUNTRIES" in ('Nigeria','Ghana')) A,

(select sum ("PROFIT") TotalProfit
from "brewery_data"
where "YEARS" in (2017,2018,2019) and "COUNTRIES" in ('Togo','Benin','Senegal'))F;

SECTION A -Q3
select SUM("PROFIT") Profit, "COUNTRIES"
from brewery_data
where "YEARS" = 2019
group by "COUNTRIES"
order by Profit desc;

SECTION A-Q4
select SUM("PROFIT") Profit, "YEARS"
from brewery_data
where "YEARS" in (2017,2018,2019)
group by "YEARS"
order by Profit desc;

SECTION A-Q5
select "PROFIT", "MONTHS", "YEARS"
from brewery_data
order by "PROFIT" asc;

SECTION A - Q6
select MIN ("PROFIT") MinProfit ,"MONTHS", "YEARS"
from brewery_data
where "YEARS" = 2018 and "MONTHS" = 'December'
group by "MONTHS","YEARS";

SECTION A- Q6 2ND SOLUTION
select "PROFIT", "MONTHS", "YEARS"
from brewery_data
where "YEARS" =2018 and "MONTHS" ='December'
order by "PROFIT";

SECTION A -Q7 
select "MONTHS", (SUM ("PROFIT")/SUM("COST")*100) 
as "percentageprofit"
from brewery_data
where "YEARS" = 2019
group by "MONTHS" 
order by "percentageprofit";

SECTION A -Q8
select "BRANDS", SUM("PROFIT")
from brewery_data
where "COUNTRIES" = 'Senegal'
group by "BRANDS"
order by SUM ("PROFIT") desc;


SECTION B -Q1
select "BRANDS", SUM("QUANTITY")as TotalQuantity
from brewery_data
where "COUNTRIES" in ('Senegal', 'Togo','Benin') and "YEARS" in (2017, 2018)
group by "BRANDS"
order by TotalQuantity desc
limit 3;

SECTION B -Q2
select "BRANDS", SUM("QUANTITY")as TotalQuantity
from brewery_data
where "COUNTRIES" ='Ghana'
group by "BRANDS"
order by TotalQuantity desc;

SECTION B - Q3
select "BRANDS", SUM("QUANTITY") as "TotalQuantity", SUM("COST") as "TotalCost", SUM("PROFIT") as "TotalProfit"
from brewery_data
where "COUNTRIES" ='Nigeria' and "BRANDS" not like '%malt%'
group by "BRANDS"
order by "TotalQuantity" desc, "TotalCost", "TotalProfit";

SECTION B -Q4
select "BRANDS", SUM("QUANTITY") as "TotalQuantity"
from brewery_data
where "COUNTRIES" in ('Nigeria','Ghana')
and "BRANDS" like ('%malt%') and "YEARS" in (2018,2019)
group by "BRANDS"
order by "TotalQuantity" desc;

SECTION B - Q5
select "BRANDS", SUM("QUANTITY") as "TotalQuantity"
from brewery_data
where "COUNTRIES" = 'Nigeria' and "YEARS" = 2019
group by "BRANDS"
order by "TotalQuantity" desc;

SECTION B - Q6
select "BRANDS", SUM("QUANTITY") as "TotalQuantity"
from brewery_data
where "REGION" ='southsouth' and "COUNTRIES" ='Nigeria'
group by "BRANDS"
order by "TotalQuantity" desc;

SECTION B -Q7
select "BRANDS"
from brewery_data
where "COUNTRIES" ='Nigeria' and "BRANDS" not like '%malt%'
group by "BRANDS";

SECTION B- Q8
select "REGION", SUM("QUANTITY") as "TotalQuantity"
from brewery_data
where "BRANDS" ='budweiser' and  "COUNTRIES" ='Nigeria'
group by "REGION";

SECTION B-Q9
select "REGION", SUM("QUANTITY") as "TotalQuantity"
from brewery_data
where "BRANDS" ='budweiser' and "YEARS" = 2019 and "COUNTRIES" ='Nigeria'
group by "REGION";

SECTION C-Q1
select "COUNTRIES", SUM("QUANTITY") as "TotalQuantity"
from brewery_data
where "BRANDS" not like ('%malt%')
group by "COUNTRIES" 
order by "TotalQuantity" desc;

SECTION C -Q2
select "SALES_REP", SUM("QUANTITY") as "TotalQuantity"
from brewery_data
where "BRANDS"  ='budweiser' and "COUNTRIES" ='Senegal'
group by "SALES_REP"
order by "TotalQuantity" desc;

SECTION C -Q3
select MAX ("PROFIT") MaxProfit, "COUNTRIES"
from brewery_data
where "YEARS" =2019 and "MONTHS" in ('October','November','December')
group by "COUNTRIES";