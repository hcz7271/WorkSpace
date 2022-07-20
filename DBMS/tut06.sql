use labs2018;

SELECT * FROM department;
SELECT * FROM employee;

-- formatting & rounding
SELECT AVG(salary) as AVG_SAL
FROM employee;

SELECT FORMAT(AVG(salary),2) AS AVG_SAL
FROM employee;

SELECT ROUND(AVG(salary),2) AS AVG_SAL
FROM employee;

-- natural join
SELECT department.name,employee.firstname,employee.lastname
FROM employee NATURAL JOIN department;

SELECT name,firstname,lastname
FROM employee NATURAL JOIN department;

SELECT itemid,departmentid
FROM item NATURAL JOIN department;

-- inner join
SELECT name,firstname,lastname
FROM department INNER JOIN employee
ON department.departmentid=employee.departmentid;

-- task 1
SELECT name,firstname,lastname
FROM department NATURAL JOIN employee
ORDER BY name;

SELECT name as Department_name,
CONCAT(firstname, ' ',lastname) AS Employee_name
FROM department NATURAL JOIN employee
ORDER BY name;

SELECT name as Department_name,
CONCAT(firstname, ' ',lastname) AS Employee_name
FROM department INNER JOIN employee
ON department.departmentid=employee.departmentid
ORDER BY name;

-- task 2 
SELECT firstname,lastname
FROM employee NATURAL JOIN department
WHERE name='management';

-- task3
SELECT * FROM supplier;

SELECT * FROM delivery;

SELECT * FROM supplier NATURAL JOIN delivery;

SELECT supplier.name, COUNT(delivery.deliveryid) as numDeliveries
FROM supplier NATURAL JOIN delivery
GROUP BY supplier.name;

-- subquery
SELECT min(salary),departmentid
FROM employee;

SELECT min(salary)
FROM employee
WHERE departmentid=1;

SELECT min(salary),departmentid
FROM employee
GROUP BY departmentid;

SELECT min(salary)
FROM employee;

SELECT departmentid
FROM employee
WHERE salary=41000;

SELECT departmentid
FROM employee
WHERE salary=
	(SELECT min(salary)
    FROM employee);

-- task 4 How many employees work in departments located on the 5th floor
SELECT departmentid
FROM department
WHERE floor=5;

SELECT COUNT(employeeid)
FROM employee
WHERE departmentid IN
	(SELECT departmentid
    FROM department
    WHERE floor=5);
    
-- multiple table joins
-- task 5 find the sale dates of all types of tents
SELECT * FROM sale;
SELECT * FROM saleitem;
SELECT * FROM item;

SELECT * FROM item NATURAL JOIN saleitem NATURAL JOIN sale;

SELECT item.name,sale.saledate,sum(saleitem.quantity)
FROM item NATURAL JOIN saleitem NATURAL JOIN sale
WHERE item.name like 'TENT%'
GROUP BY item.name,sale.saledate;

SELECT item.name,sale.saledate,SUM(saleitem.quantity)
FROM item INNER JOIN saleitem INNER JOIN sale
ON item.itemid=saleitem.itemid
AND saleitem.saleid=sale.saleid
WHERE item.name LIKE 'TENT%'
GROUP BY item.name,sale.saledate;

-- having clause
-- task 6
SELECT * FROM department NATURAL JOIN employee
GROUP BY department.name;

SELECT department.name,COUNT(employee.employeeid)
FROM department NATURAL JOIN employee
GROUP BY department.name
HAVING COUNT(employee.employeeid)>2;

-- task 7 find the item id's sold by at least two departments on the 2nd floor
SELECT DISTINCT itemid
FROM sale INNER JOIN saleitem INNER JOIN department
ON sale.saleid=saleitem.saleid
AND sale.departmentid=department.departmentid
WHERE department.floor=2
GROUP BY itemid
HAVING COUNT(DISTINCT(department.departmentid))>1;

SELECT DISTINCT itemid
FROM sale INNER JOIN saleitem INNER JOIN department
ON sale.saleid=saleitem.saleid
AND department.departmentid=sale.departmentid
WHERE department.departmentid IN
	(SELECT departmentid
    FROM department
    WHERE department.floor=2)
GROUP BY itemid
HAVING COUNT(DISTINCT(department.departmentid))>1
ORDER BY itemid;

-- task 8 the departments that have an average salary over $55000
SELECT departmentid, AVG(employee.salary)
FROM employee
GROUP BY departmentid
HAVING AVG(employee.salary)>55000;

SELECT departmentid, 
FORMAT(AVG(employee.salary),2) AS AverageSalary
FROM employee
GROUP BY departmentid
HAVING AVG(employee.salary)>55000;

-- task 9 the name of items which have only been delivered by exactly one supplier
SELECT * FROM deliveryitem;
SELECT * FROM delivery;
SELECT * FROM item;

SELECT * FROM deliveryitem INNER JOIN item WHERE deliveryitem.itemid=item.itemid;


SELECT item.Name,COUNT(DISTINCT(supplierid)) AS supplierCount
FROM deliveryitem INNER JOIN delivery INNER JOIN item
ON deliveryitem.deliveryid=delivery.deliveryid
AND deliveryitem.itemid=item.itemid
GROUP BY item.name
HAVING COUNT(DISTINCT(supplierid))=1
ORDER BY item.name;

-- task 10
SELECT supplier.supplierid, supplier.name
FROM supplier INNER JOIN delivery INNER JOIN deliveryitem
ON supplier.supplierid=delivery.supplierid
AND delivery.deliveryid=deliveryitem.deliveryid
GROUP BY supplier.supplierid
HAVING COUNT(DISTINCT deliveryitem.itemid)>=10;

-- task 11
SELECT DISTINCT(item.name),item.type,sale.departmentid,department.floor
FROM item INNER JOIN saleitem INNER JOIN sale INNER JOIN department
ON item.itemid=saleitem.itemid
AND saleitem.saleid=sale.saleid
AND sale.departmentid=department.departmentid
ORDER BY item.name,sale.departmentid;

-- task 12
SELECT DISTINCT(item.name)
FROM item
WHERE itemid IN
	(SELECT itemid
    FROM deliveryitem NATURAL JOIN delivery NATURAL JOIN supplier
    WHERE supplier.name='Nepalese Corp.')
OR itemid IN
	(SELECT itemid
    FROM saleitem NATURAL JOIN sale NATURAL JOIN department
    WHERE department.name='Navigation');

-- union clause
SELECT DISTINCT(item.name)
FROM item
WHERE itemid IN
	(SELECT itemid
    FROM deliveryitem NATURAL JOIN delivery NATURAL JOIN supplier
    WHERE supplier.name='Nepalese Corp.')
UNION
	(SELECT itemid
    FROM saleitem NATURAL JOIN sale NATURAL JOIN department NATURAL JOIN item
    WHERE department.name='Navigation');