<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Applicant Tracking system</title>
    
    
        <spring:url value="/resources/core/css/jquery-ui.css" var="uiCss"/>
    <spring:url value="/resources/core/css/bootstrap.min.css"  var = "bootCss"/>
    <spring:url value="/resources/core/css/font-awesome.min.css" var = "fontCss"/>
    <spring:url value="/resources/core/css/prettyPhoto.css" var = "prettyCss"/>
    <spring:url value="/resources/core/css/main.css" var="mainCss"/>
    
    <spring:url value="/resources/core/css/style_popup.css" var="popupCss"/>
    <spring:url value="/resources/core/css/demostyle.css" var="demostyleCss"/>
    
    <spring:url value="/resources/core/css/proto-dialog.css" var="protoCss"/>
    
    <link href="${uiCss}" rel="stylesheet" />
    
    
    <link href="${bootCss}" rel="stylesheet" />
    <link href="${fontCss}" rel="stylesheet" />
<link href="${prettyCss}" rel="stylesheet" />
<link href="${mainCss}" rel="stylesheet" />
<link href="${popupCss}" rel="stylesheet" />
<link href="${demostyleCss}" rel="stylesheet" />
<link href="${protoCss}" rel="stylesheet" />

    
    <spring:url value="/resources/core/images/ico/favicon.ico"  var = "fav"/>
    <spring:url value="/resources/core/images/ico/apple-touch-icon-144-precomposed.png"  var = "apple"/>
    <spring:url value="/resources/core/images/ico/apple-touch-icon-114-precomposed.png"  var = "touch"/>
    <spring:url value="/resources/core/images/ico/apple-touch-icon-72-precomposed.png"  var = "again"/>
    <spring:url value="/resources/core/images/ico/apple-touch-icon-57-precomposed.png"  var = "next"/>
    
    <link href="${fav}" rel="shortcut icon" />
    <link href="${apple}" rel="apple-touch-icon-precomposed" />
    <link href="${touch}" rel="apple-touch-icon-precomposed" />
    <link href="${again}" rel="apple-touch-icon-precomposed" />
    <link href="${next}" rel="apple-touch-icon-precomposed" />
    
    <spring:url value="/resources/core/js/jquery.js" var="jqueryJs" />
<spring:url value="/resources/core/js/bootstrap.min.js" var="bootstrapJs" />

<spring:url value="/resources/core/js/jquery.isotope.min.js" var="isotopeJs" />
<spring:url value="/resources/core/js/jquery.prettyPhoto.js" var="prettyJs" />

<spring:url value="/resources/core/js/main.js" var="mainJs" />
<spring:url value="/resources/core/js/jquery-1.9.1.js" var="jqJs" />

<spring:url value="/resources/core/js/jquery-ui.js" var="uiJs" />

<spring:url value="/resources/core/js/jquery.proto-dialog.js" var="protoJs" />

<script src="${jqueryJs}"></script>
<script src="${bootstrapJs}"></script>

<script src="${isotopeJs}"></script>
<script src="${prettyJs}"></script>

<script src="${mainJs}"></script>
<script src="${jqJs}"></script>
<script src="${uiJs}"></script>
<script src="${protoJs}"></script>
    
    
        <script type='text/javascript'>

$(document).ready(function() {
	
	$(function() {
	    $( "#datepicker" ).datepicker();
	  });

    $('[data-popup-target]').click(function () {
        $('html').addClass('overlay');
        var activePopup = $(this).attr('data-popup-target');
        $(activePopup).addClass('visible');

    });

    $(document).keyup(function (e) {
        if (e.keyCode == 27 && $('html').hasClass('overlay')) {
            clearPopup();
        }
    });

    $('.popup-exit').click(function () {
        clearPopup();

    });

    $('.popup-overlay').click(function () {
        clearPopup();
    });

    function clearPopup() {
        $('.popup.visible').addClass('transitioning').removeClass('visible');
        $('html').removeClass('overlay');

        setTimeout(function () {
            $('.popup').removeClass('transitioning');
        }, 200);
    }
    
    
    
    $('#proto-dialog').protoDialog({
        'actions': {
            
        },
        onInit: function($dialog) {
            //alert('Dialog Initialized');
        },
        onOpen: function($dialog) {
            //alert('Dialog is about to be opened');
        },
        onOpened: function($dialog) {
            //alert('Dialog is opened');
        },
        onClose: function($dialog) {
            //alert('Dialog is about to be closed');
        },
        onClosed: function($dialog) {
            //alert('Dialog is closed');
        },
        onResize: function($dialog) {
            //alert('Dialog is resizing');
        }
    
    });
    
    $('#open-dialog').click(function () {
    	
        $('#proto-dialog').protoDialog('open');
    });

});
  

