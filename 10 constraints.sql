-- Active: 1767420256706@@127.0.0.1@3306@crud

CREATE TABLE EMP(
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(50),
    EMAIL VARCHAR(50) UNIQUE
)

-- UNIQUE constraint ensures that all values in a column are different
-- It prevents duplicate values from being entered into the column
-- In this case, the EMAIL column must have unique values

INSERT INTO EMP(NAME, EMAIL)
VALUES("KHABIB","KHABIB@MAIL.COM"),
("ISLAM","ISLAM@MAIL.COM"),
("ZABIT", "ZABIT@MAIL.COM"),
("USMAN", "ISLAM@MAIL.COM")

-- ERROR EXPLANATION:
-- The fourth INSERT statement will fail because the EMAIL "ISLAM@MAIL.COM" is already in the table
-- This is due to the UNIQUE constraint on the EMAIL column

DROP TABLE EMP

CREATE TABLE EMP(
    NAME VARCHAR(50), 
    AGE INT CHECK (AGE  BETWEEN 18 AND 50 ),
    SALARY DECIMAL(10,2) CHECK (SALARY > 20000.00 AND SALARY < 40000.00)
)

-- CHECK constraint ensures that all values in a column satisfy a specific condition
-- It prevents invalid data from being entered into the column
-- In this case, the AGE column must be between 18 and 50, and the SALARY column must be between 20000.00 and 40000.00

INSERT INTO EMP(NAME, AGE, SALARY)
VALUES("ZABIT", 19, 30000.00),("MAX", 20, 35000.00)
-- This inserts 2 rows of data into the 'EMP' table
-- Both rows satisfy the CHECK constraints

INSERT INTO emp(NAME, AGE, SALARY)
VALUES("JOHN", 18, 30000.00), ("BROCK", 17, 30000.00)
-- ERROR EXPLANATION:
-- The first INSERT statement will fail because the AGE 18 is not greater than 18
-- The second INSERT statement will fail because the AGE 17 is not greater than 18
-- Both statements fail due to the CHECK constraint on the AGE column

INSERT INTO emp(NAME, AGE, SALARY)
VALUES("JOHN", 25, 40000.00), ("BROCK", 20, 20000.00)
-- ERROR EXPLANATION:
-- The first INSERT statement will fail because the SALARY 40000.00 is not less than 40000.00
-- The second INSERT statement will fail because the SALARY 20000.00 is not greater than 20000.00
-- Both statements fail due to the CHECK constraint on the SALARY column

SELECT * FROM EMP

DROP TABLE emp


-- NAMED CONSTRAINTS CHECK:
-- Named constraints are constraints that are given a name
-- They can be used to identify and manage constraints in a database
-- In this case, the CHECK constraints are given names CHK_AGE and CHK_SALARY


CREATE TABLE EMP(
    NAME VARCHAR(50), 
    AGE INT ,
    SALARY DECIMAL(10,2),
    CONSTRAINT CHK_AGE CHECK(AGE > 18 AND AGE < 50 ),
    CONSTRAINT CHK_SALARY CHECK(SALARY > 20000.00 AND SALARY < 40000.00)
)

SELECT * FROM EMP

INSERT INTO EMP(NAME, AGE, SALARY)
VALUES("ZABIT", 19, 30000.00),("MAX", 20, 35000.00)
-- This inserts 2 rows of data into the 'EMP' table
-- Both rows satisfy the named CHECK constraints


INSERT INTO emp(NAME, AGE, SALARY)
VALUES("JOHN", 18, 30000.00), ("BROCK", 17, 30000.00)
-- ERROR EXPLANATION:
-- The first INSERT statement will fail because the AGE 18 is not greater than 18
-- The second INSERT statement will fail because the AGE 17 is not greater than 18
-- Both statements fail due to the named CHECK constraint CHK_AGE on the AGE column


INSERT INTO emp(NAME, AGE, SALARY)
VALUES("JOHN", 25, 40000.00), ("BROCK", 22, 20000.00)
-- ERROR EXPLANATION:
-- The first INSERT statement will fail because the SALARY 40000.00 is not less than 40000.00
-- The second INSERT statement will fail because the SALARY 20000.00 is not greater than 20000.00
-- Both statements fail due to the named CHECK constraint CHK_SALARY on the SALARY column