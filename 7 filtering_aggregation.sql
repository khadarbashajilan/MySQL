-- Active: 1767420256706@@127.0.0.1@3306@crud
SELECT DATABASE()

CREATE Table Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    age INT
)

-- INSERT statement with 16 unique UFC fighters
INSERT INTO users(first_name, last_name, email, age)
VALUES
    ("Khabib", "Nurmagomedov", "khabib@ufc.com", 32),
    ("Islam", "Makhachev", "makhachev@ufc.com", 27),
    ("Jon", "Jones", "jon@ufc.com", 35),
    ("Alexander", "Volkanovski", "volk@ufc.com", 32),
    ("Charles", "Oliveira", "charles@ufc.com", 33),
    ("Georges", "St-Pierre", "gsp@ufc.com", 38),
    ("Israel", "Adesanya", "israel@ufc.com", 32),
    ("Leon", "Edwards", "edwards@ufc.com", 28),
    ("Kamaru", "Usman", "usman@ufc.com", 34),
    ("Amanda", "Nunes", "nunes@ufc.com", 34),
    ("Rose", "Namajunas", "namajunas@ufc.com", 33),
    ("Valentina", "Shevchenko", "valentina@ufc.com", 33),
    ("Henry", "Cejudo", "cejudo@ufc.com", 32),
    ("Max", "Holloway", "holloway@ufc.com", 32),
    ("Jorge", "Masvidal", "masvidal@ufc.com", 37),
    ("Anderson", "Silva", "silva@ufc.com", 44);

SELECT * FROM users

-- Order By and Limit : definition ....
-- The ORDER BY clause sorts the result set in ascending or descending order based on one or more columns.
-- The LIMIT clause restricts the number of rows returned by a query.

-- Selects id and first_name from users table, ordered by id in descending order
SELECT id, first_name from users
ORDER BY id DESC

-- Selects first_name and age from users table, ordered by age in ascending order
SELECT first_name, age from users
ORDER BY age

-- Selects id, first_name, last_name, and age from users table, limited to 10 rows
SELECT id, first_name, last_name, age from users
LIMIT 10

-- Selects id and first_name from users table, ordered by id in descending order, limited to 6 rows
SELECT id, first_name from users
ORDER BY id DESC
LIMIT 6

-- like and aggregate functions : definition ....
-- The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
-- Aggregate functions perform a calculation on a set of values and return a single value.

-- Counts the total number of rows in the users table
SELECT COUNT(*) FROM users

-- Calculates the sum of all ages in the users table
SELECT SUM(age) as "Total Sum of age" FROM users

-- Calculates the average age of all users in the users table
SELECT AVG(age) as "Total Average of age" FROM users

-- Selects all columns from users table where age is equal to the minimum age in the table
SELECT * FROM users
WHERE age = (SELECT MIN(age) FROM users)

-- Selects all columns from users table where age is equal to the maximum age in the table
SELECT * FROM users
WHERE age = (SELECT MAX(age) FROM users)

-- Selects all columns from Users table where the length of first_name is 3 characters
SELECT *  FROM Users
where LENGTH(first_name) = 3

-- Selects first_name from users table where first_name ends with "bib"
SELECT first_name  from users
WHERE first_name LIKE "%bib"

-- Selects all columns from Users table where first_name contains "on"
SELECT * FROM Users
WHERE first_name LIKE "%on"

-- Selects all columns from Users table where first_name has exactly 3 characters and ends with "n"
SELECT * FROM Users
WHERE first_name LIKE "__n"