--1. List all customers who live in Texas (use JOINs)
SELECT customer.*
FROM customer
INNER JOIN city ON customer.customer_id = city.city_id
WHERE city.city = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full Name
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS CustomerFullName, p.amount
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
WHERE p.amount > 6.99;

select * from customer;

--3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 175
);

--4. List all customers that live in Nepal (use the city table)
SELECT customer.*
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
WHERE city.country_id = '66'; -- Useing the actual country code for Nepal

--OR

SELECT customer.*
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
WHERE city.city = 'Nepal';


--5. Which staff member had the most transactions?
SELECT staff.staff_id, staff.first_name, staff.last_name, COUNT(payment.payment_id) AS transaction_count
FROM staff
JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id, staff.first_name, staff.last_name
ORDER BY transaction_count desc;

--6. How many movies of each rating are there?
SELECT rating, COUNT(*) AS movie_count
FROM film
GROUP BY rating;

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT customer.*
FROM customer
WHERE customer.customer_id IN (
    SELECT payment.customer_id
    FROM payment
    WHERE payment.amount > 6.99
    GROUP BY payment.customer_id
    HAVING COUNT(payment.payment_id) = 1
);


--8. How many free rentals did our stores give away?
SELECT COUNT(*) AS free_rentals_count
FROM rental
JOIN film ON rental.rental_id = film.film_id
WHERE film.rental_rate = 0.00;









