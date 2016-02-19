<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Applicant Tracking System</title>
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
	<body class="landing">

		<!-- Header -->
			<header id="header">
				<h1><a href="index.html">ATS LOGO</a></h1>
				<nav id="nav">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li><a href="#" class="button special">Sign Up</a></li>
					</ul>
				</nav>
			</header>

		<!-- Banner -->
			<section id="banner">
				<h2>Applicant Tracking System.</h2>
				<p>A new and effective way to track.</p>
				<ul class="actions">
					<li>
						<a href="#" class="button big">Take a free tour</a>
					</li>
				</ul>
			</section>

		<!-- One -->
			<section id="one" class="wrapper style1 special">
				<div class="container">
					<header class="major">
						<h2>Currently Supported Features</h2>
						<p>Job posting, Download/Upload resume, Visual management</p>
					</header>
					<div class="row 150%">
						<div class="4u 12u$(medium)">
							<section class="box">
								<a href="${pageContext.request.contextPath}/jobpost"><i class="icon big rounded color1 fa-cloud"></i></a>
								<h3>Job Posting</h3>
								<p>Post jobs, link them with competency and track them in an easy manner.</p>
							</section>
						</div>
						<div class="4u 12u$(medium)">
							<section class="box">
								<a href="${pageContext.request.contextPath}/resume"><i class="icon big rounded color9 fa-desktop"></i></a>
								<h3>Upload resume</h3>
								<p>Download and upload candidate resume, also link them with job post.</p>
							</section>
						</div>
						<div class="4u 12u$(medium)">
							<section class="box">
								<a href="${pageContext.request.contextPath}/interview"><i class="icon big rounded color6 fa-rocket"></i></a>
								<h3>Schedule an interview</h3>
								<p>Search candidate resume and schedule an interview.</p>
							</section>
						</div>
						<div class="4u$ 12u$(medium)">
							<section class="box">
								<a href="${pageContext.request.contextPath}/visuallymanage"><i class="icon big rounded color6 fa-rocket"></i></a>
								<h3>Visual management</h3>
								<p>Visually manage job posting under newly "created| undergoing| closed" categories.</p>
							</section>
						</div>
					</div>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style2 special">
				<div class="container">
					<header class="major">
						<h2>Meet with the team</h2>
						<p>Super energetic and enthusiastic.</p>
					</header>
					<section class="profiles">
						<div class="row">
							<section class="3u 6u$(medium) 12u$(xsmall) profile">
								<img src="${pageContext.request.contextPath}/resources/core/images/profile_placeholder.gif" alt="" />
								<h4>Alpha</h4>
								<p>Role</p>
							</section>
							<section class="3u 6u(medium) 12u$(xsmall) profile">
								<img src="${pageContext.request.contextPath}/resources/core/images/profile_placeholder.gif" alt="" />
								<h4>Beta</h4>
								<p>Role</p>
							</section>
							<section class="3u$ 6u$(medium) 12u$(xsmall) profile">
								<img src="${pageContext.request.contextPath}/resources/core/images/profile_placeholder.gif" alt="" />
								<h4>Gama</h4>
								<p>Role</p>
							</section>
							
						</div>
					</section>
					<footer>
						<p></p>
						<ul class="actions">
							<li>
								<a href="#" class="button big">View Profile</a>
							</li>
						</ul>
					</footer>
				</div>
			</section>

		<!-- Three -->
			<section id="three" class="wrapper style3 special">
				<div class="container">
					<header class="major">
						<h2>For Queries</h2>
						<p>For particular queries, please send us the message</p>
					</header>
				</div>
				<div class="container 50%">
					<form action="#" method="post">
						<div class="row uniform">
							<div class="6u 12u$(small)">
								<input name="name" id="name" value="" placeholder="Name" type="text">
							</div>
							<div class="6u$ 12u$(small)">
								<input name="email" id="email" value="" placeholder="Email" type="email">
							</div>
							<div class="12u$">
								<textarea name="message" id="message" placeholder="Message" rows="6"></textarea>
							</div>
							<div class="12u$">
								<ul class="actions">
									<li><input value="Send Message" class="special big" type="submit"></li>
								</ul>
							</div>
						</div>
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
								<li>&copy; ATS. All rights reserved.</li>
								
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
