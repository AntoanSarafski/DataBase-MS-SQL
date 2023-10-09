SELECT DISTINCT RankedSalaries.DepartmentID, RankedSalaries.Salary AS ThirdHighestSalary 
	FROM(
		SELECT DepartmentID, Salary,
		DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS Ranked 
		  FROM Employees) AS RankedSalaries
    WHERE RankedSalaries.Ranked = 3

   
