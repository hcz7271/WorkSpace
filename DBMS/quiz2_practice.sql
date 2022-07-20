USE oandl;

SELECT * FROM address;
SELECT * FROM clients;
SELECT * FROM fandv;
SELECT * FROM lineitem;
SELECT * FROM orders;

-- Practice 1 --

-- Q1. List all 'reatil' client names (firstname and lastname) in alphabetical (lastname) order
SELECT firstname, lastname
FROM clients
WHERE type = 'retail'
ORDER BY lastname;

-- Q2. List the names of all types of radish ever supplied by St Clemment's
SELECT DISTINCT name
FROM fandv
WHERE name LIKE '%radish%';

-- Q3. How many orders have been delivered to 400 Degrees Pizza Essendon?
-- List the trading name and order count.
SELECT tradingname, COUNT(orders.id)
FROM orders NATURAL JOIN clients
WHERE tradingname = '400 Degrees Pizza Essendon'
GROUP BY tradingname;

SELECT tradingname, COUNT(orders.id)
FROM clients INNER JOIN orders
ON clients.clientid = orders.clientid
WHERE tradingname = '400 Degrees Pizza Essendon'
GROUP BY tradingname;

-- Q4. List ALL contact names and the number of orders for each contact name.
-- Order the list from highest to lowest count.
SELECT IFNULL(contactname, 'No Contact name') AS Contact, COUNT(id) AS Order_Num
FROM orders
GROUP BY contactname
ORDER BY Order_Num DESC;

-- Q5. How many trade orders contain organic produce?
-- List the produce name, its price(or prices), and the total number or orders.
-- Order the result by produce name.
SELECT * FROM fandv WHERE name LIKE '%organic%';

SELECT DISTINCT name, price, COUNT(o.id) as total_order
FROM fandv f INNER JOIN lineitem l INNER JOIN orders o INNER JOIN clients c
ON f.id = l.fruitvegid
AND l.orderid = o.id
AND o.clientid = c.clientid
WHERE f.name LIKE '%organic%'
AND c.type = 'trade'
GROUP BY name, price
ORDER BY name;


-- Pratice 2 --

-- Q1.What is the longest grocery name?
SELECT name, LENGTH(name)
FROM fandv
ORDER BY LENGTH(name) DESC
LIMIT 1;

-- answer
SELECT DISTINCT name, LENGTH(name)
FROM fandv
WHERE LENGTH(name) =
	(SELECT MAX(LENGTH(name))
    FROM fandv);

-- Q2.Name the produce that has had two distinct prices. Order the list alphabetically
SELECT DISTINCT name
FROM fandv
GROUP BY name
HAVING COUNT(price) = 2;

-- answer
SELECT name
FROM fandv
GROUP BY name
HAVING COUNT(DISTINCT(price)) = 2
ORDER BY name;

-- Q3.List the name of all clients, their order count,who have placed fewer than 15 orders in total.
-- Order the result set from highest number of orders to the lowest.
SELECT CONCAT(firstname, ' ', lastname, ' ', tradingname) AS clientName, COUNT(id) AS orderCount
FROM orders INNER JOIN clients
ON orders.clientid = clients.clientid
GROUP BY clientName
HAVING orderCount < 15
ORDER BY orderCount DESC;

-- ans

-- Q4.Which customer has ordered the most mint(of anytype)?
SELECT c.firstname, c.lastname, c.tradingname, SUM(l.qty) AS totalSum
FROM clients c INNER JOIN orders o INNER JOIN lineitem l
ON c.clientid = o.clientid AND o.id = l.orderid
WHERE l.fruitvegid IN
	(SELECT fandv.id
    FROM fandv
    WHERE fandv.name LIKE '%mint_')
GROUP BY o.clientid
ORDER BY totalSum DESC
LIMIT 1;

-- ans
SELECT c.tradingname, c.firstname, c.lastname, SUM(qty)
FROM clients c INNER JOIN orders o INNER JOIN lineitem l INNER JOIN fandv f
ON c.clientid = o.clientid
AND o.id = l.orderid
AND l.fruitvegid = f.id
WHERE f.name LIKE '%mint_'
GROUP BY o.clientid, c.tradingname, c.firstname, c.lastname
ORDER BY SUM(qty) DESC
LIMIT 1;

SELECT DISTINCT f.name, c.firstname, c.lastname, c.tradingname, SUM(qty) AS Total_Sum, f.unit
FROM clients c INNER JOIN orders o INNER JOIN lineitem l INNER JOIN fandv f
ON c.clientid = o.clientid
AND o.id = l.orderid
AND l.fruitvegid = f.id
WHERE f.name LIKE '%mint_'
GROUP BY c.firstname, c.lastname, c.tradingname, f.name, f.unit
HAVING Total_Sum >= ALL 
	(SELECT SUM(qty)
    FROM clients c INNER JOIN orders o INNER JOIN lineitem l INNER JOIN fandv f
	ON c.clientid = o.clientid
	AND o.id = l.orderid
	AND l.fruitvegid = f.id
	WHERE f.name LIKE '%mint_'
	GROUP BY c.firstname, c.lastname, c.tradingname, f.name, f.unit);

-- Q5.How much did Fried and Tasty spend on birdseye chilli in September 2020? 
SELECT c.tradingname, SUM(l.qty * f.price) AS Cost
FROM clients c INNER JOIN orders o INNER JOIN lineitem l INNER JOIN fandv f
ON c.clientid = o.clientid
AND o.id = l.orderid
AND l.fruitvegid = f.id
WHERE c.tradingname LIKE '%Fried and Tasty%' 
AND f.name LIKE '%birdseye chilli%'
AND MONTHNAME(o.orderdate) = 'September'
AND MONTHNAME(f.priceend) = 'September'
GROUP BY c.clientid;

