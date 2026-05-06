  --Questions
--Having Queries (5)
Select departments with more than 2 employees.
Select departments with an average salary greater than 55000.
Select years with more than 1 employee hired.
Select departments with a total salary expense less than 100000.
Select departments with the maximum salary above 75000.

  --Order By Queries (5)
Select all employees ordered by their salary in ascending order.
Select all employees ordered by their age in descending order.
Select employees ordered by their hire date in ascending order.
Select employees ordered by their department and then by their salary.
Select departments ordered by the total salary of their employees.

  --Join Queries (10)
Select employee names along with their department names.
Select project names along with the department names they belong to.
Select employee names and their corresponding project names.
Select employees and their departments, including those without a department.
Select all departments and their employees, including departments without employees.
Select employees who are not assigned to any project.
Select projects and the number of projects per department is working on.
Select the departments that have no employees.
Select the employee names who share the same department with 'John Doe'.
Select the department name with the highest average salary.

  --Nested and Correlated Queries (5)
Select the employee with the highest salary.
Select employees whose salary is above the average salary.
Select the second highest salary from the Employee table.
Select the department with the most employees.
Select employees who earn more than the average salary of their department.

  --Combined Moderate Difficulty Queries (10)
Select employees who are older than all employees in the HR department.
Select departments where the average salary is greater than 55000.
Select departments where the average salary is greater than 55000.
Select employees who were hired in the same date as Jane Smith.
Select the total salary of employees hired in the year 2020.
Select the average salary of employees in each department, ordered by the average salary in descending order.
Select departments with more than 1 employee and an average salary greater than 55000.
Select employees hired in the last 2 years, ordered by their hire date.
Select the total number of employees and the average salary for departments with more than 2 employees.
Select the name and salary of employees whose salary is above the average salary of their department.
Select the names of employees who are hired on the same date as the oldest employee in the company.
Select the department name along with the total number of projects they are working on, ordered by the number of projects.
Select the employee name with the highest salary in each department.
Select the employee name with the highest salary in each department.
Select the names and salaries of employees who are older than the average age of employees in their department.


  --Answers
-- 26
SELECT department_id 
FROM Employee 
GROUP BY department_id 
HAVING COUNT(*) > 2;

-- 27
SELECT department_id 
FROM Employee 
GROUP BY department_id 
HAVING AVG(salary) > 55000;

-- 28
SELECT department_id 
FROM Employee 
GROUP BY department_id 
HAVING COUNT(*) > 0;

-- 29
SELECT department_id 
FROM Employee 
GROUP BY department_id 
HAVING AVG(salary) < 100000;

-- 30
SELECT department_id 
FROM Employee 
GROUP BY department_id 
HAVING MIN(salary) > 70000;

-- 31
SELECT * FROM Employee ORDER BY salary ASC;

-- 32
SELECT * FROM Employee ORDER BY age DESC;

-- 33
SELECT * FROM Employee ORDER BY hire_date ASC;

-- 34
SELECT * FROM Employee 
ORDER BY department_id, salary;

-- 35
SELECT * FROM Employee 
ORDER BY salary DESC LIMIT 3;

-- 36
SELECT e.name, d.name 
FROM Employee e
JOIN Department d 
ON e.department_id = d.department_id;

-- 37
SELECT p.name, d.name 
FROM Project p
JOIN Department d 
ON p.department_id = d.department_id;

-- 38
SELECT e.name, p.name 
FROM Employee e
JOIN Project p 
ON e.department_id = p.department_id;

-- 39
SELECT e.* 
FROM Employee e
LEFT JOIN Department d 
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- 40
SELECT d.* 
FROM Department d
LEFT JOIN Employee e 
ON d.department_id = e.department_id
WHERE e.emp_id IS NULL;

-- 41
SELECT * FROM Employee 
WHERE emp_id NOT IN 
(SELECT DISTINCT emp_id FROM Employee WHERE department_id IS NOT NULL);

-- 42
SELECT d.name, COUNT(e.emp_id)
FROM Department d
LEFT JOIN Employee e 
ON d.department_id = e.department_id
GROUP BY d.name;

-- 43
SELECT d.name
FROM Department d
LEFT JOIN Employee e 
ON d.department_id = e.department_id
WHERE e.emp_id IS NULL;

-- 44
SELECT * FROM Employee 
WHERE department_id = 
(SELECT department_id FROM Employee WHERE name = 'John Doe');

-- 45
SELECT department_id
FROM Employee
GROUP BY department_id
ORDER BY AVG(salary) DESC
LIMIT 1;

-- 46
SELECT * FROM Employee 
WHERE salary = (SELECT MAX(salary) FROM Employee);

-- 47
SELECT * FROM Employee 
WHERE salary > (SELECT AVG(salary) FROM Employee);

-- 48
SELECT * FROM Employee 
WHERE salary = (SELECT MAX(salary) FROM Employee);

-- 49
SELECT department_id
FROM Employee
GROUP BY department_id
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 50
SELECT e.*
FROM Employee e
JOIN (
    SELECT department_id, AVG(salary) avg_sal
    FROM Employee GROUP BY department_id
) d
ON e.department_id = d.department_id
WHERE e.salary > d.avg_sal;

-- 51
SELECT * FROM Employee 
WHERE age > ALL (
    SELECT age FROM Employee WHERE department_id = 2
);

-- 52
SELECT d.name
FROM Department d
JOIN Employee e ON d.department_id = e.department_id
GROUP BY d.name
HAVING AVG(e.salary) > 50000;

-- 53
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING COUNT(*) >= 2;

-- 54
SELECT * FROM Employee 
WHERE department_id IN (
    SELECT department_id FROM Project GROUP BY department_id HAVING COUNT(*) >= 2
);

-- 55
SELECT name FROM Employee WHERE YEAR(hire_date) = 2020;

-- 56
SELECT name FROM Employee WHERE salary > 50000;

-- 57
SELECT * FROM Employee 
ORDER BY department_id, salary DESC;

-- 58
SELECT * FROM Employee 
WHERE salary > 50000 
AND YEAR(hire_date) = 2020;

-- 59
SELECT department_id
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- 60
SELECT * FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE department_id = e.department_id
);

-- 61
SELECT * FROM Employee 
WHERE age IN (
    SELECT age FROM Employee GROUP BY age HAVING COUNT(*) > 1
);

-- 62
SELECT e.name, COUNT(p.project_id)
FROM Employee e
JOIN Project p ON e.department_id = p.department_id
GROUP BY e.name;

-- 63
SELECT e.*
FROM Employee e
JOIN (
    SELECT department_id, MAX(salary) max_sal
    FROM Employee GROUP BY department_id
) d
ON e.department_id = d.department_id
WHERE e.salary = d.max_sal;

-- 64
SELECT name FROM Employee 
WHERE age > (SELECT AVG(age) FROM Employee);
