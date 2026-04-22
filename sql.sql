CREATE DATABASE shop_db;
Query OK, 1 row affected (0.16 sec)

mysql> USE shop_db;
Database changed
mysql> CREATE TABLE sales (
    ->     id INT PRIMARY KEY,
    ->     product_name VARCHAR(50),
    ->     category VARCHAR(50),
    ->     price INT,
    ->     quantity INT,
    ->     sale_date DATE
    -> );
Query OK, 0 rows affected (0.25 sec)

mysql> INSERT INTO sales VALUES (1, 'Laptop', 'Electronics', 800, 2, '2025-01-01');
Query OK, 1 row affected (0.07 sec)

mysql> INSERT INTO sales VALUES (2, 'Phone', 'Electronics', 600, 3, '2025-01-01');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO sales VALUES (3, 'TV', 'Electronics', 900, 1, '2025-01-02');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO sales VALUES (4, 'Headphones', 'Electronics', 150, 5, '2025-01-03');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO sales VALUES (5, 'Table', 'Furniture', 300, 1, '2025-01-01');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO sales VALUES (6, 'Chair', 'Furniture', 100, 4, '2025-01-02');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO sales VALUES (7, 'Sofa', 'Furniture', 1200, 1, '2025-01-03');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO sales VALUES (8, 'Bed', 'Furniture', 900, 1, '2025-01-04');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO sales VALUES (9, 'T-shirt', 'Clothing', 40, 6, '2025-01-01');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO sales VALUES (10, 'Jeans', 'Clothing', 70, 3, '2025-01-02');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO sales VALUES (11, 'Jacket', 'Clothing', 120, 2, '2025-01-03');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO sales VALUES (12, 'Shoes', 'Clothing', 90, 4, '2025-01-04');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO sales VALUES (13, 'Apple', 'Food', 2, 20, '2025-01-01');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO sales VALUES (14, 'Bread', 'Food', 3, 15, '2025-01-02');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO sales VALUES (15, 'Milk', 'Food', 4, 10, '2025-01-03');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO sales VALUES (16, 'Cheese', 'Food', 8, 5, '2025-01-04');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO sales VALUES (17, 'Notebook', 'Stationery', 5, 10, '2025-01-01');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO sales VALUES (18, 'Pen', 'Stationery', 2, 25, '2025-01-02');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO sales VALUES (19, 'Marker', 'Stationery', 4, 12, '2025-01-03');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO sales VALUES (20, 'Folder', 'Stationery', 6, 8, '2025-01-04');
Query OK, 1 row affected (0.05 sec)

mysql> SELECT category, SUM(quantity) AS total_products_sold
    -> FROM sales
    -> GROUP BY category;
+-------------+---------------------+
| category    | total_products_sold |
+-------------+---------------------+
| Electronics |                  11 |
| Furniture   |                   7 |
| Clothing    |                  15 |
| Food        |                  50 |
| Stationery  |                  55 |
+-------------+---------------------+
5 rows in set (0.08 sec)

mysql> SELECT category, SUM(price * quantity) AS total_sales_amount
    -> FROM sales
    -> GROUP BY category;
+-------------+--------------------+
| category    | total_sales_amount |
+-------------+--------------------+
| Electronics |               5050 |
| Furniture   |               2800 |
| Clothing    |               1050 |
| Food        |                165 |
| Stationery  |                196 |
+-------------+--------------------+
5 rows in set (0.10 sec)

mysql> SELECT category, AVG(price) AS average_price
    -> FROM sales
    -> GROUP BY category;
+-------------+---------------+
| category    | average_price |
+-------------+---------------+
| Electronics |      612.5000 |
| Furniture   |      625.0000 |
| Clothing    |       80.0000 |
| Food        |        4.2500 |
| Stationery  |        4.2500 |
+-------------+---------------+
5 rows in set (0.01 sec)

mysql> SELECT sale_date, SUM(price * quantity) AS total_revenue
    -> FROM sales
    -> GROUP BY sale_date;
+------------+---------------+
| sale_date  | total_revenue |
+------------+---------------+
| 2025-01-01 |          4030 |
| 2025-01-02 |          1605 |
| 2025-01-03 |          2278 |
| 2025-01-04 |          1348 |
+------------+---------------+
4 rows in set (0.00 sec)

mysql>
mysql> SELECT SUM(price * quantity) AS electronics_revenue
    -> FROM sales
    -> WHERE category = 'Electronics';
+---------------------+
| electronics_revenue |
+---------------------+
|                5050 |
+---------------------+
1 row in set (0.02 sec)

mysql> SELECT category, SUM(price * quantity) AS total_sales_amount
    -> FROM sales
    -> GROUP BY category
    -> HAVING SUM(price * quantity) > 2000;
+-------------+--------------------+
| category    | total_sales_amount |
+-------------+--------------------+
| Electronics |               5050 |
| Furniture   |               2800 |
+-------------+--------------------+
2 rows in set (0.01 sec)

mysql> SELECT category, AVG(price) AS average_price
    -> FROM sales
    -> GROUP BY category
    -> HAVING AVG(price) > 100;
+-------------+---------------+
| category    | average_price |
+-------------+---------------+
| Electronics |      612.5000 |
| Furniture   |      625.0000 |
+-------------+---------------+
2 rows in set (0.01 sec)

mysql> SELECT SUM(quantity) AS total_products_sold
    -> FROM sales
    -> WHERE sale_date = '2025-01-01';
+---------------------+
| total_products_sold |
+---------------------+
|                  42 |
+---------------------+
1 row in set (0.02 sec)

mysql> SELECT category, SUM(quantity) AS total_quantity
    -> FROM sales
    -> GROUP BY category
    -> ORDER BY total_quantity DESC
    -> LIMIT 1;
+------------+----------------+
| category   | total_quantity |
+------------+----------------+
| Stationery |             55 |
+------------+----------------+
1 row in set (0.01 sec)

mysql> SELECT category, SUM(price * quantity) AS total_revenue
    -> FROM sales
    -> WHERE quantity > 3
    -> GROUP BY category;
+-------------+---------------+
| category    | total_revenue |
+-------------+---------------+
| Electronics |           750 |
| Furniture   |           400 |
| Clothing    |           600 |
| Food        |           165 |
| Stationery  |           196 |
+-------------+---------------+