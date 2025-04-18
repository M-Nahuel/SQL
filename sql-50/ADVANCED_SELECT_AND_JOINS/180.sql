Create table If Not Exists Logs (id int, num int)
Truncate table Logs
insert into Logs (id, num) values ('1', '1')
insert into Logs (id, num) values ('2', '1')
insert into Logs (id, num) values ('3', '1')
insert into Logs (id, num) values ('4', '2')
insert into Logs (id, num) values ('5', '1')
insert into Logs (id, num) values ('6', '2')
insert into Logs (id, num) values ('7', '2')

# Write your MySQL query statement below

SELECT DISTINCT(num) ConsecutiveNums
FROM
(
    SELECT num,
        LAG(num, 1) OVER (ORDER BY id) previo1,
        LAG(num, 2) OVER (ORDER BY id) previo2
    FROM Logs
) subconsulta
WHERE num = previo1 AND num = previo2;
