# test-lmwn

## Deploy postgres DB
all script in path db
```bash
$ cd postgres_db
$ docker-compose up
```


## Test postgres DB
```bash
$ docker exec -it postgres /bin/bash
$ psql -U postgres
$ \c db_name
$ select * from order_detail limit 100;
$ select * from restaurant_detail limit 100;
```


## Deploy hive
all script in 1_deploy.sh(spark,hive)
```bash
$ cd hive 
$ docker-compose up
$ chmod 775 1_deploy.sh
$ ./1_deploy.sh
```

## Test hive table
```bash
$ docker-compose exec hive-server bash
$ beeline -u jdbc:hive2://localhost:10000 -n root
$ select * from order_detail limit 5;
$ select * from restaurant_detail limit 5; 
$ select * from order_detail_new limit 5;
$ select * from restaurant_detail_new limit 5;
$ SHOW COLUMNS from order_detail
$ SHOW COLUMNS from restaurant_detail
$ SHOW COLUMNS from order_detail_new
$ SHOW COLUMNS from restaurant_detail_new
```

## hive output
[1. cooking.csv](hive/cooking.csv)<br/>
[2. discount.csv](hive/discount.csv)