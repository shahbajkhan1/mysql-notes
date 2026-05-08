use sk;

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL,
city VARCHAR(30) NOT NULL,
category VARCHAR(30) NOT NULL,
product VARCHAR(50) NOT NULL,
quantity INT NOT NULL,
price DECIMAL(10,2) NOT NULL,
order_date DATE NOT NULL
);

INSERT INTO orders VALUES
(1001, 'Rahul Sharma', 'Mumbai', 'Electronics', 'Laptop', 1,
55000, '2024-01-05'),
(1002, 'Priya Patel', 'Delhi', 'Clothing', 'Kurta', 3,
1500, '2024-01-07'),
(1003, 'Amit Singh', 'Bangalore', 'Electronics', 'Smartphone', 2,
18000, '2024-01-10'),
(1004, 'Sunita Rao', 'Chennai', 'Furniture', 'Chair', 4,
3200, '2024-01-12'),
(1005, 'Vikram Joshi', 'Mumbai', 'Electronics', 'Tablet', 1,
22000, '2024-01-15'),
(1006, 'Neha Gupta', 'Delhi', 'Clothing', 'Saree', 2,
4500, '2024-01-18'),
(1007, 'Kiran Kumar', 'Bangalore', 'Furniture', 'Table', 1,
8500, '2024-01-20'),
(1008, 'Deepak Verma', 'Chennai', 'Electronics', 'Headphones', 5,
2500, '2024-02-02'),
(1009, 'Anjali Mehta', 'Mumbai', 'Clothing', 'Jacket', 2,
3800, '2024-02-05'),
(1010, 'Ravi Nair', 'Bangalore', 'Electronics', 'Monitor', 1,
15000, '2024-02-08'),
(1011, 'Pooja Iyer', 'Chennai', 'Furniture', 'Sofa', 1,
25000, '2024-02-12'),
(1012, 'Suresh Patil', 'Delhi', 'Electronics', 'Keyboard', 3,
1800, '2024-02-15'),
(1013, 'Meena Desai', 'Mumbai', 'Furniture', 'Bookshelf', 2,
6000, '2024-02-18'),
(1014, 'Arun Reddy', 'Bangalore', 'Clothing', 'Jeans', 3,
2200, '2024-02-22'),
(1015, 'Lalita Shah', 'Delhi', 'Electronics', 'Smartwatch', 2,
9500, '2024-02-25');

show tables;
select * from orders;

-- How many orders were placed in each city?
select city, COUNT(*) as total_orders from orders group by city;

-- What is the total revenue (price × quantity) earned from each category?
select category, SUM(price * quantity) as total_revenue from orders group by category;

-- How many orders belong to each category?
select category, COUNT(*) as total_orders from orders group by category;

-- What is the average price of orders in each city? Round to 2 decimal places.
select city, round(avg(price), 2) as avg_price from orders group by city;

-- What is the maximum price of a product in each category?
select category, max(price) as max_price
from orders group by category;

-- What is the minimum price of a product ordered in each city?
select city, min(price) as min_price from orders group by city;

-- What is the total quantity of items sold per category?
select category, sum(quantity) as total_quantity from  orders group by category;

-- List each city along with the total number of items ordered (sum of quantity).
select city, sum(quantity) as total_items from orders group by city;

-- Find cities that have more than 3 orders. Show city and order count.
select city, COUNT(*) as order_count from  orders group by city having COUNT(*) > 3;

-- Find categories where the total revenue (price × quantity) is more than 50000.
select category, sum(price * quantity) as total_revenue from orders
group by category having SUM(price * quantity) > 50000;