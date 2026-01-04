-- Active: 1767420256706@@127.0.0.1@3306@machine
-- This script demonstrates SQL data types with examples
-- It covers numeric, string, date/time, and binary data types

-- =============================================
-- NUMERIC DATA TYPES
-- =============================================
USE machine;

SELECT DATABASE();

-- INTEGER types store whole numbers
-- INT is a common synonym for INTEGER
CREATE TABLE numeric_example (
    -- Tiny integer (-128 to 127)
    tiny_int_example TINYINT,
    -- Small integer (-32,768 to 32,767)
    small_int_example SMALLINT,
    -- Medium integer (-8,388,608 to 8,388,607)
    medium_int_example MEDIUMINT,
    -- Standard integer (-2,147,483,648 to 2,147,483,647)
    int_example INT,
    -- Big integer (-9,223,372,036,854,775,808 to 9,223,372,036,854,775,807)
    big_int_example BIGINT,
    -- Floating-point number (approximate, 4 bytes)
    float_example FLOAT,
    -- Double-precision floating-point (approximate, 8 bytes)
    double_example DOUBLE,
    -- Exact fixed-point number (up to 65 digits)
    decimal_example DECIMAL(10,2)
);

-- Insert example data into numeric table
INSERT INTO numeric_example VALUES (
    127,                -- TINYINT
    32767,              -- SMALLINT
    8388607,            -- MEDIUMINT
    2147483647,         -- INT
    9223372036854775807,-- BIGINT
    3.14159,            -- FLOAT
    3.141592653589793,  -- DOUBLE
    12345.67             -- DECIMAL
);

SELECT * FROM numeric_example;


-- =============================================
-- STRING DATA TYPES
-- =============================================

-- CHAR stores fixed-length strings (1-255 characters)
-- VARCHAR stores variable-length strings (1-65,535 characters)
CREATE TABLE string_example (
    -- Fixed-length string (padded with spaces)
    char_example CHAR(10),
    -- Variable-length string (only uses needed space)
    varchar_example VARCHAR(50),
    -- Text for longer strings (up to 65,535 characters)
    text_example TEXT,
    -- Medium text (up to 16,777,215 characters)
    medium_text_example MEDIUMTEXT,
    -- Long text (up to 4,294,967,295 characters)
    long_text_example LONGTEXT,
    -- Binary string (fixed length)
    binary_example BINARY(10),
    -- Variable-length binary string
    varbinary_example VARBINARY(50)
);

-- Insert example data into string table
INSERT INTO string_example VALUES (
    'Fixed',            -- CHAR(10) - will be padded to 10 chars
    'Variable',         -- VARCHAR(50)
    'This is a text example', -- TEXT
    'Medium text example', -- MEDIUMTEXT
    'Long text example', -- LONGTEXT
    'binary',           -- BINARY(10) - will be padded to 10 bytes
    'varbinary'         -- VARBINARY(50)
);
SELECT * FROM string_example;

-- =============================================
-- DATE/TIME DATA TYPES
-- =============================================

-- DATE stores date values (YYYY-MM-DD)
-- TIME stores time values (HH:MM:SS)
-- DATETIME stores both date and time
-- TIMESTAMP stores date and time with timezone
-- YEAR stores year values (1901-2155)
CREATE TABLE datetime_example (
    -- Date only (e.g., '2023-11-15')
    date_example DATE,
    -- Time only (e.g., '14:30:00')
    time_example TIME,
    -- Date and time (e.g., '2023-11-15 14:30:00')
    datetime_example DATETIME,
    -- Timestamp with timezone (e.g., '2023-11-15 14:30:00')
    timestamp_example TIMESTAMP,
    -- Year only (e.g., '2023')
    year_example YEAR
);

-- Insert example data into datetime table
INSERT INTO datetime_example VALUES (
    '2023-11-15',       -- DATE
    '14:30:00',         -- TIME
    '2023-11-15 14:30:00', -- DATETIME
    '2023-11-15 14:30:00', -- TIMESTAMP
    2023                -- YEAR
);

-- =============================================
-- BINARY DATA TYPES
-- =============================================

-- BLOB stores binary large objects
-- ENUM stores a list of possible string values
-- SET stores a set of possible string values
CREATE TABLE binary_example (
    -- Binary large object (up to 65,535 bytes)
    blob_example BLOB,
    -- Medium binary object (up to 16,777,215 bytes)
    medium_blob_example MEDIUMBLOB,
    -- Long binary object (up to 4,294,967,295 bytes)
    long_blob_example LONGBLOB,
    -- Enumerated list of possible values
    enum_example ENUM('small', 'medium', 'large'),
    -- Set of possible values (can select multiple)
    set_example SET('red', 'green', 'blue')
);

-- Insert example data into binary table
INSERT INTO binary_example VALUES (
    'binary data',      -- BLOB
    'medium binary data', -- MEDIUMBLOB
    'long binary data', -- LONGBLOB
    'medium',           -- ENUM
    'red,green'         -- SET
);
-- =============================================
-- SPECIAL DATA TYPES
-- =============================================

-- JSON stores JSON data
-- GEOMETRY stores spatial data
CREATE TABLE special_example (
    -- JSON data type
    json_example JSON,
    -- Geometry data type for spatial data
    geometry_example GEOMETRY
);

-- Insert example data into special table
INSERT INTO special_example VALUES (
    '{"key": "value"}', -- JSON
    ST_GeomFromText('POINT(1 1)') -- GEOMETRY
);

