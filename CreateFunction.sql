CREATE OR ALTER FUNCTION unf_GetSalaryLevel(@Salary MONEY)
RETURNS VARCHAR(10)
AS
 BEGIN
	IF @Salary IS NULL 
		RETURN NULL

	ELSE IF @Salary < 30000
		RETURN 'Low'

	ELSE IF @Salary <= 50000
		RETURN 'Average'

	ELSE IF @Salary > 50000
		RETURN 'High'

	RETURN NULL
 END

 SELECT FirstName, LastName, Salary, dbo.unf_GetSalaryLevel(Salary)
	FROM Employees