CREATE EXTERNAL TABLE IF NOT EXISTS restaurant_detail(
    id                   STRING
  ,restaurant_name       STRING 
  ,category              STRING 
  ,esimated_cooking_time DOUBLE 
  ,latitude              DOUBLE 
  ,longitude             DOUBLE 
)
partitioned by (dt STRING) 
STORED AS PARQUET
location '/data/restaurant_detail';
msck repair table restaurant_detail;

CREATE EXTERNAL TABLE IF NOT EXISTS order_detail(
    order_created_timestamp                   STRING
  ,status       STRING 
  ,price              INT 
  ,discount DOUBLE 
  ,id              STRING 
  ,driver_id             STRING 
  ,user_id             STRING 
  ,restaurant_id             STRING 
)
partitioned by (dt STRING) 
STORED AS PARQUET
location '/data/order_detail';
msck repair table order_detail;

CREATE TABLE restaurant_detail_new AS select id,restaurant_name,category,esimated_cooking_time,latitude,longitude,dt,
    case when esimated_cooking_time <= 40 then 1
         when esimated_cooking_time > 40 and esimated_cooking_time <= 80 then 2
         when esimated_cooking_time > 80 and esimated_cooking_time <= 120 then 3
         else 4
    end as cooking_bin
from restaurant_detail;

CREATE TABLE order_detail_new AS select order_created_timestamp,status,price,discount,id,driver_id,user_id,restaurant_id,dt,
    case when discount is not null then discount
         else 0
    end as discount_no_null
from order_detail;