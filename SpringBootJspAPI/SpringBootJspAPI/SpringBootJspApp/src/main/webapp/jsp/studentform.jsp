<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center" style="color: #2196F3;">Add New Employee</h1>
	<h3 align="center" style="color: #666;">Fill in the employee details below</h3>
	<form method="post" action="save">
		${message}<br>
		<br>

		<table align="center" border="1" cellpadding="10" style="border-collapse: collapse; border-color: #ddd;">
			<tr style="background-color: #f2f2f2;">
				<td><strong>Employee ID:</strong></td>
				<td><input type="text" name="htno" required style="padding: 5px; width: 200px;" /></td>
			</tr>

             <tr>
				  <td><strong>Office Name:</strong></td>
				  <td><input type="text" name="office-name" required style="padding: 5px; width: 200px;" /></td>
			</tr>

			<tr style="background-color: #f2f2f2;">
				<td><strong>Full Name:</strong></td>
				<td><input type="text" name="name" required style="padding: 5px; width: 200px;" /></td>
			</tr>
			<tr>
				<td><strong>Department Code:</strong></td>
				<td><input type="text" name="collegecode" required style="padding: 5px; width: 200px;" /></td>
			</tr>
			<tr style="background-color: #f2f2f2;">
				<td><strong>Branch Code:</strong></td>
				<td><input type="text" name="branchcode" required style="padding: 5px; width: 200px;" /></td>
			</tr>
			<tr>
				<td></td>
				<td><br>
				<input type="submit" value="Save Employee" style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; cursor: pointer;" />&nbsp;&nbsp; 
				<a href="viewstudent"><input type="button" value="View All Employees" style="background-color: #2196F3; color: white; padding: 10px 20px; border: none; cursor: pointer;" /></a>
				<a href="index.jsp"><input type="button" value="Home" style="background-color: #f44336; color: white; padding: 10px 20px; border: none; cursor: pointer;" /></a>&nbsp;&nbsp;</td>
			</tr>
		</table>
	</form>
</body>
</html>
