
-- Updatable View:
    -- Create an updatable view that includes customerNumber, customerName, contactLastName, and contactFirstName from the customers table. 
    -- Then, try to update the contactFirstName for a specific customerNumber.
    create view customer_view as select customerNumber, customerName,contactLastName, contactFirstName from customers;
    update customer_view set contactFirstName = "Pan" where customerNumber = 114;


-- Read-Only View:
    -- Create a read-only view that joins the orderdetails table and the products table on productCode and includes orderNumber, productName, and quantityOrdered.
    -- Try to update the quantityOrdered for a specific orderNumber and see what happens.
    create view orderdetails_view as select od.orderNumber,od.quantityOrdered from orderdetails od where productCode in from (select productName from products p where od.productCode = p.productCode);
    update orderdetails_view set quantityOrdered = 25 where orderNumber=10101;


-- Inline View:
    -- Write a query that uses an inline view to get the total number of orders for each customer. 
    -- The inline view should select customerNumber and orderNumber from the orders table. The main query should then group by customerNumber.
    select customerNumber,count(orderNumber) as total_no_orders from ( select customerNumber, orderNumber from orders) as iv group by customerNumber;


-- Materialized View:
    -- Note that MySQL does not natively support materialized views, but you can mimic them with a combination of stored procedures and triggers. 
    -- The task here would be to create a stored procedure that creates a new table with productName and totalQuantityOrdered (this total should be aggregated from the orderdetails table). 
    -- Then, create an AFTER INSERT trigger on the orderdetails table that calls this stored procedure to update the table (acting as a materialized view) whenever a new order detail is inserted.
    
    create table materialized_product_view as select productName,sum(quantityOrdered) as totalQuantityOrdered from orderdetails join products using (productCode);

    create procedure RefreshMaterializedProductOrderView()
    begin
        delete from materialized_product_view;

        insert into materialized_product_view
        select productName,sum(quantityOrdered) as totalQuantityOrdered
        from products join orderdetails using (productCode)
    end;

    create trigger RefreshMaterializedProductOrderViewAfterInsert
    after insert on orderdetails
    for each row
    begin
        call RefreshMaterializedProductOrderView();


