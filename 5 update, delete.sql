-- =============================================
-- DATABASE SETUP
-- =============================================

-- Show all existing databases
SHOW DATABASES;

-- Create a new database named 'crud'
CREATE DATABASE crud;

-- Select the 'crud' database for use
USE crud;

-- =============================================
-- TABLE CREATION
-- =============================================

-- Create a User table with:
-- - Auto-incrementing primary key
-- - Required name field
-- - Unique email field
-- - Phone number as BIGINT
-- - Optional age field
CREATE TABLE User(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone BIGINT NOT NULL,
    age INT
);

-- Display the table structure
DESC User;

-- =============================================
-- DATA INSERTION
-- =============================================

-- Insert sample data for UFC fighters
INSERT INTO User(name, email, phone, age)
VALUES
    ("Khabib Nurmagomedov", "khabib001@ufc.com", 1234567890, 32),
    ("Kamaru Usman", "usman@ufc.com", 2345678901, 34),
    ("Islam Makhachev", "makhachev@ufc.com", 3456789012, 27),
    ("Leon Edwards", "edwards@ufc.com", 4567890123, 28),
    ("Charles Oliveira", "charles@ufc.com", 5678901234, 33),
    ("Alex Pereira", "alex@ufc.com", 6789012345, 33),
    ("Israel Adesanya", "israel@ufc.com", 7890123456, 32),
    ("Jon Jones", "jon@ufc.com", 8901234567, 35),
    ("Georges St-Pierre", "gsp@ufc.com", 9012345678, 38),
    ("Anderson Silva", "the-spider@ufc.com", 1231231234, 44);

-- Verify all data was inserted correctly
SELECT * FROM User;

-- =============================================
-- UPDATE OPERATIONS
-- =============================================

-- Basic update example: Change Khabib's email
UPDATE User
SET email = "khabib@ufc.com"
WHERE id = 1;

-- Update multiple fields for a user
UPDATE User
SET phone = 9876543210, age = 33
WHERE name = "Kamaru Usman";


-- =============================================
-- DELETE OPERATIONS
-- =============================================

-- Basic delete example: Remove Israel Adesanya
DELETE FROM User
WHERE id = 7;

-- Re-insert Israel Adesanya (demonstrating insert after delete)
INSERT INTO User(id, name, email, phone, age)
VALUES(7, "Israel Adesanya", "israel@ufc.com", 7890123456, 32);

-- Delete users older than 40
DELETE FROM User
WHERE age > 40;

-- Delete users with specific email pattern
DELETE FROM User
WHERE email LIKE '%@oldfighters.com';

-- =============================================
-- ADVANCED OPERATIONS
-- =============================================

-- Safe update with verification first
SELECT * FROM User 
WHERE name = "Anderson Silva";

UPDATE User SET age = 45 
WHERE name = "Anderson Silva";

-- =============================================
-- FINAL VERIFICATION
-- =============================================

-- View all users after operations
SELECT * FROM User;

