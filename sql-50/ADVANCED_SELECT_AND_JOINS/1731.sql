Create table If Not Exists Employees(employee_id int, name varchar(20), reports_to int, age int)
Truncate table Employees
insert into Employees (employee_id, name, reports_to, age) values ('9', 'Hercy', 'None', '43')
insert into Employees (employee_id, name, reports_to, age) values ('6', 'Alice', '9', '41')
insert into Employees (employee_id, name, reports_to, age) values ('4', 'Bob', '9', '36')
insert into Employees (employee_id, name, reports_to, age) values ('2', 'Winston', 'None', '37')

SELECT 
    em.employee_id, 
    em.name, 
    COUNT(E.employee_id) AS reports_count,
    ROUND(AVG(E.age)) AS average_age
FROM 
    Employees em
INNER JOIN 
    Employees E ON E.reports_to = em.employee_id
GROUP BY 
    em.employee_id, em.name
HAVING 
    COUNT(E.employee_id) > 0
ORDER BY 
    em.employee_id;
