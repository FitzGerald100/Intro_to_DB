-- Switch to the database
USE alx_book_store;

-- AUTHORS table
CREATE TABLE IF NOT EXISTS AUTHORS (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

-- BOOKS table
CREATE TABLE IF NOT EXISTS BOOKS (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    price DECIMAL(10,2) NOT NULL,
    publication_year YEAR,
    FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
        ON DELETE SET NULL ON UPDATE CASCADE
);

-- CUSTOMERS table
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255)
);

-- ORDERS table
CREATE TABLE IF NOT EXISTS ORDERS (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ORDER_DETAILS table
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