</script>
    
    
</head>

<body data-spy="scroll" data-target="#navbar" data-offset="0">
    <header id="header" role="banner">
        <div class="container">
            <div id="navbar" class="navbar navbar-default">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#main-slider"><i class="icon-home"></i></a></li>
                        <li><a href="#services">Services</a></li>
                        <li><a href="#portfolio">Portfolio</a></li>
                        <li><a href="#pricing">Pricing</a></li>
                        <li><a href="#about-us">About Us</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header><!--/#header-->
    
    

    <section id="main-slider" class="carousel">
        <div class="carousel-inner">
            <div class="item active">
                <div class="container">
                    <div class="carousel-content">
                        <h1>Applicant Tracking System</h1>
                        <p class="lead">ATS is the best applicant tracking system<br>Effective way to track applicant</p>
                    </div>
                </div>
            </div><!--/.item-->
            <div class="item">
                <div class="container">
                    <div class="carousel-content">
                        <h1>Applicant Tracking System</h1>
                        <p class="lead">Lots of feature apart from simple tracking <br>Real time processing.</p>
                    </div>
                </div>
            </div><!--/.item-->
        </div><!--/.carousel-inner-->
        <a class="prev" href="#main-slider" data-slide="prev"><i class="icon-angle-left"></i></a>
        <a class="next" href="#main-slider" data-slide="next"><i class="icon-angle-right"></i></a>
    </section><!--/#main-slider-->

    <section id="services">
        <div class="container">
            <div class="box first">
                <div class="row">
                    <div class="col-md-4 col-sm-6">
                        <div class="center">
                            <i class="icon-apple icon-md icon-color1"  data-popup-target="#example-popup"></i>
                            <h4>Post Job </h4>
                            <p>Post jobs/management.</p>
                        </div>
                    </div><!--/.col-md-4-->
                    <div class="col-md-4 col-sm-6">
                        <div class="center">
                            <i class="icon-android icon-md icon-color2" id="open-dialog"></i>
                            <h4>HR management/connect with candidates</h4>
                            <p>Connect with candidated and check their current status.</p>
                        </div>
                    </div><!--/.col-md-4-->
                    <div class="col-md-4 col-sm-6">
                        <div class="center">
                            <i class="icon-windows icon-md icon-color3"></i>
                            <h4>Video interviews</h4>
                            <p>Schedule online interviews.</p>
                        </div>
                    </div><!--/.col-md-4-->
                    <div class="col-md-4 col-sm-6">
                        <div class="center">
                            <i class="icon-html5 icon-md icon-color4"></i>
                            <h4>For Future</h4>
                            <p>For Future.</p>
                        </div>
                    </div><!--/.col-md-4-->
                    <div class="col-md-4 col-sm-6">
                        <div class="center">
                            <i class="icon-css3 icon-md icon-color5"></i>
                            <h4>For Future</h4>
                            <p>For Future.</p>
                        </div>
                    </div><!--/.col-md-4-->
                    <div class="col-md-4 col-sm-6">
                        <div class="center">
                            <i class="icon-thumbs-up icon-md icon-color6"></i>
                            <h4>For Future</h4>
                            <p>For Future.</p>
                        </div>
                    </div><!--/.col-md-4-->
                </div><!--/.row-->
            </div><!--/.box-->
        </div><!--/.container-->
    </section><!--/#services-->

    <section id="portfolio">
        <div class="container">
            <div class="box">
                <div class="center gap">
                    <h2>Get Started</h2>
                    <p class="lead"></p>
                </div><!--/.center-->
                <ul class="portfolio-filter">
                    <li><a class="btn btn-primary active" href="#" data-filter="*">Start your free trial</a></li>
                    <li><a class="btn btn-primary" href="#" data-filter=".bootstrap">Go PRO</a></li>
                </ul><!--/#portfolio-filter-->
                <ul class="portfolio-items col-4">
                    <li class="portfolio-item apps">
                        <div class="item-inner">
                            <div class="portfolio-image">
                                <img src="${pageContext.request.contextPath}/resources/core/images/portfolio/thumb/item1.jpg" alt=""/>
                                <div class="overlay">
                                    <a class="preview btn btn-danger" title="Lorem ipsum dolor sit amet" href="${pageContext.request.contextPath}/resources/core/images/portfolio/full/item1.jpg"><i class="icon-eye-open"></i></a>             
                                </div>
                            </div>
                            <h5>Lorem ipsum dolor sit amet</h5>
                        </div>
                    </li><!--/.portfolio-item-->
                    <li class="portfolio-item joomla bootstrap">
                        <div class="item-inner">
                            <div class="portfolio-image">
                                <img src="${pageContext.request.contextPath}/resources/core/images/portfolio/thumb/item2.jpg" alt=""/>
                                <div class="overlay">
                                    <a class="preview btn btn-danger" title="Lorem ipsum dolor sit amet" href="${pageContext.request.contextPath}/resources/core/images/portfolio/full/item2.jpg"><i class="icon-eye-open"></i></a>  
                                </div>
                            </div> 
                            <h5>Lorem ipsum dolor sit amet</h5>         
                        </div>
                    </li><!--/.portfolio-item-->
                    <li class="portfolio-item bootstrap wordpress">
                        <div class="item-inner">
                            <div class="portfolio-image">
                                <img src="${pageContext.request.contextPath}/resources/core/images/portfolio/thumb/item3.jpg" alt=""/>
                                <div class="overlay">
                                    <a class="preview btn btn-danger" title="Lorem ipsum dolor sit amet" href="${pageContext.request.contextPath}/resources/core/images/portfolio/full/item3.jpg"><i class="icon-eye-open"></i></a>        
                                </div> 
                            </div>
                            <h5>Lorem ipsum dolor sit amet</h5>          
                        </div>           
                    </li><!--/.portfolio-item-->
                    <li class="portfolio-item joomla wordpress apps">
                        <div class="item-inner">
                            <div class="portfolio-image">
                                <img src="${pageContext.request.contextPath}/resources/core/images/portfolio/thumb/item4.jpg" alt=""/>
                                <div class="overlay">
                                    <a class="preview btn btn-danger" title="Lorem ipsum dolor sit amet" href="${pageContext.request.contextPath}/resources/core/images/portfolio/full/item4.jpg"><i class="icon-eye-open"></i></a>          
                                </div>   
                            </div>
                            <h5>Lorem ipsum dolor sit amet</h5>        
                        </div>           
                    </li><!--/.portfolio-item-->
                    <li class="portfolio-item joomla html">
                        <div class="item-inner">
                            <div class="portfolio-image">
                                <img src="${pageContext.request.contextPath}/resources/core/images/portfolio/thumb/item5.jpg" alt=""/>
                                <div class="overlay">
                                    <a class="preview btn btn-danger" title="Lorem ipsum dolor sit amet" href="images/portfolio/full/item5.jpg"><i class="icon-eye-open"></i></a>          
                                </div>  
                            </div>
                            <h5>Lorem ipsum dolor sit amet</h5>  
                        </div>       
                    </li><!--/.portfolio-item-->
                    <li class="portfolio-item wordpress html">
                        <div class="item-inner">
                            <div class="portfolio-image">
                                <img src="${pageContext.request.contextPath}/resources/core/images/portfolio/thumb/item6.jpg" alt=""/>
                                <div class="overlay">
                                    <a class="preview btn btn-danger" title="Lorem ipsum dolor sit amet" href="images/portfolio/full/item6.jpg"><i class="icon-eye-open"></i></a>           
                                </div>  
                            </div>
                            <h5>Lorem ipsum dolor sit amet</h5>         
                        </div>           
                    </li><!--/.portfolio-item-->
                    <li class="portfolio-item joomla html">
                        <div class="item-inner">
                            <div class="portfolio-image">
                                <img src="${pageContext.request.contextPath}/resources/core/images/portfolio/thumb/item5.jpg" alt=""/>
                                <div class="overlay">
                                    <a class="preview btn btn-danger" title="Lorem ipsum dolor sit amet" href="images/portfolio/full/item5.jpg"><i class="icon-eye-open"></i></a>          
                                </div>  
                            </div>
                            <h5>Lorem ipsum dolor sit amet</h5>  
                        </div>       
                    </li><!--/.portfolio-item-->
                    <li class="portfolio-item wordpress html">
                        <div class="item-inner">
                            <div class="portfolio-image">
                                <img src="${pageContext.request.contextPath}/resources/core/images/portfolio/thumb/item6.jpg" alt=""/>
                                <div class="overlay">
                                    <a class="preview btn btn-danger" title="Lorem ipsum dolor sit amet" href="images/portfolio/full/item6.jpg"><i class="icon-eye-open"></i></a>           
                                </div>   
                            </div>
                            <h5>Lorem ipsum dolor sit amet</h5>        
                        </div>         
                    </li><!--/.portfolio-item-->
                </ul>   
            </div><!--/.box-->
        </div><!--/.container-->
    </section><!--/#portfolio-->

    <section id="pricing">
        <div class="container">
            <div class="box">
                <div class="center">
                    <h2>See our Pricings</h2>
                    <p class="lead">Pellentesque habitant morbi tristique senectus et netus et <br>malesuada fames ac turpis egestas.</p>
                </div><!--/.center-->   
                <div class="big-gap"></div>
                <div id="pricing-table" class="row">
                    <div class="col-sm-4">
                        <ul class="plan">
                            <li class="plan-name">Basic</li>
                            <li class="plan-price">$29</li>
                            <li class="plan-action"><a href="#" class="btn btn-primary btn-lg">Signup</a></li>
                        </ul>
                    </div><!--/.col-sm-4-->
                    <div class="col-sm-4">
                        <ul class="plan featured">
                            <li class="plan-name">Standard</li>
                            <li class="plan-price">$49</li>
                            <li class="plan-action"><a href="#" class="btn btn-primary btn-lg">Signup</a></li>
                        </ul>
                    </div><!--/.col-sm-4-->
                    <div class="col-sm-4">
                        <ul class="plan">
                            <li class="plan-name">Advanced</li>
                            <li class="plan-price">$199</li>
                            <li class="plan-action"><a href="#" class="btn btn-primary btn-lg">Signup</a></li>
                        </ul>
                    </div><!--/.col-sm-4-->
                </div> 
            </div> 
        </div>
    </section><!--/#pricing-->

    <section id="about-us">
        <div class="container">
            <div class="box">
                <div class="center">
                    <h2>Meet the Team</h2>
                    <p class="lead">Super energetic and enthusiastic</p>
                </div>
                <div class="gap"></div>
                <div id="team-scroller" class="carousel scale">
                    <div class="carousel-inner">
                        <div class="item active">
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="member">
<!--                                         <p><img class="img-responsive img-thumbnail img-circle" src="images/team1.jpg" alt="" ></p> -->
                                        <h3>Agnes Smith<small class="designation">CEO &amp; Founder</small></h3>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="member">
