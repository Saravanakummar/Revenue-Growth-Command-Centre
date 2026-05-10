CREATE DATABASE revenue_growth;
USE revenue_growth;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    signup_date DATE,
    country VARCHAR(50),
    device_type VARCHAR(20),
    marketing_channel VARCHAR(50)
);

CREATE TABLE sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    session_start DATETIME,
    session_end DATETIME,
    page_views INT,
    traffic_source VARCHAR(50),
    converted TINYINT,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date DATETIME,
    order_status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    price_per_unit DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATETIME,
    payment_method VARCHAR(20),
    payment_status VARCHAR(20),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
