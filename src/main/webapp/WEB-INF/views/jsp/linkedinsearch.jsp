<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Applicant tracking system</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		
		 
		 <spring:url value="/resources/core/js/jquery.min.js" var="jqueryJs" />
		 <spring:url value="/resources/core/js/skel.min.js" var="skelJs" />
		 <spring:url value="/resources/core/js/skel-layers.min.js" var="skelLayerJs" />
		 <spring:url value="/resources/core/js/init.js" var="initJs" />
		 <spring:url value="/resources/core/js/jquery-ui.js" var="uiJs" />
		 
		 
		 <script src="${jqueryJs}"></script>
		 <script src="${skelJs}"></script>
		 <script src="${skelLayerJs}"></script>
		 <script src="${initJs}"></script>
		 <script src="${uiJs}"></script>

        <spring:url value="/resources/core/css/jquery-ui.css" var="uiCss"/>
        <spring:url value="/resources/core/css/skel.css" var="skelCss"/>
		<spring:url value="/resources/core/css/style.css" var="styleCss"/>
		<spring:url value="/resources/core/css/style-xlarge.css" var="xlargeCss"/>
		
		<link href="${uiCss}" rel="stylesheet" />
		<link href="${skelCss}" rel="stylesheet" />
		<link href="${styleCss}" rel="stylesheet" />
		<link href="${xlargeCss}" rel="stylesheet" />
		
<script type='text/javascript'>

$(document).ready(function() {
	
	$("#search").click(function(){
		var skill = $('#skills').val();
		$.ajax({url: "${pageContext.request.contextPath}/rest/searchlinkedin/"+ skill, async: false, success: function(result){
			 $('#searchrequest').html(result);
		}});
	});
});

</script>
		
	</head>
	<body>

		<!-- Header -->
			<header id="header">
				<h1><a href="${pageContext.request.contextPath}">ATS Logo</a></h1>
				<nav id="nav">
					<ul>
						<li><a href="${pageContext.request.contextPath}/home">Back</a></li>
					</ul>
				</nav>
			</header>

		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="container">
                <strong>${message}</strong>
					<header class="major">
						<h2>Search LinkedIn</h2>
						<p>Search profiles in LinkedIn.</p>
					</header>

					<form id="myForm">
					<p><b>Technical skills:</b>(Put comma separated values)
					<input type="text" id="skills"/></p>
					<div class="table-wrapper" id="searchrequest">
					</div>
					<p><input type="button" value="Search LinkedIn" class="button big" id="search"></p>
					</form>
				</div>
				</section>
		<!-- Footer -->
			<footer id="footer">
				<div class="container">
					<section class="links">
						<div class="row">
							<section class="3u 6u(medium) 12u$(small)">
								<h3>Information</h3>
								<ul class="unstyled">
									<li><a href="#">Information</a></li>
								</ul>
							</section>
							<section class="3u 6u$(medium) 12u$(small)">
								<h3>Information</h3>
								<ul class="unstyled">
									<li><a href="#">Information</a></li>
									
								</ul>
							</section>
							<section class="3u 6u(medium) 12u$(small)">
								<h3>Information</h3>
								<ul class="unstyled">
									<li><a href="#">Information</a></li>
								</ul>
							</section>
							<section class="3u$ 6u$(medium) 12u$(small)">
								<h3>Information</h3>
								<ul class="unstyled">
									<li><a href="#">Information</a></li>
								</ul>
							</section>
						</div>
					</section>
					<div class="row">
						<div class="8u 12u$(medium)">
							<ul class="copyright">
								<li>&copy; Untitled. All rights reserved.</li>
								<li>Design: <a href="http://templated.co">TEMPLATED</a></li>
								<li>Images: <a href="http://unsplash.com">Unsplash</a></li>
							</ul>
						</div>
						<div class="4u$ 12u$(medium)">
							<ul class="icons">
								<li>
									<a class="icon rounded fa-facebook"><span class="label">Facebook</span></a>
								</li>
								<li>
									<a class="icon rounded fa-twitter"><span class="label">Twitter</span></a>
								</li>
								<li>
									<a class="icon rounded fa-google-plus"><span class="label">Google+</span></a>
								</li>
								<li>
									<a class="icon rounded fa-linkedin"><span class="label">LinkedIn</span></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer>

	</body>
</html>
