CREATE TABLE products(
    id  INT PRIMARY KEY AUTO_INCREMENT,
    sku VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    weight DECIMAL(10,2) NOT NULL,
    description TEXT NOT NULL,
    thumbnail VARCHAR(150) NOT NULL,
    image VARCHAR(255) NOT NULL,
    category INT NOT NULL,
    create_date DATETIME NOT NULL,
    stock DECIMAL(10,2) NOT NULL
);

CREATE TABLE options(
    id INT PRIMARY KEY AUTO_INCREMENT,
    option_name VARCHAR(50) NOT NULL
);

CREATE TABLE products_options(
    id INT PRIMARY KEY AUTO_INCREMENT,
    option_id INT NOT NULL,
    product_id INT NOT NULL,
    FOREIGN KEY(option_id) REFERENCES options(id),
    FOREIGN KEY(product_id) REFERENCES products(id)
);

CREATE TABLE categories(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
    thumbnail VARCHAR(200)
);

CREATE TABLE product_categories(
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY(product_id) REFERENCES products(id),
    FOREIGN KEY(category_id) REFERENCES categories(id)
);


-- Second section
CREATE TABLE customers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    billing_address VARCHAR(255) NOT NULL,
    default_shipping_address VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL
);

CREATE TABLE orders(
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    ammount DECIMAL(10,2) NOT NULL,
    shipping_address VARCHAR(255) NOT NULL,
    order_address VARCHAR(255) NOT NULL,
    order_email VARCHAR(255) NOT NULL,
    order_date DATETIME NOT NULL,
    order_status VARCHAR(50) NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

CREATE TABLE order_details(
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    sku VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(product_id) REFERENCES products(id)
);
