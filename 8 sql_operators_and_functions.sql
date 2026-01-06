-- Active: 1767420256706@@127.0.0.1@3306@crud
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

SELECT * from USERS

--GROUP BY is used to group rows that have the same values in specified columns into aggregated data, typically used with aggregate functions like COUNT(), SUM(), AVG(), etc.
-- It reduces the number of rows in the result set.

-- ORDER BY is used to sort the result set by one or more columns in either ascending (ASC) or descending (DESC) order.
-- It does not reduce the number of rows in the result set.

-- Group BY :
SELECT age, COUNT(*) AS user_count
FROM users
GROUP BY age;
-- This query groups users by their age and counts the number of users in each age group.

-- Group by age and calculate the average age for each group
SELECT age, AVG(age) AS average_age
FROM users
GROUP BY age;
-- This query groups users by their age and calculates the average age for each group.

--Logical Operators :

SELECT * FROM users
WHERE age < 30
-- This query selects all users who are younger than 30.

SELECT * from users
WHERE age > 40
-- This query selects all users who are older than 40.

SELECT * FROM users
WHERE age = 32
-- This query selects all users who are exactly 32 years old.

SELECT * from users
WHERE age <= 32
-- This query selects all users who are 32 years old or younger.

SELECT * from users
WHERE age >= 40
-- This query selects all users who are 40 years old or older.

--AND, OR, BETWEEN, IN :

SELECT * FROM users
WHERE AGE in (27,37)
-- This query selects all users who are either 27 or 37 years old.

SELECT * FROM users
WHERE age = (SELECT MIN(age) FROM users) or age = (SELECT MAX(age) from users)
-- This query selects all users who are either the youngest or the oldest.

SELECT * FROM users
WHERE age BETWEEN 25 and 30
-- This query selects all users who are between 25 and 30 years old.

SELECT * from users
WHERE age < 30 and LENGTH(first_name) > 1
-- This query selects all users who are younger than 30 and have a first name longer than 1 character.







Local Config



Chat

Codestral
Ctrl⏎ Active file
⏎ Enter

