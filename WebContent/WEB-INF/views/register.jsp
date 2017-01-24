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
						<h1>Register User</h1>
					</div>
				</div>
			</div>
		</div>
        
        <div class="section">
	    	<div class="container">
				<div class="row">
					<div class="col-sm-5">
						<div class="basic-login">
							<form:form modelAttribute="registerModel" method="post" role="form" >
								<div class="form-group">
		        				 	<label for="login-username"><i class="icon-user"></i> <b>First Name</b></label>
		        				 	<input name="firstname" class="form-control" required="required" placeholder="first name" />
		        				 
								</div>
								<div class="form-group">
		        				 	<label for="login-username"><i class="icon-user"></i> <b>Last Name</b></label>
		        				 	<input name="lastname" class="form-control" required="required" placeholder="last name" />
		        				 	
								</div>
								<div class="form-group">
		        				 	<label for="login-username"><i class="icon-user"></i> <b>Email Id</b></label>
		        				 	<input name="emailId" class="form-control" required="required" placeholder="email id" />
		        				 	
								</div>
								<div class="form-group">
		        				 	<label for="login-username"><i class="icon-user"></i> <b>Mobile No</b></label>
		        				 	<input name="mobileNo" class="form-control" required="required" placeholder="mobile no" />
		        				 
								</div>
								<div class="form-group">
		        				 	<label for="login-username"><i class="icon-user"></i> <b>Gender</b></label>
									<input  type="radio" name="gender" value="Male" checked> Male
									<input  type="radio" name="gender" value="Female"> Female
								</div>
								<div class="form-group">
		        				 	<label for="login-username"><i class="icon-user"></i> <b>Date of Birth(dd/mm/yyyy)</b></label>
		        				 	<input type="date" name="dateOfBirth" class="form-control" required="required" placeholder="date of birth" />		        				 
								</div>
								<div class="form-group">
		        				 	<label for="login-username"><i class="icon-user"></i> <b>Date of Joining(dd/mm/yyyy)</b></label>
		        				 	<input type="date" name="dateOfJoining" class="form-control" required="required" placeholder="date of joining" />
		        				 
								</div>
							
								 <div class="form-group">
					        		<label for="login-password"><i class="icon-lock"></i> <b>Password</b></label>
									<input type="password" name="password" class="form-control" required="required" placeholder="password" />
							</div>
							<div class="form-group">
					        		<label for="login-password"><i class="icon-lock"></i> <b>Confirm Password</b></label>
									<input type="password" name="confirmPassword" class="form-control" required="required" placeholder="confirm password" />
							</div>
							<div class="form-group">
							<label for="login-username"><i class="icon-user"></i> <b>Department</b></label>
							<form:select  path="Department.deptId" items="${requestScope.selectDeptModel }" itemLabel="deptName" itemValue="deptId" class="form-control" />
							</div>
							<div class="form-group">
		        				 	<label for="login-username"><i class="icon-user"></i> <b>Address</b></label>
		        				 	<input name="address" class="form-control" required="required" placeholder="address" />
		        				 
								</div>
							<div class="fprm-group" >
							<label for="login-username"><i class="icon-user"></i> <b>Role</b></label>
									<select name="role" class="form-control">
										<option selected="Trainee" value="Trainee">Trainee</option>
										<option value="Hr">Hr</option>
										<option value="Manager">Manager</option>
										<option value="Trainee">Trainee</option>
									</select>
							</div>
								
							<div class="fprm-group" >
							<label for="login-username"><i class="icon-user"></i> <b>City</b></label>
									<select name="city" class="form-control">
										<option selected="Delhi" value="Delhi">Delhi</option>
										<option value="Delhi">Delhi</option>
										<option value="Pune">Pune</option>
										<option value="Mumbai">Mumbai</option>
										<option value="Meerut">Meerut</option>
										<option value="Ballia">Ballia</option>
										<option value="Assam">Assam</option>
									</select>
							</div>
							
							<div class="fprm-group">
							<label for="login-username"><i class="icon-user"></i> <b>State</b></label>
									<select name="state" class="form-control">
										<option selected="Uttar Pradesh" value="Uttar Pradesh">Uttar Pradesh</option>
										<option value="Maharastra">Maharastra</option>
										<option value="Delhi">Delhi</option>
										<option value="Assam">Assam</option>
										<option value="Gujrat">Gujrat</option>
										<option value="Madhya Pradesh">Madhya Pradesh</option>
									</select>
							</div>
							<div class="fprm-group">
							<label for="login-username"><i class="icon-user"></i> <b>Country</b></label>
									<select name="country" class="form-control">
										<option selected="India" value="India">India</option>
										<option value="Australia">Australia</option>
										<option value="Canada">Canada</option>
										<option value="India">India</option>
										<option value="Russia">Russia</option>
										<option value="USA">USA</option>
									</select>
							</div>
								<div class="form-group">
		        				 	<label for="login-username"><i class="icon-user"></i> <b>Security Question</b></label>
		        				 	<input name="securityQuestion" class="form-control" required="required" placeholder="security question" />
		        				 	
								</div>
								<div class="form-group">
		        				 	<label for="login-username"><i class="icon-user"></i> <b>Security Answer</b></label>
		        				 	<input name="securityAnswer" class="form-control" required="required" placeholder="security answer" />
								</div>
								<div class="form-group">
									<br>
									<button type="submit" class="btn pull-right">Sign Up</button>
									<div class="clearfix"></div>
								</div>
								
							</form:form>
						</div>
					</div>
					<div class="col-sm-7 social-login">
									<br><br><br>
									<br><br><br>
									<br><br><br>
									<div class="clearfix"></div>
									<div class="not-member">
									<center><img src="<c:url value="/resource/img/login_icon.png"/>" alt="Author 3"></center>
										<p>Already a member? <a href="login">Login here</a></p>
									</div>
								</div>
				</div>
			</div>
		</div>
<%@ include file="footer.jsp" %>
</body>
</html>