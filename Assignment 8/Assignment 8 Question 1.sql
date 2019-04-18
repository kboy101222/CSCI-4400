-- Assignment 8 Question 1
-- Kyle George
ALTER PROCEDURE [dbo].[spEmployee_GetByEmpNum]
	@emp_num INT
AS
IF (0 = (SELECT count(*) FROM Employee WHERE emp_num = @emp_num))
BEGIN
	PRINT('ERROR: Employee # does not exist!')
END

ELSE
BEGIN
	SELECT Project.proj_num, Project.proj_name
	FROM Project INNER JOIN Assignment ON Project.proj_num = Assignment.proj_num
	WHERE Assignment.emp_num = @emp_num;
END