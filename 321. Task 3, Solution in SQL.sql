SELECT YEAR(from_date) AS calendar_year FROM employees_mod.t_salaries
WHERE YEAR(from_date) <= 2002
GROUP BY YEAR(from_date)
ORDER BY YEAR(from_date);

# x berapa tepat:

USE employees_mod;
SELECT
te.gender,
td.dept_name,
ROUND(AVG(ts.salary), 2) AS Average_Salary,
YEAR(ts.from_date) AS calendar_year
FROM
t_employees te
JOIN
t_salaries ts ON te.emp_no = ts.emp_no
JOIN
t_dept_emp tde ON te.emp_no = tde.emp_no
JOIN
t_departments td ON tde.dept_no = td.dept_no
GROUP BY td.dept_no, te.gender, calendar_year
HAVING calendar_year <= 2002
ORDER BY calendar_year, tde.dept_no;

# Jawapan daripada Solution:

USE employees_mod;
SELECT
e.gender, d.dept_name, ROUND(AVG(s.salary), 2) AS salary, YEAR(s.from_date) AS calendar_year
FROM
t_salaries s 
JOIN
t_employees e ON s.emp_no = e.emp_no
JOIN
t_dept_emp de ON de.emp_no = e.emp_no
JOIN
t_departments d ON d.dept_no = de.dept_no
GROUP BY d.dept_no, e.gender, calendar_year
HAVING calendar_year <= 2002
ORDER BY calendar_year, d.dept_no;
