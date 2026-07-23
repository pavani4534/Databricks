# PySpark DataFrame Practice – 90 Hands-on Questions

## Overview

This repository contains **90 PySpark DataFrame practice questions** covering fundamental to intermediate concepts using an Employee Management dataset. The exercises are designed to strengthen PySpark DataFrame operations and prepare for interviews and real-world data engineering tasks.

## Technologies Used

- Python 3
- PySpark
- Apache Spark
- Databricks

## Dataset

The project uses the following DataFrames:

- **Employee DataFrame**
- **Department DataFrame**
- **Manager DataFrame**
- **Additional Employee DataFrame** (for Union operations)

These DataFrames contain employee details such as employee ID, name, age, department, salary, city, joining date, and manager information.

## Topics Covered

### Part A – DataFrame Creation
- Create DataFrames
- Display schema
- Display records

### Part B – Select Operations
- Select columns
- Alias columns
- Perform calculations
- Filter selected data

### Part C – `withColumn()`
- Create new columns
- Salary calculations
- Conditional columns
- String transformations
- Add constant values

### Part D – `withColumnRenamed()`
- Rename single and multiple columns

### Part E – Filter Operations
- Conditional filtering
- NULL handling
- String filtering
- Range filtering

### Part F – Sorting
- Ascending and descending sorting
- Multi-column sorting
- Top-N records

### Part G – NULL Handling
- `fillna()`
- `dropna()`
- Replace missing values
- Handle multiple NULL columns

### Part H – Date Functions
- Date conversion
- Extract year, month, and day
- Current date and timestamp
- Date arithmetic
- Experience calculation

### Part I – Joins
- Inner Join
- Left Join
- Right Join
- Full Outer Join
- Multi-DataFrame Joins
- Anti Join scenarios

### Part J – Union
- Union
- Union By Name
- Remove duplicates
- Count records

### Part K – Transformations
- Distinct
- GroupBy
- Count
- Average
- Maximum
- Minimum
- Sum
- Drop columns
- Remove duplicates

### Part L – String Functions
- Lowercase
- Uppercase
- String length
- Substring
- Concatenation
- String replacement

### Part M – Aggregations
- Total salary
- Average salary
- Highest salary
- Lowest salary
- Employee count

### Part N – Advanced PySpark
- Window Functions
- Department-wise averages
- Second highest salary
- Duplicate detection
- Salary grading
- Employee ID formatting
- Date-based filtering
- Advanced transformations

## PySpark Concepts Practiced

- DataFrame API
- Column Expressions
- Conditional Functions (`when`, `otherwise`)
- Filtering
- Sorting
- Aggregations
- GroupBy
- Window Functions
- Date Functions
- String Functions
- NULL Handling
- Joins
- Union Operations

## Learning Objectives

After completing these exercises, you will be able to:

- Create and manipulate PySpark DataFrames
- Perform data filtering and sorting
- Handle missing values
- Work with date and string functions
- Perform joins and union operations
- Apply aggregation and grouping
- Use window functions for ranking
- Solve common PySpark interview questions

## Repository Structure

```
PySpark-DataFrame-Practice/
│
├── Employee_DataFrame.py
├── Department_DataFrame.py
├── Manager_DataFrame.py
├── Union_Operations.py
├── DataFrame_Practice.py
├── README.md
```

## How to Run

1. Install Apache Spark and PySpark.
2. Open Databricks or any PySpark environment.
3. Clone this repository.
4. Run the Python files in sequence.
5. Verify the results using DataFrame operations.

## Author

**Pavani Satya Sri**

B.Tech – Information Technology

Aspiring Data Engineer | PySpark | SQL | Databricks
