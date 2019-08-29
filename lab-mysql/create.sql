create schema lab_mysql;
use lab_mysql;

-- create cars

CREATE TABLE cars (
	id_car integer NOT NULL, 
    vin VARCHAR(20), 
    manufacturer VARCHAR(20), 
    model VARCHAR(20), 
    year integer, 
    color varchar(20), 
		PRIMARY KEY (id_car)
        );
    
-- create customers

CREATE TABLE customers (
	id_customer integer NOT NULL, 
	customer_id varchar(40), 
    name VARCHAR(20), 
    phone VARCHAR(20), 
    email VARCHAR(20), 
    adress VARCHAR(100), 
    state varchar(20), 
    city varchar(20), 
    country varchar(20), 
    postal varchar(20), 
		PRIMARY KEY (id_customer)
    );
    
-- create salespeople

CREATE TABLE salespeople (
	id_salesperson integer NOT NULL, 
	staff_id varchar(40), 
    name VARCHAR(20), 
    store VARCHAR(20), 
		PRIMARY KEY (id_salesperson)
    );
    
    -- create invoices

CREATE TABLE invoices (
	id_invoice integer NOT NULL, 
	invoice_number varchar(40), 
    date varchar(20), 
    id_car integer,
    id_customer integer,
    id_salesperson integer, 
		PRIMARY KEY (id_invoice)
    );