-- task5
DESC department;

SELECT *
FROM department;

-- task6
SELECT *
FROM Employee;

SELECT Name,Floor
FROM department;

-- task7
SELECT firstname,lastname,departmentid
FROM Employee;

SELECT *
FROM department
WHERE floor=2;

SELECT *
FROM department
WHERE name like 'M%';

-- task8
SELECT firstname, lastname,departmentid
FROM Employee
WHERE salary < 55000;

SELECT *
FROM department
WHERE name like 'M%' AND managerid=1;

-- task9
DESC Department;
DESC Employee;

SELECT *
FROM department
WHERE floor > 1;

SELECT name,floor
FROM department
WHERE floor != 5;

SELECT name,floor
FROM department
WHERE floor <> 5;

SELECT name,floor
FROM department
WHERE floor !=5
ORDER BY floor;

SELECT *
FROM department
ORDER BY floor DESC;

SELECT *
FROM department
ORDER BY floor DESC, departmentid ASC;

-- task10
SELECT firstname,lastname,departmentid,salary
FROM employee
WHERE departmentid=11 AND salary>55000;

SELECT firstname,lastname,departmentid,salary
FROM employee
WHERE departmentid=11 OR salary>55000;

-- task11
SELECT firstname,lastname,departmentid,salary
FROM employee
WHERE salary>=45000
ORDER BY salary DESC;

-- task12
SELECT *
FROM employee
ORDER BY departmentid,lastname;

-- task13
SELECT name
FROM department
WHERE floor=5
ORDER BY name ASC
LIMIT 2;

SELECT name
FROM department
WHERE floor=5
ORDER BY name DESC
LIMIT 2;

SELECT name
FROM department
WHERE floor=5
ORDER BY name ASC;

-- task14
SELECT firstname,lastname,salary
FROM employee
ORDER BY salary DESC
LIMIT 5;

SELECT COUNT(*)
FROM department;

SELECT COUNT(name)
FROM department;

SELECT CONCAT(firstname,' ',lastname,' works in the ',department.name,' Department') AS INFO
FROM employee NATURAL JOIN department;

-- task15
SELECT COUNT(*)
FROM employee;

SELECT floor, count(departmentid)
FROM department
GROUP BY floor;

SELECT floor as DEPT_FLOOR, COUNT(departmentid) AS DEPT_COUNT
FROM department
GROUP BY DEPT_FLOOR
ORDER BY DEPT_FLOOR;

-- task16
SELECT departmentid, COUNT(employeeid)
FROM employee
GROUP BY departmentid
ORDER BY departmentid;

-- task17
SELECT departmentid, AVG(salary)
FROM employee
GROUP BY departmentid
ORDER BY departmentid;

-- task18
SELECT DepartmentID, salary AS 'MAX(Salary)'
FROM employee
ORDER BY salary DESC
LIMIT 1;

-- task19
SELECT DepartmentID, salary AS 'MIN(Salary)'
FROM employee
ORDER BY salary
limit 1;

DESC supplier;