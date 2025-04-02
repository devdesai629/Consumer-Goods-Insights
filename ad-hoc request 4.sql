-- 4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields,
-- segment
-- product_count_2020
-- product_count_2021
-- difference
SELECT
	segment,
	SUM(CASE WHEN fiscal_year=2020 THEN 1 ELSE 0 END) AS product_count_2020,
	SUM(CASE WHEN fiscal_year=2021 THEN 1 ELSE 0 END) AS product_count_2021,
	(SUM(CASE WHEN fiscal_year=2021 THEN 1 ELSE 0 END) - SUM(CASE WHEN fiscal_year=2020 THEN 1 ELSE 0 END)) AS difference
FROM
	dim_product
JOIN fact_gross_price USING (product_code)
GROUP BY segment
ORDER BY difference DESC;