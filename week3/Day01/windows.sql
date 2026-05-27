1. Retrieve the names of employees and their corresponding managers from the "employees"table, ensuring that even employees without managers are included.


SELECT
   e.emp_name AS employee,
   m.emp_name AS manager
    FROM employees e
    LEFT JOIN employees m
    ON e.manager_id = m.emp_id;
+----------+---------+
| employee | manager |
+----------+---------+
| Karthik  | NULL    |
| Ajay     | Karthik |
| Vijay    | Karthik |
| Vinay    | Ajay    |
| Meena    | Vijay   |
| Veer     | NULL    |
| Keerthi  | Vinay   |
| Priya    | Vinay   |
| Ravi     | NULL    |
| Anu      | Vijay   |
+----------+---------+
 
2. Display all employees and their corresponding departments from the "employees" and"departments" tables, showing employees even if they don't belong to any department.

 select e.emp_name ,e.dept_id,d.dept_name FROM employees e LEFT JOIN departments as d ON e.dept_id=d.dept_id;
+----------+---------+-----------+
| emp_name | dept_id | dept_name |
+----------+---------+-----------+
| Karthik  |       1 | HR        |
| Ajay     |       1 | HR        |
| Vijay    |       2 | IT        |
| Vinay    |       2 | IT        |
| Meena    |       3 | Finance   |
| Veer     |       4 | Marketing |
| Keerthi  |       5 | Sales     |
| Priya    |       5 | Sales     |
| Ravi     |    NULL | NULL      |
| Anu      |    NULL | NULL      |
+----------+---------+-----------+

 
3. List the names of employees who report to a manager, along with their manager's name, from the "employees" table.

select e.emp_name,m.emp_name as manager from employees as e join employees as m ON e.manager_id=m.emp_id;
+----------+---------+
| emp_name | manager |
+----------+---------+
| Ajay     | Karthik |
| Vijay    | Karthik |
| Vinay    | Ajay    |
| Meena    | Vijay   |
| Keerthi  | Vinay   |
| Priya    | Vinay   |
| Anu      | Vijay   |
+----------+---------+
 

4. Find the total salary paid to each employee and their respective department, including
departments with no employees.

 SELECT e.emp_name, d.dept_name, s.salary
    -> FROM departments d
    -> LEFT JOIN employees e
    -> ON d.dept_id = e.dept_id
    -> LEFT JOIN salaries s
    -> ON e.emp_id = s.emp_id;
+----------+-----------+----------+
| emp_name | dept_name | salary   |
+----------+-----------+----------+
| Ajay     | HR        | 50000.00 |
| Karthik  | HR        | 70000.00 |
| Vinay    | IT        | 60000.00 |
| Vijay    | IT        | 65000.00 |
| Meena    | Finance   | 55000.00 |
| Veer     | Marketing |     NULL |
| Priya    | Sales     | 50000.00 |
| Keerthi  | Sales     | 75000.00 |
| NULL     | Admin     |     NULL |
+----------+-----------+----------+
 
5. Display a list of employees who do not belong to any department, even if the department data is missing.
 SELECT emp_name
    -> FROM employees
    -> WHERE dept_id IS NULL;
+----------+
| emp_name |
+----------+
| Ravi     |
| Anu      |
+----------+
6. Fetch the names of employees and the projects they are assigned to. For employees who are not assigned any projects, show NULL for the project.
SELECT e.emp_name, p.project_name
    -> FROM employees e
    -> LEFT JOIN employee_projects ep
    -> ON e.emp_id = ep.emp_id
    -> LEFT JOIN projects p
    -> ON ep.project_id = p.project_id;
