CREATE OR ALTER FUNCTION ufn_CalculateFutureValue
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

    RETURN ROUND(@FutureValue, 4);
END


DECLARE @InitialSum DECIMAL(18, 4) = 1000.00;
DECLARE @YearlyInterestRate FLOAT = 0.05; -- 5% годишна лихва
DECLARE @NumberOfYears INT = 5;

SELECT dbo.ufn_CalculateFutureValue(@InitialSum, @YearlyInterestRate, @NumberOfYears) AS FutureValue;
