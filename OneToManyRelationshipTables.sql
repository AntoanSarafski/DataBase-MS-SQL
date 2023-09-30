CREATE TABLE Manufacturers
(
	[ManufacturerID] INT PRIMARY KEY,
	[Name] VARCHAR(20) NOT NULL UNIQUE,
	[EstablishedOn] DATE 
)

CREATE TABLE Models 
(
	[ModelID] INT IDENTITY(101,1) PRIMARY KEY,
	[Name] VARCHAR(20) NOT NULL UNIQUE ,
	[ManufacturerID] INT REFERENCES Manufacturers(ManufacturerID)
)

INSERT INTO Manufacturers VALUES
(1, 'BMW', '1916-03-07'),
(2, 'Tesla', '2003-01-01'),
(3, 'Lada', '1966-05-01')


INSERT INTO Models VALUES
('X1', 1),
('i6', 1),
('Model S', 2),
('Model X', 2),
('Model 3', 2),
('Nova', 3)