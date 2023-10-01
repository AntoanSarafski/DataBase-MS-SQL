-- AGGREGATE FUNCTION EXAMPLE --

SELECT DepartmentID, MIN(Salary)
      FROM [SoftUni].[dbo].[Employees]
      GROUP BY DepartmentID


-- ANALYSTIC FUNCTION EXAMPLE --

SELECT FirstName, Salary, DepartmentID,
	PERCENTILE_CONT(0.5)
	WITHIN GROUP (ORDER BY Salary DESC)
	OVER (PARTITION BY DepartmentID) AS MedianCont
FROM [SoftUni].[dbo].[Employees]
