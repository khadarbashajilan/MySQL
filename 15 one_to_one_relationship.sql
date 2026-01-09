-- Active: 1767420256706@@127.0.0.1@3306@crud

-- One-to-One Relationship Example:
-- This demonstrates a one-to-one relationship between PERSON and PERSON_DETAIL tables.
-- In a one-to-one relationship:
-- - One record in the first table (PERSON) is associated with exactly one record in the second table (PERSON_DETAIL).
-- - One record in the second table (PERSON_DETAIL) is associated with exactly one record in the first table (PERSON).

-- Create the PERSON table with a primary key
CREATE TABLE PERSON(
    PERSON_ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(50),
    AGE INT
);

-- Create the PERSON_DETAIL table with a primary key and a unique foreign key
-- The PERSON_ID column is marked as UNIQUE to enforce the one-to-one relationship
CREATE TABLE PERSON_DETAIL(
    DETAIL_ID INT PRIMARY KEY AUTO_INCREMENT,
    PERSON_ID INT UNIQUE,
    ADDRESS VARCHAR(100),
    PHONE VARCHAR(15),
    FOREIGN KEY (PERSON_ID) REFERENCES PERSON(PERSON_ID)
);

-- Insert sample data into the PERSON table
INSERT INTO PERSON(NAME, AGE)
VALUES ("John", 30), ("Jane", 25);

-- Insert sample data into the PERSON_DETAIL table
-- The PERSON_ID values must be unique to maintain the one-to-one relationship
INSERT INTO PERSON_DETAIL(PERSON_ID, ADDRESS, PHONE)
VALUES (1, "123 Main St", "555-1234"), (2, "456 Oak Ave", "555-5678");

-- This selects all rows from the 'PERSON' table
SELECT * FROM PERSON;

-- This selects all rows from the 'PERSON_DETAIL' table
SELECT * FROM PERSON_DETAIL;

-- This selects all columns from the 'PERSON' and 'PERSON_DETAIL' tables, joining them on the PERSON_ID column
-- The result set includes all columns from both tables, with rows from the 'PERSON' table joined to the corresponding row in the 'PERSON_DETAIL' table
SELECT * FROM PERSON
CROSS JOIN PERSON_DETAIL ON PERSON.PERSON_ID = PERSON_DETAIL.PERSON_ID;

-- This selects the NAME, ADDRESS, and PHONE columns from the 'PERSON' and 'PERSON_DETAIL' tables, joining them on the PERSON_ID column
-- The result set includes only the specified columns, with rows from the 'PERSON' table joined to the corresponding row in the 'PERSON_DETAIL' table
SELECT PERSON.NAME, PERSON_DETAIL.ADDRESS, PERSON_DETAIL.PHONE
FROM PERSON
JOIN PERSON_DETAIL ON PERSON.PERSON_ID = PERSON_DETAIL.PERSON_ID;

-- This selects the NAME and AGE from the 'PERSON' table and the ADDRESS and PHONE from the 'PERSON_DETAIL' table
-- The result set includes all columns from both tables, with rows from the 'PERSON' table joined to the corresponding row in the 'PERSON_DETAIL' table
SELECT PERSON.NAME, PERSON.AGE, PERSON_DETAIL.ADDRESS, PERSON_DETAIL.PHONE
FROM PERSON
LEFT JOIN PERSON_DETAIL ON PERSON.PERSON_ID = PERSON_DETAIL.PERSON_ID;