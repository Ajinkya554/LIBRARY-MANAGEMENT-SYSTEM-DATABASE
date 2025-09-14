
CREATE DATABASE LibraryDB;
USE LibraryDB;


-- Table: JOB_ROLES

CREATE TABLE JOB_ROLES (
    role_id INT PRIMARY KEY AUTO_INCREMENT,
    Role_name VARCHAR(100) NOT NULL,
    Salary DECIMAL(10,2)
);


-- Table: EMPLOYEES

CREATE TABLE EMPLOYEES (
    Employee_ID INT PRIMARY KEY AUTO_INCREMENT,
    First_Name VARCHAR(100),
    Last_Name VARCHAR(100),
    Phone_Number VARCHAR(15),
    Email VARCHAR(150) UNIQUE,
    Address VARCHAR(255),
    Date_of_hire DATE,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES JOB_ROLES(role_id)
);


-- Table: BRANCHES

CREATE TABLE BRANCHES (
    Branch_ID INT PRIMARY KEY AUTO_INCREMENT,
    Branch_Name VARCHAR(150),
    Address VARCHAR(255),
    Phone_Number VARCHAR(15),
    Email VARCHAR(150) UNIQUE
);


-- Table: BOOKS

CREATE TABLE BOOKS (
    Book_id INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(200),
    Author VARCHAR(150),
    ISBN VARCHAR(50) UNIQUE,
    Genre VARCHAR(100),
    Publisher VARCHAR(150),
    Publication_Date DATE
);


-- Table: BOOK_COPIES

CREATE TABLE BOOK_COPIES (
    Copy_id INT PRIMARY KEY AUTO_INCREMENT,
    Book_id INT,
    Status VARCHAR(50), -- e.g. Available, Borrowed, Reserved
    Due_Date DATE,
    FOREIGN KEY (Book_id) REFERENCES BOOKS(Book_id)
);


-- Table: MEMBERS

CREATE TABLE MEMBERS (
    Member_id INT PRIMARY KEY AUTO_INCREMENT,
    First_Name VARCHAR(100),
    Last_Name VARCHAR(100),
    Phone_Number VARCHAR(15),
    Email VARCHAR(150) UNIQUE,
    Address VARCHAR(255),
    Membership_expiration_date DATE
);
-- Table: CHECKOUTS

CREATE TABLE CHECKOUTS (
    Checkout_id INT PRIMARY KEY AUTO_INCREMENT,
    Copy_id INT,
    Member_id INT,
    Checkout_date DATE,
    Return_date DATE,
    Due_date DATE,
    FOREIGN KEY (Copy_id) REFERENCES BOOK_COPIES(Copy_id),
    FOREIGN KEY (Member_id) REFERENCES MEMBERS(Member_id)
);

-- Table: FINE

CREATE TABLE FINE (
    Fine_ID INT PRIMARY KEY AUTO_INCREMENT,
    Copy_id INT,
    Member_id INT,
    Fine_Amount DECIMAL(10,2),
    Fine_Date DATE,
    Status VARCHAR(50), -- Paid/Unpaid
    FOREIGN KEY (Copy_id) REFERENCES BOOK_COPIES(Copy_id),
    FOREIGN KEY (Member_id) REFERENCES MEMBERS(Member_id)
);


-- Table: INVENTORY

CREATE TABLE INVENTORY (
    Inventory_ID INT PRIMARY KEY AUTO_INCREMENT,
    Book_id INT,
    Branches_id INT,
    Quantity INT,
    Date_Added DATE,
    Date_Modified DATE,
    FOREIGN KEY (Book_id) REFERENCES BOOKS(Book_id),
    FOREIGN KEY (Branches_id) REFERENCES BRANCHES(Branch_ID)
);
