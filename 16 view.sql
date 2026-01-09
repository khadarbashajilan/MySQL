-- Active: 1767420256706@@127.0.0.1@3306@crud

CREATE TABLE PERSON(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME VARCHAR(50) NOT NULL,
    LAST_NAME VARCHAR(50) NOT NULL,
    AGE INT
);

INSERT INTO person(`FIRST_NAME`, `LAST_NAME`, `AGE`)
VALUES("SUPER", "MAN", 28),
("SPIDER", "MAN", 26),
("BAT", "MAN", 29);

SELECT * FROM person


-- VIEW: A virtual table based on the result-set of a SQL statement
-- Views are used to simplify complex SQL queries and provide a level of security

-- CREATE VIEW: Create a view that combines first and last names
CREATE VIEW FULL_NAME AS
SELECT CONCAT(`FIRST_NAME` ,LAST_NAME) AS FULL_NAME FROM person;


-- EXECUTE A VIEW: Query the view to see the results
SELECT * FROM full_name


-- UPDATE VIEW: To modify a view, you need to drop it and recreate it
-- First, drop the existing viewALTER VIEW FULL_NAME AS
SELECT CONCAT(`FIRST_NAME` ,LAST_NAME) AS FULL_NAME FROM person
WHERE FIRST_NAME="BAT";


-- DELETE VIEW: Remove the view when it's no longer needed
DROP VIEW FULL_NAME