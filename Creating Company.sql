-- Creating a Company ---
CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS companies;

CREATE TABLE companies (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50),
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    salary DECIMAL(10,2),
    dept_id INT,
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Insterting data into --
INSERT INTO companies (name) VALUES 
    ('TechCorp'), 
    ('FoodWorld');

INSERT INTO departments (dept_name, company_id) VALUES 
    ('Engineering', 1),
    ('HR', 1),
    ('Supply Chain', 2);

INSERT INTO employees (name, salary, dept_id, hire_date) VALUES
    ('Alice', 75000.00, 1, '2020-01-15'),
    ('Bob', 65000.50, 1, '2021-03-22'),
    ('Charlie', 55000.00, 3, '2022-11-01');

-- Query: Employees with company & dept names
SELECT 
    e.name AS employee,
    c.name AS company,
    d.dept_name,
    e.salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN companies c ON d.company_id = c.company_id;

-- Average salary per department
SELECT 
    d.dept_name,
    AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_id;