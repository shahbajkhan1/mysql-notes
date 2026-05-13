use shadidb;
show tables;

create table department (dept_id int , dept_name varchar(20),location varchar(20));
insert into department values(10,'HR','Mumbai'),(20,'IT','Banglore'),(30,'Finance','Delhi');

select * from department;
select * from employees;

select * from employees
where department =any (select dept_name from department where location in ('Banglore','Delhi'));


-- CORREALTED SUBQUERY -> Is a type of subquery where the inner query is exicuted for each value of the outer query
-- inner query also refer to thw column of outer query

select * from employees as e where
salary > (select avg(salary) from employees where department = e.department);

select * from employees as e where
salary = (select max(salary) from employees where department = e.department);

select department from employees where salary > 70000;

select * from employees as e 
where 70000 < all (select salary from employees where department = e.department);