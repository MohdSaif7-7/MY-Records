-- 1. Create Database and Tables
CREATE DATABASE IF NOT EXISTS InventoryDB;
USE InventoryDB;

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT
);

-- Suppliers Table
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100),
    contact VARCHAR(100)
);

-- 2. Insert Sample Data
INSERT INTO products (product_name, category, price, stock_quantity)
VALUES 
    ('Laptop', 'Electronics', 750.00, 50),
    ('Notebook', 'Stationery', 2.50, 200),
    ('Desk Chair', 'Furniture', 120.00, 30);

INSERT INTO suppliers (supplier_name, contact)
VALUES 
    ('Tech Suppliers Inc', 'contact@techsuppliers.com'),
    ('Office World', 'info@officeworld.com');

-- 3. Example Queries
-- ---------------------------

-- Query 1: List all products (Basic SELECT)
SELECT * FROM products;

-- Query 2: Find products in "Electronics" category (Filtering)
SELECT product_name, price 
FROM products 
WHERE category = 'Electronics';

-- Query 3: Calculate total stock value (Aggregation)
SELECT 
    category, 
    SUM(stock_quantity * price) AS total_value 
FROM products 
GROUP BY category;

-- Query 4: Identify low-stock items (Filtering)
SELECT product_name, stock_quantity 
FROM products 
WHERE stock_quantity < 50;

-- Query 5: List suppliers and their products (JOIN)
-- (Assuming a supplier_id column exists in the products table)
ALTER TABLE products ADD COLUMN supplier_id INT;
UPDATE products SET supplier_id = 1 WHERE product_name = 'Laptop';
UPDATE products SET supplier_id = 2 WHERE product_name = 'Notebook';

SELECT 
    p.product_name,
    s.supplier_name,
    s.contact
FROM products p
JOIN suppliers s ON p.supplier_id = s.supplier_id;

-- Query 6: Update stock after a sale (UPDATE)
UPDATE products 
SET stock_quantity = stock_quantity - 5 
WHERE product_name = 'Laptop';

-- Query 7: Delete discontinued product (DELETE)
DELETE FROM products 
WHERE product_name = 'Desk Chair';