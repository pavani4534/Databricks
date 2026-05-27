CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    join_date DATE
);


INSERT INTO employees VALUES
(1, 'Amit', 'IT', 70000, '2021-01-10'),
(2, 'Ravi', 'HR', 50000, '2020-03-15'),
(3, 'Sneha', 'Finance', 65000, '2019-07-20'),
(4, 'Kiran', 'IT', 72000, '2022-05-12'),
(5, 'Priya', 'HR', 55000, '2021-09-18'),
(6, 'Arjun', 'Finance', 60000, '2020-11-25'),
(7, 'Neha', 'IT', 68000, '2018-12-01'),
(8, 'Vikas', 'Marketing', 52000, '2021-06-30'),
(9, 'Anjali', 'Marketing', 58000, '2022-02-14'),
(10, 'Rahul', 'Finance', 75000, '2019-10-05'),
(11, 'Suresh', 'IT', 80000, '2017-08-19'),
(12, 'Pooja', 'HR', 53000, '2023-01-11'),
(13, 'Manoj', 'Marketing', 61000, '2020-04-22'),
(14, 'Divya', 'Finance', 67000, '2021-07-09'),
(15, 'Karthik', 'IT', 71000, '2019-03-17'),
(16, 'Meena', 'HR', 56000, '2022-08-26'),
(17, 'Raj', 'Marketing', 59000, '2020-12-13'),
(18, 'Simran', 'Finance', 64000, '2021-11-29'),
(19, 'Deepak', 'IT', 69000, '2018-05-08'),
(20, 'Nisha', 'HR', 54000, '2023-03-21');

 CREATE TABLE orders (
        order_id INT,
         cust_name VARCHAR(50),
         city VARCHAR(50),
        order_amount INT,
         order_date DATE
     );


INSERT INTO orders VALUES
(1, 'Amit', 'Chennai', 2000, '2023-01-01'),
(2, 'Ravi', 'Hyderabad', 1500, '2023-01-02'),
(3, 'Sneha', 'Chennai', 3000, '2023-01-03'),
(4, 'Kiran', 'Bangalore', 2500, '2023-01-04'),
(5, 'Priya', 'Chennai', 2000, '2023-01-05'),
(6, 'Arjun', 'Hyderabad', 1800, '2023-01-06'),
(7, 'Neha', 'Bangalore', 2200, '2023-01-07'),
(8, 'Vikas', 'Chennai', 3000, '2023-01-08'),
(9, 'Anjali', 'Hyderabad', 1700, '2023-01-09'),
(10, 'Rahul', 'Bangalore', 2600, '2023-01-10'),
(11, 'Suresh', 'Chennai', 2800, '2023-01-11'),
(12, 'Pooja', 'Hyderabad', 1600, '2023-01-12'),
(13, 'Manoj', 'Bangalore', 2400, '2023-01-13'),
(14, 'Divya', 'Chennai', 2100, '2023-01-14'),
(15, 'Karthik', 'Hyderabad', 1900, '2023-01-15'),
(16, 'Meena', 'Bangalore', 2300, '2023-01-16'),
(17, 'Raj', 'Chennai', 2700, '2023-01-17'),
(18, 'Simran', 'Hyderabad', 2000, '2023-01-18'),
(19, 'Deepak', 'Bangalore', 2500, '2023-01-19'),
(20, 'Nisha', 'Chennai', 2600, '2023-01-20');

 ROW_NUMBER() ONLY Questions

1.	Assign a unique row number to all employees based on salary (highest first).
 select emp_id,emp_name,salary,row_number() over(order by salary desc) as row_num from employees;
+--------+----------+--------+---------+
| emp_id | emp_name | salary | row_num |
+--------+----------+--------+---------+
|     11 | Suresh   |  80000 |       1 |
|     10 | Rahul    |  75000 |       2 |
|      4 | Kiran    |  72000 |       3 |
|     15 | Karthik  |  71000 |       4 |
|      1 | Amit     |  70000 |       5 |
|     19 | Deepak   |  69000 |       6 |
|      7 | Neha     |  68000 |       7 |
|     14 | Divya    |  67000 |       8 |
|      3 | Sneha    |  65000 |       9 |
|     18 | Simran   |  64000 |      10 |
|     13 | Manoj    |  61000 |      11 |
|      6 | Arjun    |  60000 |      12 |
|     17 | Raj      |  59000 |      13 |
|      9 | Anjali   |  58000 |      14 |
|     16 | Meena    |  56000 |      15 |
|      5 | Priya    |  55000 |      16 |
|     20 | Nisha    |  54000 |      17 |
|     12 | Pooja    |  53000 |      18 |
|      8 | Vikas    |  52000 |      19 |
|      2 | Ravi     |  50000 |      20 |
+--------+----------+--------+---------+

