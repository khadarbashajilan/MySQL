-- Active: 1767420256706@@127.0.0.1@3306@crud

-- Many-to-Many Relationship Example:
-- This demonstrates a many-to-many relationship between STUDENT and COURSE tables.
-- In a many-to-many relationship:
-- - Multiple records in the first table (STUDENT) can be associated with multiple records in the second table (COURSE).
-- - Multiple records in the second table (COURSE) can be associated with multiple records in the first table (STUDENT).

-- Create the STUDENT table with a primary key
CREATE TABLE STUDENT(
    STUDENT_ID INT PRIMARY KEY AUTO_INCREMENT,
    STUDENT_NAME VARCHAR(50),
    EMAIL VARCHAR(100)
);

-- Create the COURSE table with a primary key
CREATE TABLE COURSE(
    COURSE_ID INT PRIMARY KEY AUTO_INCREMENT,
    COURSE_NAME VARCHAR(50),
    CREDITS INT
);

-- Create a junction table to implement the many-to-many relationship
-- This table contains foreign keys to both STUDENT and COURSE tables
CREATE TABLE STUDENT_COURSE(
    ENROLLMENT_ID INT PRIMARY KEY AUTO_INCREMENT,
    STUDENT_ID INT,
    COURSE_ID INT,
    ENROLLMENT_DATE DATE,
    FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT(STUDENT_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES COURSE(COURSE_ID)
);

-- Insert sample data into the STUDENT table
INSERT INTO STUDENT(STUDENT_NAME, EMAIL)
VALUES ("Alice", "alice@example.com"),
       ("Bob", "bob@example.com"),
       ("Charlie", "charlie@example.com");

-- Insert sample data into the COURSE table
INSERT INTO COURSE(COURSE_NAME, CREDITS)
VALUES ("Mathematics", 4),
       ("Physics", 3),
       ("Computer Science", 4),
       ("Literature", 3);

-- Insert sample data into the STUDENT_COURSE junction table
-- This creates the many-to-many relationship between students and courses
INSERT INTO STUDENT_COURSE(STUDENT_ID, COURSE_ID, ENROLLMENT_DATE)
VALUES (1, 1, '2023-09-01'),  -- Alice enrolls in Mathematics
       (1, 2, '2023-09-01'),  -- Alice enrolls in Physics
       (2, 1, '2023-09-02'),  -- Bob enrolls in Mathematics
       (2, 3, '2023-09-02'),  -- Bob enrolls in Computer Science
       (3, 2, '2023-09-03'),  -- Charlie enrolls in Physics
       (3, 4, '2023-09-03');  -- Charlie enrolls in Literature

-- This selects all rows from the 'STUDENT' table
SELECT * FROM STUDENT;

-- This selects all rows from the 'COURSE' table
SELECT * FROM COURSE;

-- This selects all rows from the 'STUDENT_COURSE' junction table
SELECT * FROM STUDENT_COURSE;

-- This selects student names and course names from the related tables
-- The result set shows which students are enrolled in which courses
SELECT STUDENT.STUDENT_NAME, COURSE.COURSE_NAME
FROM STUDENT
JOIN STUDENT_COURSE ON STUDENT.STUDENT_ID = STUDENT_COURSE.STUDENT_ID
JOIN COURSE ON STUDENT_COURSE.COURSE_ID = COURSE.COURSE_ID;

-- This selects course names and counts the number of students enrolled in each course
-- The result set shows course popularity
SELECT COURSE.COURSE_NAME, COUNT(STUDENT_COURSE.STUDENT_ID) AS STUDENT_COUNT
FROM COURSE
LEFT JOIN STUDENT_COURSE ON COURSE.COURSE_ID = STUDENT_COURSE.COURSE_ID
GROUP BY COURSE.COURSE_NAME;

-- This selects student names and counts the number of courses each student is enrolled in
-- The result set shows student activity
SELECT STUDENT.STUDENT_NAME, COUNT(STUDENT_COURSE.COURSE_ID) AS COURSE_COUNT
FROM STUDENT
LEFT JOIN STUDENT_COURSE ON STUDENT.STUDENT_ID = STUDENT_COURSE.STUDENT_ID
GROUP BY STUDENT.STUDENT_NAME;