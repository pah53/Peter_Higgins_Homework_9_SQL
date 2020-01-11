/* Selecting relevant columns from employees and salaries tables */
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.gender, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

/* List of employees who were hired in 1986 */ 
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date = '1986%';

/* List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates. */
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.hire_date, "Manager".dept_no, "Manager".to_date, "Departments".dept_no
FROM "Manager"
JOIN employees ON
employees.emp_no="Manager".emp_no
JOIN "Departments" ON
"Manager".dept_no="Departments".dept_no;

/* List the department of each employee with the following information: employee number, last name, first name, and department name */
SELECT employees.emp_no, employees.first_name, employees.last_name, "Dept_Emp".dept_no, "Dept_Emp".emp_no, "Departments".dept_no
FROM "Dept_Emp"
JOIN employees ON
employees.emp_no="Dept_Emp".emp_no
JOIN "Departments" ON
"Dept_Emp".dept_no="Departments".dept_no;

/* List all employees whose first name is "Hercules" and last names begin with "B" */
SELECT * FROM employees 
WHERE 
	first_name = 'Hercules'
	AND last_name LIKE'B%';
	
/* List all employees in the Sales department, including their employee number, last name, first name, and department name. */
SELECT employees.emp_no, employees.first_name, employees.last_name, "Dept_Emp".dept_no, "Dept_Emp".emp_no, "Departments".dept_no
FROM "Dept_Emp"
JOIN employees ON
employees.emp_no="Dept_Emp".emp_no
JOIN "Departments" ON
"Dept_Emp".dept_no="Departments".dept_no
WHERE dept_name = 'Sales';

/* List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name. */
SELECT employees.emp_no, employees.first_name, employees.last_name, "Dept_Emp".dept_no, "Dept_Emp".emp_no, "Departments".dept_no
FROM "Dept_Emp"
JOIN employees ON
employees.emp_no="Dept_Emp".emp_no
JOIN "Departments" ON
"Dept_Emp".dept_no="Departments".dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

/* In descending order, list the frequency count of employee last names, i.e., how many employees share each last name. */
SELECT last_name, COUNT(last_name) AS "Employee Last Names"
FROM employees
GROUP BY last_name
ORDER BY "Employee Last Names" DESC;