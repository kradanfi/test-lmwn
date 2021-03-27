echo "copy data to docker"
docker cp data/order_detail.csv namenode:order_detail.csv
docker cp data/restaurant_detail.csv namenode:restaurant_detail.csv

echo "put data to hdfs"
docker exec -it namenode hdfs dfs -put order_detail.csv /data/
docker exec -it namenode hdfs dfs -put restaurant_detail.csv /data/

echo "pyspark write partition for hive table"
docker cp etl_spatk.py spark-master:etl_spatk.py
docker exec -it spark-master /spark/bin/spark-submit --master spark://spark-master:7077 etl_spatk.py

echo "hive prepare table"
docker cp etl_hive.sql hive-server:/opt/etl_hive.sql
docker exec -it hive-server beeline -u jdbc:hive2://localhost:10000 -f etl_hive.sql

echo "hive query"
docker exec -it hive-server beeline -u jdbc:hive2://localhost:10000 --outputformat=csv2 -e 'select category,avg(discount_no_null) as average_discount from order_detail_new o join restaurant_detail_new r on (r.id == o.restaurant_id) group by category;' > discount.csv
docker exec -it hive-server beeline -u jdbc:hive2://localhost:10000 --outputformat=csv2 -e 'select cooking_bin,count(cooking_bin) as count_cooking_bin from order_detail_new o join restaurant_detail_new r on (r.id == o.restaurant_id) group by cooking_bin;' > cooking.csv