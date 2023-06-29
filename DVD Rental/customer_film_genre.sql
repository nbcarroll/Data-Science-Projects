SELECT
    r.customer_id,
    c.name AS Genre,
    COUNT(r.rental_id)
FROM
    rental r
    LEFT JOIN inventory i ON r.inventory_id = i.inventory_id
    LEFT JOIN film f ON i.film_id = f.film_id
    LEFT JOIN film_category fc ON f.film_id = fc.film_id
    LEFT JOIN category c ON fc.category_id = c.category_id
GROUP BY
    r.customer_id,
    c.name
ORDER BY
	r.customer_id

-- FOR CROSSTAB QUERY... WHICH ISN'T WORKING FOR SOME REASON...

	-- AS ct(
	-- customer_id TEXT,
	-- "Family" INT,
	-- "Games" INT,
	-- "Animation" INT,
	-- "Classics" INT,
	-- "Documentary" INT,
	-- "New" INT,
	-- "Sports" INT,
	-- "Children" INT,
	-- "Music" INT,
	-- "Travel" INT,
	-- "Foreign" INT,
	-- "Drama" INT,
	-- "Horror" INT,
	-- "Action" INT,
	-- "Sci-Fi" INT,
	-- "Comedy" INT)
	
-- THERE'S A LOT OF COLUMNS THAT I'M NOT GETTING INFORMATION ON.. IF I SCRAP THE PREVIOUS GROUP BY THEN I WILL
-- SELECT customer_id, EXTRACT(EPOCH FROM (return_date - rental_date)) / 3600.0 AS duration_hours
-- FROM all_movie_rentals amr

