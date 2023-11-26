---------------------------------------------- Basic Solution -5 ---------------------------------------

--Display the last name and department number of all the employees in the department number 50 or 20 in 
-- ascending alphabetical order by name,

SELECT
		last_name, 
		department_id 
FROM employees 
WHERE department_id in (50,20) 
ORDER BY last_name ASC;

--Create a report to display the last name, salary and commission of all the employees who earn commissions.
--Sort the data based on salary and commission in the descending order.

SELECT 
		last_name, 
		salary, 
		commission_pct 
FROM employees 
WHERE commission_pct IS NOT NULL 
ORDER BY salary DESC, commission_pct DESC;

--Write a query to display the current date. Label the column name as Date.

SELECT CAST(GETDATE() AS DATE) as "Current Date";


--HR Department needs a report to display the employee number, last name, salary and salary increased by 15.5% for each employee whose
--name is having w in it. Also, create a new column which will have the difference between old salary and new salary.

SELECT
		employee_id, 
		last_name, 
		salary, 
		salary *1.155 AS "New Salary", 
		salary*1.155 - salary AS "Difference" 
FROM employees 
WHERE last_name LIKE '%w%';

--Write a query that displays the last name in upper case and the length 
--of the last name for all the employees whose last name starts with letters J, A or M. Sort the output based on the last
--name in the descending order.

SELECT 
		UPPER(last_name) AS "employee name", 
		LEN (last_name) AS "Length" 
FROM employees 
WHERE last_name like 'J%' or last_name like 'A%' or last_name like 'M%' 
ORDER BY last_name DESC;

-- or alternatively
 SELECT 
		UPPER(last_name)AS "employee name", 
		LEN (last_name) AS "Length" 
FROM employees 
WHERE SUBSTRING (last_name,1,1) in ('J','A','M')
ORDER BY last_name DESC;


--The HR department wants to find the duration of employment for eac employee. For each employee, display the last name and calculate
--the number of months between today and the date of joining. Label the column as Months Worked. Order the results by number 
--of month employed. Round the number of months to the closest integer.

SELECT 
		last_name, 
		hire_date,
		DATEDIFF (MONTH, hire_date, getdate()) AS "Month Worked"	
FROM employees
ORDER BY  "Month Worked" DESC

--Create a report that produces the below output: 
--<Employee Last Name> earns<Salary> monthly but wants <3 times salary>. Label the column as dream salary.

SELECT CONCAT (last_name, ' earns ', salary, ' monthly but want ', salary*3) AS "Dream salary"
FROM employees;

--Create a query to display the first name with 'er' prefix befor name and salary of all the employees. Format the salary to be add '$' 
--sign before amount left padded with $ symbol. Label the column as SalarySELECT
		'er ' + first_name AS [Name], 
		CONCAT('$',salary) AS salary
		-- OR alternatively : '$' + CAST(salary AS VARCHAR) AS salary,
FROM employees;

--Create a query which will display Last name, Hire date, Probation period as 3 months and also find the date of the coming
--Wednesday and name that column as Induction date. 

 SELECT
		last_name, 
		hire_Date,
		DATEADD (MONTH,3, hire_date) AS Probation_period,
		DATEADD (DAY,(4 - DATEPART(WEEKDAY, hire_date) + 7) % 7, hire_date) AS "INDUCTION DAY"	
		--calculation for remaining weekday for next Wednesday (4 (i.e Wednesday) - actual_WEEKDAY + 7) % 7
FROM employees;

--Write a query to display the the last name, Hire date and day on which the employee joined.SELECT		last_name,		hire_date,		DATENAME (WEEKDAY,hire_date) AS "DAY JOINED"FROM employees;
--Create a query to display the employees last name and commission amounts. If an employee does not earn a commission, 
--show the output as "No Commission". Label the column as "Comm".

SELECT
		last_name,
		ISNULL(CAST(commission_pct AS VARCHAR),'No Commission') AS "COMM"
FROM employees;

--write a query that displays the grade of all the employees based on the value of the job_id column : AD_PRES = A, ST_MAN = 'B' 
--IT_PROG = 'C', SA_REP= 'D',ST_CLERK= 'E' and for all other 'O'

SELECT
		JOB_ID,
		CASE WHEN job_id = 'AD_PRES' THEN 'A'
			 WHEN job_id = 'ST_MAN' THEN 'B'
			 WHEN job_id = 'IT_PROG' THEN 'C'
			 WHEN job_id = 'SA_REP' THEN 'D'
			 WHEN job_id = 'ST_CLERK' THEN 'E'
		ELSE 'O'
		END AS Grade
FROM Employees
ORDER BY Grade

-- Create a Table name occupation with attributes "name" and "occupation"  and insert random recods 

CREATE TABLE occupation 
([Name] VARCHAR(10),
occupation VARCHAR(20)
);

insert into occupation values ('James', 'Data Scientist');
insert into occupation values ('John', 'Data Engineer');
insert into occupation values ('Jenny', 'SQL Developer');
insert into occupation values ('Andrea', 'Data Scientist');
insert into occupation values ('Sylvia', 'SQL Developer');
insert into occupation values ('Mathew', 'Data Engineer');
insert into occupation values ('Maria', 'Data Engineer');

SELECT * FROM occupation;

--Query an alphabetically ordered list of all names in occupation table, immediately followed by the first letter of each profession in 
--the parentheses. For example: James(D), John(T), Jenny(S) and so on..

SELECT
		CONCAT([Name],'(', LEFT(occupation,1), ')') AS [Name]
FROM occupation;


--Pivot the Occupation column in occupation table so that each Name is sorted alphabetically and displayed underneath its 
--corresponding Occupation. The output column headers should be Data Scientist, Data Engineer, SQL Developer.

SELECT
		CASE WHEN occupation ='Data Scientist' THEN NAME ELSE NULL END AS [Data Scientist],
		CASE WHEN occupation ='Data Engineer' THEN NAME ELSE NULL END AS [Data Engineer],
		CASE WHEN occupation ='SQL Developer' THEN NAME ELSE NULL END AS [SQL Developer]
FROM occupation
ORDER BY NAME;

-- give numbeer of person in each profession

SELECT occupation,
COUNT(name) as Count_person
FROM occupation 
Group by occupation;

SELECT [Data Scientist],[Data Engineer],[SQL Developer]
FROM occupation
PIVOT
(COUNT(name)
 FOR occupation IN([Data Scientist],[Data Engineer],[SQL Developer])
 ) as pvt


--Write a query to identify the type of each record in the TRIANGLE table using its three side lengths. Output one of the following
--statements for each record in the table: Equilateral: It's a triangle with 3 sides of equal length. Isosceles: It's a triangle with 2
--sides of equal length. Scalene: It's a triangle with 3 sides of differing lengths. Not A Triangle: The given values of A, B, 
--and C don't form a triangle.

CREATE TABLE triangles 
(A int, 
B int,
C int
);

insert into triangles values (20,20,23);
insert into triangles values (20,20,20);
insert into triangles values (20,21,22);
insert into triangles values (20,20,23);
insert into triangles values (13,14,30);

select * from triangles;

select a,b,c,case when a+b<=c or a+c<=b or b+c<=a then 'Not a triangle'
when a=b and b=c and c=a then 'Equilateral Triangle' 
when a=b or b=c or c=a then 'Isosceles Triangle'
else 'Scalene' end "Triangle Type"
from triangles;

