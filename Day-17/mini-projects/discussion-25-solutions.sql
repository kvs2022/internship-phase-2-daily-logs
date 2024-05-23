
-- Scenario 1: Advanced Analytics Dashboard
-- You're working as a data engineer for Classic Models and your task is to create an advanced analytics dashboard for the sales team. 
-- They are interested in a daily report showing the number of orders, total sales, and the most purchased product of each day. This is quite a complex query, so you decide to use views to break down the problem:

    -- Create an inline view to calculate the daily total sales.
    create view daily_sales as select date(orderDate) as order_date, sum(quantityOrdered*priceEach) as total_sales from orders join orderdetails using (orderNumber) group by order_date;

    -- Create an updatable view to show the number of orders for each day. Also include a functionality to update the order status in the same view.
    create view daily_orders as select date(orderDate) as order_date, count(orderNumber) as num_orders,status from orders group by order_date,status;
    update daily_orders set status = "new_status" where order_date = "some_date";
    
    -- Create a view to identify the most purchased product of each day.
    create view daily_top_product as select date(orderDate) as order_date, productCode, sum(quantityOrdered) as total_quantity from orders join orderdetails using (orderNumber) group by order_date, productCode order by total_quantity desc;
    
    -- Finally, combine these views to produce the required daily report.
    create view daily_report as select ds.order_date, ds.total_sales, do.num_orders, dtp.productCode as top_product, dtp.total_quantity from daily_sales ds
    join daily_orders do on ds.order_date = do.order_date join ( select dtp1.order_date, dtp1.productCode, dtp1.total_quantity from daily_top_product dtp1 join (select order_date, max(total_quantity) as max_quantity from daily_top_product group by order_date ) dtp2 on dtp1.order_date = dtp2.order_date and dtp1.total_quantity = dtp2.max_quantity ) dtp on ds.order_date = dtp.order_date;


-- Scenario 2: Sales Monitoring System
-- Classic Models has a system to monitor the performance of sales reps. The sales reps' performance is judged based on the number of customers handled, total payments received, and the total number of orders.
-- The details of sales reps are in the employees table and the sales are recorded in the orders and payments tables.

    -- Create a view that shows the total number of customers handled by each sales rep.
    create view total_customers as select employeeNumber, count(distinct customerNumber) as num_customers from customers group by employeeNumber;

    -- Create a view that displays the total payments received by each sales rep.
    create view total_payments as select employeeNumber,sum(amount) as total_payments, from customers join payments using (customerNumber) group by employeeNumber;

    -- Create another view that shows the total number of orders handled by each sales rep.
    create view total_orders as select employeeNumber, count(distint(orderNumber)) as num_orders from customers join order using (customerNumber) group by employeeNumber;

    -- Finally, create a combined view that uses the above views to display the performance of each sales rep.
    create view sales_rep_performance as select t1.employeeNumber,t1.num_customers,t2.total_payments,t3.num_orders from total_customers t1 join total_payments t2 on t1.employeeNumber=t2.employeeNumber join total_orders t3 on t1.employeeNumber=t3.employeeNumber;


-- Scenario 3: HR and Sales Data Analysis
-- Assume the Classic Models has recently acquired a company and you now also have access to the hr database. 
-- The management wants to know if there's a relationship between employee's department, age, and their sales performance.

    -- Create a view in the hr database that shows the department and age of each employee.
    create view emp_details as select employee_id, department_id, timestampdiff(year, birth_date, curdate()) as age from employees;

    -- Create a view in the classicmodels database that shows the sales performance of each employee.
    create view emp_sales_performance as select employeeNumber, sum(amount) as total_sales from customers join payments using (customerNumber) group by employeeNumber;