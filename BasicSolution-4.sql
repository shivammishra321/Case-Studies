--------------------------------------------------------------------- BasicSolution-4 -----------------------------------------------------------

--The HR department needs a query to display all unique job codes from the Employees table, write the query to assist the team.

SELECT DISTINCT job_id FROM employees;

--The HR department wants more descriptive column headings for its report on employees. They want employee_id, First_name, Job_id and Hire_date 
--columns but the output should have below column names as shown. Write a query to achieve this.

SELECT employee_id as EMP#, 
		First_name as Employee, 
		Job_id as Job, 
		Hire_date as "Hire Date" 
FROM employees;

---The HR Department has requested a report of all employees and their job IDs. Display the last name concatenated with the job ID.
--(Separated by a comma and space) and name the column as Employee and Title. Shown Below.

SELECT 
	Employee_id, 
	job_id, 
	Last_name + ', '+ Job_id as "Employee and Title" 
FROM employees;

--Because of the budget issues, the HR department needs a report that displays the last name and the salary of the employees who earn 
--more than $12000. 

SELECT
		Last_name, 
		Salary 
FROM employees WHERE Salary > 12000;

--Create a query which will display the last name and the department number for employee id 176.

SELECT 
		Last_name, 
		department_id
FROM employees WHERE Employee_id = 176;

--The HR department looking for all the employees whose salary is in the range of $2000 and $4500. Write a query to get the output for business

SELECT 
		Employee_id, 
		first_name, 
		salary 
FROM employees WHERE Salary BETWEEN 2000 AND 4500;

--Write a query to get the employees who does not have manager.

SELECT
		Employee_id, 
		first_name 
FROM employees WHERE Manager_id IS NULL;

--Write a query which will give employee first name and last name as Employee Name, salary and commission pct. We are looking for the 
--employees who gets commission.

SELECT
		CONCAT(First_name,' ', Last_name) as "Employee Name", 
		Salary, 
		Commission_pct 
FROM employees WHERE Commission_pct IS NOT NULL;

--Write a query where the employee last name 3rd character is "a"

SELECT
		last_name
FROM employees WHERE Last_name LIKE '__a%';

--Write a query that displays the last names of all the employees who have both an "a" and an "e" in their last name.

SELECT
		Last_name 
FROM employees WHERE last_name LIKE '%a%' AND last_name LIKE '%e%';

--Create a student table where in the table we will have following columns 
--{student_id (PK) name the constraint as stu_id_pk, Student name (Not Null) name the constraint as sn_nn, email id (Unique, name the constraint
--as email_uk , Not Null, name the constraint as stu_email_nn, Student Subject (Can have nulls), 
--Student Marks (The marks cannot be negative if user tries to insert the negative number, name the constraint as stu_min_mrks) }

CREATE TABLE student
(student_id int CONSTRAINT stu_id_pk PRIMARY KEY,
student_name Varchar(250) CONSTRAINT sn_nn NOT NULL,
email_id NVARCHAR(350) CONSTRAINT email_uk UNIQUE CONSTRAINT  stu_email_nn NOT NULL,
student_subject VARCHAR(40) NULL,
student_marks int CONSTRAINT stu_min_mrks CHECK (student_marks >=0))

-- add following recod to student table: 1, amar,amar@sql,Math,0

INSERT INTO student VALUES (1,'amar','amar@sql','Math',0);

-- Drop the Table student

DROP TABLE student;


