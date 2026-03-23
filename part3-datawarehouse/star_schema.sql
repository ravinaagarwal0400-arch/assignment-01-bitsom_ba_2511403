-- dim_date
CREATE TABLE dim_date (
    date_id DATE PRIMARY KEY,
    year INT NOT NULL,
    month INT NOT NULL,
    month_name VARCHAR(20),
    quarter INT NOT NULL
);

-- dim_store
CREATE TABLE dim_store (
    store_id VARCHAR(10) PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50)
);

-- dim_product
CREATE TABLE dim_product (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- FACT TBLE --
CREATE TABLE fact_sales (
    sales_id SERIAL PRIMARY KEY,
    date_id DATE,
    store_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);

-- Cleaned Sample Data

-- dim_date
INSERT INTO dim_date VALUES
('2023-01-01', 2023, 1, 'January', 1),
('2023-02-01', 2023, 2, 'February', 1),
('2023-03-01', 2023, 3, 'March', 1),
('2023-04-01', 2023, 4, 'April', 2),
('2023-05-01', 2023, 5, 'May', 2);

-- dim_store
INSERT INTO dim_store VALUES
('S001', 'Mumbai Central Store', 'Mumbai'),
('S002', 'Delhi Hub Store', 'Delhi'),
('S003', 'Pune Main Store', 'Pune');

-- dim_product
INSERT INTO dim_product VALUES
('P001', 'Laptop', 'Electronics'),
('P002', 'Mobile Phone', 'Electronics'),
('P003', 'T-Shirt', 'Clothing'),
('P004', 'Rice Bag', 'Groceries'),
('P005', 'Headphones', 'Electronics');

-- fact_sales (10+ rows, cleaned)
INSERT INTO fact_sales (date_id, store_id, product_id, quantity, total_amount) VALUES
('2023-01-01','S001','P001',1,50000),
('2023-01-01','S002','P002',2,40000),
('2023-02-01','S003','P003',3,3000),
('2023-02-01','S001','P004',5,2500),
('2023-03-01','S002','P005',2,4000),
('2023-03-01','S003','P001',1,50000),
('2023-04-01','S001','P002',3,60000),
('2023-04-01','S002','P003',4,4000),
('2023-05-01','S003','P004',6,3000),
('2023-05-01','S001','P005',2,4000);

