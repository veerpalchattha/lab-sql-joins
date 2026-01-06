Use sakila;

SELECT 
    c.name AS category,
    COUNT(fc.film_id) AS number_of_films
FROM category c
JOIN film_category fc 
    ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY number_of_films DESC;

select st.store_id as Store_Id, c.city as City, ct.country as Country from store as st 
JOIN address a ON st.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
JOIN country ct ON c.country_id = ct.country_id;

select s.store_id, sum(amount) as total_revenue from payment as p join staff as 
st on p.staff_id =st.staff_id join store as
s on st.store_id = s.store_id group by s.store_id order by total_revenue DESC;

select c.category_id, avg(length) as running_time from film as f join film_category fc 
on f.film_id = 
fc.film_id join category as c on c.category_id = fc.category_id group by c.category_id
order by running_time desc;

SELECT 
    c.name AS category,
    ROUND(AVG(f.length), 2) AS avg_running_time
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY avg_running_time DESC;

SELECT f.title, COUNT(r.rental_id) AS rental_count FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id GROUP BY f.title
ORDER BY rental_count DESC LIMIT 10;

SELECT f.title, i.store_id, COUNT(i.inventory_id) AS copies_available
FROM film f JOIN inventory i ON f.film_id = i.film_id WHERE f.title = 'ACADEMY DINOSAUR'
AND i.store_id = 1 GROUP BY f.title, i.store_id;

SELECT f.title, 
CASE WHEN IFNULL(COUNT(i.inventory_id), 0) > 0 THEN 'Available'
	ELSE 'NOT available'
END AS availability_status
FROM film f
LEFT JOIN inventory i 
    ON f.film_id = i.film_id
GROUP BY f.film_id, f.title
ORDER BY f.title;