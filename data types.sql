create database if not exists datatypedb;
use datatypedb;

create table test1(id tinyint);
insert into test1 values(-1),(10);
insert into test1 values(128); -- out of range(1 byts => 8 bit => 2**8 (-128 ti 127))
select * from test1;

-- small int -> 2 byte medium int -> 2 byte
-- int -> 4 byte
-- big int -> 8 byte

-- FLOAT AND DOUBLE
create table test2(salary float , salary2 double);
insert into test2 values(1989.2342,1989.23768);
select * from test2;

create table test3(price double(6,2)); -- total is 6 ,2 is decimal values, 4 are the values before
insert into test3 values(0.2343);-- only 2 decimal values
insert into test3 values(234);
insert into test3 values(23423); -- integer values
select * from test3;

-- CHAR()
create table test4(countrycode char(3));
insert into test4 values('IND');
insert into test4 values('INDIA'); -- error out of range
select * from test4;

-- VARCHAR()
create table test5(countrycode varchar(3));
insert into test5 values('IND');
insert into test5 values('I    ');
select *,char_length(countrycode) from test5;
