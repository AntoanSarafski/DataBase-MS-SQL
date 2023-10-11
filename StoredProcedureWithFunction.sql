-- FUNCTION GETSALARYLEVEL --

CREATE OR ALTER FUNCTION ufn_GetSalaryLevel(@Salary DECIMAL(18,4))
RETURNS VARCHAR(10) 
AS
BEGIN
	DECLARE @SalaryLevel VARCHAR(10);

	IF (@Salary < 30000)
		BEGIN
			SET @SalaryLevel = 'Low'
		END
	
	ELSE IF (@Salary <= 50000)
		BEGIN
			SET @SalaryLevel = 'Average'
		END

	ELSE SET @SalaryLevel = 'High'

	RETURN @SalaryLevel

END

GO

-- PROCEDURE EMPLOYEESBY - GETSALARYLEVEL --


CREATE OR ALTER PROC usp_EmployeesBySalaryLevel
    @SalaryLevel VARCHAR(10)
AS
BEGIN
    IF @SalaryLevel IN ('Low', 'Average', 'High')
    BEGIN
        SELECT FirstName, LastName
        FROM Employees
        WHERE dbo.ufn_GetSalaryLevel(Salary) = @SalaryLevel;
    END
    ELSE
    BEGIN
        PRINT 'Invalid Salary Level';
    END
END

EXEC dbo.usp_EmployeesBySalaryLevel 'Low';
EXEC dbo.usp_EmployeesBySalaryLevel 'Average';
EXEC dbo.usp_EmployeesBySalaryLevel 'High';
