CREATE PROC	AddToProject(@EmployeeId INT, @ProjectId INT)
AS
	DECLARE @EmployeesProjects INT = 
		(SELECT COUNT(*) FROM EmployeesProjects
			WHERE EmployeeID = @EmployeeId)

	IF @EmployeesProjects >=3
		THROW 50005, 'Employee has more than 3 projects', 1

	DECLARE @EmployeeInThisProject INT =
		(SELECT COUNT(*) FROM EmployeesProjects
			WHERE EmployeeID = @EmployeeId
				AND ProjectID = @ProjectId)

	IF @EmployeeInThisProject > 0
		THROW 50006, 'Employee is already in this project', 1

	INSERT INTO EmployeesProjects (EmployeeID, ProjectID)
		VALUES (@EmployeeId, @ProjectId)

GO

EXEC AddToProject 267, 78