-- I: Dropping a table with DROP statement
-- I Usar el statement "DROP" para borrar la tabla "sales"
DROP TABLE sales;
DROP TABLE customers;
DROP TABLE items;
DROP TABLE companies;
-- II: Creating a DATABASE
-- II: Crear una base de datos

CREATE DATABASE IF NOT EXISTS Sales;

CREATE SCHEMA IF NOT EXISTS Sales;

-- III: Run USE statement: The USE Statement is used to select a database and perform SQL operations into that database.
-- III: Ejecutar el comando USE: Con él, se selecciona una base de datos para ejecutar operaciones sobre ella por defecto.

USE Sales;

-- IV: Creating a TABLE: Create the "sales" and "customers" table in the "sales" database
-- IV: Crear una TABLA: Crear las tablas "sales" y "customers" en la base de datos "sales"

CREATE TABLE sales
(
	purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL
);

CREATE TABLE customers                         
(
   customer_id INT AUTO_INCREMENT,
   first_name VARCHAR(255),
   last_name VARCHAR(255),
   email_address VARCHAR(255),
   number_of_complaints INT,
   PRIMARY KEY(customer_id)
);

-- V: Using SELECT statement to select all records from the "sales" table
-- V: Usar el comando SELECT para seleccionar todos los registros de la tabla "sales"

SELECT * FROM sales;
SELECT * FROM sales.sales;

-- Create the rest of the tables:
-- Crear el resto de tablas:

CREATE TABLE items
(
	item_id VARCHAR(255),
    item VARCHAR(255),
    unit_price NUMERIC(10,2),
    company_id VARCHAR(255),
    PRIMARY KEY(item_id)
);

CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquarters_phone_number INT(12),
    PRIMARY KEY(company_id)
);

-- VI: Adding table relationships with ALTER TABLE and FOREIGN KEY
-- VI: Añadir las relaciones entre tablas con ALTER TABLE y FOREIGN KEY

ALTER TABLE sales
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

ALTER TABLE sales
ADD FOREIGN KEY (item_code) REFERENCES items(item_id) ON DELETE CASCADE;

ALTER TABLE items
ADD FOREIGN KEY(company_id) REFERENCES companies(company_id) ON DELETE CASCADE;

-- VII: Add the UNIQUE KEY constraint to some table columns: The UNIQUE constraint ensures that all values in a column are different.
-- VII: Añadimos la constraint "UNIQUE KEY" a algunas columnas. Esta restricción asegura que los valores de una columna son todos diferentes

ALTER TABLE customers
ADD UNIQUE KEY (email_address);

ALTER TABLE companies
ADD UNIQUE KEY (headquarters_phone_number);

-- VIII: Borrar la constraint UNIQUE KEY:
-- VIII: Delete the UNIQUE KEY constraint:

ALTER TABLE customers
DROP INDEX email_address;

-- IX: ADD a "gender" column in the "customers" table
-- X: Añadir una columna "gender" en la tabla "customers"
ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;

-- X: Insert a new record in it
-- X: Insertar un registro nuevo en ella.
INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);

-- XI: Adding Default Values to the Table
-- XI: Añadir valores por default a la tabla

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) DEFAULT 'X';

-- XII: Remove the DEFAULT constraint
-- XII: Borrar la constraint DEFAULT 

ALTER TABLE customers
ALTER COLUMN number_of_complaints DROP DEFAULT;

-- XIII: ADD NOT NULL constraint
-- XIII: Añadir la restricción NOT NULL

ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;

ALTER TABLE companies
CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;

-- XIV: Remove NOT NULL constraint
-- XIV: Eliminar la restricción NOT NULL

ALTER TABLE companies
MODIFY company_name VARCHAR(255) NULL;

ALTER TABLE companies
MODIFY headquarters_phone_number VARCHAR(255) NULL;

