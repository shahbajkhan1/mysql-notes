use joindb;
show tables;
select * from employees;
use joinpractice;
show tables;

select *, sum(salary) over(partition by department),
sum(salary) over() from employees; 

select *, sum(salary) over(partition by manager_id) from employees;

select *, sum(salary) over(partition by department order by salary) from employees;

select emp_name,department,salary,sum(salary) over(partition by department),
salary - sum(salary) over(partition by department) from employees;


create database windowsdb;
use windowsdb;

CREATE TABLE employees (
  emp_id    INT,
  name      VARCHAR(50),
  dept      VARCHAR(30),
  salary    INT,
  hire_year INT
);

INSERT INTO employees VALUES
  (1,  'Alice',   'IT',      90000, 2019),
  (2,  'Bob',     'IT',      75000, 2020),
  (3,  'Charlie', 'IT',      82000, 2018),
  (4,  'Diana',   'HR',      68000, 2021),
  (5,  'Eve',     'HR',      72000, 2019),
  (6,  'Frank',   'HR',      65000, 2022),
  (7,  'Grace',   'Sales',   55000, 2020),
  (8,  'Henry',   'Sales',   60000, 2021),
  (9,  'Iris',    'Sales',   58000, 2019),
  (10, 'Jack',    'Finance', 95000, 2017),
  (11, 'Karen',   'Finance', 88000, 2018),
  (12, 'Leo',     'Finance', 91000, 2020);
  
  
  select * from employees;
  
  select *, sum(salary) over(partition by hire_year order by salary) from employees;
  
  select *, max(salary) over(partition by dept order by hire_year) from employees;
  
  select *, avg(salary) over(partition by dept),
  case
	when salary > avg(salary) over(partition by dept) then 'Above avg salary'
    else 'Less then avg salary'
    end
from employees;

select *, row_number() over(partition by dept) from employees;

select *, rank() over(partition by dept order by salary desc) from employees;

show tables;

CREATE TABLE sales (
    id INT,
    sale_date DATE,
    amount INT
);


INSERT INTO sales VALUES
(1, '2026-01-01', 100),
(2, '2026-01-02', 200),
(3, '2026-01-03', 300),
(4, '2026-01-04', 400),
(5, '2026-01-05', 500);

select *, lag(sale_date,1) over() from sales;

select *, lead(sale_date,1) over() from sales;

select *, lead(sale_date , 1,0) over(order by amount desc) from sales;

select *, sum(amount) over(rows between unbounded preceding and current row) from sales;
-- unbounded preceding ==> is first row
-- current row ==> is current row
-- unbounder following ==> last row
-- n preceding ==> last row number of sum

select *, sum(amount) over(rows between 1 preceding and current row) from sales;

select *, sum(amount) over(rows between unbounded preceding and 1 following) from sales;

select *, sum(amount) over(rows between current row and 1 following) from sales;


select * from employee_attendance;
select * from employees_sales;

-- Find total sales by each department.
select employee_name , department,sales_amount, sum(sales_amount) over(partition by department) from employees_sales;

-- Find average sales per employee.
select employee_name , sales_amount , avg(sales_amount) over(partition by employee_name) from employees_sales;

-- Rank employees by sales within each department.
select employee_name , department ,sales_amount, rank() 
over(partition by department order by sales_amount desc) from employees_sales;

-- Find previous sale amount for each employee.
select  employee_name , sale_date , sales_amount , lag(sales_amount) over() as previous_sale from employees_sales;

-- Find next sale amount for each employee.
select employee_name , sale_date , sales_amount , lead(sales_amount)
 over(partition by employee_name order by sales_amount) as next_sale
from employees_sales;

-- Calculate running total using ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW.
select employee_name , sale_date , sales_amount,sum(sales_amount) 
over(rows between unbounded preceding and current row) from employees_sales;
