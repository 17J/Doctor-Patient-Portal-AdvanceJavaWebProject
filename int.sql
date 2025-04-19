CREATE DATABASE IF NOT EXISTS hms;

GRANT ALL PRIVILEGES ON hms.* TO 'root'@'localhost';

USE hms;

-- Create the tables
CREATE TABLE users (
    id INT NOT NULL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE user_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE doctor (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    fullName VARCHAR(255) NOT NULL,
    dateOfBirth DATE,
    qualification VARCHAR(255),
    specialist VARCHAR(255),
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20),
    password VARCHAR(255) NOT NULL
);

CREATE TABLE specialist (
    id INT PRIMARY KEY AUTO_INCREMENT,
    specialist_name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE appointment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    userId INT NOT NULL,
    fullName VARCHAR(255) NOT NULL,
    gender VARCHAR(10),
    age VARCHAR(3),
    appointmentDate DATETIME NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    diseases TEXT,
    doctorId INT NOT NULL,
    address TEXT,
    status VARCHAR(255)
);

-- Add foreign key constraints

ALTER TABLE appointment
ADD CONSTRAINT fk_appointment_doctor FOREIGN KEY (doctorId) REFERENCES doctor(id);
INSERT INTO doctor (fullName, dateOfBirth, qualification, specialist, email, phone, password)
VALUES ('Dr. John Doe', '1980-01-01', 'MD', 'General Medicine', 'johndoe@example.com', '1234567890', 'password123');
INSERT INTO doctor (fullName, dateOfBirth, qualification, specialist, email, phone, password)
VALUES ('Dr. Maria', '1975-01-01', 'MBBS', 'Dermatology', 'maria@example.com', '1234567890', 'password123');
