-- 10. Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? The final output contains fields,
-- division
-- product_code
-- product
-- total_sold_quantity
-- rank_order
WITH total_sales AS (
	SELECT
		dp.product,
		dp.product_code,
		dp.division,
		SUM(fsm.sold_quantity) AS total_sold_quantity,
		RANK() OVER(PARTITION BY division ORDER BY SUM(fsm.sold_quantity) DESC) AS rank_order
	FROM fact_sales_monthly fsm
	JOIN dim_product dp USING (product_code)
	WHERE fiscal_year = 2021
	GROUP BY dp.product_code, dp.product, dp.division
)
SELECT *
FROM total_sales
WHERE rank_order IN (1,2,3);