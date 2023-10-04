SELECT  c.CountryCode, COUNT(mc.MountainId) AS [TOTAL]
	FROM Countries  AS c
	LEFT JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
	GROUP BY c.CountryCode
	ORDER BY TOTAL