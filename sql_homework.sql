-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT last_name, count(*) 
FROM actor 
WHERE  last_name LIKE 'Wahlberg'
GROUP BY last_name;

-- 					  Answer:
				last_name|count|
				---------+-----+
				Wahlberg |    2|


-- 2. How many payments were made between $3.99 and $5.99?
SELECT count(*) 
FROM payment  
WHERE amount BETWEEN '3.99' AND '5.99';



-- 					Answer:
				count|
				-----+
				 5607|


-- 3. What films have exactly 7 copies? (search in inventory)
SELECT film_id, count(*)
FROM inventory
WHERE film_id = 7
GROUP BY film_id;


--					Answer:
				film_id|count|
				-------+-----+
				      7|    5|


 
 
-- 4. How many customers have the first name ‘Willie’
 SELECT first_name, count(*)  
 FROM customer
 WHERE first_name  = 'Willie'
GROUP BY first_name;

-- 						Answer:
				first_name|count|
				----------+-----+
				Willie    |    2|
 
 
-- 5. What store employee (get the id) sold the most rentals (use the rental table)?
SELECT staff_id, count(rental_id) AS rented
FROM rental
GROUP by staff_id
ORDER BY rented DESC 
LIMIT 1;

--					Answer:
--
--				staff_id|rented|
--				--------+------+
--				       1|  8040|
 
 
 
-- 6. How many unique district names are there?
SELECT count(DISTINCT district)
FROM address;

--					Answer:

--				count|
--				-----+
--				  378|

 
 
-- 7. What film has the most actors in it? (use film_actor table and get film_id)
 	
 SELECT film_id, count(actor_id) 
 FROM film_actor
 GROUP BY film_id
 ORDER BY count(actor_id) DESC
 LIMIT 1;

--					Answer:
--
--				film_id|count|
--				-------+-----+
--				    508|   15|
 
 
-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT store_id, count(last_name)
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es'
GROUP BY store_id;

-- 					Answer:

--				store_id|count|
--				--------+-----+
--				       1|   13|


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT amount, count(customer_id)
FROM payment
WHERE amount <= 4.99 AND customer_id BETWEEN 380 AND 430
GROUP BY amount  
HAVING count(customer_id) >= 250;

--					Answer:

--				amount|count|
--				------+-----+
--				  2.99|  290|
--				  4.99|  281|
--				  0.99|  269|


--10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
SELECT DISTINCT rating, count(film_id)
FROM film
GROUP BY rating
ORDER BY count(film_id) DESC;


--					Answer:
--
--				rating|count|
				------+-----+
--				PG-13 |  223|
--				NC-17 |  210|
--				R     |  195|
--				PG    |  194|
--				G     |  178|