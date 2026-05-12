create database shadidb;

use shadidb;
create table biodata(id int , name varchar(20),age int);

insert into biodata values (1,'Rahul',28),(2,'anjali',28),(3,'Aishwariya',40),(4,'naina',23);

select * from biodata;

select max(age) from biodata;

select * from biodata where age = (select max(age) from biodata);

select age from biodata where name = 'Rahul';

select * from biodata where age =(select age from biodata where name = 'Rahul');

select char_length(name) from biodata where name = 'Rahul';

select * from biodata where char_length(name) = (select char_length(name) from biodata where name = 'Rahul');

use sakila;

select * from film;

-- muje unhone movie ka name niklna hai 
-- where the rental_rate is same for the movie afican agg

select rental_rate from film where title = 'AFRICAN EGG';

select title from film where rental_rate = (select rental_rate from film where title = 'AFRICAN EGG');

-- get the movie id and movie name where rental_rate is equal to min rent
select  min(rental_rate) from film;
select film_id,title,rental_rate from film where rental_rate = (select  min(rental_rate) from film);


-- get the movie id movie name band movie duration is greater then avg duration of the movie
select avg(rental_duration) from film;

SELECT film_id, title, rental_duration FROM film
WHERE rental_duration > ( SELECT AVG(rental_duration) FROM film);

-- get the movie id for the movies where the releas year movie should be equal to    and the rating should bhi same as of APOLLO TEEN 
select film_id , title from film where release_year =(select release_year from film where title = 'ALONE TRIP')
and rating = (select rating from film where title = 'APOLLO TEEN');

-- mutli row subquery

select * from biodata where 
age in (select age from biodata where name = 'anjali' or name = 'Aishwariya')
and name != 'Rahul';

-- i need to find the name for the rahul where the age is not equal to anjali and Aishwariiya
select * from biodata where 
age not in (select age from biodata where name = 'anjali' or name = 'Aishwariya')
and name != 'Rahul';

CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT
);
-- Insert Data
INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);

select * from employees;

select * from employees where salary>(select avg(salary) from employees);

select * from employees where salary=(select max(salary) from employees);

select salary from employees where emp_id = 101;
select * from employees where salary > (select salary from employees where emp_id = 101);

select min(salary) from employees;
select department from employees where salary = (select min(salary) from employees); 

select * from employees
where department in (select department from employees where name ='Alice' or name= 'Bob');

select salary from employees where emp_id = 103 or emp_id = 105;
select * from employees where salary not in (select salary from employees where emp_id = 103 or emp_id = 105);

-- ANY operator -->  
select * from employees where salary  > any (select salary from employees where emp_id = 103 or emp_id = 105);

select * from employees where department = 'HR';
select * from employees where salary  > any(select salary from employees where department = 'HR');

-- ALL operator -->
select * from employees where salary  > all (select salary from employees where department = 'HR');

select salary from employees where department = 'IT';
select * from employees where salary  > all (select salary from employees where department = 'IT');

-- find the details who works in it departemnt and who have salary greater then the salary of imp_id 101
select * from employees where department = 'IT';
select * from employees where emp_id = 101;
select * from employees where department in (select emp_id from employees where department = 'IT')
and salary > any(select salary from employees where emp_id = 101);

-- find name of person who salary greater then all this salary of hr and it department
select salary from employees where department = 'HR' or department = 'IT';
select * from employees where salary >all (select salary from employees where department = 'HR' or department = 'IT');

-- find the employees id and employees name of the user who slary is greater then the salary of any employee work under mangar id 101
select emp_id,name from employees where salary > any (select salary from employees where manager_id = 101);

-- find the second highest salary in this tables
select max(salary) from employees;
select max(salary) as second_highest_salary from employees where salary < (select max(salary) from employees);



