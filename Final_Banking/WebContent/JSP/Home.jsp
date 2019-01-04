<%@page import="javax.swing.text.DocumentFilter"%>
<%@page import="javax.print.Doc"%>
<%@page import="com.tcs.ilp.bean.Customer"%>
<%@page import="java.sql.*"%>
<%@page import="com.tcs.ilp.util.DatabaseUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Customer</title>
<script type="text/javascript" src="../JS/state.js"></script>
<script src="../JS/CreateCustomer.js">
	
</script>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" />
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>


<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css" />
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<style>
.nav>li>a:hover {
	color: black !important;
}

a.dropdown-toggle:hover {
	color: black !important;
}

a.dropdown-toggle:visited {
	color: white !important;
}
</style>
</head>

<%
	response.setHeader("Cache-Control",
			"no-cache, no-store, must-revalidate"); //prevent back button feature

	response.setHeader("Pragma", "no-cache");

	response.setHeader("Expires", "0");
%>
<body style="margin: 0px; padding: 0px;" ng-app="cityApp"
	ng-controller="statecityController">
	<center>
		<div class="container-fluid">
			<%@include file="Header.jsp"%>
			<div class="row" style="margin-bottom: 330px; padding-bottom: 30px;">
				<%
					String user = (String) session.getAttribute("usertype");
					String userid = (String) session.getAttribute("userid");
					if (usertype.equalsIgnoreCase("S")) {
				%>
				<div class="container-fluid">
					<div class="row">
						<h3>
							Welcome
							<%=userid%></h3>
					</div>
				</div>
				<%
					} else {
				%>
				<div class="container-fluid">
					<div class="row">
						<h3>
							Welcome
							<%=userid%></h3>
					</div>
				</div>

				<%
					}
				%>
			</div>
			<%@include file="Footer.jsp"%>


		</div>
	</center>


</body>

</html>