+----------+--------------+
| emp_name | project_name |
+----------+--------------+
| Karthik  | Project A    |
| Ajay     | Project B    |
| Vijay    | Project C    |
| Vinay    | Project D    |
| Meena    | Project E    |
| Veer     | NULL         |
| Keerthi  | NULL         |
| Priya    | Project C    |
| Priya    | Project B    |
| Ravi     | NULL         |
| Anu      | NULL         |
+----------+--------------+
7. List all employees who have completed at least one project, showing their names and the
project names.
 SELECT e.emp_name, p.project_name
    -> FROM employees e
    -> JOIN employee_projects ep
    -> ON e.emp_id = ep.emp_id
    -> JOIN projects p
    -> ON ep.project_id = p.project_id;
+----------+--------------+
| emp_name | project_name |
+----------+--------------+
| Karthik  | Project A    |
| Ajay     | Project B    |
| Vijay    | Project C    |
| Vinay    | Project D    |
| Meena    | Project E    |
| Priya    | Project B    |
| Priya    | Project C    |
+----------+--------------+
8. Show the names of employees and their projects, ensuring that no project is omitted even if an employee is not assigned to it.

mysql> SELECT e.emp_name, p.project_name
    -> FROM projects p
    -> LEFT JOIN employee_projects ep
    -> ON p.project_id = ep.project_id
    -> LEFT JOIN employees e
    -> ON ep.emp_id = e.emp_id;
+----------+--------------+
| emp_name | project_name |
+----------+--------------+
| Karthik  | Project A    |
| Priya    | Project B    |
| Ajay     | Project B    |
| Priya    | Project C    |
| Vijay    | Project C    |
| Vinay    | Project D    |
| Meena    | Project E    |
| NULL     | Project F    |
+----------+--------------+
9. Find all employees and their corresponding salaries, and display NULL for salary if there is no salary record for the employee.

mysql> SELECT e.emp_name, s.salary
    -> FROM employees e
    -> LEFT JOIN salaries s
    -> ON e.emp_id = s.emp_id;
+----------+----------+
| emp_name | salary   |
+----------+----------+
| Karthik  | 70000.00 |
| Ajay     | 50000.00 |
| Vijay    | 65000.00 |
| Vinay    | 60000.00 |
| Meena    | 55000.00 |
| Veer     |     NULL |
| Keerthi  | 75000.00 |
| Priya    | 50000.00 |
| Ravi     |     NULL |
| Anu      |     NULL |
+----------+----------+
10. Retrieve the names of employees and their corresponding department names, including employees who are not in any department.

mysql> SELECT e.emp_name, d.dept_name
    -> FROM employees e
    -> LEFT JOIN departments d
    -> ON e.dept_id = d.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Karthik  | HR        |
| Ajay     | HR        |
| Vijay    | IT        |
| Vinay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Keerthi  | Sales     |
| Priya    | Sales     |
| Ravi     | NULL      |
| Anu      | NULL      |
+----------+-----------+

11. Find the names of all departments and employees, ensuring that departments with no employees are included.
SELECT d.dept_name, e.emp_name
    -> FROM departments d
    -> LEFT JOIN employees e
    -> ON d.dept_id = e.dept_id;
+-----------+----------+
| dept_name | emp_name |
+-----------+----------+
| HR        | Ajay     |
| HR        | Karthik  |
| IT        | Vinay    |
| IT        | Vijay    |
| Finance   | Meena    |
| Marketing | Veer     |
| Sales     | Priya    |
| Sales     | Keerthi  |
| Admin     | NULL     |
+-----------+----------+
 
12. List all employees with their contact information, including employees without contact records.
SELECT e.emp_name, c.phone, c.email
    -> FROM employees e
    -> LEFT JOIN contacts c
    -> ON e.emp_id = c.emp_id;
+----------+------------+-------------------+
| emp_name | phone      | email             |
+----------+------------+-------------------+
| Karthik  | 9876543210 | karthik@gmail.com |
| Ajay     | 9876543211 | ajay@gmail.com    |
| Vijay    | 9876543212 | vijay@gmail.com   |
| Vinay    | NULL       | NULL              |
| Meena    | 9876543213 | meena@gmail.com   |
| Veer     | NULL       | NULL              |
| Keerthi  | NULL       | NULL              |
| Priya    | 9876543214 | priya@gmail.com   |
| Ravi     | NULL       | NULL              |
| Anu      | NULL       | NULL              |
+----------+------------+-------------------+
 
 
 
