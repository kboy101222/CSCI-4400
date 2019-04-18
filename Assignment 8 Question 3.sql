CREATE PROCEDURE dbo.spEmployee_JobCode
	@job_code int
AS
IF (0 = (SELECT count(*) FROM Employee WHERE job_code = @job_code))
BEGIN
	PRINT('There are no employees with that job code!');
END

ELSE
BEGIN
	SELECT Employee.emp_num, Employee.emp_fname, Employee.emp_lname, Employee.emp_hiredate, Employee.job_code
	FROM Employee
	WHERE Employee.job_code = @job_code
	ORDER BY Employee.emp_lname, Employee.emp_fname ASC;
END;