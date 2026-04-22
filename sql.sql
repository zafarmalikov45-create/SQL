create database homework;
use homework;
CREATE TABLE devices (brand VARCHAR(50), model VARCHAR(50), cpu VARCHAR(50), frequency REAL, ram INT, os VARCHAR(50), price INT);
show tables;
+--------------------+
| Tables_in_homework |
+--------------------+
| devices            |
+--------------------+
INSERT INTO devices (brand, model, cpu, frequency, ram, os, price) VALUES
 ('HP', 'Pavilion', 'Intel i5', 2.5, 8, 'Windows', 700),
('HP', 'Envy', 'Intel i5', 2.7, 16, 'Windows', 900),
    
('Dell', 'Inspiron', 'Intel i7', 3.0, 16, 'Windows', 1000),
     ('Dell', 'XPS', 'Intel i7', 3.2, 32, 'Windows', 1500),
    
     ('Lenovo', 'IdeaPad', 'Ryzen 5', 2.6, 8, 'Windows', 650),
     ('Lenovo', 'ThinkPad', 'Ryzen 5', 2.8, 16, 'Windows', 850),
    
     ('Asus', 'VivoBook', 'Intel i3', 2.1, 8, 'Windows', 500),
     ('Asus', 'ZenBook', 'Intel i3', 2.3, 16, 'Windows', 750),
    
     ('Acer', 'Aspire', 'Ryzen 7', 3.0, 16, 'Windows', 900),
     ('Acer', 'Swift', 'Ryzen 7', 3.2, 32, 'Windows', 1200),
    
     ('Apple', 'MacBook Air', 'M1', 3.2, 8, 'macOS', 1000),
     ('Apple', 'MacBook Pro', 'M1', 3.4, 16, 'macOS', 1500),
    
     ('MSI', 'GF63', 'Intel i5', 2.5, 8, 'Windows', 800),
     ('MSI', 'Katana', 'Intel i5', 2.7, 16, 'Windows', 1100),
    
     ('Samsung', 'Galaxy Book', 'Intel i7', 3.1, 16, 'Windows', 1200),
     ('Samsung', 'Galaxy Book Pro', 'Intel i7', 3.3, 32, 'Windows', 1600),
    
     ('Huawei', 'MateBook D', 'Ryzen 5', 2.5, 8, 'Windows', 700),
     ('Huawei', 'MateBook X', 'Ryzen 5', 2.9, 16, 'Windows', 1000),
    
    ('Razer', 'Blade 15', 'Intel i7', 3.0, 16, 'Windows', 2000),
    ('Razer', 'Blade Stealth', 'Intel i7', 3.2, 16, 'Windows', 1800);

    select * from devices;
+---------+-----------------+----------+-----------+------+---------+-------+
| brand   | model           | cpu      | frequency | ram  | os      | price |
+---------+-----------------+----------+-----------+------+---------+-------+
| HP      | Pavilion        | Intel i5 |       2.5 |    8 | Windows |   700 |
| HP      | Envy            | Intel i5 |       2.7 |   16 | Windows |   900 |
| Dell    | Inspiron        | Intel i7 |         3 |   16 | Windows |  1000 |
| Dell    | XPS             | Intel i7 |       3.2 |   32 | Windows |  1500 |
| Lenovo  | IdeaPad         | Ryzen 5  |       2.6 |    8 | Windows |   650 |
| Lenovo  | ThinkPad        | Ryzen 5  |       2.8 |   16 | Windows |   850 |
| Asus    | VivoBook        | Intel i3 |       2.1 |    8 | Windows |   500 |
| Asus    | ZenBook         | Intel i3 |       2.3 |   16 | Windows |   750 |
| Acer    | Aspire          | Ryzen 7  |         3 |   16 | Windows |   900 |
| Acer    | Swift           | Ryzen 7  |       3.2 |   32 | Windows |  1200 |
| Apple   | MacBook Air     | M1       |       3.2 |    8 | macOS   |  1000 |
| Apple   | MacBook Pro     | M1       |       3.4 |   16 | macOS   |  1500 |
| MSI     | GF63            | Intel i5 |       2.5 |    8 | Windows |   800 |
| MSI     | Katana          | Intel i5 |       2.7 |   16 | Windows |  1100 |
| Samsung | Galaxy Book     | Intel i7 |       3.1 |   16 | Windows |  1200 |
| Samsung | Galaxy Book Pro | Intel i7 |       3.3 |   32 | Windows |  1600 |
| Huawei  | MateBook D      | Ryzen 5  |       2.5 |    8 | Windows |   700 |
| Huawei  | MateBook X      | Ryzen 5  |       2.9 |   16 | Windows |  1000 |
| Razer   | Blade 15        | Intel i7 |         3 |   16 | Windows |  2000 |
| Razer   | Blade Stealth   | Intel i7 |       3.2 |   16 | Windows |  1800 |
+---------+-----------------+----------+-----------+------+---------+-------+

select * from devices order by price desc limit 1;
+-------+----------+----------+-----------+------+---------+-------+
| brand | model    | cpu      | frequency | ram  | os      | price |
+-------+----------+----------+-----------+------+---------+-------+
| Razer | Blade 15 | Intel i7 |         3 |   16 | Windows |  2000 |
+-------+----------+----------+-----------+------+---------+-------+


select * from devices order by price limit 1;
+-------+----------+----------+-----------+------+---------+-------+
| brand | model    | cpu      | frequency | ram  | os      | price |
+-------+----------+----------+-----------+------+---------+-------+
| Asus  | VivoBook | Intel i3 |       2.1 |    8 | Windows |   500 |
+-------+----------+----------+-----------+------+---------+-------+


select frequency from devices where price between 400 and 1000 and cpu like "%Intel%";
select frequency from devices where price between 400 and 1000 and cpu like "%Intel%";
+-----------+
| frequency |
+-----------+
|       2.5 |
|       2.7 |
|         3 |
|       2.1 |
|       2.3 |
|       2.5 |
+-----------+



select count(*) from devices where brand = "apple";
+----------+
| count(*) |
+----------+
|        2 |
+----------+




select * from devices where os= "Windows" and ram>8 and brand = "Asus" order by price;
+-------+---------+----------+-----------+------+---------+-------+
| brand | model   | cpu      | frequency | ram  | os      | price |
+-------+---------+----------+-----------+------+---------+-------+
| Asus  | ZenBook | Intel i3 |       2.3 |   16 | Windows |   750 |