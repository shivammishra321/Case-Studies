---------------------------------------------------------------------BASIC Solution-7  --------------------------------------

CREATE table city
(
Id int,
Name VARCHAR(17),
Countrycode VARCHAR(3),
District VARCHAR(20),
Population INT
);
 
 insert into city values (1,'Bokaro_Steel_City','B01','Bokaro',1500000);
 insert into city values (2,'Jafrabad','B01','Amreli',500000);
 insert into city values (3,'Quetta','P02','Baluchistan',1000000);
 insert into city values (4,'Negombo','S03','Gampala',750000);
 insert into city values (5,'Athens','A04','Alabama',800000);
 insert into city values (6,'Nome','A04','Alaska',1100000);
 insert into city values (7,'Amersham','C05','Chiltern',600000);
 insert into city values (8,'Belper','C05','Amber_Valley',900000);
 insert into city values (9,'Zaria','G06','Kaduna',760000);
 insert into city values (10,'Garissa','H07','Mombasa',200000);
     
CREATE TABLE country
(
Code VARCHAR(3),
Name VARCHAR(44),
Continent VARCHAR(13),
Region VARCHAR(25),
Surface_Area int,
Indep_Year VARCHAR(5),
Population int,
Life_Expectancy VARCHAR(4),
GNP int,
GNP_OLD VARCHAR(9),
Local_Name VARCHAR(44),
Government_Form VARCHAR(44),
Head_Of_State VARCHAR(32),
Capital VARCHAR(4),
Code_2 VARCHAR(2)
);
insert into country values('B01','India','Asia','Asia1',3287000,'1947',1360000000,'70',2714,'2843','Ind','Democratic','Narendra_Modi','Del','91');
insert into country values('P02','Pakishtan','Asia','Asia1',881913,'1947',21000000,'67',282,'304','PAK','Democratic','Imran_khan','PAK','92');
insert into country values('S03','Srilanka','Asia','Asia1',65610,'1948',20000000,'77',212,'202','CEILON','Democratic','Mahinda_Rajpaksa','COL','94');
insert into country values('A04','USA','North_America','Americas',9834000,'1776',320000000,'77',21640,'20758','AMERICA','Democratic','Joe_Biden','WAS','10');
insert into country values('C05','UK','Europe','Westrn_Europe',242495,'1707',666000000,'81',716,'680','BRITAIN','Monarch','Boris_jhonson','LON','44');
insert into country values('G06','Nigeria','Africa','South',923768,'1960',20100000,'54',412,'407','NIG','Democratic','Muhammadu_Buhari','ABU','23');
insert into country values('H07','Kenya','Africa','North',580367,'1964',52600000,'66',106,'103','KEN','Democratic','Uhuru_kenyatte','NAI','25');

SELECT * FROM city;
SELECT * FROM country;


/*Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'. Note: CITY.
CountryCode and COUNTRY.Code are matching key columns.*/

SELECT
		Sum(city.population) AS "Population"
FROM City 
INNER JOIN Country 
ON city.CountryCode = COUNTRY.Code
WHERE COUNTRY.CONTINENT = 'Asia'

/*Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'. Note: CITY.CountryCode and 
COUNTRY.Code are matching key columns*/

SELECT
	city.name	
FROM city
INNER JOIN country
ON CITY.CountryCode = COUNTRY.Code
WHERE Continent = 'Africa'


/*Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and 
their respective average city populations (CITY.Population) rounded down to the nearest integer. */

SELECT
	country.Continent,
	FLOOR(AVG(city.population)) AS "AVG_Population "
FROM city
INNER JOIN country
ON CITY.CountryCode = COUNTRY.Code
GROUP BY country.Continent


------------------------------------------------------------

CREATE TABLE Students
(id INT,
[Name] VARCHAR(40),                                                                                      
Marks INT)
DROP TABLE Students;

INSERT INTO Students values (1,'Julia',88);
insert into Students values (2,'Samantha',68);
insert into Students values (3,'Maria',99);
insert into Students values (4,'Scarlet',78);
insert into Students values (5,'Ashley',63);
insert into Students values (6,'Jane',81);

SELECT * FROM Students;

CREATE TABLE Grade
(grade int,
min_mark int,
Max_mark int);

