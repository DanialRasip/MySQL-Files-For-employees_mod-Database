SELECT MIN(salary) FROM employees_mod.t_salaries;
SELECT MAX(salary) FROM employees_mod.t_salaries;

# Body Of Query:

SELECT
AVG(ts.salary),
te.gender,
td.dept_name
FROM
employees_mod.t_salaries ts
JOIN
employees_mod.t_employees te ON ts.emp_no = te.emp_no # Kena joinkan sebab nak column gender dari te
JOIN
employees_mod.t_dept_emp tde ON tde.emp_no = te.emp_no # Kena joinkan sebab xde connecting column daripada t_departments
JOIN 
employees_mod.t_departments td ON td.dept_no = tde.dept_no 
GROUP BY
te.gender, td.dept_name;

SELECT AVG(salary) FROM employees_mod.t_salaries
WHERE salary < 50000 AND salary > 90000;

HAVING ts.salary > 50000 AND ts.salary < 90000;

USE employees_mod;
DROP PROCEDURE IF EXISTS filter_records; #average_salary_by_gender_and_department;
DELIMITER $$
CREATE PROCEDURE employees_mod.filter_records(IN p_min_salary FLOAT, IN p_max_salary FLOAT)
BEGIN