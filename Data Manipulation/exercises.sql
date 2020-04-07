
-- * SELECT STATEMENT * --

SELECT 
    first_name, last_name
FROM
    employees;

-- Select all data from the “departments” table.

SELECT 
    *
FROM
    departments;
    
-- Select the information from the “dept_no” column of the “departments” table.
SELECT 
    dept_no
FROM
    departments;

-- * WHERE CLAUSE * --
-- ﻿Select all people from the “employees” table whose first name is “Elvis”
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';

-- * AND OPERATOR *--
-- Retrieve a list with all female employees whose first name is Kellie. 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
    
-- * OPERATOR OR *--
-- ﻿Retrieve a list with all employees whose first name is either Kellie or Aruna.
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' OR first_name = 'Aruna';

-- * OPERATOR PRECEDENCE AND > OR: *--
-- Retrieve a list with all female employees whose first name is either Kellie or Aruna.
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F' AND (first_name = 'Kellie' OR first_name = 'Aruna');
    
-- * IN operator: *--
-- Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');
    
-- * NOT IN operator: *--
-- Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');

-- * LIKE operator: *--

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');

-- Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. 
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');

-- Retrieve a list with all employees who have been hired in the year 2000.
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');

-- * BETWEEN ... AND ... * --
SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';
    
-- Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;

-- Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.

SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN 10004 AND 10012;

-- Select the names of all departments with numbers between ‘d003’ and ‘d006’.
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';


-- * IS NOT NULL / IS NULL *--
﻿-- Select the names of all departments whose department number value is not null.
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;

-- * COMPARISON OPERATORS *--

-- ﻿Retrieve a list with data about all female employees who were hired in the year 2000 or after.
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND hire_date >= '2000-01-01';
        

-- Extract a list with all employees’ salaries higher than $150,000 per annum.       
SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;
    
-- * DISTINCT *--
SELECT DISTINCT
    gender
FROM
    employees;

-- Obtain a list with all different “hire dates” from the “employees” table.
SELECT DISTINCT
    hire_date
FROM
    employees;
    
-- * ORDER BY *--

SELECT 
    *
FROM
    employees
ORDER BY first_name;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

-- Select all data from the “employees” table, ordering it by “hire date” in descending order.
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

-- * COUNT *--

SELECT 
    COUNT(emp_no)
FROM
    employees;

SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;

-- ﻿How many annual contracts with a value higher than $100,000 have been registered in the salaries table?
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary > 100000;

-- How many managers do we have in the “employees” database?
SELECT 
    COUNT(*)
FROM
    dept_manager;
    
-- * GROUP BY *--
-- ! Always include the field you have grouped your results by in the SELECT statement !

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

-- * USING ALIASES (AS) *--

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name;

SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary; 

-- * HAVING *--
-- ! HAVING is like WHERE but applied to the GROUP BY block !
-- After HAVING, you can have a conditin with an aggregate function, while WHERE cannot use aggregate functions within its conditions

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;

-- Select all employees whose average salary is higher than $120,000 per annum.
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

-- WHERE vs HAVING: Aggregate functions -> GROUP BY and HAVING. General conditions -> WHERE
-- Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

-- * LIMIT *--
-- Select the first 100 rows from the ‘dept_emp’ table. 
SELECT 
    *
FROM
    dept_emp
LIMIT 100;

-- * INSERT STATEMENT *--

INSERT INTO employees
(
	emp_no,
    birth_date,
    first_name,
    last_name,
    gender,
    hire_date
) VALUES 
(
	999901,
    '1986-04-21',
    'John',
    'Smith',
    'M',
    '2011-01-01'
);

-- insert information about employee number 999903. State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997.
    
INSERT INTO employees
VALUES
(
   999903,
   '1977-09-14',
   'Johnathan',
   'Creek',
   'M',
   '1999-01-01'
);

INSERT INTO titles
(emp_no, title, from_date)
VALUES (999903, 'Senior Engineer', '1997-10-01');

