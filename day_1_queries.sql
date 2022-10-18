 -- "Hello World" of SQL - Select all records from a table
 -- only use 'single quotes' for strings "double quotes" will go through columns
 
 SELECT * -- *  means ALL columns
 FROM actor;
 

-- Query specific columns - SELECT column_name, ... FROM table_name
SELECT first_name, last_name  -- can switch POSITION the TABLE will CHANGE AND SHOW first_name  AFTER last_name IF you DO that.
FROM actor;

--GET ALL ROWS AND COLUMNS FROM the film tables
SELECT *
FROM film;

-- Filter rows - use a WHERE clause - always comes after the FROM 
SELECT *
FROM actor
WHERE first_name = 'Nick';

-- To set up Patterns we can use LIKE of there are no % or ( _ ) it functions like =
SELECT *
FROM actor
WHERE first_name LIKE 'Nick';

-- Using the LIKE operator with % - % acts like a wildcard - can be any number of characters (0-infinity)
SELECT *
FROM actor
WHERE first_name LIKE 'J%'; -- RETURN ANY record that has a first_name that starts WITH a J

-- Using the LIKE operator with _ - _ acts like a wildcard for 1 and only 1 character
SELECT *
FROM actor
WHERE first_name LIKE '_i_'; -- ANY record that has a first_name OF 3 letters WITH 2nd letter being 

-- Use percent and _ in same pattern
SELECT *
FROM actor
WHERE first_name LIKE '_i%'; -- RETURNS a broader list AFTER the i 

-- Using And and Or in our WHERE clause
-- OR - only one needs to be TRUE
SELECT *
FROM actor
WHERE first_name LIKE 'N%' OR last_name LIKE 'w%';



-- AND - all conditions need to be TRUE 
SELECT *
FROM actor
WHERE first_name LIKE 'N%' AND last_name LIKE 'W%'; -- CASE matters IF you look FOR 'w%' it wont register anything

-- Comparing operators in SQL:
--GREATER Than (>) - Less Than (<)
--Greater Than OR equal TO (>=) Less Than OR equal TO (<=)
--Equal (=) -- Not Equal (<>)


-- Explore Data with SELECT All Query (Specific to changing into new table)
SELECT *
FROM payment;

-- Query for data that shows customers who paid
-- an amount greater than $4
SELECT customer_id, amount
FROM payment 
WHERE amount > 4;

SELECT customer_id, amount
FROM payment 
WHERE amount > '4';


--query FOR ALL payments that ARE NOT 7.99
SELECT customer_id, amount
FROM payment
WHERE amount <> '7.99';

--GET ALL the payments BETWEEN $3 AND $8 (inclusive)
SELECT *
FROM payment 
WHERE amount >= 3 AND amount <=8;

--BETWEEN/AND clause
SELECT *
FROM payment 
WHERE amount BETWEEN 3 AND 8;

-- ORDER our ROWS OF DATA BY USING the ORDER BY clause(DEFAULT ascending)
SELECT *
FROM payment 
WHERE amount BETWEEN 3 AND 8
ORDER BY payment_date;

-- to order in descending order use the order by clause + DESC
SELECT *
FROM payment 
WHERE amount BETWEEN 3 AND 8
ORDER BY amount DESC;

-- ORDERING BY strings - Alphabetical
SELECT *
FROM actor 
ORDER BY last_name; -- Use DESC IF you want TO START FROM 'Z'


-- SQL Aggregations => SUM(), AVG(),COUNT(),MIN(),MAX()
-- takes in a column_name as an argument and returns a value


-- Get the sum of all of the payments
SELECT sum(amount)
FROM payment;

-- Get the sum of all payments of more than $5
SELECT sum(amount)
FROM payment
WHERE amount >5;

-- Get the average of all the payments of more than $5
SELECT avg(amount)
FROM payment
WHERE amount >5;

-- Get the count of all the payments more than $5
SELECT COUNT(amount)
FROM payment
WHERE amount >5;	-- doesnt matter IF you put a Column_name IN the SELECT since count looks AT the ROWS so you can just SELECT *


-- Get the min and max of payments - also alias the column name
SELECT min(amount) AS lowest_amount_paid
FROM payment;


SELECT max(amount) AS highest_amount_paid
FROM payment;


-- Calculate a column based on the other two columns
SELECT payment_id, rental_id, payment_id - rental_id AS difference    	-- IF you want TO see what IS actually going ON you need KEY, KEY, THEN whats going ON 
FROM payment;


-- Query the number OF payments per amount
 SELECT count(*)
 FROM payment 
 WHERE amount =4.99;
 

-- GROUP BY clause - used with Aggregations
SELECT amount, count(*), SUM(amount), AVG(amount)
FROM payment
GROUP BY amount;


-- Columns from the table must also be used in the GROUP BY
SELECT amount, customer_id, count(*)
FROM payment
GROUP BY amount;  							--  ERROR: column "payment.customer_id" must appear in the GROUP BY clause or be used in an aggregate FUNCTION

-- Query the payment table to display the customers who have spent the most (aka order the sum(amount))
SELECT customer_id, SUM(amount)
FROM payment 
GROUP BY customer_id
ORDER BY SUM(amount);

SELECT * FROM payment ORDER BY customer_id;

-- Alias our aggregation column and use aliased name in ORDER BY 
SELECT customer_id, SUM(amount) AS total_spent
FROM payment 
GROUP BY customer_id
ORDER BY total_spent DESC;


-- HAVING clause => HAVING IS TO GROUP BY/arggregations AS WHERE IS TO SELECT 
 

-- Query the payment table to display the customers who have spent the most having made at least 40 payments
SELECT customer_id, SUM(amount) AS total_spent
FROM payment 
GROUP BY customer_id
HAVING count(*) >= 40
ORDER BY total_spent DESC;

-- LIMIT AND OFFSET clause

-- LIMIT  - limit the number of rows that are returned
SELECT *
FROM film 
LIMIT 10;

-- OFFSET  - start your rows after a certain amount using OFFSET
SELECT *
FROM actor
OFFSET 10;  --SKIP OVER THE FIRST TEN ROWS

-- put together
SELECT *
FROM actor 
OFFSET 10
LIMIT 10;   -- Will OFFSET AND LIMIT IN the ORDER given


-- Putting all the clauses into one queary
-- Display customers 11-20 who have spent the most in under 20 payments and has a customer_id > 350
SELECT customer_id, sum(amount),count(*)
FROM payment
WHERE customer_id > 350
GROUP BY customer_id 
HAVING count(*) <20
ORDER BY sum(amount)
OFFSET 10
LIMIT 10;


-- Syntax order (SELECT and FROM  are the only madatory keywords)
		--	SELECT
		--	FROM
		--	JOIN
		--	ON 
		--	WHERE 
		--	GROUP BY 
		--	HAVING
		--	ORDER BY
		--	OFFSET 
		--	LIMIT 