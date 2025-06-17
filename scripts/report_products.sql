/*
===============================================================================
Product Report
===============================================================================
Highlights:
    1. Gathers essential fields such as product name, category, subcategory, and cost.
    2. Segments products by revenue to identify High-Performers, Mid-Range, or Low-Performers.
    3. Aggregates product-level metrics:
       - total orders
       - total sales
       - total quantity sold
       - total customers (unique)
       - lifespan (in months)
    4. Calculates valuable KPIs:
       - recency (months since last sale)
       - average order revenue (AOR)
       - average monthly revenue
===============================================================================
*/
-- =============================================================================
-- Create Report: gold.report_products
-- =============================================================================
CREATE VIEW gold.report_products AS
/*---------------------------------------------------------------------------
1) Base Query: Retrieves core columns from fact_sales and dim_products
---------------------------------------------------------------------------*/
WITH base_query AS (
SELECT
f.order_number,
f.order_date,
f.customer_key,
f.sales_amount,
f.quantity,
p.product_key,
p.product_name,
p.category,
p.subcategory,
p.cost
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON f.product_key = p.product_key
WHERE order_date IS NOT NULL
),
/*---------------------------------------------------------------------------
2) Product Aggregations: Summarizes key metrics at the product level
---------------------------------------------------------------------------*/
product_aggregations AS (
SELECT
product_key,
product_name,
category,
subcategory,
cost,
MAX(order_date) last_sale_date,
COUNT(DISTINCT order_number) AS total_orders,
SUM(sales_amount) AS total_sales,
SUM(quantity) AS total_quantity,
COUNT(DISTINCT customer_key) AS total_customers,
DATEDIFF(month,MIN(order_date),MAX(order_date)) AS lifespan
FROM base_query
GROUP BY product_key,product_name,category,subcategory,cost
)
--Segments products by revenue to identify High-Performers, Mid-Range, or Low-Performers.
SELECT
product_key,
product_name,
category,
subcategory,
cost,
last_sale_date,
CASE WHEN total_sales > 50000 THEN 'High-Preformers'
	  WHEN total_sales >= 10000 THEN 'Mid-Range'
	  ELSE 'Low-preformers'
END AS product_segments,
lifespan,
total_orders,
total_sales,
total_quantity,
total_customers,
DATEDIFF(month,last_sale_date,GETDATE()) recency_in_months,
total_sales / total_orders AS avg_order_revenue,
total_sales / lifespan AS  avg_monthly_revenue
FROM product_aggregations
