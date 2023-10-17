CREATE OR ALTER FUNCTION udf_CreatorWithBoardgames(@name VARCHAR(30)) 
RETURNS INT
AS
BEGIN
	DECLARE @Result INT;
	SELECT @Result = COUNT(*)
	 FROM CreatorsBoardgames AS cb
	 JOIN Creators AS c ON c.Id = cb.CreatorId
	 WHERE c.FirstName = @name
	 GROUP BY c.Id

	 RETURN @Result;
END

SELECT dbo.udf_CreatorWithBoardgames('bruno') 
