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
					<div class="col-md-6">
						<h1>Contact Us</h1>
					</div>
				</div>
			</div>
		</div>
        <br>
        <div class="section">
	    	<div class="container">
	        	<div class="row">
	        		<div class="col-sm-7">
	        			<!-- Map -->
	        			<div id="contact-us-map">
							<img src="<c:url value="/resource/img/atos.jpg"  />" width="100%" height="100%" alt="Author 1">
	        			</div>
	        			<!-- End Map -->
	        			<!-- Contact Info -->
	        			<p class="contact-us-details">
	        				<b>Address:</b> Embassy Tech Zone, Block 1.6
											Rajiv Gandhi InfoTech Park, MIDC-Phase II
											Hinjewadi, Pune: 411057
											Maharashtra, India<br/>
	        				<b>Phone:</b>(020) 6798 - 8000/9000<br/>
	        				<b>Fax :</b>Fax- (020) 6798 - 8080<br/>
	        				<b>Email:</b> <a href="https://atos.net/en/about-us">https://atos.net/en/about-us</a>
	        			</p>


 
	        			<!-- End Contact Info -->
	        		</div>
		        		</div>
		        		<!-- End Contact Info -->
	        		</div>
	        	</div>

<%@ include file="footer.jsp" %>

</body>
</html>