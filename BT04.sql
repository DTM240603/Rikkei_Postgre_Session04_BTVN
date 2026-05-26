CREATE SCHEMA bt04;

CREATE TABLE bt04.products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    category VARCHAR(50),
    price INT,
    stock INT,
    manufacturer VARCHAR(50)
);

INSERT INTO bt04.products(name, category, price, stock, manufacturer)
VALUES  ('Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
        ('Chuột Logitech M90', 'Phụ kiện', 150000, 50, 'Logitech'),
        ('Bàn phím cơ Razer', 'Phụ kiện', 2200000, 0, 'Razer'),
        ('Macbook Air M2', 'Laptop', 32000000, 7, 'Apple'),
        ('iPhone 14 Pro Max', 'Điện thoại', 35000000, 15, 'Apple'),
        ('Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
        ('Tai nghe AirPods 3', 'Phụ kiện', 4500000, Null, 'Apple');

SELECT p.name, p.category, p.price, p.stock, p.manufacturer
FROM bt04.products AS p;

-- 1. Thêm sản phẩm “Chuột không dây Logitech M170”, loại Phụ kiện, giá 300000, tồn kho 20, hãng Logitech
INSERT INTO bt04.products(name, category, price, stock, manufacturer)
VALUES  ('Chuột không dây Logitech M170', 'Phụ kiện', 300000, 20, 'Logitech');

-- 2. Tăng giá tất cả sản phẩm của Apple thêm 10%
UPDATE bt04.products
SET price = price * 1.10
WHERE manufacturer = 'Apple';

-- 3. Xóa sản phẩm có stock = 0
DELETE FROM bt04.products
WHERE stock = 0;

-- 4. Hiển thị sản phẩm có price BETWEEN 1000000 AND 30000000
SELECT p.name, p.category, p.price, p.stock, p.manufacturer
FROM bt04.products AS p
WHERE p.price BETWEEN 1000000 AND 30000000;

-- 5. Hiển thị sản phẩm có stock IS NULL
SELECT p.name, p.category, p.price, p.stock, p.manufacturer
FROM bt04.products AS p
WHERE p.stock IS NULL;

-- 6. Liệt kê danh sách hãng sản xuất duy nhất
SELECT DISTINCT p.manufacturer
FROM bt04.products AS p;

-- 7. Hiển thị toàn bộ sản phẩm, sắp xếp giảm dần theo giá, sau đó tăng dần theo tên
SELECT p.name, p.category, p.price, p.stock, p.manufacturer
FROM bt04.products AS p
ORDER BY p.price DESC, p.name ASC;

-- 8. Tìm sản phẩm có tên chứa từ “laptop” (không phân biệt hoa thường)
SELECT p.name, p.category, p.price, p.stock, p.manufacturer
FROM bt04.products AS p
WHERE p.name ILIKE '%laptop%';

-- 9. Lấy về 2 sản phẩm đầu tiên sau khi sắp xếp theo giá giảm dần .
SELECT p.name, p.category, p.price, p.stock, p.manufacturer
FROM bt04.products AS p
ORDER BY p.price DESC
LIMIT 2;



