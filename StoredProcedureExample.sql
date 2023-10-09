CREATE PROC sp_AddEmployeeToProject(@EmployeeID INT, @ProjectId INT)
AS

	DECLARE @CountEmployeeProject INT =
		(SELECT COUNT(*) FROM EmployeesProjects
			WHERE EmployeeID = @EmployeeID
				AND ProjectID = @ProjectId);
	
	IF @CountEmployeeProject > 0
		THROW 50001, 'This employee is already in the project', 1

	INSERT INTO EmployeesProjects(EmployeeID, ProjectID)
		VALUES(@EmployeeID, @ProjectId)

GO
