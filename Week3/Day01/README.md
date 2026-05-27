# SQL Window Functions Practice

This project demonstrates the use of SQL Window Functions:

- ROW_NUMBER()
- RANK()
- DENSE_RANK()

using two tables:

- employees
- orders

These queries are useful for:
- Ranking employees
- Department-wise analysis
- Order analysis
- Finding top and bottom records
- SQL interview preparation

---

# Database Tables

## Employees Table

```sql
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    join_date DATE
);
```

## Orders Table

```sql
CREATE TABLE orders (
    order_id INT,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    order_amount INT,
    order_date DATE
);
```

---

# Topics Covered

## ROW_NUMBER()

ROW_NUMBER() assigns a unique number to each row.

### Examples
- Employee salary ranking
- Department-wise row numbering
- Joining date ordering
- City-wise order numbering

---

## RANK()

RANK() assigns the same rank for duplicate values and skips the next rank.

### Examples
- Salary ranking
- Department-wise ranking
- Order amount ranking
- Alphabetical employee ranking

---

## DENSE_RANK()

DENSE_RANK() assigns the same rank for duplicate values without skipping ranks.

### Examples
- Dense salary ranking
- Department-wise dense ranking
- Order dense ranking
- Joining date dense ranking

---

# Sample Queries

## ROW_NUMBER Example

```sql
SELECT emp_id, emp_name, salary,
ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees;
```

---

## RANK Example

```sql
SELECT emp_id, emp_name, salary,
RANK() OVER(ORDER BY salary DESC) AS rank_sal
FROM employees;
```

---

## DENSE_RANK Example

```sql
SELECT emp_id, emp_name, salary,
DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank_sal
FROM employees;
```

---

# Difference Between Window Functions

| Function | Duplicate Ranks | Rank Skipping |
|----------|----------------|---------------|
| ROW_NUMBER() | No | No |
| RANK() | Yes | Yes |
| DENSE_RANK() | Yes | No |

---

# Concepts Used

## OVER()

Defines the window function operation.

```sql
OVER(ORDER BY salary DESC)
```

---

## PARTITION BY

Divides rows into groups.

```sql
PARTITION BY department
```

---

## ORDER BY

Defines sorting for ranking.

```sql
ORDER BY salary DESC
```

---

# Project Use Cases

- SQL Practice
- Window Function Learning
- Data Analytics
- Business Reports
- Interview Preparation

---

# Author

Pavani Satya Sri

 
