#  E-Commerce Database (MySQL)

This project contains SQL scripts to set up and populate a basic e-commerce relational database using MySQL.

## Overview

- Simple relational database for managing an e-commerce platform
- Designed with 5 main entities:
  - Categories
  - Products
  - Customers
  - Orders
  - Order Items
 
- categories  -> Stores product category names            
- products    -> Stores product details and pricing          
- customers   -> Stores customer information                 
- orders      -> Stores order summary linked to customers    
- orderitems  -> Stores individual items within an order 


- Each product belongs to one category.
- Each order is placed by one customer.
- Each order can contain multiple products via `orderitems`.
- Foreign keys ensure referential integrity between tables.
