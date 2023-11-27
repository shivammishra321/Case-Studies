--------------------------------------------------------------- Case Study-2 --------------------------------------

--Case Study: Product Price Analysis

CREATE TABLE Price_list
(product_id int,
Store_name VARCHAR(20),
Price int,
CONSTRAINT PS_PK PRIMARY KEY(Product_id,Store_name));

DROP TABLE price_list;

insert into Price_list values (0,'store1',95);
insert into price_list values (0,'store3',105);
insert into Price_list values (0,'store2',100);
insert into price_list values (1,'store1',70);
insert into price_list values (1,'store3',80);

select * from price_list;

--Write an SQL query to find the price of each product in each store in Cross Tab format?

SELECT
		product_id,
		MAX(CASE WHEN store_name = 'store1' THEN Price END ) AS STORE1,
		MAX(CASE WHEN store_name = 'store2' THEN Price END ) AS STORE2,
		MAX(CASE WHEN store_name = 'store3' THEN Price END ) AS STORE3
FROM price_list
GROUP BY product_id;

--OR Alternatively we can use PIVOT also

SELECT product_id,[STORE1],[STORE2],[STORE3]
FROM (
		Select 
		product_id,
		store_name,
		Price 
		FROM price_list) AS Sourcetable
PIVOT
		(MAX(Price)
		FOR store_name IN ([STORE1],[STORE2],[STORE3])
		) AS pvt


--Case Study: Total Time Analysist 

CREATE TABLE Time_sheet
(
emp_id INT,
event_day DATE,
In_time INT,
Out_time INT,
CONSTRAINT compo_pk primary key (emp_id, event_day, In_time )
)

insert into Time_sheet values (1, '2020-11-28', 4,32);
insert into Time_sheet values (1,'2020-11-28' ,55,200);
insert into Time_sheet values (1,'2020-12-03',1,42);
insert into Time_sheet values (2,'2020-11-28',3,33);
insert into Time_sheet values (2,'2020-12-09',47,74);

select * from Time_sheet

/* It's guaranteed that no two events on the same day intersect in time.
Write an SQL query to calculate the total time in minutes spent by each employee on each  day at the office. 
Note that within one day, an employee can enter and leave more than once. 
*/

SELECT 
		emp_id,
		event_day,
		SUM((out_time - in_time)) AS "Total Time"
FROM Time_sheet
GROUP BY emp_id,event_day;