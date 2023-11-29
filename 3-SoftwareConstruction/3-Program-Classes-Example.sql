
CREATE OR REPLACE TYPE UserTb_Type AS OBJECT (
    user_id NUMBER,
    user_name VARCHAR2(30),
    email VARCHAR2(255),
    user_password VARCHAR2(20)
);
/

CREATE OR REPLACE TYPE Cook_Type AS OBJECT (
    cook_id NUMBER,
    full_name VARCHAR2(30),
    email VARCHAR2(255),
    cook_password VARCHAR2(20)
);
/

CREATE OR REPLACE TYPE OrderTb_Type AS OBJECT (
    order_id NUMBER,
    order_date DATE,
    order_status VARCHAR2(30),
    user_address VARCHAR2(255),
    user_num NUMBER,
    cook_num NUMBER
);
/

CREATE OR REPLACE TYPE RestaurantList_Type AS OBJECT (
    res_list_id NUMBER,
    res_name VARCHAR2(100),
    category VARCHAR2(50)
);
/

CREATE OR REPLACE TYPE Restaurant_Type AS OBJECT (
    res_id NUMBER,
    res_name VARCHAR2(100),
    description VARCHAR2(500),
    rating NUMBER,
    res_list_num NUMBER
);
/

CREATE OR REPLACE TYPE Dish_Type AS OBJECT (
    dish_id NUMBER,
    dish_name VARCHAR2(100),
    composition VARCHAR2(250),
    price NUMBER(10, 2),
    res_num NUMBER
);
/

CREATE OR REPLACE TYPE OrderItem_Type AS OBJECT (
    quantity NUMBER,
    price NUMBER(10, 2),
    dish_num NUMBER,
    order_num NUMBER
);
/