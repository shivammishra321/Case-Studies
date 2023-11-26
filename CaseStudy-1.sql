-------------------------------------------------------Case-1------------------------------------------------

--Case Study: Duplicate Email Analysis

CREATE TABLE employee_1
(id int, constraint ID_PK primary key (id),
email varchar(20));

insert into employee_1 values (1,'a@thescholar.com');
insert into employee_1 values (2,'b@thescholar.com');
insert into employee_1 values (3,'a@thescholar.com');
insert into employee_1 values (4,'c@thescholar.com');
insert into employee_1 values (5,'d@thescholar.com');
insert into employee_1 values (6,'c@thescholar.com');

SELECT * FROM employee_1;

--Write an SQL query to report all the duplicate emails.

SELECT
		email,
		COUNT(email) AS "COUNT"
FROM employee_1
GROUP BY email
HAVING COUNT(email)>1;

--Case Study: Product Analysis 

CREATE TABLE t_product
(product_id int, constraint P_ID_PK primary key (product_id),
low_fats char(1),
recyclable char(1))

insert into t_product values (0,'Y','N')
insert into t_product values (1,'Y','Y');
insert into t_product values (2,'N','Y');
insert into t_product values (3,'Y','Y');
insert into t_product values (4,'N','N');

select *  from t_product

--You have to write an SQL query to find the ids of products that are both low fat and recyclable.

SELECT 
		product_id
FROM t_product
WHERE low_fats = 'Y' AND recyclable = 'Y'

--OR Alternatively

SELECT  product_id 
FROM t_product
WHERE low_fats like '%Y%' and recyclable like '%Y%'









