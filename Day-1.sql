create Database ECommerceDB;
Use ECommerceDB;

create table Categories (
    CategoryID int primary key,
    CategoryName varchar(100) not null);
    alter table Categories rename column CategoryID to categoryid;
    alter table Categories rename column CategoryName to categoryname;
select * from categories;

create table products (
    productid int primary key,
    productname varchar(150) not null,
    price decimal(10, 2) not null,
    stock int default 0,
    categoryid int,
    foreign key (categoryid) references categories(categoryid));
select * from products;

create table customers (
    customerid int primary key,
    fullname varchar(100) not null,
    email varchar(100) unique not null,
    address text,
    createdat datetime default current_timestamp);
    alter table customers rename column createdat to registered;
select * from customers;

create table orders (
    orderid int primary key,
    customerid int,
    orderdate datetime default current_timestamp,
    totalamount decimal(10, 2),
    foreign key (customerid) references customers(customerid));
select * from orders;

create table orderitems (
    orderitemid int primary key,
    orderid int,
    productid int,
    quantity int not null,
    unitprice decimal(10, 2) not null,
    discount decimal(5, 2) default 0,
    isreturned boolean default false,
    foreign key (orderid) references orders(orderid),
    foreign key (productid) references products(productid));
select * from orderitems;
    
insert into categories (categoryid, categoryname) values 
(1, 'electronics'),
(2, 'furniture'),
(3, 'clothing'),
(4, 'home appliances'),
(5, 'sports');
select * from categories;

insert into products (productid, productname, price, stock, categoryid) values 
(1, 'samsung galaxy s21', 80000.00, 25, 1),
(2, 'iphone 16 pro max', 130990.00, 15, 1),
(3, 'study chair', 7000.00, 10, 2),
(4, 'desk', 10000.00,15,2),
(5, 't-shirt', 699.00, 60, 3),
(6, 'track pant',799.00,50,3),
(7, 'cooler', 8499.00, 20, 4),
(8, 'gas stove',1399.00,15,4),
(9, 'cricket bat', 1999.00, 40, 5),
(10, 'skipping rope',139,20,5);
select * from products;

insert into customers (customerid, fullname, email, address, registered) values 
(1, 'tilak', 'tilakchitti@gmail.com', '12,kadapa', now()),
(2, 'sai', 'sai@gmail.com', '15, hyderbad', now()),
(3, 'haji', 'haji@gmail.com', '8, bangalore', now()),
(4, 'narendra', 'narendra@gmail.com', '6, chennai', now()),
(5, 'deepak', 'deepak@gmail.com', '15, mumabi', now());
select * from customers;

insert into orders (orderid, customerid, orderdate, totalamount) values (1, 1, now(), 80359.00);
insert into orders (orderid, customerid, orderdate, totalamount) values (2, 2, now(), 2805.00); 
insert into orders (orderid, customerid, orderdate, totalamount) values (3, 3, now(), 2900.00);  
insert into orders (orderid, customerid, orderdate, totalamount) values (4, 4, now(), 10100.00);
insert into orders (orderid, customerid, orderdate, totalamount) values (5, 5, now(), 1250.00);
select * from orders;

insert into orderitems (orderitemid, orderid, productid, quantity, unitprice, discount, isreturned) values 
(1, 1, 1, 1, 80359.00, 5, false),         
(2, 2, 9, 1, 1999.00, 0, false), 
(3, 2, 5, 1, 699.00, 0, false),
(4, 3, 9, 1, 1999.00, 1, false),          
(5, 3, 6, 1, 799.00, 0, false),          
(6, 4, 5, 1, 10100.00, 5, true),
(7, 5, 5, 2, 1250.00, 1, false);
select * from orderitems;



    