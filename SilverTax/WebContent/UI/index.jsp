<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Silver Tax</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/custom.css">
<link
	href='https://fonts.googleapis.com/css?family=Open Sans Condensed:300'
	rel='stylesheet'>
</head>
<body id="home">

	<jsp:include page="header.jsp"></jsp:include>


	<!-- <div class="row"> -->
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<img src="images/downarrow.png" alt="DownArrow" id="downarrow" />
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="images/banner.png" alt="">
			</div>
		</div>

	</div>
	<!--end carousel-->

	<!-- </div> -->
	<div class="container">
		<hr>
		<div class="row">
			<div id="aboutus">
				<h2 align="center">About Us</h2>
				<p align="center">Silvertax is an American multinational
					conglomerate corporation incorporated in New York and headquartered
					in Boston, Massachusetts.</p>
				<p align="center">As of 2016, the company operates through the
					following segments: Aviation, Current, Digital, Energy Connections,
					Global Research, Healthcare, Lighting, Oil and Gas, Power,
					Renewable Energy, Transportation, and Capital which cater to the
					needs of Financial services, Medical devices, Life Sciences,
					Pharmaceutical, Automotive, Software Development and Engineering
					industries.</p>
			</div>
			<!--end aboutus-->
		</div>
		<hr>
	</div>
	<!--end container-->
	<div id="footer">
		<footer>
			<p align="center">&copy; Silver Tax 2018, All Rights Reserved</p>
		</footer>
	</div>
	<div class="overlay" title="click to close"></div>
	<div id="loginWindow">
		<h2 align="center">Login Form</h2>
		<form class="form-vertical" method="post" action="login.html"
			id="login_form">
			<div class="form-group">
				<input type="text" name="username" required="required"
					class="form-control" placeholder="Enter UserName" /> <input
					type="password" name="password" required="required"
					class="form-control" placeholder="Enter Password" />

			</div>
			<div class="form-group">
				<h4 id="forgotPass">
					<a href="#" class="pull-left">Forgot Password?</a>
				</h4>
				<input type="submit" name="login_btn" id="login_btn" value="Login"
					class="pull-right btn btn-default" />
			</div>
		</form>
	</div>
	<div id="queryWindow">
		<h2 align="center">Query Form</h2>
		<form class="form-vertical" method="post" action="askQuery.html"
			id="query_form">
			<div class="form-group">
				<label class="form-label" for="receiver">Choose Company</label> <br>
				<input type="radio" name="receiver" required="required"
					value="BeneesFradia" /> BeneesFradia &nbsp;&nbsp; <input
					type="radio" name="receiver" value="QuickgunHeadley" />
				QuickgunHeadley <br>
			</div>
			<div class="form-group">
				<textarea rows="4" class="form-control"
					placeholder="Enter the query" name="query"></textarea>
				<input type="submit" name="querySubmit_btn" id="querySubmit_btn"
					value="Send" class="form-control btn btn-default" />
			</div>
		</form>
	</div>
	
	<div id="uploadWindow">
		<h2 align="center">Upload Proposal</h2>
		<form class="form-vertical" method="post" action="#" id="upload_form"
			enctype="multipart/form-data">
			<div class="form-group">
				<label class="form-label" for="receiver">Choose Company</label> <br>
				<input type="radio" name="receiver" required="required"
					value="BeneesFradia" /> BeneesFradia &nbsp;&nbsp; <input
					type="radio" name="receiver" value="QuickgunHeadley" />
				QuickgunHeadley <br>
			</div>
			<div class="form-group">
				<input type="file" name="propsalFile" id="fileInput"
					required="required" class="pull-left" /> <input type="submit"
					name="propsalSubmit_btn" value="Upload"
					class="btn btn-default pull-right" id="proposalSubmit_btn" />
			</div>
		</form>
	</div>

	<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/custom.js"></script>
	<c:if test="${errorMessage ne null}">
		<%-- 	<div class="alert alert-danger" role="alert" >"${errorMessage}"</div> --%>
		<script>
			alert("${errorMessage}");
			showLoginPage();
		</script>
	</c:if>
	<c:if test="${successMessage ne null}">
		<%-- 	<div class="alert alert-success" role="alert">"${successMessage}"</div> --%>
		<script>
			alert("${successMessage}");
		</script>
	</c:if>
</body>
</html>