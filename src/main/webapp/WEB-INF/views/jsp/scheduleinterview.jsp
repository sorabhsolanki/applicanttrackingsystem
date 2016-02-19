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
		 
		 <script src="${jqueryJs}"></script>
		 <script src="${skelJs}"></script>
		 <script src="${skelLayerJs}"></script>
		 <script src="${initJs}"></script>		
		
		<spring:url value="/resources/core/css/skel.css" var="skelCss"/>
		<spring:url value="/resources/core/css/style.css" var="styleCss"/>
		<spring:url value="/resources/core/css/style-xlarge.css" var="xlargeCss"/>
		
		<link href="${skelCss}" rel="stylesheet" />
		<link href="${styleCss}" rel="stylesheet" />
		<link href="${xlargeCss}" rel="stylesheet" />
		
		<script type='text/javascript'>

$(document).ready(function() {
	
	$("#schedule").click(function(){
		$("#myForm").attr("action", "${pageContext.request.contextPath}/scheduleInterview");
		$("#myForm").attr("method", "POST");
	    $("#myForm").submit();
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
						<li><a href="${pageContext.request.contextPath}">Back</a></li>
					</ul>
				</nav>
			</header>

		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="container">

					<header class="major">
						<h2>Schedule Interview/Search Resume</h2>
						<p>Search resume with candidate name and candidate email and schedule interview.</p>
					</header>

					
				<form:form action="searchResume" method="POST" commandName="candidateDto" enctype="multipart/form-data" id="myForm">	
					<p><b>Name of candidate:</b>
					<form:input path="candidatename"/>
					<p><b>Email Id:</b>
		            <form:input path="candidateEmail"/></p>
					<p><input type="submit" value="Search Resume" class="button big"></p>
					<c:if test='${not empty searchResume}'>
					<h3>Candidate Resume</h3>
					<div class="table-wrapper" id="participantInfo">
						<table>
							<thead>
								<tr>
									<th>Candidate Name</th>
									<th>Resume</th>
									<th>Schedule Interview</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${searchResume}</td>
									<td><a href="${pageContext.request.contextPath}/getFileByName/${candidateName}">  Download  </a></td>
									<td><input type="button" value="Schedule An Interview" id="schedule"/></td>
								</tr><
							</tbody>

						</table>
					</div>
					</c:if>
					
                </form:form>
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
