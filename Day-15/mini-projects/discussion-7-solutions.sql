

--- 1. Write a query to find the name (first_name, last_name) and the salary of the employees who have a higher salary than the employee whose last_name='Bull'.
    select concat(first_Name," ",last_Name) as emp_name, salary from employees where salary > (select salary from employees where last_Name="Bull");

--- 2. Write a query to find the name (first_name, last_name) of all employees who works in the IT department.
    select concat(first_Name," ",last_Name) as emp_name from employees emp where emp.department_id in (select department_id from departments where department_name="IT");

--- 3. Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA-based department.
    select concat(first_name," ",last_name) as employee_name from employees where manager_id in (select employee_id from employees where department_id in (select department_id from departments where location_id in(select location_id from locations where country_id='US')));

--- 4. Write a query to find the name (first_name, last_name) of the employees who are managers.
    select concat(first_Name," ",last_Name) as emp_name from employees emp where emp.employee_id in (select manager_id from departments where emp.employee_id=manager_id);

--- 5. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.
    select concat(first_Name," ",last_Name) as emp_name,salary from employees emp where salary >(select avg(salary) from employees);

--- 6. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their jobs.
    select concat(first_Name," ",last_Name) as emp_name,salary from employees emp where salary = (select min(salary) from jobs where emp.job_id = jobs.job_id);

--- 7. Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the average salary and works in any of the IT departments.
    select concat(first_Name," ",last_Name) as emp_name, salary from employees where salary > (select avg(salary) from employees) and department_id in (select department_id from departments where department_name like "IT%" );

--- 8. Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earnings of Mr. Bell.
    select concat(first_Name," ",last_Name) as emp_name, salary from employees where salary > (select salary from employees where last_name="Bell" ); 

--- 9. Write a query to find the name (first_name, last_name), and salary of the employees who earn the same salary as the minimum salary for all departments.
    select concat(first_Name," ",last_Name) as emp_name, salary from employees emp1 where salary = all(select min(salary) from employees emp2 where emp1.department_id=emp2.department_id group by department_id);
 
--- 10. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary of all departments.
    select concat(first_Name," ",last_Name) as emp_name, salary from employees emp2 where salary > (select avg(salary) from employees emp2 where emp1.department_id=emp2.department_id group by department_id);

--- 11. Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary from the lowest to highest.
     select first_name, last_name, salary FROM employees where salary >all (select salary from employees where job_id="SH_CLERK") order by salary;

--- 12. Write a query to find the name (first_name, last_name) of the employees who are not managers.
    select concat(first_name," ",last_Name) as emp_name from employees  where employee_id not in (select manager_id from employees);

--- 13. Write a query to display the employee ID, first name, last name, and department names of all employees.
    select employee_id,first_Name,last_Name (select department_name from departments where departments.department_id=employees.department_id)as department_name from employees;

--- 14. Write a query to display the employee ID, first name, last name, salary of all employees whose salary is above average for their departments.
    select employee_id, first_Name,last_Name, salary from employees e where salary > (select avg(salary) as dept_avg from employees where e.department_id=employees.department_id group by department_id);

--- 15. Write a query to fetch even numbered records from employees table.
    select * from employees where employee_id % 2 = 0;

--- 16. Write a query to find the 5th maximum salary in the employees table.
    select distinct salary from employees where salary = (select salary from employees order by salary desc limit 1 offset 4);

--- 17. Write a query to find the 4th minimum salary in the employees table.
    select distinct salary from employees where salary = (select salary from employees order by salary limit 1 offset 4);

--- 18. Write a query to select the last 10 records from a table.
    select * from employees order by employee_id desc limit 10; --OR
    select * from (select * from employees order by employee_id desc limit 10) as sub_table order by employee_id;

--- 19. Write a query to list the department ID and name of all the departments where no employee is working.
    select department_id,department_name from departments dept where department_id not in (select department_id from employees);

--- 20. Write a query to get 3 maximum salaries.
    select salary from (select distinct salary from employees order by salary desc limit 3) as sub_table;

--- 21. Write a query to get 3 minimum salaries.
    select salary from (select distinct salary from employees order by salary limit 3) as sub_table;

--- 22. Write a query to get nth max salaries of employees.
    select salary from employees order by salary desc limit 1 offset n-1 ;   -- n is the no which should be specified by the user.