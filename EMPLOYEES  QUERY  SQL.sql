-- How can you select all data from the DEPARTMENTS table?
SELECT *FROM EMPLOYEES.DEPARTMENTS;

-- How do you count the total number of department numbers in the DEPARTMENTS table?
SELECT COUNT(DEPT_NO) FROM EMPLOYEES.DEPARTMENTS;

-- How do you find the smallest department number?
SELECT MIN(DEPT_NO) FROM EMPLOYEES.DEPARTMENTS;

-- How can you concatenate the DEPT_NAME and DEPT_NO columns?
SELECT CONCAT(DEPT_NAME),CONCAT(DEPT_NO) FROM EMPLOYEES.DEPARTMENTS;

-- How do you filter departments with DEPT_NO less than or equal to 'd005'?
SELECT DEPT_NO,DEPT_NAME FROM EMPLOYEES.DEPARTMENTS
WHERE DEPT_NO <='dOO5';

-- How can you find departments where the DEPT_NO is NULL?
SELECT *FROM EMPLOYEES.DEPARTMENTS
WHERE DEPT_NO IS NULL; 

-- How can you select departments with DEPT_NO less than or equal to 'd006'?
SELECT *FROM EMPLOYEES.DEPARTMENTS
WHERE DEPT_NO <="dOO6";

-- DEPT_EMP DATA  
-- How can you retrieve all data from the DEPT_EMP table?
SELECT *FROM EMPLOYEES.DEPT_EMP;

-- How do you find employee numbers less than or equal to 10019?
SELECT  EMP_NO FROM EMPLOYEES.DEPT_EMP
WHERE EMP_NO <='10019';

-- How do you count the number of entries for EMP_NO, DEPT_NO, FROM_DATE, and TO_DATE?
SELECT COUNT(EMP_NO),COUNT(DEPT_NO),COUNT(FROM_DATE),COUNT(TO_DATE) FROM EMPLOYEES.DEPT_EMP;

-- How do you check for NULL values in EMP_NO, DEPT_NO, FROM_DATE, and TO_DATE?
SELECT ISNULL(EMP_NO) AS EMP_NO,
ISNULL(DEPT_NO) AS DEPT_NO,
ISNULL(FROM_DATE) AS FROM_DATE,
ISNULL(TO_DATE) AS TO_DATE FROM EMPLOYEES.DEPT_EMP;

-- How can you find duplicate FROM_DATE entries?
SELECT DUPLICAT(FROM_DATE) FROM EMPLOYEES.DEPT_EMP;

-- How do you group results by EMP_NO and DEPT_NO?
SELECT EMP_NO, DEPT_NO FROM EMPLOYEES.DEPT_EMP
GROUP BY EMP_NO,DEPT_NO;

-- How do you find employees whose EMP_NO is between 10005 and 10020?
SELECT  EMP_NO BETWEEN '10005'AND '10020' FROM EMPLOYEES.DEPT_EMP;

-- How can you find employees with EMP_NO between 10010 and 10050?
SELECT *FROM EMPLOYEES.DEPT_EMP
WHERE EMP_NO BETWEEN '10010' AND '10050';

-- How do you find the minimum EMP_NO and FROM_DATE grouped by each employee and date?
SELECT MIN(EMP_NO)  AS EMP_NO, MIN(FROM_DATE)AS FROM_DATE FROM EMPLOYEES.DEPT_EMP
GROUP BY EMP_NO, FROM_DATE;

-- What is the total of EMP_NO from the EMPLOYEES.DEPT_EMP table?
SELECT SUM(EMP_NO) AS EMP_NO FROM EMPLOYEES.DEPT_EMP;

-- How many EMP_NO entries are there in the EMPLOYEES.DEPT_EMP table?
SELECT COUNT(EMP_NO) FROM EMPLOYEES.DEPT_EMP;

-- What is the minimum value of EMP_NO in the EMPLOYEES.DEPT_EMP table?
SELECT MIN(EMP_NO) FROM EMPLOYEES.DEPT_EMP;

