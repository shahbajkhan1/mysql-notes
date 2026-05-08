use sk;
show tables;
select * from employees;

select first_name , department , salary, if(department = 'IT',True,False) from employees;

select first_name , department , salary, if(department = 'IT',salary*1.1,salary*1.05) from employees;

select first_name , department , salary, if(department = 'IT',salary*1.1,if(department = 'HR', salary*1.05,salary)) from employees;

select first_name , department , salary,
case 
	when department = 'IT' then true
    else 'Non it'
end
from employees;  

select first_name , department , salary,
case 
	when department = 'IT' or department = 'HR'  then "A"
    else 'B'
end
from employees;    
	
select first_name , department , salary,
case 
	when department = 'IT'   then salary*1.1
    when department ='HR' then salary*1.05
    else salary
end  as 'new_salary'
from employees;      

-- if the hiring date of a employees is before year 2020 then add serior and year is 2021 print asscoicate
select first_name,hire_date,
case
	when year(hire_date)<2020 then concat(job_title,' Senior')
    when year(hire_date) > 2021 then concat(job_title, ' Assco')
    else job_title
end    
from employees ;

-- create the if salary is greater then 70k create a cat name avg salary if the salary is greater then 85k then print high salary
-- if salary greate then 100l then print extreme high salary 

select first_name , salary,
case
	when salary>100000 then 'extreme high salary'
    when salary>85000 then 'high salary'
    when salary>70000 then 'avg salary'
   else 'Low salary'
end
from employees;   

-- select the job tatle and print the col value based the condition
select * from employees;
select job_title ,concat(count(*)) ,
case
	when count(*)=1 then concat(job_title,'Position have',count(job_title),' Person') 
    when count(*)>1 then concat(job_title,'Position have',count(job_title),' Persons') 
end    
 from employees group by job_title;

/*
select col1,col2,
case 
	when condition then statment
end
from table_name
\*    

