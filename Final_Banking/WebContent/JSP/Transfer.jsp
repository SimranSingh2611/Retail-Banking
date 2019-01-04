<%@page import="java.sql.ResultSet"%>
<%@page import="com.tcs.ilp.bean.Account"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transfer</title>
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
<%
	ResultSet rs = (ResultSet) request.getAttribute("rs");
	ResultSet rst = (ResultSet) request.getAttribute("rst");
	Account a = (Account) request.getSession().getAttribute("aDetails");
%>
<body>
	<center>
		<div class="container-fluid">
			<%@include file="Header.jsp"%>
			<div class="row" style="margin-bottom: 100px">
				<div class="col-md-6 col-md-offset-3" style="margin-top: 50px;">
					<form class="well form-horizontal"
						action="<%=request.getContextPath()%>/Transfer?action=first"
						method="post" name="form1">


						<h3>Transfer</h3>
						<br>
						<%
							String status = (String) request.getAttribute("errorMessage");
						System.out.println(status);
						%>
						<%
							if (status != null) {
						%>
						<div class="alert alert-info">
							<p><%=status%></p>
						</div>
						<%
							}
						%>

						<%
							if (request.getParameter("accID") != null) {
								int accID = Integer.parseInt(request.getParameter("accID"));
						%>
						<div class="form-group">
							<label class="control-label col-md-4">Current Account
								Number</label>
							<div class="col-md-7">
								<input type="number" class="form-control" name="current_acc_no"
									value="<%=accID%>" readonly>
							</div>
						</div>
						<%
							}

							else {
						%>

						<div class="form-group">
							<label class="control-label col-md-4">Current Account
								Number</label>
							<div class="col-md-7">
								<input type="number" class="form-control" name="current_acc_no"
									value="<%=a.getAccountId()%>" readonly>
							</div>
						</div>

						<%
							}
						%>
						<div class="form-group">
							<label class="control-label col-md-4">Enter Target
								Account Number</label>
							<div class="col-md-7">
								<input type="number" class="form-control"
									placeholder="enter target account number" name="target_acc_no">
							</div>
						</div>

						<div class="form-group">
							<div class="col-md-4"></div>
							<div class="col-md-2">
								<button type="submit" class="btn btn-primary">Transfer</button>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<%@include file="Footer.jsp"%>
</html>