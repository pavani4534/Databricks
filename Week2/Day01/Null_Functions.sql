 DROP TABLE Employees ;
 DROP TABLE Orders;
 DROP TABLE Products ;

CREATE TABLE Employees (
    emp_id INT,
    name VARCHAR(50),
    salary INT,
    bonus INT,
    manager_id INT
);
INSERT INTO Employees VALUES
(1, 'Amit', 50000, NULL, 101),
(2, 'John', NULL, 5000, 102),
(3, 'Sara', 60000, NULL, NULL),
(4, 'David', NULL, NULL, 103),
(5, 'Priya', 45000, 3000, 101),
(6, 'Kiran', NULL, NULL, NULL),
(7, 'Ravi', 70000, 7000, 102),
(8, 'Neha', NULL, 2000, NULL);

CREATE TABLE Orders (
    order_id INT,
    customer_name VARCHAR(50),
    amount INT,
    discount INT,
    coupon_code VARCHAR(20)
);
INSERT INTO Orders VALUES
(101, 'Amit', 1000, NULL, 'DISC10'),
(102, 'John', NULL, 50, NULL),
(103, 'Sara', 2000, NULL, 'DISC20'),
(104, 'David', NULL, NULL, NULL),
(105, 'Priya', 1500, 100, NULL),
(106, 'Kiran', NULL, NULL, 'DISC5'),
(107, 'Ravi', 3000, NULL, NULL),
(108, 'Neha', NULL, 200, 'DISC15');

CREATE TABLE Products (
    product_id INT,
    product_name VARCHAR(50),
    price INT,
    category VARCHAR(50),
    stock INT
);

INSERT INTO Products VALUES
(1, 'Laptop', 50000, 'Electronics', 10),
(2, 'Phone', NULL, 'Electronics', NULL),
(3, 'Tablet', 30000, NULL, 5),
(4, 'Headphones', NULL, NULL, NULL),
(5, 'Monitor', 20000, 'Electronics', 0),
(6, 'Keyboard', NULL, 'Accessories', 15),
(7, 'Mouse', 500, NULL, NULL),
(8, 'Printer', NULL, 'Electronics', 3);

select * from employees;
---+-------+--------+-------+------------+
| emp_id | name  | salary | bonus | manager_id |
+--------+-------+--------+-------+------------+
|      1 | Amit  |  50000 |  NULL |        101 |
|      2 | John  |   NULL |  5000 |        102 |
|      3 | Sara  |  60000 |  NULL |       NULL |
|      4 | David |   NULL |  NULL |        103 |
|      5 | Priya |  45000 |  3000 |        101 |
|      6 | Kiran |   NULL |  NULL |       NULL |
|      7 | Ravi  |  70000 |  7000 |        102 |
|      8 | Neha  |   NULL |  2000 |       NULL |
+--------+-------+--------+-------+------------+


 select * from products;
+------------+--------------+-------+-------------+-------+
| product_id | product_name | price | category    | stock |
+------------+--------------+-------+-------------+-------+
|          1 | Laptop       | 50000 | Electronics |    10 |
|          2 | Phone        |  NULL | Electronics |  NULL |
|          3 | Tablet       | 30000 | NULL        |     5 |
|          4 | Headphones   |  NULL | NULL        |  NULL |
|          5 | Monitor      | 20000 | Electronics |     0 |
|          6 | Keyboard     |  NULL | Accessories |    15 |
|          7 | Mouse        |   500 | NULL        |  NULL |
|          8 | Printer      |  NULL | Electronics |     3 |
+------------+--------------+-------+-------------+-------+


 select * from orders;
+----------+---------------+--------+----------+-------------+
| order_id | customer_name | amount | discount | coupon_code |
+----------+---------------+--------+----------+-------------+
|      101 | Amit          |   1000 |     NULL | DISC10      |
|      102 | John          |   NULL |       50 | NULL        |
|      103 | Sara          |   2000 |     NULL | DISC20      |
|      104 | David         |   NULL |     NULL | NULL        |
|      105 | Priya         |   1500 |      100 | NULL        |
|      106 | Kiran         |   NULL |     NULL | DISC5       |
|      107 | Ravi          |   3000 |     NULL | NULL        |
|      108 | Neha          |   NULL |      200 | DISC15      |
+----------+---------------+--------+----------+-------------+


