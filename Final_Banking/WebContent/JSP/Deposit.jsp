<%@page import="com.tcs.ilp.bean.Account"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deposit</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<style>
.nav>li>a:hover {l
	color: black !important;
}

a.dropdown-toggle:hover {
	color: black !important;
}
</style>
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
</head>

<body>
<center>
	<div class="container-fluid">
		<%@include file="Header.jsp"%>
		<div class="row" style="margin-bottom: 30px">
			<div class="col-md-6 col-md-offset-3" style="margin-top: 50px;">
				<form class="well form-horizontal" id="Deposit" action="../Deposit" method="post">
					<h3>Deposit</h3>
					<br>
					<%
						Account a = (Account) request.getSession().getAttribute("aDetails");
						if (a.getAccountId() == 0) {
							out.print("<script>alert('does not exist');window.location = 'AccountDetails.jsp';</script>");

						} else {
							out.print("<div class=\"form-group\"><label class=\"control-label col-md-4\">"
									+ "Account ID</label><div class=\"col-md-7\"><input type=\"text\" class=\"form-control\" disabled "
									+ "value=\"" + a.getAccountId() + "\"></div> </div>");
							out.print("<div class=\"form-group\"><label class=\"control-label col-md-4\">"
									+ "Customer ID</label><div class=\"col-md-7\"><input type=\"text\" class=\"form-control\" disabled "
									+ "value=\"" + a.getCustomerID() + "\"></div> </div>");
							out.print("<div class=\"form-group\"><label class=\"control-label col-md-4\">"
									+ "Account Type</label><div class=\"col-md-7\"><input type=\"text\" class=\"form-control\" disabled "
									+ "value=\""
									+ (a.getAccountType() == "C" ? "Current" : "Savings")
									+ "\"></div> </div>");
							out.print("<div class=\"form-group\"><label class=\"control-label col-md-4\">"
									+ "Balance</label><div class=\"col-md-7\"><input type=\"text\" class=\"form-control\" disabled "
									+ "value=\"" + a.getBalance() + "\"></div> </div>");

						}
					%>
					<div class="form-group">
						<label class="control-label col-md-4">Deposit Amount</label>
						<div class="col-md-7">
							<input type="number" class="form-control" id="depositamount" name="depositamount">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-4"></div>
						<div class="col-md-2">
							<button type="submit" class="btn btn-primary">Deposit</button>
						</div>
						<div class="col-md-1">
							<button type="reset" class="btn btn-danger">Reset</button>
						</div>
					</div>


				</form>
			</div>
		</div>
	</div>
</center>
</body>

<%@include file="Footer.jsp"%>

<script src="../JS/Deposit.js">
</script>
</html>