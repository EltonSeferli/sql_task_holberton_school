create table customers (
    id int auto_increment,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    email varchar(255) not null,
    city varchar(255) not null
);

create table products (
    id int auto_increment,
    prod_name varchar(255) not null,
    prod_category varchar(255) not null,
    prod_price double not null,
    constraint pk_products primary key (id)
);

create table orders (
    id int auto_increment,
    customer_id int not null,
    order_date date not null,
    constraint pk_orders primary key (id),
    constraint fk_orders_customers foreign key (customer_id) references customers(id)
);

create table order_items (
    id int auto_increment,
    order_id int not null,
    product_id int not null,
    quantity int not null,
    constraint pk_order_items primary key (id),
    constraint fk_items_orders foreign key (order_id) references orders(id),
    constraint fk_items_products foreign key (product_id) references products(id)
);