-- What is the maximum value of EMP_NO in the EMPLOYEES.DEPT_EMP table?
SELECT MAX(EMP_NO) FROM EMPLOYEES.DEPT_EMP;

-- What is the result of add EMP_NO from the EMPLOYEES.DEPT_EMP table?
SELECT CONCAT(EMP_NO) FROM EMPLOYEES.DEPT_EMP;

-- What are the not allow duplicate EMP_NO values in the EMPLOYEES.DEPT_EMP table?
SELECT DISTINCT(EMP_NO) FROM EMPLOYEES.DEPT_EMP;

-- What is the date format of the EMP_NO from the EMPLOYEES.DEPT_EMP table?
SELECT DATE(EMP_NO) FROM EMPLOYEES.DEPT_EMP;
-- Get the day name of employee and department numbers (if stored as dates)
SELECT DAYNAME(EMP_NO), DAYNAME(DEPT_NO)
FROM EMPLOYEES.DEPT_EMP;

-- Get the day of the month from the employee number (if date formatted)
SELECT DAY(EMP_NO)
FROM EMPLOYEES.DEPT_EMP;

-- Get the length of the employee number
SELECT LENGTH(EMP_NO)
FROM EMPLOYEES.DEPT_EMP;

-- Retrieve various date components from the FROM_DATE field
SELECT MONTH(FROM_DATE), MONTHNAME(FROM_DATE), YEAR(FROM_DATE), YEARWEEK(FROM_DATE),
       DAYNAME(FROM_DATE), DATE(FROM_DATE)
FROM EMPLOYEES.DEPT_EMP;

-- Convert employee number into binary format
SELECT BINARY(EMP_NO)
FROM EMPLOYEES.DEPT_EMP;

-- Retrieve employee data for specific employee numbers and group results
SELECT EMP_NO, DEPT_NO, FROM_DATE, TO_DATE
FROM EMPLOYEES.DEPT_EMP
WHERE EMP_NO BETWEEN '10001' AND '10020'
GROUP BY EMP_NO, DEPT_NO, TO_DATE;

-- DEPT_MANAGER DATA

-- Select all records from DEPT_MANAGER table
SELECT *
FROM EMPLOYEES.DEPT_MANAGER;

-- Invalid query: Attempt to find NULL EMP_NO (incorrect syntax)
SELECT *
FROM EMPLOYEES.DEPT_MANAGER
WHERE EMP_NO IS NULL;

-- Find managers within a specific employee number range
SELECT *
FROM EMPLOYEES.DEPT_MANAGER
WHERE EMP_NO >= 110022 AND EMP_NO <= 110228;

