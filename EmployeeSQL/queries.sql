/*
Data Analysis
Once you have a complete database, do the following:
*/

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no
	, 	e.first_name
	, 	e.last_name
	, 	e.sex
	, 	s.salary
	
from employees e, salaries s
where e.emp_no = s.emp_no
order by e.emp_no





-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name
	, 	last_name
	, 	hire_date
	
from employees
where right(hire_date, 4) = '1986'



-- 3, List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no
	,	dept_name
	,	dm.emp_no
	, 	last_name
	,	first_name

FROM	dept_manager dm
INNER JOIN departments d ON
	dm.dept_no = d.dept_no
INNER JOIN employees e ON
	dm.emp_no = e.emp_no


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT de.emp_no
	,	first_name 
	,	last_name
	,	dept_name

FROM	dept_emp de
INNER JOIN departments d ON
	de.dept_no = d.dept_no
INNER JOIN employees e ON
	de.emp_no = e.emp_no



-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name
	,	last_name
	,	sex

FROM 	employees
WHERE	first_name = 'Hercules'
	AND	last_name LIKE 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.emp_no
	,	first_name 
	,	last_name
	,	dept_name

FROM	dept_emp de
INNER JOIN departments d ON
	de.dept_no = d.dept_no
INNER JOIN employees e ON
	de.emp_no = e.emp_no

WHERE dept_name = 'Sales'
	

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no
	,	first_name 
	,	last_name
	,	dept_name

FROM	dept_emp de
INNER JOIN departments d ON
	de.dept_no = d.dept_no
INNER JOIN employees e ON
	de.emp_no = e.emp_no

WHERE dept_name IN ('Sales', 'Development')
	

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(*) as "last_name_count"
FROM employees
GROUP BY last_name
ORDER BY count(*) desc


