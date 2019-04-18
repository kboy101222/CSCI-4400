ALTER PROCEDURE dbo.spAssignment_GetEmployees
	@proj_num int,
	@assign_date date
AS
IF (0 = (SELECT count(*) FROM Assignment WHERE assign_date = @assign_date AND proj_num = @proj_num))
BEGIN
	PRINT('No employees assigned to that project on that date!');
END

ELSE
BEGIN
	SELECT Employee.emp_num, Employee.emp_fname, Employee.emp_lname
	FROM Employee INNER JOIN Assignment ON Employee.emp_num = Assignment.emp_num
	WHERE assign_date = @assign_date AND proj_num = @proj_num;
END