-- Retrieve first employee number per department using window function
SELECT NTH_VALUE(EMP_NO, 1) OVER (PARTITION BY DEPT_NO ORDER BY EMP_NO DESC
                                  ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
FROM EMPLOYEES.DEPT_MANAGER;

-- Calculate days from '0' date to the employee number (if a valid date)
SELECT TO_DAYS(EMP_NO)
FROM EMPLOYEES.DEPT_MANAGER;

-- Replace 'A' with 'I' in employee numbers
SELECT EMP_NO, REPLACE(EMP_NO, 'A', 'I')
FROM EMPLOYEES.DEPT_MANAGER;

-- Rename DEPT_NO as DEPARTMENT
SELECT DEPT_NO AS DEPARTMENT
FROM EMPLOYEES.DEPT_MANAGER;

-- Extract various date components from FROM_DATE field
SELECT MONTHNAME(FROM_DATE) AS MONTH_NAME,
       YEAR(FROM_DATE) AS YEAR,
       MONTH(FROM_DATE) AS MONTH,
       DATE(FROM_DATE) AS DATE,
       DAYNAME(FROM_DATE) AS DAY_NAME,
       LENGTH(FROM_DATE) AS DATE_LENGTH
FROM EMPLOYEES.DEPT_MANAGER;

-- EMPLOYEES TABLE DATA

-- Retrieve all employee records
SELECT *
FROM EMPLOYEES.EMPLOYEES;

-- Select all male employees
SELECT *
FROM EMPLOYEES.EMPLOYEES
WHERE GENDER = 'M';

-- Count male employees
SELECT COUNT(GENDER)
FROM EMPLOYEES.EMPLOYEES
WHERE GENDER = 'M';

-- Count female employees
SELECT COUNT(GENDER)
FROM EMPLOYEES.EMPLOYEES
WHERE GENDER = 'F';

-- Retrieve all female employees ordered by employee number
SELECT *
FROM EMPLOYEES.EMPLOYEES
WHERE GENDER = 'F'
ORDER BY EMP_NO;

-- Get count, min, max, and average of employee numbers
SELECT COUNT(EMP_NO) AS EMP_NO_COUNT,
       MIN(EMP_NO) AS EMP_NO_MIN,
       MAX(EMP_NO) AS EMP_NO_MAX,
       AVG(EMP_NO) AS EMP_NO_AVG
FROM EMPLOYEES.EMPLOYEES;

-- Extract date components from the BIRTH_DATE field
SELECT MONTHNAME(BIRTH_DATE) AS MONTH_NAME,
       YEAR(BIRTH_DATE) AS YEAR,
       MONTH(BIRTH_DATE) AS MONTH,
       DATE(BIRTH_DATE) AS DATE,
       DAYNAME(BIRTH_DATE) AS DAY_NAME,
       LENGTH(BIRTH_DATE) AS DATE_LENGTH
FROM EMPLOYEES.EMPLOYEES;

-- Find employees with first and last names starting with 'A'
SELECT *
FROM EMPLOYEES.EMPLOYEES
WHERE FIRST_NAME LIKE 'A%'
AND LAST_NAME LIKE 'A%';

-- Find names with 'A' as the third character in first and last names
SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES.EMPLOYEES
WHERE FIRST_NAME LIKE '__A__'
AND LAST_NAME LIKE '__A__';
-- Count the number of first and last names in the employees table
SELECT COUNT(FIRST_NAME) AS FIRST_NAME_COUNT,
       COUNT(LAST_NAME) AS LAST_NAME_COUNT
FROM EMPLOYEES.EMPLOYEES;

-- Count male employees whose first names start with 'A'
SELECT COUNT(FIRST_NAME)
FROM EMPLOYEES.EMPLOYEES
WHERE FIRST_NAME LIKE 'A%' AND GENDER = 'M';

-- Count female employees whose first names start with 'A'
SELECT COUNT(FIRST_NAME)
FROM EMPLOYEES.EMPLOYEES
WHERE FIRST_NAME LIKE 'A%' AND GENDER = 'F';

-- Count male employees whose last names start with 'A'
SELECT COUNT(LAST_NAME)
FROM EMPLOYEES.EMPLOYEES
WHERE LAST_NAME LIKE 'A%' AND GENDER = 'M';

-- Count female employees whose last names start with 'A'
SELECT COUNT(LAST_NAME)
FROM EMPLOYEES.EMPLOYEES
WHERE LAST_NAME LIKE 'A%' AND GENDER = 'F';

-- Select all columns and check if EMP_NO is NULL
SELECT *, ISNULL(EMP_NO)
FROM EMPLOYEES.EMPLOYEES;

-- Extract the hour part from the BIRTH_DATE column
SELECT *, HOUR(BIRTH_DATE) AS BIRTH_DATE_HOURS
FROM EMPLOYEES.EMPLOYEES;

-- Attempt to calculate the arcsine of BIRTH_DATE (likely invalid use case)
SELECT *, ASIN(BIRTH_DATE)
FROM EMPLOYEES.EMPLOYEES;

-- Calculate the bit length of hire date and employee number
SELECT BIT_LENGTH(HIRE_DATE), BIT_LENGTH(EMP_NO)
FROM EMPLOYEES.EMPLOYEES;

-- Convert hire date to character format
SELECT CHAR(HIRE_DATE)
FROM EMPLOYEES.EMPLOYEES;

-- Group by employee number (unusual without aggregate functions)
SELECT EMP_NO, BIRTH_DATE, HIRE_DATE
FROM EMPLOYEES.EMPLOYEES
GROUP BY EMP_NO;

-- Select employees within a specific range of employee numbers
SELECT *
FROM EMPLOYEES.EMPLOYEES
WHERE EMP_NO BETWEEN '10001' AND '10009';

-- Select employee numbers either below 10009 or above 10020
SELECT EMP_NO
FROM EMPLOYEES.EMPLOYEES
WHERE EMP_NO <= '10009' OR EMP_NO >= '10020';

-- Select unique first names from the employees table
SELECT DISTINCT(FIRST_NAME)
FROM EMPLOYEES.EMPLOYEES;

-- SALARIES TABLE DATA
-- Select all salary records
SELECT *
FROM EMPLOYEES.SALARIES;

-- Order salaries in descending order and employee numbers in ascending order
SELECT SALARY, EMP_NO
FROM EMPLOYEES.SALARIES
ORDER BY SALARY DESC, EMP_NO ASC;

-- Get the top 5 highest salaries
SELECT SALARY, EMP_NO
FROM EMPLOYEES.SALARIES
ORDER BY SALARY DESC
LIMIT 5;

-- Calculate the average salary rounded to 2 decimal places
SELECT ROUND(AVG(SALARY), 2)
FROM EMPLOYEES.SALARIES;

-- Count the number of salaries per employee and filter where the count is at least 66074
SELECT EMP_NO, COUNT(SALARY) AS TOTAL
FROM EMPLOYEES.SALARIES
GROUP BY EMP_NO
HAVING COUNT(SALARY) >= 66074
ORDER BY EMP_NO DESC;

-- Extract the month from the salary date
SELECT EXTRACT(MONTH FROM SALARY) AS SALARY_MONTH, SALARY
FROM EMPLOYEES.SALARIES;

-- Extract the year from the salary date
SELECT EXTRACT(YEAR FROM SALARY) AS SALARY_YEAR, SALARY
FROM EMPLOYEES.SALARIES;

-- INNER JOIN to combine employees and their salaries
USE EMPLOYEES;
SELECT *
FROM EMPLOYEES.SALARIES
JOIN EMPLOYEES ON SALARIES.EMP_NO = EMPLOYEES.EMP_NO;

-- INNER JOIN with explicit keyword
SELECT *
FROM EMPLOYEES.SALARIES
INNER JOIN EMPLOYEES ON SALARIES.EMP_NO = EMPLOYEES.EMP_NO;

-- LEFT JOIN to get all salaries and matching employee details
SELECT *
FROM EMPLOYEES.SALARIES
LEFT JOIN EMPLOYEES ON SALARIES.EMP_NO = EMPLOYEES.EMP_NO;

-- RIGHT JOIN to get all employees and their matching salary details
SELECT *
FROM EMPLOYEES.SALARIES
RIGHT JOIN EMPLOYEES ON SALARIES.EMP_NO = EMPLOYEES.EMP_NO;

-- Self-join using aliases
SELECT *
FROM EMPLOYEES.SALARIES AS T1
JOIN EMPLOYEES.SALARIES AS T2 ON T2.SALARY = T1.EMP_NO;

-- Find salaries greater than the average salary
SELECT *
FROM EMPLOYEES.SALARIES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES.SALARIES);

