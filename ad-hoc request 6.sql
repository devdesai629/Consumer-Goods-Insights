6. Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market.
-- customer_code
-- customer
-- average_discount_percentage
SELECT
	d.customer_code, d.customer,
	ROUND(AVG(f.pre_invoice_discount_pct),4) AS average_discount_percentage
FROM
	dim_customer d
JOIN
	fact_pre_invoice_deductions f USING (customer_code)
WHERE f.fiscal_year=2021 AND d.market='india'
GROUP BY d.customer, d.customer_code
ORDER BY average_discount_percentage DESC
LIMIT 5;