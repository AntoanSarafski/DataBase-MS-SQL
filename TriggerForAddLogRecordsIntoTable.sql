     -- TRIGGER THAT MAKE TABLE WITH LOG RECORDS FOR US --


CREATE OR ALTER TRIGGER tr_OnAccountChangeAddLogRecord
ON Accounts FOR UPDATE
AS
	INSERT AccountChanges (AccountId, OldBalance, NewBalance, DateOfChange)
	SELECT i.Id, d.balance, i.balance, GETDATE() FROM inserted i
	JOIN deleted d ON i.Id = d.Id
GO

