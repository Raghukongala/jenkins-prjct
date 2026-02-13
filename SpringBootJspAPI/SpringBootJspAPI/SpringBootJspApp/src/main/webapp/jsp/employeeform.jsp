<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Form</title>
</head>
<body>
	<h1 align="center">Add New Employee</h1>
	<form method="post" action="save">
		${message}<br>
		<br>

		<table align="center">
			<tr>
				<td>Employee ID :</td>
				<td><input type="text" name="empId" /></td>
			</tr>

			<tr>
				<td>Name :</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>Father Name :</td>
				<td><input type="text" name="fatherName" /></td>
			</tr>
			<tr>
				<td>Department :</td>
				<td><input type="text" name="department" /></td>
			</tr>
			<tr>
				<td>Salary :</td>
				<td><input type="text" name="salary" required /></td>
			</tr>
			<tr>
				<td></td>
				<td><br>
				<input type="submit" value="Save" />&nbsp;&nbsp; <a
					href="viewemployee"><input type="button" value="View Employees" /></a>
					<a href="index.jsp"><input type="button" value="home" /></a>&nbsp;&nbsp;</td>
			</tr>
		</table>
	</form>
</body>
</html>
