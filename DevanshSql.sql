CREATE DATABASE EventManagementDB;
USE EventManagementDB;

-- Customer Table
CREATE TABLE Customer (
    customerId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15)
);

-- Event Table
CREATE TABLE Event (
    eventId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    type VARCHAR(50)
);

-- Venue Table
CREATE TABLE Venue (
    venueId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    capacity INT
);

-- Staff Table
CREATE TABLE Staff (
    staffId INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL
);

-- Booking Table
CREATE TABLE Booking (
    bookingId INT PRIMARY KEY AUTO_INCREMENT,
    customerId INT,
    eventId INT,
    venueId INT,
    date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customerId) REFERENCES Customer(customerId),
    FOREIGN KEY (eventId) REFERENCES Event(eventId),
    FOREIGN KEY (venueId) REFERENCES Venue(venueId)
);

-- Payment Table
CREATE TABLE Payment (
    paymentId INT PRIMARY KEY AUTO_INCREMENT,
    bookingId INT UNIQUE,
    amount DECIMAL(10,2),
    mode VARCHAR(50),
    status VARCHAR(20),
    FOREIGN KEY (bookingId) REFERENCES Booking(bookingId)
);

-- Event_Staff (Many-to-Many between Event and Staff)
CREATE TABLE Event_Staff (
    eventId INT,
    staffId INT,
    PRIMARY KEY (eventId, staffId),
    FOREIGN KEY (eventId) REFERENCES Event(eventId),
    FOREIGN KEY (staffId) REFERENCES Staff(staffId)
);