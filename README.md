# test-lmwn

# Test postgres DB
$ cd postgres_db<br />
$ docker-compose up<br />
$ docker ps -f "name=postgres"<br />
$ docker exec -it <container id> /bin/bash<br />
$ psql -U postgres<br />
$ \c db_name<br />
$ select * from order_detail limit 100;<br />
$ select * from restaurant_detail limit 100;<br />