INSERT INTO grade VALUES(1,0,9);
insert into grade values(2,10,19);
insert into grade values(3,20,29);
insert into grade values(4,30,39);
insert into grade values(5,40,49);
insert into grade values(6,50,59);
insert into grade values(7,60,69);
insert into grade values(8,70,79);
insert into grade values(9,80,89);
insert into grade values(10,90,100);

SELECT * FROM students;
SELECT * FROM grade;

/* generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students who
received a grade lower than 8. The report must be in descending order by grade. If there is more than one student
with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, 
if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more
than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order */

SELECT
		CASE WHEN grade>= 8 THEN name
		ELSE 'NULL' END AS "Student Name",
		Grade,
		Marks
FROM students, grade 
WHERE students.marks >= grade.min_mark and students.marks<= grade.Max_mark
ORDER BY grade DESC, "Student Name" ASC;


----------------------------------------
CREATE TABLE projects
(task_id INT,
start_date DATE,
end_date DATE)

INSERT INTO projects VALUES (1, '2015-10-01', '2015-10-02');
INSERT INTO projects VALUES (2, '2015-10-02', '2015-10-03');
INSERT INTO projects VALUES (3, '2015-10-03	', '2015-10-04');
INSERT INTO projects VALUES (4, '2015-10-13', '2015-10-14');
INSERT INTO projects VALUES (5, '2015-10-14', '2015-10-15');
INSERT INTO projects VALUES (6, '2015-10-28', '2015-10-29');
INSERT INTO projects VALUES (7, '2015-10-30', '2015-10-31');

select * from projects

/* If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding 
the total number of different projects completed. Write a query to output the start and end dates of projects listed by the number of
days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days,
then order by thestart date of the project. */

SELECT 
    MIN(p1.Start_Date) AS Start_Date,
    MAX(p2.End_Date) AS End_Date,
    DATEDIFF(day, MIN(p1.Start_Date), MAX(p2.End_Date)) + 1 AS Completion_Days
FROM Projects p1
JOIN Projects p2 ON p1.End_Date = DATEADD(day, -1, p2.Start_Date)
GROUP BY p1.Start_Date
ORDER BY Completion_Days, Start_Date;

/*You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: 
ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).
Write a query to output the names of those students whose best friends got offered a higher salary than them.
Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer */


CREATE TABLE Friends
(
Id INT,
Friend_Id INT
);

insert into Friends values (1,2);
insert into Friends values (2,3);
insert into Friends values (3,4);
insert into Friends values (4,1);

CREATE TABLE student 
(
Id int,
Name VARCHAR(30)
);

insert into student values (1,'Ashley');
insert into student values (2,'Samantha');
insert into student values (3,'Julia');
insert into student values (4,'Scarlet')


CREATE TABLE Packages 
(
Id INT,
Salary FLOAT
);
Insert into packages values(1,15.20);
Insert into packages values(2,10.06);
Insert into packages values(3,11.55);
Insert into packages values(4,12.12);

SELECT * FROM Friends;
SELECT * FROM student;
SELECT * FROM Packages


SELECT t.Name
FROM (
    SELECT s1.ID, s1.Name, p1.Salary, f.Friend_ID, s2.name as friend_name, p2.Salary as friend_salary
    FROM Students s1
    inner join  Packages p1 ON s1.ID = p1.ID
    inner join Friends f ON s1.ID = f.ID
    inner join  Students s2 ON f.Friend_ID = s2.ID
    inner join  Packages p2 ON f.Friend_ID = p2.ID
    ) t
WHERE t.friend_salary > t.Salary
ORDER BY friend_salary;


/*. You are given a table, Functions, containing two columns: X and Y. Two pairs (X1, Y1) and (X2, Y2) are said to be 
symmetric pairs if X1 = Y2 and X2 = Y1.Write a query to output all such symmetric pairs in ascending order by the value of X. 
List the rows such that X1 ≤ Y1. */

CREATE TABLE Functions
(
X INT,
Y INT
);

 insert into Functions values (20,20);
 insert into Functions values (20,20);
 insert into Functions values (20,21);
 insert into Functions values (23,22);
 insert into Functions values (22,23);
 insert into Functions values (21,20);

 SELECT * FROM Functions;
