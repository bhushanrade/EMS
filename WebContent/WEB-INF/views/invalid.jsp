<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>EMS</title>
</head>
<body>
<%@ include file="header.jsp" %>
<br><br><br><br><br>
<div align="center"><br><h3>${requestScope.invalid_employee.emailId} is an invalid user</h3><br></div>
<br><br>
<div align="center"><br><br>
					<p><a href="login" class="btn" >Back to Home</a></p></div>
				


<br><br><br><br><br><br>
<br><br><br><br>
<%@ include file="footer.jsp" %>
</body>
</html>