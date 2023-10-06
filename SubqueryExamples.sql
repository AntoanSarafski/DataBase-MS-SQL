WITH CountryStats AS (
    SELECT
        c.CountryName,
        MAX(p.Elevation) AS HighestPeakElevation,
        MAX(r.Length) AS LongestRiverLength
    FROM Countries AS c
    LEFT JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
    LEFT JOIN Mountains AS m ON m.Id = mc.MountainId
    LEFT JOIN Peaks AS p ON p.MountainId = m.Id
    LEFT JOIN CountriesRivers AS cr ON cr.CountryCode = c.CountryCode
    LEFT JOIN Rivers AS r ON r.Id = cr.RiverId
    GROUP BY c.CountryName
)
SELECT 
    CountryName,
    HighestPeakElevation,
    LongestRiverLength
FROM CountryStats
ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, CountryName

GO

WITH HighestPeaks AS (
    SELECT
        c.CountryName,
        p.PeakName AS HighestPeakName,
        p.Elevation AS HighestPeakElevation,
        m.MountainRange AS MountainName
    FROM Countries AS c
    LEFT JOIN MountainsCountries AS mc ON mc.CountryCode = c.CountryCode
    LEFT JOIN Mountains AS m ON m.Id = mc.MountainId
    LEFT JOIN Peaks AS p ON p.MountainId = m.Id
    WHERE p.Elevation = (
        SELECT MAX(p2.Elevation)
        FROM MountainsCountries AS mc2
        LEFT JOIN Mountains AS m2 ON m2.Id = mc2.MountainId
        LEFT JOIN Peaks AS p2 ON p2.MountainId = m2.Id
        WHERE mc2.CountryCode = c.CountryCode
    )
)
SELECT
    c.CountryName AS [Country],
    COALESCE(HighestPeakName, '(no highest peak)') AS [Highest Peak Name],
    COALESCE(HighestPeakElevation, 0) AS [Highest Peak Elevation],
    COALESCE(MountainName, '(no mountain)') AS Mountain
FROM Countries AS c
LEFT JOIN HighestPeaks AS hp ON c.CountryName = hp.CountryName
ORDER BY c.CountryName,hp.HighestPeakName
