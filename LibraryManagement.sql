CREATE DATABASE LibraryManagement;
USE LibraryManagement;
CREATE TABLE Library (
    library_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200)
);
CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100),
    publisher VARCHAR(100),
    isbn VARCHAR(20) UNIQUE,
    available_copies INT CHECK (available_copies >= 0),
    library_id INT,
    FOREIGN KEY (library_id) REFERENCES Library(library_id)
);
CREATE TABLE Member (
    member_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    phone_number VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    library_id INT,
    FOREIGN KEY (library_id) REFERENCES Library(library_id)
);
CREATE TABLE Librarian (
    librarian_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15) UNIQUE,
    library_id INT,
    FOREIGN KEY (library_id) REFERENCES Library(library_id)
);
CREATE TABLE Transaction (
    transaction_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    librarian_id INT,
    issue_date DATE,
    due_date DATE,
    return_date DATE,
    fine_amount DECIMAL(8,2) DEFAULT 0,
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (librarian_id) REFERENCES Librarian(librarian_id)
);
CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    reservation_date DATE,
    status VARCHAR(20) CHECK (status IN ('Pending', 'Completed', 'Cancelled')),
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);
-- Library
INSERT INTO Library VALUES 
(1, 'Central Library', 'Main Street, City'),
(2, 'Community Library', 'Park Avenue'),
(3, 'Tech Library', 'IT Hub'),
(4, 'Kids Library', 'School Road'),
(5, 'Public Library', 'Market Area');

-- Books
INSERT INTO Book VALUES
(101, 'Database Systems', 'Elmasri', 'Pearson', 'ISBN101', 5, 1),
(102, 'Java Programming', 'Herbert Schildt', 'McGraw Hill', 'ISBN102', 3, 1),
(103, 'AI Basics', 'Russell', 'MIT Press', 'ISBN103', 4, 2),
(104, 'Data Structures', 'Cormen', 'PHI', 'ISBN104', 2, 3),
(105, 'Python Guide', 'Guido', 'OReilly', 'ISBN105', 6, 4);

-- Members
INSERT INTO Member VALUES
(201, 'Alice', 'Green Street', '9876543210', 'alice@mail.com', 1),
(202, 'Bob', 'Blue Street', '9876543211', 'bob@mail.com', 1),
(203, 'Charlie', 'Red Street', '9876543212', 'charlie@mail.com', 2),
(204, 'David', 'Yellow Street', '9876543213', 'david@mail.com', 3),
(205, 'Eva', 'Pink Street', '9876543214', 'eva@mail.com', 4);

-- Librarians
INSERT INTO Librarian VALUES
(301, 'Mr. John', 'john@lib.com', '9990001111', 1),
(302, 'Ms. Kate', 'kate@lib.com', '9990001112', 2),
(303, 'Mr. Lee', 'lee@lib.com', '9990001113', 3),
(304, 'Ms. Ana', 'ana@lib.com', '9990001114', 4),
(305, 'Mr. Raj', 'raj@lib.com', '9990001115', 5);

-- Transactions
INSERT INTO Transaction VALUES
(401, 201, 101, 301, '2025-09-01', '2025-09-10', NULL, 0),
(402, 202, 102, 301, '2025-09-02', '2025-09-12', '2025-09-11', 0),
(403, 203, 103, 302, '2025-09-03', '2025-09-13', NULL, 0),
(404, 204, 104, 303, '2025-09-04', '2025-09-14', NULL, 50),
(405, 205, 105, 304, '2025-09-05', '2025-09-15', NULL, 0);

-- Reservations
INSERT INTO Reservation VALUES
(501, 201, 102, '2025-09-01', 'Pending'),
(502, 202, 103, '2025-09-02', 'Completed'),
(503, 203, 104, '2025-09-03', 'Pending'),
(504, 204, 105, '2025-09-04', 'Cancelled'),
(505, 205, 101, '2025-09-05', 'Pending');