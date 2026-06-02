create database if not exists viewdb;
use viewdb;

CREATE TABLE departments (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id   INT PRIMARY KEY,
    name     VARCHAR(50),
    dept_id  INT,
    salary   DECIMAL(10,2),
    city     VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES
(1,'HR'), (2,'IT'), (3,'Finance');

INSERT INTO employees VALUES
(101,'Aman',    2, 70000, 'Jaipur'),
(102,'Priya',   1, 45000, 'Delhi'),
(103,'Rahul',   2, 90000, 'Mumbai'),
(104,'Sneha',   3, 55000, 'Jaipur'),
(105,'Vikram',  2, 30000, 'Pune');

select * from departments;
select * from employees;

drop view dept_view;
create view dept_view as select * from departments where dept_id<3;
select * from dept_view;

create view city_sum as select city, sum(salary) from employees group by city;
select * from city_sum;

create view emp_2 as select emp_id , name from employees;

select name from emp_2;

insert into emp_2 values (107,'yash');
select * from emp_2;

delete from emp_2 where emp_id = 101;
select * from employees;

delete from employees where emp_id = 102;
select * from emp_2;

update emp_2 set name = 'shahbaj' where emp_id = 103;

create view group_city as select city, count(city) from employees group by city;
select * from group_city;

update group_city set city = 'rajasthan' where name = 'Mumbai';

CREATE OR REPLACE VIEW emp_view AS
SELECT
    e.emp_id,
    e.name,
    e.salary,
    d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

select * from emp_view;

update emp_view set emp_id = 100 , name = 'happy' , dept_name = 'jgb';

UPDATE emp_view
SET emp_id = 100,
    name = 'happy'
WHERE emp_id = 103;

UPDATE departments SET dept_name = 'jgb' WHERE dept_id = 1;
select * from departments;
