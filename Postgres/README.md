
### Задача 1

````
Вывод списка БД
\l
подключения к БД
\c database
вывода списка таблиц
\dt
вывода описания содержимого таблиц
\dS+ pg_index
выхода из psql
\q
````

### Задача 2

```
postgres=# CREATE DATABASE test_database;
CREATE DATABASE

postgres=# \c test_database
You are now connected to database "test_database" as user "postgres".
test_database=# \db
       List of tablespaces
    Name    |  Owner   | Location
------------+----------+----------
 pg_default | postgres |
 pg_global  | postgres |
(2 rows)


psql -U postgres -d test_db -f /var/lib/postgresql/data/test_dump.sql

test_database=# ANALYZE VERBOSE public.orders;
INFO:  analyzing "public.orders"
INFO:  "orders": scanned 1 of 1 pages, containing 8 live rows and 0 dead rows; 8 rows in sample, 8 estimated total rows
ANALYZE


test_database=# SELECT avg_width FROM pg_stats WHERE tablename='orders';
 avg_width
-----------
         4
        16
         4
(3 rows)

```
### Задача 3
Разбить таблицу
````
CREATE TABLE orders_low (CHECK (price < 499)) INHERITS (orders);
CREATE TABLE orders_high (CHECK (price >= 499)) INHERITS (orders);
````
Перенести данные из старой таблицы в новые
````
INSERT INTO orders_low SELECT * FROM orders WHERE price < 499;
DELETE FROM only orders WHERE price < 499;
INSERT INTO orders_high SELECT * FROM orders WHERE price >= 499;
DELETE FROM only orders WHERE price >= 499;
````

````
CREATE TABLE public.orders_new (
id integer NOT NULL,
title character varying(80) NOT NULL,
price integer DEFAULT 0
)
PARTITION BY RANGE (price);

CREATE TABLE orders_n_low PARTITION OF orders_new FOR VALUES FROM ('0') TO ('499');
CREATE TABLE orders_n_high PARTITION OF orders_new FOR VALUES FROM ('499') TO ('99999');
````
### Задача 4
Можно добавить индекс для отметки уникальности
```
CREATE TABLE public.orders (
    id integer NOT NULL,
    title character varying(80) UNIQUE NOT NULL,
    price integer DEFAULT 0
);

pg_dump -d test_database > /backup/db_dump.sql
```