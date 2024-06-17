1. -- Вибрати всі колонки з таблиці Orders
   SELECT * FROM Orders;

2. -- Вибрати колонки order_id, customer_id та order_date з таблиці Orders
   SELECT order_id, customer_id, order_date FROM Orders;

3. -- Вибрати всі колонки з таблиці Orders, де customer_id дорівнює 1000
   SELECT * FROM Orders WHERE customer_id = 1000;

4. -- Вибрати всі колонки з таблиці Orders, де дата замовлення знаходиться між '2023-01-01' і '2023-12-31'
   SELECT * FROM Orders WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31';

5. -- Вибрати всі колонки з таблиці Orders, де customer_id дорівнює 1000, 1001 або 1002
   SELECT * FROM Orders WHERE customer_id IN (1000, 1001, 1002);

6. -- Вибрати всі колонки з таблиці Customers, де прізвище починається на 'K'
   SELECT * FROM Customers WHERE last_name LIKE 'K%';

7. -- Вибрати всі колонки з таблиці Orders, де total_amount є NULL
   SELECT * FROM Orders WHERE total_amount IS NULL;

8. -- Вибрати всі колонки з таблиці Orders, де total_amount не є NULL
   SELECT * FROM Orders WHERE total_amount IS NOT NULL;

9. -- Вибрати унікальні значення customer_id з таблиці Orders
   SELECT DISTINCT customer_id FROM Orders;

10. -- Вибрати перші 10 записів з таблиці Orders
    SELECT * FROM Orders LIMIT 10;

11. -- Вибрати всі колонки з таблиці Products
    SELECT * FROM Products;

12. -- Вибрати колонки product_id, product_name та price з таблиці Products
    SELECT product_id, product_name, price FROM Products;

13. -- Вибрати всі колонки з таблиці Products, де price більше 50
    SELECT * FROM Products WHERE price > 50;

14. -- Вибрати всі колонки з таблиці Products, де stock_quantity менше 10
    SELECT * FROM Products WHERE stock_quantity < 10;

15. -- Вибрати всі колонки з таблиці Customers
    SELECT * FROM Customers;

16. -- Вибрати колонки customer_id, first_name та last_name з таблиці Customers
    SELECT customer_id, first_name, last_name FROM Customers;

17. -- Вибрати всі колонки з таблиці Orders, де order_date дорівнює сьогоднішній даті
    SELECT * FROM Orders WHERE order_date = CURRENT_DATE;

18. -- Вибрати всі колонки з таблиці OrderItems
    SELECT * FROM OrderItems;

19. -- Вибрати колонки order_item_id, order_id, product_id з таблиці OrderItems
    SELECT order_item_id, order_id, product_id FROM OrderItems;

20. -- Вибрати всі колонки з таблиці OrderItems, де quantity більше 5
    SELECT * FROM OrderItems WHERE quantity > 5;

21. -- Порахувати кількість записів у таблиці Orders
    SELECT COUNT(*) FROM Orders;

22. -- Порахувати суму значень price у таблиці OrderItems
    SELECT SUM(price) FROM OrderItems;

23. -- Порахувати середнє значення price у таблиці OrderItems
    SELECT AVG(price) FROM OrderItems;

24. -- Порахувати максимальне значення price у таблиці OrderItems
    SELECT MAX(price) FROM OrderItems;

25. -- Порахувати мінімальне значення price у таблиці OrderItems
    SELECT MIN(price) FROM OrderItems;

26. -- Порахувати кількість записів у таблиці Customers
    SELECT COUNT(*) FROM Customers;

27. -- Порахувати суму значень total_amount у таблиці Orders
    SELECT SUM(total_amount) FROM Orders;

28. -- Порахувати середнє значення total_amount у таблиці Orders
    SELECT AVG(total_amount) FROM Orders;

29. -- Порахувати максимальне значення total_amount у таблиці Orders
    SELECT MAX(total_amount) FROM Orders;

30. -- Порахувати мінімальне значення total_amount у таблиці Orders
    SELECT MIN(total_amount) FROM Orders;

31. -- Порахувати кількість записів у таблиці Products
    SELECT COUNT(*) FROM Products;

32. -- Порахувати суму значень stock_quantity у таблиці Products
    SELECT SUM(stock_quantity) FROM Products;

33. -- Порахувати середнє значення price у таблиці Products
    SELECT AVG(price) FROM Products;

34. -- Порахувати максимальне значення price у таблиці Products
    SELECT MAX(price) FROM Products;

35. -- Порахувати мінімальне значення price у таблиці Products
    SELECT MIN(price) FROM Products;

36. -- Порахувати кількість записів у таблиці OrderItems
    SELECT COUNT(*) FROM OrderItems;

37. -- Порахувати суму значень quantity у таблиці OrderItems
    SELECT SUM(quantity) FROM OrderItems;

38. -- Порахувати середнє значення quantity у таблиці OrderItems
    SELECT AVG(quantity) FROM OrderItems;

39. -- Порахувати максимальне значення quantity у таблиці OrderItems
    SELECT MAX(quantity) FROM OrderItems;