2.	Assign row numbers to employees within each department based on salary descending.
select emp_id,emp_name,salary,department,row_number() over(partition by department order by salary desc) as row_num from employees;
+--------+----------+--------+------------+---------+
| emp_id | emp_name | salary | department | row_num |
+--------+----------+--------+------------+---------+
|     10 | Rahul    |  75000 | Finance    |       1 |
|     14 | Divya    |  67000 | Finance    |       2 |
|      3 | Sneha    |  65000 | Finance    |       3 |
|     18 | Simran   |  64000 | Finance    |       4 |
|      6 | Arjun    |  60000 | Finance    |       5 |
|     16 | Meena    |  56000 | HR         |       1 |
|      5 | Priya    |  55000 | HR         |       2 |
|     20 | Nisha    |  54000 | HR         |       3 |
|     12 | Pooja    |  53000 | HR         |       4 |
|      2 | Ravi     |  50000 | HR         |       5 |
|     11 | Suresh   |  80000 | IT         |       1 |
|      4 | Kiran    |  72000 | IT         |       2 |
|     15 | Karthik  |  71000 | IT         |       3 |
|      1 | Amit     |  70000 | IT         |       4 |
|     19 | Deepak   |  69000 | IT         |       5 |
|      7 | Neha     |  68000 | IT         |       6 |
|     13 | Manoj    |  61000 | Marketing  |       1 |
|     17 | Raj      |  59000 | Marketing  |       2 |
|      9 | Anjali   |  58000 | Marketing  |       3 |
|      8 | Vikas    |  52000 | Marketing  |       4 |
+--------+----------+--------+------------+---------+
 
 

3.	Assign row numbers based on employee joining date (latest first).

 select emp_id,emp_name,join_date,row_number() over( order by join_date desc) as row_num from employees;
+--------+----------+------------+---------+
| emp_id | emp_name | join_date  | row_num |
+--------+----------+------------+---------+
|     20 | Nisha    | 2023-03-21 |       1 |
|     12 | Pooja    | 2023-01-11 |       2 |
|     16 | Meena    | 2022-08-26 |       3 |
|      4 | Kiran    | 2022-05-12 |       4 |
|      9 | Anjali   | 2022-02-14 |       5 |
|     18 | Simran   | 2021-11-29 |       6 |
|      5 | Priya    | 2021-09-18 |       7 |
|     14 | Divya    | 2021-07-09 |       8 |
|      8 | Vikas    | 2021-06-30 |       9 |
|      1 | Amit     | 2021-01-10 |      10 |
|     17 | Raj      | 2020-12-13 |      11 |
|      6 | Arjun    | 2020-11-25 |      12 |
|     13 | Manoj    | 2020-04-22 |      13 |
|      2 | Ravi     | 2020-03-15 |      14 |
|     10 | Rahul    | 2019-10-05 |      15 |
|      3 | Sneha    | 2019-07-20 |      16 |
|     15 | Karthik  | 2019-03-17 |      17 |
|      7 | Neha     | 2018-12-01 |      18 |
|     19 | Deepak   | 2018-05-08 |      19 |
|     11 | Suresh   | 2017-08-19 |      20 |
+--------+----------+------------+---------+
 

 4.	Assign row numbers within each department based on earliest joining date.

select emp_id,emp_name,join_date,department,row_number() over(partition by department  order by join_date asc) as row_num from employees;
+--------+----------+------------+------------+---------+
| emp_id | emp_name | join_date  | department | row_num |
+--------+----------+------------+------------+---------+
|      3 | Sneha    | 2019-07-20 | Finance    |       1 |
|     10 | Rahul    | 2019-10-05 | Finance    |       2 |
|      6 | Arjun    | 2020-11-25 | Finance    |       3 |
|     14 | Divya    | 2021-07-09 | Finance    |       4 |
|     18 | Simran   | 2021-11-29 | Finance    |       5 |
|      2 | Ravi     | 2020-03-15 | HR         |       1 |
|      5 | Priya    | 2021-09-18 | HR         |       2 |
|     16 | Meena    | 2022-08-26 | HR         |       3 |
|     12 | Pooja    | 2023-01-11 | HR         |       4 |
|     20 | Nisha    | 2023-03-21 | HR         |       5 |
|     11 | Suresh   | 2017-08-19 | IT         |       1 |
|     19 | Deepak   | 2018-05-08 | IT         |       2 |
|      7 | Neha     | 2018-12-01 | IT         |       3 |
|     15 | Karthik  | 2019-03-17 | IT         |       4 |
|      1 | Amit     | 2021-01-10 | IT         |       5 |
|      4 | Kiran    | 2022-05-12 | IT         |       6 |
|     13 | Manoj    | 2020-04-22 | Marketing  |       1 |
|     17 | Raj      | 2020-12-13 | Marketing  |       2 |
|      8 | Vikas    | 2021-06-30 | Marketing  |       3 |
|      9 | Anjali   | 2022-02-14 | Marketing  |       4 |
+--------+----------+------------+------------+---------+


5.	Assign row numbers to orders based on order date.

