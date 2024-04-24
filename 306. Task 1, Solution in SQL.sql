SELECT
emp_no, from_date, to_date
FROM
employees_mod.t_dept_emp;

SELECT DISTINCT
emp_no, from_date, to_date
FROM
employees_mod.t_dept_emp;

# Solution untuk Task 1:

USE employees_mod;
SELECT 
    YEAR(tde.from_date) AS calendar_year,
    te.gender AS gender,
    COUNT(te.emp_no) AS num_of_employees
FROM
    t_dept_emp tde
JOIN
t_employees te ON tde.emp_no = te.emp_no
GROUP BY calendar_year, gender
HAVING calendar_year >= '1990'
ORDER BY calendar_year;