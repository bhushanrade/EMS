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
<%@ include file="header.jsp" %>
 <!-- Page Title -->
		<div class="section section-breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1>Change Employee Department</h1>
					</div>
				</div>
			</div>
		</div>
        
        <div class="section">
	    	<div class="container">
				<div class="row">
					<div class="col-sm-5">
						<div class="basic-login">
							<form:form modelAttribute="changeDeptByhr" method="post" role="form" >
								<div class="form-group">
		        				 	<label for="login-username"><i class="icon-user"></i> <b>Employee Id</b></label>
		        				 	<form:input path="empId" class="form-control" required="required" placeholder="employee id" readonly="true" />
		        				 
								</div>
								<div class="form-group">
		        				 	<label for="login-username"><i class="icon-user"></i> <b>First Name</b></label>
		        				 	<form:input path="firstname" class="form-control" required="required" placeholder="first name" />
		        				 
								</div>
								<div class="form-group">
		        				 	<label for="login-username"><i class="icon-user"></i> <b>Last Name</b></label>
		        				 	<form:input path="lastname" class="form-control" required="required" placeholder="last name" />
		        				 	
								</div>
							
								<div class="form-group">
							<label for="login-username"><i class="icon-user"></i> <b>Department</b></label>
							<form:select  path="Department.deptId" items="${requestScope.selectDeptModel }" itemLabel="deptName" itemValue="deptId" class="form-control" />
							</div>

								<div class="form-group">
									<br>
									<button type="submit" class="btn pull-right">Change Department</button>
									<div class="clearfix"></div>
								</div>
								
							</form:form>
						</div>
				</div>
			</div>
		</div>
		</div>
<%@ include file="footer.jsp" %>
</body>
</html>