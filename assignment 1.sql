select "SALES_REP", SUM("PROFIT") HighestProfit
from brewery_data
where "COUNTRIES" = 'Togo' and "YEARS" =2018
group by "SALES_REP"
order by HighestProfit desc;

select MAX("PROFIT") HighProfit ,MIN("QUANTITY") LeastQuantity,"COUNTRIES"
from brewery_data
group by "COUNTRIES"
order by HighProfit desc , LeastQuantity asc;