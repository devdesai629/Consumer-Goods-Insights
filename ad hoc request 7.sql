-- 7. Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. This analysis helps to get an idea of low and high-performing months and take strategic decisions.
-- The final report contains these columns:
-- Month
-- Year
-- Gross sales Amount
SELECT
    fs.fiscal_year AS Fiscal_Year,  
    MONTHNAME(fs.date) AS Month,
    ROUND(SUM(fs.sold_quantity * fp.gross_price), 2) AS Gross_sales_amount
FROM fact_sales_monthly fs
JOIN dim_customer dc 
    ON fs.customer_code = dc.customer_code
JOIN fact_gross_price fp 
    ON fs.product_code = fp.product_code 
WHERE dc.customer = 'Atliq Exclusive'
GROUP BY Month, Fiscal_year
ORDER BY Fiscal_year;