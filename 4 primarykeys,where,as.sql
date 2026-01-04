-- Active: 1767420256706@@127.0.0.1@3306@crud
-- This script demonstrates primary keys, auto-increment, WHERE clauses, and aliases in MySQL

-- =============================================
-- DATABASE SETUP
-- =============================================

-- Create a new database named UFC
CREATE DATABASE UFC;

-- Select the UFC database for use
USE UFC;

-- =============================================
-- PRIMARY KEY DEMONSTRATION
-- =============================================

-- A primary key uniquely identifies each record in a table
-- It must contain unique values and cannot contain NULL values
-- Here we create a table with an explicit primary key

CREATE TABLE Fighters(
    id INT PRIMARY KEY,  -- Explicit primary key column
    name VARCHAR(50),
    weight_class VARCHAR(50),
    weight_lbs INT,
    location VARCHAR(50),
    opponent VARCHAR(50)
);

-- Show the structure of the Fighters table
DESC Fighters;

-- Insert data into the Fighters table
-- Note: The first attempt fails because we try to insert duplicate primary keys
INSERT INTO Fighters(id, name, weight_class, weight_lbs, location, opponent)
VALUES (1, "Islam", "Walter-weight", 185, "Dagestan", "Illia"),
       (1, "Khabib", "LightWeight", 155, "Dagestan", "Conor"); -- Error: Duplicate primary key

-- View all data in the Fighters table
SELECT * FROM Fighters;

-- Drop the Fighters table to start fresh
DROP TABLE Fighters;

-- =============================================
-- AUTO-INCREMENT DEMONSTRATION
-- =============================================

-- Auto-increment automatically generates unique numbers
-- This is commonly used for primary keys

CREATE TABLE Fighters(
    id INT PRIMARY KEY AUTO_INCREMENT,  -- Auto-incrementing primary key
    name VARCHAR(50),
    weight_class VARCHAR(50),
    weight_lbs INT,
    location VARCHAR(50),
    opponent VARCHAR(50)
);

-- Insert data without specifying the id (it will auto-increment)
INSERT INTO Fighters(name, weight_class, weight_lbs, location, opponent)
VALUES ("Islam", "Walter-weight", 165, "Dagestan", "Illia"),
       ("Khabib", "LightWeight", 155, "Dagestan", "Conor"),
       ("Khamzat", "Light-Heavy-Weight", 185, "Khazakistan", "Kill everybody");

-- The id column will automatically be assigned values 1, 2, 3...

-- =============================================
-- WHERE CLAUSE DEMONSTRATION
-- =============================================

-- The WHERE clause filters records based on specified conditions

-- Select fighter with name "Khabib"
SELECT * FROM Fighters WHERE name = "Khabib";

-- Select fighters weighing 185 lbs
SELECT * FROM Fighters WHERE weight_lbs = 185;

-- Select names and locations of fighters from Dagestan
SELECT name, location FROM Fighters WHERE location = "Dagestan";

-- =============================================
-- ALIAS (AS) DEMONSTRATION
-- =============================================

-- Aliases provide temporary names for columns or tables in the result set

-- Alias for weight_class column as "WD"
SELECT weight_class AS WD FROM Fighters;

-- Alias for name column as "From Dagestan" for fighters from Dagestan
SELECT name AS "From Dagestan" FROM Fighters
WHERE location = "Dagestan";

-- Alias for name column as "BORZ" for the fighter named "Khamzat"
SELECT name AS BORZ FROM Fighters
WHERE name = "Khamzat";

-- Alternative WHERE clause to find fighters not named "Khabib" or "Islam"
-- WHERE name != "Khabib" AND name != "Islam" -- OR