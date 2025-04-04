-- 5. Get the products that have the highest and lowest manufacturing costs. The final output should contain these fields,
-- product_code
-- product
-- manufacturing_cost
SELECT
	product_code, product, manufacturing_cost
FROM
	fact_manufacturing_cost
JOIN dim_product USING (product_code)
WHERE manufacturing_cost=(SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost)
UNION ALL
SELECT
	product_code, product, manufacturing_cost
FROM
	fact_manufacturing_cost
JOIN dim_product USING (product_code)
WHERE manufacturing_cost=(SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost);