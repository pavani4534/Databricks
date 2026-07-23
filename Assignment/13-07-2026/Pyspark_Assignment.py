 Part A – DataFrame Creation

1.	Create the Employee DataFrame using a list of tuples.

employee_data = [
    (101, "Alice", 25, "HR", 45000, "Chennai", "2022-01-15", 201),
    (102, "Bob", 30, "IT", 70000, "Bangalore", "2021-06-20", 202),
    (103, "Charlie", None, "IT", None, "Chennai", "2023-03-12", 202),
    (104, "David", 28, "Finance", 65000, "Mumbai", "2020-09-18", 203),
    (105, "Eva", 35, "HR", 80000, None, "2019-05-25", 201),
    (106, "Frank", 29, "Marketing", 55000, "Hyderabad", None, 204),
    (107, "Grace", 31, "Finance", None, "Pune", "2022-12-01", 203),
    (108, "Henry", 26, "IT", 60000, "Bangalore", "2024-01-10", None)
]

employee_columns = [
    "emp_id",
    "name",
    "age",
    "department",
    "salary",
    "city",
    "joining_date",
    "manager_id"
]

employee_df = spark.createDataFrame(employee_data, employee_columns)

employee_df.show()
employee_df.printSchema()



2.	Create the Department DataFrame.
department_data = [
    ("HR", "Chennai"),
    ("IT", "Bangalore"),
    ("Finance", "Mumbai"),
    ("Marketing", "Hyderabad"),
    ("Sales", "Delhi")
]

department_columns = [
    "dept_name",
    "location"
]

department_df = spark.createDataFrame(department_data, department_columns)

department_df.show()

3.	Create the Manager DataFrame.

manager_data = [
    (201, "Robert"),
    (202, "Jennifer"),
    (203, "Michael"),
    (204, "Sophia")
]

manager_columns = [
    "manager_id",
    "manager_name"
]

manager_df = spark.createDataFrame(manager_data, manager_columns)

manager_df.show()


4.	Display the schema of all DataFrames.

        employee_df.printSchema()
        manager_df.printSchema()
        department_df.printSchema()

5.	Display the first 5 rows.


         employee_df.limit(5).display()
         manager_df.limit(5).display()
         department_df.limit(5).display()


 
SELECT OPERATIONS

6.	Select only emp_id, name, and salary.

       employee_df.select(col("emp_id"),col("name"),col("salary")).display()

7.	Select all employees from the IT department.

       employee_df.select(col("*")).filter(col("department")=="IT").display()

8.	Select employee names and alias the column as Employee_Name.

       employee_df.select(col("name").alias("Employee_Name")).display()

9.	Select salary after increasing it by 10%.

       employee_df.select("salary",col("salary")+col("salary")*0.10).display()

10.	Select employees whose city is Chennai or Bangalore.

        employee_df.select(col("*")).filter(col("city").isin('Chennai','Bangalore')).display()


Part C – withColumn()

11.	Create a new column called bonus equal to 20% of salary.


12.	Create a column called annual_salary.

       employee_df.withColumn("Annual Salary",col("salary")*12).display()

13.	Create a column called experience_bonus where:
•	Salary > 70000 → 10000
•	Salary between 50000 and 70000 → 5000
•	Otherwise → 2000

         employee_df.withColumn("experience_bonus",when(col("salary") > 70000, 10000).when(col("salary").between(50000, 70000),           5000).otherwise(2000)).display()


14.	Convert employee names to uppercase.

          employee_df.withColumn("NAMES IN UPPER CASE",upper("name")).display()

15.	Add a column called country with value "India".

        employee_df.withColumn("country",lit("India")).display()

Part D – withColumnRenamed()

16.	Rename department to dept.

         employee_df.withColumnRenamed("Department","dept").display()

17.	Rename salary to monthly_salary.

         employee_df.withColumnRenamed("salary","monthly_salary").display()

18.	Rename multiple columns one by one.

        employee_df.withColumnRenamed("salary","monthly_salary").display()
        e     employee_df.withColumnRenamed("Department","dept").display()
        employee_df.withColumnRenamed("name","EmployeeName").display()
        employee_df.withColumnRenamed("emp_id","ID").display()
        employee_df.withColumnRenamed("age"," emp_age").display()
        employee_df.withColumnRenamed("city"," emp_city").display()
        employee_df.withColumnRenamed("manager_id","M_ID").display()


Part E – Filter

19.	Find employees earning more than 60000.

       employee_df.filter(col("salary")>60000).display()

20.	Find employees older than 30.

       employee_df.filter(col("age")>30).display()

21.	Find HR employees in Chennai.

        employee_df.filter((col("city")=='Chennai')&(col("department")=='HR')).display()

22.	Find employees with NULL salary.

        employee_df.filter(col("salary").isNull()).display()


23.	Find employees whose salary is between 50000 and 70000.

        employee_df.filter(col("salary").between(50000,70000)).display()


24.	Find employees whose names start with "A".

        employee_df.filter(col("name").like("A%")).display()

25.	Find employees whose city is not NULL


        employee_df.filter(col("city").isNotNull()).display()
 

Part F – Sort

26.	Sort employees by salary ascending.

       employee_df.sort(col("salary").asc()).display()

27.	Sort employees by salary descending.

       employee_df.sort(col("salary").desc()).display()

28.	Sort employees by department and salary.

       employee_df.sort("department","salary").display()

29.	Sort employees by age descending.

        employee_df.sort(col("age").desc()).display()

30.	Display top 3 highest-paid employees.

        employee_df.sort(col("salary").desc()).limit(3).display() 


Part G – FillNA and DropNA

31.	Replace NULL salary with 30000.

        employee_df.fillna(3000,subset=["salary"]).display()

32.	Replace NULL city with "Unknown".

        employee_df.fillna("Unknown",subset=["city"]).display()

33.	Replace NULL age with average age.

        avg_age = employee_df.select(avg("age")).first()[0]
        employee_df.fillna(avg_age, subset=["age"]).display()

34.	Replace multiple NULL columns in one statement.

        employee_df.dropna(subset=["salary","city","department"]).display()

35.	Drop rows containing any NULL values.

        employee_df.dropna("any").display()

36.	Drop rows where salary is NULL.

        employee_df.dropna(subset=["salary"]).display()

37.	Drop rows only if all values are NULL.

        employee_df.dropna("all").display()

Part H – Date Functions

38.	Convert joining_date to DateType.

        employee_df.select("joining_date",to_date("joining_date")).printSchema()

39.	Extract joining year.

       employee_df.select(year("joining_date")).display()

40.	Extract joining month.

        employee_df.select(month("joining_date")).display()

41.	Extract joining day.

       employee_df.select(day("joining_date")).display()

42.	Find employees who joined after 2022.

      employee_df.filter(col("joining_date")>'2022-12-31').display()

43.	Calculate years worked.

       employee_df.withColumn("Experience",floor(months_between(current_date(),col("joining_date"))/12)).display()


44.	Find employees who joined this year.

       employee_df.filter(year("joining_date") == year(current_date())).display()

45.	Display current date.

employee_df.withColumn("current_date",current_date()).display()

46.	Display current timestamp.

employee_df.withColumn("Current Time& date",current_timestamp()).display()

47.	Add 30 days to joining date.

employee_df.withColumn("30days after",date_add(col('joining_date'),30)).display()


48.	Find the difference between joining date and today's date.

employee_df.withColumn("Difference",date_diff( current_date(),col("joining_date"))).display()

 
Part I – Joins

49.	Perform an inner join between Employee and Department.

employee_df.join(department_df,employee_df.department==department_df.dept_name,"inner").display()

50.	Perform a left join.

employee_df.join(department_df,employee_df.department==department_df.dept_name,"left").display()

51.	Perform a right join.

employee_df.join(department_df,employee_df.department==department_df.dept_name,"right").display()

52.	Perform a full outer join.

employee_df.join(department_df,employee_df.department==department_df.dept_name,"full_outer").display()

53.	Join Employee with Manager DataFrame.

employee_df.join(manager_df,employee_df.manager_id==manager_df.manager_id,"inner").display()

54.	Display employee name along with manager name.

employee_df.join(manager_df,"manager_id","left").select(col("name"),col("manager_name")).display()

55.	Find employees whose department location matches their city.

employee_df.join(department_df,employee_df.department ==department_df.dept_name,"inner").filter(col("city") == col("location")).display()

56.	Find departments having no employees.

