USE EventManagementDB;
-- Customers
INSERT INTO Customer (name, email, phone) VALUES
('Amit Sharma', 'amit@gmail.com', '9876543210'),
('Priya Verma', 'priya@gmail.com', '9123456789'),
('Rahul Mehta', 'rahul@gmail.com', '9988776655'),
('Neha Singh', 'neha@gmail.com', '9765432109'),
('Arjun Rao', 'arjun@gmail.com', '9112233445');

-- Events
INSERT INTO Event (name, date, type) VALUES
('Wedding Ceremony', '2025-09-15', 'Wedding'),
('Tech Conference', '2025-10-10', 'Conference'),
('Birthday Party', '2025-09-20', 'Birthday'),
('Music Concert', '2025-11-05', 'Concert'),
('Corporate Meeting', '2025-09-25', 'Corporate');

-- Venues
INSERT INTO Venue (name, location, capacity) VALUES
('Royal Palace', 'Delhi', 500),
('City Hall', 'Mumbai', 300),
('Banquet Hall', 'Bangalore', 200),
('Stadium Arena', 'Hyderabad', 1000),
('Hotel Grand', 'Chennai', 150);

-- Staff
INSERT INTO Staff (name, role) VALUES
('Rakesh Kumar', 'Caterer'),
('Sunita Devi', 'Decorator'),
('Vikas Gupta', 'Manager'),
('Anjali Rao', 'Technician'),
('Mohit Patel', 'Security');

-- Bookings
INSERT INTO Booking (customerId, eventId, venueId, date, status) VALUES
(1, 1, 1, '2025-09-15', 'Confirmed'),
(2, 2, 2, '2025-10-10', 'Pending'),
(3, 3, 3, '2025-09-20', 'Confirmed'),
(4, 4, 4, '2025-11-05', 'Cancelled'),
(5, 5, 5, '2025-09-25', 'Confirmed');

-- Payments
INSERT INTO Payment (bookingId, amount, mode, status) VALUES
(1, 50000.00, 'Credit Card', 'Paid'),
(2, 25000.00, 'UPI', 'Pending'),
(3, 15000.00, 'Cash', 'Paid'),
(4, 80000.00, 'Net Banking', 'Refunded'),
(5, 20000.00, 'Debit Card', 'Paid');

-- Event_Staff (Assignments)
INSERT INTO Event_Staff (eventId, staffId) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);