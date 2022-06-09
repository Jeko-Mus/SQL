-- Exercise 1
SELECT F.film_id, title, description, release_year, C.name, C.category_id
FROM film as F
JOIN film_category as FC ON F.film_id = FC.film_id
JOIN category AS C ON C.category_id = FC.category_id;


-- Exercise 2
SELECT C.customer_id, first_name, last_name, A.address, Ci.city, Co.country
FROM customer as C
JOIN address as A ON C.address_id = A.address_id
JOIN city AS Ci ON A.city_id = Ci.city_id
JOIN country AS Co ON Ci.country_id = Co.country_id;


-- Exercise 3
SELECT P.payment_id, P.payment_date, C.customer_id, C.first_name || ' ' || C.last_name AS customer_name, 
		S.first_name as Staff_member, R.rental_date, R.return_date
FROM payment as P
JOIN customer as C ON P.customer_id = C.customer_id
JOIN staff AS S ON P.staff_id = S.staff_id
JOIN rental AS R ON P.rental_id = R.rental_id;


-- Exercise 4
SELECT F.film_id, F.title, A.first_name, A.last_name,
COUNT(A.actor_id)
FROM film as F
JOIN film_actor as FA ON F.film_id = FA.film_id
JOIN actor AS A ON FA.actor_id = A.actor_id
GROUP BY F.film_id,
		A.first_name, 
		A.last_name;


-- Exercise 5
SELECT S.store_id, S.first_name, S.last_name, A.address, C.city
FROM staff as S
JOIN address as A ON S.address_id = A.address_id
JOIN city as C ON A.city_id = C.city_id;


-- Exercise 6
SELECT P.staff_id, S.first_name || ' ' || S.last_name AS full_name,
	COUNT(rental_id) AS num_movies,
	(COUNT(rental_id) - 5000) AS extra_movies,
	(COUNT(rental_id) - 5000)*0.1 AS total_bonus
	
FROM staff as S
JOIN payment as P ON S.staff_id = P.staff_id
GROUP BY 
	P.staff_id,
	S.first_name,
	S.last_name;
