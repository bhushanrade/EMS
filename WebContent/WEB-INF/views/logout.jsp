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
	<link href="<c:url value="/resource/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value="/resource/css/icomoon-social.css" />" rel='stylesheet' type='text/css'>
		<link href="<c:url value="/resource/css/leaflet.ie.css"/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value="/resource/css/main.css" />" rel='stylesheet' type='text/css'>
		
        <!-- Javascripts -->
        <script src="<c:url value="/resource/js/modernizr-2.6.2-respond-1.1.0.min.js" />"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-1.9.1.min.js"><\/script>')</script>
  
		<script src="<c:url value="/resource/js/bootstrap.min.js" />"></script>
		<script src="<c:url value="/resource/http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.js" />"></script>
		<script src="<c:url value="/resource/js/jquery.fitvids.js" />"></script>
		<script src="<c:url value="/resource/js/jquery.sequence-min.js" />"></script>
		<script src="<c:url value="/resource/js/jquery.bxslider.js" />"></script>
		<script src="<c:url value="/resource/js/main-menu.js" />"></script>
		<script src="<c:url value="/resource/js/jquery.min.js" />"></script>
		<script src="<c:url value="/resource/js/jquery.min.js" />"></script>
		<script src="<c:url value="/resource/js/template.js" />"></script>
</head>
<body>
<br><br><br><br><br>

<div align="center">
<h4>
Hello , ${requestScope.valid_employee.firstname}
</h4>
	You have logged out successfully...You will be automatically taken to home
	page shortly...
</div>
<%
	response.sendRedirect("/employee/login");
%>
</body>
</html>