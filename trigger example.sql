-- Declare you are making a trigger
CREATE TRIGGER
-- Database you are adding the trigger to
ON Product
-- What functions to trigger on
FOR INSERT, UPDATE
AS
-- Declaring variables
DECLARE @v1 decimal(8,2)
DECLARE @v2 decimal(8,2)
-- Select to use variables
SELECT @v1 = inserted.p_discount FROM inserted
SELECT @v2 = inserted.p_price FROM inserted 
-- IF condition
if @v1 > 0.50 * @v2 
-- Begin function
begin
   rollback transaction
   RAISERROR ('Discount Must Be Less Than 50 Percent Of The Price', 16, 10)
end