40. -- Порахувати мінімальне значення quantity у таблиці OrderItems
    SELECT MIN(quantity) FROM OrderItems;

41. -- Порахувати кількість замовлень для кожного customer_id у таблиці Orders
    SELECT customer_id, COUNT(*) FROM Orders GROUP BY customer_id;

42. -- Порахувати кількість замовлень для кожного customer_id у таблиці Orders, де кількість замовлень більше 5
    SELECT customer_id, COUNT(*) FROM Orders GROUP BY customer_id HAVING COUNT(*) > 5;

43. -- Порахувати кількість записів для кожного product_id у таблиці OrderItems
    SELECT product_id, COUNT(*) FROM OrderItems GROUP BY product_id;

44. -- Порахувати суму quantity для кожного product_id у таблиці OrderItems
    SELECT product_id, SUM(quantity) FROM OrderItems GROUP BY product_id;

45. -- Порахувати середнє значення price для кожного product_id у таблиці OrderItems
    SELECT product_id, AVG(price) FROM OrderItems GROUP BY product_id;

46. -- Порахувати максимальне значення price для кожного product_id у таблиці OrderItems
    SELECT product_id, MAX(price) FROM OrderItems GROUP BY product_id;

47. -- Порахувати мінімальне значення price для кожного product_id у таблиці OrderItems
    SELECT product_id, MIN(price) FROM OrderItems GROUP BY product_id;

48. -- Вибрати всі колонки з таблиці Customers, впорядковані за зростанням прізвища
    SELECT * FROM Customers ORDER BY last_name ASC;

49. -- Вибрати всі колонки з таблиці Customers, впорядковані за спаданням прізвища
    SELECT * FROM Customers ORDER BY last_name DESC;

50. -- Вибрати всі колонки з таблиці Orders, впорядковані за зростанням customer_id і спаданням дати замовлення
    SELECT * FROM Orders ORDER BY customer_id ASC, order_date DESC;

51. -- Вибрати всі колонки з таблиці Products, впорядковані за зростанням ціни
    SELECT * FROM Products ORDER BY price ASC;

52. -- Вибрати всі колонки з таблиці Products, впорядковані за спаданням ціни
    SELECT * FROM Products ORDER BY price DESC;

53. -- Вибрати всі колонки з таблиці Orders, впорядковані за зростанням total_amount
    SELECT * FROM Orders ORDER BY total_amount ASC;

54. -- Вибрати всі колонки з таблиці Orders, впорядковані за спаданням total_amount
    SELECT * FROM Orders ORDER BY total_amount DESC;

55. -- Вибрати всі колонки з таблиці OrderItems, впорядковані за зростанням quantity
    SELECT * FROM OrderItems ORDER BY quantity ASC;

56. -- Вибрати всі колонки з таблиці OrderItems, впорядковані за спаданням quantity
    SELECT * FROM OrderItems ORDER BY quantity DESC;

57. -- Додати нового клієнта Іван Карєв у таблицю Customers
    INSERT INTO Customers (first_name, last_name, email) VALUES ('Іван', 'Карєв', 'ivan.karev@example.com');

58. -- Додати нового клієнта Петро Іванов у таблицю Customers
    INSERT INTO Customers (first_name, last_name, email) VALUES ('Петро', 'Іванов', 'petro.ivanov@example.com');

59. -- Додати нового клієнта Олена Петрівна у таблицю Customers
    INSERT INTO Customers (first_name, last_name, email) VALUES ('Олена', 'Петрівна', 'olena.petrivna@example.com');

60. -- Додати нове замовлення для клієнта з customer_id = 1000 у таблицю Orders
    INSERT INTO Orders (customer_id, order_date, total_amount) VALUES (1000, '2023-06-15', 150.00);

61. -- Оновити email клієнта з customer_id = 1000
    UPDATE Customers SET email = 'ivan.karev@newdomain.com' WHERE customer_id = 1000;

62. -- Оновити email клієнта з customer_id = 1001
    UPDATE Customers SET email = 'petro.ivanov@newdomain.com' WHERE customer_id = 1001;

63. -- Оновити email клієнта з customer_id = 1002
    UPDATE Customers SET email = 'olena.petrivna@newdomain.com' WHERE customer_id = 1002;

64. -- Видалити клієнта з customer_id = 1001
    DELETE FROM Customers WHERE customer_id = 1001;

65. -- Видалити клієнта з customer_id = 1002
    DELETE FROM Customers WHERE customer_id = 1002;

66. -- Вибрати всі колонки з таблиці Orders, де дата замовлення знаходиться між '2023-01-01' і '2023-12-31'
    SELECT * FROM Orders WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31';

67. -- Вибрати всі колонки з таблиці Orders, де order_date дорівнює сьогоднішній даті
    SELECT * FROM Orders WHERE order_date = CURRENT_DATE;

68. -- Вибрати всі колонки з таблиці Orders, де дата замовлення більше поточної дати та часу
    SELECT * FROM Orders WHERE order_date > NOW();

69. -- Вибрати всі колонки з таблиці Orders, де total_amount більше 500
    SELECT * FROM Orders WHERE total_amount > 500;

