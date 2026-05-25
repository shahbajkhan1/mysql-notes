create database cont_db;
use cont_db;
create table if not exists test1(id int , age int);
insert into test1 values(101,32),(102,null);
select * from test1;

-- const are the rules which are applied to prevent to invaid data in the table
-- NOT NULL
create table if not exists test2(id int , age int not null);
insert into test2 values(103,23),(104,0);
select * from test2;

-- UNIQUE
create table if not exists test3(id int unique , age int not null);
insert into test3 values(103,23),(104,12);
select * from test3;

-- DEFAULT
create table if not exists test4(id int default 103 , age int not null);
insert into test4(age) values(25);
select * from test4;

-- PRIMARY KEY
create table if not exists test5(id int primary key, age int not null);
insert into test5 values(102,15);
select * from test5;

-- TWO PRIMARY KEY
drop table test6;
create table if not exists test6(id int , age int not null ,salary int , primary key (id,age));
insert into test6 values(102,16,2000);
select * from test6;
desc test6;

-- CHECK
create table if not exists test7(id int , age int check (age>18));
insert into test7 values(102,19);
select * from test7;

create table if not exists test8(id int , age int check (age between 18 and 30));
insert into test8 values(102,19);
insert into test8 values(103,30);
select * from test8;


-- FOREIGN KEY--
create table s_class(cname varchar(20) primary key);
insert into s_class values(10),(8),(9);

drop table student;
create table student(id int , name varchar(20),cname varchar(20) , foreign key (cname) references s_class(cname));
insert into student values(1,'naina','10'),(2,'abhi','9');
select * from student;
