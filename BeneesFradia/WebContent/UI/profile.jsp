<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MyProfile</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/custom.css">
	<link href='https://fonts.googleapis.com/css?family=Open Sans Condensed:300' rel='stylesheet'>
</head>
<body>
	<div id="profile_logo_container">
		<div class="container">
			<div class="col-sm-6">
				<a id="profileLogo" href="index.html"><img src="images/logo.png" alt="BeneesFradia"></a>
			</div>
			<div class="col-sm-6">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.html" ><i class="fa fa-arrow-left"></i> Home</a></li>
					<li><a href="logout.html" ><i class="fa fa-user"></i> Logout</a></li>
				</ul>
			</div>
		</div>
	</div>

<div class="container">
	<div class="row" id="QuerySection">
		<h2 align="center">User Queries</h2>
		<hr>
		<c:if test="${queries ne null}">
			<table class="table table-bordered">
			<tr>
				<th>Sender Name</th>
				<th>Query</th>
				<th>Query Date</th>
				<th>Answer</th>
				<th>Action</th>
			</tr>
			
			<c:forEach items="${queries}" var="q">
				<tr>
					<td>${q.sender}</td>
					<td>${q.query}</td>
					<td>${q.queryDate}</td>
					<td>
					<c:if test="${q.reply eq null }">
						<form action="replyQuery.html" method="post" id="queryReply_form">
							<div class="form-group">
								<input type="hidden" name="queryId" value="${q.queryId}" />
								<textarea class="form-control" rows="5" placeholder="Enter the answer here" name="reply"></textarea>
								<input type="submit" id="querySubmit_btn" class="form-control btn btn-info" />
							</div>
						</form>
					</c:if>
					<c:if test="${q.reply ne ''}">
						<span>${q.reply}</span>
					</c:if>
					</td>
					<td><button id="deletequery_btn" class="btn btn-info delete_btn">Delete</button></td>
				</tr>
				<div id="confirmQueryWindow">
					<h3>Are you sure want to delete this query?</h3>
					<div class="center">
						<a href="deleteQuery.html?queryId=${q.queryId}" id="deleteQuery_btn" class="btn btn-default">Delete</a>&nbsp;&nbsp;&nbsp;
						<button class="btn btn-default cancel_btn">Cancel</button>
					</div>
				</div>
			</c:forEach>			
		</table>
		</c:if>
		<c:if test="${queries eq null}">
			<h3 class="text-center">Currently No Queries!!</h3>
		</c:if>
	</div>
	<hr>
	<div class="row" id="ProposalSection">
		<h2 class="text-center">User Proposals</h2>
		<hr>
		<c:if test="${proposals ne null}">
		<table class="table table-bordered">
			<tr>
				<th>Submitted By</th>
				<th>Proposal File Name</th>
				<th>Proposal Date</th>
				<th>Action</th>
			</tr>
			<c:forEach items="${proposals}" var="proposal">
				<tr>
					<td>${proposal.teamName}</td>
					<td>${proposal.fileName}</td>
					<td>${proposal.proposalDate}</td>
					<td><a href="downloadProposal.html?proposalId=${proposal.proposalId}" target="_blank" 
					class="btn btn-info">Download</a></td>
				</tr>
			</c:forEach>
		</table>
		</c:if>
		<c:if test="${proposals eq null}">
			<h3 class="text-center">Currently No Proposals!!</h3>
		</c:if>
	</div>
	<hr>
	<div class="row" id="MessageSection">
		<h2 class="text-center">Messages</h2>
		<hr>
		<c:if test="${messages ne null}">
		<table class="table table-bordered">
			<tr>
				<th>Sent to</th>
				<th>Sent on</th>
				<th>Message</th>
				<th>Action</th>
			</tr>
			<c:forEach items="${messages}" var="message">
				<tr>
					<td>${message.receiver}</td>
					<td>${message.messageDate}</td>
					<td>${message.message}</td>
					<td><button id="deleteMessage_btn" class="btn btn-info delete_btn">Delete</button></td>
				</tr>
				<div id="confirmMessageWindow">
					<h3>Are you sure want to delete this message?</h3>
					<div class="center">
						<a href="deleteMessage.html?messageId=${message.messageId}" id="deleteQuery_btn" class="btn btn-default">Delete</a>&nbsp;&nbsp;&nbsp;
						<button class="btn btn-default cancel_btn">Cancel</button>
					</div>
				</div>
			</c:forEach>
		</table>
		</c:if>
		<c:if test="${messages eq null}">
			<h3 class="text-center">Currently No Messages!!</h3>
		</c:if>
	</div>
</div>
<div class="overlay" title="Click to close"></div>

<c:if test="${successMessage ne null}">
<%-- 	<div class="alert alert-success" role="alert">"${successMessage}"</div> --%>
	<script>
		alert("${successMessage}");
		window.location = "showProfile.html";
	</script>
</c:if>
<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/custom.js"></script>
</body>
</html>