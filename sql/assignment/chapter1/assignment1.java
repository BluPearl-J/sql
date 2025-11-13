
CREATE DATABASE e_commerce;
USE e_ecommerce;

CREATE TABLE users (
user_id INT PRIMARY KEY AUTO_INCREMENT ,
name VARCHAR(100) NOT NULL,
email VARCHAR(200) UNIQUE NOT NULL,
phone VARCHAR(15),
nin VARCHAR(20),
password VARCHAR(200),
bvn VARCHAR(35),
address VARCHAR(200)
);

--Primary Key: user_id

--products/items for sales
CREATE TABLE Products (
    a_product_id INT AUTO_INCREMENT PRIMARY KEY ,
    product_name VARCHAR(300),
    product_expiry DATE,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    
);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,   --foreign key
    a_product_id INT, --foeign key
    quantity INT,
    order_date DATETIME DEFAULT CURRRENT_TIMESTAMP,
    --FOREIGN KEY (user_id) --REFERENCES Users(user_id),
    --FOREIGN KEY (a_product_id) --REFERENCES Products(a_product_id)
);