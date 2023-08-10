USE Sakila;

-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT category_id, COUNT(f.film_id)
FROM film f
JOIN film_category c
USING (film_id)
GROUP BY c.category_id;

-- Display the total amount rung up by each staff member in August of 2005.
SELECT s.staff_id, s.first_name, s.last_name, SUM(p.amount)
FROM staff s
JOIN payment p
USING (staff_id)
WHERE MONTH(p.payment_date) = 8 AND YEAR(p.payment_date) = 2005
GROUP BY s.staff_id;

-- Which actor has appeared in the most films?
SELECT a.first_name, a.last_name, COUNT(film_id)
FROM actor a 
JOIN film_actor f
USING (actor_id)
GROUP BY actor_id;

-- Most active customer (the customer that has rented the most number of films)
SELECT c.first_name, c.last_name, count(rental_id) as rentals
FROM customer c
JOIN rental r
USING (customer_id)
GROUP BY c.customer_id
ORDER BY rentals DESC
LIMIT 1;


-- Display the first and last names, as well as the address, of each staff member
SELECT s.first_name, s.last_name, a.address
FROM address a
JOIN staff s
USING (address_id);

-- List each film and the number of actors who are listed for that film.
SELECT title, COUNT(actor_id) as actors
FROM film as f
LEFT JOIN film_actor as fa
USING (film_id)
GROUP BY film_id
ORDER BY actors desc;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.last_name, c.first_name, SUM(p.amount) as sum
FROM customer c
JOIN payment p
USING (customer_id)
GROUP BY c.customer_id
ORDER BY last_name;

-- List the titles of films per category.
SELECT GROUP_CONCAT(c.name) AS category_ids
FROM film f
JOIN film_category f_c
USING (film_id)
JOIN category c
USING (category_id)
GROUP BY f.title;