-- ans
SELECT name, SUM(price * qty) AS COST
FROM clients c INNER JOIN orders o INNER JOIN lineitem l INNER JOIN fandv f
ON c.clientid = o.clientid
AND o.id = l.orderid
AND l.fruitvegid = f.id
WHERE c.tradingname LIKE '%Fried and Tasty%'
AND f.name LIKE '%birdseye chilli%'
AND o.orderdate BETWEEN '2020-09-01' AND '2020-09-30'
GROUP BY name;


-- Practice 3 --

-- Q1. Write an SQL query listing the trading name of trade clients. Order the list by trading name then
-- postcode
SELECT TradingName
FROM clients NATURAL JOIN address
WHERE type = 'trade'
ORDER BY tradingname, postcode;

-- ans
SELECT tradingname, address.postcode
FROM clients INNER JOIN address
ON clients.clientid = address.clientid
WHERE clients.type = 'Trade'
ORDER BY clients.tradingname, address.postcode;

-- Q2. What was the total cost of the order placed on Friday in August 2020 for the East Brunswick
-- Hotel? List the orderdate and total cost.
SELECT * FROM clients;
SELECT * FROM orders;

SELECT orderDate, SUM(qty * price) AS totalCost
FROM orders INNER JOIN lineitem INNER JOIN fandv
ON orders.id = lineitem.orderid
AND lineitem.fruitvegid = fandv.id
WHERE MONTHNAME(orderdate) = 'august'
AND DAYNAME(orderdate) = 'friday'
AND orders.clientid IN
	(SELECT clientid
    FROM clients
    WHERE tradingname = 'east brunswick hotel')
GROUP BY orderdate;

-- ans
SELECT o.orderdate, SUM(qty * price) as AMOUNT
FROM Orders o INNER JOIN Lineitem l INNER JOIN Fandv f
INNER JOIN Clients c
ON o.id = l.orderid AND l.fruitvegid = f.id
AND c.clientid = o.clientid
WHERE c.tradingname = 'East Brunswick Hotel'
AND monthname(o.orderdate) = 'August'
AND dayname(o.orderdate) = 'Friday'
GROUP BY o.orderdate;

-- Q3. Has any produce been ordered in October 2020 but not in November 2020? List the produce
-- name in alphabetical order and omit duplicates.
SELECT * FROM orders;

SELECT DISTINCT f.name AS produce
FROM fandv f INNER JOIN lineitem l INNER JOIN orders o
ON f.id = l.fruitvegid
AND l.orderid = o.id
WHERE MONTHNAME(o.orderdate) = 'october'
AND f.name NOT IN
	(SELECT f.name
    FROM fandv f INNER JOIN lineitem l INNER JOIN orders o
    ON f.id = l.fruitvegid
	AND l.orderid = o.id
    WHERE MONTHNAME(o.orderdate) = 'november')
ORDER BY f.name;

-- ans
SELECT DISTINCT f.name
FROM Fandv f INNER JOIN Lineitem l INNER JOIN Orders o
ON f.id = l.fruitvegid AND l.orderid = o.id
WHERE monthname(o.orderdate) = 'October'
AND f.name NOT IN
	(SELECT f.name
	FROM Fandv f INNER JOIN Lineitem l INNER JOIN Orders o
	ON f.id = l.fruitvegid AND l.orderid = o.id
	WHERE monthname(o.orderdate) = 'November')
ORDER BY f.name;


-- Q4. How many kilograms in total of Dill have been delivered on Thursday - but not ordered on
-- Thursday? Assume that each packet of dill weighs 100 grams (1000 grams = 1 kilogram). List the
-- product name, total cost and total weight in kilograms.
SELECT * FROM fandv
WHERE name like '%dill%';

SELECT f.name, SUM(qty*price) AS totalCost, SUM(qty*0.1) AS totalWeight
FROM fandv f INNER JOIN lineitem l INNER JOIN orders o
ON f.id = l.fruitvegid
AND l.orderid = o.id
WHERE DAYNAME(o.deliverydate) = 'thursday'
AND DAYNAME(o.orderdate) != 'thursday'
AND f.name LIKE '%dill%'
GROUP BY f.name;

-- ans
SELECT f.name, ROUND(SUM((l.qty/10)),1) as Kilos
FROM Fandv f INNER JOIN Lineitem l INNER JOIN Orders o
ON f.id = l.fruitvegid AND l.orderid = o.id
WHERE DAYNAME(o.deliverydate) = 'Thursday'
AND f.name like '%Dill%'
AND o.orderdate NOT IN
	(SELECT o.orderdate
	FROM Fandv f INNER JOIN Lineitem l INNER JOIN Orders o
	ON f.id = l.fruitvegid AND l.orderid = o.id
	WHERE DAYNAME(o.orderdate) != 'Thursday'
	AND f.name = '%Dill%')
GROUP BY f.name;

-- Q5. List the produce names that contain the word Australia but do not list the origin as Australia.
-- Write two versions of this SQL, one using a subquery and one version without a subquery
SELECT DISTINCT name AS produce
FROM fandv
WHERE name LIKE '%australia%'
AND origin != 'australia'
ORDER BY produce;

SELECT DISTINCT name AS produce
FROM fandv
WHERE name LIKE '%australia%'
AND name NOT IN
	(SELECT DISTINCT name
    FROM fandv
    WHERE origin = 'australia')
ORDER BY produce;

-- ans 
SELECT DISTINCT name, origin
FROM fandv
WHERE name like '%Australia%'
AND ORIGIN NOT IN
	(SELECT origin
	FROM fandv
	WHERE origin = 'Australia');