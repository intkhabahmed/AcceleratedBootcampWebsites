<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="navbar navbar-custom navbar-custom-fitting">
	  <div class="container">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="index.html"><img src="images/logo.png" alt="BeneesFradia"></a>
	    </div>

	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav navbar-right" id="main-nav">
	        <li class="active"><a href="#home">Home <span class="sr-only">(current)</span></a></li>
	        <li><a href="#aboutus">About Us</a></li>
	        <c:if test="${sessionScope.user.username ne 'beneesfradia'}">
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Proposals <span class="fa fa-angle-down"></span></a>
	          <ul class="dropdown-menu">
	          	
	            	<li id="uploadForm"><a href="#">Upload</a></li>
	            
	            <li><a href="data/sampleProposal.pdf" target="_blank">Download Problem Statement</a></li>
	          </ul>
	         </li>
	         </c:if>
	        <c:if test="${sessionScope.user.username eq 'beneesfradia'}">
	        	<li><a href="#contactus">Message</a></li>
	        </c:if>
	        <c:if test="${sessionScope.user.username eq null}">
	        <li id="login_button" onclick="showLoginPage()"><img src="images/loginbtn.png" class="img img-responsive"/></li>    
	      	</c:if>
	      	<c:if test="${sessionScope.user.username ne null}">
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.user.teamName } <span class="fa fa-angle-down"></span></a>
	          <ul class="dropdown-menu">
	            <c:if test="${sessionScope.user.username eq 'beneesfradia'}">
	            	<li><a href="showProfile.html">Dashboard</a></li>
	            </c:if>
	            <li><a href="logout.html">Logout</a></li>
	          </ul>
	        </li>
	        </c:if>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>