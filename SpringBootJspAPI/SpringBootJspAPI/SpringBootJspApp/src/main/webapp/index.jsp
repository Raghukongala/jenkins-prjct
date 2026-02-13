<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
</head>
<body>
	<h1 align="center">Welcome to Spring Boot JSP Application</h1>
	<h3 align="center" style="color: #4CAF50;">Deployed via Jenkins CI/CD Pipeline</h3>
	<div align="center">
		<form action="display">
			<input type="submit" value="Display"/>
		</form>
		<br>
		<a href="studentform"><input type="submit" value="Add Student" /></a>&nbsp;&nbsp;&nbsp;
		<a href="test"><input type="button" value="Test"/></a>
		<a href="hello"><input type="button" value="Hello"/></a>
	</div>
	
</body>
</html>