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


