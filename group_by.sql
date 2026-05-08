use sakila;
show tables;
 select * from orders;
 
select Category,SUM(OrderValue) as Total_Revenue from orders group by Category;

select Category,COUNT(OrderID) as Total_Orders from orders group by Category;

select Category, MAX(OrderValue) as Max_OrderValue from orders group by Category;

select DISTINCT Category from orders;

select DISTINCT CustomerID from orders;

select DISTINCT CustomerID, Category from orders;

select CustomerID,Category,SUM(OrderValue) as Total_Revenue from orders group by CustomerID, Category;

select CustomerID,Category,COUNT(OrderID) as Order_Count from orders group by CustomerID, Category;

select Category,SUM(OrderValue) as Total_Revenue from orders
group by Category having SUM(OrderValue) > 20000;

select CustomerID,COUNT(OrderID) as Order_Count from orders group by CustomerID
having COUNT(OrderID) > 1;

select CustomerID,Category,SUM(OrderValue) AS Total_Spent
from orders group by CustomerID, Category
having SUM(OrderValue) > 10000;