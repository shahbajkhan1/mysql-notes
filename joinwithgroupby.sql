create database joinpractice;

use joinpractice;


CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);



INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Sales');



INSERT INTO employees VALUES
(101, 'Alice', 70000, 1, NULL),
(102, 'Bob', 60000, 2, 101),
(103, 'Charlie', 55000, 2, 102),
(104, 'David', 50000, 3, 101),
(105, 'Eva', 45000, 4, 104),
(106, 'Frank', 75000, 1, 101),
(107, 'Grace', 80000, 2, 102),
(108, 'Helen', 62000, 3, 104),
(109, 'Ian', 47000, 4, 105),
(110, 'Jack', 53000, 2, 102),
(111, 'Kevin', 49000, 3, 104),
(112, 'Laura', 72000, 1, 101),
(113, 'Mike', 58000, 4, 105),
(114, 'Nina', 61000, 2, 107),
(115, 'Oscar', 52000, NULL, 101);

select * from employees;
select * from departments;


select e.emp_name,d.dept_name from employees as e
join departments as d
on e.dept_id = d.dept_id order by e.emp_name;


select e.emp_name,d.dept_name from employees as e
left join departments as d
on e.dept_id = d.dept_id;


select  d.dept_name,
    COUNT(e.emp_id)  from employees as e
join departments as d
on e.dept_id = d.dept_id
group by d.dept_name;


select d.dept_name,sum(e.salary) from employees as e
join departments as d
on 

select m.emp_name,count(e.emp_id) from employees as e
join employees as m
on e.manager_id = m.emp_id
group by m.emp_id ,m.emp_name;
/*
Display employee names along with their department names.
| emp_name | dept_name |
| -------- | --------- |
| Alice    | HR        |
| Bob      | IT        |
| Charlie  | IT        |
| David    | Finance   |
| Eva      | Sales     |
| Frank    | HR        |
| Grace    | IT        |
| Helen    | Finance   |
| Ian      | Sales     |
| Jack     | IT        |
| Kevin    | Finance   |
| Laura    | HR        |
| Mike     | Sales     |
| Nina     | IT        |



Display all employees and their department names, including employees without departments.
| emp_name | dept_name |
| -------- | --------- |
| Alice    | HR        |
| Bob      | IT        |
| Charlie  | IT        |
| David    | Finance   |
| Eva      | Sales     |
| Frank    | HR        |
| Grace    | IT        |
| Helen    | Finance   |
| Ian      | Sales     |
| Jack     | IT        |
| Kevin    | Finance   |
| Laura    | HR        |
| Mike     | Sales     |
| Nina     | IT        |
| Oscar    | NULL      |


Find the number of employees in each department.
| dept_name | total_employees |
| --------- | --------------- |
| HR        | 3               |
| IT        | 5               |
| Finance   | 3               |
| Sales     | 3               |



Display all departments and the total salary paid in each department.
| dept_name | total_salary |
| --------- | ------------ |
| HR        | 217000       |
| IT        | 309000       |
| Finance   | 161000       |
| Sales     | 150000       |




Find how many employees report to each manager.
| manager | team_size |
| ------- | --------- |
| Alice   | 5         |
| Bob     | 4         |
| David   | 4         |
| Eva     | 2         |
| Grace   | 1         |



Display average salary department-wise where average salary is greater than 60000.
| dept_name | avg_salary |
| --------- | ---------- |
| HR        | 72333.33   |
| IT        | 61800      |





*/


use sakila;

show tables;

select * from actor;
select * from film_actor;
select * from film;

-- select actoor_id, full_name,film_id also filme_name
select a.actor_id,concat(first_name,' ',last_name) as full_name ,f.film_id ,f.title from actor as a
join film_actor as fa
on a.actor_id = fa.actor_id
join film as f
on fa.film_id = f.film_id;


-- get the film_id and film_title and actor_id
select a.actor_id,fa.film_id ,f.title from actor as a
join film_actor as fa
on a.actor_id = fa.actor_id
join film as f
on fa.film_id = f.film_id;

-- find the actor_id , actor_name and the movie he has work
select a.actor_id, CONCAT(a.first_name,' ',a.last_name) AS actor_name, f.title from actor as a
join film_actor as fa
on a.actor_id = fa.actor_id
join film as f
on fa.film_id = f.film_id;

-- find the actor_id , actor_name  only for the lenght is greater then 120
select a.actor_id,CONCAT(a.first_name,' ',a.last_name) AS actor_name,f.title , f.length from actor as a
join film_actor as fa
on a.actor_id = fa.actor_id
join film as f
on fa.film_id = f.film_id
where f.length > 120;

-- get the actor_id actor_name and totle number  of movie he has work
select a.actor_id,CONCAT(a.first_name,' ',a.last_name) AS actor_name,count(f.film_id) as total_movie from actor as a
join film_actor as fa
on a.actor_id = fa.actor_id
join film as f
on fa.film_id = f.film_id
group by a.actor_id, actor_name;

-- get the film  title and num of actor that work have on that film
select f.title AS film_title,COUNT(fa.actor_id) AS total_actors from film AS f
join film_actor AS fa
    on f.film_id = fa.film_id
group by f.film_id, f.title;