LEVEL 1 (BASIC)
===============
1.Show all employees whose salary is NULL
  
select * from employees where salary is null;
+--------+-------+--------+-------+------------+
| emp_id | name  | salary | bonus | manager_id |
+--------+-------+--------+-------+------------+
|      2 | John  |   NULL |  5000 |        102 |
|      4 | David |   NULL |  NULL |        103 |
|      6 | Kiran |   NULL |  NULL |       NULL |
|      8 | Neha  |   NULL |  2000 |       NULL |
+--------+-------+--------+-------+------------+

2.Show all orders where discount is NOT NULL
  
select * from orders where discount is not null;
+----------+---------------+--------+----------+-------------+
| order_id | customer_name | amount | discount | coupon_code |
+----------+---------------+--------+----------+-------------+
|      102 | John          |   NULL |       50 | NULL        |
|      105 | Priya         |   1500 |      100 | NULL        |
|      108 | Neha          |   NULL |      200 | DISC15      |
+----------+---------------+--------+----------+-------------+
  
3.Get products where category is NULL
  
  select * from products where category is null;
+------------+--------------+-------+----------+-------+
| product_id | product_name | price | category | stock |
+------------+--------------+-------+----------+-------+
|          3 | Tablet       | 30000 | NULL     |     5 |
|          4 | Headphones   |  NULL | NULL     |  NULL |
|          7 | Mouse        |   500 | NULL     |  NULL |
+------------+--------------+-------+----------+-------+
  
4.Count number of employees with NULL manager_id
  select count(emp_id) from employees where manager_id is null;
+---------------+
| count(emp_id) |
+---------------+
|             3 |
+---------------+


LEVEL 2 (ISNULL)
=================
1.Replace NULL salary with 0
  
  select salary,IFNULL(salary,0)  from employees;
+--------+------------------+
| salary | IFNULL(salary,0) |
+--------+------------------+
|  50000 |            50000 |
|   NULL |                0 |
|  60000 |            60000 |
|   NULL |                0 |
|  45000 |            45000 |
|   NULL |                0 |
|  70000 |            70000 |
|   NULL |                0 |
+--------+------------------+
2.Replace NULL bonus with 1000
  select bonus,IFNULL(bonus,1000)  from employees;
+-------+--------------------+
| bonus | IFNULL(bonus,1000) |
+-------+--------------------+
|  NULL |               1000 |
|  5000 |               5000 |
|  NULL |               1000 |
|  NULL |               1000 |
|  3000 |               3000 |
|  NULL |               1000 |
|  7000 |               7000 |
|  2000 |               2000 |
+-------+--------------------+

3.Show order amount, if NULL replace with 500
   select amount,IFNULL(amount,500) from orders;;
+--------+--------------------+
| amount | IFNULL(amount,500) |
+--------+--------------------+
|   1000 |               1000 |
|   NULL |                500 |
|   2000 |               2000 |
|   NULL |                500 |
|   1500 |               1500 |
|   NULL |                500 |
|   3000 |               3000 |
|   NULL |                500 |
+--------+--------------------+

4.Replace NULL stock with 0
  
  select stock,IFNULL(stock,0) from products;;
+-------+-----------------+
| stock | IFNULL(stock,0) |
+-------+-----------------+
|    10 |              10 |
|  NULL |               0 |
|     5 |               5 |
|  NULL |               0 |
|     0 |               0 |
|    15 |              15 |
|  NULL |               0 |
|     3 |               3 |
+-------+-----------------+

LEVEL 3 (COALESCE)
===================
1.Show employee earnings using:
 salary, if NULL use bonus
  
select salary,bonus,COALESCE(salary,bonus) as employee_earnings from employees;
+--------+-------+-------------------+
| salary | bonus | employee_earnings |
+--------+-------+-------------------+
|  50000 |  NULL |             50000 |
|   NULL |  5000 |              5000 |
|  60000 |  NULL |             60000 |
|   NULL |  NULL |              NULL |
|  45000 |  3000 |             45000 |
|   NULL |  NULL |              NULL |
|  70000 |  7000 |             70000 |
|   NULL |  2000 |              2000 |
+--------+-------+-------------------+

