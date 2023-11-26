-----------------------------------------------Basic Solution-6 ---------------------

-- Group Functions work across many rows to produce one result per group?

--TRUE

--Group Functions include Nulls in the calculations?

--FALSE

-- The WHERE clause restricts rows before inclusion in a group calculations?

--TRUE

--Find the highest, lowest, sum and average salary of all the employees. Label the columns as Maximum, Minimum, Sum and Average, respectively. 

SELECT 
		MAX(salary) AS Maximum,
		MIN(salary) AS Minimum,
		SUM(salary) AS "SUM",
		AVG(salary) AS Average
FROM employees;	   

--Find the highest, lowest, sum and average salary for each job type. Label the columns as Maximum, Minimum, Sum and Average, respectively. 
--Round the results to the nearest whole number.?

SELECT 
		JOB_ID, 
		ROUND(MAX(SALARY),0) "MAXIMUM",
		ROUND(MIN(SALARY),0) "MINIMUM",
		ROUND(SUM(SALARY),0) "SUM",
		ROUND(AVG(SALARY),0) "AVERAGE"
FROM EMPLOYEES
GROUP BY JOB_ID;  

--Write a query to display the number of people with the same job?


SELECT 
	JOB_ID,
	COUNT(EMPLOYEE_ID) employee_count
FROM EMPLOYEES 
GROUP BY JOB_ID;

-- Determine the number of managers in the company without listing them.

SELECT 
		COUNT(DISTINCT manager_id) AS "Number of Manager"
FROM Employees;

--Find the difference between Highest and Lowest Salaries. Label the column as Difference.

SELECT 
		MAX(SALARY) - MIN(SALARY) AS "DIFFERENCE"
FROM EMPLOYEES;

--Create a report to display the manager number and the salary of the lowest paid employee for that manager.
--Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is $6000 or less. 
--Sort the output in the descending order of the salary.*/

SELECT
		manager_id,
		MIN(salary) AS "Minimum Salary"
FROM employees 
WHERE Manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary)  > 6000
ORDER BY  MIN(salary) DESC;


--Create a query to display the total number of employees and, of that total, the number of employees hired in 2000, 2005, 2006, 2007. ?

SELECT
		COUNT(employee_id) AS "Total employees",
		SUM(CASE WHEN DATEPART(YEAR,hire_date) = 2000 THEN 1 END) AS "2000",
		SUM(CASE WHEN DATEPART(YEAR,hire_date) = 2005 THEN 1 END) AS "2005",
		SUM(CASE WHEN DATEPART(YEAR,hire_date) = 2006 THEN 1 END) AS "2006",
		SUM(CASE WHEN DATEPART(YEAR,hire_date) = 2007 THEN 1 END) AS "2007"
FROM employees

--Create a matrix query to display the job, the salary for that job based on the department number, and the total salary for that job, 
--for departments 20,50,80 and 90, giving each column an appropriate heading.*/

SELECT
		job_id,
		SUM(salary) AS "Total Salary",
		SUM(CASE WHEN department_id = 20 THEN salary END) AS "20",
		SUM(CASE WHEN department_id = 50 THEN salary END) AS "50",
		SUM(CASE WHEN department_id = 90 THEN salary END) AS "80",
		SUM(CASE WHEN department_id = 90 THEN salary END) AS "90"
FROM employees
GROUP BY job_id

--Write a query for the HR department to produce the addresses of all the departments. 
--Use the locations and countries tables. Show the location id, street address, city, state or province and country in the output. */

SELECT 
		LOCATION_ID, 
		STREET_ADDRESS,
		CITY, 
		STATE_PROVINCE, 
		COUNTRY_NAME 
FROM LOCATIONS L 
INNER JOIN COUNTRIES C
ON L.COUNTRY_ID = C.COUNTRY_ID

--The HR department needs a report of all employees. Write a query to display the last name, department number and department name 
--for all employees. */

SELECT 
		LAST_NAME, 
		E.DEPARTMENT_ID, 
		DEPARTMENT_NAME
FROM EMPLOYEES E 
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID


--The HR Department needs a report of employees in Toronto. Display the last name, job, department number, and department 
--name for all employees who work in Toronto. */

SELECT 
		E.LAST_NAME, 
		E.JOB_ID, 
		E.DEPARTMENT_ID, 
		D.DEPARTMENT_NAME
FROM EMPLOYEES E 
INNER JOIN DEPARTMENTS D 
ON E.DEPARTMENT_ID= D.DEPARTMENT_ID
INNER JOIN LOCATIONS L 
ON D.LOCATION_ID=L.LOCATION_ID
WHERE L.CITY = 'toronto';

--Create a report for the HR department that displays employee last names, department numbers, and all the employees who work 
--in the same department as a given employee. */

SELECT
		E.DEPARTMENT_ID DEPARTMENT, 
		E.LAST_NAME EMPLOYEE, 
		C.LAST_NAME COLLEAGUE
FROM EMPLOYEES E 
INNER JOIN EMPLOYEES C 
ON E.DEPARTMENT_ID=C.DEPARTMENT_ID
WHERE E.EMPLOYEE_ID <> C.EMPLOYEE_ID
ORDER BY E.DEPARTMENT_ID, E.LAST_NAME, C.LAST_NAME

-- HR department wants to determine the names of all the employees who were hired after Davies. 
--Create a query to display the name and hire date of any employee hired after employee Davies. */

SELECT 
		first_name,
		hire_date
FROM Employees
WHERE hire_date > (SELECT hire_date FROM Employees WHERE last_name = 'Davies')

--OR Alternatively
SELECT 
		e.last_name,
		e.hire_date	
FROM Employees e
INNER JOIN Employees Davies
ON Davies.last_name = 'Davies'
WHERE e.HIRE_DATE > Davies.HIRE_DATE
