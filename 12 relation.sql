-- Active: 1767420256706@@127.0.0.1@3306@crud
CREATE TABLE DEPARTMENT(
    DEPT_ID INT PRIMARY KEY AUTO_INCREMENT,
    DEPT_NAME VARCHAR(50),
    LOCATION VARCHAR(50)
);

CREATE TABLE EMPLOYEE(
    EMP_ID INT PRIMARY KEY AUTO_INCREMENT,
    EMP_NAME VARCHAR(50),
    DEPT_ID INT,
    SALARY INT,
    FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID)
);

INSERT INTO DEPARTMENT(DEPT_NAME, LOCATION)
VALUES ("HR", "New York"), ("IT", "San Francisco"), ("Finance", "Chicago");

-- The DEPT_ID column is a foreign key that references the DEPT_ID column in the 'DEPARTMENT' table
INSERT INTO EMPLOYEE(EMP_NAME, DEPT_ID, SALARY)
VALUES ("John", 1, 50000), ("Jane", 2, 60000), ("Jim", 3, 70000), ("Jill", 1, 55000), ("Jack", 2, 65000);

-- This selects all rows from the 'DEPARTMENT' table
SELECT * FROM DEPARTMENT;

-- This selects all rows from the 'EMPLOYEE' table
SELECT * FROM EMPLOYEE;

-- This selects all columns from the 'EMPLOYEE' and 'DEPARTMENT' tables, joining them on the DEPT_ID column
-- The result set includes all columns from both tables, with rows from the 'EMPLOYEE' table joined to the corresponding row in the 'DEPARTMENT' table
SELECT * FROM EMPLOYEE
JOIN DEPARTMENT ON EMPLOYEE.DEPT_ID = DEPARTMENT.DEPT_ID;

-- This selects the EMP_NAME, DEPT_NAME, and SALARY columns from the 'EMPLOYEE' and 'DEPARTMENT' tables, joining them on the DEPT_ID column
-- The result set includes only the specified columns, with rows from the 'EMPLOYEE' table joined to the corresponding row in the 'DEPARTMENT' table
SELECT EMPLOYEE.EMP_NAME, DEPARTMENT.DEPT_NAME, EMPLOYEE.SALARY
FROM EMPLOYEE
JOIN DEPARTMENT ON EMPLOYEE.DEPT_ID = DEPARTMENT.DEPT_ID;

-- This selects the DEPT_NAME and the average SALARY for each department from the 'EMPLOYEE' and 'DEPARTMENT' tables, joining them on the DEPT_ID column and grouping the results by DEPT_NAME
-- The result set includes the DEPT_NAME and the average SALARY for each department
SELECT DEPARTMENT.DEPT_NAME, AVG(EMPLOYEE.SALARY) AS AVG_SALARY
FROM EMPLOYEE
JOIN DEPARTMENT ON EMPLOYEE.DEPT_ID = DEPARTMENT.DEPT_ID
GROUP BY DEPARTMENT.DEPT_NAME;
