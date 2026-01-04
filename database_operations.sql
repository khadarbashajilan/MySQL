-- Active: 1767420256706@@127.0.0.1@3306@machine
-- This SQL script demonstrates fundamental database operations
-- It covers database creation, selection, and cleanup

-- =============================================
-- DATABASE OPERATIONS SECTION
-- =============================================

-- Display all existing databases in the MySQL server
-- This command lists all databases available on the server
SHOW DATABASES;

-- Create a new database named 'Machine'
-- This command initializes a new database with the specified name
CREATE DATABASE Machine;
 
-- Verify that the new database was created by listing all databases again
-- This confirms the database creation was successful
SHOW DATABASES;

-- =============================================
-- DATABASE SELECTION SECTION
-- =============================================

-- Select the 'machine' database for use
-- This command sets the current database context to 'machine'
USE machine;

-- Display the currently selected database
-- This verifies which database is currently in use
SELECT DATABASE();

-- =============================================
-- DATABASE CLEANUP SECTION
-- =============================================

-- Remove the 'Machine' database to clean up
-- WARNING: This will permanently delete the database and all its contents
-- Use with caution in production environments
DROP DATABASE Machine;

-- Verify that the database has been dropped
-- This should return NULL as no database is currently selected
SELECT DATABASE();