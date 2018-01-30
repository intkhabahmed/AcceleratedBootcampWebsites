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
	      <a class="navbar-brand" href="index.html"><img src="images/BC_logo.png" alt="Benefits Cards"></a>
	    </div>

	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav navbar-right" id="main-nav">
	        <li class="active"><a href="#home">Home <span class="sr-only">(current)</span></a></li>
	        <li><a href="#aboutus">AboutUs</a></li>
	        <c:if test="${sessionScope.user.username eq null}">
	        <li id="login_button" onclick="showLoginPage()"><img src="images/loginbtn.png" class="img img-responsive"/></li>    
	      	</c:if>
	      	<c:if test="${sessionScope.user.username ne null}">
	      	<li id="raiseQuery_btn"><a href="#">Support</a></li>
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.user.username } <span class="fa fa-angle-down"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="showProfile.html">View Profile</a></li>
	            <li><a href="logout.html">Logout</a></li>
	          </ul>
	        </li>
	        </c:if>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>