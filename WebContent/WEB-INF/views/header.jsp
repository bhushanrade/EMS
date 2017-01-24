<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="description" content="">
    <meta name="viewport" content="width=device-width">
	<title>EMS</title>
	<link href="<c:url value="/resource/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value="/resource/css/icomoon-social.css" />" rel='stylesheet' type='text/css'>
		<link href="<c:url value="/resource/css/leaflet.ie.css"/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value="/resource/css/main.css" />" rel='stylesheet' type='text/css'>
		<link href="/resource/js/themes/5/js-image-slider.css" rel="stylesheet" type="text/css" />
    	<link href="/resource/css/generic.css" rel="stylesheet" type="text/css" />
        <!-- Javascripts -->
        <script src="<c:url value="/resource/js/modernizr-2.6.2-respond-1.1.0.min.js" />"></script>
        <script src="<c:url value="/resource/js/jquery-1.9.1.min.js" />"></script>
  
		<script src="<c:url value="/resource/js/bootstrap.min.js" />"></script>
		<script src="<c:url value="/resource/http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.js" />"></script>
		<script src="<c:url value="/resource/js/jquery.fitvids.js" />"></script>
		<script src="<c:url value="/resource/js/jquery.sequence-min.js" />"></script>
		<script src="<c:url value="/resource/js/jquery.bxslider.js" />"></script>
		<script src="<c:url value="/resource/js/main-menu.js" />"></script>
		<script src="<c:url value="/resource/js/jquery.min.js" />"></script>
		<script src="<c:url value="/resource/js/jquery.min.js" />"></script>
		<script src="<c:url value="/resource/js/template.js" />"></script>
		<script src="<c:url value="/resource/themes/5/js-image-slider.js" />"></script>
</head>
<body>
    
 <div class="mainmenu-wrapper">
	        <div class="container">
		        <div class="navbar-header">
		         	<button type="button" id="abc" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            			<span class="icon-bar"></span>
           				<span class="icon-bar"></span>
            			<span class="icon-bar"></span>
          			</button>
          			<a href="aboutus"><img src="<c:url value="/resource/img/atos2.PNG"/>" alt="EMS" style="height : 51px; width : 156px;"></a>
          			</div>
          			
					
					<div id="navbarCollapse" class="collapse navbar-collapse">
				        <ul class="nav navbar-nav">
				            <li class="active"><a href="../employee/login">Home</a></li>
						<li><a href="../employee/contact">Contact Us</a></li>
						<li><a href="../employee/aboutus">About Us</a></li>
				        </ul>
				        <ul class="nav navbar-nav navbar-right">
				        <c:if test="${not empty sessionScope.employee }">
				        	<li><a href="#">Welcome:${sessionScope.employee.firstname }&nbsp;${sessionScope.employee.lastname }&nbsp;</a></li>
				            <li><a href="logout">Signout</a></li>
						</c:if>
				        </ul>
				    </div>
					</div>
			</div>

</body>
</html>