CREATE TABLE restaurant_detail(
   id                    TEXT NOT NULL PRIMARY KEY
  ,restaurant_name       TEXT NOT NULL
  ,category              TEXT NOT NULL
  ,esimated_cooking_time Float NOT NULL
  ,latitude              Float NOT NULL
  ,longitude             Float NOT NULL
);

CREATE TABLE order_detail(
   order_created_timestamp                    timestamp NOT NULL
  ,status       TEXT NOT NULL
  ,price              Integer NOT NULL
  ,discount Float
  ,id              TEXT NOT NULL
  ,driver_id             TEXT NOT NULL
  ,user_id             TEXT NOT NULL
  ,restaurant_id             TEXT NOT NULL
);
