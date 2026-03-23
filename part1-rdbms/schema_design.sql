CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE sales_reps (
    rep_id VARCHAR(10) PRIMARY KEY,
    rep_name VARCHAR(100) NOT NULL
);

CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
('CUST001','Amit Sharma','Mumbai'),
('CUST002','Neha Singh','Delhi'),
('CUST003','Rahul Verma','Pune'),
('CUST004','Priya Mehta','Mumbai'),
('CUST005','Karan Patel','Ahmedabad');

INSERT INTO products VALUES
('P001','Laptop',50000),
('P002','Phone',20000),
('P003','Headphones',2000),
('P004','Keyboard',1500),
('P005','Mouse',800);

INSERT INTO orders VALUES
('ORD2001','CUST001','2023-05-20','delivered'),
('ORD2002','CUST002','2023-08-22','delivered'),
('ORD2003','CUST003','2023-12-12','delivered'),
('ORD2004','CUST004','2023-01-07','shipped'),
('ORD2005','CUST005','2023-01-19','processing');

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
('ORD2001','P001',1,50000),
('ORD2002','P002',2,20000),
('ORD2003','P003',3,2000),
('ORD2004','P004',1,1500),
('ORD2005','P005',4,800);







