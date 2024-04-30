-- Write DDL statements to create a DB and tables as per the given schema:


create table offices( 
officeCode varchar(10) Primary key, 
city varchar(30), 
phone varchar(10) not null, 
addressLine1 varchar(100), 
addressLine2 varchar(100), 
state varchar(50), 
country varchar(40), 
postalCode int(10), 
territory varchar(40));


create table employes( 
employeeNumber varchar(40) Primary key, 
lastName varchar(50), 
firstName varchar(60), 
extension varchar(30), 
email varchar(50) Unique, 
officeCode varchar(20), 
reportsTo varchar(60), 
jobTitle varchar(100), 
foreign key (officeCode) references offices(officeCode));


create table customers( 
customerNumber int(15) Primary key, 
customerName varchar(50), 
contactLastName varchar(30), 
contactFirstName varchar(30), 
phone varchar(10), 
addressLine1 varchar(100), 
addressLine2 varchar(100), 
city varchar(40), 
state varchar(30), 
postalCode int(10), 
country varchar(40), 
salesRepEmployeeNumber varchar(40), 
creditLimit decimal(10,2));


create table payments( 
customerNumber int(15), 
checkNumber varchar(20) Primary key, 
paymentDate date, 
amount decimal(10,2), 
foreign key (customerNumber) references customers(customerNumber));


create table orders( 
orderNumber int(10) not null, 
orderDate date, 
requiredDate date, 
shippedDate date, 
status varchar(50), 
comments varchar(40) default null, 
customerNumber int(15), 
primary key(orderNumber), 
foreign key (orderNumber) references orderdetails(orderNumber), 
foreign key (customerNumber) references customers(customerNumber));


create table orderdetails ( 
orderNumber int(20) not null, 
productCode int(10), 
quantityOrdered int(20) not Null, 
priceEach decimal(10,2), 
orderLineNumber int(15),
primary key(orderNumber,productCode), 
foreign key (productCode) references products(productCode));


create table products ( 
productCode int(11) Primary key, 
productName varchar(50) not null, 
productLine int(10), 
productScale varchar(25), 
productVendor varchar(40), 
productDescription varchar(200), 
quantityInStock int(30), 
buyPrice decimal(10,2), 
MSRP decimal(11,2), 
foreign key(productLine) references productlines(productLine));


create table productlines (
productLine int(10) Primary key, 
textDescription varchar(200), 
htmlDescription varchar(200), 
image varchar(150));












