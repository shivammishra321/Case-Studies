create table Tab_Num
(id int,
num int);

insert into Tab_num values (1,1);
insert into Tab_num values (2,1);
insert into Tab_num values (3,1);
insert into Tab_num values (4,2);
insert into Tab_num values (5,1);
insert into Tab_num values (6,2);
insert into Tab_num values (7,2);
insert into Tab_num values (8,4);
insert into Tab_num values (9,4);
insert into Tab_num values (10,4);
insert into Tab_num values (11,5);
insert into Tab_num values (13,5);
insert into Tab_num values (19,5);

select * from Tab_num;

--Write an SQL query to find all numbers that appear at least three times consecutively?

-- basis on the consicutive ID

SELECT a.num as ConsecutiveNums
FROM TAB_NUM  a
JOIN TAB_NUM  b
ON a.id = b.id+1 AND a.num = b.num
JOIN TAB_NUM  c
ON a.id = c.id+2 AND a.num = c.num;





