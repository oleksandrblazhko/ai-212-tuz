CREATE TABLE UserTb(
    user_id INT PRIMARY KEY,
    user_name VARCHAR(30) NOT NULL,
    email VARCHAR(255) NOT NULL CHECK (email ~* '^([a-z0-9][a-z0-9._-]*@[a-z][a-z0-9._-]*\.[a-z]{2,4})$'),
    user_password VARCHAR(20) NOT NULL
);

CREATE TABLE Cook(
    cook_id INT PRIMARY KEY,
    full_name VARCHAR(30) NOT NULL,
    email VARCHAR(255) NOT NULL CHECK (email ~* '^([a-z0-9][a-z0-9._-]*@[a-z][a-z0-9._-]*\.[a-z]{2,4})$'),
    cook_password VARCHAR(20) NOT NULL
);

CREATE TABLE OrderTb(
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL CHECK (order_date <= CURRENT_DATE),
    order_status VARCHAR(30),
    user_address VARCHAR(255) NOT NULL,
    user_num INT REFERENCES UserTb(user_id),
    cook_num INT REFERENCES Cook(cook_id)
);

CREATE TABLE RestaurantList(
    res_list_id INT PRIMARY KEY,
    res_name VARCHAR(100) NOT NULL,
    category VARCHAR(50)
);

CREATE TABLE Restaurant(
    res_id INT PRIMARY KEY,
    res_name VARCHAR(100) NOT NULL,
    description VARCHAR(500) NOT NULL,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    res_list_num INT REFERENCES RestaurantList(res_list_id)
);

CREATE TABLE Dish(
    dish_id INT PRIMARY KEY,
    dish_name VARCHAR(100) NOT NULL,
    composition VARCHAR(250) NOT NULL,
    price DECIMAL(10, 2) CHECK (price > 0) NOT NULL,
    res_num INT REFERENCES Restaurant(res_id)
);

CREATE TABLE OrderItem(
    quantity INT CHECK (quantity > 0) NOT NULL,
    price DECIMAL(10, 2) CHECK (price > 0) NOT NULL,
    dish_num INT REFERENCES Dish(dish_id),
    order_num INT REFERENCES OrderTb(order_id)
);
