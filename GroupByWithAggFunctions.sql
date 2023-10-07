SELECT d.[Name],
	   COUNT(*) AS Employees,
	   SUM(Salary) AS TotalSalary,
	   AVG(Salary) AS AvgSalary
	FROM Employees e
	JOIN Departments d ON d.DepartmentID = e.DepartmentID
	GROUP BY d.Name
	ORDER BY AvgSalary DESC