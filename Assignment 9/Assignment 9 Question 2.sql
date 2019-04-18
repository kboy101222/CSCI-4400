-- Assignment 9 Question 2
-- Kyle George
CREATE TRIGGER TRIGGERTWO
ON Assignment
FOR INSERT, UPDATE
AS
declare @charge money
select @charge = inserted.ASSIGN_CHG_HOUR from inserted
IF @charge < 42.00 OR @charge > 142.00
BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('Charge per hour must be at least $42.00 and no more than $142.00', 16, 10)
END