2.Show first available value:
 salary → bonus → 0
select salary,bonus,COALESCE(salary,bonus,0) from employees;
+--------+-------+--------------------------+
| salary | bonus | COALESCE(salary,bonus,0) |
+--------+-------+--------------------------+
|  50000 |  NULL |                    50000 |
|   NULL |  5000 |                     5000 |
|  60000 |  NULL |                    60000 |
|   NULL |  NULL |                        0 |
|  45000 |  3000 |                    45000 |
|   NULL |  NULL |                        0 |
|  70000 |  7000 |                    70000 |
|   NULL |  2000 |                     2000 |
+--------+-------+--------------------------+

  

3.Show product price:
 price → 1000 (default)
  select price,COALESCE(price,1000) from products;
+-------+----------------------+
| price | COALESCE(price,1000) |
+-------+----------------------+
| 50000 |                50000 |
|  NULL |                 1000 |
| 30000 |                30000 |
|  NULL |                 1000 |
| 20000 |                20000 |
|  NULL |                 1000 |
|   500 |                  500 |
|  NULL |                 1000 |
+-------+----------------------+


4.Get customer payment:
 amount → discount → 0
  select amount,discount,COALESCE(amount,discount,0) from orders;
+--------+----------+-----------------------------+
| amount | discount | COALESCE(amount,discount,0) |
+--------+----------+-----------------------------+
|   1000 |     NULL |                        1000 |
|   NULL |       50 |                          50 |
|   2000 |     NULL |                        2000 |
|   NULL |     NULL |                           0 |
|   1500 |      100 |                        1500 |
|   NULL |     NULL |                           0 |
|   3000 |     NULL |                        3000 |
|   NULL |      200 |                         200 |
+--------+----------+-----------------------------+




LEVEL 4 (NULLIF)
================
1.Convert salary to NULL if salary = 0
  select salary,NULLIF(salary,0) from employees;
+--------+------------------+
| salary | NULLIF(salary,0) |
+--------+------------------+
|  50000 |            50000 |
|   NULL |             NULL |
|  60000 |            60000 |
|   NULL |             NULL |
|  45000 |            45000 |
|   NULL |             NULL |
|  70000 |            70000 |
|   NULL |             NULL |
+--------+------------------+


2.Convert discount to NULL if discount = 0
  select discount,NULLIF(discount,0) from orders;
+----------+--------------------+
| discount | NULLIF(discount,0) |
+----------+--------------------+
|     NULL |               NULL |
|       50 |                 50 |
|     NULL |               NULL |
|     NULL |               NULL |
|      100 |                100 |
|     NULL |               NULL |
|     NULL |               NULL |
|      200 |                200 |
+----------+--------------------+


3.Use NULLIF to avoid divide by zero:
SELECT amount / NULLIF(discount, 0)
FROM Orders;
Replace coupon_code with NULL if it is 'DISC10'

  select amount,discount,coupon_code,amount/NULLIF(discount,0),NULLIF(coupon_code,'DISC10') from orders;
+--------+----------+-------------+---------------------------+------------------------------+
| amount | discount | coupon_code | amount/NULLIF(discount,0) | NULLIF(coupon_code,'DISC10') |
+--------+----------+-------------+---------------------------+------------------------------+
|   1000 |     NULL | DISC10      |                      NULL | NULL                         |
|   NULL |       50 | NULL        |                      NULL | NULL                         |
|   2000 |     NULL | DISC20      |                      NULL | DISC20                       |
|   NULL |     NULL | NULL        |                      NULL | NULL                         |
|   1500 |      100 | NULL        |                   15.0000 | NULL                         |
|   NULL |     NULL | DISC5       |                      NULL | DISC5                        |
|   3000 |     NULL | NULL        |                      NULL | NULL                         |
|   NULL |      200 | DISC15      |                      NULL | DISC15                       |
+--------+----------+-------------+---------------------------+------------------------------+


LEVEL 5 (REAL-TIME SCENARIOS)
=============================
1.Calculate total earnings:
   salary + bonus (handle NULL properly)
  
