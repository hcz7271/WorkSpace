USE labs2018;

-- 1) TASK Find the number of units sold of each item
SELECT name, SUM(quantity) AS UnitsSold
FROM item NATURAL JOIN saleitem
GROUP BY itemid
ORDER BY unitssold DESC;

-- ans
SELECT item.Name, sum(saleitem.Quantity) as UnitsSold
FROM saleitem NATURAL JOIN item
GROUP BY item.Name
ORDER BY item.Name;

-- outer join
SELECT name, SUM(quantity) AS UnitsSold
FROM item LEFT OUTER JOIN saleitem
ON item.itemid = saleitem.itemid
GROUP BY name
ORDER BY unitssold DESC;

-- 2) TASK Find any suppliers that deliver no more than two unique items. List the
-- suppliers in alphabetical order
SELECT supplier.name, COUNT(DISTINCT deliveryitem.itemid) AS uniqueItemCount
FROM supplier INNER JOIN delivery INNER JOIN deliveryitem
ON supplier.supplierid = delivery.supplierid
AND delivery.deliveryid = deliveryitem.deliveryid
GROUP BY supplier.supplierid
HAVING uniqueItemCount <= 2
ORDER BY supplier.name;

-- ans
SELECT supplier.Name, COUNT(DISTINCT deliveryitem.itemID) as Unique_item_count
FROM delivery INNER JOIN supplier INNER JOIN deliveryitem
ON supplier.SupplierID = delivery.SupplierID
AND delivery.DeliveryID = deliveryitem.DeliveryID
GROUP BY supplier.SupplierID
HAVING COUNT(DISTINCT deliveryitem.itemID) <= 2
ORDER BY supplier.Name;

-- 3) TASK Find the names of suppliers that have never delivered a Compass
SELECT DISTINCT name
FROM supplier
WHERE supplierid NOT IN
	(SELECT supplierid
	FROM delivery NATURAL JOIN deliveryitem NATURAL JOIN item
	WHERE item.name LIKE '%Compass%')
ORDER BY name;

-- ans
SELECT DISTINCT supplier.Name
FROM supplier
WHERE supplier.SupplierID NOT IN
(SELECT SupplierID
FROM delivery NATURAL JOIN deliveryitem NATURAL JOIN item
WHERE item.Name like 'Compass%');

-- unary join
-- 4) TASK List the first names of each manager and their employees. Order the result by
-- manager first name, then employee first name.
SELECT boss.firstname AS manager, emp.firstname AS employee
FROM employee boss INNER JOIN  employee emp
ON emp.bossid = boss.employeeid
ORDER BY boss.firstname, emp.firstname;

-- ans
SELECT boss.FirstName AS Manager, emp.FirstName AS employee
FROM employee AS emp, employee AS boss
	WHERE emp.BossID = boss.employeeID
	ORDER BY boss.FirstName, emp.FirstName;

-- 5) TASK Now modify this query to use an outer join to list Alice as an employee
SELECT boss.firstname AS manager, emp.firstname AS employee
FROM employee emp LEFT OUTER JOIN employee boss
ON emp.bossid = boss.employeeid
ORDER BY manager, employee;

-- ans
SELECT boss.FirstName AS Manager, emp.FirstName AS employee
FROM employee AS emp LEFT OUTER JOIN employee AS boss
ON emp.BossID = boss.employeeID
ORDER BY boss.FirstName, emp.FirstName;

-- 6) TASK Type the query to count the number of direct employees of each manager, List
-- the employeeID, Manager Name and number of employees.
SELECT CONCAT(boss.firstname, ' ', boss.lastname) AS managerName,
boss.employeeid AS managerID,
COUNT(DISTINCT emp.employeeid) AS employeeCOUNT
FROM employee boss INNER JOIN employee emp
ON boss.employeeid = emp.bossid
GROUP BY boss.employeeid
ORDER BY employeeCOUNT DESC;

-- ans
SELECT boss.employeeID, Concat(boss.FirstName,' ', boss.LastName) as
ENAME, COUNT(*) Emp_count
FROM employee wrk INNER JOIN employee boss
ON wrk.BossID = boss.employeeID
GROUP BY boss.employeeID, ENAME
ORDER BY EMP_COUNT DESC;

-- view
CREATE VIEW vdepartment_Wages AS
SELECT departmentID, Name, SUM(Salary) as TotalWages
FROM department NATURAL JOIN employee
GROUP BY departmentID, Name
ORDER BY departmentID;

SELECT * FROM vdepartment_Wages;

SELECT *
FROM vdepartment_Wages
WHERE TotalWages > 150000;

SELECT *
FROM
(SELECT departmentID, Name, SUM(Salary) as TotalWages
FROM department NATURAL JOIN employee
GROUP BY departmentID, Name
ORDER BY departmentID) as vdepartment_Wages
WHERE TotalWages > 150000;

SELECT table_name, view_definition
FROM Information_schema.views
-- WHERE Table_SCHEMA= 'labs2018' – remove comment for BYOD devices
;

