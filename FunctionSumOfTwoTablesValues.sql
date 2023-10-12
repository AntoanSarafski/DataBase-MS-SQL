CREATE OR ALTER FUNCTION udf_GetCost(@JobId INT)
RETURNS DECIMAL (15, 2)
AS
BEGIN
	DECLARE @TotalCost DECIMAL(15,2) = 0;

	SELECT @TotalCost = ISNULL(SUM(p.Price * op.Quantity), 0)
	  FROM OrderParts AS op
	  JOIN Parts AS p ON p.PartId = op.PartId
	  JOIN Orders AS o ON o.OrderId = op.OrderId
	  WHERE o.JobID = @JobId;

	  RETURN @TotalCost;
END


SELECT dbo.udf_GetCost(1)
