---1.  Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
    select location_id, street_address, city, state_province, country_name, department_name from locations inner join countries using(country_id) inner join departments using(location_id) group by department_id;

---2.  Write a query to find the name (first_name, last name), department ID, and department name of all the employees.
    select concat(first_name," ",last_name) as name_of_employee, department_id, department_name from employees inner join departments using(department_id);

---3. Write a query to find the name (first_name, last_name), job, department ID, and name of the employees who work in London.
    select concat(first_name," ",last_name) as name_of_employee, job_title, department_id from employees inner join jobs using(job_id) inner join departments using(department_id) inner join locations using(location_id) where city="London";

---4. Write a query to find the employee id, name (last_name) along with their manager_id, and name (last_name).
    select emp1.employee_id, emp1.last_name, emp1.manager_id, emp2.last_name from employees emp1 inner join employees emp2 on emp1.manager_id = emp2.employee_id ;

---5. Write a query to find the name (first_name, last_name) and hire date of the employees who were hired after 'Jones'.
    select concat(first_name," ",last_name)as name_of_employee, hire_date from employees where hire_date > (select hire_date from employees where last_name="Jones");

---6. Write a query to get the department name and number of employees in the department.
    select department_name, count(employee_id) as no_of_employees from departments inner join employees using(department_id) group by department_name order by count(EMPLOYEE_ID);

---7. Write a query to find the employee ID, job title, number of days between the ending date and the starting date for all jobs in department 90.
    select employee_id, job_title, day(end_date) - day(start_date) as Diff from job_history join jobs using(job_id) where department_id=90;

---8. Write a query to display the department ID and name and first name of the manager.
    select emp1.department_id, concat(emp1.first_name," ",emp1.last_name) as name, emp2.first_name from employees emp1 inner join employees emp2 on (emp1.manager_id = emp2.employee_id);

---9. Write a query to display the department name, manager name, and city.
    select department_name, concat(first_name," ",last_name) as manager_name, city from departments inner join employees using(department_id) inner join locations using(location_id) where employees.EMPLOYEE_ID=departments.MANAGER_ID;

---10. Write a query to display the job title and average salary of employees.
    select job_title, avg(salary) as average_salary from employees inner join jobs using(job_id) group by job_id;

---11. Write a query to display job title, employee name, and the difference between the salary of the employee and minimum salary for the job.
    select job_title, concat(first_name," ",last_name) as employee_name, salary-min_salary as salary_diff from employees inner join jobs using(job_id);

---12. Write a query to display the job history of any employee who is currently drawing more than 10000 of salary.
    select job_history.* from job_history inner join employees using(job_id) where salary>10000;

---13. Write a query to display department name, name (first_name, last_name), hire date, the salary of the manager for all managers whose experience is more than 15 years.
    select department_name, concat(first_name," ",last_name) as manager_name, hire_date, salary from employees inner join departments using(department_id) inner join job_history using(employee_id) where employee_id=departments.manager_id and end_date-start_date>15; 