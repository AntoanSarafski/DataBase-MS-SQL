
CREATE TABLE Clients 
	(
		ClientId INT PRIMARY KEY IDENTITY,
		FirstName VARCHAR(50) NOT NULL,
		LastName VARCHAR(50) NOT NULL,
		Phone CHAR(12) CHECK(LEN(Phone) = 12) NOT NULL
	)


CREATE TABLE Mechanics 
	(
		MechanicId INT PRIMARY KEY IDENTITY,
		FirstName VARCHAR(50) NOT NULL,
		LastName VARCHAR(50) NOT NULL,
		Address VARCHAR(255) NOT NULL
	)

CREATE TABLE Models
	(
		ModelId INT PRIMARY KEY IDENTITY,
		 Name VARCHAR(50) UNIQUE  NOT NULL
	)


CREATE TABLE Jobs 
	(
	        JobId INT IDENTITY PRIMARY KEY ,
	      ModelId INT FOREIGN KEY REFERENCES Models(ModelId)  NOT NULL,
	     Status VARCHAR(11) DEFAULT 'Pending' CHECK(Status IN('Pending', 'In Progress', 'Finished'))  NOT NULL, 
	     ClientId INT FOREIGN KEY REFERENCES Clients(ClientId) NOT NULL,
	    IssueDate DATE NOT NULL,
	   FinishDate DATE,
	   MechanicId INT FOREIGN KEY REFERENCES Mechanics(MechanicId)

	)


CREATE TABLE Orders 
	(
		OrderId INT IDENTITY PRIMARY KEY,
		  JobID INT FOREIGN KEY REFERENCES Jobs(JobId)  NOT NULL,
	  IssueDate DATE,
	  Delivered BIT DEFAULT 0 NOT NULL
	)

CREATE TABLE Vendors
	(
		VendorId INT PRIMARY KEY IDENTITY,
		  Name VARCHAR(50) UNIQUE NOT NULL
	)

CREATE TABLE Parts 
	(
		       PartId INT PRIMARY KEY IDENTITY,
		 SerialNumber VARCHAR(50) UNIQUE NOT NULL,
		Description VARCHAR(255),
	         	Price DECIMAL (15, 2) CHECK(Price > 0 AND Price <= 9999.99) NOT NULL,
		     VendorId INT FOREIGN KEY REFERENCES Vendors(VendorId) NOT NULL,
		     StockQty INT DEFAULT 0 CHECK(StockQty >= 0)
	)


CREATE TABLE OrderParts
	(
		OrderId INT FOREIGN KEY REFERENCES Orders(OrderId) NOT NULL,
		PartId  INT FOREIGN KEY REFERENCES Parts(PartId) NOT NULL,
	   Quantity INT DEFAULT 1 CHECK(Quantity > 0)
	            CONSTRAINT PK_OrdersParts PRIMARY KEY (OrderId, PartId)
	)

CREATE TABLE PartsNeeded 
	(
	      JobId INT FOREIGN KEY REFERENCES Jobs(JobId) NOT NULL,
	     PartId INT FOREIGN KEY REFERENCES Parts(PartId) NOT NULL,
	   Quantity INT DEFAULT 1 CHECK(Quantity > 0),
		CONSTRAINT PK_JobsParts PRIMARY KEY (JobId, PartId)
	)
