select *
from "yellow_tripdata_2016-03"

Q2
--average fare per trip on saturdays
select avg("fare_amount") avgfare1, "day_tag"
from
(select "fare_amount", to_char("tpep_pickup_datetime",'day') as "day_tag" 
from "yellow_tripdata_2016-03")T
 where "day_tag" like '%sat%'
 group by 2
 order by 1;
 
 Q5
 --average fare per trip on sundays
 
 select avg("fare_amount") avgfare2, "day_tag2"
 from
 (select "fare_amount", to_char("tpep_pickup_datetime",'day') as "day_tag2"
 from "yellow_tripdata_2016-03")Q
 where "day_tag2" like '%sun%'
 group by 2
 order by 1;
 
 Q1
 --averagenooftrips on saturdays
 
 select avg("passenger_count") avgtrips1, "day_tag"
 from
 (select "passenger_count",to_char("tpep_dropoff_datetime",'day') as "day_tag"
 from "yellow_tripdata_2016-03")G
 where "day_tag" like '%sat%'
 group by 2
 order by 1;
 
 Q4
 --averagenooftrips on sundays
  select avg("passenger_count") avgtrips2, "day_tag2"
 from
 (select "passenger_count",to_char("tpep_dropoff_datetime",'day') as "day_tag2"
 from "yellow_tripdata_2016-03")U
 where "day_tag2" like '%sun%'
 group by 2
 order by 1;
 

 Q3
 -- average duration of trips on saturdays
 select avg(duration) as avgduration, "day_tag"
 from
 (select ("tpep_dropoff_datetime"-"tpep_pickup_datetime") duration, to_char("tpep_dropoff_datetime",'day') as day_tag
 from "yellow_tripdata_2016-03")O
 where "day_tag" like '%sat%'
 group by 2
 order by 1;
 
 Q6
 -- average duration of trips on sundays
 select avg(duration) as avgduration, "day_tag2"
 from
 (select ("tpep_dropoff_datetime"-"tpep_pickup_datetime") duration, to_char("tpep_dropoff_datetime",'day') as day_tag2
 from "yellow_tripdata_2016-03")Y
 where "day_tag2" like '%sun%'
 group by 2