select order_id,cust_name,order_date ,row_number() over(order by order_date asc) as row_num from orders;
+----------+-----------+------------+---------+
| order_id | cust_name | order_date | row_num |
+----------+-----------+------------+---------+
|        1 | Amit      | 2023-01-01 |       1 |
|        2 | Ravi      | 2023-01-02 |       2 |
|        3 | Sneha     | 2023-01-03 |       3 |
|        4 | Kiran     | 2023-01-04 |       4 |
|        5 | Priya     | 2023-01-05 |       5 |
|        6 | Arjun     | 2023-01-06 |       6 |
|        7 | Neha      | 2023-01-07 |       7 |
|        8 | Vikas     | 2023-01-08 |       8 |
|        9 | Anjali    | 2023-01-09 |       9 |
|       10 | Rahul     | 2023-01-10 |      10 |
|       11 | Suresh    | 2023-01-11 |      11 |
|       12 | Pooja     | 2023-01-12 |      12 |
|       13 | Manoj     | 2023-01-13 |      13 |
|       14 | Divya     | 2023-01-14 |      14 |
|       15 | Karthik   | 2023-01-15 |      15 |
|       16 | Meena     | 2023-01-16 |      16 |
|       17 | Raj       | 2023-01-17 |      17 |
|       18 | Simran    | 2023-01-18 |      18 |
|       19 | Deepak    | 2023-01-19 |      19 |
|       20 | Nisha     | 2023-01-20 |      20 |
+----------+-----------+------------+---------+


6.	Assign row numbers to orders within each city based on order amount (highest first).
select order_id,cust_name,city,order_amount,row_number() over(partition by city order by order_amount desc) as row_num from orders;
+----------+-----------+-----------+--------------+---------+
| order_id | cust_name | city      | order_amount | row_num |
+----------+-----------+-----------+--------------+---------+
|       10 | Rahul     | Bangalore |         2600 |       1 |
|        4 | Kiran     | Bangalore |         2500 |       2 |
|       19 | Deepak    | Bangalore |         2500 |       3 |
|       13 | Manoj     | Bangalore |         2400 |       4 |
|       16 | Meena     | Bangalore |         2300 |       5 |
|        7 | Neha      | Bangalore |         2200 |       6 |
|        3 | Sneha     | Chennai   |         3000 |       1 |
|        8 | Vikas     | Chennai   |         3000 |       2 |
|       11 | Suresh    | Chennai   |         2800 |       3 |
|       17 | Raj       | Chennai   |         2700 |       4 |
|       20 | Nisha     | Chennai   |         2600 |       5 |
|       14 | Divya     | Chennai   |         2100 |       6 |
|        1 | Amit      | Chennai   |         2000 |       7 |
|        5 | Priya     | Chennai   |         2000 |       8 |
|       18 | Simran    | Hyderabad |         2000 |       1 |
|       15 | Karthik   | Hyderabad |         1900 |       2 |
|        6 | Arjun     | Hyderabad |         1800 |       3 |
|        9 | Anjali    | Hyderabad |         1700 |       4 |
|       12 | Pooja     | Hyderabad |         1600 |       5 |
|        2 | Ravi      | Hyderabad |         1500 |       6 |
+----------+-----------+-----------+--------------+---------+
7.	Assign row numbers to employees based on salary (lowest first).

select emp_id,emp_name,salary,row_number() over(order by salary asc) as row_num from employees;
+--------+----------+--------+---------+
| emp_id | emp_name | salary | row_num |
+--------+----------+--------+---------+
|      2 | Ravi     |  50000 |       1 |
|      8 | Vikas    |  52000 |       2 |
|     12 | Pooja    |  53000 |       3 |
|     20 | Nisha    |  54000 |       4 |
|      5 | Priya    |  55000 |       5 |
|     16 | Meena    |  56000 |       6 |
|      9 | Anjali   |  58000 |       7 |
|     17 | Raj      |  59000 |       8 |
|      6 | Arjun    |  60000 |       9 |
|     13 | Manoj    |  61000 |      10 |
|     18 | Simran   |  64000 |      11 |
|      3 | Sneha    |  65000 |      12 |
|     14 | Divya    |  67000 |      13 |
|      7 | Neha     |  68000 |      14 |
|     19 | Deepak   |  69000 |      15 |
|      1 | Amit     |  70000 |      16 |
|     15 | Karthik  |  71000 |      17 |
|      4 | Kiran    |  72000 |      18 |
|     10 | Rahul    |  75000 |      19 |
|     11 | Suresh   |  80000 |      20 |
+--------+----------+--------+---------+

8.	Assign row numbers within department for employees based on name alphabetically.

 select emp_id,emp_name,department,row_number() over(partition by department order by emp_name asc) as row_num from employees;
