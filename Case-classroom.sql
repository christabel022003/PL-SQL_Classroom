--buatlah perintah DDL ALTER TABLE untuk membuat 2 buah CHECK (domain) constraint berikut (dengan penamaan sesuai standar Oracle)
--IN
ALTER TABLE CLASS_ASSESSMENTS
ADD CONSTRAINT CHK_LETTER_GRADE
CHECK (LETTER_GRADE IN ('A', 'B', 'C', 'D', 'E', 'F'))
--Regular expression
ALTER TABLE CLASS_ASSESSMENTS
ADD CONSTRAINT CHK_NUMERIC_GRADE
CHECK (REGEXP_LIKE(TO_CHAR(NUMERIC_GRADE), '^\d{1,3}(\.\d{1,2})?$'))
--Sequence
CREATE SEQUENCE seq_class_assessment_id
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;
--Explicit Index
CREATE INDEX idx_class_id ON CLASS_ASSESSMENTS (CLASS_ID);
--buatlah perintah DML INSERT untuk menguji constraint dan sequence 
INSERT INTO class_assessments (class_assessment_id, class_id, stu_id, assessment_id)
VALUES (seq_class_assessment_id.nextval, 2, 103, 1);
--Buatlah sebuah Simple View, dan buatlah skenario melakukan DML pada view tersebut untuk menunjukkan perbedaan tanpa dan dengan menggunakan WITH CHECK OPTION constraint pada view.
CREATE VIEW class_assessments_view AS
SELECT *
FROM class_assessments;
--Tanpa menggunakan WITH CHECK OPTION:
CREATE OR REPLACE VIEW class_assessments_view AS
SELECT *
FROM class_assessments
WHERE DATE_TURNED_IN IS NOT NULL;
--Dengan menggunakan WITH CHECK OPTION:
CREATE OR REPLACE VIEW class_assessments_view AS
SELECT *
FROM class_assessments
WHERE DATE_TURNED_IN IS NOT NULL
WITH CHECK OPTION;
--OUTER JOIN (LEFT JOIN)
SELECT s.first_name, s.last_name, COUNT(e.stu_id) AS total_enrollment
FROM students s
LEFT JOIN enrollments e ON s.stu_id = e.stu_id
GROUP BY s.first_name, s.last_name;
--SET OPERATOR (UNION)
SELECT first_name, last_name, COUNT(stu_id) AS total_enrollment
FROM students
GROUP BY first_name, last_name
UNION
SELECT NULL, NULL, COUNT(stu_id) AS total_enrollment
FROM enrollments
WHERE stu_id NOT IN (SELECT stu_id FROM students);
--Menampilkan student first dan last name yang tidak ada pasangan dengan enrollment
--subquery
SELECT first_name, last_name
FROM students
WHERE stu_id NOT IN (SELECT stu_id FROM enrollments);
--Set Operator (MINUS)
SELECT first_name, last_name
FROM students
MINUS
SELECT s.first_name, s.last_name
FROM students s
JOIN enrollments e ON s.stu_id = e.stu_id;