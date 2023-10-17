SELECT 
	a.FirstName,
	a.LastName,
	FORMAT(BirthDate, 'MM-dd-yyyy'),
	c.Name AS Hometown,
	a.Email
  FROM (SELECT * FROM Accounts WHERE Email LIKE 'e%') AS a 
  JOIN Cities AS c ON c.Id = a.CityId
  ORDER BY c.Name 


  