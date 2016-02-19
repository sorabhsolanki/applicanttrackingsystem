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
                   <strong>${message}</strong>
					<header class="major">
						<h2>Calendar Invite</h2>
						<p>Send calendar invitation to the candidate.</p>
					</header>

					
				<form:form action="calendarinvite" method="POST" commandName="interviewInviteDto">	
					<p><b>Email of candidate:</b>
					<form:input path="to"/>
					<p><ul class="actions">
					<li><b>Email from:</b><form:input path="from"/></li>
					<li><b>UserName:</b><form:input path="userName"/></li>
					<li><b>Password:</b><form:password path="password" /></li>
					<li><b>Type of invitation</b>
					  <div class="select-wrapper">
						<form:select name="type" path="option">
    						<form:options items="${options}" />
						</form:select>
				       </div>
				    </li>
					</ul></p>
		            <p><ul class="actions">
											<li><input type="submit" value="Send Invite"></li>
											<li><input type="button" value="Back"></li>
										</ul></p>
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
