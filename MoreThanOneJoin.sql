SELECT s.Name AS StudentName,
	   c.Name AS Course,
	   t.Name AS Town,
	   sc.Mark AS Mark

	FROM StudentsCourses sc
	JOIN Courses c ON sc.CourseId = c.Id
	JOIN Students s ON sc.StudentId = s.Id
	JOIN Towns t ON t.Id = c.TownId
	ORDER BY Mark DESC