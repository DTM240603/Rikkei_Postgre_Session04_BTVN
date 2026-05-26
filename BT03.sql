CREATE SCHEMA bt03;

CREATE TABLE bt03.students (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL ,
    gender VARCHAR(5) CHECK (gender IN ('Nam', 'Nữ')),
    birth_year INT CHECK(birth_year > 1900 AND birth_year <= EXTRACT(YEAR FROM(CURRENT_DATE))),
    major VARCHAR(50),
    gpa NUMERIC(3,2)
);

INSERT INTO bt03.students(full_name, gender, birth_year, major, gpa)
VALUES ('Nguyễn Văn A', 'Nam', 2002, 'CNTT', 3.6),
       ('Trần Thị Bích Ngọc','Nữ', 2001, 'Kinh tế',3.2),
       ('Lê Quốc Cường', 'Nam', 2003, 'CNTT', 2.7),
       ('Phạm Minh Anh', 'Nữ', 2000, 'Luật', 3.9),
       ('Nguyễn Văn A', 'Nam', 2002, 'CNTT', 3.6),
       ('Lưu Đức Tài', 'Nam', 2004, 'Cơ khí', Null),
       ('Võ Thị Thu Hằng', 'Nữ', 2001, 'CNTT', 3.0);

SELECT * FROM bt03.students;

-- 1. Thêm sinh viên “Phan Hoàng Nam”, giới tính Nam, sinh năm 2003, ngành CNTT, GPA 3.8
INSERT INTO bt03.students(full_name, gender, birth_year, major, gpa)
VALUES ('Phan Hoàng Nam', 'Nam', 2003, 'CNTT', 3.8);

-- 2. Sinh viên “Lê Quốc Cường” vừa cải thiện học lực, cập nhật gpa = 3.4
UPDATE bt03.students
SET gpa = 3.4
WHERE full_name = 'Lê Quốc Cường';

-- 3. Xóa tất cả sinh viên có gpa IS NULL
DELETE FROM bt03.students
WHERE gpa IS NULL;

-- 4. Hiển thị sinh viên ngành CNTT có gpa >= 3.0, chỉ lấy 3 kết quả đầu tiên
SELECT s.full_name, s.gender, s.birth_year, s.major, s.gpa
FROM bt03.students AS s
WHERE s.major ILIKE 'CNTT' AND s.gpa >= 3
ORDER BY s.id ASC
LIMIT 3;

-- 5. Liệt kê danh sách ngành học duy nhất
SELECT DISTINCT s.major
FROM bt03.students AS s;

-- 6. Hiển thị sinh viên ngành CNTT, sắp xếp giảm dần theo GPA, sau đó tăng dần theo tên
SELECT s.full_name, s.gender, s.birth_year, s.major, s.gpa
FROM bt03.students AS s
WHERE s.major ILIKE 'CNTT'
ORDER BY s.gpa DESC, s.full_name ASC;

-- 7. Tìm sinh viên có tên bắt đầu bằng “Nguyễn”
SELECT s.full_name, s.gender, s.birth_year, s.major, s.gpa
FROM bt03.students AS s
WHERE s.full_name ILIKE 'Nguyễn%';

-- 8. Hiển thị sinh viên có năm sinh từ 2001 đến 2003
SELECT s.full_name, s.gender, s.birth_year, s.major, s.gpa
FROM bt03.students AS s
WHERE s.birth_year BETWEEN 2001 AND 2003;
