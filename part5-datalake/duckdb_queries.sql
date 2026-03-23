-- DuckDB enables querying heterogeneous data formats without ETL using unified SQL execution

-- Q1: List all customers along with total number of orders

SELECT 
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM read_csv_auto('../datasets/customers.csv') c
LEFT JOIN read_json_auto('../datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;

-- Q2: Top 3 customers by total order value

SELECT 
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_spent
FROM read_csv_auto('../datasets/customers.csv') c
JOIN read_json_auto('../datasets/orders.json') o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC
LIMIT 3;

-- Q3: List all products purchased by customers from Bangalore

SELECT DISTINCT 
    p.product_name
FROM read_csv_auto('../datasets/customers.csv') c
JOIN read_json_auto('../datasets/orders.json') o
ON c.customer_id = o.customer_id
JOIN read_parquet('../datasets/products.parquet') p
ON o.product_id = p.product_id
WHERE LOWER(c.city) = 'bangalore';

-- Q4: Join all three files

SELECT 
    c.name AS customer_name,
    o.order_date,
    p.product_name,
    o.num_items AS quantity
FROM read_csv_auto('../datasets/customers.csv') c
JOIN read_json_auto('../datasets/orders.json') o
ON c.customer_id = o.customer_id
JOIN read_parquet('../datasets/products.parquet') p
ON o.product_id = p.product_id;