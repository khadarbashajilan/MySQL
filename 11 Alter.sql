-- Active: 1767420256706@@127.0.0.1@3306@crud
CREATE TABLE EMP(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(50),
    SALARY INT,
    AGE INT
)

INSERT INTO EMP(NAME, SALARY, AGE)
VALUES ("JOHN", 25000, 25), ("JAKE", 52000, 30)

SELECT * FROM emp

-- ALTER statement is used to modify the structure of an existing table
-- It can be used to add, modify, or drop columns, as well as to add or drop constraints

ALTER TABLE emp
ADD NEW_COL INT;
-- In this case, the ALTER statement is used to add a new column named NEW_COL to the 'EMP' table
-- NEW_COL is an integer

SELECT * FROM emp

ALTER TABLE emp
MODIFY NEW_COL VARCHAR(50);
-- This modifies the data type of the NEW_COL column in the 'EMP' table
-- NEW_COL is changed from an integer to a string with a maximum length of 50 characters


ALTER TABLE emp
RENAME COLUMN NEW_COL TO RENAMED_COL;
-- This renames the NEW_COL column in the 'EMP' table to RENAMED_COL


ALTER TABLE emp
DROP COLUMN RENAMED_COL;
-- This drops the RENAMED_COL column from the 'EMP' table

SELECT * FROM emp