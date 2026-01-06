-- Active: 1767420256706@@127.0.0.1@3306@crud
USE crud;

-- Create User table with auto-incrementing ID, timestamps, and constraints
CREATE TABLE User(
    Id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    age INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert sample data for UFC fighters
INSERT INTO User(name, email, age)
VALUES
    ("Khabib Nurmagomedov", "khabib@ufc.com", 32),
    ("Kamaru Usman", "usman@ufc.com", 34),
    ("Islam Makhachev", "makhachev@ufc.com", 27),
    ("Leon Edwards", "edwards@ufc.com", 28),
    ("Charles Oliveira", "charles@ufc.com", 33),
    ("Alex Pereira", "alex@ufc.com", 33),
    ("Israel Adesanya", "israel@ufc.com", 32),
    ("Jon Jones", "jon@ufc.com", 35),
    ("Georges St-Pierre", "gsp@ufc.com", 38),
    ("Anderson Silva", "silva@ufc.com", 44);

-- View all users
SELECT * FROM User;

-- =============================================
-- TIMESTAMP FUNCTIONS
-- =============================================

-- CURRENT_TIMESTAMP explanation:
-- Automatically records when a record is created and updated
-- created_at: When the record was first inserted
-- updated_at: When the record was last modified

-- Example of timestamp behavior:
-- Before update: created_at = 2026-01-05 14:19:13, updated_at = 2026-01-05 14:19:13
UPDATE User
SET name = "Khabib"
WHERE id = 1;
-- After update: created_at remains same, updated_at changes to current time

-- =============================================
-- STRING FUNCTIONS
-- =============================================

-- CHAR_LENGTH / LENGTH:
-- Returns the number of characters in a string
-- CHAR_LENGTH and LENGTH are synonyms in MySQL
SELECT CHAR_LENGTH(name) AS "Character Count" FROM User;
SELECT LENGTH(name) AS "Character Count" FROM User;

-- SUBSTRING:
-- Extracts a portion of a string
-- SYNTAX: SUBSTRING(string, start_position, length)
-- If length is omitted, extracts to the end of the string
SELECT SUBSTRING(name, 1, 3) AS "First 3 Chars" FROM User;
SELECT SUBSTRING(name, 3) AS "From 3rd Char" FROM User;

-- REPLACE:
-- Replaces occurrences of a substring with another substring
-- SYNTAX: REPLACE(string, old_part, new_part)
SELECT REPLACE(name, "bib", "dar") AS "Replaced Name" FROM User
WHERE id = 1;

SELECT REPLACE("HELLO WORLD", "HELLO", "BYE") as "Replace Function"

-- REVERSE:
-- Reverses the order of characters in a string
SELECT REVERSE(name) AS "Reversed Name" FROM User;

-- CONCAT:
-- Combines two or more strings
SELECT CONCAT(name, ' (', age, ')') AS "Name with Age" FROM User;

-- UPPER / LOWER:
-- Converts string to uppercase or lowercase
SELECT UPPER(name) AS "Uppercase Name" FROM User;
SELECT LOWER(name) AS "Lowercase Name" FROM User;

-- TRIM / LTRIM / RTRIM:
-- Removes whitespace from strings
SELECT TRIM('   Hello   ') AS "Trimmed";
SELECT LTRIM('   Hello') AS "Left Trimmed";
SELECT RTRIM('Hello   ') AS "Right Trimmed";

-- =============================================
-- DATE/TIME FUNCTIONS
-- =============================================

-- CURRENT_DATE:
-- Returns the current date (YYYY-MM-DD)
SELECT CURRENT_DATE AS "Today's Date";

-- CURRENT_TIME:
-- Returns the current time (HH:MM:SS)
SELECT CURRENT_TIME AS "Current Time";

-- CURRENT_TIMESTAMP:
-- Returns current date and time (YYYY-MM-DD HH:MM:SS)
SELECT CURRENT_TIMESTAMP AS "Current Timestamp";

-- DATE_FORMAT:
-- Formats a date according to specified format
SELECT DATE_FORMAT(created_at, '%W, %M %e, %Y') AS "Formatted Date" FROM User;

-- DATEDIFF:
-- Returns the difference in days between two dates
SELECT DATEDIFF(CURRENT_DATE, created_at) AS "Days Since Creation" FROM User;

-- DATE_ADD / DATE_SUB:
-- Adds or subtracts intervals from dates
SELECT DATE_ADD(created_at, INTERVAL 1 YEAR) AS "One Year Later" FROM User;
SELECT DATE_SUB(created_at, INTERVAL 1 MONTH) AS "One Month Earlier" FROM User;

-- =============================================
-- NUMERIC FUNCTIONS
-- =============================================

-- ABS:
-- Returns the absolute value of a number
SELECT ABS(-10) AS "Absolute Value";

-- ROUND:
-- Rounds a number to specified decimal places
SELECT ROUND(3.14159, 2) AS "Rounded Number";

-- CEIL / FLOOR:
-- Rounds up or down to nearest integer
SELECT CEIL(3.2) AS "Ceiling";
SELECT FLOOR(3.8) AS "Floor";

-- POWER / SQRT:
-- Calculates power or square root
SELECT POWER(2, 3) AS "Power";
SELECT SQRT(16) AS "Square Root";

-- RAND:
-- Generates a random number between 0 and 1
SELECT RAND() AS "Random Number";

-- =============================================
-- CONDITIONAL FUNCTIONS
-- =============================================

-- IF:
-- Returns one value if condition is true, another if false
SELECT name, IF(age > 30, 'Senior', 'Junior') AS "Experience Level" FROM User;

-- CASE:
-- More complex conditional logic
SELECT name,
       CASE
           WHEN age < 25 THEN 'Young'
           WHEN age BETWEEN 25 AND 30 THEN 'Prime'
           ELSE 'Veteran'
       END AS "Age Group"
FROM User;

-- =============================================
-- AGGREGATE FUNCTIONS
-- =============================================

-- COUNT:
-- Counts the number of rows
SELECT COUNT(*) AS "Total Users" FROM User;

-- SUM:
-- Calculates the sum of values
SELECT SUM(age) AS "Total Age" FROM User;

-- AVG:
-- Calculates the average of values
SELECT AVG(age) AS "Average Age" FROM User;

-- MIN / MAX:
-- Finds minimum or maximum value
SELECT MIN(age) AS "Youngest", MAX(age) AS "Oldest" FROM User;

-- GROUP_CONCAT:
-- Concatenates values from multiple rows
SELECT GROUP_CONCAT(name SEPARATOR ', ') AS "All Names" FROM User;