
### Задача 1
````
version: "3.9"
services:
  postgres:
    image: postgres:12
    container_name: psql
    environment:
      POSTGRES_PASSWORD: "pgpwd4"
      PGDATA: "/var/lib/postgresql/data"
    volumes:
      - ./backup:/var/lib/postgresql/backup
      - ./data:/var/lib/postgresql/data
    ports:
      - "5432:5432"
````

### Задача 2

```` 
CREATE DATABASE test_db 
	TEMPLATE template0 
	ENCODING 'UTF-8';
CREATE USER "test-admin-user";
CREATE USER "test-simple-user";


CREATE TABLE orders 
(
    id integer, 
    name text, 
    price integer, 
    PRIMARY KEY (id) 
);

CREATE TABLE clients 
(
	id integer PRIMARY KEY,
	surname text,
	country text,
	booking integer,
	FOREIGN KEY (booking) REFERENCES orders (id)
);


GRANT ALL ON ALL TABLES IN SCHEMA "public" TO "test-admin-user";

GRANT SELECT, INSERT, UPDATE, DELETE 
	ON ALL TABLES IN SCHEMA "public" 
	TO "test-simple-user";
````
Список БД
```
postgres=# \l
                                 List of databases
   Name    |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges
-----------+----------+----------+------------+------------+-----------------------
 postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
 template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
 template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
           |          |          |            |            | postgres=CTc/postgres
 test_db   | postgres | UTF8     | en_US.utf8 | en_US.utf8 |
(4 rows)
```
Список привелегий пользователей

````
postgres=# select * from information_schema.table_privileges where grantee='test-admin-user';
 grantor  |     grantee     | table_catalog | table_schema | table_name | privilege_type | is_grantable | with_hierarchy
----------+-----------------+---------------+--------------+------------+----------------+--------------+----------------
 postgres | test-admin-user | postgres      | public       | orders     | INSERT         | NO           | NO
 postgres | test-admin-user | postgres      | public       | orders     | SELECT         | NO           | YES
 postgres | test-admin-user | postgres      | public       | orders     | UPDATE         | NO           | NO
 postgres | test-admin-user | postgres      | public       | orders     | DELETE         | NO           | NO
 postgres | test-admin-user | postgres      | public       | orders     | TRUNCATE       | NO           | NO
 postgres | test-admin-user | postgres      | public       | orders     | REFERENCES     | NO           | NO
 postgres | test-admin-user | postgres      | public       | orders     | TRIGGER        | NO           | NO
 postgres | test-admin-user | postgres      | public       | clients    | INSERT         | NO           | NO
 postgres | test-admin-user | postgres      | public       | clients    | SELECT         | NO           | YES
 postgres | test-admin-user | postgres      | public       | clients    | UPDATE         | NO           | NO
 postgres | test-admin-user | postgres      | public       | clients    | DELETE         | NO           | NO
 postgres | test-admin-user | postgres      | public       | clients    | TRUNCATE       | NO           | NO
 postgres | test-admin-user | postgres      | public       | clients    | REFERENCES     | NO           | NO
 postgres | test-admin-user | postgres      | public       | clients    | TRIGGER        | NO           | NO
(14 rows)

postgres=# select * from information_schema.table_privileges where grantee='test-simple-user';
 grantor  |     grantee      | table_catalog | table_schema | table_name | privilege_type | is_grantable | with_hierarchy
----------+------------------+---------------+--------------+------------+----------------+--------------+----------------
 postgres | test-simple-user | postgres      | public       | orders     | INSERT         | NO           | NO
 postgres | test-simple-user | postgres      | public       | orders     | SELECT         | NO           | YES
 postgres | test-simple-user | postgres      | public       | orders     | UPDATE         | NO           | NO
 postgres | test-simple-user | postgres      | public       | orders     | DELETE         | NO           | NO
 postgres | test-simple-user | postgres      | public       | clients    | INSERT         | NO           | NO
 postgres | test-simple-user | postgres      | public       | clients    | SELECT         | NO           | YES
 postgres | test-simple-user | postgres      | public       | clients    | UPDATE         | NO           | NO
 postgres | test-simple-user | postgres      | public       | clients    | DELETE         | NO           | NO
(8 rows)
````
### Задача 3

```
INSERT INTO ORDERS VALUES (1, 'Шоколад', 10), (2, 'Принтер', 3000), (3, 'Книга', 500), (4, 'Монитор', 7000), (5, 'Гитара', 4000);
INSERT INTO clients VALUES (1, 'Иванов Иван Иванович', 'USA'), (2, 'Петров Петр Петрович', 'Canada'), (3, 'Иоганн Себастьян Бах', 'Japan'), (4, 'Ронни Джеймс Дио', 'Russia'), (5, 'Ritchie Blackmore', 'Russia');

postgres=# SELECT COUNT (*) FROM clients;
 count
-------
     5
(1 row)

postgres=# SELECT COUNT (*) FROM orders;
 count
-------
     5
(1 row)
```
### Задача 4

```
UPDATE clients SET booking = 3 WHERE id = 1;
UPDATE clients SET booking = 4 WHERE id = 2;
UPDATE clients SET booking = 5 WHERE id = 3;

postgres=#
SELECT * FROM clients WHERE booking is NOT NULL;
 id |       surname        | country | booking
----+----------------------+---------+---------
  1 | Иванов Иван Иванович | USA     |       3
  2 | Петров Петр Петрович | Canada  |       4
  3 | Иоганн Себастьян Бах | Japan   |       5
(3 rows)

```
### Задача 5
EXPLAIN показывает приблизительную стоимость запуска команды и сколько строк должно быть выведено, используется при работе с оптимизацией БД
```

postgres=# EXPLAIN SELECT * FROM clients WHERE booking is NOT NULL;
                        QUERY PLAN
-----------------------------------------------------------
 Seq Scan on clients  (cost=0.00..18.10 rows=806 width=72)
   Filter: (booking IS NOT NULL)
(2 rows)
```

### Задача 6
```
pg_dump -U postgres test_db -f /var/lib/postgresql/backup/backup.sql

root@7325ee82cbc2:/# psql -U postgres -d test_db -f /var/lib/postgresql/backup/backup_test.sql
SET
SET
SET
SET
SET
 set_config
------------

(1 row)

SET
SET
SET
SET
```
Но после этого база не разворачивается, попробовал всё что подсказал гугл, но не заработало.