13. Show the names of employees and their department names, including employees not assigned to any department and departments without employees.
SELECT e.emp_name, d.dept_name
    -> FROM employees e
    -> LEFT JOIN departments d
    -> ON e.dept_id = d.dept_id
    ->
    -> UNION
    ->
    -> SELECT e.emp_name, d.dept_name
    -> FROM employees e
    -> RIGHT JOIN departments d
    -> ON e.dept_id = d.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Karthik  | HR        |
| Ajay     | HR        |
| Vijay    | IT        |
| Vinay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Keerthi  | Sales     |
| Priya    | Sales     |
| Ravi     | NULL      |
| Anu      | NULL      |
| NULL     | Admin     |
+----------+-----------+
14. Find employees who have not completed any project, along with the project details where applicable.



mysql> SELECT e.emp_name, p.project_name
    -> FROM employees e
    -> LEFT JOIN employee_projects ep
    -> ON e.emp_id = ep.emp_id
    -> LEFT JOIN projects p
    -> ON ep.project_id = p.project_id
    -> WHERE p.project_id IS NULL;
+----------+--------------+
| emp_name | project_name |
+----------+--------------+
| Veer     | NULL         |
| Keerthi  | NULL         |
| Ravi     | NULL         |
| Anu      | NULL         |
+----------+--------------+
 

15. Retrieve the names of employees and the names of their projects, including employees who are not working on any project.

 SELECT e.emp_name, p.project_name
    -> FROM employees e
    -> LEFT JOIN employee_projects ep
    -> ON e.emp_id = ep.emp_id
    -> LEFT JOIN projects p
    -> ON ep.project_id = p.project_id;
+----------+--------------+
| emp_name | project_name |
+----------+--------------+
| Karthik  | Project A    |
| Ajay     | Project B    |
| Vijay    | Project C    |
| Vinay    | Project D    |
| Meena    | Project E    |
| Veer     | NULL         |
| Keerthi  | NULL         |
| Priya    | Project C    |
| Priya    | Project B    |
| Ravi     | NULL         |
| Anu      | NULL         |
+----------+--------------+

16. List all projects and the employees assigned to them, even for projects that have noemployees.
 SELECT p.project_name, e.emp_name
    -> FROM projects p
    -> LEFT JOIN employee_projects ep
    -> ON p.project_id = ep.project_id
    -> LEFT JOIN employees e
    -> ON ep.emp_id = e.emp_id;
+--------------+----------+
| project_name | emp_name |
+--------------+----------+
| Project A    | Karthik  |
| Project B    | Priya    |
| Project B    | Ajay     |
| Project C    | Priya    |
| Project C    | Vijay    |
| Project D    | Vinay    |
| Project E    | Meena    |
| Project F    | NULL     |
+--------------+----------+

17. Show the names of all employees who have both a manager and at least one project, listing the manager's name as well.


mysql> SELECT e.emp_name, m.emp_name AS manager, p.project_name
    -> FROM employees e
    -> JOIN employees m
    -> ON e.manager_id = m.emp_id
    -> JOIN employee_projects ep
    -> ON e.emp_id = ep.emp_id
    -> JOIN projects p
    -> ON ep.project_id = p.project_id;
+----------+---------+--------------+
| emp_name | manager | project_name |
+----------+---------+--------------+
| Ajay     | Karthik | Project B    |
| Vijay    | Karthik | Project C    |
| Vinay    | Ajay    | Project D    |
| Meena    | Vijay   | Project E    |
| Priya    | Vinay   | Project B    |
| Priya    | Vinay   | Project C    |
		

