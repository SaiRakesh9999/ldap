<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="author" content="Bhupender Kumar" />

        <title>::INVENTORY MANAGEMENT::</title>
    
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME ICONS  -->
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
    <!-- CHOSEN STYLE -->
     <link href="${pageContext.request.contextPath}/css/chosen.min.css" rel="stylesheet" />
     
     <!-- DATE PICKER CSS -->
     <link href="${pageContext.request.contextPath}/css/bootstrap-datepicker3.min.css" rel="stylesheet" />
     <style type="text/css">
     .nav>li:hover,  .nav>li:focus,.dropdown-toggle:hover, .dropdown-toggle:focus, .dropdown-menu>ul>li:hover{
  		  background-color: #cbe078!important;
	 }
     </style>
    
</head>
<body>
  
    <div class="navbar navbar-inverse set-radius-zero">
        <div class="container">
				
           <div class="navbar-header col-md-9">
                
                <a class="navbar-brand" href="#">
                    Inventory Managemennt
                </a>

            </div>
			<div class="right-div col-md-3">
				<div class="user-settings-wrapper">
                    <ul class="nav">			
						<li class="dropdown">
												
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
								
                                <span class="glyphicon glyphicon-user" style="font-size: 25px;"></span>
                            </a>
                            <div class="dropdown-menu dropdown-settings">
                               
                                <a href="${pageContext.request.contextPath}/login?logout" class="btn btn-danger btn-sm">
                                <img src="${pageContext.request.contextPath}/images/logout.png">Logout</a>

                            </div>
                        </li>


                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- LOGO HEADER END-->

		
	<!-- MENU SECTION START-->
	<section class="menu-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="navbar-collapse collapse ">
                        <ul id="menu-top" class="nav navbar-nav navbar-right">
                            <li><a href="${pageContext.request.contextPath}/admin"> <i class="fa fa-dashboard"></i> Dashboard</a></li>
                            <li><a href="${pageContext.request.contextPath}/inventory/inventorylist"><i class="fa fa-shopping-cart"></i> Inventory</a></li>
                          	<c:if test="${userDetails.roleId.roleName eq 'ADMIN'}">
                            <li>
                            	<div class="dropdown" style="line-height: 38px; cursor: pointer; padding-left: 5px; padding-right: 5px;">
								    <div class="dropdown-toggle" data-toggle="dropdown" style="background: #3d3d3d;color: white;">
								     <i class="fa fa-cogs"></i> MASTER <i class="fa fa-chevron-down"></i>
								    </div>
								    <div class="dropdown-menu" style="background: #3d3d3d;">
								      <ul style="list-style: none; text-align: left; margin-left: -40px;">
								      	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/master/systems">System </a></li>
								      	<li><a class="dropdown-item" href="${pageContext.request.contextPath}/master/subsystems">Sub System </a></li>
								      </ul>
								    </div>
  								</div>
                            </li>
							<li><a href="${pageContext.request.contextPath}/user/usermanagement"><i class="fa fa-users"></i> USER</a></li>
							</c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- MENU SECTION END-->