-- Select salaries for employees whose employee number exists in another query
SELECT SALARY, FROM_DATE
FROM EMPLOYEES.SALARIES
WHERE EMP_NO IN (SELECT EMP_NO FROM EMPLOYEES);

-- Window function to sum all salaries
SELECT SALARY, FROM_DATE,
       SUM(SALARY) OVER (ORDER BY SALARY ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS TOTAL
FROM EMPLOYEES.SALARIES;

-- Window function to find the minimum salary
SELECT SALARY, FROM_DATE,
       MIN(SALARY) OVER (ORDER BY SALARY ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS MIN_SALARY
FROM EMPLOYEES.SALARIES;

-- Window function to find the average salary
SELECT SALARY, FROM_DATE,
       AVG(SALARY) OVER (ORDER BY SALARY ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS AVG_SALARY
FROM EMPLOYEES.SALARIES;

-- Window function to find the maximum salary
SELECT SALARY, FROM_DATE,
       MAX(SALARY) OVER (ORDER BY SALARY ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS MAX_SALARY
FROM EMPLOYEES.SALARIES;

-- Window function to count the number of salaries
SELECT SALARY, FROM_DATE,
       COUNT(SALARY) OVER (ORDER BY SALARY ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS SALARY_COUNT
FROM EMPLOYEES.SALARIES;

-- Ranking functions applied to employee numbers
SELECT EMP_NO,
       ROW_NUMBER() OVER (ORDER BY EMP_NO) AS ROW_NUMBER,
       RANK() OVER (ORDER BY EMP_NO) AS RANK,
       DENSE_RANK() OVER (ORDER BY EMP_NO) AS DENSE_RANK,
       PERCENT_RANK() OVER (ORDER BY EMP_NO) AS PERCENT_RANK
FROM EMPLOYEES.SALARIES;

-- Ranking functions applied to salaries
SELECT SALARY,
       ROW_NUMBER() OVER (ORDER BY SALARY) AS ROW_NUMBER,
       RANK() OVER (ORDER BY SALARY) AS RANK,
       DENSE_RANK() OVER (ORDER BY SALARY) AS DENSE_RANK,
       PERCENT_RANK() OVER (ORDER BY SALARY) AS PERCENT_RANK
FROM EMPLOYEES.SALARIES;

-- Lead and lag functions for employee numbers
SELECT EMP_NO,
       FIRST_VALUE(EMP_NO) OVER (ORDER BY EMP_NO) AS FIRST_VALUE,
       LAST_VALUE(EMP_NO) OVER (ORDER BY EMP_NO ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS LAST_VALUE,
       LEAD(EMP_NO) OVER (ORDER BY EMP_NO) AS LEAD,
       LAG(EMP_NO) OVER (ORDER BY EMP_NO) AS LAG
FROM EMPLOYEES.SALARIES;

-- Lead and lag with an offset of 2
SELECT EMP_NO,
       LEAD(EMP_NO, 2) OVER (ORDER BY EMP_NO) AS LEAD_2,
       LAG(EMP_NO, 2) OVER (ORDER BY EMP_NO) AS LAG_2
FROM EMPLOYEES.SALARIES;

-- Case statement based on employee number
SELECT EMP_NO, FROM_DATE,
       CASE
           WHEN EMP_NO > 10004 THEN 'EXPENSIVE NO'
           WHEN EMP_NO = 10002 THEN 'MODERATE NO'
           ELSE 'INEXPENSIVE NO'
       END AS EMP_NUMBER
FROM EMPLOYEES.SALARIES;

-- Case statement based on FROM_DATE (likely a logic mistake here)
SELECT EMP_NO,
       CASE FROM_DATE
           WHEN 1004 THEN 'EXPENSIVE NO'
           WHEN 1017 THEN 'MODERATE NO'
           ELSE 'INEXPENSIVE NO'
       END AS EMP_NUMBER
FROM EMPLOYEES.SALARIES;

-- Complex join across multiple tables
SELECT e.first_name, e.last_name, dpn.dept_name, t.title, s.salary
FROM EMPLOYEES e
JOIN dept_emp dp ON e.emp_no = dp.emp_no
JOIN departments dpn ON dp.dept_no = dpn.dept_no
JOIN titles t ON e.emp_no = t.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
LIMIT 100;


