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
			
		$.ajax({url: "${pageContext.request.contextPath}/rest/getalljobsresumes/", async: false, success: function(result){
			 $('#jobrequest').html(result);
		}});

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
						<h2>Visual Management</h2>
						<p>Change status of jobs/resumes.</p>
					</header>

					<!-- Text -->
						<section>
							<h3>Manage both jobs and resume </h3>
							<p>Move <b>both jobs and resume</b> between <strong>different categories</strong>. Status will automatically get reflected in the backend.
							<hr />

							<header>
								
						</section>



					<!-- Table -->
						<section>
							<h3>Jobs</h3>
							<div class="table-wrapper" id="jobrequest">
								<table>
									<thead>
										<tr>
											<th>Job Name</th>
											<th>Description</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Job 1</td>
											<td>Ante turpis integer aliquet porttitor.</td>
											<td>29.99</td>
										</tr>
										<tr>
											<td>Job 2</td>
											<td>Vis ac commodo adipiscing arcu aliquet.</td>
											<td>19.99</td>
										</tr>
										<tr>
											<td>Job 3</td>
											<td> Morbi faucibus arcu accumsan lorem.</td>
											<td>29.99</td>
										</tr>
										<tr>
											<td>Job 4</td>
											<td>Vitae integer tempus condimentum.</td>
											<td>19.99</td>
										</tr>
										<tr>
											<td>Job 5</td>
											<td>Ante turpis integer aliquet porttitor.</td>
											<td>29.99</td>
										</tr>
									</tbody>
									
								</table>
							</div>
							<hr />
							<h3>Resume</h3>
							<div class="table-wrapper" id="resumerequest">
								<table class="alt">
									<thead>
										<tr>
											<th>Job Name</th>
											<th>Description</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>resume 1</td>
											<td>Ante turpis integer aliquet porttitor.</td>
											<td>29.99</td>
										</tr>
										<tr>
											<td>resume 2</td>
											<td>Vis ac commodo adipiscing arcu aliquet.</td>
											<td>19.99</td>
										</tr>
										<tr>
											<td>resume 3</td>
											<td> Morbi faucibus arcu accumsan lorem.</td>
											<td>29.99</td>
										</tr>
										<tr>
											<td>resume 4</td>
											<td>Vitae integer tempus condimentum.</td>
											<td>19.99</td>
										</tr>
										<tr>
											<td>resume 5</td>
											<td>Ante turpis integer aliquet porttitor.</td>
											<td>29.99</td>
										</tr>
									</tbody>
									
								</table>
							</div>
						</section>

					<!-- Buttons -->
						
					<!-- Form -->
						<section>
							<h3>Action</h3>
							<form method="post" action="#">
								<div class="row uniform 50%">
									<div class="6u 12u$(4)">
										<input type="text" name="name" id="name" value="" placeholder="Type Resume/Job" />
									</div>
									<div class="6u$ 12u$(4)">

										<div class="select-wrapper">
											<select name="category" id="category">
												<option value="">- Old Status -</option>
												<option value="1">Newly Added</option>
												<option value="1">In Progress</option>
												<option value="1">Completed</option>
											</select>
										</div>
									</div>
									<div class="12u$">
										<div class="select-wrapper">
											<select name="category" id="category">
												<option value="">- New Status -</option>
												<option value="1">Newly Added</option>
												<option value="1">In Progress</option>
												<option value="1">Completed</option>
											</select>
										</div>
									</div>
									
									<div class="12u$">
										<textarea name="message" id="message" placeholder="Put your comment" rows="6"></textarea>
									</div>
									<div class="12u$">
										<ul class="actions">
											<li><input type="submit" value="Move" class="special" /></li>
											<li><input type="reset" value="Reset" /></li>
										</ul>
									</div>
								</div>
							</form>
						</section>

					<!-- Image -->
						<section>
							

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
