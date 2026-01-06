-- Active: 1767420256706@@127.0.0.1@3306@machine
-- This script demonstrates basic CRUD (Create, Read, Update, Delete) operations in MySQL

-- =============================================
-- DATABASE OPERATIONS
-- =============================================

-- Display all existing databases in the MySQL server
SHOW DATABASES;

-- Create a new database named 'CRUD'
-- Note: There's a typo in the original (should be 'CRUD' not 'CURD')
CREATE DATABASE CRUD;

-- Select the 'CRUD' database for use
USE CRUD;

-- Verify which database is currently in use
SELECT DATABASE();

-- =============================================
-- TABLE CREATION
-- =============================================

-- Create a new table named 'ufc' with four columns:
-- name (string), age (integer), champ (boolean), born (date with default value)
CREATE TABLE ufc(
    name VARCHAR(50),
    age INT,
    champ BOOLEAN,
    born DATE DEFAULT "2000-02-02"
);

-- Display the structure of the 'ufc' table
DESC ufc;

-- =============================================
-- DATA INSERTION
-- =============================================

-- Insert a single row into the 'ufc' table
INSERT INTO ufc(name, age, champ, born)
VALUES ("John Chanko", 27, FALSE, "2000-01-01");

-- Display all rows in the 'ufc' table
SELECT * FROM ufc;

-- Insert multiple rows into the 'ufc' table in a single statement
INSERT INTO ufc(name, age, champ, born)
VALUES ("Islam", 29, TRUE, "1998-02-05"),
        ("Khabib", 32, FALSE, "1995-02-02");

-- Display only rows where champ is TRUE
SELECT * FROM ufc
WHERE champ is TRUE;

-- =============================================
-- DATA UPDATING
-- =============================================

-- Update specific rows in the table
-- Set champ to TRUE for the fighter named 'Khabib'
UPDATE ufc
SET champ = TRUE
WHERE name = 'Khabib';

-- =============================================
-- DATA DELETION
-- =============================================

-- Delete a specific row from the table
-- Remove the fighter named 'Islam'
DELETE FROM ufc
WHERE name = "Islam";

-- Display all rows in the 'ufc' table after deletion
SELECT * from ufc;

-- =============================================
-- TABLE MODIFICATIONS
-- =============================================

-- Remove the 'born' column from the 'ufc' table
-- Note: This operation is irreversible
ALTER TABLE ufc DROP COLUMN born;

-- Add a new column to the 'ufc' table
-- Add a 'weight_class' column to store the fighter's weight class
ALTER TABLE ufc
ADD COLUMN weight_class VARCHAR(50);

-- Update existing rows with weight class information
-- Set weight class to 'Lightweight' for 'John Chanko'
UPDATE ufc
SET weight_class = 'Lightweight'
WHERE name = 'John Chanko';

-- Set weight class to 'Middleweight' for 'Khabib'
UPDATE ufc
SET weight_class = 'Middleweight'
WHERE name = 'Khabib';

SELECT * from ufc;

-- Correct syntax for inserting data
INSERT INTO ufc (name, age, champ, weight_class)
VALUES ("Islam", 29, TRUE, 'Walter-weight');

-- Correct syntax for deleting rows
DELETE FROM ufc
WHERE name = 'Islam' AND weight_class IS NULL;