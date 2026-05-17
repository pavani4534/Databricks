# SQL NULL Functions Practice

This repository contains practice questions on SQL NULL handling functions and conditions.  
These queries help in understanding how to work with NULL values in SQL using:

- IS NULL
- IS NOT NULL
- IFNULL / ISNULL
- COALESCE
- NULLIF

---

# LEVEL 1 — BASIC

1. Show all employees whose salary is NULL  
2. Show all orders where discount is NOT NULL  
3. Get products where category is NULL  
4. Count number of employees with NULL manager_id  

---

# LEVEL 2 — IFNULL / ISNULL

1. Replace NULL salary with 0  
2. Replace NULL bonus with 1000  
3. Show order amount, if NULL replace with 500  
4. Replace NULL stock with 0  

---

# LEVEL 3 — COALESCE

1. Show employee earnings using salary, if NULL use bonus  
2. Show first available value: salary → bonus → 0  
3. Show product price: price → 1000 (default)  
4. Get customer payment: amount → discount → 0  

---

# LEVEL 4 — NULLIF

1. Convert salary to NULL if salary = 0  
2. Convert discount to NULL if discount = 0  
3. Use NULLIF to avoid divide by zero  
4. Replace coupon_code with NULL if it is 'DISC10'  

---

# LEVEL 5 — REAL-TIME SCENARIOS

1. Calculate total earnings: salary + bonus (handle NULL properly)  
2. Show employees where both salary AND bonus are NULL  
3. Show products where price is NULL but category is NOT NULL  
4. Show orders where both amount and discount are NULL  

---

# LEVEL 6 — ADVANCED

1. Show employee income using COALESCE(salary, bonus, 1000)  
2. Replace empty discount with NULL using NULLIF(discount, 0)  
3. Show final payable amount: amount - discount (handle NULL)  
4. Find employees where salary is NULL but manager exists  

---

# Topics Covered

- SQL NULL Handling
- Conditional Functions
- Data Cleaning
- Real-Time SQL Scenarios
- Query Practice

---

# Database Used

- MySQL

---

# Author

Pavani Satya Sri
