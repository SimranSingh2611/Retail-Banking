<%@page import="java.sql.ResultSet"%>
<%@page import="com.tcs.ilp.bean.Account"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transfer Money</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
</head>
<%
	ResultSet rs = (ResultSet) request.getAttribute("rs");
	rs.next();
	ResultSet rst = (ResultSet) request.getAttribute("rst");
	rst.next();
	//int current_acc_no =  Integer.parseInt((String)request.getAttribute("current_acc_no"));

	Account a = (Account) request.getSession().getAttribute("aDetails");
%>
<body>
	<center>
		<div class="container-fluid">
			<%@include file="Header.jsp"%>
			<div class="row" style="margin-bottom: 100px">
				<div class="col-md-6 col-md-offset-3" style="margin-top: 50px;">

					<form class="well form-horizontal"
						action="<%=request.getContextPath()%>/Transfer?action=second"
						method="post">
						<h3>Enter Amount</h3>
						<br>
						<div class="form-group">
							<label class="control-label col-md-5"> Current Account
								Number</label>
							<div class="col-md-6">
								<input type="number" class="form-control" name="current_acc_no"
									value="<%=a.getAccountId()%>" readonly>
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-md-5">Target Account
								Number</label>
							<div class="col-md-6">
								<input type="number" class="form-control" placeholder="enter target account number"
									name="target_acc_no" value="<%=rs.getInt(2)%>" readonly>
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-md-5">Target Account
								Holder Name</label>
							<div class="col-md-6">
								<input type="text" class="form-control" name="target_acc_name"
									value="<%=rst.getString(1)%>" readonly>
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-md-5">Enter Amount to Pay</label>
							<div class="col-md-6">
								<input type="number" class="form-control" placeholder="enter amount " name="money">
							</div>
						</div>


						<div class="form-group">
							<div class="col-md-4"></div>
							<div class="col-md-3">
								<button type="submit" class="btn btn-primary">Proceed to Pay</button>
							</div>
							<div class="col-md-1">
								<button type="reset" class="btn btn-danger">Reset</button>
							</div>
						</div>

						
					</form>
				</div>
			</div>
			<%@include file="Footer.jsp"%>
		</div>
	</center>
</body>


</body>
</html>