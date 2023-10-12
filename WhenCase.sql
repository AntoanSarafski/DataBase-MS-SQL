SELECT *
	FROM Employees e
	JOIN Employees em ON em.EmployeeID = e.ManagerID
	JOIN Departments d ON e.DepartmentID = d.DepartmentID
	ORDER BY e.EmployeeID

