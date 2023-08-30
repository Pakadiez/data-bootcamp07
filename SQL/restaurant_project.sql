--https://replit.com/@PepPawi/BootcamphomeworkSQL#main.sql 
--OK restaurant database
--OK 5 tables
--OK write3 to 5 queries
--OK 1x WITH
--OK 1x subQeury
--OK Aggregate function

--------------------------------------------------
--OK restaurant database
.open pepberger.db
--OK 5 tables
drop table menus;
create table menus (
  menu_id int,
  menu_name text
);
insert into menus values
  (1,'pizza'),
  (2,'hamberger'),
  (3,'salad');
.mode column 
.header on
select * from menus;


drop table ingredient;
create table ingredient (
  list int unique,
  name TEXT,
  cost real,
  pizza int,
  hamberger int,
  salad int
);
insert into ingredient values
  (1,'bun',20,0,1,0),
  (2,'dough',88.8,1,0,0),
  (3,'egg',5,0,1,1),
  (4,'lettuce',10,0,1,1),  
  (5,'tomato',8.8,1,1,1),  
  (6,'beacon',39,1,1,1),
  (7,'ham',125.5,1,0,0),
  (8,'cheese',411.8,1,1,0),
  (9,'rocket',99.8,1,0,1),
  (10,'mushroom',69.8,1,0,1);
.mode column 
.header on
select * from ingredient;


drop table customers;
create table customers (
  customer_id int,
  customer_name text
);
insert into customers values
  (1,'Rose'),
  (2,'Lisa'),
  (3,'Jisoo'),
  (4,'Jenny');
.mode column 
.header on
select * from customers;


drop table log;
create table log (
  date text,
  customer_id int,
  menu_id int,
  amout int
);
insert into log values
  ('2023-01-01',2,1,1),
  ('2023-01-01',1,1,2),
  ('2023-01-01',1,2,1),
  ('2023-01-01',1,3,1),
  ('2023-01-02',3,3,1),
  ('2023-01-02',4,2,1),
  ('2023-01-05',1,1,3),
  ('2023-01-05',2,3,1),
  ('2023-01-06',4,1,1);
.mode column 
.header on
select * from log;


drop table price;
create table price (
  menu_id int,
  cost int);
insert into price values
  (1,843.5),
  (2,494.6),
  (3,232.4);
.mode column 
.header on
select * from price;


--OK write3 to 5 queries

--OK 1x WITH
with sub AS (
select 
  menus.menu_id AS no,
  menus.menu_name AS menus,
  price.cost,
  ROUND(price.cost*1.7) AS price
  from menus
  join price on menus.menu_id = price.menu_id
)

select 
  log.date,
  customers.customer_name AS customer,
  menus.menu_name AS menu,
  log.amout AS amout,
  price,
  amout*price AS total
  from log 
  JOIN customers ON log.customer_id = customers.customer_id
  JOIN menus ON log.menu_id = menus.menu_id
  JOIN sub ON log.menu_id = sub.no;


-- 1x subQeury with
with summary AS (
with sub AS (
select 
  menus.menu_id AS no,
  menus.menu_name AS menus,
  price.cost,
  ROUND(price.cost*1.7) AS price
  from menus
  join price on menus.menu_id = price.menu_id
)

select 
  log.date,
  customers.customer_name AS customer,
  menus.menu_name AS menu,
  log.amout AS amout,
  price,
  amout*price AS total
  from log 
  JOIN customers ON log.customer_id = customers.customer_id
  JOIN menus ON log.menu_id = menus.menu_id
  JOIN sub ON log.menu_id = sub.no
  )


select 
  customer,
  sum(total) AS summary
from summary
group by customer
order by summary DESC;



-- 2x subQeury with
with summary AS (
with sub AS (
select 
  menus.menu_id AS no,
  menus.menu_name AS menus,
  price.cost,
  ROUND(price.cost*1.7) AS price
  from menus
  join price on menus.menu_id = price.menu_id
)

select 
  log.date,
  customers.customer_name AS customer,
  menus.menu_name AS menu,
  log.amout AS amout,
  price,
  amout*price AS total
  from log 
  JOIN customers ON log.customer_id = customers.customer_id
  JOIN menus ON log.menu_id = menus.menu_id
  JOIN sub ON log.menu_id = sub.no
  )


select 
  menu,
  sum(amout),
  sum(price)
from summary
group by menu
order by sum(price) DESC;

