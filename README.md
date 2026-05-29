Holberton School - SQL Assignment
This project contains the design and implementation of a relational database schema alongside query operations developed for the Holberton School curriculum. The objective of this assignment is to model a normalized relational database architecture and execute structured SQL queries using JOIN, GROUP BY, and COUNT.

Database Architecture
The schema consists of 4 normalized tables mapped through standard relationships to ensure data integrity:

customers: Stores basic customer profiles.

products: Stores inventory items, categories, and pricing.

orders: Stores transaction dates and links directly to customers.

order_items: Acts as an associative table to resolve the Many-to-Many relationship between orders and products.

Data Definition Language (DDL)
The database structures and table constraints are defined using the following standardized SQL script:

```SQL
-- 1. Customers Table
CREATE TABLE customers (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    CONSTRAINT pk_customers PRIMARY KEY (id),
    CONSTRAINT uq_customer_email UNIQUE (email)
);

-- 2. Products Table
CREATE TABLE products (
    id INT AUTO_INCREMENT,
    prod_name VARCHAR(255) NOT NULL,
    prod_category VARCHAR(255) NOT NULL,
    prod_price DOUBLE NOT NULL,
    CONSTRAINT pk_products PRIMARY KEY (id)
);

-- 3. Orders Table
CREATE TABLE orders (
    id INT AUTO_INCREMENT, 
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    CONSTRAINT pk_orders PRIMARY KEY (id),
    CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- 4. Order Items Table
CREATE TABLE order_items (
    id INT AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT pk_order_items PRIMARY KEY (id),
    CONSTRAINT fk_items_orders FOREIGN KEY (order_id) REFERENCES orders(id),
    CONSTRAINT fk_items_products FOREIGN KEY (product_id) REFERENCES products(id)
);
```
