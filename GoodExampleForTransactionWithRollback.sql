
CREATE PROC usp_TransferFunds (
   @FromAccountId INT, @ToAccountId INT, @Ammount MONEY)
AS
BEGIN TRANSACTION
	IF (SELECT Balance FROM Accounts WHERE Id = @FromAccountId) < @Ammount
	BEGIN
		ROLLBACK;
		THROW 50001, 'Insufficient funds', 1;
	END

	IF NOT EXISTS (SELECT * FROM Accounts WHERE Id = @FromAccountId)
	BEGIN
		ROLLBACK;
		THROW 50002, '@FromAccount does not exist', 1
	END

	IF NOT EXISTS (SELECT * FROM Accounts WHERE Id = @ToAccountId)
	BEGIN
		ROLLBACK;
		THROW 50002, '@ToAccount does not exist', 1
	END


	UPDATE Accounts SET Balance -= @Ammount WHERE Id = @FromAccountId
	UPDATE Accounts SET Balance += @Ammount WHERE Id = @ToAccountId
	COMMIT
GO


-- test -

EXEC dbo.usp_TransferFunds 1, 11, 100

SELECT *
 FROM Accounts
 JOIN AccountHolders AS ah ON ah.Id = AccountHolderId	