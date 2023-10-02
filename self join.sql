USE practice;


# to show the name of the manager for each employee in the same row, we can run the following query]

SELECT DISTINCT e.EMP_ID AS employee, e.first_name, e.last_name, e.salary,e.JOB_ID, m.emp_id AS manager,  m.first_name, m.last_name, m.JOB_ID, m.salary
FROM myemp AS e , myemp AS m 
WHERE e.MGR_ID= m.EMP_ID;