+--------+----------+------------+---------+
| emp_id | emp_name | department | row_num |
+--------+----------+------------+---------+
|      6 | Arjun    | Finance    |       1 |
|     14 | Divya    | Finance    |       2 |
|     10 | Rahul    | Finance    |       3 |
|     18 | Simran   | Finance    |       4 |
|      3 | Sneha    | Finance    |       5 |
|     16 | Meena    | HR         |       1 |
|     20 | Nisha    | HR         |       2 |
|     12 | Pooja    | HR         |       3 |
|      5 | Priya    | HR         |       4 |
|      2 | Ravi     | HR         |       5 |
|      1 | Amit     | IT         |       1 |
|     19 | Deepak   | IT         |       2 |
|     15 | Karthik  | IT         |       3 |
|      4 | Kiran    | IT         |       4 |
|      7 | Neha     | IT         |       5 |
|     11 | Suresh   | IT         |       6 |
|      9 | Anjali   | Marketing  |       1 |
|     13 | Manoj    | Marketing  |       2 |
|     17 | Raj      | Marketing  |       3 |
|      8 | Vikas    | Marketing  |       4 |
+--------+----------+------------+---------+




RANK() ONLY Questions
9.	Rank all employees based on salary (highest first).

select emp_id,emp_name,salary,rank() over(order by salary desc) as rank_sal  from employees;
+--------+----------+--------+----------+
| emp_id | emp_name | salary | rank_sal |
+--------+----------+--------+----------+
|     11 | Suresh   |  80000 |        1 |
|     10 | Rahul    |  75000 |        2 |
|      4 | Kiran    |  72000 |        3 |
|     15 | Karthik  |  71000 |        4 |
|      1 | Amit     |  70000 |        5 |
|     19 | Deepak   |  69000 |        6 |
|      7 | Neha     |  68000 |        7 |
|     14 | Divya    |  67000 |        8 |
|      3 | Sneha    |  65000 |        9 |
|     18 | Simran   |  64000 |       10 |
|     13 | Manoj    |  61000 |       11 |
|      6 | Arjun    |  60000 |       12 |
|     17 | Raj      |  59000 |       13 |
|      9 | Anjali   |  58000 |       14 |
|     16 | Meena    |  56000 |       15 |
|      5 | Priya    |  55000 |       16 |
|     20 | Nisha    |  54000 |       17 |
|     12 | Pooja    |  53000 |       18 |
|      8 | Vikas    |  52000 |       19 |
|      2 | Ravi     |  50000 |       20 |
+--------+----------+--------+----------+

10.	Rank employees within each department based on salary.
 select emp_id,emp_name,department,salary,rank() over(partition by department order by salary asc) as rank_emp  from employees;
+--------+----------+------------+--------+----------+
| emp_id | emp_name | department | salary | rank_emp |
+--------+----------+------------+--------+----------+
|      6 | Arjun    | Finance    |  60000 |        1 |
|     18 | Simran   | Finance    |  64000 |        2 |
|      3 | Sneha    | Finance    |  65000 |        3 |
|     14 | Divya    | Finance    |  67000 |        4 |
|     10 | Rahul    | Finance    |  75000 |        5 |
|      2 | Ravi     | HR         |  50000 |        1 |
|     12 | Pooja    | HR         |  53000 |        2 |
|     20 | Nisha    | HR         |  54000 |        3 |
|      5 | Priya    | HR         |  55000 |        4 |
|     16 | Meena    | HR         |  56000 |        5 |
|      7 | Neha     | IT         |  68000 |        1 |
|     19 | Deepak   | IT         |  69000 |        2 |
|      1 | Amit     | IT         |  70000 |        3 |
|     15 | Karthik  | IT         |  71000 |        4 |
|      4 | Kiran    | IT         |  72000 |        5 |
|     11 | Suresh   | IT         |  80000 |        6 |
|      8 | Vikas    | Marketing  |  52000 |        1 |
|      9 | Anjali   | Marketing  |  58000 |        2 |
|     17 | Raj      | Marketing  |  59000 |        3 |
|     13 | Manoj    | Marketing  |  61000 |        4 |
+--------+----------+------------+--------+----------+

11.	Rank employees based on joining date (latest gets rank 1).

 select emp_id,emp_name,join_date,rank() over(order by join_date desc) as rank_emp from employees;
+--------+----------+------------+----------+
| emp_id | emp_name | join_date  | rank_emp |
+--------+----------+------------+----------+
|     20 | Nisha    | 2023-03-21 |        1 |
|     12 | Pooja    | 2023-01-11 |        2 |
|     16 | Meena    | 2022-08-26 |        3 |
|      4 | Kiran    | 2022-05-12 |        4 |
|      9 | Anjali   | 2022-02-14 |        5 |
|     18 | Simran   | 2021-11-29 |        6 |
|      5 | Priya    | 2021-09-18 |        7 |
|     14 | Divya    | 2021-07-09 |        8 |
|      8 | Vikas    | 2021-06-30 |        9 |
|      1 | Amit     | 2021-01-10 |       10 |
|     17 | Raj      | 2020-12-13 |       11 |
|      6 | Arjun    | 2020-11-25 |       12 |
|     13 | Manoj    | 2020-04-22 |       13 |
|      2 | Ravi     | 2020-03-15 |       14 |
|     10 | Rahul    | 2019-10-05 |       15 |
|      3 | Sneha    | 2019-07-20 |       16 |
|     15 | Karthik  | 2019-03-17 |       17 |
|      7 | Neha     | 2018-12-01 |       18 |
|     19 | Deepak   | 2018-05-08 |       19 |
|     11 | Suresh   | 2017-08-19 |       20 |
+--------+----------+------------+----------+



