
SELECT * FROM crosstab(
    'WITH film_inventory_join AS (
        SELECT f.rating, i.inventory_id, i.film_id
        FROM film f
        LEFT JOIN inventory i ON f.film_id = i.inventory_id
    ),
    film_inventory_rental_join AS (
        SELECT fi.*, r.customer_id, r.rental_date, r.return_date 
        FROM film_inventory_join fi
        LEFT JOIN rental r ON fi.inventory_id = r.inventory_id
    )
    SELECT customer_id::text, rating, COUNT(rating)::int
    FROM film_inventory_rental_join
    GROUP BY customer_id, rating
    ORDER BY customer_id, rating'
) AS ct(customer_id TEXT, "G" INT, "PG" INT, "PG-13" INT, "R" INT)

