-- find the emp name and its salary if it is greater than the salary of its manager 
-- show all the emp name with all the manager name 
-- show emp and its grand manager
-- find the emp who are also managers

use joindb;
select * from employees;

select  e.emp_name , e.salary , m.emp_name, m.salary 
from employees e
join employees m
on e.manager_id = m.emp_id
where e.salary > m.salary;

select e.emp_name as Employee_Name, m.emp_name as Manager_Name
from employees e
join employees m
on e.manager_id = m.emp_id;

select e.emp_name as Employee_Name, m.emp_name as Manager_Name,gm.emp_name as Grand_Manager
from employees e
join employees m
on e.manager_id = m.emp_id
join employees gm
where m.manager_id = gm.emp_id;

select distinct m.emp_id, m.emp_name
from employees e
join employees m
on e.manager_id = m.emp_id;