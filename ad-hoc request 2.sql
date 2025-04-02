-- 2. What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields,
-- unique_products_2020
-- unique_products_2021
-- percentage_chg
SELECT
	table_2020.unique_product_2020 AS unique_products_2020,
	table_2021.unique_product_2021 AS unique_products_2021,
	((table_2021.unique_product_2021-table_2020.unique_product_2020)/table_2020.unique_product_2020)*100 AS percentage_chg
FROM
	(SELECT COUNT(DISTINCT product_code) AS unique_product_2020 FROM fact_gross_price WHERE fiscal_year = 2020) AS table_2020,
	(SELECT COUNT(DISTINCT product_code) AS unique_product_2021 FROM fact_gross_price WHERE fiscal_year = 2021) AS table_2021;