12.	Rank orders based on order amount (highest first).

 select order_id,cust_name,order_amount,rank() over(order by order_amount desc) as rank_emp from orders;
+----------+-----------+--------------+----------+
| order_id | cust_name | order_amount | rank_emp |
+----------+-----------+--------------+----------+
|        3 | Sneha     |         3000 |        1 |
|        8 | Vikas     |         3000 |        1 |
|       11 | Suresh    |         2800 |        3 |
|       17 | Raj       |         2700 |        4 |
|       10 | Rahul     |         2600 |        5 |
|       20 | Nisha     |         2600 |        5 |
|        4 | Kiran     |         2500 |        7 |
|       19 | Deepak    |         2500 |        7 |
|       13 | Manoj     |         2400 |        9 |
|       16 | Meena     |         2300 |       10 |
|        7 | Neha      |         2200 |       11 |
|       14 | Divya     |         2100 |       12 |
|        1 | Amit      |         2000 |       13 |
|        5 | Priya     |         2000 |       13 |
|       18 | Simran    |         2000 |       13 |
|       15 | Karthik   |         1900 |       16 |
|        6 | Arjun     |         1800 |       17 |
|        9 | Anjali    |         1700 |       18 |
|       12 | Pooja     |         1600 |       19 |
|        2 | Ravi      |         1500 |       20 |
+----------+-----------+--------------+----------+


13.	Rank orders within each city based on order amount.

select order_id,cust_name,city,order_amount,rank() over(partition by city order by order_amount asc) as rank_emp from orders;
+----------+-----------+-----------+--------------+----------+
| order_id | cust_name | city      | order_amount | rank_emp |
+----------+-----------+-----------+--------------+----------+
|        7 | Neha      | Bangalore |         2200 |        1 |
|       16 | Meena     | Bangalore |         2300 |        2 |
|       13 | Manoj     | Bangalore |         2400 |        3 |
|        4 | Kiran     | Bangalore |         2500 |        4 |
|       19 | Deepak    | Bangalore |         2500 |        4 |
|       10 | Rahul     | Bangalore |         2600 |        6 |
|        1 | Amit      | Chennai   |         2000 |        1 |-
|        5 | Priya     | Chennai   |         2000 |        1 |
|       14 | Divya     | Chennai   |         2100 |        3 |
|       20 | Nisha     | Chennai   |         2600 |        4 |
|       17 | Raj       | Chennai   |         2700 |        5 |
|       11 | Suresh    | Chennai   |         2800 |        6 |
|        3 | Sneha     | Chennai   |         3000 |        7 |
|        8 | Vikas     | Chennai   |         3000 |        7 |
|        2 | Ravi      | Hyderabad |         1500 |        1 |
|       12 | Pooja     | Hyderabad |         1600 |        2 |
|        9 | Anjali    | Hyderabad |         1700 |        3 |
|        6 | Arjun     | Hyderabad |         1800 |        4 |
|       15 | Karthik   | Hyderabad |         1900 |        5 |
|       18 | Simran    | Hyderabad |         2000 |        6 |
+----------+-----------+-----------+--------------+----------+
14.	Rank employees within department based on salary (lowest first).
select emp_id,emp_name,department,salary,rank() over(partition by department order by salary asc) as rank_emp from employees;
+--------+----------+------------+--------+----------+
| emp_id | emp_name | department | salary | rank_emp |
+--------+----------+------------+--------+----------+
|      6 | Arjun    | Finance    |  60000 |        1 |
|     18 | Simran   | Finance    |  64000 |        2 |
|      3 | Sneha    | Finance    |  65000 |        3 |
|     14 | Divya    | Finance    |  67000 |        4 |
|     10 | Rahul    | Finance    |  75000 |        5 |
|      2 | Ravi     | HR         |  50000 |        1 |
|     12 | Pooja    | HR         |  53000 |        2 |
|     20 | Nisha    | HR         |  54000 |        3 |
|      5 | Priya    | HR         |  55000 |        4 |
|     16 | Meena    | HR         |  56000 |        5 |
|      7 | Neha     | IT         |  68000 |        1 |
|     19 | Deepak   | IT         |  69000 |        2 |
|      1 | Amit     | IT         |  70000 |        3 |
|     15 | Karthik  | IT         |  71000 |        4 |
|      4 | Kiran    | IT         |  72000 |        5 |
|     11 | Suresh   | IT         |  80000 |        6 |
|      8 | Vikas    | Marketing  |  52000 |        1 |
|      9 | Anjali   | Marketing  |  58000 |        2 |
|     17 | Raj      | Marketing  |  59000 |        3 |
|     13 | Manoj    | Marketing  |  61000 |        4 |
+--------+----------+------------+--------+----------+

15.	Rank employees based on name alphabetically.

