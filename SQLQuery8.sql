--CREATE DATABASE Hotel

USE Hotel


CREATE TABLE Employees
(
	Id INT PRIMARY KEY,
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100) NOT NULL,
	Title VARCHAR(50) NOT NULL,
	Notes VARCHAR(MAX)
)

INSERT INTO Employees(Id, FirstName, LastName, Title, Notes) VALUES
(1, 'Gosho', 'Petkov', 'CEO', 'Selsko vratar4e.'),
(2, 'Pesho', 'Petrov', 'HR', 'HR-manager'),
(3, 'Ivan', 'Ivanov', 'ACC', 'Acc-manager')


--Customers (AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)

CREATE TABLE Costumers
(
	AccountNumber INT PRIMARY KEY,
	FirstName VARCHAR(100)  NOT NULL,
	LastName VARCHAR(100)  NOT NULL,
	PhoneNumber CHAR(10) NOT NULL,
	EmergencyName VARCHAR(100) NOT NULL,
	EmergencyNumber VARCHAR(100) NOT NULL,
	Notes VARCHAR(MAX)
)

INSERT INTO Costumers(AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
VALUES 
(120, 'Kiro', 'Kirov', '087894562', 'Lelya', '879856238', 'Random note...'),
(121, 'Ivan', 'Ivanov', '087894262', 'asdas', '879226238', 'Random note2...'),
(122, 'Petyr', 'Petrov', '087894511', 'Lelasdasaya', '879555238', 'Random note3 ...')



CREATE TABLE RoomStatus 
(
	RoomStatus VARCHAR(40) NOT NULL,
	Notes VARCHAR(MAX)
)


INSERT INTO RoomStatus (RoomStatus, Notes)
VALUES 
( 'Available', 'random notes...'),
( 'InProccess', 'random notes...'),
( 'Taken', 'random notes...')


CREATE TABLE RoomTypes 
(
	RoomType VARCHAR(20) NOT NULL,
	Notes VARCHAR(MAX)
)

INSERT INTO RoomTypes (RoomType, Notes)
VALUES 
( 'DoubleBedRoom', 'random notes...'),
( 'SingleRoom', 'random notes...'),
( 'Apartment', 'random notes...')


CREATE TABLE BedTypes
(
	BedType VARCHAR(40) NOT NULL,
	Notes VARCHAR(MAX)
)

INSERT INTO BedTypes(BedType, Notes)
VALUES
('SingleBeds', null),
('OneLargeBed', null),
('TwoLargeBeds', 'TwoSeparetedRooms')

SELECT * FROM BedTypes

--Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)

CREATE TABLE Rooms 
(
    RoomNumber INT PRIMARY KEY,
    RoomType VARCHAR(50) NOT NULL,
    BedType VARCHAR(40) NOT NULL,
    Rate DECIMAL(15, 2),
    RoomStatus VARCHAR(40) NOT NULL,
    Notes TEXT
);

INSERT INTO Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
VALUES
(123, 'DoubleBedRoom',  'SingleBeds', 9.2, 'Available', 'random note'),
(134, 'SingleRoom',  'OneLargeBed', 9.9, 'InProccess', 'random note'),
(145, 'Apartment',  'TwoLargeBeds', 9.8, 'Taken', 'random note')

-- Payments (Id, EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)

CREATE TABLE Payments (
    Id INT PRIMARY KEY,
    EmployeeId INT NOT NULL,
    PaymentDate DATETIME NOT NULL,
    AccountNumber INT NOT NULL,
    FirstDateOccupied DATETIME NOT NULL,
    LastDateOccupied DATETIME NOT NULL,
    TotalDays INT NOT NULL,
    AmountCharged DECIMAL(15, 2),
    TaxRate INT,
    TaxAmount INT,
    PaymentTotal DECIMAL(15, 2),
	Notes VARCHAR(MAX)
);

INSERT INTO Payments (Id, EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
VALUES
	(1, 1, GETDATE(), 120, '5/5/2012', '5/8/2012', 3, 450.23, NULL, NULL, 450.23, NULL),
	(2, 2, GETDATE(), 121, '1/4/2012', '5/4/2012', 5, 1050.23, NULL, NULL, 1050.23, NULL),
	(3,3, GETDATE(), 122, '1/7/2012', '6/7/2012', 6, 1200.14, NULL, NULL, 1200.14, NULL)



CREATE TABLE Occupancies (
    Id INT PRIMARY KEY,
    EmployeeId INT NOT NULL,
    DateOccupied DATETIME NOT NULL,
    AccountNumber INT NOT NULL,
    RoomNumber INT NOT NULL,
    RateApplied DECIMAL(15, 2),
	PhoneCharge DECIMAL(15, 2),
	Notes VARCHAR(MAX)
);

INSERT INTO Occupancies(Id, EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
VALUES
(1, 1, GETDATE(), 120, 123, 0, 0, NULL),
(2, 2, GETDATE(), 121, 134, 0, 0, NULL),
(3, 3, GETDATE(), 122, 145, 0, 0, NULL)



