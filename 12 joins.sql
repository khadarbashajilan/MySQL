-- Active: 1767420256706@@127.0.0.1@3306@crud

CREATE TABLE ENGINEER(
    ENGINEER_ID INT AUTO_INCREMENT PRIMARY KEY,
    ENGINEER_NAME VARCHAR(50) NOT NULL,
    PROFESSION VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(50)
);

CREATE TABLE TASKS(
    TASK_ID INT AUTO_INCREMENT PRIMARY KEY,
    TASK_NAME VARCHAR(255),
    TASK_DESCRIPTION TEXT,
    ENGINEER_ID INT ,
    Foreign Key (ENGINEER_ID) REFERENCES ENGINEER(ENGINEER_ID)
);

INSERT INTO engineer (ENGINEER_NAME, PROFESSION, EMAIL)
VALUES
    ('ALICE JOHNSON', 'FULL STACK', 'A@GMAIL.COM'),
    ('BOB SMITH', 'BACKEND', 'B@GMAIL.COM'),
    ('CHARLIE BROWN', 'FRONTEND', 'C@GMAIL.COM'),
    ('EVE DAVIS', 'DATA SCIENTIST', 'E@GMAIL.COM');


INSERT INTO tasks (TASK_NAME, TASK_DESCRIPTION, ENGINEER_ID)
VALUES
    ('Website Redesign', 'Redesign the company website with modern UI/UX', 1),
    ('Database Optimization', 'Optimize the main database for better performance', 2),
    ('Bug Fixing', 'Fix critical bugs in the payment processing module', 1),
    ('Security Audit', 'Conduct security audit of all systems', 2),
    ('Performance Testing', 'Test system performance under high load', 3);
    

-- CROSS JOIN: Returns the Cartesian product of both tables (all possible combinations)

SELECT * FROM engineer E
CROSS JOIN tasks;
-- This will return all engineers with all tasks, regardless of the ENGINEER_ID match


SELECT * FROM engineer, tasks;
-- This is equivalent to CROSS JOIN - it returns all possible combinations of rows


-- INNER JOIN: Returns only matching rows from both tables based on the join condition

SELECT E.`ENGINEER_ID`, `E`.`ENGINEER_NAME`, `T`.`TASK_NAME`, T.`TASK_DESCRIPTION` FROM engineer E 
INNER JOIN tasks T ON E.ENGINEER_ID = T.`ENGINEER_ID`;
-- This will return only engineers who have tasks assigned to them

SELECT E.`ENGINEER_ID`, `E`.`ENGINEER_NAME`, `T`.`TASK_NAME`, T.`TASK_DESCRIPTION` FROM engineer E
JOIN tasks T ON E.`ENGINEER_ID` = T.ENGINEER_ID;
-- This is equivalent to INNER JOIN - it returns only matching rows

SELECT * FROM engineer E 
JOIN tasks T ON E.`ENGINEER_ID` = T.ENGINEER_ID;
-- This INNER JOIN returns all columns from both tables for matching rows

SELECT * FROM tasks T
JOIN engineer E ON E.`ENGINEER_ID` = T.ENGINEER_ID;
-- This INNER JOIN (order reversed) returns all columns from both tables for matching rows


-- LEFT JOIN: Returns all rows from the left table and matching rows from the right table

SELECT * FROM engineer E 
LEFT JOIN tasks T ON E.`ENGINEER_ID` = T.ENGINEER_ID;
-- This will return all engineers, including those without tasks



-- RIGHT JOIN: Returns all rows from the right table and matching rows from the left table


SELECT * FROM ENGINEER E
RIGHT JOIN tasks T ON E.`ENGINEER_ID` = T.`ENGINEER_ID`;
-- This will return all tasks, including those without assigned engineers

