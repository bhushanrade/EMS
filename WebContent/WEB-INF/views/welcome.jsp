<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="description" content="">
    <meta name="viewport" content="width=device-width">
	<title>EMS</title>

</head>
<body>
<c:if test="${empty sessionScope.employee }">
<%
	response.sendRedirect("../employee/login");
%>
</c:if>
<%@ include file="header.jsp" %>
<br><br><br>

<div align="center">
<h4>Welcome&nbsp;${sessionScope.employee.firstname}&nbsp;${sessionScope.employee.lastname}</h4>
</div>
<br><div align="center"><a href="../employee/update">Update Profile</a></div><br>
<div class="section">
	    	<div class="container">
				<div class="row">
					<div class="col-sm-5">
						<div class="basic-login" >
							<form:form action="searchEmployeeByEmail" method="post">
							<div class="form-group">
					        		<label for="login-username"><i class="icon-user"></i> <b>Email Id</b></label>
					        		<input name="emailId" class="form-control" required="required" placeholder="email id" />
					        </div>
					        
							<div class="form-group">
									<br>
									<button type="submit" class="btn pull-right">Search Employee</button>
									<div class="clearfix"></div>
							</div>
							<div class="error">${requestScope.email}&nbsp;&nbsp;${requestScope.msg}</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
</div>
<br>
<div class="table-responsive">
	<div class="row">
		<div class="col-sm-12 col-md-12">
			<table class="table">
				<tr bordercolor="blue">
					<th>Employee Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Mobile No</th>
					<th>Email</th>
					<th>Department</th>
				</tr>
				
					<tr>
						<td>${requestScope.searchEmployee.empId}</td>
						<td>${requestScope.searchEmployee.firstname}</td>
						<td>${requestScope.searchEmployee.lastname}</td>
						<td>${requestScope.searchEmployee.mobileNo}</td>
						<td>${requestScope.searchEmployee.emailId}</td>
						<td>${requestScope.searchEmployee.department.deptName}</td>
					</tr>
			</table>
		</div>
	</div>
</div>
<br>

<br><br>
<%@ include file="footer.jsp" %>
</body>
</html>