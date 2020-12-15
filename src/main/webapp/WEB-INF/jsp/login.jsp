<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="Vardhaman Fashion Point Kirshna Ji Enterprise " />
    <meta name="author" content="Bhupender Kumar" />
	
	
	<link rel="shortcut icon" href="kj.ico" type="image/x-icon">
   
    <title>::INVENTORY MANAGEMENT::</title>
		
<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" media="all">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" media="all">
<script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet" media="all">

</head>

<body>
<div class="login-page">
 
  <div class="form">
	 <p style="color:#358826; font-size:2em; margin-top:-40px; font-family:Bradley Hand ITC;">INVENTORY MANAGEMENT</p>
   
    <form id="loginForm" name='loginForm' action="<c:url value='/login' />"
								method="post">
     <input type="text" placeholder="Username" name="username"/>
      <input type="password" placeholder="Password" name="password"/>
      <input class="btn btn-success"	type="submit" value="Login"
										style=" width: 40%; padding-left: 20px;">
      
      <input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
    </form>
    <c:if test="${!empty error}">
    	<div class="alert alert-danger">${error}</div>
    </c:if>
    <c:if test="${!empty msg}">
    	<div class="alert alert-success">${msg}</div>
    </c:if>
  </div>
  
</div>
  

</body>
</html>