-- 7) TASK List the employees in the Accounting department and the difference between
-- their salaries and the average salary of the department
CREATE VIEW vDepartmentSalary(departmentID, avgSalary) AS
SELECT departmentid, AVG(salary)
FROM employee
GROUP BY departmentid;

SELECT * FROM vdepartmentsalary;

SELECT CONCAT(firstname, ' ', lastname) AS employee,
FORMAT((salary-avgsalary),2) AS salaryDiff
FROM employee INNER JOIN department INNER JOIN vdepartmentsalary
ON employee.departmentid = department.departmentid
AND department.departmentid = vdepartmentsalary.departmentid
WHERE department.name = 'Accounting';

-- 8) TASK List each employee’s salary, the average salary within that person’s
-- department, and the difference between the employees’ salaries and the average
-- salary of the department
SELECT CONCAT(firstname, ' ', lastname) AS employee,
FORMAT(salary,2) AS empSalary,
FORMAT(avgsalary,2) AS avgSalary,
FORMAT((salary-avgsalary),2) AS salaryDiff
FROM employee NATURAL JOIN vdepartmentsalary
ORDER BY employee;

-- ans
SELECT FirstName, LastName, Salary, FORMAT(avgsalary,2) AS DeptAvSal,
FORMAT(Salary - avgsalary,2) AS DiffEAvgDSal
FROM vdepartmentSalary NATURAL JOIN employee
WHERE vdepartmentSalary.departmentID = employee.departmentID;

-- 9) TASK How many supplier – department pairs exist in which the supplier delivers at
-- least one item of type E to the department?
CREATE VIEW vSupplierDepartment AS
	(SELECT DISTINCT supplierid, departmentid
	FROM item NATURAL JOIN delivery NATURAL JOIN deliveryitem
	WHERE item.type = 'E');

SELECT COUNT(*)
FROM vsupplierdepartment;

-- equals to
SELECT COUNT(*)
FROM
	(SELECT DISTINCT supplierid, departmentid
	FROM item NATURAL JOIN delivery NATURAL JOIN deliveryitem
	WHERE item.type = 'E') AS supplierDepartment;

-- 10) TASK Create a VIEW of department names and total number of sales for each department.
CREATE VIEW vDepartmentSale AS
	(SELECT departmentid, name AS departmentName, COUNT(DISTINCT saleid) AS numSales
    FROM department NATURAL JOIN sale
    GROUP BY departmentid);

SELECT * FROM vdepartmentsale;

-- 11) TASK Use the view created in Task 10 to identify department names with more
-- than 5 sales. List the department and number of sales.
SELECT *
FROM vdepartmentsale
WHERE numsales > 5;

-- 12) TASK Create a view to list the department id, department name, maximum salary,
-- average salary, minimum salary, total salary and number of staff in each department.
CREATE VIEW vEmployeeSalary AS
	(SELECT departmentid, name AS departmentName,
    MAX(salary) AS maxSal, AVG(salary) AS avgSal, MIN(salary) AS minSal,
    SUM(salary) AS totalSal, COUNT(employeeid) as headCount
    FROM department NATURAL JOIN employee
    GROUP BY departmentid,name);

SELECT * FROM vemployeesalary;

-- 13) Use the view created in Task 12 to find the lowest salary in the department with
-- the highest headcount.
SELECT departmentID, departmentName, minSal
FROM vEmployeeSalary
WHERE headCount in
	(SELECT MAX(headCount)
    FROM vemployeesalary);

-- 14) TASK List the departments that have at least one sale of all the items delivered to them
SELECT * FROM deliveryitem;

SELECT DISTINCT departmentID
FROM deliveryitem del1
WHERE NOT EXISTS
	(SELECT *
    FROM deliveryitem del2
    WHERE del1.departmentid = del2.departmentid
    AND NOT EXISTS
		(SELECT *
        FROM saleitem NATURAL JOIN sale
        WHERE del2.itemid = saleitem.itemid
        AND del1.departmentid = sale.departmentid));

-- 
SELECT *
FROM saleitem NATURAL JOIN sale;

SELECT distinct(departmentid), itemid
FROM deliveryitem
ORDER BY departmentid, itemid;

SELECT distinct(departmentid), saleitem.itemid
FROM saleitem INNER JOIN sale
on sale.saleid = saleitem.saleid
ORDER BY departmentid, itemid;

-- 15) TASK Find the items (itemID) sold by ALL departments located on the second floor
SELECT saleitem.itemID
FROM saleitem NATURAL JOIN sale NATURAL JOIN department
WHERE department.Floor = 2
GROUP BY saleitem.itemID
HAVING count(DISTINCT department.departmentID) =
	(SELECT count(DISTINCT departmentID)
	FROM department
	WHERE department.Floor = 2)
ORDER BY saleitem.itemID;


-- 16) TASK List the department names that have not recorded a sale for all the items
-- of type N



-- 17) TASK Type a relational divide query that lists the suppliers that delivery only
-- items sold by the Books department


