SELECT
*
FROM
employees_mod.t_dept_manager;

SELECT
YEAR(hire_date)
FROM
employees_mod.t_employees
WHERE YEAR(hire_date) >= 1990
GROUP BY YEAR(hire_date)
ORDER BY YEAR(hire_date);

# Solution sendiri:

SELECT
    td.dept_name,
    te.gender,
    tdm.emp_no,
    tdm.from_date,
    tdm.to_date,
    e.calendar_year,
    CASE WHEN YEAR(tdm.from_date) <= e.calendar_year AND YEAR(tdm.to_date) >= e.calendar_year THEN 1 
         ELSE 0
    END AS Active
FROM
    employees_mod.t_dept_manager tdm
JOIN
    employees_mod.t_departments td ON tdm.dept_no = td.dept_no
JOIN
    employees_mod.t_employees te ON tdm.emp_no = te.emp_no
CROSS JOIN
    (SELECT
         YEAR(hire_date) AS calendar_year
     FROM
         employees_mod.t_employees
     WHERE 
         YEAR(hire_date) >= 1990
     GROUP BY 
         YEAR(hire_date)
     ORDER BY 
         YEAR(hire_date)
    ) AS e
ORDER BY 
    tdm.emp_no, e.calendar_year;

# Jawapan daripada Solution:

USE employees_mod;
SELECT 
    d.dept_name,
    ee.gender,
    dm.emp_no,
    dm.from_date,
    dm.to_date,
    e.calendar_year,
    CASE
        WHEN YEAR(dm.to_date) >= e.calendar_year AND YEAR(dm.from_date) <= e.calendar_year THEN 1
        ELSE 0
    END AS active
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
    FROM
        t_employees
    GROUP BY calendar_year) e
        CROSS JOIN
    t_dept_manager dm
        JOIN
    t_departments d ON dm.dept_no = d.dept_no
        JOIN 
    t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY dm.emp_no, calendar_year;