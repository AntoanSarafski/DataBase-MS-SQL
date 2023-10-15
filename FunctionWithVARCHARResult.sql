CREATE OR ALTER FUNCTION udf_GetAvailableRoom(@HotelId INT,
@Date DATE, @People INT)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	
DECLARE @Result NVARCHAR(MAX);

    SELECT TOP 1 @Result = 'Room ' + CAST(r.Id AS NVARCHAR(10)) + ': ' + r.Type + ' (' + CAST(r.Beds AS NVARCHAR(10)) + ' beds) - $' + CAST((r.Price + h.BaseRate) * @People AS NVARCHAR(20))
 FROM Rooms AS r
 JOIN Hotels AS h ON h.Id = @HotelId
 WHERE r.Beds >= @People AND r.HotelId = @HotelId AND 
	NOT EXISTS(SELECT * FROM Trips t WHERE t.RoomId = r.Id 
	AND t.CancelDate IS NULL
	AND @Date BETWEEN ArrivalDate AND ReturnDate )
 ORDER BY (BaseRate + r.Price) * @People DESC

 IF (@Result IS NULL) 
 BEGIN
	RETURN 'No rooms available'
 END
 RETURN @Result;
END
GO




SELECT dbo.udf_GetAvailableRoom(94, '2015-07-26', 3)

