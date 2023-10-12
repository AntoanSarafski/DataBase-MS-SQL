SELECT CONCAT(FirstName, ' ', LastName) AS Available
     FROM Mechanics AS m
LEFT JOIN Jobs AS j ON j.MechanicId = m.MechanicId
    WHERE j.JobId IS NULL 
				  OR 'Finished' = ALL(SELECT j.Status
										FROM Jobs AS j
									   WHERE j.MechanicId = m.MechanicId)
	GROUP BY FirstName, LastName, m.MechanicId
	ORDER BY m.MechanicId