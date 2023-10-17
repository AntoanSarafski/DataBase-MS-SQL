SELECT 
		AccountId,
		FullName,
		MAX(Nights) AS LongestTrip,
		MIN(Nights) AS ShortestTrip
  FROM (SELECT  
		a.Id AS AccountId,
		a.FirstName + ' ' + a.LastName AS FullName,
		SUM(DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate)) AS Nights
  FROM Accounts AS a
  JOIN AccountsTrips AS [at] ON at.AccountId = a.Id
  JOIN Trips AS t ON t.Id = at.TripId
  WHERE CancelDate IS NULL AND MiddleName IS NULL
  GROUP BY a.Id, at.TripId, a.FirstName, a.LastName) AS r
  GROUP BY r.AccountId, r.FullName
  ORDER BY LongestTrip DESC, ShortestTrip