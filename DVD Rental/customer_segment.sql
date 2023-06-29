WITH base_table AS (
	SELECT p.customer_id, c.store_id, count(p.payment_date) as total_rentals, SUM(amount) as total_rental_revenue
	FROM payment p
	LEFT JOIN customer c
	ON p.customer_id = c.customer_id
	GROUP BY 1,2
	ORDER BY total_rentals DESC
	),
	
	second_table AS (
	SELECT bt.customer_id, bt.store_id,bt.total_rentals,cs.traffic_source, bt.total_rental_revenue
	FROM base_table bt
	LEFT JOIN customer_sources cs
	ON bt.customer_id = cs.customer_id
	),
	
	third_table AS (
	SELECT st.*, store.store_id, address_id
	from second_table st
	LEFT JOIN store
	ON st.store_id = store.store_id
	),
	
	fourth_table AS (
	SELECT *
	FROM third_table
	),
	
	fifth_table AS (
	SELECT ft.*, address.district, address.city_id
	FROM fourth_table ft
	LEFT JOIN address
	ON ft.address_id = address.address_id
	),
	
	sixth_table AS(
	SELECT ft.customer_id,ft.total_rentals,ft.total_rental_revenue,city.city AS Store_City
	FROM fifth_table ft
	LEFT JOIN city
	on ft.city_id = city.city_id
	),
	
	seventh_table AS(
	select
		st.customer_id,st.total_rentals,st.total_rental_revenue,st.store_city,
		rental.*
	FROM sixth_table st
	LEFT JOIN rental
	ON st.customer_id = rental.customer_id
	),
	
	eight_table AS (
	SELECT seventh_table.*,inventory.film_id
	from seventh_table
	LEFT JOIN inventory
	ON seventh_table.inventory_id = inventory.inventory_id
	),
	
	ninth_table AS (
	select eight_table.*
	from eight_table
	LEFT JOIN film f
	ON eight_table.film_id = f.film_id
	),
	
	tenth_table AS (
	select * from
	ninth_table
	LEFT JOIN film_category fc
	ON ninth_table.film_id =  fc.film_id
	)

SELECT *
from tenth_table tt
LEFT JOIN category
ON tt.category_id = category.category_id


-- SELECT *
-- from inventory