select emp_id,emp_name,rank() over(order by emp_name asc) as rank_emp from employees;
+--------+----------+----------+
| emp_id | emp_name | rank_emp |
+--------+----------+----------+
|      1 | Amit     |        1 |
|      9 | Anjali   |        2 |
|      6 | Arjun    |        3 |
|     19 | Deepak   |        4 |
|     14 | Divya    |        5 |
|     15 | Karthik  |        6 |
|      4 | Kiran    |        7 |
|     13 | Manoj    |        8 |
|     16 | Meena    |        9 |
|      7 | Neha     |       10 |
|     20 | Nisha    |       11 |
|     12 | Pooja    |       12 |
|      5 | Priya    |       13 |
|     10 | Rahul    |       14 |
|     17 | Raj      |       15 |
|      2 | Ravi     |       16 |
|     18 | Simran   |       17 |
|      3 | Sneha    |       18 |
|     11 | Suresh   |       19 |
|      8 | Vikas    |       20 |
+--------+----------+----------+
 
 
16.	Rank orders within each city based on order date.

select order_id,city,order_date ,rank() over(partition by city order by order_date ) as rank_ord from orders;
+----------+-----------+------------+----------+
| order_id | city      | order_date | rank_ord |
+----------+-----------+------------+----------+
|        4 | Bangalore | 2023-01-04 |        1 |
|        7 | Bangalore | 2023-01-07 |        2 |
|       10 | Bangalore | 2023-01-10 |        3 |
|       13 | Bangalore | 2023-01-13 |        4 |
|       16 | Bangalore | 2023-01-16 |        5 |
|       19 | Bangalore | 2023-01-19 |        6 |
|        1 | Chennai   | 2023-01-01 |        1 |
|        3 | Chennai   | 2023-01-03 |        2 |
|        5 | Chennai   | 2023-01-05 |        3 |
|        8 | Chennai   | 2023-01-08 |        4 |
|       11 | Chennai   | 2023-01-11 |        5 |
|       14 | Chennai   | 2023-01-14 |        6 |
|       17 | Chennai   | 2023-01-17 |        7 |
|       20 | Chennai   | 2023-01-20 |        8 |
|        2 | Hyderabad | 2023-01-02 |        1 |
|        6 | Hyderabad | 2023-01-06 |        2 |
|        9 | Hyderabad | 2023-01-09 |        3 |
|       12 | Hyderabad | 2023-01-12 |        4 |
|       15 | Hyderabad | 2023-01-15 |        5 |
|       18 | Hyderabad | 2023-01-18 |        6 |
+----------+-----------+------------+----------+

 
🔹 DENSE_RANK() ONLY Questions
17.	Assign dense rank to employees based on salary (highestfirst).


select emp_id,emp_name,salary,dense_rank() over(order by salary desc)as emp_dense from employees;
+--------+----------+--------+-----------+
| emp_id | emp_name | salary | emp_dense |
+--------+----------+--------+-----------+
|     11 | Suresh   |  80000 |         1 |
|     10 | Rahul    |  75000 |         2 |
|      4 | Kiran    |  72000 |         3 |
|     15 | Karthik  |  71000 |         4 |
|      1 | Amit     |  70000 |         5 |
|     19 | Deepak   |  69000 |         6 |
|      7 | Neha     |  68000 |         7 |
|     14 | Divya    |  67000 |         8 |
|      3 | Sneha    |  65000 |         9 |
|     18 | Simran   |  64000 |        10 |
|     13 | Manoj    |  61000 |        11 |
|      6 | Arjun    |  60000 |        12 |
|     17 | Raj      |  59000 |        13 |
|      9 | Anjali   |  58000 |        14 |
|     16 | Meena    |  56000 |        15 |
|      5 | Priya    |  55000 |        16 |
|     20 | Nisha    |  54000 |        17 |
|     12 | Pooja    |  53000 |        18 |
|      8 | Vikas    |  52000 |        19 |
|      2 | Ravi     |  50000 |        20 |
-------------------------------------------
 
18.	Assign dense rank within each department based on salary.

 
select emp_id,emp_name,salary,department,dense_rank() over(partition by department order by salary )as emp_dense from employees;
+--------+----------+--------+------------+-----------+
| emp_id | emp_name | salary | department | emp_dense |
+--------+----------+--------+------------+-----------+
|      6 | Arjun    |  60000 | Finance    |         1 |
|     18 | Simran   |  64000 | Finance    |         2 |
|      3 | Sneha    |  65000 | Finance    |         3 |
|     14 | Divya    |  67000 | Finance    |         4 |
|     10 | Rahul    |  75000 | Finance    |         5 |
|      2 | Ravi     |  50000 | HR         |         1 |
|     12 | Pooja    |  53000 | HR         |         2 |
|     20 | Nisha    |  54000 | HR         |         3 |
|      5 | Priya    |  55000 | HR         |         4 |
|     16 | Meena    |  56000 | HR         |         5 |
|      7 | Neha     |  68000 | IT         |         1 |
|     19 | Deepak   |  69000 | IT         |         2 |
|      1 | Amit     |  70000 | IT         |         3 |
|     15 | Karthik  |  71000 | IT         |         4 |
|      4 | Kiran    |  72000 | IT         |         5 |
|     11 | Suresh   |  80000 | IT         |         6 |
|      8 | Vikas    |  52000 | Marketing  |         1 |
|      9 | Anjali   |  58000 | Marketing  |         2 |
|     17 | Raj      |  59000 | Marketing  |         3 |
|     13 | Manoj    |  61000 | Marketing  |         4 |
+--------+----------+--------+------------+-----------+

 

