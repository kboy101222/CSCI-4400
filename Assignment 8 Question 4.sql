ALTER PROCEDURE dbo.spEmployee_GetWorkOnDate
	@assign_date date
AS
IF (0 = (SELECT count(*) FROM Assignment WHERE assign_date = @assign_date))
BEGIN
	PRINT('There were no assignments on that date!');
END

ELSE
BEGIN
	SELECT Assignment.proj_num, Project.proj_name, Assignment.emp_num, Employee.emp_lname,
	Assignment.assign_hours
	FROM Assignment INNER JOIN Employee ON Assignment.emp_num = Employee.emp_num
	INNER JOIN Project ON Assignment.proj_num = Project.proj_num
	WHERE assign_date = @assign_date
	ORDER BY emp_num ASC
END