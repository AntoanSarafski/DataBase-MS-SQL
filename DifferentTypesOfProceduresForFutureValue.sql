ALTER FUNCTION ufn_CalculateFutureValue
(
    @InitialSum DECIMAL(18, 4),
    @YearlyInterestRate FLOAT,
    @NumberOfYears INT
)
RETURNS DECIMAL(18, 4)
AS
BEGIN
    DECLARE @FutureValue DECIMAL(18, 4);

    SET @FutureValue = @InitialSum * POWER(1 + @YearlyInterestRate, @NumberOfYears);

    RETURN @FutureValue;
END


DECLARE @InitialSum DECIMAL(18, 4) = 1000.00;
DECLARE @YearlyInterestRate FLOAT = 0.1; -- 10% годишна лихва
DECLARE @NumberOfYears INT = 5;

SELECT dbo.ufn_CalculateFutureValue(@InitialSum, @YearlyInterestRate, @NumberOfYears) AS FutureValue;


-- EVERY SINGLE ACCOUNT FUTURE BALANCE ---


CREATE PROCEDURE usp_CalculateFutureValueForAccount (@AccId INT, @IntRate FLOAT)
AS
SELECT ac.Id AS [Account Id],
	   ah.FirstName AS [First Name],
	   ah.LastName AS [Last Name],
	   ac.Balance AS [Current Balance],
	   dbo.ufn_CalculateFutureValue(ac.Balance, @IntRate, 5) AS [Balance in 5 years]
	   
  FROM AccountHolders AS ah
  JOIN Accounts AS ac ON ac.AccountHolderId = ah.Id
 WHERE ac.Id = @AccId

 -- WITH GROUP BY --

CREATE OR ALTER PROC usp_CalculateFutureValueForAccount (@AccId INT, @IntRate DECIMAL (15,2))
AS
SELECT ah.Id AS [Account Id],
	   ah.FirstName AS [First Name],
	   ah.LastName AS [Last Name],
	   ac.Balance AS [Current Balance],
	   dbo.ufn_CalculateFutureValue(ac.Balance, @IntRate, 5) AS [Balance in 5 years]
	   
     FROM AccountHolders AS ah
     JOIN Accounts AS ac ON ac.AccountHolderId = @AccId
    WHERE ac.Id = @AccId
 GROUP BY ah.Id, ah.FirstName, ah.LastName



EXEC usp_CalculateFutureValueForAccount 1, 0.1  


SELECT *
  FROM Accounts AS ac
  JOIN AccountHolders AS ah ON ah.Id = ac.AccountHolderId