18. List the names of employees and the corresponding department names, but exclude those
employees who don't belong to a department.
SELECT e.emp_name, d.dept_name
    -> FROM employees e
    -> JOIN departments d
    -> ON e.dept_id = d.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Karthik  | HR        |
| Ajay     | HR        |
| Vijay    | IT        |
| Vinay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Keerthi  | Sales     |
| Priya    | Sales     |
+----------+-----------+




19. Display employees who belong to multiple departments, showing the employee's name and
the department names.
SELECT e.emp_name, d.dept_name
    -> FROM employee_departments ed
    -> JOIN employees e
    -> ON ed.emp_id = e.emp_id
    -> JOIN departments d
    -> ON ed.dept_id = d.dept_id
    -> WHERE e.emp_id IN (
    ->     SELECT emp_id
    ->     FROM employee_departments
    ->     GROUP BY emp_id
    ->     HAVING COUNT(dept_id) > 1
    -> );
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Priya    | Sales     |
| Priya    | IT        |
+----------+-----------+
20. List the names of all departments and employees, ensuring that even if a department has no employees, it is included in the result.

SELECT d.dept_name, e.emp_name
    -> FROM departments d
    -> LEFT JOIN employees e
    -> ON d.dept_id = e.dept_id;
+-----------+----------+
| dept_name | emp_name |
+-----------+----------+
| HR        | Ajay     |
| HR        | Karthik  |
| IT        | Vinay    |
| IT        | Vijay    |
| Finance   | Meena    |
| Marketing | Veer     |
| Sales     | Priya    |
| Sales     | Keerthi  |
| Admin     | NULL     |
+-----------+----------+
21. Retrieve employees who have worked on at least one project and do not belong to a
department, listing their name and project details.
SELECT e.emp_name, p.project_name
    -> FROM employees e
    -> JOIN employee_projects ep
    -> ON e.emp_id = ep.emp_id
    -> JOIN projects p
    -> ON ep.project_id = p.project_id
    -> WHERE e.dept_id IS NULL;
22. Find the total number of employees who belong to a department, ensuring the departments
with no employees are still included.
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
    -> FROM departments d
    -> LEFT JOIN employees e
    -> ON d.dept_id = e.dept_id
    -> GROUP BY d.dept_name;
+-----------+-----------------+
| dept_name | total_employees |
+-----------+-----------------+
| HR        |               2 |
| IT        |               2 |
| Finance   |               1 |
| Marketing |               1 |
| Sales     |               2 |
| Admin     |               0 |
+-----------+-----------------+
23. Show the employees and their managers, displaying only those employees who report to a
manager, excluding employees without managers.

SELECT e.emp_name, m.emp_name AS manager
    -> FROM employees e
    -> JOIN employees m
    -> ON e.manager_id = m.emp_id;
+----------+---------+
| emp_name | manager |
+----------+---------+
| Ajay     | Karthik |
| Vijay    | Karthik |
| Vinay    | Ajay    |
| Meena    | Vijay   |
| Keerthi  | Vinay   |
| Priya    | Vinay   |
| Anu      | Vijay   |
+----------+---------+
24. Display all employee names along with their corresponding managers' names, but include
employees who do not have managers.

mysql> SELECT e.emp_name, m.emp_name AS manager
    -> FROM employees e
    -> LEFT JOIN employees m
    -> ON e.manager_id = m.emp_id;
+----------+---------+
| emp_name | manager |
+----------+---------+
| Karthik  | NULL    |
| Ajay     | Karthik |
| Vijay    | Karthik |
| Vinay    | Ajay    |
| Meena    | Vijay   |
| Veer     | NULL    |
| Keerthi  | Vinay   |
| Priya    | Vinay   |
| Ravi     | NULL    |
| Anu      | Vijay   |
+----------+---------+
25. Find the names of departments and the number of employees in each department, including
departments that have no employees.
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
    -> FROM departments d
    -> LEFT JOIN employees e
    -> ON d.dept_id = e.dept_id
    -> GROUP BY d.dept_name;
