-- Assignment 9 Question 1
-- Kyle George
ALTER TRIGGER TRIGGERONE
ON Assignment
FOR UPDATE, INSERT
AS
declare @hours decimal(8,2)
select @hours = inserted.ASSIGN_HOURS from inserted
IF @hours < 0.25 OR @hours > 10
BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('Invalid hours for inserted assignment', 16, 10)
END;