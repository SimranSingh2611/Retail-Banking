<%@page import="com.tcs.ilp.bean.Account"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Account Details</title>
<script type="text/javascript">
	function Deposit() {
		window.location = '../JSP/Deposit.jsp';
	}
	function Withdraw() {
		window.location = '../JSP/Withdraw.jsp';
	}
	function Transfer() {
		window.location = '../JSP/Transfer.jsp';
	}
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<style>
.nav>li>a:hover {
	color: black !important;
}

a.dropdown-toggle:hover {
	color: black !important;
}

input: focus {
	background: #C4E1FF;
}
</style>
</head>
<body>
	<center>
		<div class="container-fluid">
			<%@include file="Header.jsp"%>
			<h3>Account details</h3>
			<div class="row" style="margin-top: 20px; margin-bottom: 20px;">
				<table class="table table-striped" style="width: 500px;height:400px;">
					<%
						Account a = (Account) request.getSession().getAttribute("aDetails");
						if (a.getAccountId() == 0) {
							out.print("<script>alert('does not exist');window.location = 'AccountDetails.jsp';</script>");

						} else {
							out.print("<tr><td>Account ID</td><td>" + a.getAccountId()
									+ "</td></tr>");
							out.print("<tr><td>Customer ID</td><td>" + a.getCustomerID()
									+ "</td></tr>");
							out.print("<tr><td>Account Type</td><td>"
									+ (a.getAccountType() == "C" ? "Current" : "Savings")
									+ "</td></tr>");
							out.print("<tr><td>Balance</td><td>" + a.getBalance()
									+ "</td></tr>");
							out.print("<tr><td>Create Date</td><td>" + a.getCreateDate()
									+ "</td></tr>");
							out.print("<tr><td>Last Updated</td><td>"
									+ a.getLastTransDate() + "</td></tr>");
							out.print("<tr><td>Duration</td><td>" + a.getDuration()
									+ "</td></tr>");

						}
					%>


				</table>
				<div class="form-group">
					<div class="col-md-4"></div>
					<div class="col-md-1">
						<button type="button" class="btn btn-primary" onclick="Deposit();">Deposit</button>
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-primary"
							onclick="Withdraw();">WithDraw</button>
					</div>
					<div class="col-md-1">
						<button type="button" class="btn btn-primary"
							onclick="Transfer();">Transfer</button>
							
					</div>

				</div>
			</div>
		</div>
	</center>

</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<%@include file="Footer.jsp"%>
</html>