select salary,bonus,IFNULL(salary,0)+IFNULL(bonus,0) as total_earnings from employees;
+--------+-------+----------------+
| salary | bonus | total_earnings |
+--------+-------+----------------+
|  50000 |  NULL |          50000 |
|   NULL |  5000 |           5000 |
|  60000 |  NULL |          60000 |
|   NULL |  NULL |              0 |
|  45000 |  3000 |          48000 |
|   NULL |  NULL |              0 |
|  70000 |  7000 |          77000 |
|   NULL |  2000 |           2000 |
+--------+-------+----------------+
 
2.Show employees where:
   both salary AND bonus are NULL
 select * from employees where salary is null and bonus is null;
+--------+-------+--------+-------+------------+
| emp_id | name  | salary | bonus | manager_id |
+--------+-------+--------+-------+------------+
|      4 | David |   NULL |  NULL |        103 |
|      6 | Kiran |   NULL |  NULL |       NULL |
+--------+-------+--------+-------+------------+

3.Show products where:
   price is NULL but category is NOT NULL
select * from products where price is null and category is not null;
+------------+--------------+-------+-------------+-------+
| product_id | product_name | price | category    | stock |
+------------+--------------+-------+-------------+-------+
|          2 | Phone        |  NULL | Electronics |  NULL |
|          6 | Keyboard     |  NULL | Accessories |    15 |
|          8 | Printer      |  NULL | Electronics |     3 |
+------------+--------------+-------+-------------+-------+

4.Show orders where:
   both amount and discount are NULL
  select * from orders where amount is null and discount is  null;
+----------+---------------+--------+----------+-------------+
| order_id | customer_name | amount | discount | coupon_code |
+----------+---------------+--------+----------+-------------+
|      104 | David         |   NULL |     NULL | NULL        |
|      106 | Kiran         |   NULL |     NULL | DISC5       |
+----------+---------------+--------+----------+-------------+
  

LEVEL 6 (ADVANCED)
==================
1.Show employee income:
  COALESCE(salary, bonus, 1000)
  select salary,bonus,COALESCE(salary,bonus,1000) as employee_income from employees;
+--------+-------+-----------------+
| salary | bonus | employee_income |
+--------+-------+-----------------+
|  50000 |  NULL |           50000 |
|   NULL |  5000 |            5000 |
|  60000 |  NULL |           60000 |
|   NULL |  NULL |            1000 |
|  45000 |  3000 |           45000 |
|   NULL |  NULL |            1000 |
|  70000 |  7000 |           70000 |
|   NULL |  2000 |            2000 |
+--------+-------+-----------------+

2.Replace empty discount with NULL using NULLIF:
NULLIF(discount, 0)
  select discount,NULLIF(discount,0) as new_discount from orders;
+----------+--------------+
| discount | new_discount |
+----------+--------------+
|     NULL |         NULL |
|       50 |           50 |
|     NULL |         NULL |
|     NULL |         NULL |
|      100 |          100 |
|     NULL |         NULL |
|     NULL |         NULL |
|      200 |          200 |
+----------+--------------+
 
3.Show final payable amount:
  amount - discount (handle NULL)
  select amount,discount,IFNULL(amount,0)-IFNULL(discount,0) as payable_amount from orders;
+--------+----------+----------------+
| amount | discount | payable_amount |
+--------+----------+----------------+
|   1000 |     NULL |           1000 |
|   NULL |       50 |            -50 |
|   2000 |     NULL |           2000 |
|   NULL |     NULL |              0 |
|   1500 |      100 |           1400 |
|   NULL |     NULL |              0 |
|   3000 |     NULL |           3000 |
|   NULL |      200 |           -200 |
+--------+----------+----------------+

4.Find employees where salary is NULL but manager exists
select * from employees where salary is null and manager_id is not null;
+--------+-------+--------+-------+------------+
| emp_id | name  | salary | bonus | manager_id |
+--------+-------+--------+-------+------------+
|      2 | John  |   NULL |  5000 |        102 |
|      4 | David |   NULL |  NULL |        103 |
+--------+-------+--------+-------+------------+