department_df.join(employee_df,department_df.dept_name == employee_df.department,"left_anti").display()


Part J – Union
Create another Employee DataFrame:
emp_id	name	age	department	salary	city	joining_date	manager_id
109	Irene	27	HR	52000	Chennai	2024-03-11	201
110	Jack	34	Sales	72000	Delhi	2021-11-20	205
57.	Union the two DataFrames.

employee_df.union(new_employee_df).display()

58.	Count total employees after union.

employee_df.union(new_employee_df).agg(count("name").alias("after union emp_count")).display()

59.	Remove duplicate employees after union.

employee_df.union(new_employee_df).dropDuplicates().display()

60.	Union by column names.

employee_df.unionByName(new_employee_df).display()


Part K – Other Transformations

61.	Display distinct departments.

employee_df.select("department").distinct().display()

62.	Count employees in each department.

employee_df.groupBy("department").agg(count("name").alias("No of Employees")).display()

63.	Calculate average salary by department.

employee_df.groupBy("department").agg(avg("salary").alias("avg_salary")).display()

64.	Find maximum salary by department.

employee_df.groupBy("department").agg(max("salary")).display()


65.	Find minimum salary by department.

employee_df.groupBy("department").agg(min("salary")).display()


66.	Find total salary paid in each department.

employee_df.groupBy("department").agg(sum("salary").alias("salary paid to each dept")).display()

67.	Count employees in each city.

employee_df.groupBy("city").agg(count("name")).display()


68.	Display unique cities.

employee_df.select("city").distinct().display()

69.	Remove duplicate records.

employee_df.distinct().display()

70.	Drop the manager_id column.

employee_df.drop("manager_id").display()


Part L – String Functions

71.	Convert employee names to lowercase.

employee_df.withColumn("lower_case",lower(col("name"))).display()


72.	Find the length of each employee name.

employee_df.select("name",length("name")).display()

73.	Extract the first three letters of employee names.

employee_df.select(
    "name",
    substring("name", 1, 3).alias("first_three_letters")
).display()

74.	Concatenate employee name and city.

employee_df.select(
    concat_ws(" ","name","city").alias("Name_City")
).display()


75.	Replace all occurrences of "a" with "@" in names.

employee_df.withColumn("updated_name",regexp_replace("name", "a", "@")).display()
Part M – Aggregations

76.	Find total salary.

employee_df.agg(sum("salary").alias("total_salary")).display()

77.	Find average salary.

employee_df.agg(avg("salary").alias("avg_salary")).display()

78.	Find highest-paid employee.

max_salary = employee_df.agg(max("salary")).collect()[0][0]

employee_df.filter(col("salary") == max_salary).display()

79.	Find lowest-paid employee.

min_salary = employee_df.agg(min("salary")).collect()[0][0]

employee_df.filter(col("salary") == min_salary).display()

80.	Count employees with salary greater than 50000.

employee_df.agg(count("salary")>50000).display()


Part N – Advanced Questions
81.	Display employees whose salary is above the department average.

82.	Find the second highest salary.

from pyspark.sql.window import Window
from pyspark.sql.functions import dense_rank

window_spec = Window.orderBy(col("salary").desc())

employee_df.withColumn("rank", dense_rank().over(window_spec)) \
    .filter(col("rank") == 2) \
    .select("emp_id", "name", "salary") \
    .display()



83.	Find duplicate cities.

employee_df.select("city").distinct().display()

84.	Display employees who joined in the last two years.

employee_df.filter(col("joining_date")>"2024-12-31").display()

85.	Replace NULL manager IDs with 999.
86.	Create a salary grade:
•	A → Salary ≥ 80000
•	B → Salary ≥ 60000
•	C → Salary ≥ 40000
•	D → Otherwise

employee_df.withColumn("salary category",when(col("salary")>=80000,"A").when(col("salary")>=60000,"B").when(col("salary")>=40000,"C").otherwise("D")).display()

87.	Create an employee ID string like EMP101.

88.	Find employees whose names end with "e".

employee_df.filter(employee_df.name.like("%e")).display()

89.	Display employees sorted by joining date.

employee_df.sort(col("joining_date").asc()).display()

90.	Find employees who have worked for more than three years.

employee_df.withColumn("Experience",floor(months_between(current_date(),col("joining_date"))/12)).filter(col("experience")>3).display()









