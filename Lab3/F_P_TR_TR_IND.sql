-------------------------------------------- Функції --------------------------------------------------------------------

-- Обчислює середню ціну продуктів --
CREATE OR REPLACE FUNCTION get_average_product_price()
RETURNS DECIMAL AS $$
DECLARE
    avg_price DECIMAL;
BEGIN
    SELECT AVG(price) INTO avg_price
    FROM products;
    RETURN avg_price;
END;
$$ LANGUAGE plpgsql;

SELECT get_average_product_price();

-- Повертає ціну продукту за його ідентифікатором --
CREATE OR REPLACE FUNCTION get_product_price(p_product_id INT)
RETURNS DECIMAL AS $$
DECLARE
    product_price DECIMAL;
BEGIN
    SELECT price INTO product_price
    FROM products
    WHERE product_id = p_product_id;
    RETURN product_price;
END;
$$ LANGUAGE plpgsql;

SELECT get_product_price(6);

-- Повертає кількість продуктів у таблиці --
CREATE OR REPLACE FUNCTION get_product_count()
RETURNS INT AS $$
DECLARE
    product_count INT;
BEGIN
    SELECT COUNT(*) INTO product_count
    FROM products;
    RETURN product_count;
END;
$$ LANGUAGE plpgsql;

SELECT get_product_count();

---------------------------------- Створення тригерних функцій -----------------------------------------------

-- Тригерна функція для обчислення середньої ціни продуктів --
CREATE OR REPLACE FUNCTION trigger_get_average_product_price()
RETURNS TRIGGER AS $$
BEGIN
    PERFORM get_average_product_price();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

----------------------------------Тригерна функція для отримання ціни продукту-----------------------------
CREATE OR REPLACE FUNCTION trigger_log_product_price_change()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.price <> OLD.price THEN
        INSERT INTO product_price_change_audit(product_id, old_price, new_price, change_timestamp)
        VALUES (NEW.product_id, OLD.price, NEW.price, NOW());
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Тригерна функція для обчислення кількості продуктів --
CREATE OR REPLACE FUNCTION trigger_get_product_count()
RETURNS TRIGGER AS $$
BEGIN

    PERFORM get_product_count();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-------------------------------------------- Створення тригерів ------------------------------------------------------

-- Тригер, що викликає обчислення середньої ціни продуктів після вставки нового продукту --
CREATE TRIGGER after_insert_product_avg_price
AFTER INSERT ON products
FOR EACH ROW
EXECUTE FUNCTION trigger_get_average_product_price();

---Тригер, що відслідковує зміни ціни продукту--------------------------------------------------
CREATE TRIGGER product_price_change_trigger
AFTER UPDATE ON products
FOR EACH ROW
WHEN (OLD.price IS DISTINCT FROM NEW.price)
EXECUTE FUNCTION trigger_log_product_price_change();


---Тригер, що викликає обчислення кількості продуктів після вставки нового продукту--------------------------------
CREATE TRIGGER after_insert_product_count
AFTER INSERT ON products
FOR EACH ROW
EXECUTE FUNCTION trigger_get_product_count();



-------------------------------------------- Процедури --------------------------------------------------------------------

---Оновлення існуючого замовлення---------------------------------------------
CREATE OR REPLACE PROCEDURE update_order(
    p_order_id INT,
    p_order_date DATE,
    p_total_amount DECIMAL
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Orders
    SET order_date = p_order_date, total_amount = p_total_amount
    WHERE order_id = p_order_id;
END;
$$;
CALL update_order(1, '2024-07-01', 500.00);

SELECT order_id, order_date, total_amount FROM Orders WHERE order_id = 1;

--------------------------------------Додає нового клієнта до таблиці Customers------------------------------------------------------

-- Оновлення дати замовлення --
CREATE OR REPLACE PROCEDURE update_order_date(
    p_order_id INT,
    p_new_date DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Orders
    SET order_date = p_new_date
    WHERE order_id = p_order_id;
END;
$$;

CALL update_order_date(1, '2023-12-25');

SELECT order_date FROM orders WHERE order_id=1;


-------------------------------------Оновлення запасів на складі-----------------------------------------------------
CREATE OR REPLACE PROCEDURE update_stock(
    p_product_id INT,
    p_quantity INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Products
    SET stock_quantity = stock_quantity - p_quantity
    WHERE product_id = p_product_id;
END;
$$;

CALL update_stock(101, 2);

SELECT product_id ,stock_quantity FROM Products WHERE product_id=101;


---------------------------------------------Індекси------------------------------------------

CREATE INDEX idx_customers_email
ON Customers (email);

SELECT * FROM Customers WHERE email = 'cburmaster0@rambler.ru';

CREATE INDEX idx_orders_order_date
ON Orders (order_date);

SELECT * FROM Orders WHERE order_date BETWEEN '2024-06-01' AND '2024-06-30';

CREATE INDEX idx_products_product_name
ON Products (product_name);

SELECT * FROM Products WHERE product_name LIKE 'Laptop%';

-------------------------------Транзакції-----------------

---------Вставка нового продукту і оновлення запасів-----------
BEGIN;
INSERT INTO products (product_name, description, price, stock_quantity) 
VALUES ('New Product', 'Description of the new product', 99.99, 50);
UPDATE products
SET stock_quantity = stock_quantity + 50
WHERE product_name = 'New Product';
COMMIT

SELECT product_name, stock_quantity FROM products WHERE product_name = 'New Product';

-----вставки нового клієнта та його замовлення---------

BEGIN;
INSERT INTO customers (first_name, last_name, email) 
VALUES ('John', 'Doe', 'john.doe@example.com');
INSERT INTO orders (customer_id, order_date, total_amount)
VALUES ((SELECT customer_id FROM customers WHERE email = 'john.doe@example.com' LIMIT 1), '2024-07-01', 300.00);
COMMIT;

ROLLBACK

--------------оновлення ціни продукту та вставка нового замовлення--------------------------------
BEGIN;
UPDATE products
SET price = 120.00
WHERE product_name = 'Laptop';
INSERT INTO orders (customer_id, order_date, total_amount)
VALUES (1, '2024-07-15', 120.00);
COMMIT;