-- Insert information about the individual with employee number 999903 into the “dept_emp” table. He/She is working for department number 5, and has started work on October 1st, 1997; her/his contract is for an indefinite period of time.

INSERT INTO dept_emp
(emp_no, dept_no, from_date, to_date)
VALUES(999903, 'd005', '1997-10-01', '9999-01-01');

-- Create a new department called “Business Analysis”. Register it under number ‘d010’.
INSERT INTO departments VALUES ('d010', 'Business Analysis');

-- * DELETE STATEMENT *--

DELETE FROM employees 
WHERE
    emp_no = 999903;

-- Remove the department number 10 record from the “departments” table.
DELETE FROM departments
WHERE 
	dept_no = 'd010';
    
-- DROP vs TRUNCATE vs DELETE:

-- drop: you won't be able to roll back to its initial state, or to the last commit statement.
-- truncate: will remove all records in the table, but structure will remain intact. Auto-increment values will be reset.
-- delete: removes records row by row. Auto-increment values are not reset.

-- COMMIT STATEMENT:
-- saves the transaction in the database. Changes cannot be undone. Used to save the state of the data in the database
-- at the moment of its execution.

-- ROLLBACK CLAUSE:
-- Allos you to take a step back. The last change(s) made will not count
-- Reverts to the last non-committed state
-- It will refer to the state corresponding to the last time you executed COMMIT

-- * UPDATE *--

UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;

-- Change the “Business Analysis” department name to “Data Analysis”.
UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_name = 'Business Analysis';
    
-- ** AGGREGATE FUNCTIONS: COUNT, SUM, MIN, MAX, AVG ** --
-- Aggregate functions typically ignore null values throughout the field to which they are applied

-- * COUNT(): *--
-- ! COUNT(*) returns the number of all rows of the table, NULL values included !

-- How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.
SELECT 
    COUNT(DISTINCT dept_no) AS n_dep
FROM
    dept_emp;
    
-- * SUM(): *--

-- What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?

SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
    
-- * MIN() AND MAX(): *--

-- Which is the lowest salary we offer?
SELECT 
    MIN(salary)
FROM
    salaries;

-- Which is the highest employee number in the database?

SELECT 
    MAX(emp_no)
FROM
    employees;
    
-- * AVG(): * --

-- What is the average annual salary paid to employees who started after the 1st of January 1997?

SELECT 
    AVG(salary)
FROM
    salaries
WHERE
    from_date >= '1997-01-01';
    
-- * ROUND() * --
-- Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents.

SELECT 
    ROUND(AVG(salary), 2) as avg_sal
FROM
    salaries
WHERE
    from_date >= '1997-01-01';
    
-- * INSERTING DATA INTO a NEW TABLE: * --

CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

INSERT INTO departments_dup (dept_no, dept_name) SELECT * FROM departments;

-- allow null values to be registered in the "department name" column

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

-- insert a couple of data values

INSERT INTO departments_dup(dept_no)VALUES ('d010'), ('d011');

-- adding a third column called "department manager"

ALTER TABLE departments_dup 
ADD COLUMN dept_manager VARCHAR(255) NULL AFTER dept_name;

commit;

-- IFNULL(): returns the first of the two indicated values if the data value found in the table is null,
-- and returns the second value if there is a null value

SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department name not provided') as dept_name
FROM
    departments_dup;

-- COALESCE(): allows you to insert N arguments in the parentheses. 
-- Coalesce() will always return a single value of the ones we have within parentheses, and this value will
-- be the first non-null value of this list, reading the values from left to right.

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    departments_dup
ORDER BY dept_no ASC;

-- Select the department number and name from the ‘departments_dup’ table and add a third column where you name the department number (‘dept_no’) as ‘dept_info’. If ‘dept_no’ does not have a value, use ‘dept_name’.

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;
    
--  Apply the IFNULL() function to the values from the first and second column, so that ‘N/A’ is displayed whenever a department number has no value, and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.

SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;
     