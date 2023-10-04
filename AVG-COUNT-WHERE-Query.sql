SELECT
	d.Name AS [Department Name],
	(SELECT AVG(Salary)
	FROM Employees
	WHERE DepartmentID = d.DepartmentID) AS AvgSalary
FROM Departments d
-- IF WE HAVE NULL VALUES -> --
WHERE (SELECT COUNT(*) FROM Employees WHERE DepartmentID = d.DepartmentID) > 0
ORDER BY AvgSalary