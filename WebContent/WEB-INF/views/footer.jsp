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

	    <!-- Footer -->
	    <div class="footer">
	    	<div class="container">
		    	<div class="row">
		    		<div class="col-footer col-md-3 col-xs-6">
		    			<h3>Our Latest Work</h3>
		    			<div class="portfolio-item">
							<div class="portfolio-image">
								<a href="aboutus"><img src="<c:url value="/resource/img/atosrio.jpg"/>" alt="BookMyShow"></a>
							</div>
						</div>
		    		</div>

		    		
		    		<div class="col-footer col-md-4 col-xs-6">
		    			<h3>Contacts</h3>
		    			<p class="contact-us-details">
	        				<b>Address:</b> Hinjewadi Phase II, Hinjawadi, Marunji, Pune, Maharashtra 411033<br/>
	        				<b>Phone:</b> 020 6798 8000<br/>
	        				<b>Email:</b> <a href="https://atos.net/en/about-us">https://atos.net/en/about-us</a></p>
		    		</div>
		    		<div class="col-footer col-md-2 col-xs-6">
		    			<h3>Stay Connected</h3>
		    			<ul class="footer-stay-connected no-list-style">
		    				<li><a href="https://www.facebook.com/Atos/" class="facebook"></a></li>
		    				<li><a href="https://twitter.com/atos" class="twitter"></a></li>
		    				<li><a href="https://plus.google.com/+Atos" class="googleplus"></a></li>
		    			</ul>
		    		</div>
		    	</div>
		    	<div class="row">
		    		<div class="col-md-12">
		    			<div class="footer-copyright">&copy; 2016 Atos. All rights reserved.</div>
		    		</div>
		    	</div>
		    </div>
	    </div>
</body>
</html>