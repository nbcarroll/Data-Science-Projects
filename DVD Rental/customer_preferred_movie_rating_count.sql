SELECT t.customer_id, t.rating, count(*)
		FROM (
			SELECT r.customer_id, r.inventory_id, i.film_id, f.rating
			FROM rental r
				JOIN inventory i on r.inventory_id = i.inventory_id
				JOIN film f on f.film_id = i.film_id
)t GROUP BY 1,2 ORDER BY 1, 3 DESC
