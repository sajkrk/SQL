--Data Analysis

--Data Analysis
-- #1 list the employee number, last name, first name, gender and salary
SELECT e.emp_no, e.first_name, e.last_name, e.gender, salaries.salary
FROM employees AS e
INNER JOIN salaries ON e.emp_no = salaries.emp_no;

-- #2 list employees who were hired in 1986
SELECT *
FROM employees
WHERE hire_date between '1986-01-01' and '1986-12-31';

-- #3 list the manager of each dept with dept num, dept name, manager`s employee number, last name, first name, start and end date
--breaking into simple inorder to be clear
--SELECT d.dept_name, dm.emp_no, dm.from_data, dm.to_date
--FROM departments AS d, dept_manager AS dm
--WHERE d.dept_no = dm.dept_no;

SELECT d.dept_no, d.dept_name, dm.from_data, dm.to_date, e.emp_no, e.last_name, e.first_name 
FROM departments AS d, dept_manager AS dm, employees AS e
WHERE d.dept_no = dm.dept_no and dm.emp_no = e.emp_no;

--#4 list the dept of each employee with employee num, last name, first name and dept name.
SELECT d.dept_name, e.emp_no, e.first_name, e.last_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON de.emp_no = e.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no;


-- #5 list all employees whose first_name is 'Hercules' and last names begin with 'B'
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- #6 list all employees in sales dept including their emp no, last name, first name and dept name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales';

-- #7 list all employees in sales and development dept with emp no, last name, first name, dept name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON e.emp_no = de.emp_no
INNER JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE dept_name = 'Development'
OR dept_name = 'Sales';

-- #8 in descending order, list frequency count of employee last names(how many employees share each last name)
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name;

