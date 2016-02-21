<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Applicant Tracking System</title>

    <spring:url value="/resources/core/js/jquery.min.js" var="jqueryJs" />
    <spring:url value="/resources/core/js/index.js" var="indexJs" />
    
    <script src="${jqueryJs}"></script>
    <script src="${indexJs}"></script>
    
    <spring:url value="/resources/core/css/normalize_login.css" var="normalize"/>
    <spring:url value="/resources/core/css/style_login.css" var="style"/>
    
    <link href="${normalize}" rel="stylesheet" />
    <link href="${style}" rel="stylesheet" />
    
    
  </head>

  <body>

    <div class="login">
  <header class="header">

    <span class="text">LOGIN</span>
    <span class="loader"></span>
  </header>
  <form:form action="home" method="post" class="form">
    <input class="input" type="text", placeholder="Username">
    <input class="input" type="password" placeholder="Password">
    <button class="btn" type="submit"></button>
  </form:form>
</div>
</button>
   

    
    
    
  </body>
</html>
