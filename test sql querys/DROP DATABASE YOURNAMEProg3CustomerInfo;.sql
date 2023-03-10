DROP DATABASE MasonDavenportProg3CustomerInfo;
CREATE DATABASE MasonDavenportProg3CustomerInfo;
USE MasonDavenportProg3CustomerInfo;
-- create a new table
CREATE TABLE customers (
   custId INT AUTO_INCREMENT NOT NULL,
   custName VARCHAR(100) NOT NULL,
   custEmail VARCHAR(150) UNIQUE NOT NULL,
   custPassword VARCHAR(100),
   PRIMARY KEY (custId)
);
INSERT INTO customers (custName, custEmail, custPassword)
VALUES
('Sam Henry', 'sam@henry.com', NULL),
('Wilma Flinstone', 'wilma@bedrock.com', NULL),
('William Gates', 'bill@gates.com', NULL);

-- CREATE USER ONLY run the commands below ONCE  
CREATE USER 'kermit'@'localhost' IDENTIFIED BY 'sesame';

USE MasonDavenportProg3CustomerInfo;
GRANT SELECT, INSERT, UPDATE ON customers TO 'kermit'@'localhost';
FLUSH PRIVILEGES;