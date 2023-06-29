WITH base_table AS (
	SELECT p.customer_id, p.payment_date,
	row_number() over(partition by p.customer_id order by p.payment_date asc) as early_order,
	row_number() over(partition by p.customer_id order by p.payment_date desc) as late_order
	FROM payment p
), second_table AS (

		SELECT * FROM base_table bt
		WHERE bt.early_order = 1 OR bt.late_order = 1
)

SELECT st.customer_id,
	   max(st.payment_date) as recent_order,
	   min(st.payment_date) as first_order, -- Don't forget the comma, since we're adding another column!
(
	   SELECT SUM(p2.amount) as ltv_spend -- [Customer] Life Time Value Spend
	   FROM payment p2
	   WHERE p2.customer_id = st.customer_id
)

FROM second_table st
GROUP BY st.customer_id
ORDER BY 1