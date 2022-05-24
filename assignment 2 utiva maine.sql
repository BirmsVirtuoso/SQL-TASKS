        --PROFIT ANALYSIS
		
SECTION A -- Q1 Profit worth of the breweries for both the anglophone and francophone territories
select "BRANDS", SUM("PROFIT") 
from "brewery_data"
where "YEARS" in ('2017','2018','2019') and "COUNTRIES" in ('Ghana','Nigeria','Togo','Benin','Senegal')
group by "BRANDS";

SECTION A --Q2 Compare the total profit between the two territories
select (SumProfit) Anglophone_Profit, (TotalProfit) Francophone_Profit 
from
(select sum ("PROFIT") SumProfit
from "brewery_data"
where "YEARS" in (2017,2018,2019) and "COUNTRIES" in ('Nigeria','Ghana')) A,

(select sum ("PROFIT") TotalProfit
from "brewery_data"
where "YEARS" in (2017,2018,2019) and "COUNTRIES" in ('Togo','Benin','Senegal'))F;

SECTION A --Q3 Country that generated the highest profit in 2019
select SUM("PROFIT") Profit, "COUNTRIES"
from brewery_data
where "YEARS" = 2019
group by "COUNTRIES"
order by Profit desc;

SECTION A--Q4 Find the year with the highest profit
select SUM("PROFIT") Profit, "YEARS"
from brewery_data
where "YEARS" in (2017,2018,2019)
group by "YEARS"
order by Profit desc;

SECTION A --Q5 Which month in the last three years was the least profit generated
select "PROFIT", "MONTHS", "YEARS"
from brewery_data
order by "PROFIT" asc;

SECTION A --Q6 what is the minimum profit December 2018
select MIN ("PROFIT") MinProfit ,"MONTHS", "YEARS"
from brewery_data
where "YEARS" = 2018 and "MONTHS" = 'December'
group by "MONTHS","YEARS";

SECTION A --Q6 (2ND SOLUTION) what is the minimum profit December 2018
select "PROFIT", "MONTHS", "YEARS"
from brewery_data
where "YEARS" =2018 and "MONTHS" ='December'
order by "PROFIT";

SECTION A --Q7 Compare the profit in percentage for each month in 2019
select "MONTHS", (SUM ("PROFIT")/SUM("COST")*100) 
as "percentageprofit"
from brewery_data
where "YEARS" = 2019
group by "MONTHS" 
order by "percentageprofit";

SECTION A --Q8 Particular brand that generated the highest profit in Senegal
select "BRANDS", SUM("PROFIT")
from brewery_data
where "COUNTRIES" = 'Senegal'
group by "BRANDS"
order by SUM ("PROFIT") desc;

  -- SECTION B, BRAND ANALYSIS
SECTION B --Q1 The top three bands consumed in the francophone countries in the last two years
select "BRANDS", SUM("QUANTITY")as TotalQuantity
from brewery_data
where "COUNTRIES" in ('Senegal', 'Togo','Benin') and "YEARS" in (2017, 2018)
group by "BRANDS"
order by TotalQuantity desc
limit 3;

SECTION B --Q2 Top two choice of consumer brands in Ghana
select "BRANDS", SUM("QUANTITY")as TotalQuantity
from brewery_data
where "COUNTRIES" ='Ghana'
group by "BRANDS"
order by TotalQuantity desc;

SECTION B --Q3 Details of beers consumed in the past three years in Nigeria
select "BRANDS", SUM("QUANTITY") as "TotalQuantity", SUM("COST") as "TotalCost", SUM("PROFIT") as "TotalProfit"
from brewery_data
where "COUNTRIES" ='Nigeria' and "BRANDS" not like '%malt%'
group by "BRANDS"
order by "TotalQuantity" desc, "TotalCost", "TotalProfit";

SECTION B --Q4 Favorite malt brand in Anglophone region between 2018 and 2019
select "BRANDS", SUM("QUANTITY") as "TotalQuantity"
from brewery_data
where "COUNTRIES" in ('Nigeria','Ghana')
and "BRANDS" like ('%malt%') and "YEARS" in (2018,2019)
group by "BRANDS"
order by "TotalQuantity" desc;

SECTION B  --Q5 Brands which sold the highest in 2019 in Nigeria
select "BRANDS", SUM("QUANTITY") as "TotalQuantity"
from brewery_data
where "COUNTRIES" = 'Nigeria' and "YEARS" = 2019
group by "BRANDS"
order by "TotalQuantity" desc;

SECTION B --Q6 Favorite brand in South_South region in Nigeria
select "BRANDS", SUM("QUANTITY") as "TotalQuantity"
from brewery_data
where "REGION" ='southsouth' and "COUNTRIES" ='Nigeria'
group by "BRANDS"
order by "TotalQuantity" desc;

SECTION B --Q7 Beer consumption in Nigeria
select "BRANDS"
from brewery_data
where "COUNTRIES" ='Nigeria' and "BRANDS" not like '%malt%'
group by "BRANDS";

SECTION B --Q8 The level of consumption of Budweiser in the regions in Nigeria
select "REGION", SUM("QUANTITY") as "TotalQuantity"
from brewery_data
where "BRANDS" ='budweiser' and  "COUNTRIES" ='Nigeria'
group by "REGION";

SECTION B --Q9 Level of consumption of Budweiser in the regions in Nigeria in 2019
select "REGION", SUM("QUANTITY") as "TotalQuantity"
from brewery_data
where "BRANDS" ='budweiser' and "YEARS" = 2019 and "COUNTRIES" ='Nigeria'
group by "REGION";

   -- SECTION C   COUNTRIES ANALYSIS
SECTION C  --Q1 Country with the highest consumption of beer
select "COUNTRIES", SUM("QUANTITY") as "TotalQuantity"
from brewery_data
where "BRANDS" not like ('%malt%')
group by "COUNTRIES" 
order by "TotalQuantity" desc;

SECTION C --Q2 Highest sales personnel of Budweiser in Senegal
select "SALES_REP", SUM("QUANTITY") as "TotalQuantity"
from brewery_data
where "BRANDS"  ='budweiser' and "COUNTRIES" ='Senegal'
group by "SALES_REP"
order by "TotalQuantity" desc;

SECTION C --Q3 Country with the highest profit of the fourth quarter in 2019
select MAX ("PROFIT") MaxProfit, "COUNTRIES"
from brewery_data
where "YEARS" =2019 and "MONTHS" in ('October','November','December')
group by "COUNTRIES";