70. -- Вибрати всі колонки з таблиці Customers, де email не є NULL
    SELECT * FROM Customers WHERE email IS NOT NULL;

71. -- Вибрати всі колонки з таблиці Products, де stock_quantity дорівнює 0
    SELECT * FROM Products WHERE stock_quantity = 0;

72. -- Вибрати всі колонки з таблиці Orders, де дата замовлення більше або дорівнює '2023-01-01'
    SELECT * FROM Orders WHERE order_date >= '2023-01-01';

73. -- Вибрати всі колонки з таблиці OrderItems, де price більше 100
    SELECT * FROM OrderItems WHERE price > 100;

74. -- Вибрати всі колонки з таблиці Orders, де customer_id не входить до підзапиту з таблиці Customers
    SELECT * FROM Orders WHERE customer_id NOT IN (SELECT customer_id FROM Customers);

75. -- Вибрати product_name та price з таблиці Products, де description є NULL
    SELECT product_name, price FROM Products WHERE description IS NULL;

76. -- Вибрати first_name та last_name з таблиці Customers, де email містить 'example.com'
    SELECT first_name, last_name FROM Customers WHERE email LIKE '%example.com';

77. -- Порахувати середнє значення quantity у таблиці OrderItems, де price більше 50
    SELECT AVG(quantity) FROM OrderItems WHERE price > 50;

78. -- Порахувати суму значень total_amount у таблиці Orders, де дата замовлення більше '2023-06-01'
    SELECT SUM(total_amount) FROM Orders WHERE order_date > '2023-06-01';

79. -- Порахувати максимальне значення price у таблиці Products, де stock_quantity більше 50
    SELECT MAX(price) FROM Products WHERE stock_quantity > 50;

80. -- Порахувати мінімальне значення price у таблиці Products, де stock_quantity менше 50
    SELECT MIN(price) FROM Products WHERE stock_quantity < 50;

81. -- Порахувати кількість унікальних customer_id у таблиці Orders
    SELECT COUNT(DISTINCT customer_id) FROM Orders;

82. -- Додати нового клієнта Марія Коваль у таблицю Customers
    INSERT INTO Customers (first_name, last_name, email) VALUES ('Марія', 'Коваль', 'maria.koval@example.com');

83. -- Додати новий продукт у таблицю Products
    INSERT INTO Products (product_name, description, price, stock_quantity) VALUES ('New Product', 'Description', 150.00, 100);

84. -- Оновити total_amount на 50 для замовлення з order_id = 100
    UPDATE Orders SET total_amount = total_amount + 50 WHERE order_id = 100;

85. -- Оновити stock_quantity на 1 менше для продукту з product_id = 10
    UPDATE Products SET stock_quantity = stock_quantity - 1 WHERE product_id = 10;

86. -- Видалити замовлення з таблиці Orders, де дата замовлення менше '2023-01-01'
    DELETE FROM Orders WHERE order_date < '2023-01-01';

87. -- Перетворити last_name у верхній регістр у таблиці Customers
    SELECT UPPER(last_name) FROM Customers;

88. -- Перетворити email у нижній регістр у таблиці Customers
    SELECT LOWER(email) FROM Customers;

89. -- Вибрати довжину product_name у таблиці Products
    SELECT LENGTH(product_name) FROM Products;

90. -- Видалити пробіли з обох сторін product_name у таблиці Products
    SELECT TRIM(BOTH ' ' FROM product_name) FROM Products;

91. -- Замінити '@example.com' на '@newdomain.com' у таблиці Customers
    SELECT REPLACE(email, '@example.com', '@newdomain.com') FROM Customers;

92. -- Вибрати всі колонки з таблиці Customers, де first_name дорівнює 'Іван'
    SELECT * FROM Customers WHERE first_name = 'Іван';

93. -- Порахувати кількість записів у таблиці Products, де price більше 20
    SELECT COUNT(*) FROM Products WHERE price > 20;

94. -- Вибрати всі колонки з таблиці Orders, впорядковані за зростанням дати замовлення
    SELECT * FROM Orders ORDER BY order_date ASC;

95. -- Вибрати всі колонки з таблиці OrderItems, де quantity більше 2
    SELECT * FROM OrderItems WHERE quantity > 2;
96. -- Видалити пробіли з обох сторін product_name у таблиці Products
    SELECT TRIM(BOTH ' ' FROM product_name) FROM Products;

97. -- Замінити '@example.com' на '@newdomain.com' у таблиці Customers
    SELECT REPLACE(email, '@example.com', '@newdomain.com') FROM Customers;

98. -- Вибрати всі колонки з таблиці Customers, де first_name дорівнює 'Іван'
    SELECT * FROM Customers WHERE first_name = 'Іван';

99. -- Порахувати кількість записів у таблиці Products, де price більше 20
    SELECT COUNT(*) FROM Products WHERE price > 20;

100. -- Вибрати всі колонки з таблиці Orders, впорядковані за зростанням дати замовлення
     SELECT * FROM Orders ORDER BY order_date ASC;