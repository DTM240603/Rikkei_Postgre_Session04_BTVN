CREATE SCHEMA academic

CREATE TABLE academic.students(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    major VARCHAR(50),
    gpa NUMERIC(3,2)
);

INSERT INTO academic.students(name, age, major, gpa)
VALUES('An', 20, 'CNTT', 3.5),
      ('Bình', 21, 'Toán', 3.2),
      ('Cường', 22, 'CNTT', 3.8),
      ('Dương', 20, 'Vật lý', 3.0),
      ('Em', 21, 'CNTT', 2.9);

SELECT * FROM academic.students;

-- 1. Thêm sinh viên mới: "Hùng", 23 tuổi, chuyên ngành "Hóa học", GPA 3.4
INSERT INTO academic.students(name, age, major, gpa)
VALUES('Hùng', 23, 'Hóa học', 3.4);

-- 2. Cập nhật GPA của sinh viên "Bình" thành 3.6
UPDATE academic.students
SET gpa = 3.6
WHERE name = 'Bình';

-- 3. Xóa sinh viên có GPA thấp hơn 3.0
DELETE FROM academic.students
WHERE gpa < 3;

-- 4. Liệt kê tất cả sinh viên, chỉ hiển thị tên và chuyên ngành, sắp xếp theo GPA giảm dần
SELECT s.name, s.major
FROM academic.students AS s
ORDER BY s.gpa DESC;

-- 5. Liệt kê tên sinh viên đầu tiên tìm thấy có chuyên ngành "CNTT"
SELECT s.name, s.age, s.major, s.gpa
FROM academic.students AS s
WHERE s.major LIKE 'CNTT'
ORDER BY s.id ASC
LIMIT 1;

-- 6. Liệt kê sinh viên có GPA từ 3.0 đến 3.6
SELECT s.name, s.age, s.major, s.gpa
FROM academic.students AS s
WHERE s.gpa BETWEEN 3 AND 3.6;

-- 7. Liệt kê sinh viên có tên bắt đầu bằng chữ 'C' (sử dụng LIKE/ILIKE)
SELECT s.name, s.age, s.major, s.gpa
FROM academic.students AS s
WHERE s.name LIKE 'C%';

-- 8. Hiển thị 3 sinh viên đầu tiên theo thứ tự tên tăng dần, hoặc lấy từ sinh viên thứ 2 đến thứ 4 bằng LIMIT và OFFSET
SELECT s.name, s.age, s.major, s.gpa
FROM academic.students AS s
ORDER BY s.name ASC
LIMIT 3 OFFSET 1;
