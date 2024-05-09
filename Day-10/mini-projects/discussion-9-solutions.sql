
---1 Write a query to list the number of jobs available in the employees table.
select count(distinct job_id) from hr.employees;

---2 Write a query to get the total salaries payable to employees.
select sum(salary) as total_salaries_payable from hr.employees;

---3 Write a query to get the minimum salary from the employees table.
select min(salary) as lowest_salary from hr.employees;

---4 Write a query to get the maximum salary of an employee working as a Programmer.
select max(salary) as highest_salary from hr.employees emp inner join jobs jb using(job_id) where jb.job_title = "Programmer"; 

---5 Write a query to get the average salary and number of employees working in department 90.
select avg(salary) as average_salary, count(employee_id) from employees join departments using(department_id) where department = 90;

---6 Write a query to get the highest, lowest, sum, and average salary of all employees
select max(salary) as highest_salary, min(salary) as lowest_salary, sum(salary), avg(salary) as average_salary from employees;

---7 Write a query to get the number of employees with the same job.
select count(employee_id),job_id as no_of_employees from hr.employees group by job_id;
select count(employee_id) as no_of_employees, job_title from employees inner join jobs jb using(job_id) group by jb.job_title;

---8 Write a query to get the difference between the highest and lowest salaries.
select max(salary) - min(salary) as DIFF from employees; 

---9 Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
select manager_id, min(salary) as from employee group by manager_id; 

---10 Write a query to get the department ID and the total salary payable in each department.
select department_id, sum(salary) as total_salary_payable from employees  group by department_id;

---11 Write a query to get the average salary for each job ID excluding programmer.
select job_id, avg(salary) from employees where job_id not in (select job_id from jobs where job_title="Programmer") group by job_id;

---12 Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.
select sum(salary) as total_salary, min(salary) as minimum_salary, max(salary) as maximum_salary, avg(salary) as average_salary from employees group by job_id having department_id=90;

---13 Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.
select job_id,max(salary) as highest_salary from employees where salary>=4000 group by job_id;

---14 Write a query to get the average salary for all departments employing more than 10 employees.
select avg(salary) as average_salary,department_id from employees group by department_id having count(employee_id)>10;