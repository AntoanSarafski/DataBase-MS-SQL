SELECT * 
	FROM Employees
	ORDER BY [HireDate] ASC
	OFFSET (10-1) * 5 ROWS -- 10 is page --
	FETCH NEXT 10 ROWS ONLY -- 5 is rows count --