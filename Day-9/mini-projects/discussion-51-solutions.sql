--- Part 1: Mastering Pattern Matching with LIKE
    --- Task 1.1: Wildcard Searches for Product Names: Create a query to find product names that start with "Classic", include any characters in the middle, and end with "Car".
        select productName from products where productLine like "Classic%_Car";

    --- Task 1.2: Flexible Search for Customer Addresses: Identify all customer addresses that contain the word "Street" or "Avenue" in any part of the address field.
        select * from customers where addressLine1 like "%Street%" or addressline1 like "%Avenue%";

--- Part 2: Utilizing Range Queries with BETWEEN
    --- Task 2.1: Orders within a Price Range:  Find all orders with total amounts between two values, indicating mid-range transactions.
        select orderNumber, sum(quantityOrdered*priceEach) as total_amount from orderdetails join orders using(orderNumber) group by orderNumber having sum(quantityOrdered*priceEach) between min(quantityOrdered*priceEach) and max(quantityOrdered*priceEach);

    --- Task 2.2: Payments within a Date Range: Retrieve all payments made within a specific date range, focusing on a high-activity period.
        select * from payments where paymentDate between "2003-06-05" and "2003-12-06";

--- Part 3: Exploring Subqueries with ANY and ALL
    --- Task 3.1: Orders Exceeding Average Sale Amount
        select orderNumber, sum(quantityOrdered*priceEach) as total_amount, avg(quantityOrdered*priceEach) as avg_sale_amount from orderdetails join orders using(orderNumber) group by orderNumber having sum(quantityOrdered*priceEach)>avg(quantityOrdered*priceEach);

    --- Task 3.2: Products with Maximum Order Quantity
        select productCode,productName, max(quantityOrdered) as max_order_quantity from products join orderdetails using(productCode) where quantityOrdered = (select max(quantityOrdered) from orderdetails) group by productcode;

--- Part 4: Combining Operators for Complex Queries
    --- Task 4.1: High-Value Customers in Specific Regions: Identify customers who have made payments in the top 10% of all payments and are located in specific geographic regions.
        

    --- Task 4.2: Seasonal Sales Analysis: Analyze sales data to identify products with significantly higher sales in specific seasons compared to their annual sales average.


