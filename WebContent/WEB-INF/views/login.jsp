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
						<h1>Login</h1>
					</div>
				</div>
			</div>
		</div>
        <br><br><br><br>
        <div class="section">
	    	<div class="container">
				<div class="row">
					<div class="col-sm-5">
						<div class="basic-login">
							<form:form modelAttribute="loginmodel" method="post">
							<div class="form-group">
					        		<label for="login-username"><i class="icon-user"></i> <b>Email Id</b></label>
					        		<input name="emailId" class="form-control" required="required" placeholder="email id" />
					        </div>
					        <div class="form-group">
					        		<label for="login-password"><i class="icon-lock"></i> <b>Password</b></label>
									<input type="password" name="password" class="form-control" required="required" placeholder="password" />
							</div>
							<div class="form-group">
							<a href="forgot" class="forgot-password">Forgot password?</a>
									<br>
									<button type="submit" class="btn pull-right">Log In</button>
									<div class="clearfix"></div>
							</div>
							</form:form>
						</div>
					</div>
					<div class="col-sm-7 social-login">
									<div class="clearfix"></div>
									<div class="not-member">
									<center><img src="<c:url value="/resource/img/login_icon.png"/>" alt="Author 3"></center>
										<p>Employee Management Portal </p>
									</div>
								</div>
				</div>
				</div>
			</div>
		</div>
		<br>
<%@ include file="footer.jsp" %>
</body>
</html>