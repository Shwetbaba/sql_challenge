-- 1. List the following details of each employee: emp. number, last name, first name, sex, and salary.

SELECT emp.emp_no, emp.last_name,emp.first_name, emp.sex, sal.salary
FROM employees AS emp
JOIN salaries AS sal
ON (emp.emp_no = sal.emp_no);


-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';


-- 3. List the manager of each department with the following information: dept. number, dept. name, manager name, emp. number, last name, first name.

SELECT dept.dept_no, dept.dept_name, dept_mgr.emp_no, emp.last_name, emp.first_name
FROM departments AS dept
JOIN dept_manager AS dept_mgr
ON (dept.dept_no = dept_mgr.dept_no)
JOIN employees AS emp
ON (dept_mgr.emp_no = emp.emp_no);


-- 4. List the department of each employee with the following information: emp. number, last name, first name, and dept. name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees AS emp
JOIN dept_emp AS d_emp
ON (emp.emp_no = d_emp.emp_no)
JOIN departments AS dept
ON (d_emp.dept_no = dept.dept_no);


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"

SELECT emp.first_name, emp.last_name, emp.sex
FROM employees AS emp
WHERE emp.first_name = 'Hercules' 
AND emp.last_name LIKE 'B%';


-- 6. List all employees in the Sales department including their emp. number, last name, first name, and dept. name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees AS emp
JOIN dept_emp AS d_emp
ON (emp.emp_no = d_emp.emp_no)
JOIN departments AS dept
ON (d_emp.dept_no = dept.dept_no)
WHERE dept.dept_name = 'Sales';


-- 7. List all employees in the Sales and Development departments including their emp. number, last name, first name, and dept. name.

SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees AS emp
JOIN dept_emp AS d_emp
ON (emp.emp_no = d_emp.emp_no)
JOIN departments AS dept
ON (d_emp.dept_no = dept.dept_no)
WHERE dept.dept_name IN ('Sales', 'Development');


-- 8. List the frequency counts, in descending order, of all the employee last names (i.e., how many employees share each last name)

SELECT last_name, COUNT(emp_no) AS LASTNAME_COUNT
FROM employees
GROUP BY last_name
ORDER BY LASTNAME_COUNT DESC;
