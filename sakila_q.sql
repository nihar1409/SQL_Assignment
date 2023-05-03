USE sakila;

# Which actors have the first name 'Scarlett'.
SELECT *
FROM actor
WHERE first_name = "Scarlett";

# Which actors have the last name 'Johansson'.
SELECT *
FROM actor
WHERE last_name = "Johansson";

# How many distinct actors' last names are there?
SELECT COUNT(DISTINCT(last_name))
FROM actor;

# Which last names are not repeated?
SELECT last_name, Count(last_name)
FROM actor
group by last_name
HAVING COUNT(last_name) = 1;

# Which last names appear more than once?
SELECT last_name, COUNT(last_name)
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

# Which actor has appeared in the most films?
SELECT actor.first_name, actor.last_name, COUNT(*) as film_count
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY film_count DESC
LIMIT 1;

# What is the average length of all the films in the sakila DB?
SELECT AVG(length)
FROM film;

# What is the average length of films by category?
SELECT category.name as category, ROUND(AVG(film.length),2) as average_length
FROM category
INNER JOIN film_category
ON category.category_id = film_category.category_id
INNER JOIN film
ON film.film_id = film_category.film_id
GROUP BY category;

# Which film categories are long? (compare with avg length).
SELECT category.name as category, ROUND(AVG(film.length),2) as average_length
FROM category
INNER JOIN film_category
ON category.category_id = film_category.category_id
INNER JOIN film
ON film.film_id = film_category.film_id
GROUP BY category
HAVING average_length > 120;

