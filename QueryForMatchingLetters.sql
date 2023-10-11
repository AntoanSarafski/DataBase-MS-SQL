CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(MAX), @word VARCHAR(MAX))
RETURNS BIT
BEGIN
	DECLARE @Count INT = 1;
	
	WHILE (@Count <= LEN(@word))
		BEGIN
			DECLARE @CurrentLetter CHAR(1) = SUBSTRING(@word, @Count,1)
	
			IF(CHARINDEX(@CurrentLetter, @setOfLetters) = 0 )
			RETURN 0
	
			SET @Count += 1
		END
	RETURN 1
END

-- TEST --
SELECT dbo.ufn_IsWordComprised ('oistmiahf', 'zzz')