-- 9. Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? The final output contains these fields,
-- channel
-- gross_sales_mln
-- percentage
WITH gross_sales_table AS (
	SELECT
		channel,
		SUM(fgp.gross_price * fsm.sold_quantity) AS gross_sales
	FROM fact_sales_monthly fsm
	JOIN dim_customer dc USING (customer_code)
	JOIN fact_gross_price fgp USING (product_code)
	WHERE fsm.fiscal_year=2021
	GROUP BY dc.channel
	ORDER BY gross_sales DESC)
SELECT
	channel,
	ROUND((gross_sales/1000000),2) AS gross_sales_mln,
	ROUND((gross_sales/(SUM(gross_sales) OVER()))*100,2) AS percentage
FROM
	gross_sales_table;