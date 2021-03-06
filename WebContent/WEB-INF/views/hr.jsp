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
<h4>Welcome Hr&nbsp;${sessionScope.employee.firstname}&nbsp;${sessionScope.employee.lastname}</h4>
</div>
<br><div align="center"><a href="../action/update">Update Profile</a></div>
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
							<div class="col-sm-7 social-login">
									<div class="clearfix"></div>
									<div class="not-member">
									<br><br>
										<p>Want to add Employee? <a href="../action/register">Add New Employee here</a></p>
									</div>
							</div>
					</div>
					</div></div>
					
					
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
<h3 align="center">List Of Active Employee</h3>
<div class="table-responsive">
	<div class="row">
		<div class="col-sm-12 col-md-12">
			<table class="table">
				<tr>
					<th>Employee Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email Id</th>
					<th>Mobile No</th>
					<th>Date of Birth</th>
					<th>Date of Joining</th>
					<th>Address</th>
					<th>City</th>
					<th>State</th>
					<th>Role</th>
					<th>Country</th>
					<th>Department</th>
					<th>Update</th>
					<th>Change Department</th>
					<th>Remove</th>
				</tr>
				<c:forEach var="employeeList" items="${requestScope.empActiveList}">
					<tr>
						<td>${employeeList.empId}</td>
						<td>${employeeList.firstname}</td>
						<td>${employeeList.lastname}</td>
						<td>${employeeList.emailId}</td>
						<td>${employeeList.mobileNo}</td>
						<td>${employeeList.dateOfBirth}</td>
						<td>${employeeList.dateOfJoining}</td>
						<td>${employeeList.address}</td>
						<td>${employeeList.city}</td>
						<td>${employeeList.state}</td>
						<td>${employeeList.role}</td>
						<td>${employeeList.country}</td>						
						<td>${employeeList.department.deptName}</td>
						<td><a href="<spring:url value='../action/updateEmployeeByHr/${employeeList.empId}'/>">Update Employee</a></td>
						<td><a href="<spring:url value='../action/changeDepartmentByHr/${employeeList.empId}'/>">Change Department</a></td>
						<td><a href="<spring:url value='../action/deleteEmployee/${employeeList.empId}'/>">Remove Employee</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
<br><br>
<br>
<h3 align="center">List Of Inactive Employee</h3>
<div class="table-responsive">
	<div class="row">
		<div class="col-sm-12 col-md-12">
			<table class="table">
				<tr>
					<th>Employee Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email Id</th>
					<th>Mobile No</th>
					<th>Date of Birth</th>
					<th>Date of Joining</th>
					<th>Address</th>
					<th>City</th>
					<th>State</th>
					<th>Role</th>
					<th>Country</th>
					<th>Department</th>
					<th>Update</th>
					<th>Change Department</th>
					<th>ReJoin</th>
				</tr>
				<c:forEach var="employeeList" items="${requestScope.empInactiveList}">
					<tr>
						<td>${employeeList.empId}</td>
						<td>${employeeList.firstname}</td>
						<td>${employeeList.lastname}</td>
						<td>${employeeList.emailId}</td>
						<td>${employeeList.mobileNo}</td>
						<td>${employeeList.dateOfBirth}</td>
						<td>${employeeList.dateOfJoining}</td>
						<td>${employeeList.address}</td>
						<td>${employeeList.city}</td>
						<td>${employeeList.state}</td>
						<td>${employeeList.role}</td>
						<td>${employeeList.country}</td>						
						<td>${employeeList.department.deptName}</td>
						<td><a href="<spring:url value='../action/updateEmployeeByHr/${employeeList.empId}'/>">Update Employee</a></td>
						<td><a href="<spring:url value='../action/changeDepartmentByHr/${employeeList.empId}'/>">Change Department</a></td>						
						<td><a href="<spring:url value='../action/activateEmployee/${employeeList.empId}'/>">Activate Employee</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
<br><br>
<%@ include file="footer.jsp" %>
</body>
</html>