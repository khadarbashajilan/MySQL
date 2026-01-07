-- Active: 1767420256706@@127.0.0.1@3306@crud
SHOW DATABASES

SELECT DATABASE()

CREATE Table Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT
);

INSERT INTO
    Users (name, age)
VALUES ("ABC", 22),
    ("DEF", 23),
    ("GHI", 30),
    ("JKL", 35),
    ("MNO", 40),
    ("PQR", 45),
    ("STU", 50),
    ("VWX", 60),
    ("YZ", 65),
    ("YZ", 66),
    ("YZ", 67);


SELECT * FROM users

-- CASE statement is used to evaluate conditions and return a value based on the first condition that is true
-- It's similar to an if-then-else statement in programming languages


SELECT name, age,
    case 
        WHEN age < 30 THEN "Young"
        when age BETWEEN 30 and 60 THEN "Middle-aged"
        ElSE "Senior"
    END AS age_group
FROM users

-- The CASE statement in this query categorizes users into different age groups based on their age
-- Users with age less than 30 are categorized as "Young"
-- Users with age between 30 and 60 are categorized as "Middle-aged"
-- Users with age greater than 60 are categorized as "Senior"
