---DROP TABLE employee_salary;
CREATE TABLE employee_salary (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
base_salary DECIMAL(10,2),
bonus DECIMAL(10,2),
tax_percent DECIMAL(5,2),
experience_years INT
);
Insert Sample Data
INSERT INTO employee_salary VALUES
(1, 'Karthik', 75000.75, 5000.50, 10.00, 6),
(2, 'Veena', 65000.40, 4000.25, 8.50, 4),
(3, 'Ravi', 85000.90, 6000.75, 12.00, 8),
(4, 'Anil', 70000.10, NULL, 9.00, 5),
(5, 'Suresh', 60000.55, 3000.30, 7.50, 3);

SELECT * from employee_salary;
+--------+----------+-------------+---------+-------------+------------------+
| emp_id | emp_name | base_salary | bonus   | tax_percent | experience_years |
+--------+----------+-------------+---------+-------------+------------------+
|      1 | Karthik  |    75000.75 | 5000.50 |       10.00 |                6 |
|      2 | Veena    |    65000.40 | 4000.25 |        8.50 |                4 |
|      3 | Ravi     |    85000.90 | 6000.75 |       12.00 |                8 |
|      4 | Anil     |    70000.10 |    NULL |        9.00 |                5 |
|      5 | Suresh   |    60000.55 | 3000.30 |        7.50 |                3 |
+--------+----------+-------------+---------+-------------+------------------+
1. ABS – Absolute Value
SELECT ABS(-100);

mysql> SELECT ABS(-100);
+-----------+
| ABS(-100) |
+-----------+
|       100 |
+-----------+

2. ROUND – Round to Decimals
SELECT ROUND(base_salary, 0) FROM employee_salary;
+-----------------------+
| ROUND(base_salary, 0) |
+-----------------------+
|                 75001 |
|                 65000 |
|                 85001 |
|                 70000 |
|                 60001 |
+-----------------------+
SELECT ROUND(base_salary, 2) FROM employee_salary;
 
+-----------------------+
| ROUND(base_salary, 2) |
+-----------------------+
|              75000.75 |
|              65000.40 |
|              85000.90 |
|              70000.10 |
|              60000.55 |
+-----------------------+

3. CEILING / CEIL – Round Up
SELECT CEIL(base_salary) FROM employee_salary;
 
+-------------------+
| CEIL(base_salary) |
+-------------------+
|             75001 |
|             65001 |
|             85001 |
|             70001 |
|             60001 |
+-------------------+

4. FLOOR – Round Down
SELECT FLOOR(base_salary) FROM employee_salary;
 
+--------------------+
| FLOOR(base_salary) |
+--------------------+
|              75000 |
|              65000 |
|              85000 |
|              70000 |
|              60000 |
+--------------------+

5. TRUNCATE – Cut Decimals (No Rounding)
SELECT TRUNCATE(base_salary, 1) FROM employee_salary;

+--------------------------+
| TRUNCATE(base_salary, 1) |
+--------------------------+
|                  75000.7 |
|                  65000.4 |
|                  85000.9 |
|                  70000.1 |
|                  60000.5 |
+--------------------------+

6. MOD – Remainder
SELECT MOD(experience_years, 2) FROM employee_salary;
 
+-------------------------+
| MOD(experience_years,2) |
+-------------------------+
|                       0 |
|                       0 |
|                       0 |
|                       1 |
|                       1 |
+-------------------------+

7. POWER / POW – Exponent
SELECT POWER(2, 3);
 
+----------+
| POW(2,3) |
+----------+
|        8 |
+----------+

SELECT POW(5, 2);
 +----------+
| POW(5,2) |
+----------+
|       25 |
+----------+

8. SQRT – Square Root
SELECT SQRT(64);
+----------+
| SQRT(64) |
+----------+
|        8 |
+----------+

9. SIGN – Sign of Number
SELECT SIGN(base_salary) FROM employee_salary;
+-------------------+
| SIGN(base_salary) |
+-------------------+
|                 1 |
|                 1 |
|                 1 |
|                 1 |
|                 1 |
+-------------------+

10. RAND – Random Number
SELECT RAND();
+---------------------+
| RAND()              |
+---------------------+
| 0.22589939760593641 |
+---------------------+

11. FORMAT –Number as String
SELECT FORMAT(base_salary, 2) FROM Format employee_salary;
+------------------------+
| FORMAT(base_salary, 2) |
+------------------------+
| 75,000.75              |
| 65,000.40              |
| 85,000.90              |
| 70,000.10              |
| 60,000.55              |
+------------------------+
Note: FORMAT() returns a string, not a numeric value.

12. GREATEST – Maximum Value
SELECT emp_name,
GREATEST(base_salary, IFNULL(bonus, 0))
FROM employee_salary;
+----------+-----------------------------------------+
| emp_name | GREATEST(base_salary, IFNULL(bonus, 0)) |
+----------+-----------------------------------------+
| Karthik  |                                75000.75 |
| Veena    |                                65000.40 |
| Ravi     |                                85000.90 |
| Anil     |                                70000.10 |
| Suresh   |                                60000.55 |
+----------+-----------------------------------------+

13. LEAST – Minimum Value
SELECT emp_name,
LEAST(base_salary, IFNULL(bonus, 0))
FROM employee_salary;

+----------+--------------------------------------+
| emp_name | LEAST(base_salary, IFNULL(bonus, 0)) |
+----------+--------------------------------------+
| Karthik  |                              5000.50 |
| Veena    |                              4000.25 |
| Ravi     |                              6000.75 |
| Anil     |                                 0.00 |
| Suresh   |                              3000.30 |
+----------+--------------------------------------+




















