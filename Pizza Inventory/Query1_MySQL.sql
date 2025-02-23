create database pizza_db;

use pizza_db;

CREATE TABLE pizza_sales (
    pizza_id INT PRIMARY KEY,
    order_id INT,
    pizza_name_id VARCHAR(255),
    quantity INT,
    order_date DATE,
    order_time TIME,
    unit_price DECIMAL(10, 2),
    total_price DECIMAL(10, 2),
    pizza_size CHAR(3),
    pizza_category VARCHAR(255),
    pizza_ingredients TEXT,
    pizza_name VARCHAR(255)
);

SELECT * FROM pizza_sales;