19.	Assign dense rank to employees based on joining date.

select emp_id,emp_name,join_date,dense_rank() over(order by join_date )as emp_dense from employees;
+--------+----------+------------+-----------+
| emp_id | emp_name | join_date  | emp_dense |
+--------+----------+------------+-----------+
|     11 | Suresh   | 2017-08-19 |         1 |
|     19 | Deepak   | 2018-05-08 |         2 |
|      7 | Neha     | 2018-12-01 |         3 |
|     15 | Karthik  | 2019-03-17 |         4 |
|      3 | Sneha    | 2019-07-20 |         5 |
|     10 | Rahul    | 2019-10-05 |         6 |
|      2 | Ravi     | 2020-03-15 |         7 |
|     13 | Manoj    | 2020-04-22 |         8 |
|      6 | Arjun    | 2020-11-25 |         9 |
|     17 | Raj      | 2020-12-13 |        10 |
|      1 | Amit     | 2021-01-10 |        11 |
|      8 | Vikas    | 2021-06-30 |        12 |
|     14 | Divya    | 2021-07-09 |        13 |
|      5 | Priya    | 2021-09-18 |        14 |
|     18 | Simran   | 2021-11-29 |        15 |
|      9 | Anjali   | 2022-02-14 |        16 |
|      4 | Kiran    | 2022-05-12 |        17 |
|     16 | Meena    | 2022-08-26 |        18 |
|     12 | Pooja    | 2023-01-11 |        19 |
|     20 | Nisha    | 2023-03-21 |        20 |
+--------+----------+------------+-----------+

20.	Assign dense rank to orders based on order amount.


 select order_id,cust_name,order_amount,dense_rank() over(order by order_amount )as ord_dense from orders;
+----------+-----------+--------------+-----------+
| order_id | cust_name | order_amount | ord_dense |
+----------+-----------+--------------+-----------+
|        2 | Ravi      |         1500 |         1 |
|       12 | Pooja     |         1600 |         2 |
|        9 | Anjali    |         1700 |         3 |
|        6 | Arjun     |         1800 |         4 |
|       15 | Karthik   |         1900 |         5 |
|        1 | Amit      |         2000 |         6 |
|        5 | Priya     |         2000 |         6 |
|       18 | Simran    |         2000 |         6 |
|       14 | Divya     |         2100 |         7 |
|        7 | Neha      |         2200 |         8 |
|       16 | Meena     |         2300 |         9 |
|       13 | Manoj     |         2400 |        10 |
|        4 | Kiran     |         2500 |        11 |
|       19 | Deepak    |         2500 |        11 |
|       10 | Rahul     |         2600 |        12 |
|       20 | Nisha     |         2600 |        12 |
|       17 | Raj       |         2700 |        13 |
|       11 | Suresh    |         2800 |        14 |
|        3 | Sneha     |         3000 |        15 |
|        8 | Vikas     |         3000 |        15 |
+----------+-----------+--------------+-----------+

21.	Assign dense rank within each city based on order amount.

select order_id,cust_name,city,order_amount,dense_rank() over(partition by city order by order_amount )as ord_dense from orders;
+----------+-----------+-----------+--------------+-----------+
| order_id | cust_name | city      | order_amount | ord_dense |
+----------+-----------+-----------+--------------+-----------+
|        7 | Neha      | Bangalore |         2200 |         1 |
|       16 | Meena     | Bangalore |         2300 |         2 |
|       13 | Manoj     | Bangalore |         2400 |         3 |
|        4 | Kiran     | Bangalore |         2500 |         4 |
|       19 | Deepak    | Bangalore |         2500 |         4 |
|       10 | Rahul     | Bangalore |         2600 |         5 |
|        1 | Amit      | Chennai   |         2000 |         1 |
|        5 | Priya     | Chennai   |         2000 |         1 |
|       14 | Divya     | Chennai   |         2100 |         2 |
|       20 | Nisha     | Chennai   |         2600 |         3 |
|       17 | Raj       | Chennai   |         2700 |         4 |
|       11 | Suresh    | Chennai   |         2800 |         5 |
|        3 | Sneha     | Chennai   |         3000 |         6 |
|        8 | Vikas     | Chennai   |         3000 |         6 |
|        2 | Ravi      | Hyderabad |         1500 |         1 |
|       12 | Pooja     | Hyderabad |         1600 |         2 |
|        9 | Anjali    | Hyderabad |         1700 |         3 |
|        6 | Arjun     | Hyderabad |         1800 |         4 |
|       15 | Karthik   | Hyderabad |         1900 |         5 |
|       18 | Simran    | Hyderabad |         2000 |         6 |
+----------+-----------+-----------+--------------+-----------+
 
