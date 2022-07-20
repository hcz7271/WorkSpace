USE labs2018;

SELECt * FROM department;
SELECT * FROM delivery;
SELECT * FROM deliveryitem;
SELECT * FROM item;
SELECT * FROM saleitem;
SELECT * FROM sale;
SELECT * FROM supplier;

-- task 1
SELECT itemid,name
FROM item
WHERE type='c'
AND colour='green';

-- task 2
SELECT * FROM item NATURAL JOIN deliveryitem NATURAL JOIN delivery;

SELECT item.name
FROM item NATURAL JOIN deliveryitem NATURAL JOIN delivery
GROUP BY item.name
HAVING COUNT(DISTINCT(supplierid))>=2;

-- task 3
SELECT * FROM employee NATURAL JOIN department;

SELECT MAX(salary) 
FROM employee NATURAL JOIN department
WHERE department.name='marketing';

SELECT firstname,lastname,salary
FROM employee
WHERE salary = 
	(SELECT MAX(salary) 
	FROM employee NATURAL JOIN department
	WHERE department.name='marketing');

-- task 4
SELECT * FROM item NATURAL JOIN delivery NATURAL JOIN deliveryitem;

SELECT supplierid,name
FROM supplier
WHERE supplierid NOT IN
	(SELECT supplierid
	FROM delivery NATURAL JOIN deliveryitem NATURAL JOIN item
	WHERE name LIKE 'compass%');

-- task 5
SELECT department.name,FORMAT(AVG(employee.salary),2) AS AverageSalary
FROM employee INNER JOIN department INNER JOIN sale INNER JOIN saleitem INNER JOIN item
ON employee.departmentid=department.departmentid
AND department.departmentid=sale.departmentid
AND sale.saleid=saleitem.saleid
AND saleitem.itemid=item.itemid
WHERE item.type='e'
GROUP BY department.name;

-- task 6
SELECT item.name, SUM(saleitem.quantity) AS QUANTITY
FROM item INNER JOIN saleitem INNER JOIN sale INNER JOIN department
ON item.itemid=saleitem.itemid
AND sale.saleid=saleitem.saleid
AND department.departmentid=sale.departmentid
WHERE item.type='e'
AND department.floor=2
GROUP BY item.itemid;

-- task 7 the total quantity sold of each item by the departments on the second floor
SELECT item.name, SUM(saleitem.quantity) AS TOTAL_SALES
FROM item INNER JOIN saleitem INNER JOIN sale INNER JOIN department
ON item.itemid=saleitem.itemid
AND saleitem.saleid=sale.saleid
AND sale.departmentid=department.departmentid
WHERE department.floor=2
GROUP BY item.name
ORDER BY TOTAL_SALES DESC;

-- task 8 the items that are not sold by departments on the second floor but are sold on other floors within the store
SELECT DISTINCT saleitem.itemid, department.floor
FROM sale INNER JOIN saleitem INNER JOIN department
ON sale.saleid = saleitem.saleid
AND sale.departmentid = department.departmentid
WHERE itemid NOT IN
	(SELECT DISTINCT itemid
    FROM sale INNER JOIN saleitem INNER JOIN department
    ON sale.saleid = saleitem.saleid AND sale.departmentid = department.departmentid
    WHERE department.floor = 2)
ORDER BY itemid, department.floor;

-- task 9 the nums and names of the employees who earn more than their manager
SELECT *
FROM employee emp INNER JOIN employee boss
ON emp.bossid = boss.employeeid;

SELECT emp.employeeid, CONCAT(emp.firstname, emp.lastname) AS empName,
emp.salary AS empSal, boss.salary AS bossSal
FROM employee emp INNER JOIN employee boss
ON emp.bossid = boss.employeeid
WHERE boss.salary < emp.salary;

-- task 10 for each department on the second floor, the average salary of the employees
SELECT department.name, FORMAT(AVG(employee.salary), 2) AS AverageSalary
FROM department NATURAL JOIN employee
WHERE floor = 2
GROUP BY department.name;

-- task 11 suppliers that deliver a total quantity of items of types C and N that is greater than 40

-- first, the items that are of type C and N
SELECT item.itemid, item.type
FROM item
WHERE item.type = 'C' OR item.type = 'N'
ORDER BY item.itemid;

-- second, how many of those items have been delivered and quantity is greater than 40
SELECT item.itemid, SUM(deliveryitem.quantity)
FROM deliveryitem NATURAL JOIN item
WHERE item.type IN ('C', 'N')
GROUP BY item.itemid
HAVING SUM(deliveryitem.quantity) > 40;

-- last, the supplier names and ids
SELECT delivery.supplierid, supplier.name, SUM(deliveryitem.quantity)
FROM supplier INNER JOIN delivery INNER JOIN deliveryitem INNER JOIN item
ON supplier.supplierid = delivery.supplierid
AND delivery.deliveryid = deliveryitem.deliveryid
AND deliveryitem.itemid = item.itemid
WHERE item.type IN ('C', 'N')
GROUP BY delivery.supplierid, supplier.name
HAVING SUM(deliveryitem.quantity) > 40;

-- task 12 the average delivery quantity of items of type N made by each company who delivers them.
-- list the supplier id and name, item type and name and average delivery quantity in your ans.
SELECT delivery.supplierid, supplier.name AS supplier, 
item.type, item.name AS Item, FORMAT(AVG(deliveryitem.quantity),2) AS AvgDelQty
FROM supplier INNER JOIN delivery INNER JOIN deliveryitem INNER JOIN item
ON supplier.supplierid = delivery.supplierid
AND delivery.deliveryid = deliveryitem.deliveryid
AND deliveryitem.itemid = item.itemid
WHERE item.type = 'N'
GROUP BY delivery.supplierid, supplier.name, item.name
ORDER BY supplier;

