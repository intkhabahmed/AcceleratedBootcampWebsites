<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Quickgun Headley</title>
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
				<img src="images/banner1.png" alt="">
			</div>
			<div class="item">
				<img src="images/banner2.png" alt="">
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <!-- <span class="icon-prev"  id="left-control-button" aria-hidden="true"></span> -->
			<span id="left-indicator"><img src="images/leftarrow.png"
				aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <!-- <span class="icon-next" id="right-control-button" aria-hidden="true"></span> -->
			<span id="right-indicator"><img src="images/rightarrow.png"
				aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>
	<!--end carousel-->

	<!-- </div> -->
	<div class="container">
		<hr>
		<div class="row" id="shortcut_links">
			<div class="col-sm-4 ">
				<div class="img-container">
					<a href="data/sampleProposal.pdf" target="_blank"><img
						src="images/download.png" alt="Download Problem"
						class="img img-responsive"></a>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="img-container">
					<a href="#"><img src="images/upload.png" alt="Upload proposal"
						class="img img-responsive" id="uploadForm_shortcut"></a>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="img-container">
					<a href="#contactus"><img src="images/contact.png"
						alt="ContactUs" class="img img-responsive"></a>
				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div id="aboutus">
				<h2 align="center">About Us</h2>
				<p align="center">QuickGun Headley (QH) is a leading global
					financial services firm providing investment banking, securities,
					wealth management and investment management services. We are
					headquartered at 1349 Murugan Street in Mexico City. With offices
					in more than 42 countries and more than 25,000 employees, our
					clients include corporations, governments, institutions and
					individuals.</p>
			</div>
			<!--end aboutus-->
		</div>
		<hr>
		<div class="row" id="client_info">
			<div class="col-sm-4 ">
				<div class="img-container">
					<img src="images/download.png" alt="Download Problem"
						class="img img-responsive">
				</div>
				<div class="client_desc">
					<h3>Client Name</h3>
					<h4>Designation</h4>
					<p>Beneesfradia is one of many financial services consortiums
						around the world who are tasked with introducing solutions,
						platforms and products to fast track UFA2020. Beneesfradia is
						looking at addressing the underserved populations.</p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="img-container">
					<img src="images/upload.png" alt="Upload proposal"
						class="img img-responsive" >
				</div>
				<div class="client_desc">
					<h3>Client Name</h3>
					<h4>Designation</h4>
					<p>Beneesfradia is one of many financial services consortiums
						around the world who are tasked with introducing solutions,
						platforms and products to fast track UFA2020. Beneesfradia is
						looking at addressing the underserved populations.</p>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="img-container">
					<img src="images/contact.png"
						alt="ContactUs" class="img img-responsive">
				</div>
				<div class="client_desc">
					<h3>Client Name</h3>
					<h4>Designation</h4>
					<p>Beneesfradia is one of many financial services consortiums
						around the world who are tasked with introducing solutions,
						platforms and products to fast track UFA2020. Beneesfradia is
						looking at addressing the underserved populations.</p>
				</div>
			</div>
		</div>
		<hr>
	</div>
	<!--end container-->
	<div id="contactus">
		<c:if test="${sessionScope.user.username eq 'quickgunheadley'}">
			<div class="contactus_body">
				<h2 align="center">Message</h2>
				<br>
				<form method="post" action="sendMessage.html" class="form-vertical"
					id="contact_form">
					<div class="col-sm-12">
						<div class="col-sm-4 col-sm-offset-4">
							<div class="form-group contact-form-fields">
								<select name="teamName" class="form-control" required="required">
									<option value="">--Select--</option>
									<option value="benefitscards">Benefits Cards</option>
									<option value="borasys">Bora-Sys</option>
									<option value="financialexpert">Financial Expert Ltd</option>
									<option value="silvertax">Silvertax</option>
									<option value="unipro">Uni-pro</option>
								</select>
								<textarea cols="40" rows="5" placeholder="Message"
									class="form-control" id="feedback" required="required"
									name="message"></textarea>
								<input type="submit" value="Submit" id="sendMail_btn"
									class="btn btn-info form-control">
							</div>
						</div>
					</div>
				</form>
			</div>
			<!--end contactus-->
		</c:if>
		<div id="footer">
			<br>
			<footer>
				<p align="center">&copy; Quickgun Headley 2018, All Rights
					Reserved</p>
			</footer>
		</div>
	</div>
	<!--end row-->
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

	<div id="uploadWindow">
		<h2 align="center">Upload Proposal</h2>
		<form class="form-vertical" method="post" action="#" id="upload_form"
			enctype="multipart/form-data">
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
		<%-- 	<div class="alert alert-danger" role="alert">"${errorMessage}"</div> --%>
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