+-----------+-----------------+
| dept_name | total_employees |
+-----------+-----------------+
| HR        |               2 |
| IT        |               2 |
| Finance   |               1 |
| Marketing |               1 |
| Sales     |               2 |
| Admin     |               0 |
+-----------+-----------------+
6 rows in set (0.00 sec)


26. List all employees and the departments they belong to, ensuring that departments with no employees are also listed.


mysql> SELECT e.emp_name, d.dept_name
    -> FROM employees e
    -> LEFT JOIN departments d
    -> ON e.dept_id = d.dept_id
    ->
    -> UNION
    ->
    -> SELECT e.emp_name, d.dept_name
    -> FROM employees e
    -> RIGHT JOIN departments d
    -> ON e.dept_id = d.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Karthik  | HR        |
| Ajay     | HR        |
| Vijay    | IT        |
| Vinay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Keerthi  | Sales     |
| Priya    | Sales     |
| Ravi     | NULL      |
| Anu      | NULL      |
| NULL     | Admin     |
+----------+-----------+

27. Show a list of employees who do not have any corresponding salary records, along with their names.


 
SELECT e.emp_name
    -> FROM employees e
    -> LEFT JOIN salaries s
    -> ON e.emp_id = s.emp_id
    -> WHERE s.salary IS NULL;
+----------+
| emp_name |
+----------+
| Veer     |
| Ravi     |
| Anu      |
+----------+
 
28. Retrieve the names of employees and their project assignments, including employees who are not assigned to any projects.

 SELECT e.emp_name, p.project_name
    -> FROM employees e
    -> LEFT JOIN employee_projects ep
    -> ON e.emp_id = ep.emp_id
    -> LEFT JOIN projects p
    -> ON ep.project_id = p.project_id;
+----------+--------------+
| emp_name | project_name |
+----------+--------------+
| Karthik  | Project A    |
| Ajay     | Project B    |
| Vijay    | Project C    |
| Vinay    | Project D    |
| Meena    | Project E    |
| Veer     | NULL         |
| Keerthi  | NULL         |
| Priya    | Project C    |
| Priya    | Project B    |
| Ravi     | NULL         |
| Anu      | NULL         |
+----------+--------------+

29. List the names of all employees and their respective department and project assignments, including employees who are not assigned to a project or department.

 
 SELECT e.emp_name, d.dept_name, p.project_name
     FROM employees e
     LEFT JOIN departments d
    ON e.dept_id = d.dept_id
     LEFT JOIN employee_projects ep
     ON e.emp_id = ep.emp_id
     LEFT JOIN projects p
    ON ep.project_id = p.project_id;
+----------+-----------+--------------+
| emp_name | dept_name | project_name |
+----------+-----------+--------------+
| Karthik  | HR        | Project A    |
| Ajay     | HR        | Project B    |
| Vijay    | IT        | Project C    |
| Vinay    | IT        | Project D    |
| Meena    | Finance   | Project E    |
| Veer     | Marketing | NULL         |
| Keerthi  | Sales     | NULL         |
| Priya    | Sales     | Project C    |
| Priya    | Sales     | Project B    |
| Ravi     | NULL      | NULL         |
| Anu      | NULL      | NULL         |
+----------+-----------+--------------+
 
30. Display the names of employees who belong to at least one department, with the department name listed, but include employees without a department as well

SELECT e.emp_name, d.dept_name
     FROM employees e
     LEFT JOIN departments d
     ON e.dept_id = d.dept_id;
+----------+-----------+
| emp_name | dept_name |
+----------+-----------+
| Karthik  | HR        |
| Ajay     | HR        |
| Vijay    | IT        |
| Vinay    | IT        |
| Meena    | Finance   |
| Veer     | Marketing |
| Keerthi  | Sales     |
| Priya    | Sales     |
| Ravi     | NULL      |
| Anu      | NULL      |
+----------+-----------+

 