22.	Assign dense rank to employees based on salary (lowest first).


 select emp_id,emp_name,salary,dense_rank() over(order by salary asc)as emp_dense from employees;
+--------+----------+--------+-----------+
| emp_id | emp_name | salary | emp_dense |
+--------+----------+--------+-----------+
|      2 | Ravi     |  50000 |         1 |
|      8 | Vikas    |  52000 |         2 |
|     12 | Pooja    |  53000 |         3 |
|     20 | Nisha    |  54000 |         4 |
|      5 | Priya    |  55000 |         5 |
|     16 | Meena    |  56000 |         6 |
|      9 | Anjali   |  58000 |         7 |
|     17 | Raj      |  59000 |         8 |
|      6 | Arjun    |  60000 |         9 |
|     13 | Manoj    |  61000 |        10 |
|     18 | Simran   |  64000 |        11 |
|      3 | Sneha    |  65000 |        12 |
|     14 | Divya    |  67000 |        13 |
|      7 | Neha     |  68000 |        14 |
|     19 | Deepak   |  69000 |        15 |
|      1 | Amit     |  70000 |        16 |
|     15 | Karthik  |  71000 |        17 |
|      4 | Kiran    |  72000 |        18 |
|     10 | Rahul    |  75000 |        19 |
|     11 | Suresh   |  80000 |        20 |
+--------+----------+--------+-----------+

 

23.	Assign dense rank within department based on joining date.

 select emp_id,emp_name,department,join_date,dense_rank() over(partition by department order by join_date )as emp_dense from employees;
+--------+----------+------------+------------+-----------+
| emp_id | emp_name | department | join_date  | emp_dense |
+--------+----------+------------+------------+-----------+
|      3 | Sneha    | Finance    | 2019-07-20 |         1 |
|     10 | Rahul    | Finance    | 2019-10-05 |         2 |
|      6 | Arjun    | Finance    | 2020-11-25 |         3 |
|     14 | Divya    | Finance    | 2021-07-09 |         4 |
|     18 | Simran   | Finance    | 2021-11-29 |         5 |
|      2 | Ravi     | HR         | 2020-03-15 |         1 |
|      5 | Priya    | HR         | 2021-09-18 |         2 |
|     16 | Meena    | HR         | 2022-08-26 |         3 |
|     12 | Pooja    | HR         | 2023-01-11 |         4 |
|     20 | Nisha    | HR         | 2023-03-21 |         5 |
|     11 | Suresh   | IT         | 2017-08-19 |         1 |
|     19 | Deepak   | IT         | 2018-05-08 |         2 |
|      7 | Neha     | IT         | 2018-12-01 |         3 |
|     15 | Karthik  | IT         | 2019-03-17 |         4 |
|      1 | Amit     | IT         | 2021-01-10 |         5 |
|      4 | Kiran    | IT         | 2022-05-12 |         6 |
|     13 | Manoj    | Marketing  | 2020-04-22 |         1 |
|     17 | Raj      | Marketing  | 2020-12-13 |         2 |
|      8 | Vikas    | Marketing  | 2021-06-30 |         3 |
|      9 | Anjali   | Marketing  | 2022-02-14 |         4 |
+--------+----------+------------+------------+-----------+

 

24.	Assign dense rank to orders based on order date.

 select order_id,cust_name,order_date,dense_rank() over(order by order_date)as ord_dense from orders;
+----------+-----------+------------+-----------+
| order_id | cust_name | order_date | ord_dense |
+----------+-----------+------------+-----------+
|        1 | Amit      | 2023-01-01 |         1 |
|        2 | Ravi      | 2023-01-02 |         2 |
|        3 | Sneha     | 2023-01-03 |         3 |
|        4 | Kiran     | 2023-01-04 |         4 |
|        5 | Priya     | 2023-01-05 |         5 |
|        6 | Arjun     | 2023-01-06 |         6 |
|        7 | Neha      | 2023-01-07 |         7 |
|        8 | Vikas     | 2023-01-08 |         8 |
|        9 | Anjali    | 2023-01-09 |         9 |
|       10 | Rahul     | 2023-01-10 |        10 |
|       11 | Suresh    | 2023-01-11 |        11 |
|       12 | Pooja     | 2023-01-12 |        12 |
|       13 | Manoj     | 2023-01-13 |        13 |
|       14 | Divya     | 2023-01-14 |        14 |
|       15 | Karthik   | 2023-01-15 |        15 |
|       16 | Meena     | 2023-01-16 |        16 |
|       17 | Raj       | 2023-01-17 |        17 |
|       18 | Simran    | 2023-01-18 |        18 |
|       19 | Deepak    | 2023-01-19 |        19 |
|       20 | Nisha     | 2023-01-20 |        20 |
+----------+-----------+------------+-----------+