-- task 13 the name and salary of the managers with more than 2 employees
SELECT * FROM employee;

SELECT bossid
FROM employee
GROUP BY bossid
HAVING COUNT(*) > 2;

SELECT CONCAT(employee.firstname, ' ',employee.lastname) AS empName, employee.salary
FROM employee
WHERE employeeid IN
	(SELECT bossid
	FROM employee
	GROUP BY bossid
	HAVING COUNT(*) > 2);

-- task 14 list item names that are delivered by Nepalese Corp 
-- and sold in the Navigation department

-- first, find the itemids that are delivered by Nepalese Corp.
SELECT itemid
FROM deliveryitem NATURAL JOIN delivery NATURAL JOIN supplier
WHERE supplier.name = 'Nepalese Corp.';

-- second, find the itemid that are sold in the Navigation department
SELECT itemid
FROM saleitem NATURAL JOIN sale NATURAL JOIN department
WHERE department.name = 'Navigation';

-- last, combines these two with subqueries
SELECT DISTINCT item.name
FROM item
WHERE itemid IN
	(SELECT itemid
	FROM deliveryitem NATURAL JOIN delivery NATURAL JOIN supplier
	WHERE supplier.name = 'Nepalese Corp.')
AND itemid IN
	(SELECT itemid
	FROM saleitem NATURAL JOIN sale NATURAL JOIN department
	WHERE department.name = 'Navigation');

-- task 15 finds the name and salary of Clare Underwood's manager
SELECT CONCAT(employee.firstname, ' ', employee.lastname) AS Name, salary
FROM employee
WHERE employeeid IN
	(SELECT bossid
    FROM employee
    WHERE employee.firstname = 'Clare'
    AND employee.lastname = 'Underwood');

-- task 16 list the ids of the departments where all of the employees earn less than their manager
SELECT * FROM employee;

SELECT *
FROM employee emp INNER JOIN employee boss
ON emp.bossid = boss.employeeid
WHERE emp.salary >= boss.salary;

SELECT DISTINCT departmentid
FROM employee
WHERE departmentid NOT IN
	(SELECT emp.departmentid
	FROM employee emp INNER JOIN employee boss
	ON emp.bossid = boss.employeeid
	WHERE emp.salary >= boss.salary)
AND employee.bossid IS NOT NULL
ORDER BY departmentid;

-- task 17 find the supplier id and names that deliver both compasses and an item other than compasses
-- attempt 1
SELECT DISTINCT delivery.supplierid, supplier.name
FROM supplier INNER JOIN delivery INNER JOIN deliveryitem INNER JOIN item
ON supplier.supplierid = delivery.supplierid
AND delivery.deliveryid = deliveryitem.deliveryid
AND deliveryitem.itemid = item.itemid
WHERE item.name NOT LIKE 'Compass%'
AND delivery.supplierid IN
	(SELECT supplierid
    FROM delivery NATURAL JOIN deliveryitem NATURAL JOIN item
    WHERE item.name LIKE 'Compass%')
ORDER BY delivery.supplierid;

-- attempt 2
SELECT DISTINCt delivery.supplierid, supplier.name
FROM supplier INNER JOIN delivery INNER JOIN deliveryitem INNER JOIN item
ON supplier.supplierid = delivery.supplierid
AND delivery.deliveryid = deliveryitem.deliveryid
AND deliveryitem.itemid = item.itemid
WHERE delivery.supplierid IN
	(SELECT supplierid
    FROM delivery NATURAL JOIN deliveryitem NATURAL JOIN item
    WHERE item.name LIKE 'Compass%')
GROUP BY delivery.supplierid, supplier.name
HAVING COUNT(DISTINCT item.name) > 1
ORDER BY delivery.supplierID;

-- homework --

-- h1 how many deliveries have there been in the month of July
SELECT * FROM delivery;

SELECT COUNT(deliveryid)
FROM delivery
WHERE Monthname(deliverydate) = 'July';

-- h2 list the names of the tents available for sale
SELECT name
FROM item
WHERE name LIKE '%tent%';

-- h3 what month has had the highest number of sales
SELECT COUNT(saleid), MONTHNAME(saledate)
FROM sale
GROUP BY MONTHNAME(saledate)
ORDER BY COUNT(saleid) DESC
LIMIT 1;

-- h4 list the salary total and employee count for each departmentid. ASC salary.
SELECT SUM(salary), COUNT(employeeid), departmentid
FROM employee
GROUP BY departmentid
ORDER BY SUM(salary);

-- h5 how many sales have been on a Sunday?
SELECT COUNT(saleid)
FROM sale
WHERE DAYNAME(saledate) = 'Sunday';

-- h6 how many days have elapsed between the first delivery date and most reacent delivery date for each supplier
SELECT supplierid, DATEDIFF(MAX(deliverydate), MIN(deliverydate)), COUNT(DISTINCT(deliverydate))
FROM delivery
GROUP BY supplierid;

-- h7
SELECT CONCAT('The ', name, ' department is on floor number ', floor) AS 'Where is each department?'
FROM department;

-- h8 find the minimum, maximum, average and standard deviation for salaries in each department
SELECT departmentid, MIN(salary), MAX(salary), AVG(salary), STDDEV(salary)
FROM employee
GROUP BY departmentid;