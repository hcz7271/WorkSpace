USE oandl;

-- Q1. How many orders has Carl Bach had delivered to each of his addresses?
-- List the full address details and the delivery count.
SELECT CONCAT(a.address1, ' ', a.address2) AS address,
COUNT(o.id) AS deliveryCount
FROM orders o NATURAL JOIN clients c NATURAL JOIN address a
WHERE c.firstname = 'carl'
AND c.lastname = 'bach'
GROUP BY address;

-- Q2. List the client name, and their name character length. Order the result by shortest
-- length to longest length.
SELECT DISTINCT CONCAT(firstname, ' ', lastname) AS clientName,
(LENGTH(firstname)+LENGTH(lastname)) AS nameLen
FROM clients
ORDER BY nameLen;

-- Q3. List the clients who have been charged for produce that has not been shipped
-- (delivered) to them. List the clients and the amount charged for the undelivered
-- produce.
SELECT DISTINCT o.clientid,(l.qty * f.price) AS amountCharged
FROM orders o INNER JOIN lineitem l INNER JOIN fandv f
ON o.id = l.orderid
AND l.fruitvegid = f.id
WHERE l.shipped = 'n';


-- 4. List the names of the produce that was previously available to order, but is currently
-- not available.
SELECT * FROM fandv;

SELECT name
FROM fandv
WHERE priceend is null
AND name IN
	(SELECT name
    FROM fandv
    WHERE priceend is not null)
ORDER BY name;



-- 5. List the produce that has been available all of the time but has never been ordered.

SELECT id
FROM fandv
WHERE id IN
	(SELECT id
	FROM fandv
	WHERE priceend IS NOT NULL
	AND name NOT IN
		(SELECT DISTINCT name
		FROM fandv
		WHERE priceend is null))
AND id NOT IN
	(SELECT DISTINCT fruitvegid
    FROM lineitem);


-- 6. List the trade clients who have spent less than $6000 on produce orders in the month
-- of September. List the client's trade name and monthly cost. Order the result by trade
-- name in alphabetical order

SELECT c.clientid, c.tradingname, SUM(l.qty * f.price) AS monthlyCost
FROM clients c INNER JOIN orders o INNER JOIN lineitem l INNER JOIN fandv f
ON c.clientid = o.clientid
AND o.id = l.orderid
AND l.fruitvegid = f.id
WHERE MONTHNAME(o.orderdate) = 'september'
AND c.type = 'trade'
GROUP BY c.clientid
HAVING monthlyCost < 6000
ORDER BY c.tradingname;

SELECT * FROM clients;

-- 7. List all customers of St Clement's, and their total cost in orders per calendar month.
-- List the client name, their monthly order cost, and calendar month name.
SELECT * FROM orders;

SELECT CONCAT(c.firstname, ' ', c.lastname) AS clientName,
MONTHNAME(o.orderdate) AS monthName,
SUM(l.qty * f.price) AS monthlyCost
FROM clients c INNER JOIN orders o INNER JOIN lineitem l INNER JOIN fandv f
ON c.clientid = o.clientid
AND o.id = l.orderid
AND l.fruitvegid = f.id
GROUP BY clientName, monthName
ORDER BY clientName, monthName;


-- 8. Who has ordered the most lemons and who has ordered the most limes ? List the
-- client(s) and the quantity of lemons and limes.
(SELECT CONCAT(c.firstname, ' ',c.lastname) AS clientName,
c.tradingname, SUM(l.qty) AS totalSum
FROM clients c INNER JOIN orders o INNER JOIN lineitem l INNER JOIN fandv f
ON c.clientid = o.clientid AND o.id = l.orderid AND l.fruitvegid = f.id
WHERE f.name LIKE '%lemon%'
GROUP BY o.clientid
ORDER BY totalSum DESC
LIMIT 1)
UNION
(SELECT CONCAT(c.firstname, ' ',c.lastname) AS clientName,
c.tradingname, SUM(l.qty) AS totalSum
FROM clients c INNER JOIN orders o INNER JOIN lineitem l INNER JOIN fandv f
ON c.clientid = o.clientid AND o.id = l.orderid AND l.fruitvegid = f.id
WHERE f.name LIKE '%lime%'
GROUP BY o.clientid
ORDER BY totalSum DESC
LIMIT 1);
