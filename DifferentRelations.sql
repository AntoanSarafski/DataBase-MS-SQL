CREATE TABLE Majors 
(
	[MajorID] INT IDENTITY PRIMARY KEY,
	[Name] VARCHAR(50) NOT NULL,
)

CREATE TABLE Students 
(
	[StudentID] INT IDENTITY PRIMARY KEY,
	[StudentNumber] INT NOT NULL UNIQUE,
	[StudentName] VARCHAR(50) NOT NULL,
	[MajorID] INT FOREIGN KEY REFERENCES Majors(MajorID)
)

CREATE TABLE Payments 
(
	
	[PaymentID] INT IDENTITY PRIMARY KEY,
	[PaymentDate] DATE NOT NULL,
	[PaymentAmount] DECIMAL(17,2) NOT NULL,
	[StudentID] INT FOREIGN KEY REFERENCES Students(StudentID)
)

CREATE TABLE Subjects
(
	[SubjectID] INT IDENTITY PRIMARY KEY,
	[SubjectName] VARCHAR(50) NOT NULL
)

CREATE TABLE Agenda 
(
	[StudentID] INT FOREIGN KEY REFERENCES Students(StudentID),
	[SubjectID] INT FOREIGN KEY REFERENCES Subjects(SubjectID),
	CONSTRAINT PK_Students_Subjects PRIMARY KEY(StudentID, SubjectID)
)
