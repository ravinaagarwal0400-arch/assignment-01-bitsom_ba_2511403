-- Q1: List all customers from Mumbai along with their total order value
SELECT c.customer_id, c.customer_name, SUM(oi.quantity * oi.price) AS total_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE c.city = 'Mumbai'
GROUP BY c.customer_id, c.customer_name;

-- Q2: Find the top 3 products by total quantity sold
SELECT p.product_id, p.product_name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 3;

-- Q3: List all sales representatives and the number of unique customers they have handled
SELECT sales_rep_id, COUNT(DISTINCT customer_id) AS customer_count
FROM orders
GROUP BY sales_rep_id;

-- Q4: Find all orders where the total value exceeds 10,000
SELECT o.order_id, SUM(oi.quantity * oi.price) AS total_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id
HAVING SUM(oi.quantity * oi.price) > 10000
ORDER BY total_value DESC;

-- Q5: Identify any products that have never been ordered
SELECT p.product_id, p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