<!--                                         <p><img class="img-responsive img-thumbnail img-circle" src="images/team2.jpg" alt="" ></p> -->
                                        <h3>Donald Ford<small class="designation">Senior Vice President</small></h3>
                                    </div>
                                </div>        
                                <div class="col-sm-4">
                                    <div class="member">
<!--                                         <p><img class="img-responsive img-thumbnail img-circle" src="images/team3.jpg" alt="" ></p> -->
                                        <h3>Karen Richardson<small class="designation">Assitant Vice President</small></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="member">
<!--                                         <p><img class="img-responsive img-thumbnail img-circle" src="images/team3.jpg" alt="" ></p> -->
                                        <h3>David Robbins<small class="designation">Co-Founder</small></h3>
                                    </div>
                                </div>   
                                <div class="col-sm-4">
                                    <div class="member">
<!--                                         <p><img class="img-responsive img-thumbnail img-circle" src="images/team1.jpg" alt="" ></p> -->
                                        <h3>Philip Mejia<small class="designation">Marketing Manager</small></h3>
                                    </div>
                                </div>     
                                <div class="col-sm-4">
                                    <div class="member">
<!--                                         <p><img class="img-responsive img-thumbnail img-circle" src="images/team2.jpg" alt="" ></p> -->
                                        <h3>Charles Erickson<small class="designation">Support Manager</small></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="left-arrow" href="#team-scroller" data-slide="prev">
                        <i class="icon-angle-left icon-4x"></i>
                    </a>
                    <a class="right-arrow" href="#team-scroller" data-slide="next">
                        <i class="icon-angle-right icon-4x"></i>
                    </a>
                </div><!--/.carousel-->
            </div><!--/.box-->
        </div><!--/.container-->
    </section><!--/#about-us-->

    <section id="contact">
        <div class="container">
            <div class="box last">
            
            
                                                  
            
            
            
                <div class="row">
                    <div class="col-sm-6">
                    
                  
                    
                    
                    
                    
                    
                        <h1>Contact Form</h1>
                        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
                        <div class="status alert alert-success" style="display: none"></div>
                        <form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="sendemail.php" role="form">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" required="required" placeholder="Name">
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input type="text" class="form-control" required="required" placeholder="Email address">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="form-group">
                                        <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Message"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-danger btn-lg">Send Message</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div><!--/.col-sm-6-->
                    <div class="col-sm-6">
                        <h1>Our Address</h1>
                        <div class="row">
                            <div class="col-md-6">
                                <address>
                                    <strong>Twitter, Inc.</strong><br>
                                    795 Folsom Ave, Suite 600<br>
                                    San Francisco, CA 94107<br>
                                    <abbr title="Phone">P:</abbr> (123) 456-7890
                                </address>
                            </div>
                            <div class="col-md-6">
                                <address>
                                    <strong>Twitter, Inc.</strong><br>
                                    795 Folsom Ave, Suite 600<br>
                                    San Francisco, CA 94107<br>
                                    <abbr title="Phone">P:</abbr> (123) 456-7890
                                </address>
                            </div>
                        </div>
                        <h1>Connect with us</h1>
                        <div class="row">
                            <div class="col-md-6">
                                <ul class="social">
                                    <li><a href="#"><i class="icon-facebook icon-social"></i> Facebook</a></li>
                                    <li><a href="#"><i class="icon-google-plus icon-social"></i> Google Plus</a></li>
                                    <li><a href="#"><i class="icon-pinterest icon-social"></i> Pinterest</a></li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <ul class="social">
                                    <li><a href="#"><i class="icon-linkedin icon-social"></i> Linkedin</a></li>
                                    <li><a href="#"><i class="icon-twitter icon-social"></i> Twitter</a></li>
                                    <li><a href="#"><i class="icon-youtube icon-social"></i> Youtube</a></li>
                                </ul>
                                
                                
                 
                                
                            </div>
                        </div>
                    </div><!--/.col-sm-6-->
                </div><!--/.row-->
            </div><!--/.box-->
        </div><!--/.container-->
    </section><!--/#contact-->






    <footer id="footer">
 


 <form:form action="getApplicants" method="post" commandName="applicantDto">
 
 <div id="proto-dialog">
            <div id="proto-dialog-header">Header</div>
            <div id="proto-dialog-content">Content</div>
            <div id="proto-dialog-footer">Footer</div>
        <!-- ... -->
        </div>
 
 
<div id="example-popup" class="popup">
    <div class="popup-body">	<span class="popup-exit"></span>

        <div class="popup-content">
        
            	<h2 class="popup-title">Job Post</h2>

            <p>Job Post name   <form:input path="jobName"/></p></br>
            <p>Key skills  <form:input path="keySkills"/></p></br>
            <p>No. of open positions  <form:input path="openPos"/></p></br>
            <p>Planned End Date  <form:input path="endDate" id="datepicker"/></p></br>
    <input type="submit" value="Post" />        
        </div>
    </div>
</div>
    
    
    
    User Name:
    <form:input path="name"/>
    <input type="submit" value="Register" />
    
    <c:forEach var="app" items="${list}">
    <a href="${pageContext.request.contextPath}/hello/${app.name}"><c:out value="${app.name}"></c:out></a></br>
    </c:forEach>
    
    
    Searhed Name is : <c:out value="${projectName}"></c:out>
    </form:form>
    
 
            
                        
     </footer><!--/#footer-->




  

</body>
</html>
