-- Assignment 9 Question 3
-- Kyle George
ALTER TRIGGER TRIGGERTHREE
ON Project
FOR INSERT, UPDATE
AS
declare @name varchar(50)
select @name = inserted.PROJ_NAME from inserted
IF SUBSTRING(@name, 1, 1) != 'P' OR SUBSTRING(@name, 2, 2) < 0 OR SUBSTRING(@name, 2, 2) > 49
BEGIN
	ROLLBACK TRANSACTION
	RAISERROR('Project name must begin with "P" and be followed by digits in the range of 00 to 49', 16, 10)
END